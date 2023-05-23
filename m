Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15E70D57A
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 09:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538269.838130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgI-0003op-Jn; Tue, 23 May 2023 07:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538269.838130; Tue, 23 May 2023 07:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgI-0003n3-GY; Tue, 23 May 2023 07:43:42 +0000
Received: by outflank-mailman (input) for mailman id 538269;
 Tue, 23 May 2023 07:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q1MgH-0003Zx-FA
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 07:43:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8734ffaa-f93d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 09:43:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26B57150C;
 Tue, 23 May 2023 00:44:22 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 252613F762;
 Tue, 23 May 2023 00:43:36 -0700 (PDT)
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
X-Inumbo-ID: 8734ffaa-f93d-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Date: Tue, 23 May 2023 08:43:15 +0100
Message-Id: <20230523074326.3035745-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523074326.3035745-1-luca.fancellu@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Xen to handle the SVE extension, add code in cpufeature module
to handle ZCR SVE register, disable trapping SVE feature on system
boot only when SVE resources are accessed.
While there, correct coding style for the comment on coprocessor
trapping.

Now cptr_el2 is part of the domain context and it will be restored
on context switch, this is a preparation for saving the SVE context
which will be part of VFP operations, so restore it before the call
to save VFP registers.
To save an additional isb barrier, restore cptr_el2 before an
existing isb barrier and move the call for saving VFP context after
that barrier. To keep a (mostly) specularity of ctxt_switch_to()
and ctxt_switch_from(), move vfp_save_state() up in the function.

Change the KConfig entry to make ARM64_SVE symbol selectable, by
default it will be not selected.

Create sve module and sve_asm.S that contains assembly routines for
the SVE feature, this code is inspired from linux and it uses
instruction encoding to be compatible with compilers that does not
support SVE, imported instructions are documented in
README.LinuxPrimitives.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v6:
 - modified licence, add emacs block, move vfp_save_state up in the
   function, add comments to CPTR_EL2 and vfp_restore_state, don't
   use variable in init_traps(), code style fixes,
   add entries to README.LinuxPrimitives (Julien)
 - vl_to_zcr is moved into sve.c module as changes to the series led
   to its usage only inside it, remove stub for compute_max_zcr and
   rely on compiler DCE.
Changes from v5:
 - Add R-by Bertrand
Changes from v4:
 - don't use fixed types in vl_to_zcr, forgot to address that in
   v3, by mistake I changed that in patch 2, fixing now (Jan)
Changes from v3:
 - no changes
Changes from v2:
 - renamed sve_asm.S in sve-asm.S, new files should not contain
   underscore in the name (Jan)
Changes from v1:
 - Add assert to vl_to_zcr, it is never called with vl==0, but just
   to be sure it won't in the future.
Changes from RFC:
 - Moved restoring of cptr before an existing barrier (Julien)
 - Marked the feature as unsupported for now (Julien)
 - Trap and un-trap only when using SVE resources in
   compute_max_zcr() (Julien)
---
 xen/arch/arm/Kconfig                     | 10 ++--
 xen/arch/arm/README.LinuxPrimitives      |  9 ++++
 xen/arch/arm/arm64/Makefile              |  1 +
 xen/arch/arm/arm64/cpufeature.c          |  7 ++-
 xen/arch/arm/arm64/sve-asm.S             | 48 +++++++++++++++++++
 xen/arch/arm/arm64/sve.c                 | 59 ++++++++++++++++++++++++
 xen/arch/arm/cpufeature.c                |  6 ++-
 xen/arch/arm/domain.c                    | 20 +++++---
 xen/arch/arm/include/asm/arm64/sve.h     | 27 +++++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h |  1 +
 xen/arch/arm/include/asm/cpufeature.h    | 14 ++++++
 xen/arch/arm/include/asm/domain.h        |  1 +
 xen/arch/arm/include/asm/processor.h     |  2 +
 xen/arch/arm/setup.c                     |  5 +-
 xen/arch/arm/traps.c                     | 27 ++++++-----
 15 files changed, 210 insertions(+), 27 deletions(-)
 create mode 100644 xen/arch/arm/arm64/sve-asm.S
 create mode 100644 xen/arch/arm/arm64/sve.c
 create mode 100644 xen/arch/arm/include/asm/arm64/sve.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c7f..41f45d8d1203 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -112,11 +112,15 @@ config ARM64_PTR_AUTH
 	  This feature is not supported in Xen.
 
 config ARM64_SVE
