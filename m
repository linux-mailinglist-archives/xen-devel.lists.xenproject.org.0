Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7C2D0E7C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46223.82024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEAe-0002AI-Mz; Mon, 07 Dec 2020 10:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46223.82024; Mon, 07 Dec 2020 10:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEAe-00029o-Ib; Mon, 07 Dec 2020 10:55:08 +0000
Received: by outflank-mailman (input) for mailman id 46223;
 Mon, 07 Dec 2020 10:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DX/D=FL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmEAc-00028j-Rk
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:55:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d832024-4040-4366-9066-0d889ee49bd3;
 Mon, 07 Dec 2020 10:55:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E5ADAC9A;
 Mon,  7 Dec 2020 10:55:03 +0000 (UTC)
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
X-Inumbo-ID: 8d832024-4040-4366-9066-0d889ee49bd3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607338503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KJpiuJgBhnj1MwTMzvIUckDr0A6Dg2EjphA7qkRPDD8=;
	b=cGoGdCdbajbEroTm16m9oZZVEOzA8TnXvHO8siqI8JVNxgr7QVnWzNddA/2I8SSO0uxwz+
	wyzv1cRMdei4bS7eh4ZEihT/OCNKqpW6XYeXbyoLc0v6og/wUz5yx/sZlD83sv1GtB/KlS
	mC/YSDw2oIsYl/GK9i+BjRr+tc+uAH8=
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
To: Jason Andryuk <jandryuk@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel
 <xen-devel@lists.xenproject.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
References: <20201129035639.GW2532@mail-itl>
 <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl> <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de> <20201204122054.GV201140@mail-itl>
 <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
 <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <293433c5-d23b-63e7-d607-9d24f06c46b4@suse.com>
Date: Mon, 7 Dec 2020 11:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f4lkDjWkzdTPnDP7lkZZv8N8sBAAohmmJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f4lkDjWkzdTPnDP7lkZZv8N8sBAAohmmJ
Content-Type: multipart/mixed; boundary="wFUe5hxoxCUoTdipeFju8EQv0wbXJQE3P";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel
 <xen-devel@lists.xenproject.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
Message-ID: <293433c5-d23b-63e7-d607-9d24f06c46b4@suse.com>
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
References: <20201129035639.GW2532@mail-itl>
 <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl> <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de> <20201204122054.GV201140@mail-itl>
 <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
 <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>
In-Reply-To: <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>

--wFUe5hxoxCUoTdipeFju8EQv0wbXJQE3P
Content-Type: multipart/mixed;
 boundary="------------87D70290072DEFFA48C976C4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------87D70290072DEFFA48C976C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Marek,

On 06.12.20 17:47, Jason Andryuk wrote:
> On Sat, Dec 5, 2020 at 3:29 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
>>
>> On Fri, Dec 04, 2020 at 01:20:54PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
>>> On Fri, Dec 04, 2020 at 01:08:03PM +0100, Christoph Hellwig wrote:
>>>> On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
>>>>> culprit:
>>>>>
>>>>> commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
>>>>> Author: Roger Pau Monne <roger.pau@citrix.com>
>>>>> Date:   Tue Sep 1 10:33:26 2020 +0200
>>>>>
>>>>>      xen: add helpers to allocate unpopulated memory
>>>>>
>>>>> I'm adding relevant people and xen-devel to the thread.
>>>>> For completeness, here is the original crash message:
>>>>
>>>> That commit definitively adds a new ZONE_DEVICE user, so it does loo=
k
>>>> related.  But you are not running on Xen, are you?
>>>
>>> I am. It is Xen dom0.
>>
>> I'm afraid I'm on leave and won't be able to look into this until the
>> beginning of January. I would guess it's some kind of bad
>> interaction between blkback and NVMe drivers both using ZONE_DEVICE?
>>
>> Maybe the best is to revert this change and I will look into it when
>> I get back, unless someone is willing to debug this further.
>=20
> Looking at commit 9e2369c06c8a and xen-blkback put_free_pages() , they
> both use page->lru which is part of the anonymous union shared with
> *pgmap.  That matches Marek's suspicion that the ZONE_DEVICE memory is
> being used as ZONE_NORMAL.
>=20
> memmap_init_zone_device() says:
> * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
> * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
> * ever freed or placed on a driver-private list.

