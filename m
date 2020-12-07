Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926B2D1211
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46567.82647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb3-0006fC-Bh; Mon, 07 Dec 2020 13:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46567.82647; Mon, 07 Dec 2020 13:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb3-0006en-8U; Mon, 07 Dec 2020 13:30:33 +0000
Received: by outflank-mailman (input) for mailman id 46567;
 Mon, 07 Dec 2020 13:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DX/D=FL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmGb1-0006do-Ju
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:30:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd845fb6-9b2c-47e7-b339-d9698956272a;
 Mon, 07 Dec 2020 13:30:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E70EAD09;
 Mon,  7 Dec 2020 13:30:29 +0000 (UTC)
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
X-Inumbo-ID: dd845fb6-9b2c-47e7-b339-d9698956272a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607347829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qO8uDSCaCVklC/1884Z3m6tRv+wQIAXdoqVmyxZTomc=;
	b=Lqq67VCQiRnET2stayy3VmJFaL/+SiunSGCMyjY+/iAT69IgVj1Po9szzlkif8CQKoFjJw
	O421QkLOJd619Fb3UmAxypDynmuGG8KeDiysJD/h1VK+iW+mTfloQjJWku0CVt7Mb7pfrj
	jAbOZY6dksmrkLKftV+hq5yZbqKd2ME=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
Date: Mon,  7 Dec 2020 14:30:24 +0100
Message-Id: <20201207133024.16621-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207133024.16621-1-jgross@suse.com>
References: <20201207133024.16621-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
memory") introduced usage of ZONE_DEVICE memory for foreign memory
mappings.

Unfortunately this collides with using page->lru for Xen backend
private page caches.