-	def_bool n
+	bool "Enable Scalar Vector Extension support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
 	help
-	  Scalar Vector Extension support.
-	  This feature is not supported in Xen.
+	  Scalar Vector Extension (SVE/SVE2) support for guests.
+
+	  Please be aware that currently, enabling this feature will add latency on
+	  VM context switch between SVE enabled guests, between not-enabled SVE
+	  guests and SVE enabled guests and viceversa, compared to the time
+	  required to switch between not-enabled SVE guests.
 
 config ARM64_MTE
 	def_bool n
diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.LinuxPrimitives
index 1d53e6a898da..76c8df29e416 100644
--- a/xen/arch/arm/README.LinuxPrimitives
+++ b/xen/arch/arm/README.LinuxPrimitives
@@ -62,6 +62,15 @@ done
 linux/arch/arm64/lib/clear_page.S       xen/arch/arm/arm64/lib/clear_page.S
 linux/arch/arm64/lib/copy_page.S        unused in Xen
 
+---------------------------------------------------------------------
+
+SVE assembly macro: last sync @ v6.3.0 (last commit: 457391b03803)
+
+linux/arch/arm64/include/asm/fpsimdmacros.h   xen/arch/arm/include/asm/arm64/sve-asm.S
+
+The following macros were taken from Linux:
+    _check_general_reg, _check_num, _sve_rdvl
+
 =====================================================================
 arm32
 =====================================================================
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 28481393e98f..54ad55c75cda 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += mm.o
 obj-y += smc.o
 obj-y += smpboot.o
+obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
 obj-y += traps.o
 obj-y += vfp.o
 obj-y += vsysreg.o
diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index d9039d37b2d1..b4656ff4d80f 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -455,15 +455,11 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] = {
 	ARM64_FTR_END,
 };
 
-#if 0
-/* TODO: use this to sanitize SVE once we support it */
-
 static const struct arm64_ftr_bits ftr_zcr[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
 		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
 	ARM64_FTR_END,
 };