Second try, now even tested to work on a test system (without NVMe).

Juergen

--------------87D70290072DEFFA48C976C4
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-add-helpers-for-caching-grant-mapping-pages.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-xen-add-helpers-for-caching-grant-mapping-pages.patch"

=46rom 4f6ad98ce5fd457fd12e6617b0bc2a8f82fbce4d Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 7 Dec 2020 08:31:22 +0100
Subject: [PATCH 1/2] xen: add helpers for caching grant mapping pages

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

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkb=
ack/blkback.c
index 501e9dacfff9..9ebf53903d7b 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -132,73 +132,12 @@ module_param(log_stats, int, 0644);
=20
 #define BLKBACK_INVALID_HANDLE (~0)
=20
-/* Number of free pages to remove on each call to gnttab_free_pages */
-#define NUM_BATCH_FREE_PAGES 10
-
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persist=
ent_gnt)
 {
 	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=3D
 			HZ * pgrant_timeout);
 }
=20
-static inline int get_free_page(struct xen_blkif_ring *ring, struct page=
 **page)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	if (list_empty(&ring->free_pages)) {
-		BUG_ON(ring->free_pages_num !=3D 0);
-		spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-		return gnttab_alloc_pages(1, page);
-	}
-	BUG_ON(ring->free_pages_num =3D=3D 0);
-	page[0] =3D list_first_entry(&ring->free_pages, struct page, lru);
-	list_del(&page[0]->lru);
-	ring->free_pages_num--;
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-
-	return 0;
-}
-
-static inline void put_free_pages(struct xen_blkif_ring *ring, struct pa=
ge **page,
-                                  int num)
-{
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	for (i =3D 0; i < num; i++)
-		list_add(&page[i]->lru, &ring->free_pages);
-	ring->free_pages_num +=3D num;
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-}
-
-static inline void shrink_free_pagepool(struct xen_blkif_ring *ring, int=
 num)
-{
-	/* Remove requested pages in batches of NUM_BATCH_FREE_PAGES */
-	struct page *page[NUM_BATCH_FREE_PAGES];
-	unsigned int num_pages =3D 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ring->free_pages_lock, flags);
-	while (ring->free_pages_num > num) {
-		BUG_ON(list_empty(&ring->free_pages));
-		page[num_pages] =3D list_first_entry(&ring->free_pages,
-		                                   struct page, lru);
-		list_del(&page[num_pages]->lru);
-		ring->free_pages_num--;
-		if (++num_pages =3D=3D NUM_BATCH_FREE_PAGES) {
-			spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-			gnttab_free_pages(num_pages, page);
-			spin_lock_irqsave(&ring->free_pages_lock, flags);
-			num_pages =3D 0;
-		}
-	}
-	spin_unlock_irqrestore(&ring->free_pages_lock, flags);
-	if (num_pages !=3D 0)
-		gnttab_free_pages(num_pages, page);
-}
-
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
=20
 static int do_block_io_op(struct xen_blkif_ring *ring, unsigned int *eoi=
_flags);
@@ -331,7 +270,8 @@ static void free_persistent_gnts(struct xen_blkif_rin=
g *ring, struct rb_root *ro
 			unmap_data.count =3D segs_to_unmap;
 			BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
=20
-			put_free_pages(ring, pages, segs_to_unmap);
+			gnttab_page_cache_put(&ring->free_pages, pages,
+					      segs_to_unmap);
 			segs_to_unmap =3D 0;
 		}
=20
@@ -371,7 +311,8 @@ void xen_blkbk_unmap_purged_grants(struct work_struct=
 *work)
 		if (++segs_to_unmap =3D=3D BLKIF_MAX_SEGMENTS_PER_REQUEST) {
 			unmap_data.count =3D segs_to_unmap;
 			BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
-			put_free_pages(ring, pages, segs_to_unmap);
+			gnttab_page_cache_put(&ring->free_pages, pages,
+					      segs_to_unmap);
 			segs_to_unmap =3D 0;
 		}
 		kfree(persistent_gnt);
