Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B6B3FD23
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 12:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106065.1456854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOgl-0006Mw-HU; Tue, 02 Sep 2025 10:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106065.1456854; Tue, 02 Sep 2025 10:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOgl-0006KD-EF; Tue, 02 Sep 2025 10:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1106065;
 Tue, 02 Sep 2025 10:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Rvg=3N=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1utOgk-0006K7-Ck
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 10:56:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd13767-87eb-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 12:56:33 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b84367affso27552735e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 03:56:33 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e74b72esm197226915e9.0.2025.09.02.03.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 03:56:31 -0700 (PDT)
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
X-Inumbo-ID: 7cd13767-87eb-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756810592; x=1757415392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZi8Sj1r6fD/XAgHc/5d4qkPiGFTtkfD49OTXdflNVI=;
        b=WSZ5i9hG791qn9o3kz/znb4ZJ+Z0jpdpei/Qy/w/xT26U58jjZ3IVzlUP/MQLEYJCC
         5CdiQrZXSiWMhrvrC5AfYogAxsJUPjGK0RWeMVDPqGbM9ggEMizIRwpWkeOtFWwOpx15
         Pfr3NwH1f/tgU1BcvFoQB2+jS0sNdgHGXLyFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756810592; x=1757415392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZi8Sj1r6fD/XAgHc/5d4qkPiGFTtkfD49OTXdflNVI=;
        b=qyH7BxBWLYMmlZUAOJoQfk/Q/Hb7n2tWKOLCahvyyz75R7NcZo1OzZQCacQk92wn8Z
         5jf/8kw2B0iXKmV1R8/DsRYbio6S0Uf/FTgLYMoVbCDvHWQ6yQ/GyePLpgYJ4XhODvsA
         n/RnXuMxxvGfwT2mbcAosVCdcztB6dRVb7YFH8WFgX2RS6oPVlsmWL4GGcrn7SwlTe2C
         IKNrXQ79q3tZ0b/JUscdH37X5KLD+EV2bXzhPqq20n6fLHLi80gboBfAYb2w6BpYTlvb
         2uttUKgIX45TSzs90I4FzoadLCXm96HMP14M7/41n6hkXhePeRpLfrl4cEoLMKyCXuaD
         Dcuw==
X-Gm-Message-State: AOJu0Yz5bA8/pMtGJ0YqZ7m3/lv96v0hBdQUiFkr1VLi6AvT4EprpS6Y
	PMjBh2u5e+CGaU2YDZ4uqzaLAhidyPepj7to6yhYjZ845j0ptl0KJmFppYqBivs5QZkikV6C4SB
	1IRFDl4Q=
X-Gm-Gg: ASbGncsIWOZ792vJr9YIaG5lX+U1jwtoJPiwpG11GeRNL9je2GLpKpJXkE6fzIHXkek
	hXwkLvWJlwKGY9cJkqA+Wz+wcAOut6XU+zKX8sceGSY7N8iAcyT7AVKJC/KCXVOlhT/9+pMzc7I
	rWchQ1Xp/uVjZyBqsXKPdcjOJfPjrpHnfRofagc/HMqQhR9VAJSSM/hh8w5LmeOgZB0xgqFpXuP
	eNGn7T6hsbGGR0GDPph2jQKcethw2yRMLTFSOOL5pWKjTAq/+u1cGwCwnQErmF5i+xsbnoVxy1u
	RitUaU7Fh5Cs7MqKiH70I8cKioZvEn+Jv7On4q36FwJ7uTA2tCjzGxgNkdjf17RXQYqILYml9J8
	BsjLxjxJ/RkzLcQZs2OSAvV2o0pTae2iDu+uxVkq6BA==
X-Google-Smtp-Source: AGHT+IGBRNsdWIEVq2lvABTbUUECIfsmVa+EHXBbyet6RJA7rgFMhqYNN2EUThPsqZySlFDKzug8IQ==
X-Received: by 2002:a05:600c:1f85:b0:45b:5f99:191c with SMTP id 5b1f17b1804b1-45b8555ca8dmr86401375e9.12.1756810592060;
        Tue, 02 Sep 2025 03:56:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] tools/libs: Use superpages where possible on migrate/resume
Date: Tue,  2 Sep 2025 11:56:25 +0100
Message-ID: <20250902105625.28552-1-frediano.ziglio@cloud.com>
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
---
Changes since v1:
- updated commit message and subject;
- change the implementation detecting possible 2mb pages inside
  the packet sent allowing more 2mb superpages.
---
 tools/libs/guest/xg_sr_restore.c | 77 ++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 06231ca826..f2018299a7 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -129,6 +129,80 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
     return 0;
 }
 
+#if defined(__i386__) || defined(__x86_64__)
+/* Order of the smallest superpage */
+#define SMALL_SUPERPAGE_ORDER 9
+#else
+#error Define SMALL_SUPERPAGE_ORDER for this platform
+#endif
+
+static unsigned int populate_order(struct xc_sr_context *ctx,
+                                   unsigned int original_count,
+                                   xen_pfn_t *pfns, xen_pfn_t *mfns,
+                                   int order)
+{
+    size_t i = original_count, num_superpages;
+    xen_pfn_t prev = 0, order_mask = ~((~(xen_pfn_t)0) << order);
+    xen_pfn_t *const indexes_end = mfns + original_count;
+    xen_pfn_t *indexes = indexes_end;
+    unsigned int count = 0;
+
+    while ( i > 0 )
+    {
+        --i;
+        ++count;
+        if ( pfns[i] != prev - 1 )
+            count = 1;
+
+        /*
+         * Is this the start of a contiguous and aligned number
+         * of pages ?
+         */
+        if ( (pfns[i] & order_mask) == 0 && count > order_mask )
+            *--indexes = i;
+
+        prev = pfns[i];
+    }
+
+    count = original_count;
+
+    /* No superpages found */
+    if ( indexes == indexes_end )
+        return count;
+    num_superpages = indexes_end - indexes;
+
+    /* Build list of PFNs that will be updated with MFNs */
+    mfns = indexes - num_superpages;
+    for ( i = 0; i < num_superpages; ++i )
+        mfns[i] = pfns[indexes[i]];
+
+    /* Try to allocate, fallback to single pages */
+    if ( xc_domain_populate_physmap_exact(
+         ctx->xch, ctx->domid, num_superpages, order, 0, mfns) )
+        return count;
+
+    /* Scan all MFNs allocated */
+    for ( i = 0; i < num_superpages; ++i )
+    {
+        const xen_pfn_t mfn = mfns[i];
+        const xen_pfn_t pfn = pfns[indexes[i]];
+
+        /* Check valid */
+        if ( mfn == INVALID_MFN )
+            continue;
+
+        /* Update PFNs using callback */
+        for ( size_t j = 0; j <= order_mask; ++j )
+            ctx->restore.ops.set_gfn(ctx, pfn + j, mfn + j);
+
+        /* remove from 4kb pages list */
+        count -= order_mask + 1;
+        memmove(pfns + indexes[i], pfns + indexes[i] + order_mask + 1,
+                sizeof(*pfns) * (count - indexes[i]));
+    }
+    return count;
+}
+
 /*
  * Given a set of pfns, obtain memory from Xen to fill the physmap for the
  * unpopulated subset.  If types is NULL, no page type checking is performed
@@ -163,6 +237,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
         }
     }
 
+    /* try optimizing using larger order */
+    nr_pfns = populate_order(ctx, nr_pfns, pfns, mfns, SMALL_SUPERPAGE_ORDER);
+
     if ( nr_pfns )
     {
         rc = xc_domain_populate_physmap_exact(
-- 
2.43.0


