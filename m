Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A7A97263
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963257.1354292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GKu-0002y4-3C; Tue, 22 Apr 2025 16:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963257.1354292; Tue, 22 Apr 2025 16:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GKt-0002vz-Vv; Tue, 22 Apr 2025 16:19:03 +0000
Received: by outflank-mailman (input) for mailman id 963257;
 Tue, 22 Apr 2025 16:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7GKs-0002uR-Bf
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:19:02 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb53ab8-1f95-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 18:19:00 +0200 (CEST)
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
X-Inumbo-ID: 7fb53ab8-1f95-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745338739; x=1745597939;
	bh=gMICI6B3lH/LI8Bo7Noz0rmmlJx0a8snq/+0lLRbH+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UCsXDTVoq5B31Qd6bE7qOehw7bEXQcUzWtrVOQzvvOe9RnCE4HsZdbEEf6t7L9cxJ
	 UQVpxqq885WHgWXUqLoDFM6GkR24RnrVQFnI4Vb7rVdNC1Xv/MM/ycZ2v9smmSh740
	 uCsnMIMO4Mfv/Iwpd+5XaQdFVWBVn9FLXflLZ3QrHhYU1aeZecfUJiSczAOblheLf3
	 ZCCKchQXIkuKYJsjsT4CEU6CgCzTZ6RT+w7/r2+PupglHfHMfyduAh27eGwoUWuHFR
	 teJX6Q4lFo+KYE6Hh9UN5t4SPq9HLCsOTpREpic2h5hqrzR5SPHLHk1sWzBZ0IqcX2
	 iltd8Vk+ARiLw==
Date: Tue, 22 Apr 2025 16:18:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 2/4] CI: switch x86 EFI smoke test runner to qemu-xtf.sh
Message-ID: <20250422161819.2089738-3-dmukhin@ford.com>
In-Reply-To: <20250422161819.2089738-1-dmukhin@ford.com>
References: <20250422161819.2089738-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a54f0f1eabfa8fd521b8068cfcc7d05cc1e3615b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use qemu-xtf.sh for qemu-smoke-x86-64-gcc-efi job.

Lead time is reduced a bit since not all XTF code base is built, just the
required test.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v2->v3:
- use pv64 variant for EFI job
---
 automation/gitlab-ci/test.yaml                |  2 +-
 .../include/configs/xtf-x86-64-efi-config     |  0
 automation/scripts/include/xtf-x86-64-efi     | 52 +++++++++++++++++++
 automation/scripts/qemu-smoke-x86-64-efi.sh   | 43 ---------------
 4 files changed, 53 insertions(+), 44 deletions(-)
 create mode 100644 automation/scripts/include/configs/xtf-x86-64-efi-confi=
g
 create mode 100644 automation/scripts/include/xtf-x86-64-efi
 delete mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index 3adc841335..1d89575b24 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -687,7 +687,7 @@ qemu-smoke-x86-64-clang-pvh:
 qemu-smoke-x86-64-gcc-efi:
   extends: .qemu-smoke-x86-64
   script:
-    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFIL=
E}
+    - ./automation/scripts/qemu-xtf.sh x86-64-efi pv64 example 2>&1 | tee =
${LOGFILE}
   needs:
     - debian-12-x86_64-gcc-debug
