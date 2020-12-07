Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A152D1213
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46568.82660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb7-0006iB-KM; Mon, 07 Dec 2020 13:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46568.82660; Mon, 07 Dec 2020 13:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb7-0006hX-GQ; Mon, 07 Dec 2020 13:30:37 +0000
Received: by outflank-mailman (input) for mailman id 46568;
 Mon, 07 Dec 2020 13:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DX/D=FL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmGb5-0006dg-Or
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:30:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c23c5b8c-3fee-403d-b56a-747c45366e30;
 Mon, 07 Dec 2020 13:30:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A2F3ACF4;
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
X-Inumbo-ID: c23c5b8c-3fee-403d-b56a-747c45366e30
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607347829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZO5teaKU4bY6WAv2ur3lcADxCg7ltO2UkLJkOCEfo4M=;
	b=C/6Y806l2Ayi/SLM4GU4bpZhT0TniNWrDQy+PscKv/RT+RDSTxtACI4B+6F0XNJ0+p8/86
	RR/CQZbk9JT4Y5CwF6Yp8BSOKKx/CByoCxdVrb33S28gpnmq9Ye076aTOQ9FVhqfFMcRYg
	kMUZobzs8B7FXpD/SRkBNiQOgUYtqlw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen: add helpers for caching grant mapping pages
Date: Mon,  7 Dec 2020 14:30:23 +0100
Message-Id: <20201207133024.16621-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207133024.16621-1-jgross@suse.com>
References: <20201207133024.16621-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having similar helpers in multiple backend drivers use
common helpers for caching pages allocated via gnttab_alloc_pages().

Make use of those helpers in blkback and scsiback.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/blkback.c | 89 ++++++-----------------------
 drivers/block/xen-blkback/common.h  |  4 +-
 drivers/block/xen-blkback/xenbus.c  |  6 +-
 drivers/xen/grant-table.c           | 72 +++++++++++++++++++++++
 drivers/xen/xen-scsiback.c          | 60 ++++---------------
 include/xen/grant_table.h           | 13 +++++
 6 files changed, 116 insertions(+), 128 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 501e9dacfff9..9ebf53903d7b 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -132,73 +132,12 @@ module_param(log_stats, int, 0644);
 
 #define BLKBACK_INVALID_HANDLE (~0)
 
-/* Number of free pages to remove on each call to gnttab_free_pages */
-#define NUM_BATCH_FREE_PAGES 10
-
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
 {
 	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=
 			HZ * pgrant_timeout);
 }
 
-static inline int get_free_page(struct xen_blkif_ring *ring, struct page **page)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	if (list_empty(&ring->free_pages)) {
-		BUG_ON(ring->free_pages_num != 0);
-		spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-		return gnttab_alloc_pages(1, page);
-	}
-	BUG_ON(ring->free_pages_num == 0);
-	page[0] = list_first_entry(&ring->free_pages, struct page, lru);
-	list_del(&page[0]->lru);
-	ring->free_pages_num--;
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-
-	return 0;
-}
-
-static inline void put_free_pages(struct xen_blkif_ring *ring, struct page **page,
-                                  int num)
-{
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	for (i = 0; i < num; i++)
-		list_add(&page[i]->lru, &ring->free_pages);
-	ring->free_pages_num += num;
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-}
-
-static inline void shrink_free_pagepool(struct xen_blkif_ring *ring, int num)
-{
-	/* Remove requested pages in batches of NUM_BATCH_FREE_PAGES */
-	struct page *page[NUM_BATCH_FREE_PAGES];
-	unsigned int num_pages = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	while (ring->free_pages_num > num) {
-		BUG_ON(list_empty(&ring->free_pages));
-		page[num_pages] = list_first_entry(&ring->free_pages,
-		                                   struct page, lru);
-		list_del(&page[num_pages]->lru);
-		ring->free_pages_num--;
-		if (++num_pages == NUM_BATCH_FREE_PAGES) {
-			spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-			gnttab_free_pages(num_pages, page);
-			spin_lock_irqsave(&ring->free_pages_lock, flags);
-			num_pages = 0;
-		}
-	}
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-	if (num_pages != 0)
-		gnttab_free_pages(num_pages, page);
-}
-
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
 
 static int do_block_io_op(struct xen_blkif_ring *ring, unsigned int *eoi_flags);
@@ -331,7 +270,8 @@ static void free_persistent_gnts(struct xen_blkif_ring *ring, struct rb_root *ro
 			unmap_data.count = segs_to_unmap;
 			BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
 
-			put_free_pages(ring, pages, segs_to_unmap);
+			gnttab_page_cache_put(&ring->free_pages, pages,
+					      segs_to_unmap);
 			segs_to_unmap = 0;
 		}
 
