Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDBA61783
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914887.1320542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8nF-0005PC-Hg; Fri, 14 Mar 2025 17:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914887.1320542; Fri, 14 Mar 2025 17:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8nF-0005NX-DW; Fri, 14 Mar 2025 17:25:57 +0000
Received: by outflank-mailman (input) for mailman id 914887;
 Fri, 14 Mar 2025 17:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nD-0003IK-S9
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c9cc77-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:55 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so442924466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:55 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:54 -0700 (PDT)
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
X-Inumbo-ID: 62c9cc77-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973154; x=1742577954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdh/nRp2GmOU7roCTz/BcdnWbFJ7a9N+rEjKItErqUM=;
        b=eKRB1iWXLDSEB5gZyzMO3hvVdVUNYWC+Ue1cO7+mEPkBt6+LSL/W9x0PIy/q87yquN
         PMGsaT0HRhWrTIC6KsVBBlYhSy5WX9mpIRAqvbR0kzasj/eFzaWr2VDc12B7OEY/f428
         fcOQYTLwX7fHXclSuLH/u9oh4ewrVIcfSkF+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973154; x=1742577954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdh/nRp2GmOU7roCTz/BcdnWbFJ7a9N+rEjKItErqUM=;
        b=gGk1wPKJoTYJUBTcqO2zLk29DHY3djmAm6GDVlUrz52jn0oby+Dkgm5riJ+mQTi4Fk
         GgcLB0URoaRo6iN+/Q9yuVpvcf+XAbGmUCGCldL3P5DPjMKdZHSor04klZK2UvZuo90n
         X0SxLDde/WeN8ZgPs2Uk9OirInLDu0yir20AsH1l7LqbKkRje9NbW4fWqRg4ZIZ3LB+a
         zyP9SRlvSWXxksPzSqae/1Gg+lf9JyqaxVas2HwSxnv3Xu7QShcq2/69DmNTY8ZAg+Sl
         trc6390owb5Ce5XnkLDmITqTvjphTSjuclIDaTRrXKeQmS6r1s4MNnBcfmN+FrQLjOlm
         JW8A==
X-Gm-Message-State: AOJu0YwxRRYxuZQ/VMsIAltkyAnma4CjQ6O60vVdpXQS2aWp6h9sXHmB
	66MBnJhBfJxkkXm2f6jFbOFzk0u0ePe4E8MwOaoyJICBYlYrir7uve9MRyK7LgcMC1fo88Dfdds
	g
X-Gm-Gg: ASbGncsMerED8kTsO+ozzFN/28Y1ENzOjP/ahC790xelurFAbSTUB45QuLgVs2NCQWI
	byOXTCWqrZXs8Pz2q9XlQV9bxyzt9KB4qIgWcvUBthofNZcTbdA136aNQO3N9bmGFheviqjKclG
	mQSJLSY0cxmaOhjfsps9n3PteHeNQTg+g6gjMiMtjHk56Zyn2fAuX51hwXDLdmwI4B+sYnYXA8O
	bc9Z7HzvDX/8N3RdcWeljSrrEYYU40nUhf7TKWTgsUDG1xFHgAq4SarpO8x8GNB2h4Jw1cQOn+V
	96rytlfKm+W+GZhSNDP6tPqYt5C9x6E+d8Ci6bfte2zCRD09DBBcv8SXEfUouOar4rw=
X-Google-Smtp-Source: AGHT+IEk8nbANZEXxTyw0X2Q7BGwqyDIUuQMlWuNOdLVVwuv2DgDtuJtPUADZ4WCiPLZq08dAnvteA==
X-Received: by 2002:a17:906:4795:b0:ac1:fbf8:6ae7 with SMTP id a640c23a62f3a-ac33026213amr390563666b.13.1741973154557;
        Fri, 14 Mar 2025 10:25:54 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 06/11] xen/page_alloc: Hook per-node claims to alloc_heap_pages()
Date: Fri, 14 Mar 2025 17:24:57 +0000
Message-ID: <20250314172502.53498-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the claim checks in alloc_heap_pages() to exact-node claims. The
logic is slightly more complicated, so the patch moves it all to an
auxiliary function.

exact-node claims also follow global claims in order to ensure both can
coexist in the same system.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/page_alloc.c | 44 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7fe574b29407..cfaa64d3b858 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -991,6 +991,46 @@ static void init_free_page_fields(struct page_info *pg)
     page_set_owner(pg, NULL);
 }
 
+/*
+ * Determine whether a heap allocation is allowed after considering all
+ * outstanding claims in the system.
+ *
+ * Exact-node allocations must also take into account global claims!
+ *
+ * e.g:
+ *   Consider a domain for which toolstack issued a non-exact claim of 75% of
+ *   host memory and another domain for which toolstack tries to issue an
+ *   exact-node claim of 50% of host memory. If the exact claim didn't consider
+ *   non-exact claims too we would overallocate, which is exactly what claims
+ *   are trying to prevent.
+ */
+static bool can_alloc(struct domain *d, unsigned int memflags,
+                      unsigned long request)
+{
+    nodeid_t node = (memflags & MEMF_exact_node) ? MEMF_get_node(memflags) :
+                                                   NUMA_NO_NODE;
+
+    if ( outstanding_claims + request <= total_avail_pages )
+    {
+        if ( node == NUMA_NO_NODE )
+            return true;
+
+        if ( pernode_oc[node] + request <= pernode_avail_pages[node] )
+            return true;
+    }
+
+    /*
+     * Not enough unclaimed memory. Only allow if it's already claimed on the
+     * right node. d->claim_node == NUMA_NO_NODE if the claim isn't on an
+     * exact node.
+     *
+     * Only refcounted allocs attributed to domains may have been claimed
+     */
+
+    return d && d->claim_node == node && d->outstanding_pages >= request &&
+           !(memflags & MEMF_no_refcount);
+}
+
 /* Allocate 2^@order contiguous pages. */
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
@@ -1021,9 +1061,7 @@ static struct page_info *alloc_heap_pages(
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
2.48.1


