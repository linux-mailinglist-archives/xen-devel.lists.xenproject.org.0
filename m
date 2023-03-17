Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9366BF605
	for <lists+xen-devel@lfdr.de>; Sat, 18 Mar 2023 00:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511308.790315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdJDR-00074y-SD; Fri, 17 Mar 2023 23:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511308.790315; Fri, 17 Mar 2023 23:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdJDR-000720-PM; Fri, 17 Mar 2023 23:10:29 +0000
Received: by outflank-mailman (input) for mailman id 511308;
 Fri, 17 Mar 2023 23:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pdJDQ-00071e-9X
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 23:10:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6babb10-c518-11ed-87f5-c1b5be75604c;
 Sat, 18 Mar 2023 00:10:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 555C460BC5;
 Fri, 17 Mar 2023 23:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155FEC433D2;
 Fri, 17 Mar 2023 23:10:23 +0000 (UTC)
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
X-Inumbo-ID: e6babb10-c518-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679094624;
	bh=SqLukDe1hwOEXIule4CpVUh7Eg5/mGJw7ytqSiWyjiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z1Xh4v0RIGb/+aWY3fo+UEej71ut6TxwfRwJGYmDUMxt3qq+h41FKrNu2twc1taV9
	 FhqWO1byelbTIekpHe2xQyYWdMXAqbKZuLY2GhPAbnFriBX6AdEB0J9maDYtcrNLKW
	 rjJQEYMe7Fd3uIKwDBbDGLlicY9weSki0yixkYuyVDiKRxECmCq6kzvevayGGRk1Rs
	 nW5W+Njo7JXUFiv5o6fjmVQj5Lf9ivkK6W0xXrAjriRel+xXAZ4iAb5DCf3R6oMwEZ
	 CIs4j5D4Kg5Bj44x61UR1Q+z51DtEJxQehUXShWS0yhSQYDYARx7sRlEFyyrFv/7Bw
	 ox3iTdOGIQVWQ==
Date: Fri, 17 Mar 2023 16:10:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
In-Reply-To: <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com> <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-173283203-1679093789=:3359"
Content-ID: <alpine.DEB.2.22.394.2303171556470.3359@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-173283203-1679093789=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303171556471.3359@ubuntu-linux-20-04-desktop>

