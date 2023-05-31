Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9871780D
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541556.844475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GCB-0006S1-HN; Wed, 31 May 2023 07:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541556.844475; Wed, 31 May 2023 07:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GCB-0006Ke-8U; Wed, 31 May 2023 07:24:35 +0000
Received: by outflank-mailman (input) for mailman id 541556;
 Wed, 31 May 2023 07:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKzP=BU=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q4GC9-0005os-Ey
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:24:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2e9ccefd-ff84-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 09:24:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D2FF16F2;
 Wed, 31 May 2023 00:25:15 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BEBA3F663;
 Wed, 31 May 2023 00:24:29 -0700 (PDT)
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
X-Inumbo-ID: 2e9ccefd-ff84-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 05/12] arm/sve: save/restore SVE context switch
Date: Wed, 31 May 2023 08:24:06 +0100
Message-Id: <20230531072413.868673-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531072413.868673-1-luca.fancellu@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save/restore context switch for SVE, allocate memory to contain
the Z0-31 registers whose length is maximum 2048 bits each and
FFR who can be maximum 256 bits, the allocated memory depends on
how many bits is the vector length for the domain and how many bits
are supported by the platform.

Save P0-15 whose length is maximum 256 bits each, in this case the
memory used is from the fpregs field in struct vfp_state,
because V0-31 are part of Z0-31 and this space would have been
unused for SVE domain otherwise.

Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
creation given the requested vector length and restore it on
context switch, save/restore ZCR_EL1 value as well.

List import macros from Linux in README.LinuxPrimitives.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v7:
 - Fixed comments for sve_context_init and sve_context_free,
   protect arch.vfp.sve_zreg_ctx_end, arch.zcr_el1, arch.zcr_el2
   with ifdefs. (Julien)
 - Given the changes, dropped Bertrand's R-by
Changes from v6:
 - Add comment for explain why sve_save/sve_load are different from
   Linux, add macros in xen/arch/arm/README.LinuxPrimitives (Julien)
 - Add comments in sve_context_init and sve_context_free, handle the
   case where sve_zreg_ctx_end is NULL, move setting of v->arch.zcr_el2
   in sve_context_init (Julien)
 - remove stubs for sve_context_* and sve_save_* and rely on compiler
   DCE (Jan)
 - Add comments for sve_save_ctx/sve_load_ctx (Julien)
Changes from v5:
 - use XFREE instead of xfree, keep the headers (Julien)
 - Avoid math computation for every save/restore, store the computation
   in struct vfp_state once (Bertrand)
 - protect access to v->domain->arch.sve_vl inside arch_vcpu_create now
   that sve_vl is available only on arm64
Changes from v4:
 - No changes
Changes from v3:
 - don't use fixed len types when not needed (Jan)
 - now VL is an encoded value, decode it before using.
Changes from v2:
 - No changes
Changes from v1:
 - No changes
Changes from RFC:
 - Moved zcr_el2 field introduction in this patch, restore its
   content inside sve_restore_state function. (Julien)
---
 xen/arch/arm/README.LinuxPrimitives      |   4 +-
 xen/arch/arm/arm64/sve-asm.S             | 147 +++++++++++++++++++++++
 xen/arch/arm/arm64/sve.c                 |  91 ++++++++++++++
 xen/arch/arm/arm64/vfp.c                 |  79 ++++++------
 xen/arch/arm/domain.c                    |   6 +
 xen/arch/arm/include/asm/arm64/sve.h     |   4 +
 xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
 xen/arch/arm/include/asm/arm64/vfp.h     |  16 +++
 xen/arch/arm/include/asm/domain.h        |   5 +
 9 files changed, 320 insertions(+), 35 deletions(-)

diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.LinuxPrimitives
index 76c8df29e416..301c0271bbe4 100644
--- a/xen/arch/arm/README.LinuxPrimitives
+++ b/xen/arch/arm/README.LinuxPrimitives
@@ -69,7 +69,9 @@ SVE assembly macro: last sync @ v6.3.0 (last commit: 457391b03803)
 linux/arch/arm64/include/asm/fpsimdmacros.h   xen/arch/arm/include/asm/arm64/sve-asm.S
 
 The following macros were taken from Linux:
-    _check_general_reg, _check_num, _sve_rdvl
+    _check_general_reg, _check_num, _sve_rdvl, __for, _for, _sve_check_zreg,
+    _sve_check_preg, _sve_str_v, _sve_ldr_v, _sve_str_p, _sve_ldr_p, _sve_rdffr,
+    _sve_wrffr
 
 =====================================================================
 arm32
diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
index 4d1549344733..59dbefbbb252 100644
--- a/xen/arch/arm/arm64/sve-asm.S
+++ b/xen/arch/arm/arm64/sve-asm.S
@@ -17,6 +17,18 @@
     .endif
 .endm
 
+.macro _sve_check_zreg znr
+    .if (\znr) < 0 || (\znr) > 31
+        .error "Bad Scalable Vector Extension vector register number \znr."
+    .endif
+.endm
+
+.macro _sve_check_preg pnr
+    .if (\pnr) < 0 || (\pnr) > 15
+        .error "Bad Scalable Vector Extension predicate register number \pnr."
+    .endif
+.endm
+
 .macro _check_num n, min, max
     .if (\n) < (\min) || (\n) > (\max)
         .error "Number \n out of range [\min,\max]"
@@ -26,6 +38,54 @@
 /* SVE instruction encodings for non-SVE-capable assemblers */
 /* (pre binutils 2.28, all kernel capable clang versions support SVE) */
 
+/* STR (vector): STR Z\nz, [X\nxbase, #\offset, MUL VL] */
+.macro _sve_str_v nz, nxbase, offset=0
+    _sve_check_zreg \nz
+    _check_general_reg \nxbase
+    _check_num (\offset), -0x100, 0xff
+    .inst 0xe5804000                \
+        | (\nz)                     \
+        | ((\nxbase) << 5)          \
+        | (((\offset) & 7) << 10)   \
+        | (((\offset) & 0x1f8) << 13)
+.endm
+
+/* LDR (vector): LDR Z\nz, [X\nxbase, #\offset, MUL VL] */
+.macro _sve_ldr_v nz, nxbase, offset=0
+    _sve_check_zreg \nz
+    _check_general_reg \nxbase
+    _check_num (\offset), -0x100, 0xff
+    .inst 0x85804000                \
+        | (\nz)                     \
+        | ((\nxbase) << 5)          \
+        | (((\offset) & 7) << 10)   \
+        | (((\offset) & 0x1f8) << 13)
+.endm
+
+/* STR (predicate): STR P\np, [X\nxbase, #\offset, MUL VL] */
+.macro _sve_str_p np, nxbase, offset=0
+    _sve_check_preg \np
+    _check_general_reg \nxbase
+    _check_num (\offset), -0x100, 0xff
+    .inst 0xe5800000                \
+        | (\np)                     \
+        | ((\nxbase) << 5)          \
+        | (((\offset) & 7) << 10)   \
+        | (((\offset) & 0x1f8) << 13)
+.endm
+
+/* LDR (predicate): LDR P\np, [X\nxbase, #\offset, MUL VL] */
+.macro _sve_ldr_p np, nxbase, offset=0
+    _sve_check_preg \np
+    _check_general_reg \nxbase
+    _check_num (\offset), -0x100, 0xff
+    .inst 0x85800000                \
+        | (\np)                     \
+        | ((\nxbase) << 5)          \
+        | (((\offset) & 7) << 10)   \
+        | (((\offset) & 0x1f8) << 13)
+.endm
+
 /* RDVL X\nx, #\imm */
 .macro _sve_rdvl nx, imm
     _check_general_reg \nx
@@ -35,11 +95,98 @@
         | (((\imm) & 0x3f) << 5)
 .endm
 
+/* RDFFR (unpredicated): RDFFR P\np.B */
+.macro _sve_rdffr np
+    _sve_check_preg \np
+    .inst 0x2519f000                \
+        | (\np)
+.endm
+
+/* WRFFR P\np.B */
+.macro _sve_wrffr np
+    _sve_check_preg \np
+    .inst 0x25289000                \
+        | ((\np) << 5)
+.endm
+
+.macro __for from:req, to:req
+    .if (\from) == (\to)
+        _for__body %\from
+    .else
+        __for %\from, %((\from) + ((\to) - (\from)) / 2)
+        __for %((\from) + ((\to) - (\from)) / 2 + 1), %\to
+    .endif
+.endm
+
+.macro _for var:req, from:req, to:req, insn:vararg
+    .macro _for__body \var:req
+        .noaltmacro
+        \insn
+        .altmacro
+    .endm
+
+    .altmacro
+    __for \from, \to
+    .noaltmacro
+
+    .purgem _for__body
+.endm
+
+/*
+ * sve_save and sve_load are different from the Linux version because the
+ * buffers to save the context are different from Xen and for example Linux
+ * is using this macro to save/restore also fpsr and fpcr while we do it in C
+ */
+
+.macro sve_save nxzffrctx, nxpctx, save_ffr
+    _for n, 0, 31, _sve_str_v \n, \nxzffrctx, \n - 32
+    _for n, 0, 15, _sve_str_p \n, \nxpctx, \n
+        cbz \save_ffr, 1f
+        _sve_rdffr 0
+        _sve_str_p 0, \nxzffrctx
+        _sve_ldr_p 0, \nxpctx
+        b 2f
+1:
+        str xzr, [x\nxzffrctx]      // Zero out FFR
+2:
+.endm
+
+.macro sve_load nxzffrctx, nxpctx, restore_ffr
+    _for n, 0, 31, _sve_ldr_v \n, \nxzffrctx, \n - 32
+        cbz \restore_ffr, 1f
+        _sve_ldr_p 0, \nxzffrctx
+        _sve_wrffr 0
+1:
+    _for n, 0, 15, _sve_ldr_p \n, \nxpctx, \n
+.endm
+
 /* Gets the current vector register size in bytes */
 GLOBAL(sve_get_hw_vl)
     _sve_rdvl 0, 1
     ret
 
