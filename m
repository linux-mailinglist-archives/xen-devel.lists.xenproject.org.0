Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378256278F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 02:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358753.588106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74F0-00034G-C6; Fri, 01 Jul 2022 00:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358753.588106; Fri, 01 Jul 2022 00:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74F0-0002wy-8l; Fri, 01 Jul 2022 00:10:34 +0000
Received: by outflank-mailman (input) for mailman id 358753;
 Fri, 01 Jul 2022 00:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qQD=XG=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o74Ey-0002sL-Oz
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 00:10:32 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37743170-f8d2-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 02:10:30 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B8B6E5C00A4;
 Thu, 30 Jun 2022 20:10:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 20:10:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:10:29 -0400 (EDT)
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
X-Inumbo-ID: 37743170-f8d2-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1656634229; x=1656720629; bh=rGkQptGCLsRn301ihqWzQ7mM8qUMGEhaJXH
	F+f9Z/zA=; b=lUFSC7og4g9/VxdbnqBW06hXo+hrcjI/Fgo7oW5hyhjp/hgAWTg
	Jk3PeLfmDF9z9Q1TLFENsmNoAcEgtNDNdEL2yVd92sqiOSBo1RVbyVdWvlVacz+a
	EHsgIvnTUe1hYBb4uRRXZrnVQIfs6gcoiA0rcPlNCqqWKSf0zTDwIokjvjJeuWfc
	1nmi6uPsRIPNn9GMtLAsxAEHkQJy0aQ79Pvm+xh/cnG8EFflKkKDCol7Q+C0Jt0J
	lEoZ9BwooE1BJczSeJ7tsibgZ+dTPlBrzIF1s6yf7ek3CmBPE5dk5KJ0xA+0bO+V
	MUpW5Mp30/ETSn7/wh7e0EsssHK2FCznJkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656634229; x=1656720629; bh=rGkQptGCLsRn3
	01ihqWzQ7mM8qUMGEhaJXHF+f9Z/zA=; b=Od+u5NofmQ6I48maOiEqcWL5MisBx
	sOZO/r+bFeh8mA7kjaS9RkGdOoT4kJXJSwE7EZ9i7ZnLhA4uINtMpdsIU1xd12TG
	/n2L4w2/wn1bRE8UPWQgEvQwB9TgxR9Kk0Y4Qg1MkKVj6wmSC0MMc8rChOudK6lU
	gnRuDNxmCgxYP/c5a4g5trBqcsg3PjT6/MXoPNvo+1C19bn8VnY0zkhWrpe3BWMg
	dcL9kW8D2ThUDVjGU5Ihf15yv6xAdop1UF6K0ND8KkqIXFlJ6GqwHZeDmi15YJhp
	unlwplkMgxXlkHBhLeG/gBbQ6wd007r0eS0VwwcZ4TTZMh9drUxsClZ+w==
X-ME-Sender: <xms:dTu-Yrx_q_w_GLIpj0E5e7OoJYiLk39sqX9NQ377eF2rA_TTurDkyg>
    <xme:dTu-YjRnDrufcowafIoTd68J6WSzPNql-Xf_C28npQsqiW0nAMl2-z075KR3pB_If
    ede0rHn9TKZKpc>
X-ME-Received: <xmr:dTu-YlUBK8nE4TifnBLAKcMvfajnTLxzvIPb6f_BSd62NlEoCc-_vxcprz4EGEtQpt8ssLQtFama>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptedtgeduleekleevjeehhfdvkefh
    veeuvdevtdduhffhvdeltdegtdfgkeduudegnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:dTu-YlhbwX9nADCS_8628OiSglAUko-ruJOKvdjTBqwJpDsg8hGpTg>
    <xmx:dTu-YtC4yN6JwwIbZMJpdwo7Qz_S7lUoneFDFug8HYxdRwSOdLieiw>
    <xmx:dTu-YuIsKHI5sx-mAO13cjGIaoFozvArCtrbQcuMMgvpD_YlSQigUQ>
    <xmx:dTu-YgMQhAVk9zSBFrS3Arw4ep7r5vwAdOLV3Q7FZvH3w5QDAhbdFA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: [PATCH 5.4] xen/gntdev: Avoid blocking in unmap_grant_pages()
Date: Thu, 30 Jun 2022 20:09:49 -0400
Message-Id: <20220701000951.5072-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701000951.5072-1-demi@invisiblethingslab.com>
References: <20220701000951.5072-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unmap_grant_pages() currently waits for the pages to no longer be used.
In https://github.com/QubesOS/qubes-issues/issues/7481, this lead to a
deadlock against i915: i915 was waiting for gntdev's MMU notifier to
finish, while gntdev was waiting for i915 to free its pages.  I also
believe this is responsible for various deadlocks I have experienced in
the past.

