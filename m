Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3CC665E24
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475458.737212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcFd-0002JR-OP; Wed, 11 Jan 2023 14:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475458.737212; Wed, 11 Jan 2023 14:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcFd-0002GV-JE; Wed, 11 Jan 2023 14:38:49 +0000
Received: by outflank-mailman (input) for mailman id 475458;
 Wed, 11 Jan 2023 14:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gQc=5I=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pFcFb-0001NK-Ku
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:38:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a681ec48-91bd-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:38:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51FE913D5;
 Wed, 11 Jan 2023 06:39:26 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45D913F71A;
 Wed, 11 Jan 2023 06:38:43 -0800 (PST)
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
X-Inumbo-ID: a681ec48-91bd-11ed-b8d0-410ff93cb8f0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 5/8] arm/sve: save/restore SVE context switch
Date: Wed, 11 Jan 2023 14:38:23 +0000
Message-Id: <20230111143826.3224-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230111143826.3224-1-luca.fancellu@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>

Save/restore context switch for SVE, allocate memory to contain
the Z0-31 registers whose length is maximum 2048 bits each and
FFR who can be maximum 256 bits, the allocated memory depends on
how many bits is the vector length for the domain and how many bits
are supported by the platform.

Save P0-15 whose length is maximum 256 bits each, in this case the
memory used is from the fpregs field in struct vfp_state,
because V0-31 are part of Z0-31 and this space would have been
unused for SVE domain otherwise.

Create zcr_el1 field in arch_vcpu and save/restore ZCR_EL1 value
on context switch.

Remove headers from sve.c that are already included using
xen/sched.h.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/arm64/sve.c                 |  58 +++++++++-
 xen/arch/arm/arm64/sve_asm.S             | 141 +++++++++++++++++++++++
 xen/arch/arm/arm64/vfp.c                 |  79 +++++++------
 xen/arch/arm/domain.c                    |  12 ++
 xen/arch/arm/include/asm/arm64/sve.h     |  13 +++
 xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
 xen/arch/arm/include/asm/arm64/vfp.h     |  10 ++
 xen/arch/arm/include/asm/domain.h        |   1 +
 8 files changed, 280 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index b7695834f4ba..c7b325700fe4 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -5,12 +5,29 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
-#include <xen/types.h>
-#include <asm/cpufeature.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
 #include <asm/arm64/sve.h>
-#include <asm/arm64/sysregs.h>
 
 extern unsigned int sve_get_hw_vl(void);
+extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
+extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
+                         int restore_ffr);
+
+static inline uint16_t sve_zreg_ctx_size(uint16_t vl)
+{
+    /*
+     * Z0-31 registers size in bytes is computed from VL that is in bits, so VL
+     * in bytes is VL/8.
+     */
+    return (vl / 8U) * 32U;
+}
+
+static inline uint16_t sve_ffrreg_ctx_size(uint16_t vl)
+{
+    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
+    return (vl / 64U);
+}
 
 register_t compute_max_zcr(void)
 {
@@ -45,3 +62,38 @@ uint16_t get_sys_vl_len(void)
     return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
             SVE_VL_MULTIPLE_VAL;
 }
+
+int sve_context_init(struct vcpu *v)
+{
+    uint64_t *ctx = _xzalloc(sve_zreg_ctx_size(v->domain->arch.sve_vl_bits) +
+                             sve_ffrreg_ctx_size(v->domain->arch.sve_vl_bits),
+                             L1_CACHE_BYTES);
+
+    if ( !ctx )
+        return -ENOMEM;
+
+    v->arch.vfp.sve_context = ctx;
+
+    return 0;
+}
+
+void sve_context_free(struct vcpu *v)
+{
+    xfree(v->arch.vfp.sve_context);
+}
+
+void sve_save_state(struct vcpu *v)
+{
+    uint64_t *sve_ctx_zreg_end = v->arch.vfp.sve_context +
+            (sve_zreg_ctx_size(v->domain->arch.sve_vl_bits) / sizeof(uint64_t));
+
+    sve_save_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
+}
+
+void sve_restore_state(struct vcpu *v)
+{
+    uint64_t *sve_ctx_zreg_end = v->arch.vfp.sve_context +
+            (sve_zreg_ctx_size(v->domain->arch.sve_vl_bits) / sizeof(uint64_t));
+
+    sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
+}
diff --git a/xen/arch/arm/arm64/sve_asm.S b/xen/arch/arm/arm64/sve_asm.S
index 4d1549344733..8c37d7bc95d5 100644
--- a/xen/arch/arm/arm64/sve_asm.S
+++ b/xen/arch/arm/arm64/sve_asm.S
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
@@ -35,11 +95,92 @@
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
index 27f38729302b..228cd2f7627e 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -159,6 +159,11 @@ static void ctxt_switch_from(struct vcpu *p)
     /* VFP */
     vfp_save_state(p);
 
