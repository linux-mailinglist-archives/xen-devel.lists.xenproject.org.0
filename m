Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC68CD11C
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728369.1133310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RL-0007TV-Ro; Thu, 23 May 2024 11:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728369.1133310; Thu, 23 May 2024 11:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RL-0007QF-O3; Thu, 23 May 2024 11:16:55 +0000
Received: by outflank-mailman (input) for mailman id 728369;
 Thu, 23 May 2024 11:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RK-0006Hv-Hz
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:54 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b33630-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:52 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-69b4454e2f1so8701066d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:52 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:48 -0700 (PDT)
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
X-Inumbo-ID: f4b33630-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463011; x=1717067811; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRpbv1/wBcaMA0cTk1bCZyxrSAb4NeFKdZW8+eY/F+o=;
        b=pWUOmSIQAhLXWjJFvUvygq1VCgRvXfRv6ZyMBWU5AU3e8GPy5rSpSKYjo1caH+jl19
         NqtgitM443GhHCMLS0X/1PQEoXSzyvQQ6LZTIQt6rLnxNQ1Hqhz+tkuqZDBfxBjsrJcx
         AcTX1sDuQ81tyxB8IUMNytv9fnoQQaqXkaMFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463011; x=1717067811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRpbv1/wBcaMA0cTk1bCZyxrSAb4NeFKdZW8+eY/F+o=;
        b=ESQDGgORVouPWnmPlHMS66g1kRN656Fpn7e/Sg9UTgM8QgTWqsXDxUZdgkQTeeiLan
         TMTjRK5ZKq0zCMuIR3UsmrI2wi75+XO812F+ePYChqOA1hLLPSr1vGHuyWGHbwmt1dfT
         05JBujkJFq+ovJxwSj7+P09MQYDLIz7rc3T+Gid9RgaOa97clCi+P1ou7NSpQOs9+Slg
         FrHzGugwTPxqw9FafMhaXevoyYIhYHAv9maJcQ0p8aCPihEmUDJAOCnRZes6S5Kuy3UC
         zNmRpq1UjyNUcp1CEv0HShsFHxSJZElnQ7Gfrc3ZtZKTf1M08Db3XhTUiPOvLIyJMuYm
         1UOQ==
X-Gm-Message-State: AOJu0Yywg8xYhwr6DtPj7grBJRudEhn9v+QxUTMqPIAwE4uPEPSWUfnR
	tLbSeKOwAJddHhoJNOtGGJ1QKZOI0Q6ChnuVE/g7ATMkymnjLQT3vn65NbrYe5xkXOKQHbcIvUG
	yA0s=
X-Google-Smtp-Source: AGHT+IEYLtrmNJ4sPHn6mziSkxTZt6d8QJUEhwLHRsESbQZLZsTWtZt7iKeF6iJXaGGTuiC6cwAxrg==
X-Received: by 2002:a05:6214:5c49:b0:6ab:6f15:515e with SMTP id 6a1803df08f44-6ab7f3398f7mr48834776d6.13.1716463010789;
        Thu, 23 May 2024 04:16:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/7] x86/cpu-policy: Simplify recalculate_xstate()
Date: Thu, 23 May 2024 12:16:25 +0100
Message-Id: <20240523111627.28896-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
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
2.30.2


