Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27100950771
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776348.1186466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsP9-0006rl-Qc; Tue, 13 Aug 2024 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776348.1186466; Tue, 13 Aug 2024 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsP9-0006oy-ME; Tue, 13 Aug 2024 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 776348;
 Tue, 13 Aug 2024 14:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdsP8-0006mt-FM
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 14:21:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b718e29-597f-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 16:21:40 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so5999063a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 07:21:40 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e3basm73540966b.164.2024.08.13.07.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 07:21:38 -0700 (PDT)
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
X-Inumbo-ID: 5b718e29-597f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723558899; x=1724163699; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqLGGO5tY3MJJjvPDYymgHnYwN09knhW+0e175iaHo=;
        b=f8wby6C/BCHMLhiHO+xuxsX02fp+IwsPkTrFNuA1LKFmNHDiaG+jUCbitHZo3wSTd5
         NTnkveyes4ZHlMgwpBRH9OGDEq0koOSki93Vp+fDRiFmZBLVh5/YZOJbZaUz6Zy08nNi
         p79hLeO0//a8g74lN4gSL2T483Kyn6I6LHrDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723558899; x=1724163699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqLGGO5tY3MJJjvPDYymgHnYwN09knhW+0e175iaHo=;
        b=d7pD/TxaBO2C/NUadU0M+0QOUDN+ebyMqnW3WQfA8nf0v+DAPlCtsE5M5ILysJJ1C9
         RvcwaJs5Gb8Uy4HNDZ5BsvZ/iGI2U3QZyLDlEuq2QG8A0KUSEFo+HSNEBFSEqRtjNLcj
         27k0I3olHn132Tga0ckIn3dHd4tlpxJHJ8cPcAu87Cp61SerBdwxGksETs9pYoOOfeVJ
         TMwl+oNQYJumRhJC4lC57FpCHxRjw9btij/DAwLkM+s+QkOvD3G7u6sNEQl5Z7glc2uq
         QzkPKntqaNBxq0Ui6Tmuwqg+4EdkpxICzzn7rmimcZXZr0ZvUkfGMnBCi6DZw04JzWQk
         X1fg==
X-Gm-Message-State: AOJu0Yw5JZQFIZ9UKFW8tP6tbi1O9X7Lx5yr+fXwh6zvFevB/4C0WY+o
	OM/otMbCmfe1sPV9qh91A0HWunT45m++6XWXNP8wg3qzHZtc3jSvUFSBds4lGP3SLuCOVLzpdm2
	K
X-Google-Smtp-Source: AGHT+IGtQFYWG4HZWjMh3SD3M9MAmsCh41T4WNpZlCfbgbn6BaHtGEgS/xhAxs3gi6VVnjG2dn5S4Q==
X-Received: by 2002:a17:907:efe5:b0:a7a:aa35:408d with SMTP id a640c23a62f3a-a80ed1d679dmr289106766b.20.1723558899234;
        Tue, 13 Aug 2024 07:21:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
Date: Tue, 13 Aug 2024 15:21:18 +0100
Message-ID: <20240813142119.29012-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
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

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Reverse memcpy() and BUILD_BUG_ON()
  * Use sizeof(arg) rather than sizeof(type)
---
 xen/arch/x86/domctl.c             |  6 ++++-
 xen/arch/x86/hvm/emulate.c        |  4 +--
 xen/arch/x86/hvm/hvm.c            |  6 ++++-
 xen/arch/x86/i387.c               | 45 +++++--------------------------
 xen/arch/x86/include/asm/domain.h |  8 +++---
 xen/arch/x86/x86_emulate/blk.c    |  3 ++-
 xen/arch/x86/xstate.c             | 13 ++++++---
 7 files changed, 34 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a83..63fbceac0911 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1344,7 +1344,11 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
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
index feb4792cc567..03020542c3ba 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2363,7 +2363,7 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2403,7 +2403,7 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f49e29faf753..76bbb645b77a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -916,7 +916,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
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
index bca3258d69ac..3da60af2a44a 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -592,11 +592,11 @@ struct pv_vcpu
 struct arch_vcpu
 {
     /*
-     * guest context (mirroring struct vcpu_guest_context) common
-     * between pv and hvm guests
+     * Guest context common between PV and HVM guests. Includes general purpose
+     * registers, segment registers and other parts of the exception frame.
+     *
+     * It doesn't contain FPU state, as that lives in xsave_area instead.
      */
-
-    void              *fpu_ctxt;
     struct cpu_user_regs user_regs;
 
     /* Debug registers. */
diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index e790f4f90056..28b54f26fe29 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,7 +11,8 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA current->arch.fpu_ctxt
+#  define FXSAVE_AREA ((struct x86_fxsr *) \
+                           (void *)&current->arch.xsave_area->fpu_sse)
 # else
 #  define FXSAVE_AREA get_fpu_save_area()
 # endif
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 5c4144d55e89..850ee31bd18c 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
     unsigned int size;
 
     if ( !cpu_has_xsave )
-        return 0;
-
-    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
+    {
+        /*
+         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps treating
+         * the FPU state uniformly as an XSAVE buffer even if XSAVE is not
+         * available in the host. Note the alignment restriction of the XSAVE
+         * area are stricter than those of the FXSAVE area.
+         */
+        size = XSTATE_AREA_MIN_SIZE;
+    }
+    else if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
     {
         size = xsave_cntxt_size;
         BUG_ON(size < XSTATE_AREA_MIN_SIZE);
-- 
2.45.2