+#ifdef CONFIG_ARM64_SVE
+    if ( is_sve_domain(p->domain) )
+        p->arch.zcr_el1 = READ_SYSREG(ZCR_EL1);
+#endif
+
     /* VGIC */
     gic_save_state(p);
 
@@ -186,7 +191,10 @@ static void ctxt_switch_to(struct vcpu *n)
 
 #ifdef CONFIG_ARM64_SVE
     if ( is_sve_domain(n->domain) )
+    {
+        WRITE_SYSREG(n->arch.zcr_el1, ZCR_EL1);
         WRITE_SYSREG(n->arch.zcr_el2, ZCR_EL2);
+    }
 #endif
 
     /* VFP */
@@ -559,6 +567,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.cptr_el2 = get_default_cptr_flags();
     if ( is_sve_domain(v->domain) )
     {
+        if ( (rc = sve_context_init(v)) != 0 )
+            goto fail;
         v->arch.cptr_el2 &= ~HCPTR_CP(8);
         v->arch.zcr_el2 = vl_to_zcr(v->domain->arch.sve_vl_bits);
     }
@@ -591,6 +601,8 @@ fail:
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    if ( is_sve_domain(v->domain) )
+        sve_context_free(v);
     vcpu_timer_destroy(v);
     vcpu_vgic_free(v);
     free_xenheap_pages(v->arch.stack, STACK_ORDER);
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index f4a660e402ca..28c31b329233 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -24,6 +24,10 @@ static inline bool is_vl_valid(uint16_t vl)
 register_t compute_max_zcr(void);
 register_t vl_to_zcr(uint16_t vl);
 uint16_t get_sys_vl_len(void);
+int sve_context_init(struct vcpu *v);
+void sve_context_free(struct vcpu *v);
+void sve_save_state(struct vcpu *v);
+void sve_restore_state(struct vcpu *v);
 
 #else /* !CONFIG_ARM64_SVE */
 
@@ -42,6 +46,15 @@ static inline uint16_t get_sys_vl_len(void)
     return 0;
 }
 
+static inline int sve_context_init(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline void sve_context_free(struct vcpu *v) {}
+static inline void sve_save_state(struct vcpu *v) {}
+static inline void sve_restore_state(struct vcpu *v) {}
+
 #endif
 
 #endif /* _ARM_ARM64_SVE_H */
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
index e6e8c363bc16..8af714cb8ecc 100644
--- a/xen/arch/arm/include/asm/arm64/vfp.h
+++ b/xen/arch/arm/include/asm/arm64/vfp.h
@@ -6,7 +6,17 @@
 
 struct vfp_state
 {
+    /*
+     * When SVE is enabled for the guest, fpregs memory will be used to
+     * save/restore P0-P15 registers, otherwise it will be used for the V0-V31
+     * registers.
+     */
     uint64_t fpregs[64] __vfp_aligned;
+    /*
+     * When SVE is enabled for the guest, sve_context contains memory to
+     * save/restore Z0-Z31 registers and FFR.
+     */
+    uint64_t *sve_context;
     register_t fpcr;
     register_t fpexc32_el2;
     register_t fpsr;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index e4794a9fd2ab..4d1066750a9b 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -195,6 +195,7 @@ struct arch_vcpu
     register_t tpidrro_el0;
 
     /* HYP configuration */
+    register_t zcr_el1;
     register_t zcr_el2;
     register_t cptr_el2;
     register_t hcr_el2;
-- 
2.17.1


