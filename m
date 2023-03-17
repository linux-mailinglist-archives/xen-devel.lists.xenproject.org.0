Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF86BDFAF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 04:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510878.789407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0ra-0002Xf-Bu; Fri, 17 Mar 2023 03:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510878.789407; Fri, 17 Mar 2023 03:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0ra-0002Tq-4E; Fri, 17 Mar 2023 03:34:42 +0000
Received: by outflank-mailman (input) for mailman id 510878;
 Fri, 17 Mar 2023 03:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZYU=7J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pd0rY-0002SG-Hy
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 03:34:40 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b9be9b-c474-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 04:34:38 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 261633200921;
 Thu, 16 Mar 2023 23:34:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 16 Mar 2023 23:34:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 23:34:35 -0400 (EDT)
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
X-Inumbo-ID: a4b9be9b-c474-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1679024076; x=1679110476; bh=xb
	B/jz5azTQX3pxqI3ZntZ1QaYPMvik4cyUKFCEvRnA=; b=InCVG88khnIeFJPFbk
	Mu5xlzz9lgEVWEklaE5HaN5Ryw2ZgzUG+e0fH6dT/+fhO8mOmBrL4dSonN3/KBlT
	ZXHYnYx/Xmd6EMEVtWV16EdxBbSbvgurLGGPQ9DZAgrAv5X4TlO4xVEaED+IJ2U4
	+DOgWEXyrP4SbQLFSCwKm5I1vHuoUdP6t5TjnoxCFm7YRLD5GmbsUiMC8VWOqFW+
	HxZNPMQjmAn+BN+8xBnlN69sCoVsF8zWM7FZ/M7z3OVMUpz9IS1ISaYAhj1XD98e
	Beg43xUSWqDySx8iWyPMsi5bnOrsgVYHRXbX4yLSWYebSrs5Nk5ib0zMJOSGTtqp
	1RKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679024076; x=1679110476; bh=xbB/jz5azTQX3pxqI3ZntZ1QaYPMvik4cyU
	KFCEvRnA=; b=C5ewfySeInYwD8DQ2z2/5s4Xf3G5LASJfyZQHKnvGWGL2HcvDYF
	OU2AC6blMpBkvIpyh9+DvexD1vjTy568WnGil74a/BfQf1Dmsk4/lZMSvSwKCp6C
	yP61SJZP1nvHUJjsTIJbb4y28N/vP7iZqdedaAp0uqysrzery3lF2kAHB2XKXnN6
	zV3MF73GbgS9Np/h7/nULZSjCxij5BitgcBWuyxpP1AlQqx8qV7IZV8JwQ3yrFXL
	edb7spqCDn0Iu0kzJjLyVXldFNF3khviNiCzvgGOoKhOdziCL5sLkROGeR0Peent
	RwKFJww1zZQdY2IrRu65sdrMkmxcPM1s6Bg==
X-ME-Sender: <xms:zN8TZNO3ebDYGnjQ50L6CO_Vl2_1mRWT9ppQPAwpVZaNcGTusxgQ7w>
    <xme:zN8TZP_ydDf9MrjJ5cX732rFCSEvkasUs7yD-ibuXHFy6kdQ1UPZ7lJrnxyb1vr4-
    nRoYiav9yfcSw>
X-ME-Received: <xmr:zN8TZMTokMvpMFsyQtuQyYbvCZE3OacJMLsvzLBt6fHXokMwFHfao6IE9fIlPA4l23A18hpwtgUxMlLV3ukq3JF-NWhd1mpBSzP8KKsktKlH21Qny7nR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefuddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeef
    iedvieejgefggefggfeihfekteeghfevkeduudegjeelgfeftedvledvuedvjeenucffoh
    hmrghinhepqhhusggvshdqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:zN8TZJufZq_pihTwPh_vv89roERWmQYiZcogQaTJIlJ3cR9Rv0M7yw>
    <xmx:zN8TZFf7Pqsa3OBf4dkhlBUxdawXxkzM-XcJa-Ymd-RQeLZi1-7q2Q>
    <xmx:zN8TZF3KuybAvAOBXCnw4FI2L11jn0ZjJkfDPhoCu8y37GyQB6OXHQ>
    <xmx:zN8TZFHjGcv7FJpXKoQCzpqUKoyCaFChtv1nR4SmVVK32TMdA9MrFA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: add a suspend test on an Alder Lake system
