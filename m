Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99A39827E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135547.251846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuY-0000wZ-DM; Wed, 02 Jun 2021 07:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135547.251846; Wed, 02 Jun 2021 07:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuY-0000tx-81; Wed, 02 Jun 2021 07:03:30 +0000
Received: by outflank-mailman (input) for mailman id 135547;
 Wed, 02 Jun 2021 07:03:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKni-0007A2-6Y
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:56:26 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35fb7b1f-44c7-4b27-ad45-0306383e6a1a;
 Wed, 02 Jun 2021 06:55:16 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmD-0025eq-Jk; Wed, 02 Jun 2021 06:54:54 +0000
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
X-Inumbo-ID: 35fb7b1f-44c7-4b27-ad45-0306383e6a1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pV41u4G0u0xaNGxoxDb/eyNeH9eLbF/Aei3AXX+HWdY=; b=xynVkbApPKJ1V6SCFnDhqzTRhk
	HG0wUR2lljnrg8jjaBi3fB5wReJl4j8YP38RFTuxGHRPiXc3MvRjlT3pljHnX0XyyZXySOVGvD36r
	Yn+kDsgqGIGCgFW7UzE2sDUrTXFZpZSvReujYSqg/GDnk+jMrGw/l7eQr8EmpYPtyi2dlKoDQZniQ
	A295rgd6IcGuhT/qNWGyPQm803gvicBX9TIVBVODY+wwREKWrX67HS+VcQ/s9Gl/7xUWi6bQoGvGi
	xaTI/gKDuismLjMiDlvwEAfqkBTMh3FXwJk3/FqJCq/s8UQ5jthfbUwng9lkO26oujqiNf9SJQcbE
	JqveapQg==;
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
Subject: [PATCH 13/30] sunvdc: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:28 +0300
Message-Id: <20210602065345.355274-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sunvdc.c | 47 ++++++++++++------------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 39aeebc6837d..c53b38578bb7 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -780,27 +780,6 @@ static const struct blk_mq_ops vdc_mq_ops = {
 	.queue_rq	= vdc_queue_rq,
 };
 
-static void cleanup_queue(struct request_queue *q)
-{
-	struct vdc_port *port = q->queuedata;
-
-	blk_cleanup_queue(q);
-	blk_mq_free_tag_set(&port->tag_set);
-}
-
-static struct request_queue *init_queue(struct vdc_port *port)
-{
-	struct request_queue *q;
-
-	q = blk_mq_init_sq_queue(&port->tag_set, &vdc_mq_ops, VDC_TX_RING_SIZE,
-					BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(q))
-		return q;
-
-	q->queuedata = port;
-	return q;
-}
-
 static int probe_disk(struct vdc_port *port)
 {
 	struct request_queue *q;
@@ -838,21 +817,21 @@ static int probe_disk(struct vdc_port *port)
 				    (u64)geom.num_sec);
 	}
 
-	q = init_queue(port);
-	if (IS_ERR(q)) {
-		printk(KERN_ERR PFX "%s: Could not allocate queue.\n",
-		       port->vio.name);
-		return PTR_ERR(q);
-	}
-	g = alloc_disk(1 << PARTITION_SHIFT);
-	if (!g) {
+	err = blk_mq_alloc_sq_tag_set(&port->tag_set, &vdc_mq_ops,
+			VDC_TX_RING_SIZE, BLK_MQ_F_SHOULD_MERGE);
+	if (err)
+		return err;
+
+	g = blk_mq_alloc_disk(&port->tag_set, port);
+	if (IS_ERR(g)) {
 		printk(KERN_ERR PFX "%s: Could not allocate gendisk.\n",
 		       port->vio.name);
-		cleanup_queue(q);
-		return -ENOMEM;
+		blk_mq_free_tag_set(&port->tag_set);
+		return PTR_ERR(g);
 	}
 
 	port->disk = g;
+	q = g->queue;
 
 	/* Each segment in a request is up to an aligned page in size. */
 	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
@@ -862,6 +841,7 @@ static int probe_disk(struct vdc_port *port)
 	blk_queue_max_hw_sectors(q, port->max_xfer_size);
 	g->major = vdc_major;
 	g->first_minor = port->vio.vdev->dev_no << PARTITION_SHIFT;
+	g->minors = 1 << PARTITION_SHIFT;
 	strcpy(g->disk_name, port->disk_name);
 
 	g->fops = &vdc_fops;
@@ -1083,9 +1063,8 @@ static int vdc_port_remove(struct vio_dev *vdev)
 		del_timer_sync(&port->vio.timer);
 
 		del_gendisk(port->disk);
-		cleanup_queue(port->disk->queue);
-		put_disk(port->disk);
-		port->disk = NULL;
+		blk_cleanup_disk(port->disk);
+		blk_mq_free_tag_set(&port->tag_set);
 
 		vdc_free_tx_ring(port);
 		vio_ldc_free(&port->vio);
-- 
2.30.2


