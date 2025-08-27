Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FDEB3826D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 14:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096004.1450823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFLT-0003oY-0x; Wed, 27 Aug 2025 12:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096004.1450823; Wed, 27 Aug 2025 12:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFLS-0003mj-UT; Wed, 27 Aug 2025 12:33:42 +0000
Received: by outflank-mailman (input) for mailman id 1096004;
 Wed, 27 Aug 2025 12:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0E1g=3H=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1urFLR-0003md-Gp
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 12:33:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fb2997a-8342-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 14:33:40 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so41276295e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 05:33:40 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cb901975adsm6589141f8f.8.2025.08.27.05.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 05:33:39 -0700 (PDT)
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
X-Inumbo-ID: 0fb2997a-8342-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756298019; x=1756902819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbux99ex3cU0nog0VEpdTqXoplhetdpwz/JQ8/H1D5I=;
        b=edoSMQYD6mzRNUBBlYw67XkFNN+W8SfnI93x3iCmPXIPHeImCtJ+vxbEo6zq0NDzQc
         PukyLUJqFEo2tTP/dYQJxEDCQROCVvtL0tnIrbBpaxmgZ0yu0Zr7XF4CRZlrheQ0WPi3
         nFY2a3lDCT+btob+cHzDL3obAe7PFqGI9qg0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298019; x=1756902819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rbux99ex3cU0nog0VEpdTqXoplhetdpwz/JQ8/H1D5I=;
        b=EFRSI92WUC2VNFyzkmsU96oLA3eziZqSVC9kKGjNuqm68YWhgMlAx6AzC5sZq6Bt5C
         nv4QDtoluxPbRZ2cI8UaoAheXtQwZscsn0YUDIGOZxbwsQv5NU0iXdAgTOIzIi8PrpkN
         TlWsgBVQQ/SVX6n3Mr82r1Y2LmTE+eliZ5HrZVnXp+U5gHPgAeMwtuEkzwLaXuknrfW0
         yQ1wEI532vqyx9j7RLP7V1uc9w8YInkHit9HBQzC8wdPXA/yEq7Vbagk1fjCye29DKe7
         9deza/cXu5QX/yNkYEIGBoCEL+fPYfMabXSW80GNBVQOaAtnG5FjLlEl5VRdlxbnyKO2
         XUlg==
X-Gm-Message-State: AOJu0YypGC5L1NO24hWd40Iax4nCuUL0Tr8qUNiIwc2hPOBjFtUqPNVn
	9/fwQMzxpeBQTkh3bm3gOGnZGG9m8tgePcgh0mUVZu9LUswISg88Q8A+xa0JiK2Cdyyd3JF1q/d
	zroT4m+g=
X-Gm-Gg: ASbGncsnrdFXSUrEBqluO0EXfWA0FfYYJN+Dcl7lE2YbB76qL8FNRvfrRuin5lCegDU
	wC2UfNAsLYVX5FpJJCO832Sb9hHwN/s6iCh6ws9SHpg8bkAeNpF2WwDjBSAhRTF2JujGbItJDYg
	eAbKISFENwR3mCn9M2gn8KiOxMhbZOF49p7j37mgsLm+AXvYjTnb5TuZQ0uK2mtQaGi09vYD/Ki
	xvtsZQSvFd5+b8NYGHO5bhh5EQOw3Pld+y8CK0H2474kUqoBmUme43Tnpt3lVdQC+fWJOs18PtR
	TTV8SViTiGvmXr6OuECuP1ovHrR0acP8skuoC4GT5KtBg6hbejQVsPaH8pc/pNnN4VOJw35Ddr8
	2rBq3pKEndbcTawvF0Y+TQLgbqj5Kj1LlmVD4DyxM3Q==
X-Google-Smtp-Source: AGHT+IHGM05F58JjSKkC38WkyurLdSdDS1PUL81n3ViyxrnjEy0FTMLXwETjGGL70b/siJ1Eu3jSyg==
X-Received: by 2002:a05:600c:4348:b0:459:d616:25c5 with SMTP id 5b1f17b1804b1-45b5213bb88mr114852915e9.12.1756298019562;
        Wed, 27 Aug 2025 05:33:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] Optimise restore memory allocation
Date: Wed, 27 Aug 2025 13:33:04 +0100
Message-ID: <20250827123309.39699-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Try to allocate larger order pages.
With some test memory program stressing TLB (many small random
memory accesses) you can get 15% performance improves.
On the first memory iteration the sender is currently sending
memory in 4mb aligned chunks which allows the receiver to
allocate most pages as 2mb superpages instead of single 4kb pages.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 tools/libs/guest/xg_sr_restore.c | 39 ++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 06231ca826..8dcb1b19c5 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -129,6 +129,8 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
     return 0;
 }
 
+#define IS_POWER_OF_2(n) (((n) & ((n) - 1)) == 0)
+
 /*
  * Given a set of pfns, obtain memory from Xen to fill the physmap for the
  * unpopulated subset.  If types is NULL, no page type checking is performed
@@ -141,6 +143,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
+    bool contiguous = true;
     int rc = -1;
 
     if ( !mfns || !pfns )
@@ -159,18 +162,46 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
             if ( rc )
                 goto err;
             pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            if ( pfns[nr_pfns] != pfns[0] + nr_pfns )
+                contiguous = false;
             ++nr_pfns;
         }
     }
 
     if ( nr_pfns )
     {
-        rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
+        /* try optimizing using larger order */
+        rc = -1;
+        /*
+         * The "nr_pfns <= (1 << 18)" check is mainly for paranoia, it should
+         * never happen, the sender would have to send a really large packet.
+         */
+        if ( contiguous && nr_pfns <= (1 << 18) &&
+             IS_POWER_OF_2(nr_pfns) && (pfns[0] & (nr_pfns - 1)) == 0 )
+        {
+            const unsigned int extent_order = __builtin_ffs(nr_pfns) - 1;
+
+            rc = xc_domain_populate_physmap_exact(
+                xch, ctx->domid, 1, extent_order, 0, mfns);
+            if ( rc )
+                mfns[0] = pfns[0];
+            else
+            {
+                for ( i = 1; i < nr_pfns; ++i )
+                    mfns[i] = mfns[0] + i;
+            }
+        }
+
+        /* if using larger order fails fall back to single pages */
         if ( rc )
         {
-            PERROR("Failed to populate physmap");
-            goto err;
+            rc = xc_domain_populate_physmap_exact(
+                xch, ctx->domid, nr_pfns, 0, 0, mfns);
+            if ( rc )
+            {
+                PERROR("Failed to populate physmap");
+                goto err;
+            }
         }
 
         for ( i = 0; i < nr_pfns; ++i )
-- 
2.43.0


