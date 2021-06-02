Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31273981A4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135478.251670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKm7-0007un-Id; Wed, 02 Jun 2021 06:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135478.251670; Wed, 02 Jun 2021 06:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKm7-0007qz-Eg; Wed, 02 Jun 2021 06:54:47 +0000
Received: by outflank-mailman (input) for mailman id 135478;
 Wed, 02 Jun 2021 06:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKm6-0007A2-2o
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:54:46 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14b895fd-ad3b-4db4-8bd1-36518816df4c;
 Wed, 02 Jun 2021 06:54:33 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlG-0025Fb-J7; Wed, 02 Jun 2021 06:53:55 +0000
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
X-Inumbo-ID: 14b895fd-ad3b-4db4-8bd1-36518816df4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SnRF2RasuO3TzWzCcWD7psRmahwH4O2DjzNGyzgJCxM=; b=RfiXqx1buYxjqGM6Ru6s2uXbtK
	szP8Lp35KdwoBLpRViL7iCBQHBOTXZ4Qu5LJOvN43OaaHCTJwbYuBSl2SqXNEe3Ty441iVm62zV/q
	FK7bqtRTYnR/sNzxWhxA2AWxTTSYR0R47li/OgrbNqJ/z/C247XNi+vyVCBUJz2HWLNRhHDg9jROf
	W37wVhanz0woIFa4DI1Hiypd6xGuMEzMDW+t6oSvgQDur5ioE4KQTAUXWM04CshX1rW4l4k5bAsYt
	fMWsLaqDTkxSQegnpPyUc9dgQ8DJelIKHSJsddjUREuKapJzcCJM+AP8gSr/w6bRFlEnBsoDVPXvd
	WWIbvGOQ==;
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
Subject: [PATCH 01/30] blk-mq: factor out a blk_mq_alloc_sq_tag_set helper
Date: Wed,  2 Jun 2021 09:53:16 +0300
Message-Id: <20210602065345.355274-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Factour out a helper to initialize a simple single hw queue tag_set from
blk_mq_init_sq_queue.  This will allow to phase out blk_mq_init_sq_queue
in favor of a more symmetric and general API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 32 ++++++++++++++++++--------------
 include/linux/blk-mq.h |  3 +++
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index f11d4018ce2e..eaacfa963a73 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3152,24 +3152,12 @@ struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
 	struct request_queue *q;
 	int ret;
 
-	memset(set, 0, sizeof(*set));
-	set->ops = ops;
-	set->nr_hw_queues = 1;
-	set->nr_maps = 1;
-	set->queue_depth = queue_depth;
-	set->numa_node = NUMA_NO_NODE;
-	set->flags = set_flags;
-
-	ret = blk_mq_alloc_tag_set(set);
+	ret = blk_mq_alloc_sq_tag_set(set, ops, queue_depth, set_flags);
 	if (ret)
 		return ERR_PTR(ret);
-
 	q = blk_mq_init_queue(set);
-	if (IS_ERR(q)) {
+	if (IS_ERR(q))
 		blk_mq_free_tag_set(set);
-		return q;
-	}
-
 	return q;
 }
 EXPORT_SYMBOL(blk_mq_init_sq_queue);
@@ -3589,6 +3577,22 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 }
 EXPORT_SYMBOL(blk_mq_alloc_tag_set);
 
+/* allocate and initialize a tagset for a simple single-queue device */
+int blk_mq_alloc_sq_tag_set(struct blk_mq_tag_set *set,
+		const struct blk_mq_ops *ops, unsigned int queue_depth,
+		unsigned int set_flags)
+{
+	memset(set, 0, sizeof(*set));
+	set->ops = ops;
+	set->nr_hw_queues = 1;
+	set->nr_maps = 1;
+	set->queue_depth = queue_depth;
+	set->numa_node = NUMA_NO_NODE;
+	set->flags = set_flags;
+	return blk_mq_alloc_tag_set(set);
+}
+EXPORT_SYMBOL_GPL(blk_mq_alloc_sq_tag_set);
+
 void blk_mq_free_tag_set(struct blk_mq_tag_set *set)
 {
 	int i, j;
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 359486940fa0..bb950fc669ef 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -439,6 +439,9 @@ struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
 void blk_mq_unregister_dev(struct device *, struct request_queue *);
 
 int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set);
+int blk_mq_alloc_sq_tag_set(struct blk_mq_tag_set *set,
+		const struct blk_mq_ops *ops, unsigned int queue_depth,
+		unsigned int set_flags);
 void blk_mq_free_tag_set(struct blk_mq_tag_set *set);
 
 void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule);
-- 
2.30.2


