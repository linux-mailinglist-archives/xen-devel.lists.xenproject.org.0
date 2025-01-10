Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35CA091EB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869512.1280977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4d-00023R-Aw; Fri, 10 Jan 2025 13:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869512.1280977; Fri, 10 Jan 2025 13:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4d-00020W-3a; Fri, 10 Jan 2025 13:29:15 +0000
Received: by outflank-mailman (input) for mailman id 869512;
 Fri, 10 Jan 2025 13:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4a-0000vX-RM
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0812746-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:11 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so3927504a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:11 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:10 -0800 (PST)
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
X-Inumbo-ID: e0812746-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515750; x=1737120550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pulx2rJf+eVHBhVEkVLX9BFreaZxFXyF8Is/s9m9sX8=;
        b=L9dv5+jwFLfSlTaXGdnHHqRHWnGd3jiAk6zju2d3S5GCRblIWX6ac+w38Gcj+/kZ62
         EcJy/citFUjUzgVOONMRoljKPJvuyO3aizYfKJPHqkUo1wca7LZKS0pk+O3qG59NNtfI
         Mj0h28MA41aYqJFw4/tQmqEOjwEQZ4HvfPPxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515750; x=1737120550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pulx2rJf+eVHBhVEkVLX9BFreaZxFXyF8Is/s9m9sX8=;
        b=GkepZzWOopzUomAy3R5v0JQ4H8tDOk7ZExvPDVFtXQFX0yNot8vQUJvGsWKVGVPvgc
         ktgMiuXDq4pI11k62xRS9W+0LMv7dajqV/D6TryfGXRaSXM6oFSVZMvv8h4kiBDo9EKo
         qU02jtv7cLpHDkKk1rlJeR9dM+jIfs1bmX3bHR2VQE/p8vp5XGUO+TtjVmjLYTwL1oIe
         2jy0M5CkO9PqmyaSUxqb9Mbx0+NpdKYJG6KmFpEtPyRWOLO3zsLlKvxbldDZjxczJSoz
         HWEXhL1SlnKTMS24KWgsvODZoZGXn+aIninBTddIyLVQFskQ89kAfSuJMFvtCTr6clQg
         q7jA==
X-Gm-Message-State: AOJu0Yyrl7TL+64/VjY10KI9NabR/vLp6VxSNDUVCzzrJoyPKBKFLV2k
	9T9ivMo8QXgq5fZ8nOxU+CBauBG47SK2hnEiQz96Yd8RRaF//x6CpM3yOx3bKwLUEppQkfNYOIp
	W4ghZZg==
X-Gm-Gg: ASbGncuNpCs6tce9ELJ8eYuhct55+oJCg0Wcqw8ajQo/FobBZc+KmnfrEioRgSb/j18
	oK2nHqQ/847vM5s3oJjWBluUoxgiugb133DCe7aIlUSS/qF7fuvAZdy4dsRpFc6KJje11eHJO0l
	p2uUzcMJvrjg9naRsWCppF8g7DyuPpnU6bo2lriVluZQShrL8ZWw18jXb+515pxqTFwwXd/4B0Y
	u1f2m581gsC9Etru8kaXjR76fJvtdoY/WCR9BBeL5ltsQ/4TA53j++xNepj2aI0rrO4e0eO6te4
	YTo=
X-Google-Smtp-Source: AGHT+IH/zIJhlFB//h5vV6Zg10dAMqVvYLHKKDAVfZ79wH6CqKU5mgDtC7kYIG7zl3p84Kdgmv0bnA==
X-Received: by 2002:a05:6402:5244:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5d972dfb878mr10087008a12.3.1736515750544;
        Fri, 10 Jan 2025 05:29:10 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 04/12] x86/xstate: Map/unmap xsave area in xstate_set_init() and handle_setbv()
Date: Fri, 10 Jan 2025 13:28:15 +0000
Message-ID: <20250110132823.24348-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2->v3:
  * style: Capitalized first letter of the comment.
  * Added A-by

v1->v2:
  * Added comment highlighting fastpath for current
---
 xen/arch/x86/xstate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index af9e345a7ace..12004d7db24b 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -993,7 +993,13 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
         clts();
         if ( curr->fpu_dirtied )
-            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
+        {
+            /* Has a fastpath for `current`, so there's no actual map */
+            struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
+
+            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+            VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
+        }
         else if ( xstate_all(curr) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
@@ -1048,7 +1054,7 @@ void xstate_set_init(uint64_t mask)
     unsigned long cr0 = read_cr0();
     unsigned long xcr0 = this_cpu(xcr0);
     struct vcpu *v = idle_vcpu[smp_processor_id()];
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate;
 
     if ( ~xfeature_mask & mask )
     {
@@ -1061,8 +1067,10 @@ void xstate_set_init(uint64_t mask)
 
     clts();
 
+    xstate = VCPU_MAP_XSAVE_AREA(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
     xrstor(v, mask);
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
-- 
2.47.1


