Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16B2EB592
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62217.110057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHw-00033n-H1; Tue, 05 Jan 2021 22:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62217.110057; Tue, 05 Jan 2021 22:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHw-000337-Bc; Tue, 05 Jan 2021 22:58:52 +0000
Received: by outflank-mailman (input) for mailman id 62217;
 Tue, 05 Jan 2021 22:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwvHt-00030e-Vn
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:58:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1220e9e9-57a2-4a0e-9602-e26d1599fed5;
 Tue, 05 Jan 2021 22:58:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E0D622EBF;
 Tue,  5 Jan 2021 22:58:47 +0000 (UTC)
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
X-Inumbo-ID: 1220e9e9-57a2-4a0e-9602-e26d1599fed5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609887527;
	bh=4ImKsx+erO3Ecjdqg5yQK8y8Fltn64yVoowIoXjxlPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1xrNHpWriJWwoY2VSZZ7HUJ9Su8/fn6Z2aImA/7F1tnPfVSKN9M2iKIel/AtVoiK
	 Gzbnf0MNXGqkB+5CM1Fipf4EADdZGT2FA46MtY9+86V/ASRfuSCmX2v8C9MW/P22Sp
	 Xb2rAq9wY4Ygd3jvV+KLFcyWc7Ort6bpF1PVtGpgP5nUmOozbNnGYTxNZGjEEiWhHN
	 y+U6a3D/PSznDjHx0sJcosUQ/iDOv11V3LFk+xS3GOxks3szSR5a3bxDBNCOtA72hB
	 7d7+vDcw4t6Z4QL+VUptkQ3uo1D4MALK6YrDpesSvr41JmhnLvVnm+dn+Rb2EE8Ec7
	 D1PLrDnYvgvCw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 3/3] automation: use test-artifacts/qemu-system-aarch64 instead of Debian's
Date: Tue,  5 Jan 2021 14:58:45 -0800
Message-Id: <20210105225845.30346-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>

Instead apt-get'ing Debian's qemu-system-aarch64, simply use the
provided QEMU binary under binaries.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/scripts/qemu-alpine-arm64.sh | 12 +++++-------
 automation/scripts/qemu-smoke-arm64.sh  | 15 +++++++--------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
index b43a654270..e2240f9ab4 100755
--- a/automation/scripts/qemu-alpine-arm64.sh
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -3,8 +3,7 @@
 set -ex
 
 apt-get -qy update
-apt-get -qy install --no-install-recommends qemu-system-aarch64 \
-                                            u-boot-qemu \
+apt-get -qy install --no-install-recommends u-boot-qemu \
                                             u-boot-tools \
                                             device-tree-compiler \
                                             cpio \
@@ -69,10 +68,9 @@ echo "rc_verbose=yes" >> etc/rc.conf
 find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
 cd ../..
 
-# XXX Silly workaround to get the following QEMU command to work
-# QEMU looks for "efi-virtio.rom" even if it is unneeded
-cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
-qemu-system-aarch64 \
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -m 1024 -display none \
@@ -107,7 +105,7 @@ rm -f smoke.serial
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 720 \
-qemu-system-aarch64 \
+./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index bdef0717ad..53086a5ac7 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -5,17 +5,16 @@ set -ex
 # Install QEMU
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
-apt-get -qy install --no-install-recommends qemu-system-aarch64 \
-                                            u-boot-qemu \
+apt-get -qy install --no-install-recommends u-boot-qemu \
                                             u-boot-tools \
                                             device-tree-compiler \
                                             busybox-static \
-                                            cpio
+                                            cpio \
+                                            curl
 
-# XXX Silly workaround to get the following QEMU command to work
-# QEMU looks for "efi-virtio.rom" even if it is unneeded
-cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
-qemu-system-aarch64 \
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -m 1024 -display none \
@@ -79,7 +78,7 @@ rm -f smoke.serial
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 240 \
-qemu-system-aarch64 \
+./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 1024 -monitor none -serial stdio \
-- 
2.17.1


