Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E7292BED5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756380.1164999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8r-0003XO-9f; Tue, 09 Jul 2024 15:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756380.1164999; Tue, 09 Jul 2024 15:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8r-0003Vv-2q; Tue, 09 Jul 2024 15:52:33 +0000
Received: by outflank-mailman (input) for mailman id 756380;
 Tue, 09 Jul 2024 15:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRD8p-0002zY-V3
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:52:31 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f73f0be-3e0b-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:52:30 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77c349bb81so473315366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:52:30 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm1181254a12.73.2024.07.09.08.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:52:27 -0700 (PDT)
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
X-Inumbo-ID: 3f73f0be-3e0b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720540349; x=1721145149; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuFd2hfIdjuT+R3qsHTSDRIg4VyqLItXrSkNQkDAtfs=;
        b=RonlGDSILdLBdOupjKsuvGJQJWrA12Mf/FokRUhB3bl4/i24ZlQKFR06IW34WlWXnj
         syopyfMUKhs8ZpEyGXRyq9yeexAii63UonhMZLqJ6rdb0sJAVij8KNry5M62midFpZ5+
         1exoYy39e+aZswMoA5NXFk6kGACc2AUmh6d4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540349; x=1721145149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuFd2hfIdjuT+R3qsHTSDRIg4VyqLItXrSkNQkDAtfs=;
        b=NOwrHoejqjQ3eRH84NCnbZZ1T/5wo4lAJ3r3Bh4GuPLDgneI/pw526qk83ni4yYVxD
         NzhYSHjoN0aIElkLoXL+rHdpPpQpeqpNOxkgSZUlofodOMOOIjaQvoYfyoPJPtqkeJOZ
         TT6yyuNXc6Pj2718My5J52d9R/jbQaRyiLLJ4c3MU95/9VJcIry6fKae+OASt9K1dVBB
         oxtrX+VGNdEIpDLWZcvi5AIjPiv/WswKwuyb9+Fg+9ELQ1cmT6ngULHdjOTZ6r0VRvAh
         DneZfDLLxOdOArZtpLZEUEknQ0XODpEFbrXmgb6s907HDH2VnfvtSsZ3Bwrr+hbgq6/b
         1u5A==
X-Gm-Message-State: AOJu0YxUs7pqiXlTeS3pd+UxYRyZBH+/cbhIiIo6d2apnWIUqX0GbDvZ
	e9WxNfUppP0HZDh2yaEWohBTDDnYc2Mh78G3W7jJVvgAXVUtDC8UtlMRTJm4B8I7XC4+zj3/m3q
	L
X-Google-Smtp-Source: AGHT+IGSqsWkv5AJOVDphbkKjMEr5qDIFU7LaUmo4nztdNX6OcUgW+lo1jRzI4Zv9IeaSa4eoCvFyA==
X-Received: by 2002:a17:906:2bc5:b0:a6f:1ad5:20e0 with SMTP id a640c23a62f3a-a780b705464mr178002266b.45.1720540348131;
        Tue, 09 Jul 2024 08:52:28 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 2/4] x86/fpu: Create a typedef for the x87/SSE area inside "struct xsave_struct"
Date: Tue,  9 Jul 2024 16:52:21 +0100
Message-Id: <2e2763f4980c98cca0e2c3be057b2299295bb616.1720538832.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720538832.git.alejandro.vallejo@cloud.com>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Making the union non-anonymous causes a lot of headaches, because a lot of code
relies on it being so, but it's possible to make a typedef of the anonymous
union so all callsites currently relying on typeof() can stop doing so directly.

This commit creates a `fpusse_t` typedef to the anonymous union at the head of
the XSAVE area and uses it instead of typeof().

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/emulate.c        | 5 ++---
 xen/arch/x86/i387.c               | 8 ++++----
 xen/arch/x86/include/asm/xstate.h | 2 ++
 xen/arch/x86/xstate.c             | 2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b40..65ee70ce67db 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2364,8 +2364,7 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const typeof(curr->arch.xsave_area->fpu_sse) *fpu_ctxt =
-            curr->arch.fpu_ctxt;
+        const fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2405,7 +2404,7 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        typeof(curr->arch.xsave_area->fpu_sse) *fpu_ctxt = curr->arch.fpu_ctxt;
+        fpusse_t *fpu_ctxt = curr->arch.fpu_ctxt;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index fcdee10a6e69..89804435b659 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -39,7 +39,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 /* Restore x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxrstor(struct vcpu *v)
 {
-    const typeof(v->arch.xsave_area->fpu_sse) *fpu_ctxt = v->arch.fpu_ctxt;
+    const fpusse_t *fpu_ctxt = v->arch.fpu_ctxt;
 
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
@@ -152,7 +152,7 @@ static inline void fpu_xsave(struct vcpu *v)
 /* Save x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxsave(struct vcpu *v)
 {
-    typeof(v->arch.xsave_area->fpu_sse) *fpu_ctxt = v->arch.fpu_ctxt;
+    fpusse_t *fpu_ctxt = v->arch.fpu_ctxt;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
 
     if ( fip_width != 4 )
@@ -322,7 +322,7 @@ int vcpu_init_fpu(struct vcpu *v)
                                     __alignof(v->arch.xsave_area->fpu_sse));
         if ( v->arch.fpu_ctxt )
         {
-            typeof(v->arch.xsave_area->fpu_sse) *fpu_sse = v->arch.fpu_ctxt;
+            fpusse_t *fpu_sse = v->arch.fpu_ctxt;
 
             fpu_sse->fcw = FCW_DEFAULT;
             fpu_sse->mxcsr = MXCSR_DEFAULT;
@@ -343,7 +343,7 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
      * accesses through both pointers alias one another, and the shorter form
      * is used here.
      */
-    typeof(xsave_area->fpu_sse) *fpu_sse = v->arch.fpu_ctxt;
+    fpusse_t *fpu_sse = v->arch.fpu_ctxt;
 
     ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index f0eeb13b87a4..ebeb2a3dcaf9 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -82,6 +82,8 @@ struct __attribute__((aligned (64))) xsave_struct
     char data[];                             /* Variable layout states */
 };
 
+typedef typeof(((struct xsave_struct){}).fpu_sse) fpusse_t;
+
 struct xstate_bndcsr {
     uint64_t bndcfgu;
     uint64_t bndstatus;
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 68cdd8fcf021..5c4144d55e89 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -846,7 +846,7 @@ void xstate_init(struct cpuinfo_x86 *c)
 
     if ( bsp )
     {
-        static typeof(current->arch.xsave_area->fpu_sse) __initdata ctxt;
+        static fpusse_t __initdata ctxt;
 
         asm ( "fxsave %0" : "=m" (ctxt) );
         if ( ctxt.mxcsr_mask )
-- 
2.34.1


