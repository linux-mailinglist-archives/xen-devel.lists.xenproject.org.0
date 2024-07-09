Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B776792BED7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756381.1165013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8t-00042M-Ki; Tue, 09 Jul 2024 15:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756381.1165013; Tue, 09 Jul 2024 15:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8t-0003zl-Gr; Tue, 09 Jul 2024 15:52:35 +0000
Received: by outflank-mailman (input) for mailman id 756381;
 Tue, 09 Jul 2024 15:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRD8r-0002zY-Bh
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:52:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 403eb1a2-3e0b-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:52:31 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso5770798a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:52:31 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm1181254a12.73.2024.07.09.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:52:30 -0700 (PDT)
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
X-Inumbo-ID: 403eb1a2-3e0b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720540351; x=1721145151; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNkmBJzEXcz2KBPKDeUXYjkt3AnZqwx9CjUlb8rUPSk=;
        b=cNRC02mPsgCxTMSIftyD7WmM3tRiO/JjJvtuazvKd+V89U64qUKalgXJxPWcsKW12v
         MqAejNNS2uVTsPlEJ+zPhDont9Xadayg+U644LD82fsykXMFbplBqdBiJYC/ZRW0ROJR
         yZUhk3HOUbWuBSEzT5tohI8s5hXNkT/iN8Uj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540351; x=1721145151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNkmBJzEXcz2KBPKDeUXYjkt3AnZqwx9CjUlb8rUPSk=;
        b=Wm42QZQKYS/98zEVpTUxAMQmf+9CPifGxjbCoLLFgVifyVfd/24ZUMKdhwPua/v31T
         7gFhDT4qd/ukdt+NcdyHwtr/IFJmi0lt4RJ/y8/En0AGixzELDfzUcK079LBs8H5oMc5
         wYKETca1wQfc7z+m7XWzhaH5chmpQdOHZFD0y40R6DhySJM3NLNcLw5Nuv8Ha/1pKvKB
         2DWz1Setz5eT3Rdr4HMuPczJMXd73e+R1hYeZs4+8GuWaLPBgSivuZHCkJIa2EvkvM4P
         oiDOco5a4vxUZUQRLSFEgzNFyEcKDQnl22FPesqe7VVoaraGN4pZZsa0fjM3RJ2DwfyR
         Eweg==
X-Gm-Message-State: AOJu0YyfTKNzljICbWLvGjF26xg+T7Q7s7aC1ekdkFvWembHHJDUneSy
	qVQGgmaQH1IoD9fnCZrEOqBxYWnrJw27cVHh1pl0SmwW06w/7rh7+7CwAJF6hNioBMLVKpjF25P
	A
X-Google-Smtp-Source: AGHT+IExzK2GEXIrMlan9uaEtW4BhXbWTYYP9wHO4l3cjDaACOrct0xZK0SpUV1xuDHRRGbXmAK44g==
X-Received: by 2002:a50:ee85:0:b0:57d:619:7721 with SMTP id 4fb4d7f45d1cf-594bb5807c7mr1792406a12.21.1720540350701;
        Tue, 09 Jul 2024 08:52:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 4/4] x86/fpu: Split fpu_setup_fpu() in two
Date: Tue,  9 Jul 2024 16:52:23 +0100
Message-Id: <da30dedcfa68d7c30375b96c85424e13ec6d458b.1720538832.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720538832.git.alejandro.vallejo@cloud.com>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's doing too many things at once and there's no clear way of defining what
it's meant to do. This patch splits the function in two.

  1. A reset function, parameterized by the FCW value. FCW_RESET means to reset
     the state to power-on reset values, while FCW_DEFAULT means to reset to the
     default values present during vCPU creation.
  2. A x87/SSE state loader (equivalent to the old function when it took a data
     pointer).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I'm still not sure what the old function tries to do. The state we start vCPUs
