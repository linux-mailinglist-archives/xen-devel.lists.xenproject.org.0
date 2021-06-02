Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0539827A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135523.251764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuE-000622-RK; Wed, 02 Jun 2021 07:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135523.251764; Wed, 02 Jun 2021 07:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuE-0005zL-NK; Wed, 02 Jun 2021 07:03:10 +0000
Received: by outflank-mailman (input) for mailman id 135523;
 Wed, 02 Jun 2021 07:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKoR-0007A2-8F
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:57:11 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b06eb1f-aec6-49d4-92ae-0308a6a0f748;
 Wed, 02 Jun 2021 06:55:35 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmW-0025pH-8N; Wed, 02 Jun 2021 06:55:12 +0000
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
X-Inumbo-ID: 4b06eb1f-aec6-49d4-92ae-0308a6a0f748
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=whkiEYkd/RZIFiccnNyVDQBt5GosCsybR61i2OE/TAs=; b=sGyQUwx4y9mBLuKjtVUp+c2wE9
	QKndoQI8+lVj5QubiuPxijfodshDbI28HmJC7XZxoK1I3O/xDGWqqWfWHPGGuhE/xYEpYPaljJGG0
	Fr4gr1lXEhUJVsLAp4MvKyynYGbSyA4OVlnSrYZiKU1gb2XC/QCckw8whfLsI+GKqp2G0C8FEKneP
	do3Abzx9O1Apmvm5lGswbnuiBjA19TYT3MinqZLYbcCGK2VKfmLyeYtMwiBKm8hatOP3dxWqLa5yK
	W7GKvYBzqn1hQiPqfJxptmiWvUrY4I54If9aEuYVsVn2eDAvQ6qCfhLBxQm3PYYJuSGatkU1tnAjt
	EHt0T+HQ==;
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
Subject: [PATCH 17/30] floppy: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:32 +0300
Message-Id: <20210602065345.355274-18-hch@lst.de>
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
 drivers/block/floppy.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 8a9d22207c59..cbed9776f285 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4491,23 +4491,15 @@ static bool floppy_available(int drive)
 static int floppy_alloc_disk(unsigned int drive, unsigned int type)
 {
 	struct gendisk *disk;
-	int err;
-
-	disk = alloc_disk(1);
-	if (!disk)
-		return -ENOMEM;
 
-	disk->queue = blk_mq_init_queue(&tag_sets[drive]);
-	if (IS_ERR(disk->queue)) {
-		err = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		put_disk(disk);
-		return err;
-	}
+	disk = blk_mq_alloc_disk(&tag_sets[drive], NULL);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	blk_queue_max_hw_sectors(disk->queue, 64);
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = TOMINOR(drive) | (type << 2);
+	disk->minors = 1;
 	disk->fops = &floppy_fops;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
 	if (type)
@@ -4727,10 +4719,8 @@ static int __init do_floppy_init(void)
 		if (!disks[drive][0])
 			break;
 		del_timer_sync(&motor_off_timer[drive]);
-		blk_cleanup_queue(disks[drive][0]->queue);
-		disks[drive][0]->queue = NULL;
+		blk_cleanup_disk(disks[drive][0]);
 		blk_mq_free_tag_set(&tag_sets[drive]);
-		put_disk(disks[drive][0]);
 	}
 	return err;
 }
-- 
2.30.2


