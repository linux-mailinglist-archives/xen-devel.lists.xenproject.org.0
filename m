Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98308CD11E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728373.1133330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RS-0008MM-GV; Thu, 23 May 2024 11:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728373.1133330; Thu, 23 May 2024 11:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RS-0008HF-CI; Thu, 23 May 2024 11:17:02 +0000
Received: by outflank-mailman (input) for mailman id 728373;
 Thu, 23 May 2024 11:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RQ-0006Hv-Dp
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:17:00 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f81b646d-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:58 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6ab86d61491so7106876d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:58 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:54 -0700 (PDT)
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
X-Inumbo-ID: f81b646d-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463016; x=1717067816; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRj9LcaEwZJZDPNXhHku6vQUZRLAf7w0mcjGEgwMX0k=;
        b=lmkq/B2qFVg/LhYiMqdxSiya/WB+LaHF4618OZcsAnio7t3FIjMOdkKiNwdaDskgIJ
         9q+RwRugYlbf2JRHMGmnbRw8IFsMPNTtwE8+BhODLzc+3GT5YjhcrUADCJw5oLwmKg9o
         IaRMhwGlUswKcW+p125vtZhGD1NVEOUO0qWZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463016; x=1717067816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRj9LcaEwZJZDPNXhHku6vQUZRLAf7w0mcjGEgwMX0k=;
        b=DkeF4O+En75NZBKqMwsNswsWOLPvMhGzrzDGUWFB0I+jFx95GgqBT9sfyrCCNzfUXr
         +7iBkpFuB107kUr0PRc+CSWgrNfxEe9QU50JifvNDRBrEbcli0K74VRr8SilSo/9mszg
         Mvbt2UW/NRfifeiARd8HX79/aVlIlhyvx6FI3OrIDlGzjfllCE7ETNBWzHh9Pb5TD9mB
         C5aEvSAtVXDW0j1YkAZwfEJEN2QEHGFmBiBmxY+GcdSSXbn3sNuR0kGxEUGT7DmpmAVc
         uV086C9wbcThY3LnGdkqKP/39XB4Uf874ftRw1nw3HxlE/8sXZanDxvLxhTA4b9ivoF1
         1HBw==
X-Gm-Message-State: AOJu0YypQRlPXANNP7eW84r7JIZmNCgNUSEtNaAiFdQSRCoiLgnJflsV
	eB6nspqFm9g448n1Luk/zkMb/k+eFqzu2Aj6WQ5pfW0SM1QXbalW4p+VrZKtG35u8Ul8SY47W71
	qSRA=
X-Google-Smtp-Source: AGHT+IE0eWG609TbIYWGyd/qWXqqj6lCVcrCWA/lJ6+u/z7kOKwE4sZ5dOb3iisX8FOF4omHXz+8Qg==
X-Received: by 2002:a05:6214:5987:b0:6ab:5b6d:f267 with SMTP id 6a1803df08f44-6ab80907622mr53889236d6.62.1716463015904;
        Thu, 23 May 2024 04:16:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 7/7] x86/defns: Clean up X86_{XCR0,XSS}_* constants
Date: Thu, 23 May 2024 12:16:27 +0100
Message-Id: <20240523111627.28896-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of one case in read_bndcfgu() which can use ilog2(),
the *_POS defines are unused.

X86_XCR0_X87 is the name used by both the SDM and APM, rather than
X86_XCR0_FP.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * New
---
 xen/arch/x86/i387.c                  |  2 +-
 xen/arch/x86/include/asm/x86-defns.h | 32 ++++++++++------------------
 xen/arch/x86/include/asm/xstate.h    |  4 ++--
 xen/arch/x86/xstate.c                | 18 ++++++++--------
 4 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 7a4297cc921e..fcdee10a6e69 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -369,7 +369,7 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
         {
             v->arch.xsave_area->xsave_hdr.xstate_bv &= ~XSTATE_FP_SSE;
             if ( fcw_default != FCW_DEFAULT )
-                v->arch.xsave_area->xsave_hdr.xstate_bv |= X86_XCR0_FP;
+                v->arch.xsave_area->xsave_hdr.xstate_bv |= X86_XCR0_X87;
         }
     }
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index d7602ab225c4..3bcdbaccd3aa 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -79,25 +79,16 @@
 /*
  * XSTATE component flags in XCR0 | MSR_XSS
  */
-#define X86_XCR0_FP_POS           0
-#define X86_XCR0_FP               (1ULL << X86_XCR0_FP_POS)
-#define X86_XCR0_SSE_POS          1
-#define X86_XCR0_SSE              (1ULL << X86_XCR0_SSE_POS)
-#define X86_XCR0_YMM_POS          2
-#define X86_XCR0_YMM              (1ULL << X86_XCR0_YMM_POS)
-#define X86_XCR0_BNDREGS_POS      3
-#define X86_XCR0_BNDREGS          (1ULL << X86_XCR0_BNDREGS_POS)
-#define X86_XCR0_BNDCSR_POS       4
-#define X86_XCR0_BNDCSR           (1ULL << X86_XCR0_BNDCSR_POS)
-#define X86_XCR0_OPMASK_POS       5
-#define X86_XCR0_OPMASK           (1ULL << X86_XCR0_OPMASK_POS)
-#define X86_XCR0_ZMM_POS          6
-#define X86_XCR0_ZMM              (1ULL << X86_XCR0_ZMM_POS)
-#define X86_XCR0_HI_ZMM_POS       7
-#define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
+#define X86_XCR0_X87              (_AC(1, ULL) <<  0)
+#define X86_XCR0_SSE              (_AC(1, ULL) <<  1)
+#define X86_XCR0_YMM              (_AC(1, ULL) <<  2)
+#define X86_XCR0_BNDREGS          (_AC(1, ULL) <<  3)
+#define X86_XCR0_BNDCSR           (_AC(1, ULL) <<  4)
+#define X86_XCR0_OPMASK           (_AC(1, ULL) <<  5)
+#define X86_XCR0_ZMM              (_AC(1, ULL) <<  6)
+#define X86_XCR0_HI_ZMM           (_AC(1, ULL) <<  7)
 #define X86_XSS_PROC_TRACE        (_AC(1, ULL) <<  8)
