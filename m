Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DA2AEBE8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24431.51790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVw-0004TI-AZ; Wed, 11 Nov 2020 08:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24431.51790; Wed, 11 Nov 2020 08:30:00 +0000
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
	id 1kclVv-0004QJ-TB; Wed, 11 Nov 2020 08:29:59 +0000
Received: by outflank-mailman (input) for mailman id 24431;
 Wed, 11 Nov 2020 08:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclUf-0002dF-J3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:41 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35e22f0f-d65f-46c2-9d30-353efc961803;
 Wed, 11 Nov 2020 08:27:37 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTL-0007cU-2G; Wed, 11 Nov 2020 08:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclUf-0002dF-J3
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:41 +0000
X-Inumbo-ID: 35e22f0f-d65f-46c2-9d30-353efc961803
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35e22f0f-d65f-46c2-9d30-353efc961803;
	Wed, 11 Nov 2020 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7eiDjQ8ZjozXig6+m+V2Nb2yhyFiCm1kEOIxzxYYgzo=; b=INZhS6jek7sGzfAIL6nzYXyeXs
	SsycI2Wi/bh4Pu9HbXbPFzDNdHlSwDosG0AcMwQMMm1UOxdqMl11eyvFrWr8b8z0IrJsEn0H42AYn
	qK9iedvHnlhvSRdKVleqXJmjQGFSSkaIdxmnABppoi7MGvBdw70K6g4OEqXr8kkf1cCEWQ716tM5I
	V+Aj8IGwwwfmE/a75KkaqAmHB6T6imPjEjCW+u7gRuoO7i2YL9fXBfMlWqCYSOkvaP4efehVbn86F
	I/pA5x8OW7h9U9vg1qyAB+518eTm0anOOLvxsYmd8D9ABdtIXycMKu8rH3KJ32rwjG+GfPfEUHYEs
	jyKDZgiw==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTL-0007cU-2G; Wed, 11 Nov 2020 08:27:19 +0000
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
Subject: [PATCH 15/24] nvme: use set_capacity_and_notify in nvme_set_queue_dying
Date: Wed, 11 Nov 2020 09:26:49 +0100
Message-Id: <20201111082658.3401686-16-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the block layer helper to update both the disk and block device
sizes.  Contrary to the name no notification is sent in this case,
as a size 0 is special cased.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 445274b28518fb..cc771c70047a96 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -93,16 +93,6 @@ static void nvme_put_subsystem(struct nvme_subsystem *subsys);
 static void nvme_remove_invalid_namespaces(struct nvme_ctrl *ctrl,
 					   unsigned nsid);
 
-static void nvme_update_bdev_size(struct gendisk *disk)
-{
-	struct block_device *bdev = bdget_disk(disk, 0);
-
-	if (bdev) {
-		bd_set_nr_sectors(bdev, get_capacity(disk));
-		bdput(bdev);
-	}
-}
-
 /*
  * Prepare a queue for teardown.
  *
@@ -119,8 +109,7 @@ static void nvme_set_queue_dying(struct nvme_ns *ns)
 	blk_set_queue_dying(ns->queue);
 	blk_mq_unquiesce_queue(ns->queue);
 
-	set_capacity(ns->disk, 0);
-	nvme_update_bdev_size(ns->disk);
+	set_capacity_and_notify(ns->disk, 0);
 }
 
 static void nvme_queue_scan(struct nvme_ctrl *ctrl)
-- 
2.28.0


