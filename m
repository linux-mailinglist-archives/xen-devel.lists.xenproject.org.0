Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A386C90E8
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 22:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514765.797230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBa-0008CW-D4; Sat, 25 Mar 2023 21:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514765.797230; Sat, 25 Mar 2023 21:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBa-00082O-6O; Sat, 25 Mar 2023 21:12:26 +0000
Received: by outflank-mailman (input) for mailman id 514765;
 Sat, 25 Mar 2023 21:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgBBY-0007ws-5B
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 21:12:24 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba25b3f5-cb51-11ed-b464-930f4c7d94ae;
 Sat, 25 Mar 2023 22:12:20 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3801B5C00B5;
 Sat, 25 Mar 2023 17:12:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 25 Mar 2023 17:12:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Mar 2023 17:12:18 -0400 (EDT)
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
X-Inumbo-ID: ba25b3f5-cb51-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679778739; x=1679865139; bh=rQ
	U/oIGJKx7QRLBl4pp3Y5lNJCa59jcwnxSYsouhR5M=; b=RkMIhFzatDuVqb2sG1
	teSfKul/D948EjL8c0lmc+E7kBtPZZxFjphOyAn37Bg5XJWiLXpELphFKMLDMWjE
	xBOKDh6OXOzFx3iRePUkEQ/GXhOA321nXtvC34/A9iFp3e4RW6JivSLFso4hd9sK
	FU9MwHS2Y3qn+u565DeIUng5RkcSoSXqaWtP1Vw4iVrPBZqos3CPmgxc5Xf81aZN
	JeslJk4Vrq8XUC+qw4J2gxDDb0Z9QhHWe29Rmj8OBBWW0hHmkO7qWrJ8GxhK/pYQ
	+wqOAwzv978h1XhEuukWasftO4Ksr16tFN7WdIf2u2eoO3W7K7pQ1uAVmTCtD03K
	d2fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679778739; x=1679865139; bh=rQU/oIGJKx7QRLBl4pp3Y5lNJCa59jcwnxS
	YsouhR5M=; b=H2jGhoAl+rl+fXvaMNyNOWcy+tkN+Xop/UwFdBKQgrvhUPfax91
	acEuYlch8aUZc/T5EQ12vgQiwZE8dydabtBlrgcX4z0Hky7sEteQbKeCFtqDhYII
	FlyKzCU7VGCennrbdhm6hIPUdRX/6mODSgrncrs+WbfrzNcVDCePBeIg1jctVb8M
	WgG3dE3c+sn4L52hIGg5DAX5sp3msOh0Q9u75bsZ+/PYNhn7xHv+f7XegQ+Xwb5h
	edpqhJk6SA4aCdojyr7QdlUxY1296MpnNC2XiByLPt6peCN4t2gwI8lxw0mawP1B
	Bfyc1aKeBcj3SYFEWhQCeSjDao0/iug52Jg==
X-ME-Sender: <xms:s2MfZOEbULW1mFbneLUVZTGmGgQRda0XYaPCvdu8Lo7-8PES9K3Dsg>
    <xme:s2MfZPUgikWne0KN6V8Al6FEnkmP0x0nkTung05rXRraZV54LJoCPQ4C7Yp4pmbCv
    ZoageSrB08CzA>
X-ME-Received: <xmr:s2MfZIJ-qIQy8nMzTcc41bvGbC44XcLc053d1eTaAfbnG6U9y-lzUYNaTcnFh_-Ep5qiHvrlpcoZSDRbzBLfWDEnL0lBpoFY6UiZAgxNxJCL-LH-oD5R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    feeivdeijeeggfeggffgiefhkeetgefhveekuddugeejlefgfeetvdelvdeuvdejnecuff
    homhgrihhnpehquhgsvghsqdhoshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:s2MfZIEVIn7cAODzkjC1bfaeOofmSaPfk5uzJ1LtJqugfW_oNX5GSQ>
    <xmx:s2MfZEXSBEFriryrtTdu-BjdVVjuXnS6QD4X5w5QXgc8biU0tZcw6w>
    <xmx:s2MfZLMhejIVFZa_0f1Xsqt7MoRqzZAMXl1KCJlQxyWbTaMorDFA8w>
    <xmx:s2MfZBgD_Fv-N5ghdIMMv4NHtpQol6aTMWFz8VVJwKX52smQ14JWaA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] automation: add a smoke and suspend test on an Alder Lake system