-#define X86_XCR0_PKRU_POS         9
-#define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
+#define X86_XCR0_PKRU             (_AC(1, ULL) <<  9)
 #define X86_XSS_PASID             (_AC(1, ULL) << 10)
 #define X86_XSS_CET_U             (_AC(1, ULL) << 11)
 #define X86_XSS_CET_S             (_AC(1, ULL) << 12)
@@ -107,11 +98,10 @@
 #define X86_XSS_HWP               (_AC(1, ULL) << 16)
 #define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
 #define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
-#define X86_XCR0_LWP_POS          62
-#define X86_XCR0_LWP              (1ULL << X86_XCR0_LWP_POS)
+#define X86_XCR0_LWP              (_AC(1, ULL) << 62)
 
 #define X86_XCR0_STATES                                                 \
-    (X86_XCR0_FP | X86_XCR0_SSE | X86_XCR0_YMM | X86_XCR0_BNDREGS |     \
+    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | X86_XCR0_BNDREGS |    \
      X86_XCR0_BNDCSR | X86_XCR0_OPMASK | X86_XCR0_ZMM |                 \
      X86_XCR0_HI_ZMM | X86_XCR0_PKRU | X86_XCR0_TILE_CFG |              \
      X86_XCR0_TILE_DATA |                                               \
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index da1d89d2f416..f4a8e5f814a0 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -29,8 +29,8 @@ extern uint32_t mxcsr_mask;
 #define XSAVE_HDR_OFFSET          FXSAVE_SIZE
 #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)
 
-#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
-#define XCNTXT_MASK    (X86_XCR0_FP | X86_XCR0_SSE | X86_XCR0_YMM | \
+#define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
+#define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
                         XSTATE_NONLAZY)
 
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 7b7f2dcaf651..0ed2541665b3 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -313,7 +313,7 @@ void xsave(struct vcpu *v, uint64_t mask)
                            "=m" (*ptr), \
                            "a" (lmask), "d" (hmask), "D" (ptr))
 
-    if ( fip_width == 8 || !(mask & X86_XCR0_FP) )
+    if ( fip_width == 8 || !(mask & X86_XCR0_X87) )
     {
         XSAVE("0x48,");
     }
@@ -366,7 +366,7 @@ void xsave(struct vcpu *v, uint64_t mask)
             fip_width = 8;
     }
 #undef XSAVE
-    if ( mask & X86_XCR0_FP )
+    if ( mask & X86_XCR0_X87 )
         ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
 }
 
@@ -558,7 +558,7 @@ void xstate_free_save_area(struct vcpu *v)
 static bool valid_xcr0(uint64_t xcr0)
 {
     /* FP must be unconditionally set. */
-    if ( !(xcr0 & X86_XCR0_FP) )
+    if ( !(xcr0 & X86_XCR0_X87) )
         return false;
 
     /* YMM depends on SSE. */
@@ -599,7 +599,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
         return 0;
 
-    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )
+    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_X87) )
         return size;
 
     /*
@@ -607,7 +607,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
      * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
      * with respect their index.
      */
-    xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_X87);
     for_each_set_bit ( i, &xcr0, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
@@ -628,14 +628,14 @@ unsigned int xstate_compressed_size(uint64_t xstates)
     if ( xstates == 0 ) /* TODO: clean up paths passing 0 in here. */
         return 0;
 
-    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )
+    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_X87) )
         return size;
 
     /*
      * For the compressed size, every component matters.  Some componenets are
      * rounded up to 64 first.
      */
-    xstates &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    xstates &= ~(X86_XCR0_SSE | X86_XCR0_X87);
     for_each_set_bit ( i, &xstates, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
@@ -748,7 +748,7 @@ static void __init noinline xstate_check_sizes(void)
      * layout compatibility with Intel and having a knock-on effect on all
      * subsequent states.
      */
-    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
+    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_X87);
 
     if ( cpu_has_avx )
         check_new_xstate(&s, X86_XCR0_YMM);
@@ -1000,7 +1000,7 @@ uint64_t read_bndcfgu(void)
               : "=m" (*xstate)
               : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
 
-        bndcsr = (void *)xstate + xstate_offsets[X86_XCR0_BNDCSR_POS];
+        bndcsr = (void *)xstate + xstate_offsets[ilog2(X86_XCR0_BNDCSR)];
     }
 
     if ( cr0 & X86_CR0_TS )
-- 
2.30.2


