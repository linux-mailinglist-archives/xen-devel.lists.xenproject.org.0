Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17539828C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135605.251985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKv3-00080p-AO; Wed, 02 Jun 2021 07:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135605.251985; Wed, 02 Jun 2021 07:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKv2-0007pR-Fd; Wed, 02 Jun 2021 07:04:00 +0000
Received: by outflank-mailman (input) for mailman id 135605;
 Wed, 02 Jun 2021 07:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKoq-0007A2-9L
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:57:36 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 413141d6-a989-469e-92fd-fbc443d5b624;
 Wed, 02 Jun 2021 06:55:45 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKme-0025w6-S0; Wed, 02 Jun 2021 06:55:21 +0000
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
X-Inumbo-ID: 413141d6-a989-469e-92fd-fbc443d5b624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+VW3u/9XCdDTbtqEZvujMXwGJbXBwfM20yjCH8e5d3E=; b=GwQP6IERGYi9h/w11aM5Gv7Bak
	KwC96m3PPXGkoyZYwi/kNvLQSakOJo8KyQC+PaSGnzJZtxZtj+EAf1YdIWxyGh1h3/ItGALtuAyht
	Zb0UCagxGAtcH3yWBInWzJjMPdgOtlr0aVxDJradU0LlW4CU0UoZ9uFlxXZ9MaFs9QpR6rJJqNKpM
	Lp+TbCyqXP0eixAsJNjUJ38MR0l0b3AJnHt9CihDHSmpFaOitPKX0HSMzdaVcLJGEB+8v4t2ImMr4
	1mz3v9UKvRtkqRqwAqZX0MDPtIqhunVVCv1zjkY4f5TbIaxRb9R62pOguo/krhQJ2ETMPxpLnqyY0
	E1fIMYVA==;
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
Subject: [PATCH 19/30] nbd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:34 +0300
Message-Id: <20210602065345.355274-20-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 53 ++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 45d2c28c8fc8..614d82e7fae4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -219,15 +219,11 @@ static const struct device_attribute pid_attr = {
 static void nbd_dev_remove(struct nbd_device *nbd)
 {
 	struct gendisk *disk = nbd->disk;
-	struct request_queue *q;
 
 	if (disk) {
-		q = disk->queue;
 		del_gendisk(disk);
-		blk_cleanup_queue(q);
 		blk_mq_free_tag_set(&nbd->tag_set);
-		disk->private_data = NULL;
-		put_disk(disk);
+		blk_cleanup_disk(disk);
 	}
 
 	/*
@@ -1646,15 +1642,24 @@ static int nbd_dev_add(int index)
 {
 	struct nbd_device *nbd;
 	struct gendisk *disk;
-	struct request_queue *q;
 	int err = -ENOMEM;
 
 	nbd = kzalloc(sizeof(struct nbd_device), GFP_KERNEL);
 	if (!nbd)
 		goto out;
 
-	disk = alloc_disk(1 << part_shift);
-	if (!disk)
+	nbd->tag_set.ops = &nbd_mq_ops;
+	nbd->tag_set.nr_hw_queues = 1;
+	nbd->tag_set.queue_depth = 128;
+	nbd->tag_set.numa_node = NUMA_NO_NODE;
+	nbd->tag_set.cmd_size = sizeof(struct nbd_cmd);
+	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
+		BLK_MQ_F_BLOCKING;
+	nbd->tag_set.driver_data = nbd;
+	nbd->destroy_complete = NULL;
+
+	err = blk_mq_alloc_tag_set(&nbd->tag_set);
+	if (err)
 		goto out_free_nbd;
 
 	if (index >= 0) {
@@ -1668,30 +1673,15 @@ static int nbd_dev_add(int index)
 			index = err;
 	}
 	if (err < 0)
-		goto out_free_disk;
-
+		goto out_free_tags;
 	nbd->index = index;
-	nbd->disk = disk;
-	nbd->tag_set.ops = &nbd_mq_ops;
-	nbd->tag_set.nr_hw_queues = 1;
-	nbd->tag_set.queue_depth = 128;
-	nbd->tag_set.numa_node = NUMA_NO_NODE;
-	nbd->tag_set.cmd_size = sizeof(struct nbd_cmd);
-	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
-		BLK_MQ_F_BLOCKING;
-	nbd->tag_set.driver_data = nbd;
-	nbd->destroy_complete = NULL;
 
-	err = blk_mq_alloc_tag_set(&nbd->tag_set);
-	if (err)
+	disk = blk_mq_alloc_disk(&nbd->tag_set, NULL);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_free_idr;
-
-	q = blk_mq_init_queue(&nbd->tag_set);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
-		goto out_free_tags;
 	}
-	disk->queue = q;
+	nbd->disk = disk;
 
 	/*
 	 * Tell the block layer that we are not a rotational device
@@ -1712,6 +1702,7 @@ static int nbd_dev_add(int index)
 	INIT_LIST_HEAD(&nbd->list);
 	disk->major = NBD_MAJOR;
 	disk->first_minor = index << part_shift;
+	disk->minors = 1 << part_shift;
 	disk->fops = &nbd_fops;
 	disk->private_data = nbd;
 	sprintf(disk->disk_name, "nbd%d", index);
@@ -1719,12 +1710,10 @@ static int nbd_dev_add(int index)
 	nbd_total_devices++;
 	return index;
 
-out_free_tags:
-	blk_mq_free_tag_set(&nbd->tag_set);
 out_free_idr:
 	idr_remove(&nbd_index_idr, index);
-out_free_disk:
-	put_disk(disk);
+out_free_tags:
+	blk_mq_free_tag_set(&nbd->tag_set);
 out_free_nbd:
 	kfree(nbd);
 out:
-- 
2.30.2


