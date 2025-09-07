Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4BB47C66
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114188.1461336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI8I-00044L-8O; Sun, 07 Sep 2025 16:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114188.1461336; Sun, 07 Sep 2025 16:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI8I-00043U-5P; Sun, 07 Sep 2025 16:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1114188;
 Sun, 07 Sep 2025 16:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI41-00009z-NJ
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:16:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa40c74-8c05-11f0-9809-7dc792cee155;
 Sun, 07 Sep 2025 18:16:24 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b04b869abb9so149781466b.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:16:24 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:16:22 -0700 (PDT)
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
X-Inumbo-ID: ffa40c74-8c05-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261783; x=1757866583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxqBH4UoXF5zKcyV4oRkehvh5BG1QBuBGrUOn4bw4TQ=;
        b=BaMyCOjDkwGZ2u73dbJ7SgDKbTt37YCQOSWkDjTDW/EGETYm2x8weqpPjSDcgHnSyz
         BIz77+tfhymkXZusWhxoBn31kwQo3DOc8PuPyfTOg8MK0DUFw1fzT35BJ/AZwi2Z4X3K
         lxiHHHwRlCBKjpmCV5Gkr+r0wvRtnZj3sjqMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261783; x=1757866583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxqBH4UoXF5zKcyV4oRkehvh5BG1QBuBGrUOn4bw4TQ=;
        b=VkHOKXqVAIEm2BQI5wdYdUIFvFzxJq59IaW8fNcgZlU7wsdlBnqjrNC2vn4miyylnj
         SEYnEmw1UWcUU4jbqTVzAslL1u4ZF8KRPYpYq5gA4oksgo2puMzf8F6guCMz3QEtwX7T
         SyoYLIjAfOgz8DqRhQgsW0LzbQzxt7mkceIcnUdHePByuu0x1E+bWpJEYEtAhoGV57/H
         wRUGC3fW8la9vqXHix3xxlPwswtMkgBx+O68rhBpvnL1pgAi+QbuM9y4UIssasMm+6eB
         YB9Dyne7vTO1fcwQ4K6dL/cNoPp4Xxeh67KzzvlX7CVPRZkW8B/iGKvvjhXz8tZ38c6T
         BrtQ==
X-Gm-Message-State: AOJu0Yzp6qpredsVDAGtxLNT7TTH82gyb7ddFnGaNqlvsHDHxu+4L5bU
	BefLffoBfXYN4YWkqftM90NHj2zEOysPALUQmyUnzqVlA0e5atAoZGA87ovrAj7hSQjNPLDysLL
	HvEZVkTk=
X-Gm-Gg: ASbGnctTPup+qfU4eopObUYAO5dl7hrPdQCs/CqY+9LBKAzck5JAt8J9R+91kTCBmhb
	Vmz1CRIUhJ9mVdl35Ow/3oYo+Js0Moz7061TrsOlpaObR4S27iKHYXTqTwJCa8OP1t725Cl8BxK
	TrcQTAHnJ8oDRwaHoX+Glzwu4qF1augqeAjBJ+e8DPIwOGZxlC093YQ6sPWMIwOGrp9PmH3zM05
	v/qBfkDWv1MBsgFa+PIiVyS9iH+AFieb9Zj3fEtPoT7jCOqDgzvYWWjKS2VuCaZxUgVNjqu+Xsb
	G16Gp3ObCnPa2SwYjbF+V7QPq/a0/ut388Uyv4qAqPaUGO31pn8qkP7OSwk0ANhozaQ66sziKM2
	2o6MWhFPM26bE+v0Ry7PjAL7N3tU31vbJJLiYy4kQ5op8hbwuYT2GFmK3C3/c0PgwGbFybQaloG
	3XZA==
X-Google-Smtp-Source: AGHT+IGHe1uaFOFNYQ4DJtikarPhM2GREyUd/9dIGycR1RQtQQeD3n91MRtwwnizdTXOOCUvQtLQmw==
X-Received: by 2002:a17:906:d54b:b0:b04:53cc:4400 with SMTP id a640c23a62f3a-b04b14a198emr528981066b.27.1757261783273;
        Sun, 07 Sep 2025 09:16:23 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v3 5/7] xen/page_alloc: Pass node to adjust_tot_pages and check it
Date: Sun,  7 Sep 2025 18:15:20 +0200
Message-ID: <80adbc587f6acf6bae05bf66016ffecb532f8877.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_adjust_tot_pages() consumes remaining claims as pages
are allocated, now also from the claimed node.

Update it to skip consuming the outstanding claims when the page
was allocated from a different NUMA node.

This in itself would not be critically needed as the page should
only be allocated from a different NUMA node in case the target
node has no available memory, but for multi-node claims, we need
to reduce the outstanding claims only on the NUMA node the page
was allocated from.