-#endif
 
 /*
  * Common ftr bits for a 32bit register with all hidden, strict
@@ -603,6 +599,9 @@ void update_system_features(const struct cpuinfo_arm *new)
 
 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
 
+	if ( cpu_has_sve )
+		SANITIZE_REG(zcr64, 0, zcr);
+
 	/*
 	 * Comment from Linux:
 	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
new file mode 100644
index 000000000000..4d1549344733
--- /dev/null
+++ b/xen/arch/arm/arm64/sve-asm.S
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm SVE assembly routines
+ *
+ * Copyright (C) 2022 ARM Ltd.
+ *
+ * Some macros and instruction encoding in this file are taken from linux 6.1.1,
+ * file arch/arm64/include/asm/fpsimdmacros.h, some of them are a modified
+ * version.
+ */
+
+/* Sanity-check macros to help avoid encoding garbage instructions */
+
+.macro _check_general_reg nr
+    .if (\nr) < 0 || (\nr) > 30
+        .error "Bad register number \nr."
+    .endif
+.endm
+
+.macro _check_num n, min, max
+    .if (\n) < (\min) || (\n) > (\max)
+        .error "Number \n out of range [\min,\max]"
+    .endif
+.endm
+
+/* SVE instruction encodings for non-SVE-capable assemblers */
+/* (pre binutils 2.28, all kernel capable clang versions support SVE) */
+
+/* RDVL X\nx, #\imm */
+.macro _sve_rdvl nx, imm
+    _check_general_reg \nx
+    _check_num (\imm), -0x20, 0x1f
+    .inst 0x04bf5000                \
+        | (\nx)                     \
+        | (((\imm) & 0x3f) << 5)
+.endm
+
+/* Gets the current vector register size in bytes */
+GLOBAL(sve_get_hw_vl)
+    _sve_rdvl 0, 1
+    ret
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
new file mode 100644
index 000000000000..e05ccc38a896
--- /dev/null
+++ b/xen/arch/arm/arm64/sve.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm SVE feature code
+ *
+ * Copyright (C) 2022 ARM Ltd.
+ */
+
+#include <xen/types.h>
+#include <asm/arm64/sve.h>
+#include <asm/arm64/sysregs.h>
+#include <asm/processor.h>
+#include <asm/system.h>
+
+extern unsigned int sve_get_hw_vl(void);
+
+/* Takes a vector length in bits and returns the ZCR_ELx encoding */
+static inline register_t vl_to_zcr(unsigned int vl)
+{
+    ASSERT(vl > 0);
+    return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
+}
+
+register_t compute_max_zcr(void)
+{
+    register_t cptr_bits = get_default_cptr_flags();
+    register_t zcr = vl_to_zcr(SVE_VL_MAX_BITS);
+    unsigned int hw_vl;
+
+    /* Remove trap for SVE resources */
+    WRITE_SYSREG(cptr_bits & ~HCPTR_CP(8), CPTR_EL2);
+    isb();
+
+    /*
+     * Set the maximum SVE vector length, doing that we will know the VL
+     * supported by the platform, calling sve_get_hw_vl()
+     */
+    WRITE_SYSREG(zcr, ZCR_EL2);
+
+    /*
+     * Read the maximum VL, which could be lower than what we imposed before,
+     * hw_vl contains VL in bytes, multiply it by 8 to use vl_to_zcr() later
+     */
+    hw_vl = sve_get_hw_vl() * 8U;
+
+    /* Restore CPTR_EL2 */
+    WRITE_SYSREG(cptr_bits, CPTR_EL2);
+    isb();
+
+    return vl_to_zcr(hw_vl);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index c4ec38bb2554..83b84368f6d5 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/smp.h>
 #include <xen/stop_machine.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 
 DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
@@ -143,6 +144,9 @@ void identify_cpu(struct cpuinfo_arm *c)
 
     c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
 
+    if ( cpu_has_sve )
+        c->zcr64.bits[0] = compute_max_zcr();
+
     c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
 
     c->ctr.bits[0] = READ_SYSREG(CTR_EL0);
@@ -199,7 +203,7 @@ static int __init create_guest_cpuinfo(void)
     guest_cpuinfo.pfr64.mpam = 0;
     guest_cpuinfo.pfr64.mpam_frac = 0;
 
-    /* Hide SVE as Xen does not support it */
+    /* Hide SVE by default to the guests */
     guest_cpuinfo.pfr64.sve = 0;
     guest_cpuinfo.zfr64.bits[0] = 0;
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index d8ef6501ff8e..d5ab15db46c4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -95,6 +95,9 @@ static void ctxt_switch_from(struct vcpu *p)
     /* CP 15 */
     p->arch.csselr = READ_SYSREG(CSSELR_EL1);
 
+    /* VFP */
+    vfp_save_state(p);
+
     /* Control Registers */
     p->arch.cpacr = READ_SYSREG(CPACR_EL1);
 
@@ -155,9 +158,6 @@ static void ctxt_switch_from(struct vcpu *p)
 
     /* XXX MPU */
 
-    /* VFP */
-    vfp_save_state(p);
-
     /* VGIC */
     gic_save_state(p);
 
@@ -181,9 +181,6 @@ static void ctxt_switch_to(struct vcpu *n)
     /* VGIC */
     gic_restore_state(n);
 
-    /* VFP */
-    vfp_restore_state(n);
-
     /* XXX MPU */
 
     /* Fault Status */
@@ -256,8 +253,17 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_CP32(n->arch.joscr, JOSCR);
     WRITE_CP32(n->arch.jmcr, JMCR);
 #endif
+
+    /*
+     * CPTR_EL2 needs to be written before calling vfp_restore_state, a
+     * synchronization instruction is expected after the write (isb)
+     */
+    WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
     isb();
 
+    /* VFP - call vfp_restore_state after writing on CPTR_EL2 + isb */
+    vfp_restore_state(n);
+
     /* CP 15 */
     WRITE_SYSREG(n->arch.csselr, CSSELR_EL1);
 
@@ -548,6 +554,8 @@ int arch_vcpu_create(struct vcpu *v)
 
     v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
 
+    v->arch.cptr_el2 = get_default_cptr_flags();
+
     v->arch.hcr_el2 = get_default_hcr_flags();
 
     v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
new file mode 100644
index 000000000000..c0466243c7bc
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm SVE feature code
+ *
+ * Copyright (C) 2022 ARM Ltd.
+ */
+
+#ifndef _ARM_ARM64_SVE_H
+#define _ARM_ARM64_SVE_H
+
+#define SVE_VL_MAX_BITS 2048U
+
+/* Vector length must be multiple of 128 */
+#define SVE_VL_MULTIPLE_VAL 128U
+
+register_t compute_max_zcr(void);
+
+#endif /* _ARM_ARM64_SVE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 463899951414..4cabb9eb4d5e 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -24,6 +24,7 @@
 #define ICH_EISR_EL2              S3_4_C12_C11_3
 #define ICH_ELSR_EL2              S3_4_C12_C11_5
 #define ICH_VMCR_EL2              S3_4_C12_C11_7
+#define ZCR_EL2                   S3_4_C1_C2_0
 
 #define __LR0_EL2(x)              S3_4_C12_C12_ ## x
 #define __LR8_EL2(x)              S3_4_C12_C13_ ## x
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c62cf6293fd6..03fe684b4d36 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -32,6 +32,12 @@
 #define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
 
+#ifdef CONFIG_ARM64_SVE
+#define cpu_has_sve       (boot_cpu_feature64(sve) == 1)
+#else
+#define cpu_has_sve       0
+#endif
+
 #ifdef CONFIG_ARM_32
 #define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
 #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
@@ -323,6 +329,14 @@ struct cpuinfo_arm {
         };
     } isa64;
 
