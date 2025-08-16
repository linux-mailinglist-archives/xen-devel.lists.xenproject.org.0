Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D904B28D64
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084487.1443637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF11-0008UG-Mj; Sat, 16 Aug 2025 11:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084487.1443637; Sat, 16 Aug 2025 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF11-0008S6-Jk; Sat, 16 Aug 2025 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1084487;
 Sat, 16 Aug 2025 11:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unF10-0008R6-K2
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:24:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d79ddb-7a93-11f0-b898-0df219b8e170;
 Sat, 16 Aug 2025 13:24:00 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so9827955e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:24:00 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:23:59 -0700 (PDT)
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
X-Inumbo-ID: 81d79ddb-7a93-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343440; x=1755948240; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1iRU9m3XRpby6RHQR14UBdcIiWltVXdQcuwow+h8HQ=;
        b=KOIjoCAr0Sxnt+5/pP7qUZkTaiR80CdOm3salZhyK0CroBJdXUKihkiLnOoyzpnc7Y
         0jM+qFffx/bynmC2RuNYImpxB+JOCMWZ1PuMGAkHiGzriBazVX0JWqgJ5Ro42vb12MSX
         zw1syGXb1P9fC5tQpBMI3xTT+4Hvkuv4og2cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343440; x=1755948240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1iRU9m3XRpby6RHQR14UBdcIiWltVXdQcuwow+h8HQ=;
        b=anU55+AWg35f0+5o5HzxrESLc+wmb15LQOSEs2Xn9DzV/m6RZaI7lylLDk1Y0abGCo
         Kr/OMhFZdHRy4kixcB1xVDu+nN8a/0spawYRnJ+fzDkSzhXV179P7gFLvSeHdAZt5KaB
         1WaPRLfRUhuaDn33ensiknvyD5qAztq8s7EXC+7ut+Ri3x9Oc5kE7q3L6UTt2rqwAC2t
         gmd1efzuVg61WZhrSkYJTYZRKyLHdN4nSygk9PqFhzPOQHUsCyfVtGaw7QYLbfc3qGuR
         RtWxGFMtLoGVJV6xpdPtIMSb04WTswNZTICWdAnXYKOr+6GNwMdqVhGUEu1i/t1nw+Pz
         wjcQ==
X-Gm-Message-State: AOJu0YzsmM9MIKnHgyc+eD6zlA6dFK+xzKL4gL5h92wtOoMqIZWZPQHw
	w8xWPZaO/JRGIzdrLcbqH0RMQC625FT3ESRHQD/RKv9v+UJU1N/EnE8+zJm5s9dWJXrMW7lObKu
	+YcoYFLg=
X-Gm-Gg: ASbGncsEqcVkFQvhWuBEBStLytdHhobuzb6ZO0I0a8jVj5jIeLyYitwyC1275msgMpl
	hMKLSDqLW3Rcxf7NaCruLteKKputKlVLBWI5ZxN2q4Qxu5N3MSW/z8EEhP/hwwGR5eEEI1SyBkU
	N3MDxLIVPHwXAMfmOewQxY7HIIT+vwJK5VIGaTlY19jECmxqBYzn54aGgQBgFXHxT118Vc09dzG
	C1ud4vHDSVOh14UxYs9MqjYkmA+l4/Qqp0yRZGXmtv1OpxLT8CTzZopWkQplpXzzccshmg7Piga
	0vwSVbpJxqUV/gGU65zsEWqy2aPgxv9jIMBg5qbg/U+7pC03mAG85oeepowMEVwYYyF50QrbLxB
	DEqU1ujhev9l/pWl/P3zGK3M+62yRxr9B0dZkDaJACoTnJXZgQf2yhOc=
X-Google-Smtp-Source: AGHT+IHuOtR+8eaxNX0/XVwzU9erg7D0dXe6omoAZOyWtG0EUecSpWYLLhu2OalCdVzZ7D5v8sX4gA==
X-Received: by 2002:a05:600c:4691:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-45a217fd7aemr50051845e9.12.1755343439803;
        Sat, 16 Aug 2025 04:23:59 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 6/7] xen/page_alloc: Check per-node claims in alloc_heap_pages()
Date: Sat, 16 Aug 2025 13:19:32 +0200
Message-ID: <3836533d5424baa470e69838bac89862e14d44e0.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the claim checks in alloc_heap_pages() to NUMA claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

---
Changes since v1:
- No longer require the memflags & MEMF_exact_node for using claims

- If the NUMA node is not passed in memflags, get the NUMA node to
  conume claims from using the claim itself and confirm it using
  the domain's d->node_affinity, which is where get_free_buddy will
  allocate from. This also eases the conversion to multi-node claim
  usage as memflags in inherently single-node.
---
 xen/common/page_alloc.c | 46 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 63ecd74dcc..12e1d6a049 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1027,6 +1027,48 @@ static void init_free_page_fields(struct page_info *pg)
     page_set_owner(pg, NULL);
 }
 
+/*
+ * Check if a heap allocation is allowed (helper for alloc_heap_pages)
+ */
+static bool can_alloc(const struct domain *d, unsigned int memflags,
+                      unsigned long request)
+{
+    nodeid_t node = MEMF_get_node(memflags);
+
+    /*
+     * If memflags don't define a node to allocate from, get_free_buddy() will
+     * use d->node_affinity for the allocation: Allow the allocation to
+     * take advantage of it when the claimed node is exactly d->node_affinity:
+     */
+    if ( node == NUMA_NO_NODE && d && d->claim_node != NUMA_NO_NODE )
+    {
+        nodemask_t claim_node = nodemask_of_node(d->claim_node);
+
+        if (nodes_equal(d->node_affinity, claim_node))
+            node = d->claim_node;
+    }
+
+    if ( outstanding_claims + request <= total_avail_pages && /* host-wide, */
+         (node == NUMA_NO_NODE || /* if the alloc is node-specific, then also */
+          per_node_outstanding_claims[node] + request <= /* check per-node */
+          per_node_avail_pages[node]) )
+        return true;
+
+    /*
+     * The requested allocation can only be satisfied by outstanding claims.
+     * Claimed memory is considered unavailable unless the request
+     * is made by a domain with sufficient unclaimed pages.
+     *
+     * Only allow if the allocation matches the available claims of the domain.
+     * For host-wide allocs and claims, node == d->claim_node == NUMA_NO_NODE.
+     *
+     * Only refcounted allocs attributed to domains may have been claimed:
+     * Not refcounted allocs cannot consume claimed memory.
+     */
+    return d && d->claim_node == node && d->outstanding_pages >= request &&
+           !(memflags & MEMF_no_refcount);
+}
+
 /* Allocate 2^@order contiguous pages. */
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
@@ -1057,9 +1099,7 @@ static struct page_info *alloc_heap_pages(
      * Claimed memory is considered unavailable unless the request
      * is made by a domain with sufficient unclaimed pages.
      */
-    if ( (outstanding_claims + request > total_avail_pages) &&
-          ((memflags & MEMF_no_refcount) ||
-           !d || d->outstanding_pages < request) )
+    if ( !can_alloc(d, memflags, request) )
     {
         spin_unlock(&heap_lock);
         return NULL;
-- 
2.43.0


