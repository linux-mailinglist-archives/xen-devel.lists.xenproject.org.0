Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2399320F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812214.1224954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2Y-0003uo-IU; Mon, 07 Oct 2024 15:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812214.1224954; Mon, 07 Oct 2024 15:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2Y-0003sQ-Dh; Mon, 07 Oct 2024 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 812214;
 Mon, 07 Oct 2024 15:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5Pn=RD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sxq2W-0003e1-Og
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:52:52 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 345145c4-84c4-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:52:49 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3e8a74so6453400a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:52:49 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.174.59.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99309aa6afsm386160366b.112.2024.10.07.08.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 08:52:48 -0700 (PDT)
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
X-Inumbo-ID: 345145c4-84c4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728316369; x=1728921169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TYzH8XXnpnrv/vwFrSTuoTElqLW4Sow9Xi2H8+/uD4=;
        b=ASJaZNn4/GJBhnjdt/jUz4gJ6SpY8OEMlq+HuRyw68dnVNGquDdTGqN4x5HlVbwkP6
         dLszoEtEwz/WOgQMJfhyLE+VuIcQwo1A1LYJOLJvkq0vVlyArTVxjylqJq7997rE4Cna
         fK89GyuzK+vvHHSFBVf6Rj4KO9zduhfzsT2MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728316369; x=1728921169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TYzH8XXnpnrv/vwFrSTuoTElqLW4Sow9Xi2H8+/uD4=;
        b=jbNJv4xk+ATYHjizFIllfa7On7NIzNB6EOTSDTzL0fI9n0PInVHXxOiVbhJWSJS6dQ
         VKFttTDMHf+nc3nS5JqLEMJFWzHiryKd3iHpT+wW5O0uWzsiVSco3baFqqwENVxwxM5r
         ESLp56VVFLE68XeRY0nNeb4mjyy6o0h6iGWhXlnhZ9OUwaXyWbITT1kdfvmv/dArs25d
         fVE/1J8h3qmvIyz5De6v3MMJgcsEAhXWQoGlvmItoMDLgNscW9dVecA4d0p1clRTHf2n
         1sW9zR24zTum01sOQqPR2nBcmWQ8dLHtH7vwefZ+fevVDpauFX/rS/ryugGcPMU46C78
         rFTA==
X-Gm-Message-State: AOJu0YxlfsSkdtdMgpN4UITLUfadvFWadOKCF1Cpp3IqKSjk9khdOoZv
	jNnA7YLXpcCzIUMPWloOsirWm26LnuwWXuQfQudEmJ2/dSMFzVpOu+I0RUxrCVQT3qEj0AmaQQX
	Hfr4=
X-Google-Smtp-Source: AGHT+IFD+UoGl7Y5EgfhtlbByitJiOettPiLgEYOoIkKxFGeYn1wuwO0Qjdsd2PFWKnfZM2Ta5r92g==
X-Received: by 2002:a17:907:960c:b0:a86:8b7b:7880 with SMTP id a640c23a62f3a-a991c06317fmr1040261066b.63.1728316368981;
        Mon, 07 Oct 2024 08:52:48 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
Date: Mon,  7 Oct 2024 16:52:39 +0100
Message-ID: <20241007155240.17186-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fpu_ctxt is either a pointer to the legacy x87/SSE save area (used by FXSAVE) or
a pointer aliased with xsave_area that points to its fpu_sse subfield. Such
subfield is at the base and is identical in size and layout to the legacy
buffer.

This patch merges the 2 pointers in the arch_vcpu into a single XSAVE area. In
the very rare case in which the host doesn't support XSAVE all we're doing is
wasting a tiny amount of memory and trading those for a lot more simplicity in
the code.

While at it, dedup the setup logic in vcpu_init_fpu() and integrate it
into xstate_alloc_save_area().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
--
v4:
  * Amend commit message with extra note about deduping vcpu_init_fpu()
  * Remove comment on top of cpu_user_regs (though I really think there
    ought to be a credible one, in one form or another).
  * Remove cast from blk.c so FXSAVE_AREA is "void *"
  * Simplify comment in xstate_alloc_save_area() for the "host has no
    XSAVE" case.
---
 xen/arch/x86/domctl.c             |  6 ++++-
 xen/arch/x86/hvm/emulate.c        |  4 +--
 xen/arch/x86/hvm/hvm.c            |  6 ++++-
 xen/arch/x86/i387.c               | 45 +++++--------------------------
 xen/arch/x86/include/asm/domain.h |  6 -----
 xen/arch/x86/x86_emulate/blk.c    |  2 +-
 xen/arch/x86/xstate.c             | 12 ++++++---
 7 files changed, 28 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 96d816cf1a7d..2d115395da90 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1379,7 +1379,11 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #define c(fld) (c.nat->fld)
 #endif
 
