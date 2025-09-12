Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BDB54886
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 11:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121747.1465860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0XX-0005EV-Dn; Fri, 12 Sep 2025 09:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121747.1465860; Fri, 12 Sep 2025 09:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0XX-0005CM-Av; Fri, 12 Sep 2025 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1121747;
 Fri, 12 Sep 2025 09:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvzg=3X=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ux0XV-0005CG-SY
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 09:57:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e0cc32-8fbe-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 11:57:56 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45cb5492350so12733345e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 02:57:56 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd9fasm5850043f8f.35.2025.09.12.02.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 02:57:55 -0700 (PDT)
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
X-Inumbo-ID: f4e0cc32-8fbe-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757671076; x=1758275876; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=40hmlr5BYX9rZsXVh4CU9sX4LFOJM9bVuQanQklyxpE=;
        b=CwYOARX8LACft4Qw6D8QzzVOK1kK4w/G2SSAMwySKvd8NSUMRS2aHpeDxd9PJDky+g
         guM1vSVSWgKenHsh+sA0GqJoqx1j0dD0kG0uAZm2BFIc/tlncYehW9qvQ5hI3wnY9ZwL
         7H7ukna5OEqi7l0nZ+blzbC4ZeUPmJ4ks63PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671076; x=1758275876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40hmlr5BYX9rZsXVh4CU9sX4LFOJM9bVuQanQklyxpE=;
        b=obY9VoKrIMSLikge/32/hm984ID6NCoRJ+hgwE4JMbIhbxEWFYM6lpHeMO5d4dCEO8
         L8DGCthG+2GRx99DPAwlR4uL0Ifw+RvFDF3eNgj2Dd5AxmrE+6hZFgPEk/DvCjwHUCGP
         WKctI2+QYJWn1eg7qelJ6n+6Nbjc8pHwctaqV9BVXqQ/2CNvptanE3LLh5g1uYO96TY6
         FdEQpd+8MQoBz2X0xzMsgIn85alO1aadJNsjP3Gc/mL6L7gHHCKGbnSMzMqYhiy+EKIa
         IL9XmK+eoBxduf9CXZ1GCgIuhn77cEW8Oo+aUdVbX5sIYWka/uSG19CQh7ag+l1m7IQo
         Bnag==
X-Gm-Message-State: AOJu0YwViN1lbRjbsK3vTEqHRsK8hmeTum8slvhufOr0oDx6MtOrDFj/
	4EIdoLcSR18bsUfW/Q2jPYGfqnt/Td+6AAc6jllQ2sXxtAzb5/K6NeuItOHua5CLPIwFCgw3y0k
	wKM16LKY=
X-Gm-Gg: ASbGncsCJuMbsVqiLqKRJhHsZ12VCCNk5iQKPTrWhm7b/SHiNiQSc8bhy7aTKzDQA44
	+xJzC2firrDPd+T7JL60i6SopK9kJEy6qZdMy+c3yfm08RY72nXltol4OXUcVY6CzC763zkj/vq
	ZtTbIa+uW8YyV9vOEaxIfQbnGWIBuo6taqT+v7gSie0JtF6jtG9HIayXaC+N+kS7nb9C7qXQUv/
	MrO+fBriYIbhw7UmW52GfbmkXjAHBW5nS3341nLCzUaIRcCYWK4nJFeTJxrDHqX32DhST2pwd8N
	jCHOL8HLAA38fLLQkPKXJ0j6z5Ny+iEYhaEICGSVO1IHVScrTeZOJg2mXHchAOEh7tLdkmUHM3V
	nYpkMSQNs/CoQUivNUbx1zhrp9V7rhx0YGtXcv/kTSfzQ2gErfqG6
X-Google-Smtp-Source: AGHT+IGs+stwR7Er4cFYsKF0o4kRKljj4gxRt6JfpX/6GkjzcAiePSBMlTp/aPec5ahAwYotQImiiQ==
X-Received: by 2002:a05:600c:6812:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45f211d4f1emr24183805e9.9.1757671075611;
        Fri, 12 Sep 2025 02:57:55 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3] tools/libs: Use superpages where possible on migrate/resume
Date: Fri, 12 Sep 2025 10:57:44 +0100
Message-ID: <20250912095744.99181-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Try to allocate larger order pages.
With some test memory program stressing TLB (many small random
memory accesses) you can get 15% performance improves.
On the first memory iteration the sender is currently sending
memory in 4mb aligned chunks which allows the receiver to
allocate most pages as 2mb superpages instead of single 4kb pages.
This works even for HVM where the first 2mb contains some holes.
This change does not handle 1gb superpages as this will require
change in the protocol to preallocate space.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
- updated commit message and subject;
- change the implementation detecting possible 2mb pages inside
  the packet sent allowing more 2mb superpages.

Changes since v2:
- change implementation simplifying detecting and allocations
  of 2mb pages.
---
 tools/libs/guest/xg_sr_restore.c | 45 +++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 06231ca826..ea5a137612 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -129,6 +129,30 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
     return 0;
 }
 
+#if defined(__i386__) || defined(__x86_64__)
+/* Order of the smallest superpage */
+#define SMALL_SUPERPAGE_ORDER 9
+#else
+#error Define SMALL_SUPERPAGE_ORDER for this platform
+#endif
+
+static bool populate_small_superpage(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    xen_pfn_t mfn = pfn;
+
+    if ( xc_domain_populate_physmap_exact(
+         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, 0, &mfn) )
+        return false;
+
+    if ( mfn == INVALID_MFN )
+        return false;
+
+    for ( size_t i = 0; i < (1 << SMALL_SUPERPAGE_ORDER); ++i )
+        ctx->restore.ops.set_gfn(ctx, pfn + i, mfn + i);
+
+    return true;
+}
+
 /*
  * Given a set of pfns, obtain memory from Xen to fill the physmap for the
  * unpopulated subset.  If types is NULL, no page type checking is performed
@@ -142,6 +166,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
+    xen_pfn_t prev = 0;
+    unsigned num_contiguous = 0;
+    xen_pfn_t mask = ~((~(xen_pfn_t)0) << SMALL_SUPERPAGE_ORDER);
 
     if ( !mfns || !pfns )
     {
@@ -152,14 +179,26 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
+        xen_pfn_t pfn = original_pfns[i];
+
         if ( (!types || page_type_to_populate(types[i])) &&
-             !pfn_is_populated(ctx, original_pfns[i]) )
+             !pfn_is_populated(ctx, pfn) )
         {
-            rc = pfn_set_populated(ctx, original_pfns[i]);
+            rc = pfn_set_populated(ctx, pfn);
             if ( rc )
                 goto err;
-            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            pfns[nr_pfns] = mfns[nr_pfns] = pfn;
             ++nr_pfns;
+            if ( pfn != prev + 1 )
+                num_contiguous = 0;
+            num_contiguous++;
+            prev = pfn;
+            if ( num_contiguous > mask && (pfn & mask) == mask &&
+                 populate_small_superpage(ctx, pfn - mask) )
+            {
+                nr_pfns -= mask + 1;
+                num_contiguous = 0;
+            }
         }
     }
 
-- 
2.43.0


