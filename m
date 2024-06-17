Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E390B844
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742543.1149419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKM-0004kI-HA; Mon, 17 Jun 2024 17:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742543.1149419; Mon, 17 Jun 2024 17:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKM-0004az-CS; Mon, 17 Jun 2024 17:39:34 +0000
Received: by outflank-mailman (input) for mailman id 742543;
 Mon, 17 Jun 2024 17:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKK-00036g-LI
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:32 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cdfb16e-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so704391266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:30 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:28 -0700 (PDT)
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
X-Inumbo-ID: 8cdfb16e-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645969; x=1719250769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91rqmVIJvtgwrFeMK2tOHbISsSTuJ9u05BoupIBlW0Q=;
        b=dlPLAIWROcYXZC/TEGChqyb2bI0PIbZX5zYiAJg2wLV5M1qOWO+0+Dtzs17Bz4ceVJ
         GAH7ORlU8qPN0DF3trGnF0CQBHdrVg92sIKoH0OkEmvDT4YUWMij3BKa3t9F+yjQlW+n
         Kae2NElpdL9uOvbHI3Cla4uvQl9ce0uzYZOlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645969; x=1719250769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91rqmVIJvtgwrFeMK2tOHbISsSTuJ9u05BoupIBlW0Q=;
        b=dBs8nasJTnogFK/JdKecSy5zreTkaJPU2WVFTEV2PobpYsbzOkzO0a7A5JEIV+iooR
         56sfkGvRJrXswo6OZM0HzdnVUOKAfxPXh1sykjUXOhPC1aFnJSWQFs0ZrhsjtgcEMIKl
         VWhxCKUO0mU8owFwQba+i3DwDCj14gquxyf4phXFKj0mZPnPmofw6J2spi3JYeP1gH6n
         A34wYfmAONa9nWUaUX/JDYKZS3jsvQibhr9MGARqknprSz7/aV9b7wzDdKBV0PB1cjMR
         AQLn/VLBupyft3M2ID4ooWpFi5p1uzaOH8nqQcO7EebjVffJja/ijV/SXtZ6jq6H+TlI
         /ZEg==
X-Gm-Message-State: AOJu0Yxl1hj+PztDiRAdiFY40bnT9tDNKYMNfaSZtdAzdBGMQqvQLApm
	6loSr//tXt4dPCJEw0wq8ZdAy0iU6smW9l7lL5AwqVCqXMw9PvFhNXWgy+d+rSps/fk93GuAqCc
	76Kk=
X-Google-Smtp-Source: AGHT+IGzn5ZkK1YZ3Abyw+STSNcbhHiblepXrKhd7oNDvDgw69jiQUs3j43NO0ZVmfS9SARRXyaAxQ==
X-Received: by 2002:a17:907:d312:b0:a6f:668b:3434 with SMTP id a640c23a62f3a-a6f668b35f7mr806562166b.31.1718645969387;
        Mon, 17 Jun 2024 10:39:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 7/7] x86/defns: Clean up X86_{XCR0,XSS}_* constants
Date: Mon, 17 Jun 2024 18:39:21 +0100
Message-Id: <20240617173921.1755439-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of one case in read_bndcfgu() which can use ilog2(),
the *_POS defines are unused.  Drop them.

X86_XCR0_X87 is the name used by both the SDM and APM, rather than
X86_XCR0_FP.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
index 31bf2dc95f57..2acd02449dba 100644
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
@@ -597,7 +597,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     if ( xcr0 == 0 )
         return 0;
 
-    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )
+    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_X87) )
         return size;
 
     /*
@@ -605,7 +605,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
      * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
      * with respect their index.
      */
-    xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_X87);
     for_each_set_bit ( i, &xcr0, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
@@ -626,14 +626,14 @@ unsigned int xstate_compressed_size(uint64_t xstates)
     if ( xstates == 0 )
         return 0;
 
-    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )
+    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_X87) )
         return size;
 
     /*
      * For the compressed size, every non-legacy component matters.  Some
      * componenets require aligning to 64 first.
      */
-    xstates &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    xstates &= ~(X86_XCR0_SSE | X86_XCR0_X87);
     for_each_set_bit ( i, &xstates, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
@@ -756,7 +756,7 @@ static void __init noinline xstate_check_sizes(void)
      * layout compatibility with Intel and having a knock-on effect on all
      * subsequent states.
      */
-    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
+    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_X87);
 
     if ( cpu_has_avx )
         check_new_xstate(&s, X86_XCR0_YMM);
@@ -1008,7 +1008,7 @@ uint64_t read_bndcfgu(void)
               : "=m" (*xstate)
               : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
 
-        bndcsr = (void *)xstate + xstate_offsets[X86_XCR0_BNDCSR_POS];
+        bndcsr = (void *)xstate + xstate_offsets[ilog2(X86_XCR0_BNDCSR)];
     }
 
     if ( cr0 & X86_CR0_TS )
-- 
2.39.2


