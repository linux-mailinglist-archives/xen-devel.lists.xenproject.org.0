Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3153C7AB1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 02:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155852.287662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T5F-0003ws-9E; Wed, 14 Jul 2021 00:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155852.287662; Wed, 14 Jul 2021 00:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T5F-0003ul-4r; Wed, 14 Jul 2021 00:49:05 +0000
Received: by outflank-mailman (input) for mailman id 155852;
 Wed, 14 Jul 2021 00:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3T5D-0003Et-TC
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:49:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45039b26-e43d-11eb-87c6-12813bfff9fa;
 Wed, 14 Jul 2021 00:48:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A6A661380;
 Wed, 14 Jul 2021 00:48:56 +0000 (UTC)
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
X-Inumbo-ID: 45039b26-e43d-11eb-87c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626223736;
	bh=7AX9tgnNt8re/IodO17wrafcLnYuaI+FKt9FzKcLJ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=Sn6Vx0SrAG34k5/aaDjSPnBbaAlZUzWS1UsQQ74lsHhbXDjgX8LNhuCUTEgigZn1w
	 4CLTDOP6IauOCrAncLJrZbrwkC5XXgvEQDWXjIuEvvmujuli0y6uQx9EgxxOckOHPt
	 CezUvzAzMAWBtd0Ee55JFunpPFo+ttSJS3cwea9iyHdNjfilMAAFX7HLu7deCM4xHa
	 aucx9MmRGfRdO30Hnvr0blR0irNd04FiibqxULxDyPlMZwphMu+IWRHQ3u9v9qbywd
	 3/u4MfWw9qk9SpGULzeJnTJcjEtc8Qm8gbM8Jo31jEvBEM/CR5NKpKdNTxpT8iYfgL
	 YgefmYQR8f7Vw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Date: Tue, 13 Jul 2021 17:48:54 -0700
Message-Id: <20210714004854.31135-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
the test-artifacts qemu container. The minimal test simply boots Xen
(built from previous build stages) and Dom0. The test is fetching the
Dom0 kernel and initrd from Debian Jessie: they work just fine and this
way we don't have to maintain a build for them too.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/test.yaml         | 23 ++++++++
 automation/scripts/qemu-smoke-arm32.sh | 72 ++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d3b670b156..7f942dd64b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -71,6 +71,29 @@ qemu-smoke-arm64-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-smoke-arm32-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+  dependencies:
+    - debian-unstable-gcc-arm32
+    - qemu-system-aarch64-6.0.0-arm32-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
 qemu-smoke-x86-64-gcc:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
new file mode 100755
index 0000000000..4126be2042
--- /dev/null
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -0,0 +1,72 @@
+#!/bin/bash
+
+set -ex
+
+# Install QEMU
+export DEBIAN_FRONTENT=noninteractive
+apt-get -qy update
+apt-get -qy install --no-install-recommends device-tree-compiler \
+                                            curl
+
+cd binaries
+curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
+curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
+
+kernel=`stat -L --printf="%s" vmlinuz`
+initrd=`stat -L --printf="%s" initrd.gz`
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 2048 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -machine dumpdtb=virt.dtb
+
+dtc -I dtb -O dts virt.dtb > virt.dts
+
+cat >> virt.dts << EOF
+/ {
+	chosen {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		stdout-path = "/pl011@9000000";
+        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0";
+		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh init=/bin/sh";
+		dom0 {
+			compatible = "xen,linux-zimage", "xen,multiboot-module";
+			reg = <0x0 0x1000000 0x0 $kernel>;
+		};
+        dom0-ramdisk {
+			compatible = "xen,linux-initrd", "xen,multiboot-module";
+			reg = <0x0 0x3200000 0x0 $initrd>;
+		};
+	};
+};
+EOF
+dtc -I dts -O dtb virt.dts > virt.dtb
+
+rm -f smoke.serial
+set +e
+timeout -k 1 240 \
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 2048 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -dtb virt.dtb \
+   -no-reboot \
+   -kernel ./xen \
+   -device loader,file=./vmlinuz,addr=0x1000000 \
+   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
+
+set -e
+(grep -q "^BusyBox" smoke.serial) || exit 1
+exit 0
-- 
2.17.1


