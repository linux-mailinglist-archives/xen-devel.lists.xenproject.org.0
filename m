Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE376CB2D0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 02:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515493.798430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxH7-00054J-2t; Tue, 28 Mar 2023 00:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515493.798430; Tue, 28 Mar 2023 00:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxH6-00051e-Vs; Tue, 28 Mar 2023 00:33:20 +0000
Received: by outflank-mailman (input) for mailman id 515493;
 Tue, 28 Mar 2023 00:33:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pgxH5-0004wX-75
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 00:33:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2040026f-cd00-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 02:33:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20B41B819ED;
 Tue, 28 Mar 2023 00:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D435C433D2;
 Tue, 28 Mar 2023 00:33:12 +0000 (UTC)
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
X-Inumbo-ID: 2040026f-cd00-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679963592;
	bh=opwjYMsdzJrfCxAV1946I525eYfji2K0ASbYsJ5T2hA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jrY3K9R6GaouRI2hN3U+j5klydxRFvQO4KKyRknluhmRxGJooZLTfpNo3XOfCAQD4
	 GLTIt+iTvqTqagt8fPzGn/WFOl7Kf0YiB1DNmosdSPVJ9WfM/zdaxqlz0fpdgZU5Fk
	 YjircnnJ4ijcMe21UuKLfpjknRqRR89hUScb4ouIbH34JMeRVJFQwuDqkkFWQhRCxW
	 3cxuHHA17ZSvv/SoGB4KyA+EgZBFdcki2UrLGjOf1YKjp6NCqMKhVrTbK33cvGatU/
	 23oTdbU6jUAL3GgsXI61PbLdJRrxqTVNWB19NVps7+WRD5lHjc+5pVwZDeI6wxICEw
	 pNwOWitRahHbQ==
Date: Mon, 27 Mar 2023 17:33:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] automation: add a smoke and suspend test on an
 Alder Lake system
