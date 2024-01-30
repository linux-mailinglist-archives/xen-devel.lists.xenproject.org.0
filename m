Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBDA842FAD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 23:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673701.1048147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUwag-0005I0-DO; Tue, 30 Jan 2024 22:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673701.1048147; Tue, 30 Jan 2024 22:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUwag-0005HH-9j; Tue, 30 Jan 2024 22:28:26 +0000
Received: by outflank-mailman (input) for mailman id 673701;
 Tue, 30 Jan 2024 22:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUwae-00052C-QC
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 22:28:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8d247e-bfbe-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 23:28:22 +0100 (CET)
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
X-Inumbo-ID: df8d247e-bfbe-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706653702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bxThfDoIJYYf/WUb/HpXil0IxNtiXP9us+MkCQrsKWI=;
  b=Gj/8xa+eF4W9Fw0GbdC4FPLqEg1a+GLBoLxTeEXD+sxQ+nC0wNI3DL61
   gwwmfWyHfD4+2Xv/y43OpPbCSccFUbZ4eCa6zYkGjAfkciD34FsV3gldr
   7yK5EbBe8RIPdezUYgsv1FyXvaaqpeSh0RV43vzOPuVBPn9vi+ly0qDG+
   8=;
X-CSE-ConnectionGUID: 8bC+uzs5RFebPMbp/NHfJw==
X-CSE-MsgGUID: faFS1O21T0m4er0q9ijryQ==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132570056
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WNFBra7SyXPCNSrfcZmO/AxRtJ3HchMFZxGqfqrLsTDasY5as4F+v
 jQcUWyBOPyOYzP0cotybIy+oU0BsZaGxoJkSgE6pC5hHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34ZwehBtC5gZiPakQ5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 fYzay0fdU25qe+8+JexUq5KpsoBM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxRzF+
 TqeojqR7hcyOtWx8mOiqCuQ3uqTkDmjQdMTFqepz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrncNFnF6Kki8zvLhv5y
 TuKsSsWiq0aiIgA0KDT1VrKmS62r57FCAs8/BzKX3mN5xl8IoWiYuSA7FnQ7f9EaoGDXFSFl
 HEBl46V6+VmJZiJlTeRSeQXWr+z7vCOMSb0nlJkWZIm8lyF8Xmpd5Fd+zF6KUJgNO4LfDboZ
 AnYvgY5zJRUOn2tb6N+fYOqI8svxKnkU9/iU5j8ddNIa4NtfRSG+wl0bFaM2Hrglkctl6wyI
 5adfoCnCnNyNEh85GPoHaFHi+Ztn31vgzyLLXzm8/i5+eqUTz2IW6xYCnWDZNgc5rvDhiXb0
 ckKYqNm1C5jvP3Cjjj/qNFLcw5TfClkWfjLR9prmvlvyzeK+V3N6NeLmNvNg6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8g9SxlYXR0Zgj0gyZLjWOTAEA3LsVfQFXa3LY7ka4co
 wctJa1s/cijuhyYom9APPERXaRpdQixhBLmAhdJlAMXJsY6LySQo4+MQ+ca3HVWZsZBnZdk8
 uLIO8KyacZrejmO++6MMaz/kAjv5Cl1dSAbdxKgH+S/sX7EqOBCQxEdRNdtSy3QAX0vHgen6
 js=
IronPort-HdrOrdr: A9a23:zdpurarB/drJ2P7HQz+7058aV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AlrEi82uJzxAJL1w9XFVUGc6G6It1eFae0WXLfnW?=
 =?us-ascii?q?WBGxRbbeNDnmw9oF7xp8=3D?=
