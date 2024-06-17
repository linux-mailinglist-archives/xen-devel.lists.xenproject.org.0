Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A07790A3F6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741651.1148318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wg-0006TS-0a; Mon, 17 Jun 2024 06:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741651.1148318; Mon, 17 Jun 2024 06:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wf-0006Hp-NY; Mon, 17 Jun 2024 06:07:33 +0000
Received: by outflank-mailman (input) for mailman id 741651;
 Mon, 17 Jun 2024 06:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5Ve-0001Pt-Rh
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:06:30 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc67f9ad-2c6f-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:06:29 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5VJ-00000009IaG-2UjF; Mon, 17 Jun 2024 06:06:10 +0000
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
X-Inumbo-ID: bc67f9ad-2c6f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sVPSgMGllCuuf3AHxeXTZ5uQtffNoK6cimLoRUqfpII=; b=VioNQoDuEPZXCsKlMJ8bqEiq0T
	kRBW+7G7WzsxTJ4OBci76q6USGBDDQiOfibYrttMiSM6xgfALh4eJYkdqxFkKpa0fvjzH6PCnCyq+
	ZKJWcyQ559x7OvgyNRyO76m6ErDBT2VgUaabGfSLSwYnZibkII3KKAqxNLZYVz1hAY37asOxO9J3I
	O0+z/zCRcV2GKzvDH6kzspoBq8lHRUzFkF2FhVrUNIE0TFqG5TiD/1VJMeLWPvEK26w6rEkb+t/4R
	Peq6bWwz+eDuzNivW/LlWb9gU264Y0QgY5uwQWqqOfawz68inb+qcMNDkfGNqakoL9YeDx9VdO556
	pwRWtwmA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 12/26] block: remove blk_flush_policy
Date: Mon, 17 Jun 2024 08:04:39 +0200
Message-ID: <20240617060532.127975-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Fold blk_flush_policy into the only caller to prepare for pending changes
to it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/blk-flush.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index c17cf8ed8113db..2234f8b3fc05f2 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -100,23 +100,6 @@ blk_get_flush_queue(struct request_queue *q, struct blk_mq_ctx *ctx)
 	return blk_mq_map_queue(q, REQ_OP_FLUSH, ctx)->fq;
 }
 
-static unsigned int blk_flush_policy(unsigned long fflags, struct request *rq)
-{
-	unsigned int policy = 0;
-
-	if (blk_rq_sectors(rq))
-		policy |= REQ_FSEQ_DATA;
-
-	if (fflags & (1UL << QUEUE_FLAG_WC)) {
-		if (rq->cmd_flags & REQ_PREFLUSH)
-			policy |= REQ_FSEQ_PREFLUSH;
-		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
-		    (rq->cmd_flags & REQ_FUA))
-			policy |= REQ_FSEQ_POSTFLUSH;
-	}
-	return policy;
-}
-
 static unsigned int blk_flush_cur_seq(struct request *rq)
 {
 	return 1 << ffz(rq->flush.seq);
@@ -399,12 +382,26 @@ bool blk_insert_flush(struct request *rq)
 {
 	struct request_queue *q = rq->q;
 	unsigned long fflags = q->queue_flags;	/* may change, cache */
-	unsigned int policy = blk_flush_policy(fflags, rq);
 	struct blk_flush_queue *fq = blk_get_flush_queue(q, rq->mq_ctx);
+	unsigned int policy = 0;
 
 	/* FLUSH/FUA request must never be merged */
 	WARN_ON_ONCE(rq->bio != rq->biotail);
 
+	if (blk_rq_sectors(rq))
+		policy |= REQ_FSEQ_DATA;
+
+	/*
+	 * Check which flushes we need to sequence for this operation.
+	 */
+	if (fflags & (1UL << QUEUE_FLAG_WC)) {
+		if (rq->cmd_flags & REQ_PREFLUSH)
+			policy |= REQ_FSEQ_PREFLUSH;
+		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
+		    (rq->cmd_flags & REQ_FUA))
+			policy |= REQ_FSEQ_POSTFLUSH;
+	}
+
 	/*
 	 * @policy now records what operations need to be done.  Adjust
 	 * REQ_PREFLUSH and FUA for the driver.
-- 
2.43.0