In-Reply-To: <6997fb7c3a40da23683bb0ca1961de40376e71a8.1679778534.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2303271733030.4066@ubuntu-linux-20-04-desktop>
References: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com> <6997fb7c3a40da23683bb0ca1961de40376e71a8.1679778534.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-924388815-1679963592=:4066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-924388815-1679963592=:4066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 25 Mar 2023, Marek Marczykowski-Górecki wrote:
> This is a first test using Qubes OS CI infra. The gitlab-runner has
> access to ssh-based control interface (control@thor.testnet, ssh key
> exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
> files (mapped under /scratch/gitlab-runner/tftp inside the container).
> Details about the setup are described on
> https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/
> 
> There are two test. First is a simple dom0+domU boot smoke test, similar
> to other existing tests. The second is one boots Xen, and try if S3
> works. It runs on a ADL-based desktop system. The test script is based
> on the Xilinx one.
> 
> The machine needs newer kernel than other x86 tests run, so use 6.1.x
> kernel added in previous commit.
> 
> The usage of fakeroot is necessary to preserve device nodes (/dev/null
> etc) when repacking rootfs. The test runs in a rootless podman
> container, which doesn't have full root permissions. BTW the same
> applies to docker with user namespaces enabled (but it's only opt-in
> feature there).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2:
>  - install test deps in dockerfile
>  - rename test script
>  - add smoke test too (reusing the same script with different argument)
>  - use CONTROLLER variable for ssh target
>  - explain fakeroot usage
>  - replace final "sleep 30" with polling + timeout
> ---
>  automation/build/alpine/3.12-arm64v8.dockerfile |   3 +-
>  automation/gitlab-ci/test.yaml                  |  33 +++-
>  automation/scripts/qubes-x86-64.sh              | 174 +++++++++++++++++-
>  3 files changed, 210 insertions(+)
>  create mode 100755 automation/scripts/qubes-x86-64.sh
> 
> diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
> index 180c978964aa..3f1e6a3fc6df 100644
> --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> @@ -41,3 +41,6 @@ RUN apk --no-cache add \
>    libattr \
>    libcap-ng-dev \
>    pixman-dev \
> +  # qubes test deps
> +  openssh-client \
> +  fakeroot \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index ee9e3210772b..0916b367ea90 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -88,6 +88,23 @@
>    tags:
>      - xilinx
>  
> +.adl-x86-64:
> +  extends: .test-jobs-common
> +  variables:
> +    # the test controller runs on RPi4
> +    CONTAINER: alpine:3.12-arm64v8
> +    LOGFILE: smoke-test.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  only:
> +    variables:
> +      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  tags:
> +    - qubes-hw2
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -114,6 +131,22 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> +adl-smoke-x86-64-gcc:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc
> +
> +adl-suspend-x86-64-gcc:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> new file mode 100755
> index 000000000000..2d4cf2e2268c
> --- /dev/null
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -0,0 +1,174 @@
> +#!/bin/sh
> +
> +set -ex
> +
> +test_variant=$1
> +
> +wait_and_wakeup=
> +timeout=120
> +if [ -z "${test_variant}" ]; then
> +    passed="ping test passed"
> +    domU_check="
> +ifconfig eth0 192.168.0.2
> +until ping -c 10 192.168.0.1; do
> +    sleep 1
> +done
> +echo \"${passed}\"
> +"
> +    dom0_check="
> +until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
> +    sleep 1
> +done
> +# get domU console content into test log
> +tail -n 100 /var/log/xen/console/guest-domU.log
> +echo \"${passed}\"
> +"
> +elif [ "${test_variant}" = "s3" ]; then
> +    passed="suspend test passed"
> +    wait_and_wakeup="started, suspending"
> +    domU_check="
> +ifconfig eth0 192.168.0.2
> +echo domU started
> +"
> +    dom0_check="
> +until grep 'domU started' /var/log/xen/console/guest-domU.log; do
> +    sleep 1
> +done
> +echo \"${wait_and_wakeup}\"
> +set -x
> +echo deep > /sys/power/mem_sleep
> +echo mem > /sys/power/state
> +# now wait for resume
> +sleep 5
> +# get domU console content into test log
> +tail -n 100 /var/log/xen/console/guest-domU.log
> +xl list
> +xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
> +# check if domU is still alive
> +ping -c 10 192.168.0.2 || exit 1
> +echo \"${passed}\"
> +"
> +fi
> +
> +# DomU
> +mkdir -p rootfs
> +cd rootfs
> +# fakeroot is needed to preserve device nodes in rootless podman container
> +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +echo "#!/bin/sh
> +
> +${domU_check}
> +/bin/sh" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +cd ..
> +rm -rf rootfs
> +
> +# DOM0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> +mkdir boot
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../binaries/dist/install/* .
> +
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
> +xl create /etc/xen/domU.cfg
> +${dom0_check}
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +# just PVH for now
> +echo '
> +type = "pvh"
> +name = "domU"
> +kernel = "/boot/vmlinuz"
> +ramdisk = "/boot/initrd-domU"
> +extra = "root=/dev/ram0 console=hvc0"
> +memory = 512
> +vif = [ "bridge=xenbr0", ]
> +disk = [ ]
> +' > etc/xen/domU.cfg
> +
> +echo "rc_verbose=yes" >> etc/rc.conf
> +echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
> +echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
> +mkdir -p var/log/xen/console
> +cp ../binaries/bzImage boot/vmlinuz
> +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +cd ..
> +
> +
> +TFTP=/scratch/gitlab-runner/tftp
> +CONTROLLER=control@thor.testnet
> +
> +echo '
> +multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
> +module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
> +module2 (http)/gitlab-ci/initrd-dom0
> +' > $TFTP/grub.cfg
> +
> +cp -f binaries/xen $TFTP/xen
> +cp -f binaries/bzImage $TFTP/vmlinuz
> +cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
> +
> +# start logging the serial; this gives interactive console, don't close its
> +# stdin to not close it; the 'cat' is important, plain redirection would hang
> +# until somebody opens the pipe; opening and closing the pipe is used to close
> +# the console
> +mkfifo /tmp/console-stdin
> +cat /tmp/console-stdin |\
> +ssh $CONTROLLER console | tee smoke.serial &
> +
> +# start the system pointing at gitlab-ci predefined config
> +ssh $CONTROLLER gitlabci poweron
> +trap "ssh $CONTROLLER poweroff; : > /tmp/console-stdin" EXIT
> +
> +if [ -n "$wait_and_wakeup" ]; then
> +    # wait for suspend or a timeout
> +    until grep "$wait_and_wakeup" smoke.serial || [ $timeout -le 0 ]; do
> +        sleep 1;
> +        : $((--timeout))
> +    done
> +    if [ $timeout -le 0 ]; then
> +        echo "ERROR: suspend timeout, aborting"
> +        exit 1
> +    fi
> +    # keep it suspended a bit, then wakeup
> +    sleep 30
> +    ssh $CONTROLLER wake
> +fi
> +
> +until grep "$passed" smoke.serial || [ $timeout -le 0 ]; do
> +    sleep 1;
> +    : $((--timeout))
> +done
> +if [ $timeout -le 0 ]; then
> +    echo "ERROR: test timeout, aborting"
> +    exit 1
> +fi
> +
> +sleep 1
> +
> +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> +exit 0
> -- 
> git-series 0.9.1
> 
--8323329-924388815-1679963592=:4066--

