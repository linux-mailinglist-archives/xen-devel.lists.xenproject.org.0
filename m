Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD290B846
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742537.1149357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKI-0003C6-27; Mon, 17 Jun 2024 17:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742537.1149357; Mon, 17 Jun 2024 17:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKH-00039D-TN; Mon, 17 Jun 2024 17:39:29 +0000
Received: by outflank-mailman (input) for mailman id 742537;
 Mon, 17 Jun 2024 17:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKG-00036h-Vr
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b93d0cf-2cd0-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 19:39:27 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so564426666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:27 -0700 (PDT)
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
X-Inumbo-ID: 8b93d0cf-2cd0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645967; x=1719250767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJvTgVXIVw103tYxIPd995a8BWqGdmptrn91B2t2Nw8=;
        b=vXETgQC29QAKPiVQWNRD9KJ+OuWoQrXbOHBHKn0j+9HFiDMnmYso40/nXYqfXdloaV
         rQOD9bo0zPPAIxjiy+sO7e3X3cnL7HfnEYc2j/xvTOU/ttwFvq1w5c/L2ynZbqI26EYH
         hI2gg8l24qNpQsN9Ymj3DDkzP7b3jkmGS32qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645967; x=1719250767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJvTgVXIVw103tYxIPd995a8BWqGdmptrn91B2t2Nw8=;
        b=vJhmgK+/uqQUBZtJ5xHP0IxN4k97yZ25Os7tbuk/yq2k6tLO6hst0I8IO4xWTP3JVU
         Yi/eZX0sU806jbdLyvywLrYCnBv5FwocEXmUKi9uMX8SN4aGaGW7pEjVjeyT74UrgFVk
         m8xKqYMgNIER/DJPfJGk7zVZ3cFAXWsfPpeYxLbwC4zrItkoUWCmCobxK73ZC5AYz9+g
         pEskoYok3M29Q8Ow/StVMbMSdX/dTdrv13973J5pMgh8pV1vJGwi840dnJVLciQ0dE3p
         8JKf8fpQZOvMq/NJcVKPhKkxwIncbnbA7kj7Ij8YP6/R0eSWLByH6IsDTto+E//yOYUq
         3DGA==
X-Gm-Message-State: AOJu0YykImBmENl4hy6HS87EiCWzFawXQCmem+js082zKTbvTtRJQof4
	EmuRKwKd1OOsY6gjvEZRl50x7KK6A2DKsU8/ewxIOSrzRmuFdcrxNjnK9KGoowpy/i7ANXEf6Jp
	04wE=
X-Google-Smtp-Source: AGHT+IHFvU0Yf0KF7Z3VV7Z6VimGbUT9n427p2ZJ0GGUaMHTo0dABR06CfcAJSIZ2fNhWii6+O+jNg==
X-Received: by 2002:a17:906:d111:b0:a6f:10d0:fb85 with SMTP id a640c23a62f3a-a6f60d203e1mr638499366b.19.1718645967214;
        Mon, 17 Jun 2024 10:39:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 4/7] x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
Date: Mon, 17 Jun 2024 18:39:18 +0100
Message-Id: <20240617173921.1755439-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're soon going to need a compressed helper of the same form.

The size of the uncompressed image depends on the single element with the
largest offset + size.  Sadly this isn't always the element with the largest
index.

Name the per-xstate-component cpu_policy struture, for legibility of the logic
in xstate_uncompressed_size().  Cross-check with hardware during boot, and
remove hw_uncompressed_size().

This means that the migration paths don't need to mess with XCR0 just to
sanity check the buffer size.  It also means we can drop the "fastpath" check
against xfeature_mask (there to skip some XCR0 writes); this path is going to
be dead logic the moment Xen starts using supervisor states itself.

The users of hw_uncompressed_size() in xstate_init() can (and indeed need) to
be replaced with CPUID instructions.  They run with feature_mask in XCR0, and
prior to setup_xstate_features() on the BSP.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Scan all features.  LWP/APX_F are out-of-order.
v3:
 * Rebase over boot time check.
 * Use the raw CPU policy.
v4:
 * Explain the ASSERT() checking X86_XCR0_STATES.
 * Drop the xfeature_mask check.
 * Drop the comment about 0, because we'll probably never be able to clean up
   the use from the CPUID path.
---
 xen/arch/x86/domctl.c                |  2 +-
 xen/arch/x86/hvm/hvm.c               |  2 +-
 xen/arch/x86/include/asm/xstate.h    |  2 +-
 xen/arch/x86/xstate.c                | 76 ++++++++++++++++------------
 xen/include/xen/lib/x86/cpu-policy.h |  2 +-
 5 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 335aedf46d03..9190e11faaa3 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -833,7 +833,7 @@ long arch_do_domctl(
         uint32_t offset = 0;
 
 #define PV_XSAVE_HDR_SIZE (2 * sizeof(uint64_t))
-#define PV_XSAVE_SIZE(xcr0) (PV_XSAVE_HDR_SIZE + xstate_ctxt_size(xcr0))
+#define PV_XSAVE_SIZE(xcr0) (PV_XSAVE_HDR_SIZE + xstate_uncompressed_size(xcr0))
 
         ret = -ESRCH;
         if ( (evc->vcpu >= d->max_vcpus) ||
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8334ab171110..7f4b627b1f5f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1206,7 +1206,7 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
                                            save_area) + \
-                                  xstate_ctxt_size(xcr0))
+                                  xstate_uncompressed_size(xcr0))
 
 static int cf_check hvm_save_cpu_xsave_states(
     struct vcpu *v, hvm_domain_context_t *h)
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index c08c267884f0..f5115199d4f9 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -107,7 +107,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size);
 void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
