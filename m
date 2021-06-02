Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB983981AE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135481.251681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmB-0008Gv-Sw; Wed, 02 Jun 2021 06:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135481.251681; Wed, 02 Jun 2021 06:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmB-0008EP-Nh; Wed, 02 Jun 2021 06:54:51 +0000
Received: by outflank-mailman (input) for mailman id 135481;
 Wed, 02 Jun 2021 06:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKmB-0007A2-31
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:54:51 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e58446d6-9e03-4f7a-a64f-71458a14aaab;
 Wed, 02 Jun 2021 06:54:36 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlW-0025KS-9M; Wed, 02 Jun 2021 06:54:10 +0000
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
X-Inumbo-ID: e58446d6-9e03-4f7a-a64f-71458a14aaab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9pvQ9WWixoN79V+IFrwZ0yGtfnJdYnRvQElOajEUx4E=; b=gnk1MFf6oC2iDvM0lQExGF55IT
	Fu4WEOCNNJ9mVEtVcIDrtrwvLS92XEx/Y9jJNPlMZzP3mxVH717a4VCLxOLSslRLKspq6OAA9D5yw
	EQDkVL09aPuAvCsSUDM3ZFzSxHOeCU6gBkEfhYQCCehrU9uW68j9GkCyo7Ds0V43zhcXAh05TNWGS
	LhXZW/q9HT26Y7QKqOeqywIxRBtkOI49AYNNeXwG3akyX15CxDIe0h/fq/1eJkZhMao+G/fiRrulm
	dyrb+u0WyEaL8vr4wMg0Ys8BKcowBJnF+Zn2V2osWkSUWM27u+JhH6YkPr+2yh9LuvxLx7wgsnTfO
	l9Bduvjw==;
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
Subject: [PATCH 04/30] virtio-blk: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:19 +0300
Message-Id: <20210602065345.355274-5-hch@lst.de>
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
 drivers/block/virtio_blk.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index b9fa3ef5b57c..e4bd3b1fc3c2 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -749,13 +749,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vblk;
 
-	/* FIXME: How many partitions?  How long is a piece of string? */
-	vblk->disk = alloc_disk(1 << PART_BITS);
-	if (!vblk->disk) {
-		err = -ENOMEM;
-		goto out_free_vq;
-	}
-
 	/* Default queue sizing is to fill the ring. */
 	if (likely(!virtblk_queue_depth)) {
 		queue_depth = vblk->vqs[0].vq->num_free;
@@ -779,21 +772,20 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 	err = blk_mq_alloc_tag_set(&vblk->tag_set);
 	if (err)
-		goto out_put_disk;
+		goto out_free_vq;
 
-	q = blk_mq_init_queue(&vblk->tag_set);
-	if (IS_ERR(q)) {
-		err = -ENOMEM;
+	vblk->disk = blk_mq_alloc_disk(&vblk->tag_set, vblk);
+	if (IS_ERR(vblk->disk)) {
+		err = PTR_ERR(vblk->disk);
 		goto out_free_tags;
 	}
-	vblk->disk->queue = q;
-
-	q->queuedata = vblk;
+	q = vblk->disk->queue;
 
 	virtblk_name_format("vd", index, vblk->disk->disk_name, DISK_NAME_LEN);
 
 	vblk->disk->major = major;
 	vblk->disk->first_minor = index_to_minor(index);
+	vblk->disk->minors = 1 << PART_BITS;
 	vblk->disk->private_data = vblk;
 	vblk->disk->fops = &virtblk_fops;
 	vblk->disk->flags |= GENHD_FL_EXT_DEVT;
@@ -892,8 +884,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
-out_put_disk:
-	put_disk(vblk->disk);
 out_free_vq:
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
@@ -913,8 +903,7 @@ static void virtblk_remove(struct virtio_device *vdev)
 	flush_work(&vblk->config_work);
 
 	del_gendisk(vblk->disk);
-	blk_cleanup_queue(vblk->disk->queue);
-
+	blk_cleanup_disk(vblk->disk);
 	blk_mq_free_tag_set(&vblk->tag_set);
 
 	mutex_lock(&vblk->vdev_mutex);
@@ -925,7 +914,6 @@ static void virtblk_remove(struct virtio_device *vdev)
 	/* Virtqueues are stopped, nothing can use vblk->vdev anymore. */
 	vblk->vdev = NULL;
 
-	put_disk(vblk->disk);
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
 
-- 
2.30.2


