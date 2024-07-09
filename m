Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894092BED6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756379.1164993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8q-0003Vt-W1; Tue, 09 Jul 2024 15:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756379.1164993; Tue, 09 Jul 2024 15:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8q-0003SV-SJ; Tue, 09 Jul 2024 15:52:32 +0000
Received: by outflank-mailman (input) for mailman id 756379;
 Tue, 09 Jul 2024 15:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRD8p-0002zS-St
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:52:31 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fe300e7-3e0b-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 17:52:31 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso7225709a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:52:31 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm1181254a12.73.2024.07.09.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:52:29 -0700 (PDT)
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
X-Inumbo-ID: 3fe300e7-3e0b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720540350; x=1721145150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWsRWH1vBUU8PY9863f2q978DGRF3ndAJZtagMPujW8=;
        b=cd5fEXJ8+Yfl43n/gMsVTghtIL4NzOmIQfRJgeSxpnp9qX0EwB+7KrAkypkLRirqsk
         7PuslQWqJwF3OCxNmCmFhVnU4CQEi04quVKXWf8dL86THSGMW3MpHUNKZYRaWxobMRjH
         J/ljh+cOJk+jNw4f0XHqXobZBn7A4hHUDxALI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540350; x=1721145150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWsRWH1vBUU8PY9863f2q978DGRF3ndAJZtagMPujW8=;
        b=osg4fs1tUqACe2HWwgGSNJXuxDYRj9wfhs25ZwySn876fweNlbisUi57ZIkQqOsHND
         2n70+RvTdSh8POW37i8UnYL53YbyJElHdh2oiosSyu0kvmu031vMpHORAQWHqSMCsReF
         hIRlybNO3OXZyrIODozOtmER34W/xKErT4NeAlUekSMzCJQS+75IpJP8osEbpVzLLLQT
         ZTlgbEyhXf1gA4nBjWFAxwjZIW2hrfFNYAWxB49IkvLa5iUtpnW7SZLutD4gBB43RVDW
         zfZ98mbwe3lLr7cyXzZKsgntx4Zzo60Ca9XpekU90GO1P7hJ05FjKaKUwMKxwIheqFVk
         xq9Q==
X-Gm-Message-State: AOJu0Yx/pi5kyuwF04XPdJgz+20u/9fnPWeJa0/3Zla6h32K3quXyIsP
	LlXUWSTRgX4SDjILoLGG6JOom+MH4RnFJSiNCR/5Pq8q+7k7WydtmrK4uMXUYnLnKR+cZh+qPyH
	f
X-Google-Smtp-Source: AGHT+IGiDjOeE2XeQCRIoRoTOZoUr4X0fKpLKKmQWb89gzG8uuLngQvB6yywAAXBdSkiAHvXYVC4Xg==
X-Received: by 2002:a05:6402:1d54:b0:58c:6edf:d5d2 with SMTP id 4fb4d7f45d1cf-594baf9147bmr2446089a12.15.1720540349906;
        Tue, 09 Jul 2024 08:52:29 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 3/4] x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
Date: Tue,  9 Jul 2024 16:52:22 +0100
Message-Id: <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720538832.git.alejandro.vallejo@cloud.com>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
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
 xen/arch/x86/domctl.c             |  3 ++-
 xen/arch/x86/hvm/emulate.c        |  4 +--
 xen/arch/x86/hvm/hvm.c            |  3 ++-
 xen/arch/x86/i387.c               | 45 +++++--------------------------
 xen/arch/x86/include/asm/domain.h |  7 +----
 xen/arch/x86/x86_emulate/blk.c    |  3 ++-
 xen/arch/x86/xstate.c             | 13 ++++++---
 7 files changed, 25 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9190e11faaa3..7b04b584c540 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1343,7 +1343,8 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #define c(fld) (c.nat->fld)
 #endif
 
-    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
+    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
+           sizeof(c.nat->fpu_ctxt));
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
     else
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 65ee70ce67db..72a8136a9bbf 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2364,7 +2364,7 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2404,7 +2404,7 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
+        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f5f..09b1426ee314 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -916,7 +916,8 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
+        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
+               sizeof(ctxt.fpu_regs));
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 89804435b659..a964b84757ec 100644
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
@@ -152,7 +152,7 @@ static inline void fpu_xsave(struct vcpu *v)
 /* Save x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxsave(struct vcpu *v)
 {
-    fpusse_t *fpu_ctxt = v->arch.fpu_ctxt;
+    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
 
     if ( fip_width != 4 )
@@ -219,7 +219,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
-    if ( v->arch.fully_eager_fpu || (v->arch.xsave_area && xstate_all(v)) )
+    if ( v->arch.fully_eager_fpu || xstate_all(v) )
     {
         if ( cpu_has_xsave )
             fpu_xrstor(v, XSTATE_ALL);
@@ -306,44 +306,14 @@ void save_fpu_enable(void)
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
 
@@ -380,10 +350,7 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
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
index f5daeb182baa..4740a1244fbb 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -591,12 +591,7 @@ struct pv_vcpu
 
 struct arch_vcpu
 {
-    /*
-     * guest context (mirroring struct vcpu_guest_context) common
-     * between pv and hvm guests
-     */
-
-    void              *fpu_ctxt;
+    /* Fixed point registers */
     struct cpu_user_regs user_regs;
 
     /* Debug registers. */
diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index e790f4f90056..8160da07295b 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,7 +11,8 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA current->arch.fpu_ctxt
+#  define FXSAVE_AREA ((struct x86_fxsr *) \
+                           (void*)&current->arch.xsave_area->fpu_sse)
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
2.34.1


