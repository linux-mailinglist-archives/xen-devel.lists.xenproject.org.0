Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD354FA2FF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 06:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301892.515351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd34I-0000Q0-Hb; Sat, 09 Apr 2022 04:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301892.515351; Sat, 09 Apr 2022 04:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd34I-0000N6-CS; Sat, 09 Apr 2022 04:51:26 +0000
Received: by outflank-mailman (input) for mailman id 301892;
 Sat, 09 Apr 2022 04:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6m1B=UT=bombadil.srs.infradead.org=BATV+43fc5532e856fea764d1+6803+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nd34G-0006gL-EZ
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 04:51:24 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b43699ff-b7c0-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 06:51:23 +0200 (CEST)
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd341-0020d9-Mx; Sat, 09 Apr 2022 04:51:10 +0000
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
X-Inumbo-ID: b43699ff-b7c0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fe1mhxHvUNcHX31X2/v6QhlWCpL7rHNmKlyfX6pAQx8=; b=Ln3yxSObowNxJM1FMrhr+K57R6
	b4hm67oQXj8QHYSsDtTeswkmQMzhTUbmcFXZ8wSKANWZ3f2uawh1SArLLQwyfG/9xFBJpY85CXdw2
	ds/PrbeW2qhvBxLbQUlZJnupwwXSwTpD5oVVdXoHNH+XQIFpfq6JutVFrQurNrlSwXfXPm8nAVF8g
	3O6uBqOGhFXMyQobgkP5h+IgaBO6+coY7mEesusFLc5Uf97qVgiCBrdqIzpOVhA93gJW7XwjtIRj9
	o9pUqGiB3fZ23DPiIOWZiMJonzuJNE4ezkBUWAzOu6pd1udnLd7cjlnkVEEt0MQfIsCBUce9aPyz9
	Bxbzzdhw==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 07/27] drbd: cleanup decide_on_discard_support
Date: Sat,  9 Apr 2022 06:50:23 +0200
Message-Id: <20220409045043.23593-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Sanitize the calling conventions and use a goto label to cleanup the
code flow.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 68 +++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 02030c9c4d3b1..40bb0b356a6d6 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1204,38 +1204,42 @@ static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
 }
 
 static void decide_on_discard_support(struct drbd_device *device,
-			struct request_queue *q,
-			struct request_queue *b,
-			bool discard_zeroes_if_aligned)
+		struct drbd_backing_dev *bdev)
 {
-	/* q = drbd device queue (device->rq_queue)
-	 * b = backing device queue (device->ldev->backing_bdev->bd_disk->queue),
-	 *     or NULL if diskless
-	 */
-	struct drbd_connection *connection = first_peer_device(device)->connection;
-	bool can_do = b ? blk_queue_discard(b) : true;
-
-	if (can_do && connection->cstate >= C_CONNECTED && !(connection->agreed_features & DRBD_FF_TRIM)) {
-		can_do = false;
-		drbd_info(connection, "peer DRBD too old, does not support TRIM: disabling discards\n");
-	}
-	if (can_do) {
-		/* We don't care for the granularity, really.
-		 * Stacking limits below should fix it for the local
-		 * device.  Whether or not it is a suitable granularity
-		 * on the remote device is not our problem, really. If
-		 * you care, you need to use devices with similar
-		 * topology on all peers. */
-		blk_queue_discard_granularity(q, 512);
-		q->limits.max_discard_sectors = drbd_max_discard_sectors(connection);
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
-		q->limits.max_write_zeroes_sectors = drbd_max_discard_sectors(connection);
-	} else {
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
-		blk_queue_discard_granularity(q, 0);
-		q->limits.max_discard_sectors = 0;
-		q->limits.max_write_zeroes_sectors = 0;
+	struct drbd_connection *connection =
+		first_peer_device(device)->connection;
+	struct request_queue *q = device->rq_queue;
+
+	if (bdev && !blk_queue_discard(bdev->backing_bdev->bd_disk->queue))
+		goto not_supported;
+
+	if (connection->cstate >= C_CONNECTED &&
+	    !(connection->agreed_features & DRBD_FF_TRIM)) {
+		drbd_info(connection,
+			"peer DRBD too old, does not support TRIM: disabling discards\n");
+		goto not_supported;
 	}
+
+	/*
+	 * We don't care for the granularity, really.
+	 *
+	 * Stacking limits below should fix it for the local device.  Whether or
+	 * not it is a suitable granularity on the remote device is not our
+	 * problem, really. If you care, you need to use devices with similar
+	 * topology on all peers.
+	 */
+	blk_queue_discard_granularity(q, 512);
+	q->limits.max_discard_sectors = drbd_max_discard_sectors(connection);
+	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
+	q->limits.max_write_zeroes_sectors =
+		drbd_max_discard_sectors(connection);
+	return;
+
+not_supported:
+	blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
+	blk_queue_discard_granularity(q, 0);
+	q->limits.max_discard_sectors = 0;
+	q->limits.max_write_zeroes_sectors = 0;
 }
 
 static void fixup_discard_if_not_supported(struct request_queue *q)
@@ -1273,7 +1277,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	unsigned int max_segments = 0;
 	struct request_queue *b = NULL;
 	struct disk_conf *dc;
-	bool discard_zeroes_if_aligned = true;
 
 	if (bdev) {
 		b = bdev->backing_bdev->bd_disk->queue;
@@ -1282,7 +1285,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 		rcu_read_lock();
 		dc = rcu_dereference(device->ldev->disk_conf);
 		max_segments = dc->max_bio_bvecs;
-		discard_zeroes_if_aligned = dc->discard_zeroes_if_aligned;
 		rcu_read_unlock();
 
 		blk_set_stacking_limits(&q->limits);
@@ -1292,7 +1294,7 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	/* This is the workaround for "bio would need to, but cannot, be split" */
 	blk_queue_max_segments(q, max_segments ? max_segments : BLK_MAX_SEGMENTS);
 	blk_queue_segment_boundary(q, PAGE_SIZE-1);
-	decide_on_discard_support(device, q, b, discard_zeroes_if_aligned);
+	decide_on_discard_support(device, bdev);
 
 	if (b) {
 		blk_stack_limits(&q->limits, &b->limits, 0);
-- 
2.30.2


