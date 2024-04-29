Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343688B6118
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714346.1115545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjs-0003BI-8W; Mon, 29 Apr 2024 18:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714346.1115545; Mon, 29 Apr 2024 18:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjs-00035K-3o; Mon, 29 Apr 2024 18:28:32 +0000
Received: by outflank-mailman (input) for mailman id 714346;
 Mon, 29 Apr 2024 18:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Vjq-0002kh-Hl
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:28:30 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45eade52-0656-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 20:28:28 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso6061257a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 11:28:28 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm13241293eda.96.2024.04.29.11.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 11:28:26 -0700 (PDT)
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
X-Inumbo-ID: 45eade52-0656-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714415307; x=1715020107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC3Swr6XvpWJc3cdnmHIIik9FCKy/gZ4FBg4Litx/6I=;
        b=uiaIVB0BC34ET6Y0nwIPwLy3HEMD7gdXxXeVW+P0SnpjrMX1ckviqrUtVVCbyzpUtk
         u6dPDoX9WXEX2LLY2NQoicy21LL6w22mAT/YZFKA2Wa4Cfx9bdPYknSe0yR4Zza3vVzm
         ZAJyikqW61R/xKpwyiMLByfZQO4w2iiTamChU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415307; x=1715020107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC3Swr6XvpWJc3cdnmHIIik9FCKy/gZ4FBg4Litx/6I=;
        b=M+fACG5NNben4XY0lKSBYRaH8+6UpBDuikMrzC86XlqMT1l6LfQAMI6B0XJ5oiBk0B
         ZzCLGaJoPzFSpEalJXn8MJBukNzn1EJw8aCSg9Yw9YYcbuROpbh2T85AZ6/wNh0emh6A
         LnL0vOh4E8ujOU6ZeH6nQ+IWw/No0n6AKhamqmUBuW3DPQSTArxtqcqDcQB2ovJiHvCQ
         OkkbsR9Jhy+yt+93/rG/RErdo/VurK03b3jKyTxxTCx1yfJm3nNkySbXSPGDP4SWOukd
         ySe7tFGZ1z31xrqhXU7NUqdTN+bVbog9emwD9N8P20zqwU/7kF8UhOJCI62VuytZG7zn
         4BHA==
X-Gm-Message-State: AOJu0YxOBQzfK7v6nbVhkC9GbSOnCOmiJk51cs/G6f3cQUm4eET0TIwm
	IRsjYQK6UrIMyk9tk8M+J+K4cQtqvPcBucWMFT4S2lYvKRBiFSvLAR1vmwAlLl20zCzHTGqLybM
	1
X-Google-Smtp-Source: AGHT+IEuaaNH5iGXpIJ1LxyYqhTrmlO2SaeQ6GksKFcQS8LcQ8lirD9hlUU5/aZut0n/dAHKAgjMhg==
X-Received: by 2002:a50:d54b:0:b0:568:d55c:1bb3 with SMTP id f11-20020a50d54b000000b00568d55c1bb3mr9244494edj.31.1714415307298;
        Mon, 29 Apr 2024 11:28:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
Date: Mon, 29 Apr 2024 19:28:21 +0100
Message-Id: <20240429182823.1130436-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're soon going to need a compressed helper of the same form.

The size of the uncompressed image depends on the single element with the
largest offset+size.  Sadly this isn't always the element with the largest
index.

Retain the cross-check with hardware in debug builds, but forgo it normal
builds.  In particular, this means that the migration paths don't need to mess
with XCR0 just to sanity check the buffer size.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Scan all features.  LWP/APX_F are out-of-order.
---
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             | 45 +++++++++++++++++++++++++++----
 4 files changed, 43 insertions(+), 8 deletions(-)

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
index 9594e0a5c530..9e677d891d6c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1191,7 +1191,7 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
 
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
index 99cedb4f5e24..a94f4025fce5 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -183,7 +183,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
     /* Check there is state to serialise (i.e. at least an XSAVE_HDR) */
     BUG_ON(!v->arch.xcr0_accum);
     /* Check there is the correct room to decompress into. */
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
 
     if ( !(xstate->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
     {
@@ -245,7 +245,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     u64 xstate_bv, valid;
 
     BUG_ON(!v->arch.xcr0_accum);
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
     ASSERT(!xsave_area_compressed(src));
 
     xstate_bv = ((const struct xsave_struct *)src)->xsave_hdr.xstate_bv;
@@ -567,16 +567,51 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
-/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
-unsigned int xstate_ctxt_size(u64 xcr0)
+unsigned int xstate_uncompressed_size(uint64_t xcr0)
 {
+    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
+
     if ( xcr0 == xfeature_mask )
         return xsave_cntxt_size;
 
     if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
         return 0;
 
-    return hw_uncompressed_size(xcr0);
+    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )
+        return size;
+
+    /*
+     * For the non-legacy states, search all activate states and find the
+     * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
+     * with respect their index.
+     */
+    xcr0 &= ~XSTATE_FP_SSE;
+    for_each_set_bit ( i, &xcr0, 63 )
+    {
+        unsigned int s;
+
+        ASSERT(xstate_offsets[i] && xstate_sizes[i]);
+
+        s = xstate_offsets[i] && xstate_sizes[i];
+
+        size = max(size, s);
+    }
+
+    /* In debug builds, cross-check our calculation with hardware. */
+    if ( IS_ENABLED(CONFIG_DEBUG) )
+    {
+        unsigned int hwsize;
+
+        xcr0 |= XSTATE_FP_SSE;
+        hwsize = hw_uncompressed_size(xcr0);
+
+        if ( size != hwsize )
+            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
+                        __func__, xcr0, size, hwsize);
+        size = hwsize;
+    }
+
+    return size;
 }
 
 static bool valid_xcr0(uint64_t xcr0)
-- 
2.30.2


