Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A5A4E47A7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293663.498973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWlHS-0007Pz-5i; Tue, 22 Mar 2022 20:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293663.498973; Tue, 22 Mar 2022 20:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWlHR-0007JK-Vz; Tue, 22 Mar 2022 20:39:01 +0000
Received: by outflank-mailman (input) for mailman id 293663;
 Tue, 22 Mar 2022 20:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWlHQ-0006yG-Af
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:39:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194f32f1-aa20-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 21:38:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE18616F9;
 Tue, 22 Mar 2022 20:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D52C340EE;
 Tue, 22 Mar 2022 20:38:56 +0000 (UTC)
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
X-Inumbo-ID: 194f32f1-aa20-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647981537;
	bh=6BFOwCcDZyb2QPiN6A24R5iB6eqbhMTsMQW5c95Q1mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MuWBAHp1H0ee0RCU6GJOKBlsV9CkMV/YP/7xuebuCO+JXAlSiQUqMlo0JjWnu1E6R
	 IFk0db4yfpu1Djtdqp+sOQ1DlGN4ESp26WerEJWxOvK316G7PKcP2E8DkPHtmAuQr0
	 hdX5zC7N9D4vDPgcjfH51xL4k/YzskpgfCU3Bj4+LofO9rRu6YeFAbnqHewfAOg8ML
	 oVxXccqUhJzWYo426AN3ezAwcnO8iT5A7F5OyUEMeITDQDfhhAMepLcppwZkA0bJXP
	 PhBwp8cVTBz4NXfnfpmDEGICKh1G1cbYwlUt7Q3LUFmcaV/BIksh39Enq6uDSoQxMT
	 eWw8R6u3e+RGg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Date: Tue, 22 Mar 2022 13:38:54 -0700
Message-Id: <20220322203854.420940-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203221337230.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203221337230.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
the test-artifacts qemu container. The minimal test simply boots Xen
(built from previous build stages) and Dom0.

The test needs a working kernel and minimal initrd for dom0. Instead of
building our own kernel and initrd, which would mean maintaining one or
two more builting scripts under automation/, we borrow a kernel and
initrd from distros.

For the kernel we pick the Debian Bullseye kernel, which has everything
we need already built-in. However, we cannot use the Debian Bullseye
initrd because it is 22MB and the large size causes QEMU to core dump.

Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
which is really minimal: just 2.5MB. Note that we cannot use the Alpine
Linux kernel because that doesn't boot on Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v4:
- improve commit message
- use Debian Bullseye kernel
- use Alpine Linux initrd
---
 automation/gitlab-ci/test.yaml         | 23 ++++++++
 automation/scripts/qemu-smoke-arm32.sh | 81 ++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ec2a2e1607..42cd725a12 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -95,6 +95,29 @@ qemu-smoke-arm64-gcc:
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
index 0000000000..d554de7939
--- /dev/null
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+
+set -ex
+
+export DEBIAN_FRONTENT=noninteractive
+apt-get -qy update
+apt-get -qy install --no-install-recommends device-tree-compiler \
+                                            curl \
+                                            cpio
+
+cd binaries
+# Use the kernel from Debian
+curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+# Use a tiny initrd based on busybox from Alpine Linux
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
+
+mkdir rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+find . | cpio -H newc -o | gzip > ../initrd.gz
+cd ..
+
+kernel=`stat -L --printf="%s" vmlinuz`
+initrd=`stat -L --printf="%s" initrd.gz`
+
+# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 1024 \
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
+        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
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
+   -m 1024 \
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
+(grep -q "^/ #" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