@@ -379,7 +320,7 @@ void xen_blkbk_unmap_purged_grants(struct work_struct=
 *work)
 	if (segs_to_unmap > 0) {
 		unmap_data.count =3D segs_to_unmap;
 		BUG_ON(gnttab_unmap_refs_sync(&unmap_data));
-		put_free_pages(ring, pages, segs_to_unmap);
+		gnttab_page_cache_put(&ring->free_pages, pages, segs_to_unmap);
 	}
 }
=20
@@ -664,9 +605,10 @@ int xen_blkif_schedule(void *arg)
=20
 		/* Shrink the free pages pool if it is too large. */
 		if (time_before(jiffies, blkif->buffer_squeeze_end))
-			shrink_free_pagepool(ring, 0);
+			gnttab_page_cache_shrink(&ring->free_pages, 0);
 		else
-			shrink_free_pagepool(ring, max_buffer_pages);
+			gnttab_page_cache_shrink(&ring->free_pages,
+						 max_buffer_pages);
=20
 		if (log_stats && time_after(jiffies, ring->st_print))
 			print_stats(ring);
@@ -697,7 +639,7 @@ void xen_blkbk_free_caches(struct xen_blkif_ring *rin=
g)
 	ring->persistent_gnt_c =3D 0;
=20
 	/* Since we are shutting down remove all pages from the buffer */
-	shrink_free_pagepool(ring, 0 /* All */);
+	gnttab_page_cache_shrink(&ring->free_pages, 0 /* All */);
 }