Avoid these problems by making unmap_grant_pages async.  This requires
making it return void, as any errors will not be available when the
function returns.  Fortunately, the only use of the return value is a
WARN_ON(), which can be replaced by a WARN_ON when the error is
detected.  Additionally, a failed call will not prevent further calls
from being made, but this is harmless.

Because unmap_grant_pages is now async, the grant handle will be sent to
INVALID_GRANT_HANDLE too late to prevent multiple unmaps of the same
handle.  Instead, a separate bool array is allocated for this purpose.
This wastes memory, but stuffing this information in padding bytes is
too fragile.  Furthermore, it is necessary to grab a reference to the
map before making the asynchronous call, and release the reference when
the call returns.

It is also necessary to guard against reentrancy in gntdev_map_put(),
and to handle the case where userspace tries to map a mapping whose
contents have not all been freed yet.

Fixes: 745282256c75 ("xen/gntdev: safely unmap grants in case they are still in use")
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Link: https://lore.kernel.org/r/20220622022726.2538-1-demi@invisiblethingslab.com
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev-common.h |   8 ++
 drivers/xen/gntdev.c        | 147 +++++++++++++++++++++++++-----------
 2 files changed, 110 insertions(+), 45 deletions(-)

diff --git a/drivers/xen/gntdev-common.h b/drivers/xen/gntdev-common.h
index 2f8b949c3eeb..fab6f5a54d5b 100644
--- a/drivers/xen/gntdev-common.h
+++ b/drivers/xen/gntdev-common.h
@@ -15,6 +15,8 @@
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
 #include <linux/types.h>
+#include <xen/interface/event_channel.h>
+#include <xen/grant_table.h>
 
 struct gntdev_dmabuf_priv;
 