+    union {
+        register_t bits[1];
+        struct {
+            unsigned long len:4;
+            unsigned long __res0:60;
+        };
+    } zcr64;
+
     struct {
         register_t bits[1];
     } zfr64;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 2a51f0ca688e..e776ee704b7d 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -190,6 +190,7 @@ struct arch_vcpu
     register_t tpidrro_el0;
 
     /* HYP configuration */
+    register_t cptr_el2;
     register_t hcr_el2;
     register_t mdcr_el2;
 
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 54f253087718..bc683334125c 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -582,6 +582,8 @@ void do_trap_guest_serror(struct cpu_user_regs *regs);
 
 register_t get_default_hcr_flags(void);
 
+register_t get_default_cptr_flags(void);
+
 /*
  * Synchronize SError unless the feature is selected.
  * This is relying on the SErrors are currently unmasked.
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6f9f4d8c8a15..4191a766767a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -135,10 +135,11 @@ static void __init processor_id(void)
            cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
-    printk("    Extensions:%s%s%s\n",
+    printk("    Extensions:%s%s%s%s\n",
            cpu_has_fp ? " FloatingPoint" : "",
            cpu_has_simd ? " AdvancedSIMD" : "",
-           cpu_has_gicv3 ? " GICv3-SysReg" : "");
+           cpu_has_gicv3 ? " GICv3-SysReg" : "",
+           cpu_has_sve ? " SVE" : "");
 
     /* Warn user if we find unknown floating-point features */
     if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index d40c331a4e9c..3393e10b52e6 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -93,6 +93,21 @@ register_t get_default_hcr_flags(void)
              HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
 }
 
+register_t get_default_cptr_flags(void)
+{
+    /*
+     * Trap all coprocessor registers (0-13) except cp10 and
+     * cp11 for VFP.
+     *
+     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
+     *
+     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
+     * RES1, i.e. they would trap whether we did this write or not.
+     */
+    return  ((HCPTR_CP_MASK & ~(HCPTR_CP(10) | HCPTR_CP(11))) |
+             HCPTR_TTA | HCPTR_TAM);
+}
+
 static enum {
     SERRORS_DIVERSE,
     SERRORS_PANIC,
@@ -135,17 +150,7 @@ void init_traps(void)
     /* Trap CP15 c15 used for implementation defined registers */
     WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
 
-    /* Trap all coprocessor registers (0-13) except cp10 and
-     * cp11 for VFP.
-     *
-     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
-     *
-     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
-     * RES1, i.e. they would trap whether we did this write or not.
-     */
-    WRITE_SYSREG((HCPTR_CP_MASK & ~(HCPTR_CP(10) | HCPTR_CP(11))) |
-                 HCPTR_TTA | HCPTR_TAM,
-                 CPTR_EL2);
+    WRITE_SYSREG(get_default_cptr_flags(), CPTR_EL2);
 
     /*
      * Configure HCR_EL2 with the bare minimum to run Xen until a guest
-- 
2.34.1


