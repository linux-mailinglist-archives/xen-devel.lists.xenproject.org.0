Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A290B842
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742539.1149381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKJ-0003pH-KJ; Mon, 17 Jun 2024 17:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742539.1149381; Mon, 17 Jun 2024 17:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKJ-0003nq-Fn; Mon, 17 Jun 2024 17:39:31 +0000
Received: by outflank-mailman (input) for mailman id 742539;
 Mon, 17 Jun 2024 17:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKH-00036h-L3
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c2e2180-2cd0-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 19:39:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so531942266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:28 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.27
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
X-Inumbo-ID: 8c2e2180-2cd0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645968; x=1719250768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uvI0uPWUeQgT6Y03c0cvjouO28il7Tm0yQNEqwNcQQ=;
        b=cUcmywmQ9KtmYsGeHwwNG/Z0718OLni1WCnSOh66t1FlsDC2wcTrFBKi7vBr8Bhsyy
         oXkfPYYgXSmkjswirH2DKu6ThShxOHuhpgmxzIQft+1M0MHpWetYM9SK1Xy+FMvblP5t
         MqBKcbkLOL+2WeCzSzk6lDmsjm68csfRs39WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645968; x=1719250768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uvI0uPWUeQgT6Y03c0cvjouO28il7Tm0yQNEqwNcQQ=;
        b=FG1egbY4DGvXGAawn6ASbeQFFiRTr2bwq0gAM6gmrAhrvNSR3kJsCBp12wQdhOWvQ/
         WiQTS7IpOYu/5SeO7PF2pv8OerUmY/fIdu/lTldNxCfkZffCsY9Gf3ghdoPvZrLWyfzJ
         IK+CCcfzROgAfWiEfLMaeTCqVrPBDy3w4skTf7wgMDySjvWyUXiSbAiJAo9kRRV6pX5V
         TxRPJLeXlBTVcbUNEGX+be2sQ5iFzTiA6VRM0VcnDQJaSaSrEJUuMZWg0chHltviPavF
         E0IeJPdeOtL7tHHRCEQv+TPJ9zLWl6yYLVcnb0CXnWv4tctwDSTymyLn/gySs0Qg9CHw
         9iAA==
X-Gm-Message-State: AOJu0YxzpQmf+Ze9aUwPw4szhi/PnTs6qBNhFdC/3dkrFFGhLBXXgboF
	XtUMHfi8uG+fqN2z65QePd2aH1ed5wwzi4TSAN2WRRSHBTx9uKzlu+ZdCWdo1wneZAxlaaTUeih
	3+CY=
X-Google-Smtp-Source: AGHT+IHfbAFMyFk+KRS69Rs46acGyugZCHtGPpEtfuM/I3FtBCHjLXabA2YjEFtlhhgRngQufGCmTw==
X-Received: by 2002:a17:906:1854:b0:a6f:1dbb:d38b with SMTP id a640c23a62f3a-a6f60d2bd6dmr685432466b.28.1718645968045;
        Mon, 17 Jun 2024 10:39:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 5/7] x86/cpu-policy: Simplify recalculate_xstate()
Date: Mon, 17 Jun 2024 18:39:19 +0100
Message-Id: <20240617173921.1755439-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make use of xstate_uncompressed_size() helper rather than maintaining the
running calculation while accumulating feature components.

The rest of the CPUID data can come direct from the raw cpu policy.  All
per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
instructions.

Use for_each_set_bit() rather than opencoding a slightly awkward version of
it.  Mask the attributes in ecx down based on the visible features.  This
isn't actually necessary for any components or attributes defined at the time
of writing (up to AMX), but is added out of an abundance of caution.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Tie ALIGN64 to xsavec rather than xsaves.
v3:
 * Tweak commit message.
---
 xen/arch/x86/cpu-policy.c         | 55 +++++++++++--------------------
 xen/arch/x86/include/asm/xstate.h |  1 +
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5b66f002df05..304dc20cfab8 100644
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
2.39.2