=20
diff --git a/automation/scripts/include/configs/xtf-x86-64-efi-config b/aut=
omation/scripts/include/configs/xtf-x86-64-efi-config
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts=
/include/xtf-x86-64-efi
new file mode 100644
index 0000000000..e0d821b3f6
--- /dev/null
+++ b/automation/scripts/include/xtf-x86-64-efi
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# XTF test utilities (x86_64, EFI).
+#
+
+# Arch-specific environment overrides.
+function xtf_arch_prepare()
+{
+    export FW_PREFIX=3D"${FW_PREFIX:-/usr/share/OVMF/}"
+    export QEMU_PREFIX=3D"${QEMU_PREFIX:-}"
+    export XEN_BINARY=3D"${XEN_BINARY:-${WORKDIR}/xen.efi}"
+    export XEN_CMDLINE=3D"${XEN_CMDLINE:-loglvl=3Dall noreboot console_tim=
estamps=3Dboot console=3Dcom1}"
+    export XTF_SRC_BRANCH=3D"${XTF_SRC_BRANCH:-master}"
+    export XTF_SRC_URI=3D"${XTF_SRC_URI:-https://xenbits.xen.org/git-http/=
xtf.git}"
+    export XTF_SRC_VARIANTS=3D"hvm64 pv64"
+}
+
+# Perform arch-specific XTF environment setup.
+function xtf_arch_setup()
+{
+    local esp_dir=3D"${WORKDIR}/boot-esp"
+    local efi_dir=3D"${esp_dir}/EFI/BOOT"
+
+    # Generate EFI boot environment
+    mkdir -p ${efi_dir}
+    cp ${XEN_BINARY} ${efi_dir}/BOOTX64.EFI
+    cp ${XTF_BINARY} ${efi_dir}/kernel
+
+    cat > ${efi_dir}/BOOTX64.cfg <<EOF
+[global]
+default=3Dtest
+
+[test]
+options=3D${XEN_CMDLINE}
+kernel=3Dkernel
+EOF
+
+    # NB: OVMF_CODE.fd is read-only, no need to copy
+    cp ${FW_PREFIX}OVMF_VARS.fd ${WORKDIR}
+
+    export TEST_CMD=3D"${QEMU_PREFIX}qemu-system-x86_64 \
+        -no-reboot \
+        -nographic \
+        -monitor none \
+        -serial stdio \
+        -m 512 \
+        -M q35,kernel-irqchip=3Dsplit \
+        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3D${FW_PREFIX}O=
VMF_CODE.fd \
+        -drive if=3Dpflash,format=3Draw,file=3D${WORKDIR}/OVMF_VARS.fd \
+        -drive file=3Dfat:rw:${esp_dir},media=3Ddisk,index=3D0,format=3Dra=
w \
+    "
+}
diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scrip=
ts/qemu-smoke-x86-64-efi.sh
deleted file mode 100755
index 7572722be6..0000000000
--- a/automation/scripts/qemu-smoke-x86-64-efi.sh
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/bash
-
-set -ex -o pipefail
-
-# variant should be either pv or pvh
-variant=3D$1
-
-# Clone and build XTF
-git clone https://xenbits.xen.org/git-http/xtf.git
-cd xtf && make -j$(nproc) && cd -
-
-case $variant in
-    pvh) k=3Dtest-hvm64-example    extra=3D"dom0-iommu=3Dnone dom0=3Dpvh" =
;;
-    *)   k=3Dtest-pv64-example     extra=3D ;;
-esac
-
-mkdir -p boot-esp/EFI/BOOT
-cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
-cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
-
-cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
-[global]
-default=3Dtest
-
-[test]
-options=3Dloglvl=3Dall console=3Dcom1 noreboot console_timestamps=3Dboot $=
extra
-kernel=3Dkernel
-EOF
-
-cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
-cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
-
-rm -f smoke.serial
-export TEST_CMD=3D"qemu-system-x86_64 -nographic -M q35,kernel-irqchip=3Ds=
plit \
-        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3DOVMF_CODE.fd =
\
-        -drive if=3Dpflash,format=3Draw,file=3DOVMF_VARS.fd \
-        -drive file=3Dfat:rw:boot-esp,media=3Ddisk,index=3D0,format=3Draw =
\
-        -m 512 -monitor none -serial stdio"
-
-export TEST_LOG=3D"smoke.serial"
-export PASSED=3D"Test result: SUCCESS"
-
-./automation/scripts/console.exp | sed 's/\r\+$//'
--=20
2.34.1



