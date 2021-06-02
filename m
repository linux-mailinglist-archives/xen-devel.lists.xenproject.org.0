Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F9398277
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135522.251758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuE-0005zI-J8; Wed, 02 Jun 2021 07:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135522.251758; Wed, 02 Jun 2021 07:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuE-0005wR-FX; Wed, 02 Jun 2021 07:03:10 +0000
Received: by outflank-mailman (input) for mailman id 135522;
 Wed, 02 Jun 2021 07:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKnJ-0007A2-5p
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:56:01 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00870660-fed7-4b75-a701-c131b2982eeb;
 Wed, 02 Jun 2021 06:55:09 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKm6-0025Ys-7i; Wed, 02 Jun 2021 06:54:47 +0000
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
X-Inumbo-ID: 00870660-fed7-4b75-a701-c131b2982eeb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qi7AU80Oz7hj4K5BUy3Hu3UJMfMiprlsOMq1LlDbVww=; b=wfnn0CGP9teCIUigpA0cLAiCEG
	XaYeXRoQvQOrEfJFcuxKu18rxlCj9kAVnqYvA6ffbosWHxomIXQsSArr+ftwbguMp5SU3M9/bmk0L
	bqzQ8XiTRZ6QBfzP4K/UHsKW47GVQnDBFuGf6p23+3crdLQ2ThNz4kvRi6KgNmbzK/nin+yjIgWxz
	6kQGuIL3DvYz9Jv29HP0rZaCMuA/qvMMWQpgEREhwRn38bXZiX53OXpalBkps4hZhmquoC2R0dNpO
	luUD0oRku7pr6gfgS8FYvxXuSkXea92js4/YEKQkinqriGTLqiSIzKawm91/GTGJJNVz/av0Gu21E
	TAsHH4GQ==;
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
Subject: [PATCH 11/30] swim3: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:26 +0300
Message-Id: <20210602065345.355274-12-hch@lst.de>
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
 drivers/block/swim3.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index a515d0c1d2cb..965af0a3e95b 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1202,30 +1202,27 @@ static int swim3_attach(struct macio_dev *mdev,
 			return rc;
 	}
 
-	disk = alloc_disk(1);
-	if (disk == NULL) {
-		rc = -ENOMEM;
-		goto out_unregister;
-	}
-
 	fs = &floppy_states[floppy_count];
 	memset(fs, 0, sizeof(*fs));
 
-	disk->queue = blk_mq_init_sq_queue(&fs->tag_set, &swim3_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(disk->queue)) {
-		rc = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		goto out_put_disk;
+	rc = blk_mq_alloc_sq_tag_set(&fs->tag_set, &swim3_mq_ops, 2,
+			BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
+		goto out_unregister;
+
+	disk = blk_mq_alloc_disk(&fs->tag_set, fs);
+	if (IS_ERR(disk)) {
+		rc = PTR_ERR(disk);
+		goto out_free_tag_set;
 	}
-	disk->queue->queuedata = fs;
 
 	rc = swim3_add_device(mdev, floppy_count);
 	if (rc)
-		goto out_cleanup_queue;
+		goto out_cleanup_disk;
 
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = floppy_count;
+	disk->minors = 1;
 	disk->fops = &floppy_fops;
 	disk->private_data = fs;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -1237,12 +1234,10 @@ static int swim3_attach(struct macio_dev *mdev,
 	disks[floppy_count++] = disk;
 	return 0;
 
-out_cleanup_queue:
-	blk_cleanup_queue(disk->queue);
-	disk->queue = NULL;
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
+out_free_tag_set:
 	blk_mq_free_tag_set(&fs->tag_set);
-out_put_disk:
-	put_disk(disk);
 out_unregister:
 	if (floppy_count == 0)
 		unregister_blkdev(FLOPPY_MAJOR, "fd");
-- 
2.30.2


