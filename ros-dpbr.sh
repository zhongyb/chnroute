#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=China_IP address=$net comment=AS4809"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
