Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392215A756C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395183.635028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvB-00011l-NP; Wed, 31 Aug 2022 05:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395183.635028; Wed, 31 Aug 2022 05:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvA-0000bi-QX; Wed, 31 Aug 2022 05:05:48 +0000
Received: by outflank-mailman (input) for mailman id 395183;
 Tue, 30 Aug 2022 21:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbd=ZC=flex--surenb.bounces.google.com=3_YUOYwYKCWISURENBGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@srs-se1.protection.inumbo.net>)
 id 1oT97H-0008Cd-94
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:51 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac5a98d9-28ad-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 23:49:50 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-33dce8cae71so188549747b3.8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:50 -0700 (PDT)
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
X-Inumbo-ID: ac5a98d9-28ad-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=hT6Mz/zinVpRQBPKe7V7vUNm2EL+nNA0Rd6lje133es=;
        b=dfpyzvwd4Cc++xCQWq35JB0wJm+WrSSoxMENLy9aDfaWxkxM1OaMmDnm/vqeqmhqwU
         gZ74ppSfTAgF7SE3SqSoTv2aIM58r+Pz/1W9uwrKdGiDv7ewg2BuxbdnPUGh3CuiOCkA
         14w+GGgADDYFbMYHNlMxcXneiC4QjBwI/pjC3GHz1ttLv+1YSdBbrybMdEtkcC5CZ2yG
         0v6U9Ssq49CU9MEssaTVF8mmd1yQf+A9weRhrB49GBJc7iyJ1ibIQDHVBUxMDTeBzNZT
         89GZsPPyB1nT7HTWg+BylmuFWY1bglVPePrUwBMLPZc7q+nvTNhi0s23dmExUdbXdR5Y
         Cwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=hT6Mz/zinVpRQBPKe7V7vUNm2EL+nNA0Rd6lje133es=;
        b=PX2GUKIYSAzNNbC2SE3FscIehlmsyYg9HAynh4l8Z82e0owON33YnsLsPrpTSSvoQS
         hY4Uuu8FgZPCOvNbxetA8d/z3MF6x9XHiVImplcolG7VUgkqkY5MTxGju2D0U6Eg1KXW
         kZluvAk7vay7VQVZgUcZICrZO3hJROdfNZfU1ZkniTDwHEU05kE8y6WJlRm2KJSJyL9M
         ZMlBRLjnaWrAUK7+WZHq2EYFPulgjZimNJ3et/+dXTAPuS4bQlG2F4C3svUAJ3IYl8Rk
         bACliuD23Rv90rTqEHcXIYvUtDtTqU62+lC3IhrLiLnldQzmd9edBg+kGTa+fW+39EZ0
         ruug==
X-Gm-Message-State: ACgBeo3vEbwEZE9ZXiuIxAt7vqpnZ+O5QW89z7alpO5/VUO9cgNjJXuP
	CdsqZY8D0UnyNKK92nGEi0wT3qRJ3OA=
X-Google-Smtp-Source: AA6agR6wiYlgc1y+Ddz6GZjAkBSlMmUIZ6hPk3nzcjnnuhPA77BDamNwQUPuwNWjTzLGCV8DDV21TdlLdak=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:cf0e:0:b0:696:42f1:3889 with SMTP id
 f14-20020a25cf0e000000b0069642f13889mr13000431ybg.175.1661896189937; Tue, 30
 Aug 2022 14:49:49 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:48:59 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-11-surenb@google.com>
Subject: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Redefine alloc_pages, __get_free_pages to record allocations done by
these functions. Instrument deallocation hooks to record object freeing.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/gfp.h         | 10 +++++++---
 include/linux/page_ext.h    |  3 ++-
 include/linux/pgalloc_tag.h | 35 +++++++++++++++++++++++++++++++++++
 mm/mempolicy.c              |  4 ++--
 mm/page_alloc.c             | 13 ++++++++++---
 5 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index f314be58fa77..5cb950a49d40 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -6,6 +6,7 @@
 
 #include <linux/mmzone.h>
 #include <linux/topology.h>
+#include <linux/pgalloc_tag.h>
 
 struct vm_area_struct;
 
@@ -267,12 +268,12 @@ static inline struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
 }
 
 #ifdef CONFIG_NUMA
-struct page *alloc_pages(gfp_t gfp, unsigned int order);
+struct page *_alloc_pages(gfp_t gfp, unsigned int order);
 struct folio *folio_alloc(gfp_t gfp, unsigned order);
 struct folio *vma_alloc_folio(gfp_t gfp, int order, struct vm_area_struct *vma,
 		unsigned long addr, bool hugepage);
 #else
-static inline struct page *alloc_pages(gfp_t gfp_mask, unsigned int order)
+static inline struct page *_alloc_pages(gfp_t gfp_mask, unsigned int order)
 {
 	return alloc_pages_node(numa_node_id(), gfp_mask, order);
 }
@@ -283,6 +284,7 @@ static inline struct folio *folio_alloc(gfp_t gfp, unsigned int order)
 #define vma_alloc_folio(gfp, order, vma, addr, hugepage)		\
 	folio_alloc(gfp, order)
 #endif
+#define alloc_pages(gfp, order) pgtag_alloc_pages(gfp, order)
 #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
 static inline struct page *alloc_page_vma(gfp_t gfp,
 		struct vm_area_struct *vma, unsigned long addr)
@@ -292,7 +294,9 @@ static inline struct page *alloc_page_vma(gfp_t gfp,
 	return &folio->page;
 }
 
-extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
+extern unsigned long _get_free_pages(gfp_t gfp_mask, unsigned int order,
+				     struct page **ppage);
+#define __get_free_pages(gfp_mask, order) pgtag_get_free_pages(gfp_mask, order)
 extern unsigned long get_zeroed_page(gfp_t gfp_mask);
 
 void *alloc_pages_exact(size_t size, gfp_t gfp_mask) __alloc_size(1);
diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index fabb2e1e087f..b26077110fb3 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -4,7 +4,6 @@
 
 #include <linux/types.h>
 #include <linux/stacktrace.h>
-#include <linux/stackdepot.h>
 
 struct pglist_data;
 struct page_ext_operations {
@@ -14,6 +13,8 @@ struct page_ext_operations {
 	void (*init)(void);
 };
 
+#include <linux/stackdepot.h>
+
 #ifdef CONFIG_PAGE_EXTENSION
 
 enum page_ext_flags {
diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index f525abfe51d4..154ea7436fec 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -5,6 +5,8 @@
 #ifndef _LINUX_PGALLOC_TAG_H
 #define _LINUX_PGALLOC_TAG_H
 
+#ifdef CONFIG_PAGE_ALLOC_TAGGING
+
 #include <linux/alloc_tag.h>
 #include <linux/page_ext.h>
 
@@ -25,4 +27,37 @@ static inline void pgalloc_tag_dec(struct page *page, unsigned int order)
 		alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
 }
 
+/*
+ * Redefinitions of the common page allocators/destructors
+ */
+#define pgtag_alloc_pages(gfp, order)					\
+({									\
+	struct page *_page = _alloc_pages((gfp), (order));		\
+									\
+	if (_page)							\
+		alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
+	_page;								\
+})
+
+#define pgtag_get_free_pages(gfp_mask, order)				\
+({									\
+	struct page *_page;						\
+	unsigned long _res = _get_free_pages((gfp_mask), (order), &_page);\
+									\
+	if (_res)							\
+		alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
+	_res;								\
+})
+
+#else /* CONFIG_PAGE_ALLOC_TAGGING */
+
+#define pgtag_alloc_pages(gfp, order) _alloc_pages(gfp, order)
+
+#define pgtag_get_free_pages(gfp_mask, order) \
+	_get_free_pages((gfp_mask), (order), NULL)
+
+#define pgalloc_tag_dec(__page, __size)		do {} while (0)
+
+#endif /* CONFIG_PAGE_ALLOC_TAGGING */
+
 #endif /* _LINUX_PGALLOC_TAG_H */
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b73d3248d976..f7e6d9564a49 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2249,7 +2249,7 @@ EXPORT_SYMBOL(vma_alloc_folio);
  * flags are used.
  * Return: The page on success or NULL if allocation fails.
  */
-struct page *alloc_pages(gfp_t gfp, unsigned order)
+struct page *_alloc_pages(gfp_t gfp, unsigned int order)
 {
 	struct mempolicy *pol = &default_policy;
 	struct page *page;
@@ -2273,7 +2273,7 @@ struct page *alloc_pages(gfp_t gfp, unsigned order)
 
 	return page;
 }
-EXPORT_SYMBOL(alloc_pages);
+EXPORT_SYMBOL(_alloc_pages);
 
 struct folio *folio_alloc(gfp_t gfp, unsigned order)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e5486d47406e..165daba19e2a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -763,6 +763,7 @@ static inline bool pcp_allowed_order(unsigned int order)
 
 static inline void free_the_page(struct page *page, unsigned int order)
 {
+
 	if (pcp_allowed_order(order))		/* Via pcp? */
 		free_unref_page(page, order);
 	else
@@ -1120,6 +1121,8 @@ static inline void __free_one_page(struct page *page,
 	VM_BUG_ON_PAGE(pfn & ((1 << order) - 1), page);
 	VM_BUG_ON_PAGE(bad_range(zone, page), page);
 
+	pgalloc_tag_dec(page, order);
+
 	while (order < MAX_ORDER - 1) {
 		if (compaction_capture(capc, page, order, migratetype)) {
 			__mod_zone_freepage_state(zone, -(1 << order),
@@ -3440,6 +3443,7 @@ static void free_unref_page_commit(struct zone *zone, struct per_cpu_pages *pcp,
 	int pindex;
 	bool free_high;
 
+	pgalloc_tag_dec(page, order);
 	__count_vm_event(PGFREE);
 	pindex = order_to_pindex(migratetype, order);
 	list_add(&page->pcp_list, &pcp->lists[pindex]);
@@ -5557,16 +5561,19 @@ EXPORT_SYMBOL(__folio_alloc);
  * address cannot represent highmem pages. Use alloc_pages and then kmap if
  * you need to access high mem.
  */
-unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order)
+unsigned long _get_free_pages(gfp_t gfp_mask, unsigned int order,
+			      struct page **ppage)
 {
 	struct page *page;
 
-	page = alloc_pages(gfp_mask & ~__GFP_HIGHMEM, order);
+	page = _alloc_pages(gfp_mask & ~__GFP_HIGHMEM, order);
+	if (ppage)
+		*ppage = page;
 	if (!page)
 		return 0;
 	return (unsigned long) page_address(page);
 }
-EXPORT_SYMBOL(__get_free_pages);
+EXPORT_SYMBOL(_get_free_pages);
 
 unsigned long get_zeroed_page(gfp_t gfp_mask)
 {
-- 
2.37.2.672.g94769d06f0-goog


