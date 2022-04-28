Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F012512E65
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316180.535045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVJ-0007sJ-55; Thu, 28 Apr 2022 08:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316180.535045; Thu, 28 Apr 2022 08:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVI-0007Y3-7c; Thu, 28 Apr 2022 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 316180;
 Thu, 28 Apr 2022 08:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVC-0005SM-ET
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17a735bb-c6cd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:27:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C72351F88F;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86DCA13491;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJVhHwZQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:50 +0000
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
X-Inumbo-ID: 17a735bb-c6cd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDUTirs/68J75dLhVfxQ8SwGZggDnAgUBf0vqNCyldA=;
	b=uYPkEtI1D+dBDttNAMWwXe5ps2vwOgVNOH3jvmBtgFhBUy/z0IPKe2AMkUYo9qfXjXomlv
	eDi8P8+olYpzbp6RDG+C2VAYvNC2s/qwj3kH+fQ1mRdC6zeuKb69a8lZJCAUDt5w17TMiZ
	crrx8z21AJh4HirtTLTotjXWv2WOsT4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 11/19] xen/blkfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu, 28 Apr 2022 10:27:35 +0200
Message-Id: <20220428082743.16593-12-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify blkfront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkfront.c | 37 ++++++++----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 7f35e30e626a..bd7b34f29193 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1280,15 +1280,8 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	flush_work(&rinfo->work);
 
 	/* Free resources associated with old device channel. */
-	for (i = 0; i < info->nr_ring_pages; i++) {
-		if (rinfo->ring_ref[i] != INVALID_GRANT_REF) {
-			gnttab_end_foreign_access(rinfo->ring_ref[i], 0);
-			rinfo->ring_ref[i] = INVALID_GRANT_REF;
-		}
-	}
-	free_pages_exact(rinfo->ring.sring,
-			 info->nr_ring_pages * XEN_PAGE_SIZE);
-	rinfo->ring.sring = NULL;
+	xenbus_teardown_ring((void **)&rinfo->ring.sring, info->nr_ring_pages,
+			     rinfo->ring_ref);
 
 	if (rinfo->irq)
 		unbind_from_irqhandler(rinfo->irq, rinfo);
@@ -1679,30 +1672,16 @@ static int setup_blkring(struct xenbus_device *dev,
 			 struct blkfront_ring_info *rinfo)
 {
 	struct blkif_sring *sring;
-	int err, i;
+	int err;
 	struct blkfront_info *info = rinfo->dev_info;
 	unsigned long ring_size = info->nr_ring_pages * XEN_PAGE_SIZE;
-	grant_ref_t gref[XENBUS_MAX_RING_GRANTS];
-
-	for (i = 0; i < info->nr_ring_pages; i++)
-		rinfo->ring_ref[i] = INVALID_GRANT_REF;
 
-	sring = alloc_pages_exact(ring_size, GFP_NOIO);
-	if (!sring) {
-		xenbus_dev_fatal(dev, -ENOMEM, "allocating shared ring");
-		return -ENOMEM;
-	}
-	SHARED_RING_INIT(sring);
-	FRONT_RING_INIT(&rinfo->ring, sring, ring_size);
-
-	err = xenbus_grant_ring(dev, rinfo->ring.sring, info->nr_ring_pages, gref);
-	if (err < 0) {
-		free_pages_exact(sring, ring_size);
-		rinfo->ring.sring = NULL;
+	err = xenbus_setup_ring(dev, GFP_NOIO, (void **)&sring,
+				info->nr_ring_pages, rinfo->ring_ref);
+	if (err)
 		goto fail;
-	}
-	for (i = 0; i < info->nr_ring_pages; i++)
-		rinfo->ring_ref[i] = gref[i];
+
+	XEN_FRONT_RING_INIT(&rinfo->ring, sring, ring_size);
 
 	err = xenbus_alloc_evtchn(dev, &rinfo->evtchn);
 	if (err)
-- 
2.34.1


