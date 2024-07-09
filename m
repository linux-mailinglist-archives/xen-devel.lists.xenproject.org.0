Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D092BED3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756377.1164972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8o-00032Y-Fb; Tue, 09 Jul 2024 15:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756377.1164972; Tue, 09 Jul 2024 15:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8o-0002ze-CS; Tue, 09 Jul 2024 15:52:30 +0000
Received: by outflank-mailman (input) for mailman id 756377;
 Tue, 09 Jul 2024 15:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRD8n-0002zS-4V
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:52:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dfd44ff-3e0b-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 17:52:27 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5956fbe6d0dso966355a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:52:28 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm1181254a12.73.2024.07.09.08.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:52:26 -0700 (PDT)
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
X-Inumbo-ID: 3dfd44ff-3e0b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720540347; x=1721145147; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm8mHlnyDHgFEOCZGPZsRjeb7JwZ974Ug/MqW/mdlH8=;
        b=QbniHfm76mHTTLuXxGO0c7mRGtuVi2d6XPS3ErZSgRMd/QbAD1ceaphYJvneesJpVl
         87m0givEDTDQbCwD69ygaSEzVu5YpW0scQ2ikoGrv3zs40dUl14gpwlhU/CsksrQ0KA6
         n1rcdGroTryTrBNpWltVY7arbRZxPVmGaoPDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540347; x=1721145147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm8mHlnyDHgFEOCZGPZsRjeb7JwZ974Ug/MqW/mdlH8=;
        b=vX5WGnQjOI/JAGbvShfKcvFGlVWgkUA2raIwK9zj9pwxOD5EcasFcBuIAauCPuBaeX
         jb9zVVjm7eNpCb1cF+vbCisg0DaDmGYJP2GS7i86EnBh569AwmfO8bS4Q2wiVfIoxeBq
         Zx1k/f5NTspk+KVRp+YgvvZ5ylQ0gKU1unIOa0jtDx1x6yQDW05EQw6SBWvJ8jIGpAx1
         x0zRBz8SgUN3IdvrFJWD7s3voIlHdZ9B0sr5zdYjA+lUIa1hqNzm07VwgnKB0nWBz7ed
         s6QQmjbk3fZSABIVAbhJXimg+LLTqztZalDCqzRpoynt1NaAbYHLKXtKseuNEG1iAONN
         099g==
X-Gm-Message-State: AOJu0Yx8noUqC4lFMbWfqaln1OM8UddFAZvUJGx6SS7qv7GILZrr8WoC
	NUVmMIdhxvsuUY3yYc2j/WxVHPMOo2Iera00MTwRn5cCdtz9FsVGSLS/qnu+FPoyI5AdPVRoces
	m
X-Google-Smtp-Source: AGHT+IGvD7FCyOmt9lLnCEAYn3wLwajx3ZrAczteEXiZbmY2an+1rICO1+82nClbbkXxoWQjjlBZaA==
X-Received: by 2002:a05:6402:1e89:b0:582:7e6d:6816 with SMTP id 4fb4d7f45d1cf-594ba98f460mr2180603a12.8.1720540347193;
        Tue, 09 Jul 2024 08:52:27 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 1/4] x86/xstate: Use compression check helper in xstate_all()
Date: Tue,  9 Jul 2024 16:52:20 +0100
Message-Id: <c12704135bf9ae1cf59ea4f8a05485d505b7863c.1720538832.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720538832.git.alejandro.vallejo@cloud.com>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor refactor to make xstate_all() use a helper rather than poking directly
into the XSAVE header.

No functional change

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/include/asm/xstate.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index f4a8e5f814a0..f0eeb13b87a4 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -122,6 +122,12 @@ static inline uint64_t xgetbv(unsigned int index)
     return lo | ((uint64_t)hi << 32);
 }
 
+static inline bool __nonnull(1)
+xsave_area_compressed(const struct xsave_struct *xsave_area)
+{
+    return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
+}
+
 static inline bool xstate_all(const struct vcpu *v)
 {
     /*
@@ -129,15 +135,8 @@ static inline bool xstate_all(const struct vcpu *v)
      * (in the legacy region of xsave area) are fixed, so saving
      * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
      */
-    return (v->arch.xsave_area->xsave_hdr.xcomp_bv &
-            XSTATE_COMPACTION_ENABLED) &&
+    return xsave_area_compressed(v->arch.xsave_area) &&
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
-static inline bool __nonnull(1)
-xsave_area_compressed(const struct xsave_struct *xsave_area)
-{
-    return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
-}
-
 #endif /* __ASM_XSTATE_H */
-- 
2.34.1


