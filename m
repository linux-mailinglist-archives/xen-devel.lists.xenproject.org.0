Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD496398288
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135576.251939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKup-0004zE-Q9; Wed, 02 Jun 2021 07:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135576.251939; Wed, 02 Jun 2021 07:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKup-0004nB-3W; Wed, 02 Jun 2021 07:03:47 +0000
Received: by outflank-mailman (input) for mailman id 135576;
 Wed, 02 Jun 2021 07:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKnx-0007A2-72
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:56:41 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebf16284-33f8-491e-b768-0337c5832b7c;
 Wed, 02 Jun 2021 06:55:24 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmM-0025j3-HR; Wed, 02 Jun 2021 06:55:03 +0000
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
X-Inumbo-ID: ebf16284-33f8-491e-b768-0337c5832b7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yxB3CToEvB1AGII3Fhuj66pLyS4oXdc/Ax4ufYJhDmU=; b=2Ev1PQ3iAXTcAu7Nm/w91IlhBi
	XlySTC28St0acrPx9XgYMlbiWgHgwnXpAO7fssa+3RO6s6w1gNt/L0bRJxPAncGQ3wVJ/bZBHhsGL
	uVoo++YnZjLmVwV7/fA+A/a3WTVeZ7Iox3GoTmd7i9BvdmfF+QzgThe8cp3OM151RtbpSjuGYv1qk
	Z49auwfLnjtdi4znRE+V/2lHNnnW9JmtU9bmCTyqdsOZLGP/YzUu+pzLr8O4OJgs++QcKu78dpSPH
	xBu4qqzNSfKG6LxxIT8EjfGs2NvFuwBi/8BGzrjd39Z06zSSm1tbNqLwSjr7IrytRt6ttKelR32cD
	obDFH8eg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 15/30] blk-mq: remove blk_mq_init_sq_queue
Date: Wed,  2 Jun 2021 09:53:30 +0300
Message-Id: <20210602065345.355274-16-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

All users are gone now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 22 ----------------------
 include/linux/blk-mq.h |  4 ----
 2 files changed, 26 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 1e6036e6fd66..25e25177c2b1 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3156,28 +3156,6 @@ struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set, void *queuedata)
 }
 EXPORT_SYMBOL(__blk_mq_alloc_disk);
 
-/*
- * Helper for setting up a queue with mq ops, given queue depth, and
- * the passed in mq ops flags.
- */
-struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
-					   const struct blk_mq_ops *ops,
-					   unsigned int queue_depth,
-					   unsigned int set_flags)
-{
-	struct request_queue *q;
-	int ret;
-
-	ret = blk_mq_alloc_sq_tag_set(set, ops, queue_depth, set_flags);
-	if (ret)
-		return ERR_PTR(ret);
-	q = blk_mq_init_queue(set);
-	if (IS_ERR(q))
-		blk_mq_free_tag_set(set);
-	return q;
-}
-EXPORT_SYMBOL(blk_mq_init_sq_queue);
-
 static struct blk_mq_hw_ctx *blk_mq_alloc_and_init_hctx(
 		struct blk_mq_tag_set *set, struct request_queue *q,
 		int hctx_idx, int node)
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index f496c6c5b5d2..02a4aab0aeac 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -443,10 +443,6 @@ struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
 int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 		struct request_queue *q);
-struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
-						const struct blk_mq_ops *ops,
-						unsigned int queue_depth,
-						unsigned int set_flags);
 void blk_mq_unregister_dev(struct device *, struct request_queue *);
 
 int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set);
-- 
2.30.2