@@ -371,7 +311,8 @@ void xen_blkbk_unmap_purged_grants(struct work_struct *work)
 		if (++segs_to_unmap == BLKIF_MAX_SEGMENTS_PER_REQUEST) {
 			unmap_data.count = segs_to_unmap;
 			BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
-			put_free_pages(ring, pages, segs_to_unmap);
+			gnttab_page_cache_put(&ring->free_pages, pages,
+					      segs_to_unmap);
 			segs_to_unmap = 0;
 		}
 		kfree(persistent_gnt);
@@ -379,7 +320,7 @@ void xen_blkbk_unmap_purged_grants(struct work_struct *work)
 	if (segs_to_unmap > 0) {
 		unmap_data.count = segs_to_unmap;
 		BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
-		put_free_pages(ring, pages, segs_to_unmap);
+		gnttab_page_cache_put(&ring->free_pages, pages, segs_to_unmap);
 	}
 }
 
@@ -664,9 +605,10 @@ int xen_blkif_schedule(void *arg)
 
 		/* Shrink the free pages pool if it is too large. */
 		if (time_before(jiffies, blkif->buffer_squeeze_end))
-			shrink_free_pagepool(ring, 0);
+			gnttab_page_cache_shrink(&ring->free_pages, 0);
 		else
-			shrink_free_pagepool(ring, max_buffer_pages);
+			gnttab_page_cache_shrink(&ring->free_pages,
+						 max_buffer_pages);
 
 		if (log_stats && time_after(jiffies, ring->st_print))
 			print_stats(ring);
@@ -697,7 +639,7 @@ void xen_blkbk_free_caches(struct xen_blkif_ring *ring)
 	ring->persistent_gnt_c = 0;
 
 	/* Since we are shutting down remove all pages from the buffer */