=20
 static unsigned int xen_blkbk_unmap_prepare(
@@ -736,7 +678,7 @@ static void xen_blkbk_unmap_and_respond_callback(int =
result, struct gntab_unmap_
 	   but is this the best way to deal with this? */
 	BUG_ON(result);
=20
-	put_free_pages(ring, data->pages, data->count);
+	gnttab_page_cache_put(&ring->free_pages, data->pages, data->count);
 	make_response(ring, pending_req->id,
 		      pending_req->operation, pending_req->status);
 	free_req(ring, pending_req);
@@ -803,7 +745,8 @@ static void xen_blkbk_unmap(struct xen_blkif_ring *ri=
ng,
 		if (invcount) {
 			ret =3D gnttab_unmap_refs(unmap, NULL, unmap_pages, invcount);
 			BUG_ON(ret);
-			put_free_pages(ring, unmap_pages, invcount);
+			gnttab_page_cache_put(&ring->free_pages, unmap_pages,
+					      invcount);
 		}
 		pages +=3D batch;
 		num -=3D batch;
@@ -850,7 +793,8 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,=

 			pages[i]->page =3D persistent_gnt->page;
 			pages[i]->persistent_gnt =3D persistent_gnt;
 		} else {
-			if (get_free_page(ring, &pages[i]->page))
+			if (gnttab_page_cache_get(&ring->free_pages,
+						  &pages[i]->page))
 				goto out_of_memory;
 			addr =3D vaddr(pages[i]->page);
 			pages_to_gnt[segs_to_map] =3D pages[i]->page;
@@ -883,7 +827,8 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,=

 			BUG_ON(new_map_idx >=3D segs_to_map);
 			if (unlikely(map[new_map_idx].status !=3D 0)) {
 				pr_debug("invalid buffer -- could not remap it\n");
-				put_free_pages(ring, &pages[seg_idx]->page, 1);
+				gnttab_page_cache_put(&ring->free_pages,
+						      &pages[seg_idx]->page, 1);
 				pages[seg_idx]->handle =3D BLKBACK_INVALID_HANDLE;
 				ret |=3D 1;
 				goto next;
@@ -944,7 +889,7 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,=

=20
 out_of_memory:
 	pr_alert("%s: out of memory\n", __func__);
-	put_free_pages(ring, pages_to_gnt, segs_to_map);
+	gnttab_page_cache_put(&ring->free_pages, pages_to_gnt, segs_to_map);
 	for (i =3D last_map; i < num; i++)
 		pages[i]->handle =3D BLKBACK_INVALID_HANDLE;
 	return -ENOMEM;
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkba=
ck/common.h
index c6ea5d38c509..a1b9df2c4ef1 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -288,9 +288,7 @@ struct xen_blkif_ring {
 	struct work_struct	persistent_purge_work;
=20
 	/* Buffer of free pages to map grant refs. */
-	spinlock_t		free_pages_lock;
-	int			free_pages_num;
-	struct list_head	free_pages;
+	struct gnttab_page_cache free_pages;
=20
 	struct work_struct	free_work;
 	/* Thread shutdown wait queue. */
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkba=
ck/xenbus.c
index f5705569e2a7..76912c584a76 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -144,8 +144,7 @@ static int xen_blkif_alloc_rings(struct xen_blkif *bl=
kif)
 		INIT_LIST_HEAD(&ring->pending_free);
 		INIT_LIST_HEAD(&ring->persistent_purge_list);
 		INIT_WORK(&ring->persistent_purge_work, xen_blkbk_unmap_purged_grants)=
;
-		spin_lock_init(&ring->free_pages_lock);
-		INIT_LIST_HEAD(&ring->free_pages);
+		gnttab_page_cache_init(&ring->free_pages);
=20
 		spin_lock_init(&ring->pending_free_lock);
 		init_waitqueue_head(&ring->pending_free_wq);
@@ -317,8 +316,7 @@ static int xen_blkif_disconnect(struct xen_blkif *blk=
if)
 		BUG_ON(atomic_read(&ring->persistent_gnt_in_use) !=3D 0);
 		BUG_ON(!list_empty(&ring->persistent_purge_list));
 		BUG_ON(!RB_EMPTY_ROOT(&ring->persistent_gnts));
-		BUG_ON(!list_empty(&ring->free_pages));
-		BUG_ON(ring->free_pages_num !=3D 0);
+		BUG_ON(ring->free_pages.num_pages !=3D 0);
 		BUG_ON(ring->persistent_gnt_c !=3D 0);
 		WARN_ON(i !=3D (XEN_BLKIF_REQS_PER_PAGE * blkif->nr_ring_pages));
 		ring->active =3D false;
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 523dcdf39cc9..e2e42912f241 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -813,6 +813,78 @@ int gnttab_alloc_pages(int nr_pages, struct page **p=
ages)
 }
 EXPORT_SYMBOL_GPL(gnttab_alloc_pages);
=20
+void gnttab_page_cache_init(struct gnttab_page_cache *cache)
+{
+	spin_lock_init(&cache->lock);
+	INIT_LIST_HEAD(&cache->pages);
+	cache->num_pages =3D 0;
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_init);
+
+int gnttab_page_cache_get(struct gnttab_page_cache *cache, struct page *=
*page)
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
+	page[0] =3D list_first_entry(&cache->pages, struct page, lru);
+	list_del(&page[0]->lru);
+	cache->num_pages--;
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_get);
+
+void gnttab_page_cache_put(struct gnttab_page_cache *cache, struct page =
**page,
+			   unsigned int num)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&cache->lock, flags);
+
+	for (i =3D 0; i < num; i++)
+		list_add(&page[i]->lru, &cache->pages);
+	cache->num_pages +=3D num;
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+}
+EXPORT_SYMBOL_GPL(gnttab_page_cache_put);
+
+void gnttab_page_cache_shrink(struct gnttab_page_cache *cache, unsigned =
int num)
+{
+	struct page *page[10];
+	unsigned int i =3D 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cache->lock, flags);
+
+	while (cache->num_pages > num) {
+		page[i] =3D list_first_entry(&cache->pages, struct page, lru);
+		list_del(&page[i]->lru);
+		cache->num_pages--;
+		if (++i =3D=3D ARRAY_SIZE(page)) {
+			spin_unlock_irqrestore(&cache->lock, flags);
+			gnttab_free_pages(i, page);
+			i =3D 0;
+			spin_lock_irqsave(&cache->lock, flags);
+		}
+	}
+
+	spin_unlock_irqrestore(&cache->lock, flags);
+
+	if (i !=3D 0)
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
=20
 	wait_queue_head_t waiting_to_free;
+
+	struct gnttab_page_cache free_pages;
 };
