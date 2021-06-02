Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43E39827C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135529.251792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuI-0006rX-OY; Wed, 02 Jun 2021 07:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135529.251792; Wed, 02 Jun 2021 07:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuI-0006nu-JU; Wed, 02 Jun 2021 07:03:14 +0000
Received: by outflank-mailman (input) for mailman id 135529;
 Wed, 02 Jun 2021 07:03:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKnT-0007A2-61
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:56:11 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3699b6c-2647-4455-8297-c1370470e73e;
 Wed, 02 Jun 2021 06:55:15 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmA-0025cC-BJ; Wed, 02 Jun 2021 06:54:50 +0000
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
X-Inumbo-ID: d3699b6c-2647-4455-8297-c1370470e73e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5ce2JiRw1Xfew42Ze/lpHvPyVGAKQBeRUdFT9myuT9Y=; b=D3gIVkolzefyEuZRqpxqbTjD1/
	me+j80WuDmIEDCJoCJJi3EaA6ZCyWCHg/zV//LKDbuT47z7Uv/x4kG2fPmshfH/L7rjbpzOatrjCm
	ARVjVeFvQjsO3HUvF2D9OqnaTSbbV853xQhgkz8ti5uaY4uAnMmLFziTNlF8DV+PTEuHXC3T5Pive
	LO7ao7bFh4VNXvbPzkbKc4TXiRq98YZ/TLJxnVtZ5DgjQkmVu3QKesdVOoc5Nq3l6loa9nnM9JqI4
	k1sn5uw5l5Y+eo2X4wE+smW+Tw3NfDakiaWjXDN2Xlkt/Jo9eltYtyzKb8C/e2tK4DiSGkIBOzcFb
	t7mn9Egw==;
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
Subject: [PATCH 12/30] swim: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:27 +0300
Message-Id: <20210602065345.355274-13-hch@lst.de>
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
 drivers/block/swim.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 2917b21f48ff..7ccc8d2a41bc 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -800,23 +800,20 @@ static int swim_floppy_init(struct swim_priv *swd)
 	spin_lock_init(&swd->lock);
 
 	for (drive = 0; drive < swd->floppy_count; drive++) {
-		struct request_queue *q;
-
-		swd->unit[drive].disk = alloc_disk(1);
-		if (swd->unit[drive].disk == NULL) {
-			err = -ENOMEM;
+		err = blk_mq_alloc_sq_tag_set(&swd->unit[drive].tag_set,
+				&swim_mq_ops, 2, BLK_MQ_F_SHOULD_MERGE);
+		if (err)
 			goto exit_put_disks;
-		}
 
-		q = blk_mq_init_sq_queue(&swd->unit[drive].tag_set, &swim_mq_ops,
-						2, BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(q)) {
-			err = PTR_ERR(q);
+		swd->unit[drive].disk =
+			blk_mq_alloc_disk(&swd->unit[drive].tag_set,
+					  &swd->unit[drive]);
+		if (IS_ERR(swd->unit[drive].disk)) {
+			blk_mq_free_tag_set(&swd->unit[drive].tag_set);
+			err = PTR_ERR(swd->unit[drive].disk);
 			goto exit_put_disks;
 		}
 
-		swd->unit[drive].disk->queue = q;
-		swd->unit[drive].disk->queue->queuedata = &swd->unit[drive];
 		swd->unit[drive].swd = swd;
 	}
 
@@ -824,6 +821,7 @@ static int swim_floppy_init(struct swim_priv *swd)
 		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
 		swd->unit[drive].disk->major = FLOPPY_MAJOR;
 		swd->unit[drive].disk->first_minor = drive;
+		swd->unit[drive].disk->minors = 1;
 		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
 		swd->unit[drive].disk->fops = &floppy_fops;
 		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -839,14 +837,10 @@ static int swim_floppy_init(struct swim_priv *swd)
 	do {
 		struct gendisk *disk = swd->unit[drive].disk;
 
-		if (disk) {
-			if (disk->queue) {
-				blk_cleanup_queue(disk->queue);
-				disk->queue = NULL;
-			}
-			blk_mq_free_tag_set(&swd->unit[drive].tag_set);
-			put_disk(disk);
-		}
+		if (!disk)
+			continue;
+		blk_cleanup_disk(disk);
+		blk_mq_free_tag_set(&swd->unit[drive].tag_set);
 	} while (drive--);
 	return err;
 }
-- 
2.30.2