X-Talos-MUID: 9a23:byE9KgoiuEcu6S05KKwezz9rGvwxxP73NBgIzZgc49DVNC5qKg7I2Q==
X-IronPort-AV: E=Sophos;i="6.05,230,1701147600"; 
   d="scan'208";a="132570056"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen/*/asm-offset: Fix bad copy&paste from x86
Date: Tue, 30 Jan 2024 22:28:08 +0000
Message-ID: <20240130222808.106006-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All architectures have copy&pasted bad logic from x86.

OFFSET() having a trailing semi-colon within the macro expansion can be a
problematic pattern.  It's benign in this case, but fix it anyway.

Perform style fixes for the other macros, and tame the mess of BLANK()
position to be consistent (one BLANK() after each block) so the intermediate
form is legible too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

Why does PPC have a local copy of ilog2() here?  Especially as it's not used,
and there's a perfectly good one in <xen/bitops.h>
---
 xen/arch/arm/arm32/asm-offsets.c     | 13 +++++++------
 xen/arch/arm/arm64/asm-offsets.c     | 12 +++++++-----
 xen/arch/ppc/ppc64/asm-offsets.c     | 11 +++++++----
 xen/arch/riscv/riscv64/asm-offsets.c |  8 ++++----
 xen/arch/x86/x86_64/asm-offsets.c    |  7 ++++---
 5 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index 05c692bb2822..f19523d741af 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -15,11 +15,11 @@
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
-                  : : "i" (_val) )
+                  :: "i" (_val))
 #define BLANK()                                                            \
-    asm volatile ( "\n.ascii\"==><==\"" : : )
+    asm volatile ("\n.ascii\"==><==\"")
 #define OFFSET(_sym, _str, _mem)                                           \
-    DEFINE(_sym, offsetof(_str, _mem));
+    DEFINE(_sym, offsetof(_str, _mem))
 
 void __dummy__(void)
 {
@@ -62,18 +62,19 @@ void __dummy__(void)
    BLANK();
 
    DEFINE(CPUINFO_sizeof, sizeof(struct cpu_info));
+   BLANK();
 
    OFFSET(VCPU_arch_saved_context, struct vcpu, arch.saved_context);
-
    BLANK();
+
    DEFINE(PROCINFO_sizeof, sizeof(struct proc_info_list));
    OFFSET(PROCINFO_cpu_val, struct proc_info_list, cpu_val);
    OFFSET(PROCINFO_cpu_mask, struct proc_info_list, cpu_mask);
    OFFSET(PROCINFO_cpu_init, struct proc_info_list, cpu_init);
-
    BLANK();
-   OFFSET(INITINFO_stack, struct init_info, stack);
 
+   OFFSET(INITINFO_stack, struct init_info, stack);
+   BLANK();
 }
 
 /*
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 7adb67a1b81a..8112b9243d39 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -15,11 +15,11 @@
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
-                  : : "i" (_val) )
+                  :: "i" (_val))
 #define BLANK()                                                            \
-    asm volatile ( "\n.ascii\"==><==\"" : : )
+    asm volatile ("\n.ascii\"==><==\"")
 #define OFFSET(_sym, _str, _mem)                                           \
-    DEFINE(_sym, offsetof(_str, _mem));
+    DEFINE(_sym, offsetof(_str, _mem))
 
 void __dummy__(void)
 {
@@ -48,13 +48,14 @@ void __dummy__(void)
 
    DEFINE(CPUINFO_sizeof, sizeof(struct cpu_info));
    OFFSET(CPUINFO_flags, struct cpu_info, flags);
+   BLANK();
 
    OFFSET(VCPU_arch_saved_context, struct vcpu, arch.saved_context);
-
    BLANK();
-   OFFSET(INITINFO_stack, struct init_info, stack);
 
+   OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
+
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
@@ -66,6 +67,7 @@ void __dummy__(void)
    OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
    OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
    OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
+   BLANK();
 }
 
 /*
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
index 634d7260e3a4..24065578cbdb 100644
--- a/xen/arch/ppc/ppc64/asm-offsets.c
+++ b/xen/arch/ppc/ppc64/asm-offsets.c
@@ -9,12 +9,12 @@
 #include <asm/boot.h>
 
 #define DEFINE(_sym, _val)                                                  \
-    asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
-                   : : "i" (_val) )
+    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""  \
+                  : : "i" (_val))
 #define BLANK()                                                             \
-    asm volatile ( "\n.ascii\"==><==\"" : : )
+    asm volatile ("\n.ascii\"==><==\"")
 #define OFFSET(_sym, _str, _mem)                                            \
-    DEFINE(_sym, offsetof(_str, _mem));
+    DEFINE(_sym, offsetof(_str, _mem))
 
 /* base-2 logarithm */
 #define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
@@ -29,6 +29,7 @@ void __dummy__(void)
 
     DEFINE(GPR_WIDTH, sizeof(unsigned long));
     DEFINE(FPR_WIDTH, sizeof(double));
+    BLANK();
 
     OFFSET(UREGS_gprs, struct cpu_user_regs, gprs);
     OFFSET(UREGS_r0, struct cpu_user_regs, gprs[0]);
@@ -48,9 +49,11 @@ void __dummy__(void)
     OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
     OFFSET(UREGS_entry_vector, struct cpu_user_regs, entry_vector);
     DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
+    BLANK();
 
     OFFSET(OPAL_base, struct opal, base);
     OFFSET(OPAL_entry, struct opal, entry);
+    BLANK();
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index d632b75c2acb..ed74b11bf654 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -5,15 +5,14 @@
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
-                  : : "i" (_val) )
+                  :: "i" (_val))
 #define BLANK()                                                            \
-    asm volatile ( "\n.ascii\"==><==\"" : : )
+    asm volatile ("\n.ascii\"==><==\"")
 #define OFFSET(_sym, _str, _mem)                                           \
-    DEFINE(_sym, offsetof(_str, _mem));
+    DEFINE(_sym, offsetof(_str, _mem))
 
 void asm_offsets(void)
 {
-    BLANK();
     DEFINE(CPU_USER_REGS_SIZE, sizeof(struct cpu_user_regs));
     OFFSET(CPU_USER_REGS_ZERO, struct cpu_user_regs, zero);
     OFFSET(CPU_USER_REGS_RA, struct cpu_user_regs, ra);
@@ -50,4 +49,5 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
     OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
+    BLANK();
 }
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index f9546ec60b60..a4931c4f7eb2 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -18,11 +18,11 @@
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
-                  : : "i" (_val) )
+                  :: "i" (_val))
 #define BLANK()                                                            \
-    asm volatile ( "\n.ascii\"==><==\"" : : )
+    asm volatile ("\n.ascii\"==><==\"")
 #define OFFSET(_sym, _str, _mem)                                           \
-    DEFINE(_sym, offsetof(_str, _mem));
+    DEFINE(_sym, offsetof(_str, _mem))
 
 void __dummy__(void)
 {
@@ -180,4 +180,5 @@ void __dummy__(void)
     BLANK();
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
+    BLANK();
 }
-- 
2.30.2


