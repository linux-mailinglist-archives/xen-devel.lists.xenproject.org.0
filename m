Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A582A9DB6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21050.47299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb7B2-0007CX-BP; Fri, 06 Nov 2020 19:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21050.47299; Fri, 06 Nov 2020 19:13:36 +0000
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
	id 1kb7B2-0007Bb-6S; Fri, 06 Nov 2020 19:13:36 +0000
Received: by outflank-mailman (input) for mailman id 21050;
 Fri, 06 Nov 2020 19:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb73A-0004zS-TU
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:28 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11ce5153-c32d-4c37-88c2-d52cee2f7f95;
 Fri, 06 Nov 2020 19:04:35 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb71t-0000x7-8S; Fri, 06 Nov 2020 19:04:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb73A-0004zS-TU
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:28 +0000
X-Inumbo-ID: 11ce5153-c32d-4c37-88c2-d52cee2f7f95
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 11ce5153-c32d-4c37-88c2-d52cee2f7f95;
	Fri, 06 Nov 2020 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9taUiqSTACcH2Z0NVyYeu1wIyxjTgsg3N9q7Quy2bf8=; b=oAMtLVxzr+OO0PcilibN4J+7cY
	A6aOsonM11li6ilkHUPp8kBC6QK8Ku1WKyvUPQIIKS3Yr6ShhFM9rGgNGOqajADhudPZ+3vFzZY6G
	+awcIimxh/Z01UGkGMBjmo+ldoYOMeGf99KhzTGQ+98goXtxgdupqyVgT6d6XIW8QFrnGYE8B3eI/
	NdxJOwyx/XyOCFGOvQCYVgahj/lrrL/KLrr4bytAMgZd96iY0MMc/Ta+sFWjeoqP7n+5l0TOF6jMP
	v4PEZnAOD042+hSq/ZESdR+3iJ6Oge2OfUHEz6Jei3G3ygfq/wegQ3JrDRIV0DxROiAOfQJF8vFZL
	LUGQzlHA==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71t-0000x7-8S; Fri, 06 Nov 2020 19:04:10 +0000
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
Subject: [PATCH 11/24] nbd: use set_capacity_and_notify
Date: Fri,  6 Nov 2020 20:03:23 +0100
Message-Id: <20201106190337.1973127-12-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_capacity_and_notify to update the disk and block device sizes and
send a RESIZE uevent to userspace.  Note that blktests relies on uevents
being sent also for updates that did not change the device size, so the
explicit kobject_uevent remains for that case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 327060e01ad58e..a6f51934391edb 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -299,8 +299,6 @@ static void nbd_size_clear(struct nbd_device *nbd)
 static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
-	struct block_device *bdev;
-
 	if (!blksize)
 		blksize = NBD_DEF_BLKSIZE;
 	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
@@ -320,16 +318,9 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	blk_queue_logical_block_size(nbd->disk->queue, blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, blksize);
 
-	set_capacity(nbd->disk, bytesize >> 9);
-	bdev = bdget_disk(nbd->disk, 0);
-	if (bdev) {
-		if (bdev->bd_disk)
-			bd_set_nr_sectors(bdev, bytesize >> 9);
-		else
-			set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
-		bdput(bdev);
-	}
-	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
+	set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
+	if (!set_capacity_and_notify(nbd->disk, bytesize >> 9))
+		kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
 	return 0;
 }
 
-- 
2.28.0