-unsigned int xstate_ctxt_size(u64 xcr0);
+unsigned int xstate_uncompressed_size(uint64_t xcr0);
 
 static inline uint64_t xgetbv(unsigned int index)
 {
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 650206d9d2b6..8edc4792a8fd 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -8,6 +8,8 @@
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
+
+#include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/i387.h>
@@ -183,7 +185,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
     /* Check there is state to serialise (i.e. at least an XSAVE_HDR) */
     BUG_ON(!v->arch.xcr0_accum);
     /* Check there is the correct room to decompress into. */
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
 
     if ( !(xstate->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
     {
@@ -245,7 +247,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     u64 xstate_bv, valid;
 
     BUG_ON(!v->arch.xcr0_accum);
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
     ASSERT(!xsave_area_compressed(src));
 
     xstate_bv = ((const struct xsave_struct *)src)->xsave_hdr.xstate_bv;
@@ -553,32 +555,6 @@ void xstate_free_save_area(struct vcpu *v)
     v->arch.xsave_area = NULL;
 }
 
-static unsigned int hw_uncompressed_size(uint64_t xcr0)
-{
-    u64 act_xcr0 = get_xcr0();
-    unsigned int size;
-    bool ok = set_xcr0(xcr0);
-
-    ASSERT(ok);
-    size = cpuid_count_ebx(XSTATE_CPUID, 0);
-    ok = set_xcr0(act_xcr0);
-    ASSERT(ok);
-
-    return size;
-}
-
-/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
-unsigned int xstate_ctxt_size(u64 xcr0)
-{
-    if ( xcr0 == xfeature_mask )
-        return xsave_cntxt_size;
-
-    if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
-        return 0;
-
-    return hw_uncompressed_size(xcr0);
-}
-
 static bool valid_xcr0(uint64_t xcr0)
 {
     /* FP must be unconditionally set. */
@@ -611,6 +587,38 @@ static bool valid_xcr0(uint64_t xcr0)
     return true;
 }
 
+unsigned int xstate_uncompressed_size(uint64_t xcr0)
+{
+    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
+
+    /* Non-XCR0 states don't exist in an uncompressed image. */
+    ASSERT((xcr0 & ~X86_XCR0_STATES) == 0);
+
+    if ( xcr0 == 0 )
+        return 0;
+
+    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )
+        return size;
+
+    /*
+     * For the non-legacy states, search all activate states and find the
+     * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
+     * with respect their index.
+     */
+    xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    for_each_set_bit ( i, &xcr0, 63 )
+    {
+        const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
+        unsigned int s = c->offset + c->size;
+
+        ASSERT(c->offset && c->size);
+
+        size = max(size, s);
+    }
+
+    return size;
+}
+
 struct xcheck_state {
     uint64_t states;
     uint32_t uncomp_size;
@@ -619,7 +627,7 @@ struct xcheck_state {
 
 static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
 {
-    uint32_t hw_size;
+    uint32_t hw_size, xen_size;
 
     BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
 
@@ -651,6 +659,12 @@ static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
 
     s->uncomp_size = hw_size;
 
+    xen_size = xstate_uncompressed_size(s->states & X86_XCR0_STATES);
+
+    if ( xen_size != hw_size )
+        panic("XSTATE 0x%016"PRIx64", uncompressed hw size %#x != xen size %#x\n",
+              s->states, hw_size, xen_size);
+
     /*
      * Check the compressed size, if available.  All components strictly
      * appear in index order.  In principle there are no holes, but some
@@ -826,14 +840,14 @@ void xstate_init(struct cpuinfo_x86 *c)
          * xsave_cntxt_size is the max size required by enabled features.
          * We know FP/SSE and YMM about eax, and nothing about edx at present.
          */
-        xsave_cntxt_size = hw_uncompressed_size(feature_mask);
+        xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
         printk("xstate: size: %#x and states: %#"PRIx64"\n",
                xsave_cntxt_size, xfeature_mask);
     }
     else
     {
         BUG_ON(xfeature_mask != feature_mask);
-        BUG_ON(xsave_cntxt_size != hw_uncompressed_size(feature_mask));
+        BUG_ON(xsave_cntxt_size != cpuid_count_ebx(0xd, 0));
     }
 
     if ( setup_xstate_features(bsp) && bsp )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d5e447e9dc06..d26012c6da78 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -248,7 +248,7 @@ struct cpu_policy
         };
 
         /* Per-component common state.  Valid for i >= 2. */
-        struct {
+        struct xstate_component {
             uint32_t size, offset;
             bool xss:1, align:1;
             uint32_t _res_d;
-- 
2.39.2


