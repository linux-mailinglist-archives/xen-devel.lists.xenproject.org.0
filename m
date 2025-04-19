Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7AEA940B6
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 03:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959752.1352046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5wcn-0001S3-8J; Sat, 19 Apr 2025 01:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959752.1352046; Sat, 19 Apr 2025 01:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5wcn-0001OO-59; Sat, 19 Apr 2025 01:04:05 +0000
Received: by outflank-mailman (input) for mailman id 959752;
 Sat, 19 Apr 2025 01:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GNoH=XF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5wcl-0000dd-Is
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 01:04:03 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e827358-1cba-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 03:04:02 +0200 (CEST)
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
X-Inumbo-ID: 2e827358-1cba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745024641; x=1745283841;
	bh=ZuoQGNqtJDBsakgNFkCMESjtGTtCKJIn94RMss2VMrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZPgdWvZpeXzvObcpUrHiRZ8QAeHGV4VUq1TsJTpbQQgzQjm5nbnzZMgSXzTU8jYF9
	 PGp2ozGHpRq1w1PEOnXePfz5SMXmEOehbwSniuu4oMR1RtjtqJqQ4JcDt0HuLx8seu
	 wDpBYYIWGSo6HwTvoFcx02tbPfDZg3iTsMhvLLcko5lErdPUskzVHYyTD829XlH7h1
	 AaNrhTb7pr0DbiWxHd6t3tBDDBaHBIqj8hLu7GvPeqlFa3+G80fIc68lO8FA6Bm6Ja
	 BZ3pnuCmSeU48JP2ADZj/QgMQ3aFM9GTXwjnmBwVU/9GUEQXkemXCIrz5xHCb1eVTN
	 C3YxyslR5g5Qw==
Date: Sat, 19 Apr 2025 01:03:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 3/4] CI: switch arm64 XTF test runner to qemu-xtf.sh
Message-ID: <20250419010319.2572518-4-dmukhin@ford.com>
In-Reply-To: <20250419010319.2572518-1-dmukhin@ford.com>
References: <20250419010319.2572518-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: af5b6be86f9516bfd0d40e940a408460ceb552fb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Hook arm64 QEMU configuration to qemu-xtf.sh and use new script in arm64 CI
jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v2:
- removed TOP
- dropped XEN_CONSOLE in favor of XEN_CMDLINE
- I kept Stefano's R-b since the change was trivial
---
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/.gitignore                 |  3 +
 .../scripts/include/configs/xtf-arm64-config  |  2 +
 automation/scripts/include/xtf-arm64          | 81 +++++++++++++++++++
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 ----------------
 5 files changed, 88 insertions(+), 70 deletions(-)
 create mode 100644 automation/scripts/include/configs/xtf-arm64-config
 create mode 100644 automation/scripts/include/xtf-arm64
 delete mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index ca1e4eb528..d6e4a0a622 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -571,7 +571,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
 qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1=
 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 =
| tee ${LOGFILE}
   needs:
     - alpine-3.18-gcc-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
@@ -579,7 +579,7 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
 qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
   extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1=
 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 =
| tee ${LOGFILE}
   needs:
     - alpine-3.18-gcc-debug-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitignore
index 2f2d6e1ebd..f853da4d89 100644
--- a/automation/scripts/.gitignore
+++ b/automation/scripts/.gitignore
@@ -1,6 +1,9 @@
 !include
=20
 binaries
+imagebuilder
 smoke.serial
 xen
 xtf*/
