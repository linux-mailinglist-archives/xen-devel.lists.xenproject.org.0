Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E8CA49B2
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178127.1502090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCb9-0000Rh-Au; Thu, 04 Dec 2025 16:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178127.1502090; Thu, 04 Dec 2025 16:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCb9-0000Q6-84; Thu, 04 Dec 2025 16:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1178127;
 Thu, 04 Dec 2025 16:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCb7-0000By-Vu
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:54:29 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a54370-d131-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:54:29 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 575D81400230;
 Thu,  4 Dec 2025 11:54:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 04 Dec 2025 11:54:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:54:26 -0500 (EST)
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
X-Inumbo-ID: e5a54370-d131-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764867268; x=1764953668; bh=/bW7oZn7wY
	ZvxeYpFbyx0iWQejJzqha55x3nUBK4tG4=; b=uZZEVKwuFI3TSK9RLFAshT2JAo
	eG+UkzrtnuG0TH3Unur/Isfg9r0jtqVvDqs/tYqV2ukabqE5avk614DC00nnSmQq
	ucIjAkNrxjhbguzsoGx+AhYXLMtJUt/iY6AXeXmk6OYaM21/GlcAUoSttKadmtCa
	wd5o27A5/6fakS1R1Rpuob9AkkRPRn3GXdB8pGX5q3U21kpT+7F9pBmBziLyGr83
	9/paWQllBeY3uR2qzqFzDBWzaIDbSiVhI8J6qT43OlR5CZPeHdNu2SbTl5UDteUA
	U1hIzkkZ2g9rCQNlypp1CGQXbdTJ1Np4d0dKcqo7NnqUrBZew/FVoCAEf5ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764867268; x=
	1764953668; bh=/bW7oZn7wYZvxeYpFbyx0iWQejJzqha55x3nUBK4tG4=; b=M
	HAdr6jkV/nnSF1USkyv14gG+mseph6bXtP+s/gd0uZeOQ7iUTqcycS35crcF07Zf
	NW6j9mLjh/rg9uyzrmAfoZOK451AWjVXnAMm2h9TKq/Nxk1NbXEykLTSDAXO1KP2
	Qyum5iXAtgnMTXlbWUscIG/xg59DcAYFfnjx3j/zkM0YSbgOlzR/yLQL0luZFLbk
	rO8bRVsYpkymZhjYn2pZLwTcAsrAjhMXIk/tBxe5AuUXafQ+FV4Z6ZMruJLt7Mn9
	61G8eBdCNyWaim3NV6dOf6JgW+gQobY9/CKauGK+taV/QCfsUYHoe0toXTR/JmO3
	g7yIpUssBJyiL/TX+l8bw==
X-ME-Sender: <xms:xLwxaTZE21SZF30xkwFlpF_lssGbOeAQLaazopyYn9kXVPNB8V75yg>
    <xme:xLwxaZZPmznIP76-k022jLI4bpuXsr69DGFb4wEDd6JmsF2vxMYwVxuQo4vgX1bsZ
    7xxzITatczpv0qdp3wHalVkrKazrxdlDfKLSDErFsGxG1deOA>
X-ME-Received: <xmr:xLwxaa-00_DIYzXZs9gLF_kGDuL3zEHmbH5wqfiLBj-qSTlFiCyh4NkyWZ5NIPCZDL6JuWQdI9dnn3MJcr1nDPDfQmK5ixWTvryahy8ozfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghr
    ughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:xLwxaYg27epQsN1JzKniWr8InhmLaeUtFjxz1IaYJTH9czsq2zH2OA>
    <xmx:xLwxaaednwg_6HVncKo_VplDST0rd9PejCcsEEfNr3gq2Y6-UColcA>
    <xmx:xLwxafp3JIptrg0SRLJ0kSipFCNS3qlBcOjhfngb9fV2clQ6lMQ45g>
    <xmx:xLwxafDEtIOU2UsBpMnQOBWgTTWCY-NS7A0Upv_ZoeFQxMC63fI4Hw>
    <xmx:xLwxaX4CL_QMTRVmWjvbXlovE8FGTwjHul8yiieUoLfQnVFNL_JW6F8i>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/4] CI: Add driver domains tests
Date: Thu,  4 Dec 2025 17:53:49 +0100
Message-ID: <58d2b15392340f82c914c7544af0f0f00ce53e47.1764867217.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setup a simple two domU system. One with network backend, running
xendriverdomain service, and one with frontend, trying to ping the
backend.