@@ -61,6 +63,7 @@ struct gntdev_grant_map {
 	struct gnttab_unmap_grant_ref *unmap_ops;
 	struct gnttab_map_grant_ref   *kmap_ops;
 	struct gnttab_unmap_grant_ref *kunmap_ops;
+	bool *being_removed;
 	struct page **pages;
 	unsigned long pages_vm_start;
 
@@ -78,6 +81,11 @@ struct gntdev_grant_map {
 	/* Needed to avoid allocation in gnttab_dma_free_pages(). */
 	xen_pfn_t *frames;
 #endif
+
+	/* Number of live grants */
+	atomic_t live_grants;
+	/* Needed to avoid allocation in __unmap_grant_pages */
+	struct gntab_unmap_queue_data unmap_data;
 };
 
 struct gntdev_grant_map *gntdev_alloc_map(struct gntdev_priv *priv, int count,
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index e953ea34b3e4..f46479347765 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/refcount.h>
+#include <linux/workqueue.h>
 
 #include <xen/xen.h>
 #include <xen/grant_table.h>
@@ -62,11 +63,12 @@ MODULE_PARM_DESC(limit, "Maximum number of grants that may be mapped by "
 
 static atomic_t pages_mapped = ATOMIC_INIT(0);
 
+/* True in PV mode, false otherwise */
 static int use_ptemod;
 #define populate_freeable_maps use_ptemod
 
-static int unmap_grant_pages(struct gntdev_grant_map *map,
-			     int offset, int pages);
+static void unmap_grant_pages(struct gntdev_grant_map *map,
+			      int offset, int pages);
 
 static struct miscdevice gntdev_miscdev;
 
@@ -123,6 +125,7 @@ static void gntdev_free_map(struct gntdev_grant_map *map)
 	kfree(map->unmap_ops);
 	kfree(map->kmap_ops);
 	kfree(map->kunmap_ops);
+	kfree(map->being_removed);
 	kfree(map);
 }
 
@@ -142,12 +145,15 @@ struct gntdev_grant_map *gntdev_alloc_map(struct gntdev_priv *priv, int count,
 	add->kmap_ops  = kcalloc(count, sizeof(add->kmap_ops[0]), GFP_KERNEL);
 	add->kunmap_ops = kcalloc(count, sizeof(add->kunmap_ops[0]), GFP_KERNEL);
 	add->pages     = kcalloc(count, sizeof(add->pages[0]), GFP_KERNEL);
+	add->being_removed =
+		kcalloc(count, sizeof(add->being_removed[0]), GFP_KERNEL);
 	if (NULL == add->grants    ||
 	    NULL == add->map_ops   ||
 	    NULL == add->unmap_ops ||
 	    NULL == add->kmap_ops  ||
 	    NULL == add->kunmap_ops ||
-	    NULL == add->pages)
+	    NULL == add->pages     ||
+	    NULL == add->being_removed)
 		goto err;
 
 #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
@@ -243,6 +249,35 @@ void gntdev_put_map(struct gntdev_priv *priv, struct gntdev_grant_map *map)
 		return;
 
 	atomic_sub(map->count, &pages_mapped);
+	if (map->pages && !use_ptemod) {
+		/*
+		 * Increment the reference count.  This ensures that the
+		 * subsequent call to unmap_grant_pages() will not wind up
+		 * re-entering itself.  It *can* wind up calling
+		 * gntdev_put_map() recursively, but such calls will be with a
+		 * reference count greater than 1, so they will return before
+		 * this code is reached.  The recursion depth is thus limited to
+		 * 1.  Do NOT use refcount_inc() here, as it will detect that
+		 * the reference count is zero and WARN().
+		 */
+		refcount_set(&map->users, 1);
+
+		/*
+		 * Unmap the grants.  This may or may not be asynchronous, so it
+		 * is possible that the reference count is 1 on return, but it
+		 * could also be greater than 1.
+		 */
+		unmap_grant_pages(map, 0, map->count);
+
+		/* Check if the memory now needs to be freed */
+		if (!refcount_dec_and_test(&map->users))
+			return;
+
+		/*
+		 * All pages have been returned to the hypervisor, so free the
+		 * map.
+		 */
+	}
 
 	if (map->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
 		notify_remote_via_evtchn(map->notify.event);
@@ -298,6 +333,7 @@ static int set_grant_ptes_as_special(pte_t *pte, unsigned long addr, void *data)
 
 int gntdev_map_grant_pages(struct gntdev_grant_map *map)
 {
+	size_t alloced = 0;
 	int i, err = 0;
 
 	if (!use_ptemod) {
@@ -346,87 +382,109 @@ int gntdev_map_grant_pages(struct gntdev_grant_map *map)
 			map->pages, map->count);
 
 	for (i = 0; i < map->count; i++) {
-		if (map->map_ops[i].status == GNTST_okay)
+		if (map->map_ops[i].status == GNTST_okay) {
 			map->unmap_ops[i].handle = map->map_ops[i].handle;
-		else if (!err)
+			if (!use_ptemod)
+				alloced++;
+		} else if (!err)
 			err = -EINVAL;
 
 		if (map->flags & GNTMAP_device_map)
 			map->unmap_ops[i].dev_bus_addr = map->map_ops[i].dev_bus_addr;
 
 		if (use_ptemod) {
-			if (map->kmap_ops[i].status == GNTST_okay)
+			if (map->kmap_ops[i].status == GNTST_okay) {
+				if (map->map_ops[i].status == GNTST_okay)
+					alloced++;
 				map->kunmap_ops[i].handle = map->kmap_ops[i].handle;
-			else if (!err)
+			} else if (!err)
 				err = -EINVAL;
 		}
 	}
+	atomic_add(alloced, &map->live_grants);
 	return err;
 }
 
-static int __unmap_grant_pages(struct gntdev_grant_map *map, int offset,
-			       int pages)
+static void __unmap_grant_pages_done(int result,
+		struct gntab_unmap_queue_data *data)
 {
-	int i, err = 0;
-	struct gntab_unmap_queue_data unmap_data;
+	unsigned int i;
+	struct gntdev_grant_map *map = data->data;
+	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
+	for (i = 0; i < data->count; i++) {
+		WARN_ON(map->unmap_ops[offset+i].status);
+		pr_debug("unmap handle=%d st=%d\n",
+			map->unmap_ops[offset+i].handle,
+			map->unmap_ops[offset+i].status);
+		map->unmap_ops[offset+i].handle = -1;
+	}
+	/*
+	 * Decrease the live-grant counter.  This must happen after the loop to
+	 * prevent premature reuse of the grants by gnttab_mmap().
+	 */
+	atomic_sub(data->count, &map->live_grants);
+
+	/* Release reference taken by __unmap_grant_pages */
+	gntdev_put_map(NULL, map);
+}
+
+static void __unmap_grant_pages(struct gntdev_grant_map *map, int offset,
+			       int pages)
+{
 	if (map->notify.flags & UNMAP_NOTIFY_CLEAR_BYTE) {
 		int pgno = (map->notify.addr >> PAGE_SHIFT);
+
 		if (pgno >= offset && pgno < offset + pages) {
 			/* No need for kmap, pages are in lowmem */
 			uint8_t *tmp = pfn_to_kaddr(page_to_pfn(map->pages[pgno]));
+
 			tmp[map->notify.addr & (PAGE_SIZE-1)] = 0;
 			map->notify.flags &= ~UNMAP_NOTIFY_CLEAR_BYTE;
 		}
 	}
 
-	unmap_data.unmap_ops = map->unmap_ops + offset;
-	unmap_data.kunmap_ops = use_ptemod ? map->kunmap_ops + offset : NULL;
-	unmap_data.pages = map->pages + offset;
-	unmap_data.count = pages;
+	map->unmap_data.unmap_ops = map->unmap_ops + offset;
+	map->unmap_data.kunmap_ops = use_ptemod ? map->kunmap_ops + offset : NULL;
+	map->unmap_data.pages = map->pages + offset;
+	map->unmap_data.count = pages;
+	map->unmap_data.done = __unmap_grant_pages_done;
+	map->unmap_data.data = map;
+	refcount_inc(&map->users); /* to keep map alive during async call below */
 
-	err = gnttab_unmap_refs_sync(&unmap_data);
-	if (err)
-		return err;
-
-	for (i = 0; i < pages; i++) {
-		if (map->unmap_ops[offset+i].status)
-			err = -EINVAL;
-		pr_debug("unmap handle=%d st=%d\n",
-			map->unmap_ops[offset+i].handle,
-			map->unmap_ops[offset+i].status);
-		map->unmap_ops[offset+i].handle = -1;
-	}
-	return err;
+	gnttab_unmap_refs_async(&map->unmap_data);
 }
 
-static int unmap_grant_pages(struct gntdev_grant_map *map, int offset,
-			     int pages)
+static void unmap_grant_pages(struct gntdev_grant_map *map, int offset,
+			      int pages)
 {
-	int range, err = 0;
+	int range;
+
+	if (atomic_read(&map->live_grants) == 0)
+		return; /* Nothing to do */
 
 	pr_debug("unmap %d+%d [%d+%d]\n", map->index, map->count, offset, pages);
 
 	/* It is possible the requested range will have a "hole" where we
 	 * already unmapped some of the grants. Only unmap valid ranges.
 	 */
-	while (pages && !err) {
-		while (pages && map->unmap_ops[offset].handle == -1) {
+	while (pages) {
+		while (pages && map->being_removed[offset]) {
 			offset++;
 			pages--;
 		}
 		range = 0;
 		while (range < pages) {
-			if (map->unmap_ops[offset+range].handle == -1)
+			if (map->being_removed[offset + range])
 				break;
+			map->being_removed[offset + range] = true;
 			range++;
 		}
-		err = __unmap_grant_pages(map, offset, range);
+		if (range)
+			__unmap_grant_pages(map, offset, range);
 		offset += range;
 		pages -= range;
 	}
-
-	return err;
 }
 
 /* ------------------------------------------------------------------ */
@@ -496,7 +554,6 @@ static int unmap_if_in_range(struct gntdev_grant_map *map,
 			      bool blockable)
 {
 	unsigned long mstart, mend;
-	int err;
 
 	if (!in_range(map, start, end))
 		return 0;
@@ -510,10 +567,9 @@ static int unmap_if_in_range(struct gntdev_grant_map *map,
 			map->index, map->count,
 			map->vma->vm_start, map->vma->vm_end,
 			start, end, mstart, mend);
-	err = unmap_grant_pages(map,
+	unmap_grant_pages(map,
 				(mstart - map->vma->vm_start) >> PAGE_SHIFT,
 				(mend - mstart) >> PAGE_SHIFT);
-	WARN_ON(err);
 
 	return 0;
 }
@@ -554,7 +610,6 @@ static void mn_release(struct mmu_notifier *mn,
 {
 	struct gntdev_priv *priv = container_of(mn, struct gntdev_priv, mn);
 	struct gntdev_grant_map *map;
-	int err;
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry(map, &priv->maps, next) {
@@ -563,8 +618,7 @@ static void mn_release(struct mmu_notifier *mn,
 		pr_debug("map %d+%d (%lx %lx)\n",
 				map->index, map->count,
 				map->vma->vm_start, map->vma->vm_end);
-		err = unmap_grant_pages(map, /* offset */ 0, map->count);
-		WARN_ON(err);
+		unmap_grant_pages(map, /* offset */ 0, map->count);
 	}
 	list_for_each_entry(map, &priv->freeable_maps, next) {
 		if (!map->vma)
@@ -572,8 +626,7 @@ static void mn_release(struct mmu_notifier *mn,
 		pr_debug("map %d+%d (%lx %lx)\n",
 				map->index, map->count,
 				map->vma->vm_start, map->vma->vm_end);
-		err = unmap_grant_pages(map, /* offset */ 0, map->count);
-		WARN_ON(err);
+		unmap_grant_pages(map, /* offset */ 0, map->count);
 	}
 	mutex_unlock(&priv->lock);
 }
@@ -1102,6 +1155,10 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		goto unlock_out;
 	}
 
+	if (atomic_read(&map->live_grants)) {
+		err = -EAGAIN;
+		goto unlock_out;
+	}
 	refcount_inc(&map->users);
 
 	vma->vm_ops = &gntdev_vmops;
-- 
2.36.1


