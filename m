Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46A9BCF80
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830272.1245326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdI-0006Ky-Cy; Tue, 05 Nov 2024 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830272.1245326; Tue, 05 Nov 2024 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdH-0006Ac-Vi; Tue, 05 Nov 2024 14:34:11 +0000
Received: by outflank-mailman (input) for mailman id 830272;
 Tue, 05 Nov 2024 14:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8KdF-0002Lm-CA
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:09 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01cf7f9e-9b83-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:34:04 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539e690479cso5792053e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:34:04 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:34:03 -0800 (PST)
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
X-Inumbo-ID: 01cf7f9e-9b83-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxY2Y3ZjllLTliODMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjQ0LjYzMjIwNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817244; x=1731422044; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvXFoZIT084RN37AsraaKxNusw6LAdGsn4eMeymG1tw=;
        b=SqgSx6G48UPW3y6LyOs90IXEpVz6faYIRLyYPtqK2OamyFDF1Ib8EfXnvF/xHEciOG
         R78qMLc4/i48a0QEKOJGnQg81xVJXlGhmJuxHPADL6PlllBLu46/+0kHk8nMfzPzROaH
         Je9JuoravDhkmjWaECdv8YXTUGGl6Sugf+Gfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817244; x=1731422044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvXFoZIT084RN37AsraaKxNusw6LAdGsn4eMeymG1tw=;
        b=uZUDj4TU2vIYX0g+Egcxjnot2qx45MMI05pUkScgE3ATtv85J6hkDCakxXOcqG5jYz
         vvjFGBTcUYRjY2BT4bOSw9zTr9WOO0TXSI2Z3AWu4D6Jajptf+B6kmy2KhObvN/ZolCj
         8tnDLfhe29tU+TGvEndv/vKxBfQw4qALUu5QMSukunOIMANB2BkpmLLkYJyby0P8FN37
         EQxTBdFGKk6jLSRBqlZObmBJiPYk/O0HH0lLJrcoIwUkVT+/tBOOGAWcOH0Y46RHMouP
         sgYzydSTagAki0XGxM+5d+GofrhZDbDznAVloFQ2q4AUSykN0PEHKlHSEaA5HryZw1XM
         GinA==
X-Gm-Message-State: AOJu0YzzEb89n9yBiQV7KtMH/nJR0voWGNx606hf8T8xo1EitDfVe+HP
	TO286p5kW+DF55j5eARdL6pA6xpIM9tjCToxhZU+i7TXmpml0TN+Zhw+k1h6xGm5Dzz/k+JSUlC
	7
X-Google-Smtp-Source: AGHT+IEi8f1ooBIDDsZtziWzMdi1NElpo5P7/OCx24gHU/0VHdpp3Z4HwqasLJdsE3mVz4AD+p21gA==
X-Received: by 2002:a05:651c:98d:b0:2f7:53b8:ca57 with SMTP id 38308e7fff4ca-2fedb790772mr81567381fa.19.1730817243635;
        Tue, 05 Nov 2024 06:34:03 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 12/13] x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
Date: Tue,  5 Nov 2024 14:33:09 +0000
Message-ID: <20241105143310.28301-13-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * const-ified v in fpu_xrstor()
---
 xen/arch/x86/i387.c               | 26 ++++++++++++++++----------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             | 10 ++++++----
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 73c52ce2f577..c794367a3cc7 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -20,7 +20,8 @@
 /*     FPU Restore Functions   */
 /*******************************/
 /* Restore x87 extended state */
-static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
+static inline void fpu_xrstor(struct vcpu *v, struct xsave_struct *xsave_area,
+                              uint64_t mask)
 {
     bool ok;
 
@@ -30,16 +31,14 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xrstor(v, mask);
+    xrstor(v, xsave_area, mask);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
 
 /* Restore x87 FPU, MMX, SSE and SSE2 state */
-static inline void fpu_fxrstor(struct vcpu *v)
+static inline void fpu_fxrstor(struct vcpu *v, const fpusse_t *fpu_ctxt)
 {
-    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
-
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
      * is pending. Clear the x87 state here by setting it to fixed
@@ -195,6 +194,8 @@ static inline void fpu_fxsave(struct vcpu *v, fpusse_t *fpu_ctxt)
 /* Restore FPU state whenever VCPU is schduled in. */
 void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
 {
+    struct xsave_struct *xsave_area;
+
     /* Restore nonlazy extended state (i.e. parts not tracked by CR0.TS). */
     if ( !v->arch.fully_eager_fpu && !v->arch.nonlazy_xstate_used )
         goto maybe_stts;
@@ -209,12 +210,13 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
     if ( v->arch.fully_eager_fpu || xstate_all(v) )
     {
         if ( cpu_has_xsave )
-            fpu_xrstor(v, XSTATE_ALL);
+            fpu_xrstor(v, xsave_area, XSTATE_ALL);
         else
-            fpu_fxrstor(v);
+            fpu_fxrstor(v, &xsave_area->fpu_sse);
 
         v->fpu_initialised = 1;
         v->fpu_dirtied = 1;
@@ -224,9 +226,10 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
     }
     else
     {
-        fpu_xrstor(v, XSTATE_NONLAZY);
+        fpu_xrstor(v, xsave_area, XSTATE_NONLAZY);
         need_stts = true;
     }
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
  maybe_stts:
     if ( need_stts )
@@ -238,6 +241,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
  */
 void vcpu_restore_fpu_lazy(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
     ASSERT(!is_idle_vcpu(v));
 
     /* Avoid recursion. */
@@ -248,10 +252,12 @@ void vcpu_restore_fpu_lazy(struct vcpu *v)
 
     ASSERT(!v->arch.fully_eager_fpu);
 
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
     if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_LAZY);
+        fpu_xrstor(v, xsave_area, XSTATE_LAZY);
     else
-        fpu_fxrstor(v);
+        fpu_fxrstor(v, &xsave_area->fpu_sse);
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
     v->fpu_initialised = 1;
     v->fpu_dirtied = 1;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index bd286123c735..d2ef4c0b25f0 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -98,7 +98,7 @@ void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
 void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
-void xrstor(struct vcpu *v, uint64_t mask);
+void xrstor(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
 int __must_check validate_xstate(const struct domain *d,
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index f3e41f742c3c..b5e8d90ef600 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -374,11 +374,10 @@ void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
         ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
 }
 
-void xrstor(struct vcpu *v, uint64_t mask)
+void xrstor(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
 {
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
-    struct xsave_struct *ptr = v->arch.xsave_area;
     unsigned int faults, prev_faults;
 
     /*
@@ -992,6 +991,7 @@ int handle_xsetbv(u32 index, u64 new_bv)
     mask &= curr->fpu_dirtied ? ~XSTATE_FP_SSE : XSTATE_NONLAZY;
     if ( mask )
     {
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
         unsigned long cr0 = read_cr0();
 
         clts();
@@ -1011,7 +1011,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
             curr->fpu_dirtied = 1;
             cr0 &= ~X86_CR0_TS;
         }
-        xrstor(curr, mask);
+        xrstor(curr, xsave_area, mask);
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
+
         if ( cr0 & X86_CR0_TS )
             write_cr0(cr0);
     }
@@ -1078,7 +1080,7 @@ void xstate_set_init(uint64_t mask)
 
     xstate = VCPU_MAP_XSAVE_AREA(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
-    xrstor(v, mask);
+    xrstor(v, xstate, mask);
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
-- 
2.47.0