+/*
+ * Save the SVE context
+ *
+ * x0 - pointer to buffer for Z0-31 + FFR
+ * x1 - pointer to buffer for P0-15
+ * x2 - Save FFR if non-zero
+ */
+GLOBAL(sve_save_ctx)
+    sve_save 0, 1, x2
+    ret
+
+/*
+ * Load the SVE context
+ *
+ * x0 - pointer to buffer for Z0-31 + FFR
+ * x1 - pointer to buffer for P0-15
+ * x2 - Restore FFR if non-zero
+ */
+GLOBAL(sve_load_ctx)
+    sve_load 0, 1, x2
+    ret
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index a9144e48ef6b..56d8f27ea26a 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
+#include <xen/sizes.h>
 #include <xen/types.h>
 #include <asm/arm64/sve.h>
 #include <asm/arm64/sysregs.h>
@@ -14,6 +15,25 @@
 
 extern unsigned int sve_get_hw_vl(void);
 
+/*
+ * Save the SVE context
+ *
+ * sve_ctx - pointer to buffer for Z0-31 + FFR
+ * pregs - pointer to buffer for P0-15
+ * save_ffr - Save FFR if non-zero
+ */
+extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
+
+/*
+ * Load the SVE context
+ *
+ * sve_ctx - pointer to buffer for Z0-31 + FFR
+ * pregs - pointer to buffer for P0-15
+ * restore_ffr - Restore FFR if non-zero
+ */
+extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
+                         int restore_ffr);
+
 /* Takes a vector length in bits and returns the ZCR_ELx encoding */
 static inline register_t vl_to_zcr(unsigned int vl)
 {
@@ -21,6 +41,21 @@ static inline register_t vl_to_zcr(unsigned int vl)
     return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
 }
 
+static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
+{
+    /*
+     * Z0-31 registers size in bytes is computed from VL that is in bits, so VL
+     * in bytes is VL/8.
+     */
+    return (vl / 8U) * 32U;
+}
+
+static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
+{
+    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
+    return (vl / 64U);
+}
+
 register_t compute_max_zcr(void)
 {
     register_t cptr_bits = get_default_cptr_flags();
@@ -61,6 +96,62 @@ unsigned int get_sys_vl_len(void)
             SVE_VL_MULTIPLE_VAL;
 }
 