Contrary to other similar tests, use disk image instead of initrd, to
allow bigger rootfs without adding more RAM (for both dom0 and domU).
But keep using pxelinux as a bootloader as it's easier to setup than
installing grub on the disk. Theoretically, it could be started via direct
kernel boot in QEMU, but pxelinux is slightly closer to real-world
deployment.

Use fakeroot to preserve file owners/permissions. This is especially
important for suid binaries like /bin/mount - without fakeroot, they
will end up as suid into non-root user.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- add fakeroot
- run ldconfig at the disk image creation time, to avoid running it at
  dom0/domU boot time (which is much slower)
Changes in v2:
- use heredoc
- limit ping loop iterations
- use full "backend" / "frontend" in disk image names
- print domU consoles directly to /dev/console, to avoid systemd-added
  messages prefix
- terminate test on failure, don't wait for timeout
---
 automation/build/debian/13-x86_64.dockerfile    |   2 +-
 automation/gitlab-ci/test.yaml                  |   8 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 138 +++++++++++++++++-
 3 files changed, 148 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 2c6c9d4a5098..6382bafbd5bd 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -55,7 +55,9 @@ RUN <<EOF
 
         # for test phase, qemu-* jobs
         busybox-static
+        e2fsprogs
         expect
+        fakeroot
         ovmf
         qemu-system-x86
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 0c4f535cd112..52ffb271951a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.22-gcc
 
+qemu-alpine-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.22-gcc
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
new file mode 100755
index 000000000000..c0241da54168
--- /dev/null
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -0,0 +1,138 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+dom0_rootfs_extra_comp=()
+dom0_rootfs_extra_uncomp=()
+
+cd binaries
+
+# DomU rootfs
+
+mkdir -p rootfs
+cd rootfs
+mkdir -p etc/local.d
+passed="ping test passed"
+failed="TEST FAILED"
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
+
+set -x
+
+if grep -q test=backend /proc/cmdline; then
+    brctl addbr xenbr0
+    ip link set xenbr0 up
+    ip addr add 192.168.0.1/24 dev xenbr0
+    bash /etc/init.d/xendriverdomain start
+    # log backend-related logs to the console
+    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
+else
+    ip link set eth0 up
+    ip addr add 192.168.0.2/24 dev eth0
+    timeout=6 # 6*10s
+    until ping -c 10 192.168.0.1; do
+        sleep 1
+        if [ \$timeout -le 0 ]; then
+            echo "${failed}"
+            exit 1
+        fi
+        ((timeout--))
+    done
+    echo "${passed}"
+fi
+EOF
+chmod +x etc/local.d/xen.start
+fakeroot sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+    mkfs.ext4 -d . ../domU-rootfs.img 1024M
+"
+cd ..
+rm -rf rootfs
+
+# Dom0 rootfs
+mkdir -p rootfs
+cd rootfs
+fakeroot -s ../fakeroot-save sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+"
+mkdir -p root etc/local.d
+cat > root/backend.cfg << EOF
+name="backend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=backend"
+disk=[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
+EOF
+cat > root/frontend.cfg << EOF
+name="frontend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=frontend"
+disk=[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
+vif=[ 'bridge=xenbr0,backend=backend' ]
+EOF
+
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
+
+set -x
+
+bash /etc/init.d/xencommons start
+
+xl list
+
+tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s/^/(backend) /" >>/dev/console &
+tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "s/^/(frontend) /" >>/dev/console &
+xl -vvv create /root/backend.cfg
+xl -vvv create /root/frontend.cfg
+EOF
+chmod +x etc/local.d/xen.start
+
+cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
+cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
+cp ../bzImage ./root/
+mkdir -p etc/default
+echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
+mkdir -p var/log/xen/console
+fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
+cd ..
+rm -rf rootfs
+
+cd ..
+
+cat >> binaries/pxelinux.0 << EOF
+#!ipxe
+
+kernel xen console=com1 console_timestamps=boot
+module bzImage console=hvc0 root=/dev/sda net.ifnames=0
+boot
+EOF
+
+# Run the test
+rm -f smoke.serial
+export TEST_CMD="qemu-system-x86_64 \
+    -cpu qemu64,+svm \
+    -m 2G -smp 2 \
+    -monitor none -serial stdio \
+    -nographic \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 \
+    -drive file=binaries/dom0-rootfs.img,format=raw"
+
+export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
+export LOG_MSG="Domain-0"
+# exit early on test failure too, check if it was success below
+export PASSED="$passed|$failed"
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
+
+grep "$passed" smoke.serial
-- 
git-series 0.9.1

