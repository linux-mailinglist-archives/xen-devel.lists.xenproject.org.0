Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EAD9030DB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737688.1144190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2v-0008UL-9f; Tue, 11 Jun 2024 05:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737688.1144190; Tue, 11 Jun 2024 05:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2u-0008Ok-T0; Tue, 11 Jun 2024 05:27:48 +0000
Received: by outflank-mailman (input) for mailman id 737688;
 Tue, 11 Jun 2024 05:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtvi-0006Mb-8l
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c14d9ee-27b2-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 07:20:21 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvO-00000007R2v-03k6; Tue, 11 Jun 2024 05:20:02 +0000
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
X-Inumbo-ID: 4c14d9ee-27b2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XX8OKzSF4I8HqKWv9CPGPzdF42TlXrJn92mCb7zGUpU=; b=MgJCZXdCXtq5WcrpKLj6n44BMN
	x7as6F25HhuflNiQsl6jB5W6Jl8Cql52H+wX7EAkBatRuj+eJQEWJ77tUg0C3taOh9WTyyJ5Bqsdi
	RXIGXMyVTRoSsh9a4uAfJCaQK5+FHeeQHkBBZE0YZA9FygNVsS+hGq+FQgsOMtLKMq7cOPugwuWbd
	nHgbDPqb89/cUkFHBBzn5P6ypmdPwRtPSnVwTBJUEpsncbavyujHEC5azlnNETobhWGFD7GOTUPkY
	4mvSB/tNstXuD79kJeevqTycR98vtBAfM0kE9ci/1QpnRCn9+ZGtDS5u57IeabqphYzfqjxqKjOQg
	V0F/xAxw==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 10/26] xen-blkfront: don't disable cache flushes when they fail
Date: Tue, 11 Jun 2024 07:19:10 +0200
Message-ID: <20240611051929.513387-11-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

blkfront always had a robust negotiation protocol for detecting a write
cache.  Stop simply disabling cache flushes when they fail as that is
a grave error.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 9b4ec3e4908cce..9794ac2d3299d1 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -982,18 +982,6 @@ static const char *flush_info(struct blkfront_info *info)
 		return "barrier or flush: disabled;";
 }
 
-static void xlvbd_flush(struct blkfront_info *info)
-{
-	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
-			      info->feature_fua ? true : false);
-	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
-		info->gd->disk_name, flush_info(info),
-		"persistent grants:", info->feature_persistent ?
-		"enabled;" : "disabled;", "indirect descriptors:",
-		info->max_indirect_segments ? "enabled;" : "disabled;",
-		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
-}
-
 static int xen_translate_vdev(int vdevice, int *minor, unsigned int *offset)
 {
 	int major;
@@ -1162,7 +1150,15 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	info->sector_size = sector_size;
 	info->physical_sector_size = physical_sector_size;
 
-	xlvbd_flush(info);
+	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
+			      info->feature_fua ? true : false);
+
+	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
+		info->gd->disk_name, flush_info(info),
+		"persistent grants:", info->feature_persistent ?
+		"enabled;" : "disabled;", "indirect descriptors:",
+		info->max_indirect_segments ? "enabled;" : "disabled;",
+		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
 
 	if (info->vdisk_info & VDISK_READONLY)
 		set_disk_ro(gd, 1);
@@ -1622,13 +1618,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 				       info->gd->disk_name, op_name(bret.operation));
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 			}
-			if (unlikely(blkif_req(req)->error)) {
-				if (blkif_req(req)->error == BLK_STS_NOTSUPP)
-					blkif_req(req)->error = BLK_STS_OK;
-				info->feature_fua = 0;
-				info->feature_flush = 0;
-				xlvbd_flush(info);
-			}
 			fallthrough;
 		case BLKIF_OP_READ:
 		case BLKIF_OP_WRITE:
-- 
2.43.0


