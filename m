Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BE9B355C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826697.1241163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0Z-00041a-0T; Mon, 28 Oct 2024 15:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826697.1241163; Mon, 28 Oct 2024 15:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0Y-0003nf-Eb; Mon, 28 Oct 2024 15:50:18 +0000
Received: by outflank-mailman (input) for mailman id 826697;
 Mon, 28 Oct 2024 15:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0W-0008FV-42
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:16 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c7b84f-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:11 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so737391466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:11 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:10 -0700 (PDT)
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
X-Inumbo-ID: 50c7b84f-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130611; x=1730735411; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF/zafBR21s51XQ55xrj7f7wP/qB8eTuRfs/webK9Bc=;
        b=f1cDNAWcjJX4J37+CTPWbXlYgvwX/Jz5sjH2B7yHzmXkRJgU3ENIiLy+se7hD4X/5f
         t9zzo//623V/MD3zrgzOxkWBokb/ivVlcZh6YRNNOppxpM3jNzlNR3N17YI2Ge+ksIut
         nFLh2yig6t4c+KXcsQDmuGECIrIOdvL85Qi3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130611; x=1730735411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF/zafBR21s51XQ55xrj7f7wP/qB8eTuRfs/webK9Bc=;
        b=Zhfx38xO15hlv9imHY7hnIx1hzHQ3c2F052vKj6E4NiRsyNm+dSzNm3j+0yAF7gW5G
         EJcqZPGl/WdA3V7FiCBSthw92ZzpwM0lC8fINJdV3MmkhTCb3pv+BGxMcq71+97pS//S
         /iV7ilzkVp9oRS186o0mr2XJFcHKUy9QpLpmFweP5ZVM3G4vW+mQSZp7+TRqPlIx58Il
         5LHPrhO5oHuc5LQt7jD+WnHDcprog85N9BVo/Ki0nOa5tumZQrg1P8GVXxLPKNWKTwsh
         wQAYMdoF1kyzuDZuV2GS8mBRGJKDR8VrD/9lFgeSw+4i9PrUbp+VMYIl1m9mNUjKtaUJ
         lGUg==
X-Gm-Message-State: AOJu0YxTLAf+7xwjjeSJ6gE8lTThIfWiFDN4DQ8oma0mBFUK3xvddnLC
	WtvNvVI2QDwiOcajB4ApCTf/mlcmRwpSMmgMK/dW+GnIuKStS+k7vVbuYImcHjslb2/VYZ9HyRS
	H
X-Google-Smtp-Source: AGHT+IF3/bhrLgSOziE7SwxQmzzMAg6HWwkCFCduzdTekcWhgq6v2MAPrFNTaOqxjidfqXp1wB6P8Q==
X-Received: by 2002:a17:906:f591:b0:a9a:9df:5581 with SMTP id a640c23a62f3a-a9de5ee8bacmr837394266b.38.1730130611065;
        Mon, 28 Oct 2024 08:50:11 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 13/14] x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
Date: Mon, 28 Oct 2024 15:49:31 +0000
Message-ID: <20241028154932.6797-14-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/i387.c               | 26 ++++++++++++++++----------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             | 10 ++++++----
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 5950fbcf272e..7e1fb8ad8779 100644
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
 
@@ -31,16 +32,14 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
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
@@ -197,6 +196,8 @@ static inline void fpu_fxsave(struct vcpu *v, fpusse_t *fpu_ctxt)
 /* Restore FPU state whenever VCPU is schduled in. */
 void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
 {
+    struct xsave_struct *xsave_area;
+
     /* Restore nonlazy extended state (i.e. parts not tracked by CR0.TS). */
     if ( !v->arch.fully_eager_fpu && !v->arch.nonlazy_xstate_used )
         goto maybe_stts;
@@ -211,12 +212,13 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
+    xsave_area = vcpu_map_xsave_area(v);
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
@@ -226,9 +228,10 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
     }
     else
     {
-        fpu_xrstor(v, XSTATE_NONLAZY);
+        fpu_xrstor(v, xsave_area, XSTATE_NONLAZY);
         need_stts = true;
     }
+    vcpu_unmap_xsave_area(v, xsave_area);
 
  maybe_stts:
     if ( need_stts )
@@ -240,6 +243,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
  */
 void vcpu_restore_fpu_lazy(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
     ASSERT(!is_idle_vcpu(v));
 
     /* Avoid recursion. */
@@ -250,10 +254,12 @@ void vcpu_restore_fpu_lazy(struct vcpu *v)
 
     ASSERT(!v->arch.fully_eager_fpu);
 
+    xsave_area = vcpu_map_xsave_area(v);
     if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_LAZY);
+        fpu_xrstor(v, xsave_area, XSTATE_LAZY);
     else
-        fpu_fxrstor(v);
+        fpu_fxrstor(v, &xsave_area->fpu_sse);
+    vcpu_unmap_xsave_area(v, xsave_area);
 
     v->fpu_initialised = 1;
     v->fpu_dirtied = 1;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 104fe0d44173..43f7731c2b17 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -98,7 +98,7 @@ void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
 void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
-void xrstor(struct vcpu *v, uint64_t mask);
+void xrstor(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
 int __must_check validate_xstate(const struct domain *d,
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 518388e6e272..aa5c062f7e51 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -374,11 +374,10 @@ void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
         ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
 }
 
-void xrstor(struct vcpu *v, uint64_t mask)
+void xrstor(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
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
+        struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
         unsigned long cr0 = read_cr0();
 
         clts();
@@ -1010,7 +1010,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
             curr->fpu_dirtied = 1;
             cr0 &= ~X86_CR0_TS;
         }
-        xrstor(curr, mask);
+        xrstor(curr, xsave_area, mask);
+        vcpu_unmap_xsave_area(curr, xsave_area);
+
         if ( cr0 & X86_CR0_TS )
             write_cr0(cr0);
     }
@@ -1080,7 +1082,7 @@ void xstate_set_init(uint64_t mask)
 
     xstate = vcpu_map_xsave_area(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
-    xrstor(v, mask);
+    xrstor(v, xstate, mask);
     vcpu_unmap_xsave_area(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
-- 
2.47.0


