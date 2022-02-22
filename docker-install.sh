#!/usr/bin/env bash

# Nmap

apt install nmap xsltproc -y
nmap --script-updatedb

# Masscan

cd /tmp
wget https://github.com/robertdavidgraham/masscan/archive/refs/heads/master.zip -O masscan-master.zip
cd masscan-master
make
make install
cd && rm -rf /tmp/masscan-master*

# RustScan

cd /tmp

wget https://api.github.com/repos/RustScan/RustScan/releases/latest -qO- \
| grep "browser_download_url.*amd64.deb" \
| cut -d: -f2,3 \
| tr -d \" \
| wget -qO rustscan.deb -i-

dpkg -i rustscan.deb
cd && rm /tmp/rustscan.deb

wget https://gist.github.com/snovvcrash/8b85b900bd928493cd1ae33b2df318d8/raw/fe8628396616c4bf7a3e25f2c9d1acc2f36af0c0/rustscan-ports-top1000.toml -O /root/.rustscan.toml

# Naabu

mkdir /opt/projectdiscovery
cd /opt/projectdiscovery

wget https://api.github.com/repos/projectdiscovery/naabu/releases/latest -qO- \
| grep "browser_download_url.*linux_amd64.zip" \
| cut -d: -f2,3 \
| tr -d \" \
| wget -qO naabu.zip -i-

unzip naabu.zip
chmod +x naabu
rm naabu.zip
ln -s /opt/projectdiscovery/naabu /usr/local/bin/naabu

# NimScan

mkdir /opt/nimscan
cd /opt/nimscan

wget https://api.github.com/repos/elddy/NimScan/releases/latest -qO- \
| grep 'browser_download_url.*NimScan"' \
| cut -d: -f2,3 \
| tr -d \" \
| wget -qO nimscan -i-

chmod +x nimscan
ln -s /opt/nimscan/nimscan /usr/local/bin/nimscan

# DivideAndScan

cd /app
pip3 install .