-	shrink_free_pagepool(ring, 0 /* All */);
+	gnttab_page_cache_shrink(&ring->free_pages, 0 /* All */);
 }
 
 static unsigned int xen_blkbk_unmap_prepare(
@@ -736,7 +678,7 @@ static void xen_blkbk_unmap_and_respond_callback(int result, struct gntab_unmap_
 	   but is this the best way to deal with this? */
 	BUG_ON(result);
 
-	put_free_pages(ring, data->pages, data->count);
+	gnttab_page_cache_put(&ring->free_pages, data->pages, data->count);
 	make_response(ring, pending_req->id,
 		      pending_req->operation, pending_req->status);
 	free_req(ring, pending_req);
@@ -803,7 +745,8 @@ static void xen_blkbk_unmap(struct xen_blkif_ring *ring,
 		if (invcount) {
 			ret = gnttab_unmap_refs(unmap, NULL, unmap_pages, invcount);
 			BUG_ON(ret);
-			put_free_pages(ring, unmap_pages, invcount);
+			gnttab_page_cache_put(&ring->free_pages, unmap_pages,
+					      invcount);
 		}
 		pages += batch;
 		num -= batch;
@@ -850,7 +793,8 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 			pages[i]->page = persistent_gnt->page;
 			pages[i]->persistent_gnt = persistent_gnt;
 		} else {
-			if (get_free_page(ring, &pages[i]->page))
+			if (gnttab_page_cache_get(&ring->free_pages,
+						  &pages[i]->page))
 				goto out_of_memory;
 			addr = vaddr(pages[i]->page);
 			pages_to_gnt[segs_to_map] = pages[i]->page;
@@ -883,7 +827,8 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 			BUG_ON(new_map_idx >= segs_to_map);
 			if (unlikely(map[new_map_idx].status != 0)) {
 				pr_debug("invalid buffer -- could not remap it\n");
-				put_free_pages(ring, &pages[seg_idx]->page, 1);
+				gnttab_page_cache_put(&ring->free_pages,
+						      &pages[seg_idx]->page, 1);
 				pages[seg_idx]->handle = BLKBACK_INVALID_HANDLE;
 				ret |= 1;
 				goto next;
@@ -944,7 +889,7 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 
 out_of_memory:
 	pr_alert("%s: out of memory\n", __func__);
-	put_free_pages(ring, pages_to_gnt, segs_to_map);
+	gnttab_page_cache_put(&ring->free_pages, pages_to_gnt, segs_to_map);
 	for (i = last_map; i < num; i++)
 		pages[i]->handle = BLKBACK_INVALID_HANDLE;
 	return -ENOMEM;
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index c6ea5d38c509..a1b9df2c4ef1 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -288,9 +288,7 @@ struct xen_blkif_ring {
 	struct work_struct	persistent_purge_work;
 
 	/* Buffer of free pages to map grant refs. */
-	spinlock_t		free_pages_lock;
-	int			free_pages_num;
-	struct list_head	free_pages;
+	struct gnttab_page_cache free_pages;
 
 	struct work_struct	free_work;
 	/* Thread shutdown wait queue. */
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index f5705569e2a7..76912c584a76 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -144,8 +144,7 @@ static int xen_blkif_alloc_rings(struct xen_blkif *blkif)
 		INIT_LIST_HEAD(&ring->pending_free);
 		INIT_LIST_HEAD(&ring->persistent_purge_list);
 		INIT_WORK(&ring->persistent_purge_work, xen_blkbk_unmap_purged_grants);
-		spin_lock_init(&ring->free_pages_lock);
-		INIT_LIST_HEAD(&ring->free_pages);
+		gnttab_page_cache_init(&ring->free_pages);
 
 		spin_lock_init(&ring->pending_free_lock);
 		init_waitqueue_head(&ring->pending_free_wq);
@@ -317,8 +316,7 @@ static int xen_blkif_disconnect(struct xen_blkif *blkif)
 		BUG_ON(atomic_read(&ring->persistent_gnt_in_use) != 0);
 		BUG_ON(!list_empty(&ring->persistent_purge_list));
 		BUG_ON(!RB_EMPTY_ROOT(&ring->persistent_gnts));
-		BUG_ON(!list_empty(&ring->free_pages));
-		BUG_ON(ring->free_pages_num != 0);
+		BUG_ON(ring->free_pages.num_pages != 0);
 		BUG_ON(ring->persistent_gnt_c != 0);
 		WARN_ON(i != (XEN_BLKIF_REQS_PER_PAGE * blkif->nr_ring_pages));
 		ring->active = false;
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 523dcdf39cc9..e2e42912f241 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -813,6 +813,78 @@ int gnttab_alloc_pages(int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL_GPL(gnttab_alloc_pages);
 
+void gnttab_page_cache_init(struct gnttab_page_cache *cache)
+{
+	spin_lock_init(&cache->lock);
+	INIT_LIST_HEAD(&cache->pages);
+	cache->num_pages = 0;
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_init);
+
+int gnttab_page_cache_get(struct gnttab_page_cache *cache, struct page **page)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&cache->lock, flags);
+
+	if (list_empty(&cache->pages)) {
+		spin_unlock_irqrestore(&cache->lock, flags);
+		return gnttab_alloc_pages(1, page);
+	}
+
+	page[0] = list_first_entry(&cache->pages, struct page, lru);
+	list_del(&page[0]->lru);
+	cache->num_pages--;
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_get);
+
+void gnttab_page_cache_put(struct gnttab_page_cache *cache, struct page **page,
+			   unsigned int num)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&cache->lock, flags);
+
+	for (i = 0; i < num; i++)
+		list_add(&page[i]->lru, &cache->pages);
+	cache->num_pages += num;
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_put);
+
+void gnttab_page_cache_shrink(struct gnttab_page_cache *cache, unsigned int num)
+{
+	struct page *page[10];
+	unsigned int i = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cache->lock, flags);
+
+	while (cache->num_pages > num) {
+		page[i] = list_first_entry(&cache->pages, struct page, lru);
+		list_del(&page[i]->lru);
+		cache->num_pages--;
+		if (++i == ARRAY_SIZE(page)) {
+			spin_unlock_irqrestore(&cache->lock, flags);
+			gnttab_free_pages(i, page);
+			i = 0;
+			spin_lock_irqsave(&cache->lock, flags);
+		}
+	}
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+
+	if (i != 0)
+		gnttab_free_pages(i, page);
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_shrink);
+
 void gnttab_pages_clear_private(int nr_pages, struct page **pages)
 {
 	int i;
diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 4acc4e899600..862162dca33c 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -99,6 +99,8 @@ struct vscsibk_info {
 	struct list_head v2p_entry_lists;
 
 	wait_queue_head_t waiting_to_free;
+
+	struct gnttab_page_cache free_pages;
 };
 
 /* theoretical maximum of grants for one request */
@@ -188,10 +190,6 @@ module_param_named(max_buffer_pages, scsiback_max_buffer_pages, int, 0644);
 MODULE_PARM_DESC(max_buffer_pages,
 "Maximum number of free pages to keep in backend buffer");
 
-static DEFINE_SPINLOCK(free_pages_lock);
-static int free_pages_num;
-static LIST_HEAD(scsiback_free_pages);
-
 /* Global spinlock to protect scsiback TPG list */
 static DEFINE_MUTEX(scsiback_mutex);
 static LIST_HEAD(scsiback_list);
@@ -207,41 +205,6 @@ static void scsiback_put(struct vscsibk_info *info)
 		wake_up(&info->waiting_to_free);
 }
 
-static void put_free_pages(struct page **page, int num)
-{
-	unsigned long flags;
-	int i = free_pages_num + num, n = num;
-
-	if (num == 0)
-		return;
-	if (i > scsiback_max_buffer_pages) {
-		n = min(num, i - scsiback_max_buffer_pages);
-		gnttab_free_pages(n, page + num - n);
-		n = num - n;
-	}
-	spin_lock_irqsave(&free_pages_lock, flags);
-	for (i = 0; i < n; i++)
-		list_add(&page[i]->lru, &scsiback_free_pages);
-	free_pages_num += n;
-	spin_unlock_irqrestore(&free_pages_lock, flags);
-}
-
-static int get_free_page(struct page **page)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&free_pages_lock, flags);
-	if (list_empty(&scsiback_free_pages)) {
-		spin_unlock_irqrestore(&free_pages_lock, flags);
-		return gnttab_alloc_pages(1, page);
-	}
-	page[0] = list_first_entry(&scsiback_free_pages, struct page, lru);
-	list_del(&page[0]->lru);
-	free_pages_num--;
-	spin_unlock_irqrestore(&free_pages_lock, flags);
-	return 0;
-}
-
 static unsigned long vaddr_page(struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page);