Date: Fri, 17 Mar 2023 04:34:18 +0100
Message-Id: <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first test using Qubes OS CI infra. The gitlab-runner has
access to ssh-based control interface (control@thor.testnet, ssh key
exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
files (mapped under /scratch/gitlab-runner/tftp inside the container).
Details about the setup are described on
https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/

This test boots Xen, and try if S3 works. It runs on a ADL-based desktop
system. The test script is based on the Xilinx one.

The machine needs newer kernel than other x86 tests run, so use 6.1.x
kernel added in previous commit.

When building rootfs, use fakeroot to preserve device files when
repacking rootfs archives in a non-privileged container.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I'm bad at naming things. Things that I could use naming suggestions:
 - test script (qubes-x86-64-suspend.sh) - this might be okay?
 - test template job name (.adl-x86-64)
 - test job name (adl-suspend-x86-64-gcc)
 - tag (qubes-hw2)

For context, our CI has several machines, named test-X or hwX, each
controlled with matching hal900X RPi (this is where gitlab-runner is).
This test uses only one specific hw, but I plan adding few others too.
---
 automation/gitlab-ci/test.yaml             |  31 ++++-
 automation/scripts/qubes-x86-64-suspend.sh | 155 ++++++++++++++++++++++-
 2 files changed, 186 insertions(+)
 create mode 100755 automation/scripts/qubes-x86-64-suspend.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2e1a6886df7f..f5511dd6da70 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -15,6 +15,10 @@
 .arm32-test-needs: &arm32-test-needs
   - qemu-system-aarch64-6.0.0-arm32-export
 
+.x86-64-test-needs: &x86-64-test-needs
+  - alpine-3.12-rootfs-export
+  - kernel-6.1.19-export
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
@@ -84,6 +88,25 @@
   tags:
     - xilinx
 
+.adl-x86-64:
+  extends: .test-jobs-common
+  variables:
+    # the test controller runs on RPi4
+    CONTAINER: alpine:3.12-arm64v8
+    LOGFILE: smoke-test.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  only:
+    variables:
+      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  before_script:
+    - apk --no-cache add openssh-client fakeroot
+  tags:
+    - qubes-hw2
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -110,6 +133,14 @@ xilinx-smoke-dom0less-arm64-gcc:
     - *arm64-test-needs
     - alpine-3.12-gcc-arm64
 
+adl-suspend-x86-64-gcc:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64-suspend.sh s3 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64-suspend.sh b/automation/scripts/qubes-x86-64-suspend.sh
new file mode 100755
index 000000000000..fc479c9faaec
--- /dev/null
+++ b/automation/scripts/qubes-x86-64-suspend.sh
@@ -0,0 +1,155 @@
+#!/bin/sh
+
+set -ex
+
+test_variant=$1
+
+wait_and_wakeup=
+if [ -z "${test_variant}" ]; then
+    passed="ping test passed"
+    domU_check="
+until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
+    sleep 30
+done
+echo \"${passed}\"
+"
+elif [ "${test_variant}" = "s3" ]; then
+    passed="suspend test passed"
+    wait_and_wakeup="started, suspending"
+    domU_check="
+ifconfig eth0 192.168.0.2
+echo domU started
+"
+    dom0_check="
+until grep 'domU started' /var/log/xen/console/guest-domU.log; do
+    sleep 1
+done
+echo \"${wait_and_wakeup}\"
+set -x
+echo deep > /sys/power/mem_sleep
+echo mem > /sys/power/state
+# now wait for resume
+sleep 5
+# get domU console content into test log
+tail -n 100 /var/log/xen/console/guest-domU.log
+xl list
+xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
+# check if domU is still alive
+ping -c 10 192.168.0.2 || exit 1
+echo \"${passed}\"
+"
+fi
+
+# DomU
+mkdir -p rootfs
+cd rootfs
+fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+echo "#!/bin/sh
+
+${domU_check}
+/bin/sh" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+cd ..
+rm -rf rootfs
+
+# DOM0 rootfs
+mkdir -p rootfs
+cd rootfs
+fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
+mkdir boot
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../binaries/dist/install/* .
+
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+
+xl create /etc/xen/domU.cfg
+${dom0_check}
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+# just PVH for now
+echo '
+type = "pvh"
+name = "domU"
+kernel = "/boot/vmlinuz"
+ramdisk = "/boot/initrd-domU"
+extra = "root=/dev/ram0 console=hvc0"
+memory = 512
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+' > etc/xen/domU.cfg
+
+echo "rc_verbose=yes" >> etc/rc.conf
+echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
+echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
+mkdir -p var/log/xen/console
+cp ../binaries/bzImage boot/vmlinuz
+cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cd ..
+
+
+TFTP=/scratch/gitlab-runner/tftp
+
+echo '
+multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
+module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
+module2 (http)/gitlab-ci/initrd-dom0
+' > $TFTP/grub.cfg
+
+cp -f binaries/xen $TFTP/xen
+cp -f binaries/bzImage $TFTP/vmlinuz
+cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
+
+# start logging the serial; this gives interactive console, don't close its
+# stdin to not close it; the 'cat' is important, plain redirection would hang
+# until somebody opens the pipe; opening and closing the pipe is used to close
+# the console
+mkfifo /tmp/console-stdin
+cat /tmp/console-stdin |\
+ssh control@thor.testnet console | tee smoke.serial &
+
+# start the system pointing at gitlab-ci predefined config
+ssh control@thor.testnet gitlabci poweron
+trap "ssh control@thor.testnet poweroff; : > /tmp/console-stdin" EXIT
+
+if [ -n "$wait_and_wakeup" ]; then
+    # wait for suspend or a timeout
+    timeout=120
+    until grep "$wait_and_wakeup" smoke.serial || [ $timeout -le 0 ]; do
+        sleep 1;
+        : $((--timeout))
+    done
+    if [ $timeout -le 0 ]; then
+        echo "ERROR: suspend timeout, aborting"
+        exit 1
+    fi
+    # keep it suspended a bit, then wakeup
+    sleep 30
+    ssh control@thor.testnet wake
+fi
+
+# give the test time to run a bit, and then check
+sleep 30
+
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
git-series 0.9.1

