Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAC993210
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812215.1224959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2Y-000410-Q4; Mon, 07 Oct 2024 15:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812215.1224959; Mon, 07 Oct 2024 15:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2Y-0003uj-Mz; Mon, 07 Oct 2024 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 812215;
 Mon, 07 Oct 2024 15:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5Pn=RD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sxq2W-0003e1-Vb
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:52:52 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34b65552-84c4-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:52:50 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so5447844a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:52:50 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.174.59.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99309aa6afsm386160366b.112.2024.10.07.08.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 08:52:49 -0700 (PDT)
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
X-Inumbo-ID: 34b65552-84c4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728316370; x=1728921170; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kQumULdyDnzcg6JI93dHiiynHRn4XaUPGErs4CDNzk=;
        b=Cgx98B5sK8tLUOFDTo+wu1eXRcZ3obK8+V+/Enw+jztS1HUas/HlmqEnreFWSoqnRl
         bGVt9JbkRdu8mBS3evJBz2sXSRFngXtltRBzZHpTr6tC/ip8gZDveTBOI9D8oxGliI+t
         IfWDFI2nC/Mj+mkAw+LPf/6dn5KtISR3NkZpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728316370; x=1728921170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kQumULdyDnzcg6JI93dHiiynHRn4XaUPGErs4CDNzk=;
        b=hDDFwTx8/C2XtLfSaYYXe9mYELFr1d3HyUt5CI57I0KxmOTnuG1lpYp4BtnbcbxmEE
         neVj1E9anZJb1WV5+17GKZYgHcX4Ok78Zsb5xUgsmLNcrurxjW52Z8HntLN/xwS1Q/ru
         rhQWIQydiiQ6YVVPXS+7d/kOMZHTfmH8dzXf1hawan3qHCdrdProfgB7+/jTgIEqckIW
         H+HKdR4Pz0ToKyZsR7R76Fp2c9fmrxCFgKUU1m4SNm7v83xz6zr8+XsxTZArSWc61CKk
         nEvQCcsOvsvQWNm5yOK0OQbn3pX5Xv9a49cPQOmXRDd0D7z0SyEZNmseqO7mp2LHDftC
         Mz1Q==
X-Gm-Message-State: AOJu0Yw9MMA9TG3V829L7FsjImiyIo1CXgpz/SB9m3OMngTpZJtGU4B7
	XSVZy4vXS4uYeYGfSZpzk6tq4ba8fnLlXc16gzFMAV3QZW2HV5mDs7Cjuk6eAjL88DF2h87XCuu
	/ls4=
X-Google-Smtp-Source: AGHT+IFeS1aGikZa/2CCCW+bTi/6nxN6yDikauWJ9uayDE0wfguFSZ3Uanl+1QrXjk08rcRMni77Qg==
X-Received: by 2002:a17:907:3f25:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9961f78458mr97631566b.23.1728316369658;
        Mon, 07 Oct 2024 08:52:49 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/2] x86/fpu: Rework fpu_setup_fpu() uses to split it in two
Date: Mon,  7 Oct 2024 16:52:40 +0100
Message-ID: <20241007155240.17186-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was trying to do too many things at once and there was no clear way of
defining what it was meant to do. This commit splits the function in two.

  1. A function to return the FPU to power-on reset values.
  2. A x87/SSE state loader (equivalent to the old function when it took
     a data pointer).

The old function also had a concept of "default" values that the FPU
would be configured for in some cases but not others. This patch removes
that 3rd vague initial state and replaces it with power-on reset.

While doing this make sure the abridged control tag is consistent with the
manuals and starts as 0xFF

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
--
@Jan: The patch changed substantially. Are you still ok with this R-by?

v4:
  * Reworded commit message and title
  * Remove vcpu_default_fpu() and replaced its uses with vcpu_reset_fpu()
  * s/FTW_RESET/FXSAVE_FTW_RESET/ (plus comment)
  * Remove FCW_DEFAULT, as it's the leftover reset value from the 80287
    (which we largely don't care about anymore).
---
 xen/arch/x86/domain.c             |  7 +++--
 xen/arch/x86/hvm/hvm.c            | 12 +++-----
 xen/arch/x86/i387.c               | 51 +++++++++++--------------------
 xen/arch/x86/include/asm/i387.h   | 21 ++++++++++---
 xen/arch/x86/include/asm/xstate.h |  1 +
 5 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 89aad7e8978f..78a13e6812c9 100644
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
+        vcpu_reset_fpu(v);
 
     if ( !compat )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 77fe282118f7..44f4964aa036 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1163,10 +1163,10 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
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
@@ -4006,9 +4006,7 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
         v->arch.guest_table = pagetable_null();
     }
 
-    if ( v->arch.xsave_area )
-        v->arch.xsave_area->xsave_hdr.xstate_bv = 0;
-    vcpu_setup_fpu(v, v->arch.xsave_area, NULL, FCW_RESET);
+    vcpu_reset_fpu(v);
 
     arch_vcpu_regs_init(v);
     v->arch.user_regs.rip = ip;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index fbb9d3584a3d..916d9b572598 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -303,41 +303,26 @@ int vcpu_init_fpu(struct vcpu *v)
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
-
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
+    v->fpu_initialised = false;
+    *v->arch.xsave_area = (struct xsave_struct) {
+        .fpu_sse = {
+            .mxcsr = MXCSR_DEFAULT,
+            .fcw = FCW_RESET,
+            .ftw = FXSAVE_FTW_RESET,
+        },
+        .xsave_hdr.xstate_bv = X86_XCR0_X87,
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
index a783549db991..652d7ad2deb6 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -31,10 +31,23 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
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
index b4ee5559534a..07017cc4edfd 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -14,6 +14,7 @@
 
 #define FCW_DEFAULT               0x037f
 #define FCW_RESET                 0x0040
+#define FXSAVE_FTW_RESET          0xFF /* Abridged Tag Word format */
 #define MXCSR_DEFAULT             0x1f80
 
 extern uint32_t mxcsr_mask;
-- 
2.46.0


