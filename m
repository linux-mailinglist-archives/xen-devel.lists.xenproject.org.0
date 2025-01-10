Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B5A091F4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869527.1281052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4o-0004U3-5C; Fri, 10 Jan 2025 13:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869527.1281052; Fri, 10 Jan 2025 13:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4n-0004Lh-JG; Fri, 10 Jan 2025 13:29:25 +0000
Received: by outflank-mailman (input) for mailman id 869527;
 Fri, 10 Jan 2025 13:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4l-0000vX-32
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e695ffc9-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso3438940a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:21 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:19 -0800 (PST)
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
X-Inumbo-ID: e695ffc9-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515761; x=1737120561; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI//zXjGi7gOKfBwz6cTp3sciH/k2uuKEBMoWxpEBrQ=;
        b=IVpQF2uNpYLUNdDE8CeswGFQI3fv/YRCcOrUp0gOtsVDJWDzJTTmIVn1xXOcljxreB
         UbML3L8cgBDo+9omI6ZtMV++j9iil/FFy/A8sPAxhmV9zdXL22CWGt1+rLqVVxJp1q9E
         PNGsClpKL0md/7WQLzjcyMv2xi5sA8I8sLPuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515761; x=1737120561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI//zXjGi7gOKfBwz6cTp3sciH/k2uuKEBMoWxpEBrQ=;
        b=ogTiPP+Ww64VbJgQj3U1ThZmeUu5A2zqO5MvUTWu/eVbUfy/CG+WqjP/ZGVphd/ZbX
         Misnqzk6GiAYKOyqh8kuyNK88OJwTSZWU7NtO1HPdM9yw462x8MW1m8iUk3R9Lb+g0Zl
         lkFouE5bhQ+sVlN1VWR2b8QBdZIt58CezFpnepujR6u1hFYD6kg9qyj+KiHNTxHw/0mu
         ozqFYOt7MATXretl32Ah3rzDBoVTF3sKXq7FkfxLsOSibpoxjLtjNGx9O59ROmto0Z08
         RX7E380JcHnEYRY1vvz6L2aN00SfTGN64HZFJzV3mKSzxuyrLN1YcTbE35YbjmwGP0++
         uYPQ==
X-Gm-Message-State: AOJu0Yw+A3Gh2+A4ThGnxqzxXRuAl6j11rJpL1ccQmI5RoKl07iwLpEw
	3oQ3Stai7VwJUxBeCUy6KBWMHAOlmfPImByXhYcs0DwOezcN3xeFiFBIvSqdYOqNsaN9yY00SAR
	7DPOnMQ==
X-Gm-Gg: ASbGncuG7F/rODQe5BoQ2lOOqvsZ5P9TIjlpgE7KQpsjjCDqEK0qXgQGu0VpwRfX+bJ
	qgils5DhbX76IEUO9rmhg7CZgv3iMii78nLpoqydvcXg92FTf2N25vEesMKL9VBylwTT5CtUjBV
	h0xcuULFEGl2Aih+87R3dsoxTJYgLoFD/09juj8ZgBG1uM32pVDmxwqLBsfk0bNQkwzK/as0EwF
	8K4o5Ih0Z1Q/UCis1rQKfXFVudYq4LTY6FOHVDhhrtULx08UwlHZi+FKwpQAGag6Xp/6Fv16FpB
	xvE=
X-Google-Smtp-Source: AGHT+IHl+QVKSzvBQaSukQzB8NUKHv3g4BYe4c8rMerq7z2zRKYMYXHuIotBpbj7sN26MOkPWBfcVg==
X-Received: by 2002:a05:6402:4414:b0:5d9:a84:d4b6 with SMTP id 4fb4d7f45d1cf-5d972d26ac2mr8691628a12.0.1736515760631;
        Fri, 10 Jan 2025 05:29:20 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 11/12] x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
Date: Fri, 10 Jan 2025 13:28:22 +0000
Message-ID: <20250110132823.24348-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * const-ified v in fpu_xrstor()
  * Removed v in fpu_fxrstor()

v1->v2:
  * const-ified v in xrstor()
    ( it was incorrectly reported in v2 as it being fpu_xrstor() )
---
 xen/arch/x86/i387.c               | 26 ++++++++++++++++----------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             | 10 ++++++----
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 11d06f921269..943ae668606f 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -20,7 +20,8 @@
 /*     FPU Restore Functions   */
 /*******************************/
 /* Restore x87 extended state */
-static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
+static inline void fpu_xrstor(const struct vcpu *v,
+                              struct xsave_struct *xsave_area, uint64_t mask)
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
+static inline void fpu_fxrstor(const fpusse_t *fpu_ctxt)
 {
-    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
-
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
      * is pending. Clear the x87 state here by setting it to fixed
@@ -195,6 +194,8 @@ static inline void fpu_fxsave(const struct vcpu *v, fpusse_t *fpu_ctxt)
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
+            fpu_fxrstor(&xsave_area->fpu_sse);
 
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
+        fpu_fxrstor(&xsave_area->fpu_sse);
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
     v->fpu_initialised = 1;
     v->fpu_dirtied = 1;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 87f05dbca6f4..7d160d2b54be 100644
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
index 24053b394200..3d4fb7664c5f 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -376,11 +376,10 @@ void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
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
@@ -994,6 +993,7 @@ int handle_xsetbv(u32 index, u64 new_bv)
     mask &= curr->fpu_dirtied ? ~XSTATE_FP_SSE : XSTATE_NONLAZY;
     if ( mask )
     {
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
         unsigned long cr0 = read_cr0();
 
         clts();
@@ -1013,7 +1013,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
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
@@ -1080,7 +1082,7 @@ void xstate_set_init(uint64_t mask)
 
     xstate = VCPU_MAP_XSAVE_AREA(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
-    xrstor(v, mask);
+    xrstor(v, xstate, mask);
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
-- 
2.47.1


