Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DE3981C2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135498.251736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmg-000311-Gv; Wed, 02 Jun 2021 06:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135498.251736; Wed, 02 Jun 2021 06:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKmg-0002ys-DQ; Wed, 02 Jun 2021 06:55:22 +0000
Received: by outflank-mailman (input) for mailman id 135498;
 Wed, 02 Jun 2021 06:55:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKmf-0007A2-4E
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:55:21 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91c486af-9bea-47be-bfe9-22043f6813e4;
 Wed, 02 Jun 2021 06:54:58 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKls-0025R4-W9; Wed, 02 Jun 2021 06:54:33 +0000
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
X-Inumbo-ID: 91c486af-9bea-47be-bfe9-22043f6813e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VrhBOXpqbc1/w6Vz4TvYYyGic8czOTYvar2owBC0Nao=; b=M0oF4rS9JAR1tnscAYGs3Ny4Aw
	R0M734kT6ibhdEiE624YEKsyPPj2YIu9zEGz0wkFfjwV4WFPnIh+1qyKDWdZ3z8EzlkVFGAb8Dcf7
	3V8VbExj8uNId3jTIdf48776+H/+fLIW8cknoNSzbxVEsD1AHyQD0KcKh763iNg2evMPCysdTxB14
	ax5A/5pAgqFYu/FRgKYessRM0Gxr+BcwAdKdzvnS3J8oKCUIv74U/fN2dbR6gw8G1XrC9oJZoC90l
	B8UJw9Kz7LkEpdXWVakEj3I01Qm/fH4nuPfSRHY69/phvcTpV74SAlSbAP7u3gkCl0yYJXtqgKgJ3
	bYIwaHtg==;
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
Subject: [PATCH 08/30] mspro: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:23 +0300
Message-Id: <20210602065345.355274-9-hch@lst.de>
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
 drivers/memstick/core/mspro_block.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index cf7fe0d58ee7..22778d0e24f5 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1205,21 +1205,17 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	if (disk_id < 0)
 		return disk_id;
 
-	msb->disk = alloc_disk(1 << MSPRO_BLOCK_PART_SHIFT);
-	if (!msb->disk) {
-		rc = -ENOMEM;
+	rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &mspro_mq_ops, 2,
+				     BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
 		goto out_release_id;
-	}
 
-	msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &mspro_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(msb->queue)) {
-		rc = PTR_ERR(msb->queue);
-		msb->queue = NULL;
-		goto out_put_disk;
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
+	if (IS_ERR(msb->disk)) {
+		rc = PTR_ERR(msb->disk);
+		goto out_free_tag_set;
 	}
-
-	msb->queue->queuedata = card;
+	msb->queue = msb->disk->queue;
 
 	blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
 	blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
@@ -1228,10 +1224,10 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	msb->disk->major = major;
 	msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
+	msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
 	msb->disk->fops = &ms_block_bdops;
 	msb->usage_count = 1;
 	msb->disk->private_data = msb;
-	msb->disk->queue = msb->queue;
 
 	sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
 
@@ -1247,8 +1243,8 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	msb->active = 1;
 	return 0;
 
-out_put_disk:
-	put_disk(msb->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
 	mutex_lock(&mspro_block_disk_lock);
 	idr_remove(&mspro_block_disk_idr, disk_id);
-- 
2.30.2