=20
 /* theoretical maximum of grants for one request */
@@ -188,10 +190,6 @@ module_param_named(max_buffer_pages, scsiback_max_bu=
ffer_pages, int, 0644);
 MODULE_PARM_DESC(max_buffer_pages,
 "Maximum number of free pages to keep in backend buffer");
=20
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
=20
-static void put_free_pages(struct page **page, int num)
-{
-	unsigned long flags;
-	int i =3D free_pages_num + num, n =3D num;
-
-	if (num =3D=3D 0)
-		return;
-	if (i > scsiback_max_buffer_pages) {
-		n =3D min(num, i - scsiback_max_buffer_pages);
-		gnttab_free_pages(n, page + num - n);
-		n =3D num - n;
-	}
-	spin_lock_irqsave(&free_pages_lock, flags);
-	for (i =3D 0; i < n; i++)
-		list_add(&page[i]->lru, &scsiback_free_pages);
-	free_pages_num +=3D n;
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
-	page[0] =3D list_first_entry(&scsiback_free_pages, struct page, lru);
-	list_del(&page[0]->lru);
-	free_pages_num--;
-	spin_unlock_irqrestore(&free_pages_lock, flags);
-	return 0;
-}
-
 static unsigned long vaddr_page(struct page *page)
 {
 	unsigned long pfn =3D page_to_pfn(page);
@@ -302,7 +265,8 @@ static void scsiback_fast_flush_area(struct vscsibk_p=
end *req)
 		BUG_ON(err);
 	}
=20
-	put_free_pages(req->pages, req->n_grants);
+	gnttab_page_cache_put(&req->info->free_pages, req->pages,
+			      req->n_grants);
 	req->n_grants =3D 0;
 }
