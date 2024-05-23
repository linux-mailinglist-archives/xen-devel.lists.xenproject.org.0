Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA88CD11B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728368.1133300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RJ-00079a-JH; Thu, 23 May 2024 11:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728368.1133300; Thu, 23 May 2024 11:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RJ-00077W-EN; Thu, 23 May 2024 11:16:53 +0000
Received: by outflank-mailman (input) for mailman id 728368;
 Thu, 23 May 2024 11:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RH-0006Hv-GC
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:51 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c77944-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:49 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6a919a4bb83so23126766d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:49 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:45 -0700 (PDT)
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
X-Inumbo-ID: f2c77944-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463007; x=1717067807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwexe8CnptsNPO0v+knt+q1PXvcS9l92Rfmc3cBUT9k=;
        b=OUjOBJscARRhYbbgmXwvrGmTOrxewXq/TjEwLdeXNVFOFKzFDl5YAcumil08u5LVvR
         VT6JW/AZxBZyyJL6BJKosUCZM7mjrjXEU5hresS1GMATp0ffEjuw8y3K4EKLVt+3qQbG
         fw8U8RFiNpI4q8sqmoV27vuQl4jE6h3846hqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463007; x=1717067807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wwexe8CnptsNPO0v+knt+q1PXvcS9l92Rfmc3cBUT9k=;
        b=wTCaM5+MXCXcgG937V1ioB0TYrErFJ+ZPQWXbz0QyRFZNPaUwNtH/+ZBesnV5DvAFB
         bHgWlBAfCzq8eCUPeZgBqW+LYDOepJ/jktsUZjz23NxOpIC0pyPF+qOFhvpLwKkyzpPQ
         PeN3Zyk5/GhVO4j2LrfziYHS/v7ez92mj25FDy9N7cyAItsqNhv/p9KoH5Ez6Y78XVCl
         Cx0RADve1wuFJwIVK8B+fT4EhIbSFZNT8W8K5r+SfKtunjijkeHqtdrnOu4AYs9nW4+U
         WZDmRyV5TrB4P6rllnhNNpIuHB1V3kaA1aa12Hb+mgvjMdpcEGnvoHr8FybpNFFLff1k
         /p2A==
X-Gm-Message-State: AOJu0Yw1xqyTpXXNO1dBPYsMd1jG+lIsX0H2gL7zQlSaVSaOVqogVffL
	OYaU5yqD/G50BDkk/XnRUdzSBFhLRmeq+xT+P5oi4lKZP3XCZHXcPXk3mxXSSEODiHBZ2V4Qp7n
	WZfE=
X-Google-Smtp-Source: AGHT+IH0uVBwwjZDQEYD5tp1lGk2N/50w+jo3zrngapn0+tG/W/IPEGsiq58L5vBJimDo5vkz/U2BA==
X-Received: by 2002:a05:6214:3c9e:b0:6aa:600e:23c with SMTP id 6a1803df08f44-6ab808f29e9mr55730046d6.43.1716463006986;
        Thu, 23 May 2024 04:16:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/7] x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
Date: Thu, 23 May 2024 12:16:24 +0100
Message-Id: <20240523111627.28896-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're soon going to need a compressed helper of the same form.

The size of the uncompressed image depends on the single element with the
largest offset + size.  Sadly this isn't always the element with the largest
index.

Name the per-xstate-component cpu_policy struture, for legibility of the logic
in xstate_uncompressed_size().  Cross-check with hardware during boot, and
remove hw_uncompressed_size().  This means that the migration paths don't need
to mess with XCR0 just to sanity check the buffer size.

The users of hw_uncompressed_size() in xstate_init() can (and indeed need) to
be replaced with CPUID instructions.  They run with feature_mask in XCR0, and
prior to setup_xstate_features() on the BSP.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Scan all features.  LWP/APX_F are out-of-order.
v3:
 * Rebase over boot time check.
 * Use the raw CPU policy.
---
 xen/arch/x86/domctl.c                |  2 +-
 xen/arch/x86/hvm/hvm.c               |  2 +-
 xen/arch/x86/include/asm/xstate.h    |  2 +-
 xen/arch/x86/xstate.c                | 78 +++++++++++++++++-----------
 xen/include/xen/lib/x86/cpu-policy.h |  2 +-
 5 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9a72d57333e9..c2f2016ed45a 100644
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
index 2c66fe0f7a16..b84f4d2387d1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1190,7 +1190,7 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
 
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
index 33a5a89719ef..1b3153600d9c 100644
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
@@ -611,6 +587,40 @@ static bool valid_xcr0(uint64_t xcr0)
     return true;
 }
 
+unsigned int xstate_uncompressed_size(uint64_t xcr0)
+{
+    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
+
+    ASSERT((xcr0 & ~X86_XCR0_STATES) == 0);
+
+    if ( xcr0 == xfeature_mask )
+        return xsave_cntxt_size;
+
+    if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
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
@@ -619,7 +629,7 @@ struct xcheck_state {
 
 static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
 {
-    uint32_t hw_size;
+    uint32_t hw_size, xen_size;
 
     BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
 
@@ -651,6 +661,12 @@ static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
 
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
@@ -818,14 +834,14 @@ void xstate_init(struct cpuinfo_x86 *c)
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
2.30.2