Date: Sat, 25 Mar 2023 22:11:58 +0100
Message-Id: <6997fb7c3a40da23683bb0ca1961de40376e71a8.1679778534.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com>
References: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first test using Qubes OS CI infra. The gitlab-runner has
access to ssh-based control interface (control@thor.testnet, ssh key
exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
files (mapped under /scratch/gitlab-runner/tftp inside the container).
Details about the setup are described on
https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/

There are two test. First is a simple dom0+domU boot smoke test, similar
to other existing tests. The second is one boots Xen, and try if S3
works. It runs on a ADL-based desktop system. The test script is based
on the Xilinx one.

The machine needs newer kernel than other x86 tests run, so use 6.1.x
kernel added in previous commit.

The usage of fakeroot is necessary to preserve device nodes (/dev/null
etc) when repacking rootfs. The test runs in a rootless podman
container, which doesn't have full root permissions. BTW the same
applies to docker with user namespaces enabled (but it's only opt-in
feature there).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - install test deps in dockerfile
 - rename test script
 - add smoke test too (reusing the same script with different argument)
 - use CONTROLLER variable for ssh target
 - explain fakeroot usage
 - replace final "sleep 30" with polling + timeout
---
 automation/build/alpine/3.12-arm64v8.dockerfile |   3 +-
 automation/gitlab-ci/test.yaml                  |  33 +++-
 automation/scripts/qubes-x86-64.sh              | 174 +++++++++++++++++-
 3 files changed, 210 insertions(+)
 create mode 100755 automation/scripts/qubes-x86-64.sh

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index 180c978964aa..3f1e6a3fc6df 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -41,3 +41,6 @@ RUN apk --no-cache add \
   libattr \
   libcap-ng-dev \
   pixman-dev \
+  # qubes test deps
+  openssh-client \
+  fakeroot \
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ee9e3210772b..0916b367ea90 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -88,6 +88,23 @@
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
+  tags:
+    - qubes-hw2
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -114,6 +131,22 @@ xilinx-smoke-dom0less-arm64-gcc:
     - *arm64-test-needs
     - alpine-3.12-gcc-arm64
 
+adl-smoke-x86-64-gcc:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc
+
+adl-suspend-x86-64-gcc:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
new file mode 100755
index 000000000000..2d4cf2e2268c
--- /dev/null
+++ b/automation/scripts/qubes-x86-64.sh
@@ -0,0 +1,174 @@
+#!/bin/sh
+
+set -ex
+
+test_variant=$1
+
+wait_and_wakeup=
+timeout=120
+if [ -z "${test_variant}" ]; then
+    passed="ping test passed"
+    domU_check="
+ifconfig eth0 192.168.0.2
+until ping -c 10 192.168.0.1; do
+    sleep 1
+done
+echo \"${passed}\"
+"
+    dom0_check="
+until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
+    sleep 1
+done
+# get domU console content into test log
+tail -n 100 /var/log/xen/console/guest-domU.log
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
+# fakeroot is needed to preserve device nodes in rootless podman container
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
+CONTROLLER=control@thor.testnet
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
+ssh $CONTROLLER console | tee smoke.serial &
+
+# start the system pointing at gitlab-ci predefined config
+ssh $CONTROLLER gitlabci poweron
+trap "ssh $CONTROLLER poweroff; : > /tmp/console-stdin" EXIT
+
+if [ -n "$wait_and_wakeup" ]; then
+    # wait for suspend or a timeout
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
+    ssh $CONTROLLER wake
+fi
+
+until grep "$passed" smoke.serial || [ $timeout -le 0 ]; do
+    sleep 1;
+    : $((--timeout))
+done
+if [ $timeout -le 0 ]; then
+    echo "ERROR: test timeout, aborting"
+    exit 1
+fi
+
+sleep 1
+
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
git-series 0.9.1

