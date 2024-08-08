Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9294BEA9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774151.1184644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PO-0002sG-5E; Thu, 08 Aug 2024 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774151.1184644; Thu, 08 Aug 2024 13:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PO-0002lX-1Q; Thu, 08 Aug 2024 13:42:26 +0000
Received: by outflank-mailman (input) for mailman id 774151;
 Thu, 08 Aug 2024 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3PM-0002jZ-Gg
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:24 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a59fba5-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:42:23 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62570fso1170344a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:23 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d35172sm676426a12.71.2024.08.08.06.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:21 -0700 (PDT)
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
X-Inumbo-ID: 0a59fba5-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124542; x=1723729342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSMAJrbKIJks8IvZYbCfs4ficfe6mQhEmBJARLfZWYI=;
        b=ahGvNw60o18MvNuwC9ph0jWilQucjKLLSlNJ8/oOj11VnKd6R/i1zz87Td69EfeAMi
         G/xnKaHDNGlH/o8DJJGBoBnJbQdJMBWcfZ06ywir+1BN4JfV3N283e/Ivy6Igkcihqb2
         0gYsjemwNl3+TaHtSyWKyOTpXPmOfZBzOzAzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124542; x=1723729342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSMAJrbKIJks8IvZYbCfs4ficfe6mQhEmBJARLfZWYI=;
        b=qtfs3hlQn1wswrcvW8+VH5KO2qG1E8uCHR4Ng9m7mun1LmZrYd+UpihPSDzBS8JKes
         mZuKOHrYH0i54dcnm4taHBXp2xKrWixGADtz0u6+1ZFzj739XOhHYoRIRCp7JHggG7Jv
         XX7OxNvC+Ucia7wHt+TTyVx214dNq+e0Vbp2M8l30w2W8p8OSbtyTMe5Q6jnJdT+UQVU
         2MPtAJMPZI1PUiYNbDcVlupPnfLvQkRBfxT3SZ672C11P09kYCp+82xh/zQJ4ctNPB5a
         gz2vJQ0okL9xU0f+VXEIqpZW2hbx4H5CCN3pxL4u+sorsYpeVHHopgt0wxebHU9vgT/u
         19Xg==
X-Gm-Message-State: AOJu0YyytaWG32VL5yeWJ4ur4o6By4LA1std9Mp3L/HDsid/aJv8/bNc
	VMIslpO0AnpPTFK1g5AUVq5rs5l6NH9Y5OaR20qsEWohDj9sz2ZWUWEZGSikLcyXBKayi0grPAh
	Z
X-Google-Smtp-Source: AGHT+IGUiGSqCpH1+k8o88g8/J60vQ87PRNGPIKuAkIy08w57jyD71wTYz5Zhj1rSM6hN8gmnr2Yvw==
X-Received: by 2002:a05:6402:2108:b0:5a3:5218:5d80 with SMTP id 4fb4d7f45d1cf-5bbb233f281mr1587970a12.21.1723124542052;
        Thu, 08 Aug 2024 06:42:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
Date: Thu,  8 Aug 2024 14:41:49 +0100
Message-ID: <20240808134150.29927-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
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
v2:

  * Added BUILD_BUG_ON(sizeof(x) != sizeof(fpusse_t)) on forceful casts
    involving fpusse_t.
  * Reworded comment on top of vcpu_arch->user_regs
  * Added missing whitespace in x86_emulate/blk.c
---
 xen/arch/x86/domctl.c             |  5 +++-
 xen/arch/x86/hvm/emulate.c        |  4 +--
 xen/arch/x86/hvm/hvm.c            |  5 +++-
 xen/arch/x86/i387.c               | 45 +++++--------------------------
 xen/arch/x86/include/asm/domain.h |  8 +++---
 xen/arch/x86/x86_emulate/blk.c    |  3 ++-
 xen/arch/x86/xstate.c             | 13 ++++++---
 7 files changed, 32 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a83..bceff6be0ff3 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1344,7 +1344,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #define c(fld) (c.nat->fld)
 #endif
 
-    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
+    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
+           sizeof(c.nat->fpu_ctxt));
+    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) != sizeof(fpusse_t));
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
index f49e29faf753..6607dba562a4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -916,7 +916,10 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
+        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
+               sizeof(ctxt.fpu_regs));
+        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(fpusse_t));
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