On Fri, 17 Mar 2023, Marek Marczykowski-Górecki wrote:
> This is a first test using Qubes OS CI infra. The gitlab-runner has
> access to ssh-based control interface (control@thor.testnet, ssh key
> exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
> files (mapped under /scratch/gitlab-runner/tftp inside the container).
> Details about the setup are described on
> https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/
> 
> This test boots Xen, and try if S3 works. It runs on a ADL-based desktop
> system. The test script is based on the Xilinx one.
> 
> The machine needs newer kernel than other x86 tests run, so use 6.1.x
> kernel added in previous commit.
> 
> When building rootfs, use fakeroot to preserve device files when
> repacking rootfs archives in a non-privileged container.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This is awesome!! Thanks Marek!


> ---
> I'm bad at naming things. Things that I could use naming suggestions:
>  - test script (qubes-x86-64-suspend.sh) - this might be okay?
>  - test template job name (.adl-x86-64)
>  - test job name (adl-suspend-x86-64-gcc)
>  - tag (qubes-hw2)

I think these names are OK. I would maybe rename the tag "qubes-hw2" to
"qubes" because so far there is only one but I am fine with qubes-hw2
also.


> For context, our CI has several machines, named test-X or hwX, each
> controlled with matching hal900X RPi (this is where gitlab-runner is).
> This test uses only one specific hw, but I plan adding few others too.
> ---
>  automation/gitlab-ci/test.yaml             |  31 ++++-
>  automation/scripts/qubes-x86-64-suspend.sh | 155 ++++++++++++++++++++++-
>  2 files changed, 186 insertions(+)
>  create mode 100755 automation/scripts/qubes-x86-64-suspend.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2e1a6886df7f..f5511dd6da70 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -15,6 +15,10 @@
>  .arm32-test-needs: &arm32-test-needs
>    - qemu-system-aarch64-6.0.0-arm32-export
>  
> +.x86-64-test-needs: &x86-64-test-needs
> +  - alpine-3.12-rootfs-export
> +  - kernel-6.1.19-export

As you know, the jobs starting with a "." are template jobs to avoid
repeating the same things over and over. .x86-64-test-needs could be
used in qemu-alpine-x86_64-gcc also.


>  .qemu-arm64:
>    extends: .test-jobs-common
>    variables:
> @@ -84,6 +88,25 @@
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

Let me know which trees should have QUBES_JOBS set to true (thus able to
start Qubes jobs.) At a minimum, I think we would want
https://gitlab.com/xen-project/xen to test "staging" and "master". I can
set QUBES_JOBS to true to https://gitlab.com/xen-project/xen if you are
OK with it.


> +  before_script:
> +    - apk --no-cache add openssh-client fakeroot

This would work but we typically try to avoid installing more packages
in the test jobs for speed and efficiency. Instead, add those packages
directly to the build container dockerfile
(automation/build/alpine/3.12-arm64v8.dockerfile), e.g.:

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index 180c978964..3f1e6a3fc6 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -41,3 +41,6 @@ RUN apk --no-cache add \
   libattr \
   libcap-ng-dev \
   pixman-dev \
+  # qubes test deps
+  openssh-client \
+  fakeroot \

But I am not sure why you need fakeroot, more questions below about it


> +  tags:
> +    - qubes-hw2
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -110,6 +133,14 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> +adl-suspend-x86-64-gcc:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64-suspend.sh s3 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc

This up to you, but qubes-x86-64-suspend.sh is very cool and
sophisticated and I would use it to create at least 2 jobs:
- a plain dom0 + domU boot (no suspend)
- a suspend/resume job

I am happy either way


>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64-suspend.sh b/automation/scripts/qubes-x86-64-suspend.sh
> new file mode 100755
> index 000000000000..fc479c9faaec
> --- /dev/null
> +++ b/automation/scripts/qubes-x86-64-suspend.sh
> @@ -0,0 +1,155 @@
> +#!/bin/sh
> +
> +set -ex
> +
> +test_variant=$1
> +
> +wait_and_wakeup=
> +if [ -z "${test_variant}" ]; then
> +    passed="ping test passed"
> +    domU_check="
> +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
> +    sleep 30
> +done
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

Very nice!


> +# DomU
> +mkdir -p rootfs
> +cd rootfs
> +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz

I am a bit confused about it: are you sure you need fakeroot for this?
This script is running inside a container as root already? Are you using
Docker on the RPi4 to run this job?


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

same here


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
> +ssh control@thor.testnet console | tee smoke.serial &

For clarity I would add a variable just below TFTP above to store the
controller node. This will make it easier to change in the future and
also makes it easier to see that it is runner-specific detail, e.g.:

TFTP=/scratch/gitlab-runner/tftp
CONTROLLER=control@thor.testnet

then here:

ssh $CONTROLLER console | tee smoke.serial &


> +# start the system pointing at gitlab-ci predefined config
> +ssh control@thor.testnet gitlabci poweron
> +trap "ssh control@thor.testnet poweroff; : > /tmp/console-stdin" EXIT
> +
> +if [ -n "$wait_and_wakeup" ]; then
> +    # wait for suspend or a timeout
> +    timeout=120
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
> +    ssh control@thor.testnet wake
> +fi

I like this. It will shorten the duration of the test job. I am not
asking you to do anything, but I think it would be a good idea to have
all test scripts loop around like this if possible to poll for success
every second rather than wait a pre-determined amount of time, which is
usually several minutes longer than necessary.


> +# give the test time to run a bit, and then check
> +sleep 30
> +
> +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> +exit 0
> -- 
> git-series 0.9.1
> 
--8323329-173283203-1679093789=:3359--