+int sve_context_init(struct vcpu *v)
+{
+    unsigned int sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
+    uint64_t *ctx = _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
+                             sve_ffrreg_ctx_size(sve_vl_bits),
+                             L1_CACHE_BYTES);
+
+    if ( !ctx )
+        return -ENOMEM;
+
+    /*
+     * Points to the end of Z0-Z31 memory, just before FFR memory, to be kept in
+     * sync with sve_context_free().
+     */
+    v->arch.vfp.sve_zreg_ctx_end = ctx +
+        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
+
+    v->arch.zcr_el2 = vl_to_zcr(sve_vl_bits);
+
+    return 0;
+}
+
+void sve_context_free(struct vcpu *v)
+{
+    unsigned int sve_vl_bits;
+
+    if ( v->arch.vfp.sve_zreg_ctx_end )
+        return;
+
+    sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
+
+    /*
+     * Currenly points to the end of Z0-Z31 memory which is not the start of
+     * the buffer. To be kept in sync with the sve_context_init().
+     */
+    v->arch.vfp.sve_zreg_ctx_end -=
+        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
+
+    XFREE(v->arch.vfp.sve_zreg_ctx_end);
+}
+
+void sve_save_state(struct vcpu *v)
+{
+    v->arch.zcr_el1 = READ_SYSREG(ZCR_EL1);
+
+    sve_save_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
+}
+
+void sve_restore_state(struct vcpu *v)
+{
+    WRITE_SYSREG(v->arch.zcr_el1, ZCR_EL1);
+    WRITE_SYSREG(v->arch.zcr_el2, ZCR_EL2);
+
+    sve_load_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index 47885e76baae..2d0d7c2e6ddb 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -2,29 +2,35 @@
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 #include <asm/vfp.h>
+#include <asm/arm64/sve.h>
 
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
         return;
 
-    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
-                 "stp q2, q3, [%1, #16 * 2]\n\t"
-                 "stp q4, q5, [%1, #16 * 4]\n\t"
-                 "stp q6, q7, [%1, #16 * 6]\n\t"
-                 "stp q8, q9, [%1, #16 * 8]\n\t"
-                 "stp q10, q11, [%1, #16 * 10]\n\t"
-                 "stp q12, q13, [%1, #16 * 12]\n\t"
-                 "stp q14, q15, [%1, #16 * 14]\n\t"
-                 "stp q16, q17, [%1, #16 * 16]\n\t"
-                 "stp q18, q19, [%1, #16 * 18]\n\t"
-                 "stp q20, q21, [%1, #16 * 20]\n\t"
-                 "stp q22, q23, [%1, #16 * 22]\n\t"
-                 "stp q24, q25, [%1, #16 * 24]\n\t"
-                 "stp q26, q27, [%1, #16 * 26]\n\t"
-                 "stp q28, q29, [%1, #16 * 28]\n\t"
-                 "stp q30, q31, [%1, #16 * 30]\n\t"
-                 : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
+    if ( is_sve_domain(v->domain) )
+        sve_save_state(v);
+    else
+    {
+        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
+                     "stp q2, q3, [%1, #16 * 2]\n\t"
+                     "stp q4, q5, [%1, #16 * 4]\n\t"
+                     "stp q6, q7, [%1, #16 * 6]\n\t"
+                     "stp q8, q9, [%1, #16 * 8]\n\t"
+                     "stp q10, q11, [%1, #16 * 10]\n\t"
+                     "stp q12, q13, [%1, #16 * 12]\n\t"
+                     "stp q14, q15, [%1, #16 * 14]\n\t"
+                     "stp q16, q17, [%1, #16 * 16]\n\t"
+                     "stp q18, q19, [%1, #16 * 18]\n\t"
+                     "stp q20, q21, [%1, #16 * 20]\n\t"
+                     "stp q22, q23, [%1, #16 * 22]\n\t"
+                     "stp q24, q25, [%1, #16 * 24]\n\t"
+                     "stp q26, q27, [%1, #16 * 26]\n\t"
+                     "stp q28, q29, [%1, #16 * 28]\n\t"
+                     "stp q30, q31, [%1, #16 * 30]\n\t"
+                     : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
+    }
 
     v->arch.vfp.fpsr = READ_SYSREG(FPSR);
     v->arch.vfp.fpcr = READ_SYSREG(FPCR);
@@ -37,23 +43,28 @@ void vfp_restore_state(struct vcpu *v)
     if ( !cpu_has_fp )
         return;
 
-    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
-                 "ldp q2, q3, [%1, #16 * 2]\n\t"
-                 "ldp q4, q5, [%1, #16 * 4]\n\t"
-                 "ldp q6, q7, [%1, #16 * 6]\n\t"
-                 "ldp q8, q9, [%1, #16 * 8]\n\t"
-                 "ldp q10, q11, [%1, #16 * 10]\n\t"
-                 "ldp q12, q13, [%1, #16 * 12]\n\t"
-                 "ldp q14, q15, [%1, #16 * 14]\n\t"
-                 "ldp q16, q17, [%1, #16 * 16]\n\t"
-                 "ldp q18, q19, [%1, #16 * 18]\n\t"
-                 "ldp q20, q21, [%1, #16 * 20]\n\t"
-                 "ldp q22, q23, [%1, #16 * 22]\n\t"
-                 "ldp q24, q25, [%1, #16 * 24]\n\t"
-                 "ldp q26, q27, [%1, #16 * 26]\n\t"
-                 "ldp q28, q29, [%1, #16 * 28]\n\t"
-                 "ldp q30, q31, [%1, #16 * 30]\n\t"
-                 : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
+    if ( is_sve_domain(v->domain) )
+        sve_restore_state(v);
+    else
+    {
+        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
+                     "ldp q2, q3, [%1, #16 * 2]\n\t"
+                     "ldp q4, q5, [%1, #16 * 4]\n\t"
+                     "ldp q6, q7, [%1, #16 * 6]\n\t"
+                     "ldp q8, q9, [%1, #16 * 8]\n\t"
+                     "ldp q10, q11, [%1, #16 * 10]\n\t"
+                     "ldp q12, q13, [%1, #16 * 12]\n\t"
+                     "ldp q14, q15, [%1, #16 * 14]\n\t"
+                     "ldp q16, q17, [%1, #16 * 16]\n\t"
+                     "ldp q18, q19, [%1, #16 * 18]\n\t"
+                     "ldp q20, q21, [%1, #16 * 20]\n\t"
+                     "ldp q22, q23, [%1, #16 * 22]\n\t"
+                     "ldp q24, q25, [%1, #16 * 24]\n\t"
+                     "ldp q26, q27, [%1, #16 * 26]\n\t"
+                     "ldp q28, q29, [%1, #16 * 28]\n\t"
+                     "ldp q30, q31, [%1, #16 * 30]\n\t"
+                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
+    }
 
     WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
     WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 6c22551b0ed2..add9929b7943 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -557,7 +557,11 @@ int arch_vcpu_create(struct vcpu *v)
 
     v->arch.cptr_el2 = get_default_cptr_flags();
     if ( is_sve_domain(v->domain) )
+    {
+        if ( (rc = sve_context_init(v)) != 0 )
+            goto fail;
         v->arch.cptr_el2 &= ~HCPTR_CP(8);
+    }
 
     v->arch.hcr_el2 = get_default_hcr_flags();
 
@@ -587,6 +591,8 @@ fail:
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    if ( is_sve_domain(v->domain) )
+        sve_context_free(v);
     vcpu_timer_destroy(v);
     vcpu_vgic_free(v);
     free_xenheap_pages(v->arch.stack, STACK_ORDER);
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index 4b63412727fc..65b46685d263 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -22,6 +22,10 @@ static inline unsigned int sve_decode_vl(unsigned int sve_vl)
 }
 
 register_t compute_max_zcr(void);