in is _similar_ to the after-finit, but it's not quite (`ftw` is not -1). I went
for the "let's not deviate too much from previous behaviour", but maybe we did
intend for vCPUs to start as if `finit` had just been executed?
---
 xen/arch/x86/domain.c           |  7 +++--
 xen/arch/x86/hvm/hvm.c          | 19 ++++++++-----
 xen/arch/x86/i387.c             | 50 +++++++++++----------------------
 xen/arch/x86/include/asm/i387.h | 27 +++++++++++++++---
 4 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e70..245899cc792f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1198,9 +1198,10 @@ int arch_set_info_guest(
          is_pv_64bit_domain(d) )
         v->arch.flags &= ~TF_kernel_mode;
 
-    vcpu_setup_fpu(v, v->arch.xsave_area,
-                   flags & VGCF_I387_VALID ? &c.nat->fpu_ctxt : NULL,
-                   FCW_DEFAULT);
+    if ( flags & VGCF_I387_VALID )
+        vcpu_setup_fpu(v, &c.nat->fpu_ctxt);
+    else
+        vcpu_reset_fpu(v, FCW_DEFAULT);
 
     if ( !compat )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 09b1426ee314..bedbd2a0b888 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1162,10 +1162,17 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     seg.attr = ctxt.ldtr_arbytes;
     hvm_set_segment_register(v, x86_seg_ldtr, &seg);
 
-    /* Cover xsave-absent save file restoration on xsave-capable host. */
-    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
-                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
-                   FCW_RESET);
+    /*
+     * On Xen 4.1 and later the FPU state is restored on a later HVM context, so
+     * what we're doing here is initialising the FPU state for guests from even
+     * older versions of Xen. In general such guests only use legacy x87/SSE
+     * state, and if they did use XSAVE then our best-effort strategy is to make
+     * an XSAVE header for x87 and SSE hoping that's good enough.
+     */
+    if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
+        vcpu_setup_fpu(v, &ctxt.fpu_regs);
+    else
+        vcpu_reset_fpu(v, FCW_RESET);
 
     v->arch.user_regs.rax = ctxt.rax;
     v->arch.user_regs.rbx = ctxt.rbx;
@@ -4005,9 +4012,7 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
         v->arch.guest_table = pagetable_null();
     }
 
-    if ( v->arch.xsave_area )
-        v->arch.xsave_area->xsave_hdr.xstate_bv = 0;
-    vcpu_setup_fpu(v, v->arch.xsave_area, NULL, FCW_RESET);
+    vcpu_reset_fpu(v, FCW_RESET);
 
     arch_vcpu_regs_init(v);
     v->arch.user_regs.rip = ip;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index a964b84757ec..7851f1b3f6e4 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -310,41 +310,25 @@ int vcpu_init_fpu(struct vcpu *v)
     return xstate_alloc_save_area(v);
 }
 
-void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
-                    const void *data, unsigned int fcw_default)
+void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw)
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
+            .fcw = fcw,
+        },
+        .xsave_hdr.xstate_bv = fcw == FCW_RESET ? X86_XCR0_X87 : 0,
+    };
+}
 
-    if ( xsave_area )
-        xsave_area->xsave_hdr.xcomp_bv = 0;
+void vcpu_setup_fpu(struct vcpu *v, const void *data)
+{
+    v->fpu_initialised = true;
+    *v->arch.xsave_area = (struct xsave_struct) {
+        .fpu_sse = *(fpusse_t*)data,
+        .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
+    };
 }
 
 /* Free FPU's context save area */
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index a783549db991..ce699fc66663 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -31,10 +31,29 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
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
+ * Restore `v`'s FPU to known values
+ *
+ * If fcw == FCW_RESET, then the reset state is power-on RESET.
+ *
+ * Otherwise `mxcsr` is set to `MXCSR_DEFAULT`, `fcw` is overriden with the
+ * `fcw` argument and everything else is zeroed out.
+ *
+ * @param v   vCPU containing the FPU
+ * @param fcw Intended FPU Control Word
+ */
+void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw);
+
+/*
+ * Load x87/SSE state into `v`'s FPU
+ *
+ * Overrides the XSAVE header to set the state components to be x87 and SSE.
+ *
+ * @param v    vCPU containing the FPU
+ * @param data 512-octet blob for x87/SSE state
+ */
+void vcpu_setup_fpu(struct vcpu *v, const void *data);
 #endif /* __ASM_I386_I387_H */
-- 
2.34.1


