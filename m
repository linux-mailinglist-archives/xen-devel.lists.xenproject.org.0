Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E489950772
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776349.1186474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsPA-00075A-82; Tue, 13 Aug 2024 14:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776349.1186474; Tue, 13 Aug 2024 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsPA-0006yF-3e; Tue, 13 Aug 2024 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 776349;
 Tue, 13 Aug 2024 14:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdsP8-0006n1-Ky
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 14:21:42 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c17444c-597f-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 16:21:41 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so61023001fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 07:21:41 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e3basm73540966b.164.2024.08.13.07.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 07:21:39 -0700 (PDT)
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
X-Inumbo-ID: 5c17444c-597f-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723558900; x=1724163700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n7JOAgAvzp22GAaCkId27lvQiwRgN36BGS4UVLvykI=;
        b=B3Y6AZee0SAm2jaBkA4AkAbJZjf4AO5d0fcfaGuxMa4QcYXa35GwxK9HWv644hXXsM
         RGbgJRSmlRYzAS6r0Fi1HlOxhLAzhZXp6yJY81hDjb3IIMkU4hXtPUmvzGFB08Uip+Fc
         sQw8SutBAKjZfE32ERhLu/RMOgCjA1kvSbGnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723558900; x=1724163700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n7JOAgAvzp22GAaCkId27lvQiwRgN36BGS4UVLvykI=;
        b=hH8GUNXmg5rXU38DyE0DBtRzzK7nV5n8mYYXn7xikMjv2eN97j7IygpJ02BqgSejMQ
         Ab9f3KQ/pY0DmglJJgpiMSaCnBao4Nbck0hD0cpk0G/+GAdfM5I5T+a6/IRTPfagl4C+
         CFXjcyQFyL7TmPUKMIX+paErSKgailT1vnO8GWW7/4MaTMCl85nReojYpMrssoLP+UcJ
         ZRNz6OChH53Avu09jtJ9kZi6p68dSyFYcez0cMgmgZlrgFhjQJ1x0IObVwhnxymQ6xdj
         QSBtY6KFWVD7yLHsRmvoEqPuOHRX1edzzv9eq2J9hbEqprh2EYnXUC+yXbXBpEu6BnZk
         KPHQ==
X-Gm-Message-State: AOJu0Yye+63LNbxOQCldjdE0Cc8/9CNmXDWUFvMllUxCNflCDRWbLi5m
	5gRb67Fmh8oMss+j9PgT93Wec2vJVKUgKxp7qFKWZt0MgCJU7/uposylYp/XWlJXjcUjx18ydOw
	L
X-Google-Smtp-Source: AGHT+IFy/X5/v3ozuiXP4cvcVNRmyGBu6v4bwyM0c9pQMAhQj+cf9IIljyFMvMqOQbmgiFKizIMJqw==
X-Received: by 2002:a2e:6e14:0:b0:2ef:2b06:b686 with SMTP id 38308e7fff4ca-2f2b714d248mr24973211fa.17.1723558900012;
        Tue, 13 Aug 2024 07:21:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
Date: Tue, 13 Aug 2024 15:21:19 +0100
Message-ID: <20240813142119.29012-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was trying to do too many things at once and there was no clear way of
defining what it was meant to do. This commit splits the function in three.

  1. A function to return the FPU to power-on reset values.
  2. A function to return the FPU to default values.
  3. A x87/SSE state loader (equivalent to the old function when it took a data
     pointer).

While at it, make sure the abridged tag is consistent with the manuals and
start as 0xFF.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Adjust commit message, as the split is now in 3.
  * Remove bulky comment, as the rationale for it turned out to be
    unsubstantiated. I can't find proof in xen-devel of the stream
    operating the way I claimed, and at that point having the comment
    at all is pointless

I suspect the rationale for xsave_vcpu(v) was merely to skip writing the XSAVE
header when it would be rewritten later on. Whatever it might be the current
logic does the right thing and is several orders of magnitude clearer about its
objective and its intent.

---
 xen/arch/x86/domain.c             |  7 ++--
 xen/arch/x86/hvm/hvm.c            | 12 +++----
 xen/arch/x86/i387.c               | 60 +++++++++++++++----------------
 xen/arch/x86/include/asm/i387.h   | 28 ++++++++++++---
 xen/arch/x86/include/asm/xstate.h |  1 +
 5 files changed, 62 insertions(+), 46 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d977ec71ca20..5af9e3e7a8b4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1186,9 +1186,10 @@ int arch_set_info_guest(
          is_pv_64bit_domain(d) )
         v->arch.flags &= ~TF_kernel_mode;
 
-    vcpu_setup_fpu(v, v->arch.xsave_area,
-                   flags & VGCF_I387_VALID ? &c.nat->fpu_ctxt : NULL,
-                   FCW_DEFAULT);
+    if ( flags & VGCF_I387_VALID )
+        vcpu_setup_fpu(v, &c.nat->fpu_ctxt);
+    else
+        vcpu_default_fpu(v);
 
     if ( !compat )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 76bbb645b77a..95d66e68a849 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1165,10 +1165,10 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     seg.attr = ctxt.ldtr_arbytes;
     hvm_set_segment_register(v, x86_seg_ldtr, &seg);
 
