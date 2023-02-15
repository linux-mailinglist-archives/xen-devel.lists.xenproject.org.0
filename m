Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4926972F6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 01:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495669.766078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67q-0003hN-D3; Wed, 15 Feb 2023 00:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495669.766078; Wed, 15 Feb 2023 00:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67q-0003ca-7c; Wed, 15 Feb 2023 00:58:22 +0000
Received: by outflank-mailman (input) for mailman id 495669;
 Wed, 15 Feb 2023 00:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS67o-0003JV-VE
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 00:58:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d65b45c3-accb-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 01:58:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AF81B81EA7;
 Wed, 15 Feb 2023 00:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01695C433A0;
 Wed, 15 Feb 2023 00:58:16 +0000 (UTC)
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
X-Inumbo-ID: d65b45c3-accb-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676422697;
	bh=T5WSKBYQzVjhzysjUnGo4/jVHe9t0Ka2SdLf2aTZm00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnFI1tB7BJHYp+pyQLmbq10Lq+vDJiCWpC8BBOLXpn+yfuUe3Ia7YNJ1x0Hp7pnTa
	 WphNfy9yCmIxA0n6mejY+3WR0s+MaLSpYLyeFJOOq/d374btgAw1J1j2EuB9OO1Snx
	 fjy2alZ2N2zwtt6kkXmBEAErI1df3znr2lqppqtfTvBg7dBrEGd4x9o8UTtDFnwiLN
	 +gR/Dc/cwh4lDlHm7lmIhYF/MSlrfw6VWMzz2Sdql1cgu5jXBNVKFc0lmX4h4v1GqX
	 ed5cRPfSnAHvaFA/kku3+Ao+ppVwlcwmOJz93YqpY9JN/r8aosOM8QuQnPPe4Zt0sl
	 FZOb9LYK3v6/w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 3/3] automation: expand arm32 dom0 test adding xl domain creation
Date: Tue, 14 Feb 2023 16:58:11 -0800
Message-Id: <20230215005811.2126759-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
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
 automation/gitlab-ci/test.yaml              |  1 +
 automation/scripts/qemu-smoke-dom0-arm32.sh | 50 ++++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9570085a60..7bfdd02e64 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -172,6 +172,7 @@ qemu-smoke-dom0-arm32-gcc:
   needs:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32
+    - yocto-qemuarm
 
 qemu-smoke-dom0-arm32-gcc-debug:
   extends: .qemu-arm32
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


