Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E594264ED4B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 15:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464764.723289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAZ-0003cD-NA; Fri, 16 Dec 2022 14:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464764.723289; Fri, 16 Dec 2022 14:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAZ-0003ZC-Ie; Fri, 16 Dec 2022 14:58:39 +0000
Received: by outflank-mailman (input) for mailman id 464764;
 Fri, 16 Dec 2022 14:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p6CAY-0003Y8-HI
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 14:58:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e75bb65-7d52-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 15:58:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4D0734319;
 Fri, 16 Dec 2022 14:58:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93C0B138FD;
 Fri, 16 Dec 2022 14:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ccTCIpyHnGPPeAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 16 Dec 2022 14:58:36 +0000
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
X-Inumbo-ID: 1e75bb65-7d52-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671202716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x36AuY9fdrueTpOox7l4aH9J7+eTrfGAHM9OlY2CQHU=;
	b=SpGCTUY9+p3OSfiSSP0kSXj9iihsB9mtnEn6ajE8dHqS/FXFp5u52Ir2MnnMN0A0cCXhCR
	/nXL0RpYDQ5qQuU2FRxvLaqebBWdRkl6u08yKZs+ggqLcW7K2N/SgFEgEOusM82T6Xk9rN
	7dJmWlPYvDa0JU/uSa6/ZfB3W7Wi8OE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] xen/blkback: simplify free_persistent_gnts() interface
Date: Fri, 16 Dec 2022 15:58:15 +0100
Message-Id: <20221216145816.27374-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216145816.27374-1-jgross@suse.com>
References: <20221216145816.27374-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface of free_persistent_gnts() can be simplified, as there is
only a single caller of free_persistent_gnts() and the 2nd and 3rd
parameters are easily obtainable via the ring pointer, which is passed
as the first parameter anyway.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/blkback.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 6e2163aaf362..243712b59a05 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -239,9 +239,9 @@ static void put_persistent_gnt(struct xen_blkif_ring *ring,
 	atomic_dec(&ring->persistent_gnt_in_use);
 }
 
-static void free_persistent_gnts(struct xen_blkif_ring *ring, struct rb_root *root,
-                                 unsigned int num)
+static void free_persistent_gnts(struct xen_blkif_ring *ring)
 {
+	struct rb_root *root = &ring->persistent_gnts;
 	struct gnttab_unmap_grant_ref unmap[BLKIF_MAX_SEGMENTS_PER_REQUEST];
 	struct page *pages[BLKIF_MAX_SEGMENTS_PER_REQUEST];
 	struct persistent_gnt *persistent_gnt;
@@ -249,6 +249,9 @@ static void free_persistent_gnts(struct xen_blkif_ring *ring, struct rb_root *ro
 	int segs_to_unmap = 0;
 	struct gntab_unmap_queue_data unmap_data;
 
+	if (RB_EMPTY_ROOT(root))
+		return;
+
 	unmap_data.pages = pages;
 	unmap_data.unmap_ops = unmap;
 	unmap_data.kunmap_ops = NULL;
@@ -277,9 +280,11 @@ static void free_persistent_gnts(struct xen_blkif_ring *ring, struct rb_root *ro
 
 		rb_erase(&persistent_gnt->node, root);
 		kfree(persistent_gnt);
-		num--;
+		ring->persistent_gnt_c--;
 	}
-	BUG_ON(num != 0);
+
+	BUG_ON(!RB_EMPTY_ROOT(&ring->persistent_gnts));
+	BUG_ON(ring->persistent_gnt_c != 0);
 }
 
 void xen_blkbk_unmap_purged_grants(struct work_struct *work)
@@ -631,12 +636,7 @@ int xen_blkif_schedule(void *arg)
 void xen_blkbk_free_caches(struct xen_blkif_ring *ring)
 {
 	/* Free all persistent grant pages */
-	if (!RB_EMPTY_ROOT(&ring->persistent_gnts))
-		free_persistent_gnts(ring, &ring->persistent_gnts,
-			ring->persistent_gnt_c);
-
-	BUG_ON(!RB_EMPTY_ROOT(&ring->persistent_gnts));
-	ring->persistent_gnt_c = 0;
+	free_persistent_gnts(ring);
 
 	/* Since we are shutting down remove all pages from the buffer */
 	gnttab_page_cache_shrink(&ring->free_pages, 0 /* All */);
-- 
2.35.3