-    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
+    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) !=
+                 sizeof(v->arch.xsave_area->fpu_sse));
+    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
+           sizeof(c.nat->fpu_ctxt));
+
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
     else
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index aa97ca1cbffd..f2bc6967dfcb 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2371,7 +2371,7 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2411,7 +2411,7 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7b2e1c9813d6..77fe282118f7 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -914,7 +914,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
+        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) !=
+                     sizeof(v->arch.xsave_area->fpu_sse));
+        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
+               sizeof(ctxt.fpu_regs));
+
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 134e0bece519..fbb9d3584a3d 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -39,7 +39,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 /* Restore x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxrstor(struct vcpu *v)
 {
-    const fpusse_t *fpu_ctxt = v->arch.fpu_ctxt;
+    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
 
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
@@ -151,7 +151,7 @@ static inline void fpu_xsave(struct vcpu *v)
 /* Save x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxsave(struct vcpu *v)
 {
-    fpusse_t *fpu_ctxt = v->arch.fpu_ctxt;
+    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
 
     if ( fip_width != 4 )
@@ -212,7 +212,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
-    if ( v->arch.fully_eager_fpu || (v->arch.xsave_area && xstate_all(v)) )
+    if ( v->arch.fully_eager_fpu || xstate_all(v) )
     {
         if ( cpu_has_xsave )
             fpu_xrstor(v, XSTATE_ALL);
@@ -299,44 +299,14 @@ void save_fpu_enable(void)
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
-    int rc;
-
     v->arch.fully_eager_fpu = opt_eager_fpu;
-
-    if ( (rc = xstate_alloc_save_area(v)) != 0 )
-        return rc;
-
-    if ( v->arch.xsave_area )
-        v->arch.fpu_ctxt = &v->arch.xsave_area->fpu_sse;
-    else
-    {
-        BUILD_BUG_ON(__alignof(v->arch.xsave_area->fpu_sse) < 16);
-        v->arch.fpu_ctxt = _xzalloc(sizeof(v->arch.xsave_area->fpu_sse),
-                                    __alignof(v->arch.xsave_area->fpu_sse));
-        if ( v->arch.fpu_ctxt )
-        {
-            fpusse_t *fpu_sse = v->arch.fpu_ctxt;
-
-            fpu_sse->fcw = FCW_DEFAULT;
-            fpu_sse->mxcsr = MXCSR_DEFAULT;
-        }
-        else
-            rc = -ENOMEM;
-    }
-
-    return rc;
+    return xstate_alloc_save_area(v);
 }
 
 void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
                     const void *data, unsigned int fcw_default)
 {
-    /*
-     * For the entire function please note that vcpu_init_fpu() (above) points
-     * v->arch.fpu_ctxt into v->arch.xsave_area when XSAVE is available. Hence
-     * accesses through both pointers alias one another, and the shorter form
-     * is used here.
-     */
-    fpusse_t *fpu_sse = v->arch.fpu_ctxt;
+    fpusse_t *fpu_sse = &v->arch.xsave_area->fpu_sse;
 
     ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
 
@@ -373,10 +343,7 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
 /* Free FPU's context save area */
 void vcpu_destroy_fpu(struct vcpu *v)
 {
-    if ( v->arch.xsave_area )
-        xstate_free_save_area(v);
-    else
-        xfree(v->arch.fpu_ctxt);
+    xstate_free_save_area(v);
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5219c4fb0f69..b79d6badd71c 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -591,12 +591,6 @@ struct pv_vcpu
 
 struct arch_vcpu
 {
-    /*
-     * guest context (mirroring struct vcpu_guest_context) common
-     * between pv and hvm guests
-     */
-
-    void              *fpu_ctxt;
     struct cpu_user_regs user_regs;
 
     /* Debug registers. */
diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index e790f4f90056..08a05f8453f7 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,7 +11,7 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA current->arch.fpu_ctxt
+#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
 # else
 #  define FXSAVE_AREA get_fpu_save_area()
 # endif
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 57a0749f0d54..af9e345a7ace 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -508,9 +508,15 @@ int xstate_alloc_save_area(struct vcpu *v)
     unsigned int size;
 
     if ( !cpu_has_xsave )
-        return 0;
-
-    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
+    {
+        /*
+         * On non-XSAVE systems, we allocate an XSTATE buffer for simplicity.
+         * XSTATE is backwards compatible to FXSAVE, and only one cacheline
+         * larger.
+         */
+        size = XSTATE_AREA_MIN_SIZE;
+    }
+    else if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
     {
         size = xsave_cntxt_size;
         BUG_ON(size < XSTATE_AREA_MIN_SIZE);
-- 
2.46.0


