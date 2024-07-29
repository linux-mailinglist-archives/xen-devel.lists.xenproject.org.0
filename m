Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDD94009D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 23:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767159.1177746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYG1-00087D-6k; Mon, 29 Jul 2024 21:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767159.1177746; Mon, 29 Jul 2024 21:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYG1-000856-47; Mon, 29 Jul 2024 21:50:17 +0000
Received: by outflank-mailman (input) for mailman id 767159;
 Mon, 29 Jul 2024 21:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYYFz-000850-OB
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 21:50:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887169bd-4df4-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 23:50:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCE3361009;
 Mon, 29 Jul 2024 21:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0874BC32786;
 Mon, 29 Jul 2024 21:50:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 887169bd-4df4-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722289811;
	bh=aE+bxWX8sqTq7QJHNJbrYD7BMyBHaNC3wB7fSrxTgCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Adukp7esVzPotAOAEMdbjgtuISv3GktaxjgDpEUVW1qOwk0NEMPGEN9CWIYoF+4OD
	 ydCVid0kYjB+UUC6QcFz2fFNEo5M1VrZAV+1b5jrqVizgWwXiRlBHJy4JmRAxqmAb7
	 p2RFBsbktdSMt6LT20yAt9l9cG7KUKqa0Hflgr8XTmyQNFI1ZBI3ldDVjuZUQN1Kg2
	 /JuTw7CjwDtUy1i/u+5zz7ii5RJRscadf+ri+85YVOZhLilVrxyPstKRTbGsrOpkmO
	 lyfzJx2rRFtQrf/g9CU2njmNRGglW1BAaLJJBWjh6g/oBAiBK5HCRrRUu6gPbc5bih
	 EMWXjpxf3dbFQ==
Date: Mon, 29 Jul 2024 14:50:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: add x86_64 xilinx smoke test
In-Reply-To: <9c065e301bf1f00c218def202f4685b83083e1a1.1722044804.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407291449170.4857@ubuntu-linux-20-04-desktop>
References: <9c065e301bf1f00c218def202f4685b83083e1a1.1722044804.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jul 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Add a test script and related job for running x86_64 dom0 tests.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Looks great!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> ---
>  automation/gitlab-ci/test.yaml                |  24 +++
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 144 ++++++++++++++++++
>  2 files changed, 168 insertions(+)
>  create mode 100755 automation/scripts/xilinx-smoke-dom0-x86_64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d89e41f244..4e74946419 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -96,6 +96,22 @@
>    tags:
>      - xilinx
> 
> +.xilinx-x86_64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: ubuntu:xenial-xilinx
> +    LOGFILE: xilinx-smoke-x86_64.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  only:
> +    variables:
> +      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  tags:
> +    - xilinx
> +
>  .adl-x86-64:
>    extends: .test-jobs-common
>    variables:
> @@ -159,6 +175,14 @@ xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64
> 
> +xilinx-smoke-dom0-x86_64-gcc-debug:
> +  extends: .xilinx-x86_64
> +  script:
> +    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh ping 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> new file mode 100755
> index 0000000000..e6e6fac6a5
> --- /dev/null
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -0,0 +1,144 @@
> +#!/bin/sh
> +
> +# Run x86_64 dom0 tests on hardware.
> +
> +set -ex
> +
> +fatal() {
> +    echo "$(basename "$0") $*" >&2
> +    exit 1
> +}
> +
> +# Test parameter defaults.
> +TEST="$1"
> +PASS_MSG="Test passed: ${TEST}"
> +XEN_CMD_CONSOLE="console=com1 com1=115200,8n1,0x3F8,4"
> +XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
> +XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
> +XEN_CMD_EXTRA=""
> +DOM0_CMD=""
> +DOMU_CMD=""
> +DOMU_CFG='
> +type = "pvh"
> +name = "domU"
> +kernel = "/boot/vmlinuz"
> +ramdisk = "/boot/initrd-domU"
> +extra = "root=/dev/ram0 console=hvc0"
> +memory = 512
> +vif = [ "bridge=xenbr0", ]
> +disk = [ ]
> +'
> +TIMEOUT_SECONDS=120
> +
> +# Select test variant.
> +if [ "${TEST}" = "ping" ]; then
> +    DOMU_MSG="domU online"
> +    DOMU_CMD="
> +ifconfig eth0 192.168.0.2
> +until ping -c 10 192.168.0.1; do
> +    sleep 1
> +done
> +echo \"${DOMU_MSG}\"
> +"
> +    DOM0_CMD="
> +set +x
> +until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
> +    sleep 1
> +done
> +set -x
> +echo \"${PASS_MSG}\"
> +"
> +else
> +    fatal "Unknown test: ${TEST}"
> +fi
> +
> +# Set up domU rootfs.
> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +echo "#!/bin/sh
> +
> +${DOMU_CMD}
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +sed -i -e 's/^Welcome/domU \0/' etc/issue
> +find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +cd ..
> +rm -rf rootfs
> +
> +# Set up dom0 rootfs.
> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir boot
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../binaries/dist/install/* .
> +echo "#!/bin/bash
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +bash /etc/init.d/xencommons start
> +
> +brctl addbr xenbr0
> +brctl addif xenbr0 eth0
> +ifconfig eth0 up
> +ifconfig xenbr0 up
> +ifconfig xenbr0 192.168.0.1
> +
> +# get domU console content into test log
> +tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> +xl create /etc/xen/domU.cfg
> +${DOM0_CMD}
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "${DOMU_CFG}" > etc/xen/domU.cfg
> +echo "rc_verbose=yes" >> etc/rc.conf
> +echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
> +echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
> +mkdir -p var/log/xen/console
> +cp ../binaries/bzImage boot/vmlinuz
> +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +cd ..
> +
> +# Load software into TFTP server directory.
> +TFTP="/scratch/gitlab-runner/tftp"
> +XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
> +cp -f binaries/xen ${TFTP}/pxelinux.cfg/xen
> +cp -f binaries/bzImage ${TFTP}/pxelinux.cfg/vmlinuz
> +cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/pxelinux.cfg/initrd-dom0
> +echo "
> +net_default_server=10.0.6.1
> +multiboot2 (tftp)/pxelinux.cfg/xen ${XEN_CMDLINE}
> +module2 (tftp)/pxelinux.cfg/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
> +module2 (tftp)/pxelinux.cfg/initrd-dom0
> +boot
> +" > ${TFTP}/pxelinux.cfg/grub.cfg
> +
> +# Power cycle board and collect serial port output.
> +SERIAL_CMD="cat /dev/ttyUSB9 | tee smoke.serial | sed 's/\r//'"
> +sh /scratch/gitlab-runner/v2000a.sh 2
> +sleep 5
> +sh /scratch/gitlab-runner/v2000a.sh 1
> +sleep 5
> +set +e
> +stty -F /dev/ttyUSB9 115200
> +timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
> +sh /scratch/gitlab-runner/v2000a.sh 2
> +
> +set -e
> +
> +if grep -q "${PASS_MSG}" smoke.serial; then
> +    exit 0
> +fi
> +
> +fatal "Test failed"
> --
> 2.25.1
> 