-    /* Cover xsave-absent save file restoration on xsave-capable host. */
-    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
-                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
-                   FCW_RESET);
+    if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
+        vcpu_setup_fpu(v, &ctxt.fpu_regs);
+    else
+        vcpu_reset_fpu(v);
 
     v->arch.user_regs.rax = ctxt.rax;
     v->arch.user_regs.rbx = ctxt.rbx;
@@ -4008,9 +4008,7 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
         v->arch.guest_table = pagetable_null();
     }
 
-    if ( v->arch.xsave_area )
-        v->arch.xsave_area->xsave_hdr.xstate_bv = 0;
-    vcpu_setup_fpu(v, v->arch.xsave_area, NULL, FCW_RESET);
+    vcpu_reset_fpu(v);
 
     arch_vcpu_regs_init(v);
     v->arch.user_regs.rip = ip;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index fbb9d3584a3d..f7a9dcd162ba 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -303,41 +303,37 @@ int vcpu_init_fpu(struct vcpu *v)
     return xstate_alloc_save_area(v);
 }
 
-void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
-                    const void *data, unsigned int fcw_default)
+void vcpu_reset_fpu(struct vcpu *v)
 {
-    fpusse_t *fpu_sse = &v->arch.xsave_area->fpu_sse;
-
-    ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
-
-    v->fpu_initialised = !!data;
+    v->fpu_initialised = false;
+    *v->arch.xsave_area = (struct xsave_struct) {
+        .fpu_sse = {
+            .mxcsr = MXCSR_DEFAULT,
+            .fcw = FCW_RESET,
+            .ftw = FTW_RESET,
+        },
+        .xsave_hdr.xstate_bv = X86_XCR0_X87,
+    };
+}
 
-    if ( data )
-    {
-        memcpy(fpu_sse, data, sizeof(*fpu_sse));
-        if ( xsave_area )
-            xsave_area->xsave_hdr.xstate_bv = XSTATE_FP_SSE;
-    }
-    else if ( xsave_area && fcw_default == FCW_DEFAULT )
-    {
-        xsave_area->xsave_hdr.xstate_bv = 0;
-        fpu_sse->mxcsr = MXCSR_DEFAULT;
-    }
-    else
-    {
-        memset(fpu_sse, 0, sizeof(*fpu_sse));
-        fpu_sse->fcw = fcw_default;
-        fpu_sse->mxcsr = MXCSR_DEFAULT;
-        if ( v->arch.xsave_area )
-        {
-            v->arch.xsave_area->xsave_hdr.xstate_bv &= ~XSTATE_FP_SSE;
-            if ( fcw_default != FCW_DEFAULT )
-                v->arch.xsave_area->xsave_hdr.xstate_bv |= X86_XCR0_X87;
-        }
-    }
+void vcpu_default_fpu(struct vcpu *v)
+{
+    v->fpu_initialised = false;
+    *v->arch.xsave_area = (struct xsave_struct) {
+        .fpu_sse = {
+            .mxcsr = MXCSR_DEFAULT,
+            .fcw = FCW_DEFAULT,
+        },
+    };
+}
 
-    if ( xsave_area )
-        xsave_area->xsave_hdr.xcomp_bv = 0;
+void vcpu_setup_fpu(struct vcpu *v, const void *data)
+{
+    v->fpu_initialised = true;
+    *v->arch.xsave_area = (struct xsave_struct) {
+        .fpu_sse = *(const fpusse_t*)data,
+        .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
+    };
 }
 
 /* Free FPU's context save area */
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index a783549db991..7a69577de45b 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -31,10 +31,30 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
 void vcpu_restore_fpu_lazy(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
-
 int vcpu_init_fpu(struct vcpu *v);
-struct xsave_struct;
-void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
-                    const void *data, unsigned int fcw_default);
 void vcpu_destroy_fpu(struct vcpu *v);
+
+/*
+ * Restore v's FPU to power-on reset values
+ *
+ * @param v vCPU containing the FPU
+ */
+void vcpu_reset_fpu(struct vcpu *v);
+
+/*
+ * Restore v's FPU to default values
+ *
+ * @param v vCPU containing the FPU
+ */
+void vcpu_default_fpu(struct vcpu *v);
+
+/*
+ * Load x87/SSE state into v's FPU
+ *
+ * Overrides the XSAVE header to set the state components to be x87 and SSE.
+ *
+ * @param v    vCPU containing the FPU
+ * @param data 512-octet blob for x87/SSE state
+ */
+void vcpu_setup_fpu(struct vcpu *v, const void *data);
 #endif /* __ASM_I386_I387_H */
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index ebeb2a3dcaf9..6144ed6f8551 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -14,6 +14,7 @@
 
 #define FCW_DEFAULT               0x037f
 #define FCW_RESET                 0x0040
+#define FTW_RESET                 0xFF
 #define MXCSR_DEFAULT             0x1f80
 
 extern uint32_t mxcsr_mask;
-- 
2.45.2


