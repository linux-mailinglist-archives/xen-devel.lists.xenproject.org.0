Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D94F600C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299878.511166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5ly-0002an-1d; Wed, 06 Apr 2022 13:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299878.511166; Wed, 06 Apr 2022 13:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5lx-0002Yy-Tf; Wed, 06 Apr 2022 13:32:33 +0000
Received: by outflank-mailman (input) for mailman id 299878;
 Wed, 06 Apr 2022 13:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nc5lx-0002JJ-3q
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:32:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02f1a3f9-b5ae-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 15:32:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C08961F7AE;
 Wed,  6 Apr 2022 13:32:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89BE3139F5;
 Wed,  6 Apr 2022 13:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CqxIIG+WTWLhAwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 06 Apr 2022 13:32:31 +0000
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
X-Inumbo-ID: 02f1a3f9-b5ae-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649251951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fRYpW0cKkoFsVs1W48NO42/Imz4z4xmT/W/n6IF74TY=;
	b=D3hjbmmd26QzFyFTDA48Xbsqomr7pFOECORnOpXG1KTLfMV7NWnPZNb1whNYDl0jBJdcyN
	9ueIMQSlDdUzEDsxOSGDBOtP8iwqmksJZYEGIjGRb1l2Miof/x0AR5AO08NskWCwyPRTk8
	l+gQ7z7loZ9aHCWiaiJSchJerdgl6cE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/balloon: fix page onlining when populating new zone
Date: Wed,  6 Apr 2022 15:32:29 +0200
Message-Id: <20220406133229.15979-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When onlining a new memory page in a guest the Xen balloon driver is
adding it to the ballooned pages instead making it available to be
used immediately. This is meant to enable to add a new upper memory
limit to a guest via hotplugging memory, without having to assign the
new memory in one go.

In case the upper memory limit will be raised above 4G, the new memory
will populate the ZONE_NORMAL memory zone, which wasn't populated
before. The newly populated zone won't be added to the list of zones
looked at by the page allocator though, as only zones with available
memory are being added, and the memory isn't yet available as it is
ballooned out.

This will result in the new memory being assigned to the guest, but
without the allocator being able to use it.

When running as a PV guest the situation is even worse: when having
been started with less memory than allowed, and the upper limit being
lower than 4G, ballooning up will have the same effect as hotplugging
new memory. This is due to the usage of the zone device functionality
since commit 9e2369c06c8a ("xen: add helpers to allocate unpopulated
memory") for creating mappings of other guest's pages, which as a side
effect is being used for PV guest ballooning, too.

Fix this by checking in xen_online_page() whether the new memory page
will be the first in a new zone. If this is the case, add another page
to the balloon and use the first memory page of the new chunk as a
replacement for this now ballooned out page. This will result in the
newly populated zone containing one page being available for the page
allocator, which in turn will lead to the zone being added to the
allocator.

Cc: stable@vger.kernel.org
Fixes: 9e2369c06c8a ("xen: add helpers to allocate unpopulated memory")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 72 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index dfe26fa17e95..f895c54c4c65 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -355,14 +355,77 @@ static enum bp_state reserve_additional_memory(void)
 	return BP_ECANCELED;
 }
 
+static struct page *alloc_page_for_balloon(gfp_t gfp)
+{
+	struct page *page;
+
+	page = alloc_page(gfp);
+	if (page == NULL)
+		return NULL;
+
+	adjust_managed_page_count(page, -1);
+	xenmem_reservation_scrub_page(page);
+
+	return page;
+}
+
+static void add_page_to_balloon(struct page *page)
+{
+	xenmem_reservation_va_mapping_reset(1, &page);
+	balloon_append(page);
+}
+
 static void xen_online_page(struct page *page, unsigned int order)
 {
 	unsigned long i, size = (1 << order);
 	unsigned long start_pfn = page_to_pfn(page);
 	struct page *p;
+	struct zone *zone;
 
 	pr_debug("Online %lu pages starting at pfn 0x%lx\n", size, start_pfn);
 	mutex_lock(&balloon_mutex);
+	zone = page_zone(pfn_to_page(start_pfn));
+
+	/*
+	 * In case a new memory zone is going to be populated, we need to
+	 * ensure at least one page is made available for the memory allocator.
+	 * As the number of pages per zone is updated only after a batch of
+	 * pages having been added, use the number of managed pages as an
+	 * additional indicator for a new zone.
+	 * Otherwise this zone won't be added to the zonelist resulting in the
+	 * zone's memory not usable by the kernel.
+	 * Add an already valid page to the balloon and replace it with the
+	 * first page of the to be added new memory chunk.
+	 */
+	if (!populated_zone(zone) && !managed_zone(zone)) {
+		xen_pfn_t frame;
+
+		pr_info("Populating new zone\n");
+
+		p = alloc_page_for_balloon(GFP_ATOMIC);
+		if (!p) {
+			pr_err("Failed to allocate replacement balloon page!\n");
+			pr_err("New onlined memory might not be usable.\n");
+		} else {
+			kmap_flush_unused();
+			add_page_to_balloon(p);
+			flush_tlb_all();
+			frame = xen_page_to_gfn(p);
+			xenmem_reservation_decrease(1, &frame);
+			balloon_stats.current_pages--;
+		}
+
+		p = pfn_to_page(start_pfn);
+		frame = page_to_xen_pfn(p);
+		if (xenmem_reservation_increase(1, &frame) > 0) {
+			xenmem_reservation_va_mapping_update(1, &p, &frame);
+			free_reserved_page(p);
+			balloon_stats.current_pages++;
+
+			start_pfn++;
+			size--;
+		}
+	}
 	for (i = 0; i < size; i++) {
 		p = pfn_to_page(start_pfn + i);
 		balloon_append(p);
@@ -452,14 +515,12 @@ static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
 		nr_pages = ARRAY_SIZE(frame_list);
 
 	for (i = 0; i < nr_pages; i++) {
-		page = alloc_page(gfp);
+		page = alloc_page_for_balloon(gfp);
 		if (page == NULL) {
 			nr_pages = i;
 			state = BP_EAGAIN;
 			break;
 		}
-		adjust_managed_page_count(page, -1);
-		xenmem_reservation_scrub_page(page);
 		list_add(&page->lru, &pages);
 	}
 
@@ -480,11 +541,8 @@ static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
 	list_for_each_entry_safe(page, tmp, &pages, lru) {
 		frame_list[i++] = xen_page_to_gfn(page);
 
-		xenmem_reservation_va_mapping_reset(1, &page);
-
 		list_del(&page->lru);
-
-		balloon_append(page);
+		add_page_to_balloon(page);
 	}
 
 	flush_tlb_all();
-- 
2.34.1


