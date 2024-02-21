Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9C85D88C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684016.1063681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBk-0008PX-9L; Wed, 21 Feb 2024 12:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684016.1063681; Wed, 21 Feb 2024 12:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBk-0008Lv-5b; Wed, 21 Feb 2024 12:59:04 +0000
Received: by outflank-mailman (input) for mailman id 684016;
 Wed, 21 Feb 2024 12:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCxi=J6=bombadil.srs.infradead.org=BATV+bafd7931fd2c4139f05c+7486+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcmBi-00082S-Fl
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:59:02 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbb219fa-d0b8-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 13:59:02 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcmBf-00000000wFJ-0P7d; Wed, 21 Feb 2024 12:58:59 +0000
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
X-Inumbo-ID: fbb219fa-d0b8-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=2bzGn47cjUdgN+x/FL0i0dqH9SVUpthf30bI0lT03/8=; b=XeCr1flD8EXP6yvVh2cqn3wx1r
	cpqVTcboC5Q7w6b9DjTaqoQQVy2vjQ3SsPPdLq6P1FpHNVzOqrR4WOj9+RIbWgwbJKzs9DjwHhOog
	dR8jo0Q5bmgAuH/eqJD6sZYXkafMp8LYbF7U8VtO/5NwXtQymU6GqHIouoYxytvNIFpYv7NbtKiH/
	ScPvL4Yn1BCrYfXn4CYGc2DDSZf8IlB4rASU66L3wde0FZtfA7WCGheu9dnmYxoO6q5v+cAFUJPkJ
	o5LWzv45IGz7c9Asx7N53BismN8ObaC/zgUuaCaBFQXvIdGE5FzHNdGJCLSNr3ISXDED+Hi0HZoZL
	jE5LCtYQ==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 3/4] xen-blkfront: don't redundantly set max_sements in blkif_recover
Date: Wed, 21 Feb 2024 13:58:44 +0100
Message-Id: <20240221125845.3610668-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

blkif_set_queue_limits already sets the max_sements limits, so don't do
it a second time.  Also remove a comment about a long fixe bug in
blk_mq_update_nr_hw_queues.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkfront.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 1258f24b285500..7664638a0abbfa 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2008,14 +2008,10 @@ static int blkif_recover(struct blkfront_info *info)
 	struct request *req, *n;
 	int rc;
 	struct bio *bio;
-	unsigned int segs;
 	struct blkfront_ring_info *rinfo;
 
 	blkfront_gather_backend_features(info);
-	/* Reset limits changed by blk_mq_update_nr_hw_queues(). */
 	blkif_set_queue_limits(info);
-	segs = info->max_indirect_segments ? : BLKIF_MAX_SEGMENTS_PER_REQUEST;
-	blk_queue_max_segments(info->rq, segs / GRANTS_PER_PSEG);
 
 	for_each_rinfo(info, rinfo, r_index) {
 		rc = blkfront_setup_indirect(rinfo);
@@ -2035,7 +2031,9 @@ static int blkif_recover(struct blkfront_info *info)
 	list_for_each_entry_safe(req, n, &info->requests, queuelist) {
 		/* Requeue pending requests (flush or discard) */
 		list_del_init(&req->queuelist);
-		BUG_ON(req->nr_phys_segments > segs);
+		BUG_ON(req->nr_phys_segments >
+		       (info->max_indirect_segments ? :
+			BLKIF_MAX_SEGMENTS_PER_REQUEST));
 		blk_mq_requeue_request(req, false);
 	}
 	blk_mq_start_stopped_hw_queues(info->rq, true);
-- 
2.39.2


