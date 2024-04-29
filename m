Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6438B6116
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714347.1115555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjs-0003ON-MR; Mon, 29 Apr 2024 18:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714347.1115555; Mon, 29 Apr 2024 18:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjs-0003DE-Hz; Mon, 29 Apr 2024 18:28:32 +0000
Received: by outflank-mailman (input) for mailman id 714347;
 Mon, 29 Apr 2024 18:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Vjr-0002ks-2r
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:28:31 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46403e34-0656-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 20:28:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5727dc6d3edso1811922a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 11:28:29 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm13241293eda.96.2024.04.29.11.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 11:28:27 -0700 (PDT)
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
X-Inumbo-ID: 46403e34-0656-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714415308; x=1715020108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADttxadCLt/zjGm7XTarV6R8WGqoXwrChWdb25bmPX8=;
        b=vWTWydZ/c2lq5JBF8AASOtai1+1TKuqbvdtbSniZ0AKmrIV32ozu4oLXXHuaW+mHnT
         MGYYQ9CzDMJpe7XvJeF4EImC+X5e4/boA1vVfMWAChHHSyGzb7pJCFBu3jXjV38DvqrV
         ztQT3pZKcTSqRaZKXD3fM9aglyfn/OQ69LIAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415308; x=1715020108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADttxadCLt/zjGm7XTarV6R8WGqoXwrChWdb25bmPX8=;
        b=Uxwp4wMmG8N1Hxl8X9czCD3WfnafoOuaYDNabQA5udF3acFo3nSusv/ecd1tBXM5HW
         VIqjnBent05mUGRwLgLlhVQsceZ/NJQbfiVZWQg5+nuc4tTU6n7clsEp48Bp9xehpdDD
         RXT1yomwd0udb89r04SsuRcFmNzpG4C25Xst45ugkxjmylmNRie46gBVVAUVVPxqsEwk
         8P93n9GSitoBfk9Ob3TctGKgUxO5RQwp+9w3QYLxkawLkMJEA65PtX3Uwd/hXulfZQKw
         0h0Ss33zTRvITTB4CmwCp8+K8Uq3WRJgAEt/Tfjcf70vhFcta9mORo66Cc46IT+UMaph
         BLgg==
X-Gm-Message-State: AOJu0YwI/qrC/ZeUYGwModn8FPGeCdi3w7CivwCBhWoVTLMzEGypSI2A
	qR7lyRh5WNlgOjyXtp6E/ivKuB+TRiwxFNM/W1S5DqUJSExOe2GP8r9v4ymIGsG27Z+/2SCwPP8
	j
X-Google-Smtp-Source: AGHT+IFbObEyCM4M9hc8uz2/lK+eLhxDUzZ7f8HmBGaZaWbDO4IJ5dD4x0jTniAkFNSf4VaOx7ZdDQ==
X-Received: by 2002:a50:bac6:0:b0:570:5e7f:62cb with SMTP id x64-20020a50bac6000000b005705e7f62cbmr294949ede.29.1714415307936;
        Mon, 29 Apr 2024 11:28:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/4] x86/cpu-policy: Simplify recalculate_xstate()
Date: Mon, 29 Apr 2024 19:28:22 +0100
Message-Id: <20240429182823.1130436-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make use of the new xstate_uncompressed_size() helper rather than maintaining
the running calculation while accumulating feature components.

The rest of the CPUID data can come direct from the raw cpu policy.  All
per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
instructions.

Use for_each_set_bit() rather than opencoding a slightly awkward version of
it.  Mask the attributes in ecx down based on the visible features.  This
isn't actually necessary for any components or attributes defined at the time
of writing (up to AMX), but is added out of an abundance of caution.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Tie ALIGN64 to xsavec rather than xsaves.
---
 xen/arch/x86/cpu-policy.c         | 55 +++++++++++--------------------
 xen/arch/x86/include/asm/xstate.h |  1 +
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d96276399..fc7933be8577 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -193,8 +193,7 @@ static void sanitise_featureset(uint32_t *fs)
 static void recalculate_xstate(struct cpu_policy *p)
 {
     uint64_t xstates = XSTATE_FP_SSE;
-    uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
-    unsigned int i, Da1 = p->xstate.Da1;
+    unsigned int i, ecx_mask = 0, Da1 = p->xstate.Da1;
 
     /*
      * The Da1 leaf is the only piece of information preserved in the common
@@ -206,61 +205,47 @@ static void recalculate_xstate(struct cpu_policy *p)
         return;
 
     if ( p->basic.avx )
-    {
         xstates |= X86_XCR0_YMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_YMM_POS] +
-                          xstate_sizes[X86_XCR0_YMM_POS]);
-    }
 
     if ( p->feat.mpx )
-    {
         xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
-                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
-    }
 
     if ( p->feat.avx512f )
-    {
         xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
-                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
-    }
 
     if ( p->feat.pku )
-    {
         xstates |= X86_XCR0_PKRU;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_PKRU_POS] +
-                          xstate_sizes[X86_XCR0_PKRU_POS]);
-    }
 
-    p->xstate.max_size  =  xstate_size;
+    /* Subleaf 0 */
+    p->xstate.max_size =
+        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
     p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
     p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
 
+    /* Subleaf 1 */
     p->xstate.Da1 = Da1;
+    if ( p->xstate.xsavec )
+        ecx_mask |= XSTATE_ALIGN64;
+
     if ( p->xstate.xsaves )
     {
+        ecx_mask |= XSTATE_XSS;
         p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
         p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
     }
-    else
-        xstates &= ~XSTATE_XSAVES_ONLY;
 
-    for ( i = 2; i < min(63UL, ARRAY_SIZE(p->xstate.comp)); ++i )
+    /* Subleafs 2+ */
+    xstates &= ~XSTATE_FP_SSE;
+    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
+    for_each_set_bit ( i, &xstates, 63 )
     {
-        uint64_t curr_xstate = 1UL << i;
-
-        if ( !(xstates & curr_xstate) )
-            continue;
-
-        p->xstate.comp[i].size   = xstate_sizes[i];
-        p->xstate.comp[i].offset = xstate_offsets[i];
-        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
-        p->xstate.comp[i].align  = curr_xstate & xstate_align;
+        /*
+         * Pass through size (eax) and offset (ebx) directly.  Visbility of
+         * attributes in ecx limited by visible features in Da1.
+         */
+        p->xstate.raw[i].a = raw_cpu_policy.xstate.raw[i].a;
+        p->xstate.raw[i].b = raw_cpu_policy.xstate.raw[i].b;
+        p->xstate.raw[i].c = raw_cpu_policy.xstate.raw[i].c & ecx_mask;
     }
 }
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index f5115199d4f9..bfb66dd766b6 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -40,6 +40,7 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_XSAVES_ONLY         0
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
+#define XSTATE_XSS     (1U << 0)
 #define XSTATE_ALIGN64 (1U << 1)
 
 extern u64 xfeature_mask;
-- 
2.30.2


