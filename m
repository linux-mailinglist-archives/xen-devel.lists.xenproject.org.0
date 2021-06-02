Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751243981B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135484.251693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmH-0000PS-6F; Wed, 02 Jun 2021 06:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135484.251693; Wed, 02 Jun 2021 06:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmH-0000MQ-1B; Wed, 02 Jun 2021 06:54:57 +0000
Received: by outflank-mailman (input) for mailman id 135484;
 Wed, 02 Jun 2021 06:54:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKmG-0007A2-3B
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:54:56 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05503f4d-4956-49b5-9394-c00d370a3ba3;
 Wed, 02 Jun 2021 06:54:36 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlS-0025JJ-Ew; Wed, 02 Jun 2021 06:54:07 +0000
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
X-Inumbo-ID: 05503f4d-4956-49b5-9394-c00d370a3ba3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Yi0gWgny8DlRPvb2CPLj2qpffFrZ3FaoaK+2w2W5Ero=; b=Ht4009yUCSzO+7+WkZSpPv8/pg
	DF4TuO/V/1LnprDJA3jlEhqFaXKBH7nFqyPlLMER9C4xGoA29+zO97djThq/H5WGD+qvf9L+NXUS+
	NF+wjIhh/npg/q4yZwzJ2XU8Rh/TBSfn+u/dM7E/U9YdPLNk9qDr3C//ieS4lZI5LRisQPRidcs0K
	1KxMYlyEV+r/yTnMeO4E9D5sjO0i2VDyXsAV0BqYgFAku1jAbz09LqX7rvILnxpnxFg/tBckuBSOC
	E+KSpkcLJ/UGUgdvZ89eU6BxLq+pC8HlqDRtF4O6vNTYENtcydGYMepxD+bizsH8Il7O6KAzLt54A
	NMGPi+1w==;
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
Subject: [PATCH 03/30] blk-mq: add the blk_mq_alloc_disk APIs
Date: Wed,  2 Jun 2021 09:53:18 +0300
Message-Id: <20210602065345.355274-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add a new API to allocate a gendisk including the request_queue for use
with blk-mq based drivers.  This is to avoid boilerplate code in drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 19 +++++++++++++++++++
 include/linux/blk-mq.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 6112741e1ff9..1e6036e6fd66 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3137,6 +3137,25 @@ struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *set)
 }
 EXPORT_SYMBOL(blk_mq_init_queue);
 
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set, void *queuedata)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	q = blk_mq_init_queue_data(set, queuedata);
+	if (IS_ERR(q))
+		return ERR_CAST(q);
+
+	disk = __alloc_disk_node(0, set->numa_node);
+	if (!disk) {
+		blk_cleanup_queue(q);
+		return ERR_PTR(-ENOMEM);
+	}
+	disk->queue = q;
+	return disk;
+}
+EXPORT_SYMBOL(__blk_mq_alloc_disk);
+
 /*
  * Helper for setting up a queue with mq ops, given queue depth, and
  * the passed in mq ops flags.
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 73750b2838d2..f496c6c5b5d2 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -426,6 +426,18 @@ enum {
 	((policy & ((1 << BLK_MQ_F_ALLOC_POLICY_BITS) - 1)) \
 		<< BLK_MQ_F_ALLOC_POLICY_START_BIT)
 
+#define blk_mq_alloc_disk(set, queuedata)				\
+({									\
+	static struct lock_class_key __key;				\
+	struct gendisk *__disk = __blk_mq_alloc_disk(set, queuedata);	\
+									\
+	if (__disk)							\
+		lockdep_init_map(&__disk->lockdep_map,			\
+			"(bio completion)", &__key, 0);			\
+	__disk;								\
+})
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set,
+		void *queuedata);
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
-- 
2.30.2