+int sve_context_init(struct vcpu *v);
+void sve_context_free(struct vcpu *v);
+void sve_save_state(struct vcpu *v);
+void sve_restore_state(struct vcpu *v);
 
 #ifdef CONFIG_ARM64_SVE
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 4cabb9eb4d5e..3fdeb9d8cdef 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -88,6 +88,9 @@
 #ifndef ID_AA64ISAR2_EL1
 #define ID_AA64ISAR2_EL1            S3_0_C0_C6_2
 #endif
+#ifndef ZCR_EL1
+#define ZCR_EL1                     S3_0_C1_C2_0
+#endif
 
 /* ID registers (imported from arm64/include/asm/sysreg.h in Linux) */
 
diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/asm/arm64/vfp.h
index e6e8c363bc16..4b399ccbfb31 100644
--- a/xen/arch/arm/include/asm/arm64/vfp.h
+++ b/xen/arch/arm/include/asm/arm64/vfp.h
@@ -6,7 +6,23 @@
 
 struct vfp_state
 {
+    /*
+     * When SVE is enabled for the guest, fpregs memory will be used to
+     * save/restore P0-P15 registers, otherwise it will be used for the V0-V31
+     * registers.
+     */
     uint64_t fpregs[64] __vfp_aligned;
+
+#ifdef CONFIG_ARM64_SVE
+    /*
+     * When SVE is enabled for the guest, sve_zreg_ctx_end points to memory
+     * where Z0-Z31 registers and FFR can be saved/restored, it points at the
+     * end of the Z0-Z31 space and at the beginning of the FFR space, it's done
+     * like that to ease the save/restore assembly operations.
+     */
+    uint64_t *sve_zreg_ctx_end;
+#endif
+
     register_t fpcr;
     register_t fpexc32_el2;
     register_t fpsr;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 331da0f3bcc3..99e798ffff68 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -195,6 +195,11 @@ struct arch_vcpu
     register_t tpidrro_el0;
 
     /* HYP configuration */
+#ifdef CONFIG_ARM64_SVE
+    register_t zcr_el1;
+    register_t zcr_el2;
+#endif
+
     register_t cptr_el2;
     register_t hcr_el2;
     register_t mdcr_el2;
-- 
2.34.1


