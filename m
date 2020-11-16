Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B42B48B7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28199.57178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg9l-0004hq-Qo; Mon, 16 Nov 2020 15:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28199.57178; Mon, 16 Nov 2020 15:11:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg9k-0004Zb-68; Mon, 16 Nov 2020 15:11:00 +0000
Received: by outflank-mailman (input) for mailman id 28199;
 Mon, 16 Nov 2020 15:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefzH-0006ni-2g
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:00:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 205855a2-63e8-49a4-ba67-7ec399427765;
 Mon, 16 Nov 2020 14:58:52 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxi-0003ph-Re; Mon, 16 Nov 2020 14:58:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefzH-0006ni-2g
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:00:11 +0000
X-Inumbo-ID: 205855a2-63e8-49a4-ba67-7ec399427765
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 205855a2-63e8-49a4-ba67-7ec399427765;
	Mon, 16 Nov 2020 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pTUA48t42+HHCJV8On6c5azUAuBD9lzCSJPspjiep2g=; b=qaAfbB35avsytGqpNEWytrYnG3
	Gzj30W9piDTxClPGcKhQyC+7xWVJuzk1wqdaEoOD9LirlO1oU4d+8MQk8YOX9kwzJ7YvxhfCYVwqV
	R1dvaVAuFO/bc6xYy1Ev4vzKAgcI+bbNKPs2o+tMhgBNzFFqOC/Cs3j9//Uol04948xLm+DnqHaQV
	JmjjR/YVKAVJHjcogeCp9WMAO/bNvPQrjfn23UtbJYTihH9NKGBOQhYu6ZZR0Bj/S8oBjTDj9QxIb
	xdoFbJTJepAHEgsdxqO7JMl+zv8FirGSWZmdep8SDJQcE2TlUZhGVyxST/B+EptdxxxLsqlXBn1sz
	2IVCtD9Q==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxi-0003ph-Re; Mon, 16 Nov 2020 14:58:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 18/78] zram: use set_capacity_and_notify
Date: Mon, 16 Nov 2020 15:57:09 +0100
Message-Id: <20201116145809.410558-19-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_capacity_and_notify to set the size of both the disk and block
device.  This also gets the uevent notifications for the resize for free.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 1b697208d66157..6d15d51cee2b7e 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1695,7 +1695,7 @@ static void zram_reset_device(struct zram *zram)
 	disksize = zram->disksize;
 	zram->disksize = 0;
 
-	set_capacity(zram->disk, 0);
+	set_capacity_and_notify(zram->disk, 0);
 	part_stat_set_all(&zram->disk->part0, 0);
 
 	up_write(&zram->init_lock);
@@ -1741,9 +1741,7 @@ static ssize_t disksize_store(struct device *dev,
 
 	zram->comp = comp;
 	zram->disksize = disksize;
-	set_capacity(zram->disk, zram->disksize >> SECTOR_SHIFT);
-
-	revalidate_disk_size(zram->disk, true);
+	set_capacity_and_notify(zram->disk, zram->disksize >> SECTOR_SHIFT);
 	up_write(&zram->init_lock);
 
 	return len;
@@ -1790,7 +1788,6 @@ static ssize_t reset_store(struct device *dev,
 	/* Make sure all the pending I/O are finished */
 	fsync_bdev(bdev);
 	zram_reset_device(zram);
-	revalidate_disk_size(zram->disk, true);
 	bdput(bdev);
 
 	mutex_lock(&bdev->bd_mutex);
-- 
2.29.2


