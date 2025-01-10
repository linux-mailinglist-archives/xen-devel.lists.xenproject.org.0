Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C89A091F0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869518.1281012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4h-000315-07; Fri, 10 Jan 2025 13:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869518.1281012; Fri, 10 Jan 2025 13:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4g-0002sI-OW; Fri, 10 Jan 2025 13:29:18 +0000
Received: by outflank-mailman (input) for mailman id 869518;
 Fri, 10 Jan 2025 13:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4e-0000vX-SH
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:16 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e26119b5-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:14 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso3159909a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:14 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:13 -0800 (PST)
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
X-Inumbo-ID: e26119b5-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515754; x=1737120554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpsXCde4rHvHOBhrjr2xt+9hIK3kXIA7STQqezCkmas=;
        b=QQDe33ZF/gpuVeJpaMcRSdfCHezA0E+kBQRmyfp7wbgJHu8ukOFClTJjRzD5sYyQOn
         KhC+7dEQbQjIFYDaWUZOpKRlHzuhEh/QHFa2vfPp4wvvvto6Jqjej4vu3jDScOx0p6lb
         2aVfMF3z9+fC5x1S3As3Bp0tng03kpWaw6TQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515754; x=1737120554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpsXCde4rHvHOBhrjr2xt+9hIK3kXIA7STQqezCkmas=;
        b=AYILJ5lX0CGvMjrp0c8qdbZOx3ewceHQUwx0kEgd4fXVIgED/S4oYWWQHpbkxeO9Qg
         IV0M/7AZstbgxb1d4126rgVhV9ts7P7kQpPjhxDqn8acqjx3junNaK343f1Ebh5CwINM
         ARou/Tpm7gi1Q6lBrGInXJGCCUhvljSGQtiCY4RGcg2YOUxhMm9j+AHYPfnUnmTGU/uU
         OEzKtLtxSIuKjdgjeAuKYxa2pSZ2H1TquibakwInkFjS1hAgKNKvAG/DqAXhyxvaENkw
         aIMJccfmViRK2U04YSrWCYKFImEWtSRh8YaVSdY2Gy4Bmtrm21AnJXnzB53WaN310E0a
         Ocmw==
X-Gm-Message-State: AOJu0Yx5o7Zn1wsj6PzPpfO5U0A9aBdr43aqlYIgMOpldE3Lm6kFTF/A
	TTUFEAIAE/7lvTSL/b73MWtwhcJWGW7vbXGGylM2VnG/AQryXq75Co0Q4nXMShH04nq/Yee5ttw
	d1ftZcA==
X-Gm-Gg: ASbGncvcRTsaAUPU7cDyYALnit5gE6WwUM3yQSu5RHwP41y831tFni8vHBNIQpydi2G
	OPbhQdkfqRJY7GDiha3W1C891RT+TLkc/SCxxq1Rn7hYSW6nyII9BeAUpeit9iATYfYTw4xkLUv
	StVgl8zMhKpzp62xXa8I7RyLUKJfrESPAPglh6/xgms7YnDkmWRh+ncScqOLze7q5v8xXgWfs+h
	vGpotUPxcFIt8dnZ0TPgjkyq//ti3/TLmb5rY0CJ9G+m3UY3I5peBBo9FjgieVk6FQeqw09LtZg
	bRQ=
X-Google-Smtp-Source: AGHT+IHLwTsFfF0iue5H/nDszzLlRu5rCiVcELAIDfNI3h8oJ83PoDm2hkMI53TMpPky9oTecF3DMQ==
X-Received: by 2002:a05:6402:5244:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5d972dfb878mr10087233a12.3.1736515753650;
        Fri, 10 Jan 2025 05:29:13 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 07/12] x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
Date: Fri, 10 Jan 2025 13:28:18 +0000
Message-ID: <20250110132823.24348-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * Unmap xsave area also before the early return.

v1->v2:
  * No change
---
 xen/arch/x86/xstate.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 12004d7db24b..3d249518a1b7 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -177,7 +177,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  */
 void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
-    const struct xsave_struct *xstate = v->arch.xsave_area;
+    const struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const void *src;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv = xstate->xsave_hdr.xstate_bv;
@@ -191,7 +191,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
     if ( !(xstate->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
     {
         memcpy(dest, xstate, size);
-        return;
+        goto out;
     }
 
     ASSERT(xsave_area_compressed(xstate));
@@ -228,6 +228,9 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 
         valid &= ~feature;
     }
+
+ out:
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
 /*
@@ -242,7 +245,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
  */
 void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 {
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     void *dest;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv, valid;
@@ -256,7 +259,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     if ( !(v->arch.xcr0_accum & XSTATE_XSAVES_ONLY) )
     {
         memcpy(xstate, src, size);
-        return;
+        goto out;
     }
 
     /*
@@ -294,6 +297,9 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 
         valid &= ~feature;
     }
+
+ out:
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
 void xsave(struct vcpu *v, uint64_t mask)
-- 
2.47.1