=20
@@ -445,8 +409,8 @@ static int scsiback_gnttab_data_map_list(struct vscsi=
bk_pend *pending_req,
 	struct vscsibk_info *info =3D pending_req->info;
=20
 	for (i =3D 0; i < cnt; i++) {
-		if (get_free_page(pg + mapcount)) {
-			put_free_pages(pg, mapcount);
+		if (gnttab_page_cache_get(&info->free_pages, pg + mapcount)) {
+			gnttab_page_cache_put(&info->free_pages, pg, mapcount);
 			pr_err("no grant page\n");
 			return -ENOMEM;
 		}
@@ -796,6 +760,8 @@ static int scsiback_do_cmd_fn(struct vscsibk_info *in=
fo,
 		cond_resched();
 	}
=20
+	gnttab_page_cache_shrink(&info->free_pages, scsiback_max_buffer_pages);=

+
 	RING_FINAL_CHECK_FOR_REQUESTS(&info->ring, more_to_do);
 	return more_to_do;
 }
@@ -1233,6 +1199,8 @@ static int scsiback_remove(struct xenbus_device *de=
v)
=20
 	scsiback_release_translation_entry(info);
=20
+	gnttab_page_cache_shrink(&info->free_pages, 0);
+
 	dev_set_drvdata(&dev->dev, NULL);
=20
 	return 0;
@@ -1263,6 +1231,7 @@ static int scsiback_probe(struct xenbus_device *dev=
,
 	info->irq =3D 0;
 	INIT_LIST_HEAD(&info->v2p_entry_lists);
 	spin_lock_init(&info->v2p_lock);
+	gnttab_page_cache_init(&info->free_pages);
=20
 	err =3D xenbus_printf(XBT_NIL, dev->nodename, "feature-sg-grant", "%u",=

 			    SG_ALL);
@@ -1879,13 +1848,6 @@ static int __init scsiback_init(void)
=20
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
=20
+struct gnttab_page_cache {
+	spinlock_t		lock;
+	struct list_head	pages;
+	unsigned int		num_pages;
+};
+
+void gnttab_page_cache_init(struct gnttab_page_cache *cache);
+int gnttab_page_cache_get(struct gnttab_page_cache *cache, struct page *=
*page);
+void gnttab_page_cache_put(struct gnttab_page_cache *cache, struct page =
**page,
+			   unsigned int num);
+void gnttab_page_cache_shrink(struct gnttab_page_cache *cache,
+			      unsigned int num);
+
 #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
 struct gnttab_dma_alloc_args {
 	/* Device for which DMA memory will be/was allocated. */
--=20
2.26.2


--------------87D70290072DEFFA48C976C4
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-xen-don-t-use-page-lru-for-ZONE_DEVICE-memory.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0002-xen-don-t-use-page-lru-for-ZONE_DEVICE-memory.patch"

=46rom 5ecf68877ed7ff4c7a96464b82eb84cc34d6d3f3 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 7 Dec 2020 09:36:14 +0100
Subject: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory

Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
memory") introduced usage of ZONE_DEVICE memory for foreign memory
mappings.

Unfortunately this collides with using page->lru for Xen backend
private page caches.

Fix that by using page->zone_device_data instead.

Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")=

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c       | 65 +++++++++++++++++++++++++++++----
 drivers/xen/unpopulated-alloc.c | 20 +++++-----
 include/xen/grant_table.h       |  4 ++
 3 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e2e42912f241..ddb38a3d7680 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -813,10 +813,63 @@ int gnttab_alloc_pages(int nr_pages, struct page **=
pages)
 }
 EXPORT_SYMBOL_GPL(gnttab_alloc_pages);
=20
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+static inline void cache_init(struct gnttab_page_cache *cache)
+{
+	cache->pages =3D NULL;
+}
+
+static inline bool cache_empty(struct gnttab_page_cache *cache)
+{
+	return cache->pages;
+}
+
+static inline struct page *cache_deq(struct gnttab_page_cache *cache)
+{
+	struct page *page;
+
+	page =3D cache->pages;
+	cache->pages =3D page->zone_device_data;
+
+	return page;
+}
+
+static inline void cache_enq(struct gnttab_page_cache *cache, struct pag=
e *page)
+{
+	page->zone_device_data =3D cache->pages;
+	cache->pages =3D page;
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
+	page =3D list_first_entry(&cache->pages, struct page, lru);
+	list_del(&page[0]->lru);
+
+	return page;
+}
+
+static inline void cache_enq(struct gnttab_page_cache *cache, struct pag=
e *page)
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
 	cache->num_pages =3D 0;
 }
 EXPORT_SYMBOL_GPL(gnttab_page_cache_init);
@@ -827,13 +880,12 @@ int gnttab_page_cache_get(struct gnttab_page_cache =
*cache, struct page **page)
=20
 	spin_lock_irqsave(&cache->lock, flags);
=20
-	if (list_empty(&cache->pages)) {
+	if (cache_empty(cache)) {
 		spin_unlock_irqrestore(&cache->lock, flags);
 		return gnttab_alloc_pages(1, page);
 	}
=20
-	page[0] =3D list_first_entry(&cache->pages, struct page, lru);
-	list_del(&page[0]->lru);
+	page[0] =3D cache_deq(cache);
 	cache->num_pages--;
=20
 	spin_unlock_irqrestore(&cache->lock, flags);
@@ -851,7 +903,7 @@ void gnttab_page_cache_put(struct gnttab_page_cache *=
cache, struct page **page,
 	spin_lock_irqsave(&cache->lock, flags);
=20
 	for (i =3D 0; i < num; i++)
-		list_add(&page[i]->lru, &cache->pages);
+		cache_enq(cache, page[i]);
 	cache->num_pages +=3D num;
=20
 	spin_unlock_irqrestore(&cache->lock, flags);
@@ -867,8 +919,7 @@ void gnttab_page_cache_shrink(struct gnttab_page_cach=
e *cache, unsigned int num)
 	spin_lock_irqsave(&cache->lock, flags);
=20
 	while (cache->num_pages > num) {
-		page[i] =3D list_first_entry(&cache->pages, struct page, lru);
-		list_del(&page[i]->lru);
+		page[i] =3D cache_deq(cache);
 		cache->num_pages--;
 		if (++i =3D=3D ARRAY_SIZE(page)) {
 			spin_unlock_irqrestore(&cache->lock, flags);
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-al=
loc.c
index 8c512ea550bb..7762c1bb23cb 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -12,7 +12,7 @@
 #include <xen/xen.h>
=20
 static DEFINE_MUTEX(list_lock);
-static LIST_HEAD(page_list);
+static struct page *page_list;
 static unsigned int list_count;
=20
 static int fill_list(unsigned int nr_pages)
@@ -84,7 +84,8 @@ static int fill_list(unsigned int nr_pages)
 		struct page *pg =3D virt_to_page(vaddr + PAGE_SIZE * i);
=20
 		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
-		list_add(&pg->lru, &page_list);
+		pg->zone_device_data =3D page_list;
+		page_list =3D pg;
 		list_count++;
 	}
=20
@@ -118,12 +119,10 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pag=
es, struct page **pages)
 	}
=20
 	for (i =3D 0; i < nr_pages; i++) {
-		struct page *pg =3D list_first_entry_or_null(&page_list,
-							   struct page,
-							   lru);
+		struct page *pg =3D page_list;
=20
 		BUG_ON(!pg);
-		list_del(&pg->lru);
+		page_list =3D pg->zone_device_data;
 		list_count--;
 		pages[i] =3D pg;
=20
@@ -134,7 +133,8 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages=
, struct page **pages)
 				unsigned int j;
=20
 				for (j =3D 0; j <=3D i; j++) {
-					list_add(&pages[j]->lru, &page_list);
+					pages[j]->zone_device_data =3D page_list;
+					page_list =3D pages[j];
 					list_count++;
 				}
 				goto out;
@@ -160,7 +160,8 @@ void xen_free_unpopulated_pages(unsigned int nr_pages=
, struct page **pages)
=20
 	mutex_lock(&list_lock);
 	for (i =3D 0; i < nr_pages; i++) {
-		list_add(&pages[i]->lru, &page_list);
+		pages[i]->zone_device_data =3D page_list;
+		page_list =3D pages[i];
 		list_count++;
 	}
 	mutex_unlock(&list_lock);
@@ -189,7 +190,8 @@ static int __init init(void)
 			struct page *pg =3D
 				pfn_to_page(xen_extra_mem[i].start_pfn + j);
=20
-			list_add(&pg->lru, &page_list);
+			pg->zone_device_data =3D page_list;
+			page_list =3D pg;
 			list_count++;
 		}
 	}
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index c6ef8ffc1a09..b9c937b3a149 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -200,7 +200,11 @@ void gnttab_free_pages(int nr_pages, struct page **p=
ages);
=20
 struct gnttab_page_cache {
 	spinlock_t		lock;
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+	struct page		*pages;
+#else
 	struct list_head	pages;
+#endif
 	unsigned int		num_pages;
 };
=20
--=20
2.26.2


--------------87D70290072DEFFA48C976C4
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------87D70290072DEFFA48C976C4--

--wFUe5hxoxCUoTdipeFju8EQv0wbXJQE3P--

--f4lkDjWkzdTPnDP7lkZZv8N8sBAAohmmJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/OCgUFAwAAAAAACgkQsN6d1ii/Ey+e
rAf9HIC1igwSwJJJsOKtv6bFlYBkxq3dDxCTX5wrIoW0qFDvmcXm9UckkGE4pmWyKIprtkGaqJIo
czraXjiQHgv4ZYlu/bW4SR1uNQ81NEaO6Wmgi7GmL5QN3M9k26vptIpVqNT9PyumVSi3MWIol0lo
6U3GT+MpF2kgK7HNTHjaElgREfHcBXF29b/Pl6GNt4Lm/NZipYXUVZkaW98SpUy11YZLzeOdH2dP
UVkwaBKdphSreootnM1cL9LKMys7GjWiqJCERC57WuicSBmlxWbGgiAnycRqEn8owSl3JIFj6zLv
ED0OF5HyU1x8wdp+X6Yz3t+5DUzfJIeur/RznAcRJA==
=NQoS
-----END PGP SIGNATURE-----

--f4lkDjWkzdTPnDP7lkZZv8N8sBAAohmmJ--

