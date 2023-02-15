Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FF6987A8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 23:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496249.766903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPy2-00061T-TX; Wed, 15 Feb 2023 22:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496249.766903; Wed, 15 Feb 2023 22:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPy2-0005sO-Lw; Wed, 15 Feb 2023 22:09:34 +0000
Received: by outflank-mailman (input) for mailman id 496249;
 Wed, 15 Feb 2023 22:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSPy1-0005jC-Ls
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 22:09:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bc899ac-ad7d-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 23:09:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F0DA61DD2;
 Wed, 15 Feb 2023 22:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E2CC4339E;
 Wed, 15 Feb 2023 22:09:29 +0000 (UTC)
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
X-Inumbo-ID: 6bc899ac-ad7d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676498970;
	bh=Iamh2qBSbFn33h3UDYRg2ZRfP+A5EhnNlQK4iEJGSF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TvEdejUUpxdaxGd6/xhc8oQAkepOVQ5Of2rbPPW/X60e65XpSVclPHIZsVBDFCHpu
	 LOxwRInw5kSdNcDQGjNqA3QgnrFwAUviXaCyywLVIYb7NSo39XdhQbWkKNzceI7RI/
	 kkiywDi7pXOHQZe9BIJUIe+cd5BBtJIjLEvBeegHnacZvzZt/CTKg/FBSYOVnjZI3I
	 4+lrrcE6LRJcJgKZVQLKnLU7jhjBoMjDyi6sAs2r5Eb/uZwJe2KA7FHBuft6luE0qv
	 gCcYF5wAOwN5H11ymrMUBPZoSxzNB8xoup2Hv/OViT5bfwFtTZ5BsMvrA7U15MFUXp
	 NaoqH3/9y8xEQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 3/3] automation: expand arm32 dom0 test adding xl domain creation
Date: Wed, 15 Feb 2023 14:09:25 -0800
Message-Id: <20230215220925.2313528-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

As part of the arm32 dom0 test, also create a simple domU using xl. To
do that, we need the toolstack installed in the dom0 rootfs. We switch
to using the kernel and rootfs built by the Yocto arm32 job.

Remove the PCI node from the host device tree: it is unused but causes a
Linux hang at boot.

Use xen-watchdog to trigger the domU creation for convience
(/etc/local.d is not handled by rootfs.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add yocto-qemuarm also to qemu-smoke-dom0-arm32-gcc-debug
---
 automation/gitlab-ci/test.yaml              |  2 +
 automation/scripts/qemu-smoke-dom0-arm32.sh | 50 ++++++++++++++++-----
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9570085a60..77bb1c362d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -172,6 +172,7 @@ qemu-smoke-dom0-arm32-gcc:
   needs:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32
+    - yocto-qemuarm
 
 qemu-smoke-dom0-arm32-gcc-debug:
   extends: .qemu-arm32
@@ -180,6 +181,7 @@ qemu-smoke-dom0-arm32-gcc-debug:
   needs:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
+    - yocto-qemuarm
 
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 98e4d481f6..7a748bdf23 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -3,14 +3,37 @@
 set -ex
 
 cd binaries
-# Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
-# Use a tiny initrd based on busybox from Alpine Linux
-curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
+mkdir rootfs
+cd rootfs
+tar xvf ../xen-image-minimal-qemuarm.tar.bz2
+mkdir -p ./root
+echo "name=\"test\"
+memory=400
+vcpus=1
+kernel=\"/root/zImage\"
+ramdisk=\"/root/initrd.cpio.gz\"
+extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+" > root/test.cfg
+echo "#!/bin/bash
+
+xl list
+
+xl create -c /root/test.cfg
+
+" > ./root/xen.start
+echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
+
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 mkdir rootfs
 cd rootfs
 tar xvzf ../initrd.tar.gz
+find . | cpio -H newc -o | gzip > ../root/initrd.cpio.gz
+cd ..
+rm -rf rootfs
+rm initrd.tar.gz
+
+cp ../zImage ./root
 find . | cpio -H newc -o | gzip > ../initrd.gz
 cd ..
 
@@ -20,22 +43,25 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
-   -m 1024 \
+   -m 2048 \
    -serial stdio \
    -monitor none \
    -display none \
    -machine dumpdtb=virt.dtb
 
+# XXX disable pci to avoid Linux hang
+fdtput virt.dtb -p -t s /pcie@10000000 status disabled
+
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt.dtb"
-XEN="xen"
-DOM0_KERNEL="vmlinuz"
+XEN="xen-qemuarm"
+DOM0_KERNEL="zImage"
 DOM0_RAMDISK="initrd.gz"
-DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
-XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
+DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/sbin/init"
+XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0"
 
 NUM_DOMUS=0
 
@@ -51,12 +77,12 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 rm -f smoke.serial
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
+timeout -k 1 720 \
 ./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
-   -m 1024 \
+   -m 2048 \
    -serial stdio \
    -monitor none \
    -display none \
-- 
2.25.1


