Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AAB94BEAA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774152.1184651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PO-000302-G2; Thu, 08 Aug 2024 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774152.1184651; Thu, 08 Aug 2024 13:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PO-0002sL-Bk; Thu, 08 Aug 2024 13:42:26 +0000
Received: by outflank-mailman (input) for mailman id 774152;
 Thu, 08 Aug 2024 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3PM-0002jZ-Uj
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:24 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b106731-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:42:24 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135dso1308792a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:24 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d35172sm676426a12.71.2024.08.08.06.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:22 -0700 (PDT)
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
X-Inumbo-ID: 0b106731-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124543; x=1723729343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwRkrDUsnDDc1HKYet7Tp7o3hYwj8I4tk9q0yVqzszQ=;
        b=TdwrDRqg+IVcDuFKM3p7ZotyXu6Tj6gIKTl+fgM+mhs2j2FVKp3a9JLvUhpDRzO/IH
         4UO49iVEir8UDSaIsSdxce12K4gV5CdogzR8rL1iDpWu4ZZkrNNTCdiueBHDO1qIyBsp
         s6BbQKCeMoDuCTFEcpX6kHCRMJM6LYgM095n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124543; x=1723729343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwRkrDUsnDDc1HKYet7Tp7o3hYwj8I4tk9q0yVqzszQ=;
        b=Ut5FKnapOuk9QBrwHig0D4GsVg+MA/XPitZBSo4z1r3b/mTYxmkiiEqXolhw8cCQVa
         N3Q2VHvt3VvPuxIDfqXsjNm6groWwTp2yrvq3bOjRDb8ebN99i4RRTdJOrUsKrkeb8dL
         vajaIqr8vAyaLhztJWNwjjYBLf06k+SHvm9ax7/9jyb/DIW/7AHa/gxr4geAVPlUL3fQ
         WjoHfaKRI4a58lMrt6twPvH45NBD9QJBvbVBSpcQ3o35mcYjxqjsOvIBhrL28KvDM9m1
         zmiC45xOlIi6v1jEEG9zXBmXrhzS4yVOVY9BbMpl02eQ9OLFKQFieP30MZzJe1++Vsig
         fspg==
X-Gm-Message-State: AOJu0Yx2XZpPW5gre56Aa99+a3SeVeXIuA9dNBWkBQVfNOVjiY50f/QN
	lcBUchua49+Ux/FXjs90wmujgf+E5lRtP7rBoWXZnRix9LL6bs5obC4UsrJ/DnfteJDNdoscxzi
	H
X-Google-Smtp-Source: AGHT+IFDlS+F7uKLxzrgTijdmiqpplkXz8gvxBeDAwkAnMvGtlIBNWE5icxfplXQXacuAwrTaPqKmg==
X-Received: by 2002:a05:6402:3591:b0:5af:e7d1:9532 with SMTP id 4fb4d7f45d1cf-5bbb2196e12mr1342204a12.8.1723124543197;
        Thu, 08 Aug 2024 06:42:23 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] x86/fpu: Split fpu_setup_fpu() in two
Date: Thu,  8 Aug 2024 14:41:50 +0100
Message-ID: <20240808134150.29927-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was trying to do too many things at once and there was no clear way of
defining what it was meant to do.This commit splits the function in two.

  1. A reset function, parameterized by the FCW value. FCW_RESET means to reset
     the state to power-on reset values, while FCW_DEFAULT means to reset to the
     default values present during vCPU creation.
  2. A x87/SSE state loader (equivalent to the old function when it took a data
     pointer).

While at it, make sure the abridged tag is consistent with the manuals and
start as 0xFF.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:

  * Reworded comment about pre-Xen 4.1 migrations.
  * Reset abridged FTW to -1 (tag=0x5555), as per the manuals.
  * Undo const cast-away.
  * Split vcpu_reset_fpu() into vcpu_default_fpu()
    * vcpu_init_fpu() already exists.
  * Removed backticks from comments
---
 xen/arch/x86/domain.c             |  7 ++--
 xen/arch/x86/hvm/hvm.c            | 27 ++++++++++----
 xen/arch/x86/i387.c               | 60 +++++++++++++++----------------
 xen/arch/x86/include/asm/i387.h   | 28 ++++++++++++---
 xen/arch/x86/include/asm/xstate.h |  1 +
 5 files changed, 77 insertions(+), 46 deletions(-)

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
index 6607dba562a4..83cb21884ce6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1164,10 +1164,25 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     seg.attr = ctxt.ldtr_arbytes;
     hvm_set_segment_register(v, x86_seg_ldtr, &seg);
 
-    /* Cover xsave-absent save file restoration on xsave-capable host. */
-    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
-                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
-                   FCW_RESET);
+    /*
+     * On Xen 4.1 and later the FPU state is restored on later HVM context in
+     * the migrate stream, so what we're doing here is initialising the FPU
+     * state for guests from even older versions of Xen.
+     *
+     * In particular:
+     *   1. If there's an XSAVE context later in the stream what we do here for
+     *      the FPU doesn't matter because it'll be overriden later.
+     *   2. If there isn't and the guest didn't use extended states it's still
+     *      fine because we have all the information we need here.
+     *   3. If there isn't and the guest DID use extended states (could've
+     *      happened prior to Xen 4.1) then we're in a pickle because we have
+     *      to make up non-existing state. For this case we initialise the FPU
+     *      as using x87/SSE only because the rest of the state is gone.
+     */
+    if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
+        vcpu_setup_fpu(v, &ctxt.fpu_regs);
+    else
+        vcpu_reset_fpu(v);
 
     v->arch.user_regs.rax = ctxt.rax;
     v->arch.user_regs.rbx = ctxt.rbx;
@@ -4007,9 +4022,7 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
         v->arch.guest_table = pagetable_null();
     }
 
-    if ( v->arch.xsave_area )
-        v->arch.xsave_area->xsave_hdr.xstate_bv = 0;
-    vcpu_setup_fpu(v, v->arch.xsave_area, NULL, FCW_RESET);
+    vcpu_reset_fpu(v);
 
     arch_vcpu_regs_init(v);
     v->arch.user_regs.rip = ip;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index fbb9d3584a3d..af5ae805998a 100644
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
+        .xsave_hdr.xstate_bv = fcw == X86_XCR0_X87,
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


