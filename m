Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9B9B355D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826696.1241156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0X-0003nZ-R4; Mon, 28 Oct 2024 15:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826696.1241156; Mon, 28 Oct 2024 15:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0X-0003hF-E2; Mon, 28 Oct 2024 15:50:17 +0000
Received: by outflank-mailman (input) for mailman id 826696;
 Mon, 28 Oct 2024 15:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0V-0008FV-44
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5144c1cb-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:12 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso603068166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:12 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:11 -0700 (PDT)
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
X-Inumbo-ID: 5144c1cb-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130612; x=1730735412; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwNJgVlmgOrKpINGfBXiXo/pOeaz7GckymMD2iqzF3A=;
        b=Duuih0KxloKm6sWNfEyA3X8M8+QqdQBFfStVqYKNepZMoDGZ4GgrU/L3nbIDlpkcIR
         Myv9lnFxGJi9oPLOGO9zcTQPANVGlnKp0GyPFPDqIgQlRmmf9twubJSexKwhr7pkb6Lh
         nJFfBKpdDvM8xntw5V1pnJgPDVORJsZHx7X/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130612; x=1730735412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwNJgVlmgOrKpINGfBXiXo/pOeaz7GckymMD2iqzF3A=;
        b=kVluQsc3kD8D/uZAppkHV2Mi/L2VntPoBw/b3jT9Fc8LdPM4PoQHenK65uCq07PG3F
         gsRKRBubQDAqrc/TwbodAFb76kpaDqHUVkmW6zFJkQz2KTpM43+N8fLJUPXS1Lo0d07Y
         a6RKFCXNUVBJ2vuQd5jbzl11v+O6WOtc+HAWfqzrgYwHL5Uza5aRQrEBqr+LazgfS3B0
         Ri+djPBzavRK0SwMbdqtZcEDvHITXGUqSfqbbAsRB0KFHMBWAVY9ovAn9uPaGbzeNCS0
         cFHgCY5tcK/j0dwgG3962U0QegvwdUll2ENbkCJfVeIOhKGOnMC8ofZhPxambsEbfmhW
         bVug==
X-Gm-Message-State: AOJu0Yx3BjKFw4X6/WGQZjLabr0QIimiUYkTow3VXtpYXBnqZWV+zgTb
	PEQyIV3weq75Yv2u4VK4d/1IotKKuSys/6eMD1norR9pDIlTo8Krh5HuQ5ehXoTH61qdTWnwrHV
	E
X-Google-Smtp-Source: AGHT+IHEY1nVRqaVDFBcRPDXXekAHbeOYazAPOBV9yuB9+xZ37aBGYXnmRkAxgllujT4PRIvJffbng==
X-Received: by 2002:a17:906:c14a:b0:a9a:80bd:2920 with SMTP id a640c23a62f3a-a9de61990b1mr811601166b.53.1730130611929;
        Mon, 28 Oct 2024 08:50:11 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 14/14] x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit xstate
Date: Mon, 28 Oct 2024 15:49:32 +0000
Message-ID: <20241028154932.6797-15-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/i387.c               | 9 +++++----
 xen/arch/x86/include/asm/xstate.h | 5 +++--
 xen/arch/x86/xstate.c             | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 7e1fb8ad8779..87b44dc11b55 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -108,7 +108,8 @@ static inline void fpu_fxrstor(struct vcpu *v, const fpusse_t *fpu_ctxt)
 /*      FPU Save Functions     */
 /*******************************/
 
-static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
+static inline uint64_t vcpu_xsave_mask(const struct vcpu *v,
+                                       const struct xsave_struct *xsave_area)
 {
     if ( v->fpu_dirtied )
         return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
@@ -125,14 +126,14 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
      * XSTATE_FP_SSE), vcpu_xsave_mask will return XSTATE_ALL. Otherwise
      * return XSTATE_NONLAZY.
      */
-    return xstate_all(v) ? XSTATE_ALL : XSTATE_NONLAZY;
+    return xstate_all(v, xsave_area) ? XSTATE_ALL : XSTATE_NONLAZY;
 }
 
 /* Save x87 extended state */
 static inline void fpu_xsave(struct vcpu *v, struct xsave_struct *xsave_area)
 {
     bool ok;
-    uint64_t mask = vcpu_xsave_mask(v);
+    uint64_t mask = vcpu_xsave_mask(v, xsave_area);
 
     ASSERT(mask);
     ASSERT(cpu_has_xsave);
@@ -213,7 +214,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * saving state belonging to another vCPU.
      */
     xsave_area = vcpu_map_xsave_area(v);
-    if ( v->arch.fully_eager_fpu || xstate_all(v) )
+    if ( v->arch.fully_eager_fpu || xstate_all(v, xsave_area) )
     {
         if ( cpu_has_xsave )
             fpu_xrstor(v, xsave_area, XSTATE_ALL);
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 43f7731c2b17..81350d0105bb 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -132,14 +132,15 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
     return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
 }
 
-static inline bool xstate_all(const struct vcpu *v)
+static inline bool xstate_all(const struct vcpu *v,
+                              const struct xsave_struct *xsave_area)
 {
     /*
      * XSTATE_FP_SSE may be excluded, because the offsets of XSTATE_FP_SSE
      * (in the legacy region of xsave area) are fixed, so saving
      * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
      */
-    return xsave_area_compressed(v->arch.xsave_area) &&
+    return xsave_area_compressed(xsave_area) &&
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index aa5c062f7e51..cbe56eba89eb 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1002,7 +1002,7 @@ int handle_xsetbv(u32 index, u64 new_bv)
             asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
             vcpu_unmap_xsave_area(curr, xsave_area);
         }
-        else if ( xstate_all(curr) )
+        else if ( xstate_all(curr, xsave_area) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
             mask |= XSTATE_LAZY;
-- 
2.47.0