@@ -302,7 +265,8 @@ static void scsiback_fast_flush_area(struct vscsibk_pend *req)
 		BUG_ON(err);
 	}
 
-	put_free_pages(req->pages, req->n_grants);
+	gnttab_page_cache_put(&req->info->free_pages, req->pages,
+			      req->n_grants);
 	req->n_grants = 0;
 }
 
@@ -445,8 +409,8 @@ static int scsiback_gnttab_data_map_list(struct vscsibk_pend *pending_req,
 	struct vscsibk_info *info = pending_req->info;
 
 	for (i = 0; i < cnt; i++) {
-		if (get_free_page(pg + mapcount)) {
-			put_free_pages(pg, mapcount);
+		if (gnttab_page_cache_get(&info->free_pages, pg + mapcount)) {
+			gnttab_page_cache_put(&info->free_pages, pg, mapcount);
 			pr_err("no grant page\n");
 			return -ENOMEM;
 		}
@@ -796,6 +760,8 @@ static int scsiback_do_cmd_fn(struct vscsibk_info *info,
 		cond_resched();
 	}
 
+	gnttab_page_cache_shrink(&info->free_pages, scsiback_max_buffer_pages);
+
 	RING_FINAL_CHECK_FOR_REQUESTS(&info->ring, more_to_do);
 	return more_to_do;
 }
@@ -1233,6 +1199,8 @@ static int scsiback_remove(struct xenbus_device *dev)
 
 	scsiback_release_translation_entry(info);
 
+	gnttab_page_cache_shrink(&info->free_pages, 0);
+
 	dev_set_drvdata(&dev->dev, NULL);
 
 	return 0;
@@ -1263,6 +1231,7 @@ static int scsiback_probe(struct xenbus_device *dev,
 	info->irq = 0;
 	INIT_LIST_HEAD(&info->v2p_entry_lists);
 	spin_lock_init(&info->v2p_lock);
+	gnttab_page_cache_init(&info->free_pages);
 
 	err = xenbus_printf(XBT_NIL, dev->nodename, "feature-sg-grant", "%u",
 			    SG_ALL);
@@ -1879,13 +1848,6 @@ static int __init scsiback_init(void)
 
 static void __exit scsiback_exit(void)
 {
-	struct page *page;
-
-	while (free_pages_num) {
-		if (get_free_page(&page))
-			BUG();
-		gnttab_free_pages(1, &page);
-	}
 	target_unregister_template(&scsiback_ops);
 	xenbus_unregister_driver(&scsiback_driver);
 }
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index 9bc5bc07d4d3..c6ef8ffc1a09 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -198,6 +198,19 @@ void gnttab_free_auto_xlat_frames(void);
 int gnttab_alloc_pages(int nr_pages, struct page **pages);
 void gnttab_free_pages(int nr_pages, struct page **pages);
 
+struct gnttab_page_cache {
+	spinlock_t		lock;
+	struct list_head	pages;
+	unsigned int		num_pages;
+};
+
+void gnttab_page_cache_init(struct gnttab_page_cache *cache);
+int gnttab_page_cache_get(struct gnttab_page_cache *cache, struct page **page);
+void gnttab_page_cache_put(struct gnttab_page_cache *cache, struct page **page,
+			   unsigned int num);
+void gnttab_page_cache_shrink(struct gnttab_page_cache *cache,
+			      unsigned int num);
+
 #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
 struct gnttab_dma_alloc_args {
 	/* Device for which DMA memory will be/was allocated. */
-- 
2.26.2