Fix that by using page->zone_device_data instead.

Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c       | 65 +++++++++++++++++++++++++++++----
 drivers/xen/unpopulated-alloc.c | 20 +++++-----
 include/xen/grant_table.h       |  4 ++
 3 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e2e42912f241..696663a439fe 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -813,10 +813,63 @@ int gnttab_alloc_pages(int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL_GPL(gnttab_alloc_pages);
 
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+static inline void cache_init(struct gnttab_page_cache *cache)
+{
+	cache->pages = NULL;
+}
+
+static inline bool cache_empty(struct gnttab_page_cache *cache)
+{
+	return !cache->pages;
+}
+
+static inline struct page *cache_deq(struct gnttab_page_cache *cache)
+{
+	struct page *page;
+
+	page = cache->pages;
+	cache->pages = page->zone_device_data;
+
+	return page;
+}
+
+static inline void cache_enq(struct gnttab_page_cache *cache, struct page *page)
+{
+	page->zone_device_data = cache->pages;
+	cache->pages = page;
+}
+#else
+static inline void cache_init(struct gnttab_page_cache *cache)
+{
+	INIT_LIST_HEAD(&cache->pages);
+}
+
+static inline bool cache_empty(struct gnttab_page_cache *cache)
+{
+	return list_empty(&cache->pages);
+}
+
+static inline struct page *cache_deq(struct gnttab_page_cache *cache)
+{
+	struct page *page;
+
+	page = list_first_entry(&cache->pages, struct page, lru);
+	list_del(&page[0]->lru);
+
+	return page;
+}
+
+static inline void cache_enq(struct gnttab_page_cache *cache, struct page *page)
+{
+	list_add(&page->lru, &cache->pages);
+}
+#endif
+
 void gnttab_page_cache_init(struct gnttab_page_cache *cache)
 {
 	spin_lock_init(&cache->lock);
-	INIT_LIST_HEAD(&cache->pages);
+	cache_init(cache);
 	cache->num_pages = 0;
 }
 EXPORT_SYMBOL_GPL(gnttab_page_cache_init);
@@ -827,13 +880,12 @@ int gnttab_page_cache_get(struct gnttab_page_cache *cache, struct page **page)
 
 	spin_lock_irqsave(&cache->lock, flags);
 
-	if (list_empty(&cache->pages)) {
+	if (cache_empty(cache)) {
 		spin_unlock_irqrestore(&cache->lock, flags);
 		return gnttab_alloc_pages(1, page);
 	}
 
-	page[0] = list_first_entry(&cache->pages, struct page, lru);
-	list_del(&page[0]->lru);
+	page[0] = cache_deq(cache);
 	cache->num_pages--;
 
 	spin_unlock_irqrestore(&cache->lock, flags);
@@ -851,7 +903,7 @@ void gnttab_page_cache_put(struct gnttab_page_cache *cache, struct page **page,
 	spin_lock_irqsave(&cache->lock, flags);
 
 	for (i = 0; i < num; i++)
-		list_add(&page[i]->lru, &cache->pages);
+		cache_enq(cache, page[i]);
 	cache->num_pages += num;
 
 	spin_unlock_irqrestore(&cache->lock, flags);
@@ -867,8 +919,7 @@ void gnttab_page_cache_shrink(struct gnttab_page_cache *cache, unsigned int num)
 	spin_lock_irqsave(&cache->lock, flags);
 
 	while (cache->num_pages > num) {
-		page[i] = list_first_entry(&cache->pages, struct page, lru);
-		list_del(&page[i]->lru);
+		page[i] = cache_deq(cache);
 		cache->num_pages--;
 		if (++i == ARRAY_SIZE(page)) {
 			spin_unlock_irqrestore(&cache->lock, flags);
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 8c512ea550bb..7762c1bb23cb 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -12,7 +12,7 @@
 #include <xen/xen.h>
 
 static DEFINE_MUTEX(list_lock);
-static LIST_HEAD(page_list);
+static struct page *page_list;
 static unsigned int list_count;
 
 static int fill_list(unsigned int nr_pages)
@@ -84,7 +84,8 @@ static int fill_list(unsigned int nr_pages)
 		struct page *pg = virt_to_page(vaddr + PAGE_SIZE * i);
 
 		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
-		list_add(&pg->lru, &page_list);
+		pg->zone_device_data = page_list;
+		page_list = pg;
 		list_count++;
 	}
 
@@ -118,12 +119,10 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 	}
 
 	for (i = 0; i < nr_pages; i++) {
-		struct page *pg = list_first_entry_or_null(&page_list,
-							   struct page,
-							   lru);
+		struct page *pg = page_list;
 
 		BUG_ON(!pg);
-		list_del(&pg->lru);
+		page_list = pg->zone_device_data;
 		list_count--;
 		pages[i] = pg;
 
@@ -134,7 +133,8 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 				unsigned int j;
 
 				for (j = 0; j <= i; j++) {
-					list_add(&pages[j]->lru, &page_list);
+					pages[j]->zone_device_data = page_list;
+					page_list = pages[j];
 					list_count++;
 				}
 				goto out;
@@ -160,7 +160,8 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 
 	mutex_lock(&list_lock);
 	for (i = 0; i < nr_pages; i++) {
-		list_add(&pages[i]->lru, &page_list);
+		pages[i]->zone_device_data = page_list;
+		page_list = pages[i];
 		list_count++;
 	}
 	mutex_unlock(&list_lock);
@@ -189,7 +190,8 @@ static int __init init(void)
 			struct page *pg =
 				pfn_to_page(xen_extra_mem[i].start_pfn + j);
 
-			list_add(&pg->lru, &page_list);
+			pg->zone_device_data = page_list;
+			page_list = pg;
 			list_count++;
 		}
 	}
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index c6ef8ffc1a09..b9c937b3a149 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -200,7 +200,11 @@ void gnttab_free_pages(int nr_pages, struct page **pages);
 
 struct gnttab_page_cache {
 	spinlock_t		lock;
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+	struct page		*pages;
+#else
 	struct list_head	pages;
+#endif
 	unsigned int		num_pages;
 };
 
-- 
2.26.2