+
+*.rom
diff --git a/automation/scripts/include/configs/xtf-arm64-config b/automati=
on/scripts/include/configs/xtf-arm64-config
new file mode 100644
index 0000000000..9942740927
--- /dev/null
+++ b/automation/scripts/include/configs/xtf-arm64-config
@@ -0,0 +1,2 @@
+CONFIG_GICV2=3Dy
+CONFIG_SBSA_UART=3Dy
diff --git a/automation/scripts/include/xtf-arm64 b/automation/scripts/incl=
ude/xtf-arm64
new file mode 100644
index 0000000000..1a318b7aa0
--- /dev/null
+++ b/automation/scripts/include/xtf-arm64
@@ -0,0 +1,81 @@
+#!/bin/bash
+#
+# XTF test utilities (arm64).
+#
+
+# Arch-specific environment overrides.
+function xtf_arch_prepare()
+{
+    export FW_PREFIX=3D"${FW_PREFIX:-/usr/lib/u-boot/qemu_arm64/}"
+    export QEMU_PREFIX=3D"${QEMU_PREFIX:-${WORKDIR}/}"
+    export XEN_BINARY=3D"${XEN_BINARY:-${WORKDIR}/xen}"
+    export XEN_CMDLINE=3D"${XEN_CMDLINE:-loglvl=3Dall noreboot console_tim=
estamps=3Dboot console=3Ddtuart}"
+    export XTF_SRC_BRANCH=3D"${XTF_SRC_BRANCH:-xtf-arm}"
+    export XTF_SRC_URI=3D"${XTF_SRC_URI:-https://gitlab.com/xen-project/fu=
sa/xtf.git}"
+    export XTF_SRC_VARIANTS=3D"mmu64le"
+}
+
+# Perform arch-specific XTF environment setup.
+function xtf_arch_setup()
+{
+    # QEMU looks for "efi-virtio.rom" even if it is unneeded
+    curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio=
.rom
+
+    # Crude check for local testing
+    if [ ! -d imagebuilder ]; then
+        git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.gi=
t
+    fi
+
+    cat > ${WORKDIR}/config <<EOF
+MEMORY_START=3D"0x40000000"
+MEMORY_END=3D"0xC0000000"
+
+XEN=3D"xen"
+DEVICE_TREE=3D"virt-gicv2.dtb"
+
+XEN_CMD=3D"${XEN_CMDLINE}"
+
+DOMU_KERNEL[0]=3D"xtf-test"
+DOMU_MEM[0]=3D"128"
+
+NUM_DOMUS=3D1
+
+LOAD_CMD=3D"tftpb"
+UBOOT_SOURCE=3D"boot.source"
+UBOOT_SCRIPT=3D"boot.scr"
+EOF
+    cp ${XTF_BINARY} ${WORKDIR}/xtf-test
+
+    # Generate virt-gicv2.dtb
+    ${WORKDIR}/qemu-system-aarch64 \
+        -machine virtualization=3Dtrue \
+        -cpu cortex-a57 \
+        -machine type=3Dvirt \
+        -m 2048 \
+        -smp 2 \
+        -display none \
+        -machine dumpdtb=3D${WORKDIR}/virt-gicv2.dtb
+
+    # Generate U-Boot environment
+    bash -x imagebuilder/scripts/uboot-script-gen \
+        -t tftp \
+        -d ${WORKDIR}/ \
+        -c ${WORKDIR}/config
+
+    export TEST_CMD=3D"${QEMU_PREFIX}qemu-system-aarch64 \
+        -machine virtualization=3Dtrue \
+        -cpu cortex-a57 \
+        -machine type=3Dvirt \
+        -no-reboot \
+        -nographic \
+        -monitor none \
+        -serial stdio \
+        -m 2048 \
+        -smp 2 \
+        -device virtio-net-pci,netdev=3Dn0 \
+        -netdev user,id=3Dn0,tftp=3D${WORKDIR} \
+        -bios ${FW_PREFIX}u-boot.bin \
+    "
+
+    export UBOOT_CMD=3D"virtio scan; dhcp; tftpb 0x40000000 boot.scr; sour=
ce 0x40000000"
+}
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scr=
ipts/qemu-xtf-dom0less-arm64.sh
deleted file mode 100755
index 436f460c3c..0000000000
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ /dev/null
@@ -1,68 +0,0 @@
-#!/bin/bash
-
-set -ex -o pipefail
-
-# Name of the XTF test
-xtf_test=3D$1
-
-# Message returned by XTF in case of success
-passed=3D"Test result: SUCCESS"
-
-# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-./binaries/qemu-system-aarch64 \
-   -machine virtualization=3Dtrue \
-   -cpu cortex-a57 -machine type=3Dvirt \
-   -m 2048 -smp 2 -display none \
-   -machine dumpdtb=3Dbinaries/virt-gicv2.dtb
-
-# XTF
-# Build a single XTF test passed as a first parameter to the script.
-# Build XTF with GICv2 support to match Qemu configuration and with SBSA U=
ART
-# support, so that the test will use an emulated UART for printing message=
s.
-# This will allow us to run the test on both debug and non-debug Xen build=
s.
-rm -rf xtf
-git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
-make -C xtf TESTS=3Dtests/${xtf_test} CONFIG_SBSA_UART=3Dy CONFIG_GICV2=3D=
y -j$(nproc)
-cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
-
-# ImageBuilder
-echo 'MEMORY_START=3D"0x40000000"
-MEMORY_END=3D"0xC0000000"
-
-XEN=3D"xen"
-DEVICE_TREE=3D"virt-gicv2.dtb"
-
-XEN_CMD=3D"console=3Ddtuart console_timestamps=3Dboot"
-
-DOMU_KERNEL[0]=3D"xtf-test"
-DOMU_MEM[0]=3D"128"
-
-NUM_DOMUS=3D1
-
-LOAD_CMD=3D"tftpb"
-UBOOT_SOURCE=3D"boot.source"
-UBOOT_SCRIPT=3D"boot.scr"' > binaries/config
-
-rm -rf imagebuilder
-git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
-bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binarie=
s/config
-
-# Run the test
-rm -f smoke.serial
-export TEST_CMD=3D"./binaries/qemu-system-aarch64 \
-    -machine virtualization=3Dtrue \
-    -cpu cortex-a57 -machine type=3Dvirt \
-    -m 2048 -monitor none -serial stdio \
-    -smp 2 \
-    -no-reboot \
-    -device virtio-net-pci,netdev=3Dn0 \
-    -netdev user,id=3Dn0,tftp=3Dbinaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
-
-export UBOOT_CMD=3D"virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0=
x40000000"
-export BOOT_MSG=3D"Latest ChangeSet: "
-export TEST_LOG=3D"smoke.serial"
-export PASSED=3D"${passed}"
-
-./automation/scripts/console.exp | sed 's/\r\+$//'
--=20
2.34.1



