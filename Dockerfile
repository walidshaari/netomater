From        alpine
MAINTAINER  Walid Shaari <walid.shaari@linux.com>

ENV  WORKDIR    /opt/ansible/home
ENV  ANSIBLECFG ${WORKDIR}/ansible.cfg
ENV  MODULES    ${WORKDIR}/modules

# use --no-cache and try to clean up later
# libxsltd-dev and libxml2-dev system dependencie for markup , while openssl-dev and libffi-dev for cffi
# had issue if cffi install is with other packages, breaking them to 3 lines for now, later will optimize

RUN  apk add --update  python python2-dev py-pip build-base openssl-dev libffi-dev libxml2-dev libxslt-dev
RUN  pip  install --trusted-host pypi.python.org --upgrade pip
RUN  pip  install --trusted-host pypi.python.org cffi
RUN  pip  install --trusted-host pypi.python.org netmiko napalm pyntc six requests dnspython pyntc ansible netmiko napalm pyntc ciscoconfparse
RUN  pip  install --trusted-host ansible-lint ansible-inventory-grapher 