For this, we need to pass the NUMA node of the allocated page,
so we can use it to perform this check (and in the future update
the claim only on the NUMA node the page was allocated from)

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

---
- Reorganized v3, v4 and v5 as per review to avoid non-functional
  changes:
  - Split from patch v2#3 and merged the related changed from v2#5
    into a consolidated patch.
---
 xen/arch/x86/mm.c             |  3 ++-
 xen/arch/x86/mm/mem_sharing.c |  4 ++--
 xen/common/grant_table.c      |  4 ++--
 xen/common/memory.c           |  3 ++-
 xen/common/page_alloc.c       | 21 ++++++++++++++++-----
 xen/include/xen/mm.h          |  2 +-
 6 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b929d15d00..b0f654e02e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4442,7 +4442,8 @@ int steal_page(
     page_list_del(page, &d->page_list);
 
     /* Unlink from original owner. */
-    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
+    if ( !(memflags & MEMF_no_refcount) &&
+         !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1) )
         drop_dom_ref = true;
 
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4787b27964..15b8a3a9d9 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -720,7 +720,7 @@ static int page_make_sharable(struct domain *d,
     if ( !validate_only )
     {
         page_set_owner(page, dom_cow);
-        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+        drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
         page_list_del(page, &d->page_list);
     }
 
@@ -766,7 +766,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     ASSERT(page_get_owner(page) == dom_cow);
     page_set_owner(page, d);
 
-    if ( domain_adjust_tot_pages(d, 1) == 1 )
+    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..8fea75dbb2 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2405,7 +2405,7 @@ gnttab_transfer(
         }
 
         /* Okay, add the page to 'e'. */
-        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
+        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
             get_knownalive_domain(e);
 
         /*
@@ -2431,7 +2431,7 @@ gnttab_transfer(
              * page in the page total
              */
             nrspin_lock(&e->page_alloc_lock);
-            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
+            drop_dom_ref = !domain_adjust_tot_pages(e, NUMA_NO_NODE, -1);
             nrspin_unlock(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3371edec11..4c54ce5ede 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -775,7 +775,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 
                 nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref = (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
+                                !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                                         -dec_count));
                 nrspin_unlock(&d->page_alloc_lock);
 
                 if ( drop_dom_ref )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bbb34994b7..ebf41a1b33 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -542,8 +542,11 @@ static unsigned long avail_heap_pages(
  * Update the total number of pages and outstanding claims of a domain.
  * - When pages were freed, we do not increase outstanding claims.
  * - On a domain's claims update, global outstanding_claims are updated as well.
+ * - If the domain's claim is on a NUMA node, we only update outstanding claims
+ *   of the domain and the node, when the allocation is from the same NUMA node.
  */
-unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
+unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
+                                      long pages)
 {
     unsigned long adjustment;
 
@@ -557,8 +560,12 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
      *
      * If the domain has no outstanding claims (or we freed pages instead),
      * we don't update outstanding claims and skip the claims adjustment.
+     *
+     * Else, a page was allocated: But if the domain has a node_claim and
+     * the page was allocated from a different node, don't update claims.
      */
-    if ( !d->outstanding_pages || pages <= 0 )
+    if ( !d->outstanding_pages || pages <= 0 ||
+         (domain_has_node_claim(d) && d->claim_node != node) )
         goto out;
 
     spin_lock(&heap_lock);
@@ -2662,6 +2669,8 @@ int assign_pages(
 
     if ( !(memflags & MEMF_no_refcount) )
     {
+        nodeid_t node = page_to_nid(&pg[0]);
+
         if ( unlikely(d->tot_pages + nr < nr) )
         {
             gprintk(XENLOG_INFO,
@@ -2672,8 +2681,9 @@ int assign_pages(
             rc = -E2BIG;
             goto out;
         }
+        ASSERT(node == page_to_nid(&pg[nr - 1]));
 
-        if ( unlikely(domain_adjust_tot_pages(d, nr) == nr) )
+        if ( unlikely(domain_adjust_tot_pages(d, node, nr) == nr) )
             get_knownalive_domain(d);
     }
 
@@ -2806,7 +2816,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 }
             }
 
-            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
+            drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                                    -(1 << order));
 
             rspin_unlock(&d->page_alloc_lock);
 
@@ -3012,7 +3023,7 @@ void free_domstatic_page(struct page_info *page)
 
     arch_free_heap_page(d, page);
 
-    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+    drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
 
     unprepare_staticmem_pages(page, 1, scrub_debug);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 52c12c5783..5a5252fc69 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -131,7 +131,7 @@ mfn_t xen_map_to_mfn(unsigned long va);
 int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
-    long pages);
+    nodeid_t node, long pages);
 int domain_claim_pages(struct domain *d, nodeid_t node, unsigned long pages);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
-- 
2.43.0


