Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1F902FF9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737610.1144050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvg-0001a2-03; Tue, 11 Jun 2024 05:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737610.1144050; Tue, 11 Jun 2024 05:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvf-0001Wl-Su; Tue, 11 Jun 2024 05:20:19 +0000
Received: by outflank-mailman (input) for mailman id 737610;
 Tue, 11 Jun 2024 05:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtvd-0006gk-Ro
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:17 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48da98a5-27b2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:20:16 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvL-00000007R0v-1C21; Tue, 11 Jun 2024 05:19:59 +0000
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
X-Inumbo-ID: 48da98a5-27b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lt3t26OR+aUwy+yHARJ3+3kli+Y9MzGBmWJgtPDO0Yk=; b=3Uu1BULf7magHnf6R7hsR1GIlN
	SJd84Gj4n7hMxXgVxqwTjx12uB4BxsPsKofgqeK8s1tB9x/8UIqfFwYdEmhAf22CuIAOwrm0oxESi
	ycgsWyJNCcFgkZRL9iNnvCLYcGs2YN4KpB13M0ItXIwsYf4zxZ//KlgnW18ry7obpXptNUl3Jior/
	Fwwpt7Ey8K33VEKo8oxSt00ZEPoPxl7Xaeg9EVXtqGT/k85qAxMYikzkGk0wNt6tJYX2Bnl0J+7lG
	lA1TnI+25z1ZuXjSGhoq/L28+4F0/MOFLHnnstU1+tbzD0qia6Man53VkKd6ZswYiGXsl7DEHICUx
	lOPAQasw==;
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
Subject: [PATCH 09/26] nbd: move setting the cache control flags to __nbd_set_size
Date: Tue, 11 Jun 2024 07:19:09 +0200
Message-ID: <20240611051929.513387-10-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move setting the cache control flags in nbd in preparation for moving
these flags into the queue_limits structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ad887d614d5b3f..44b8c671921e5c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -342,6 +342,12 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		lim.max_hw_discard_sectors = UINT_MAX;
 	else
 		lim.max_hw_discard_sectors = 0;
+	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH))
+		blk_queue_write_cache(nbd->disk->queue, false, false);
+	else if (nbd->config->flags & NBD_FLAG_SEND_FUA)
+		blk_queue_write_cache(nbd->disk->queue, true, true);
+	else
+		blk_queue_write_cache(nbd->disk->queue, true, false);
 	lim.logical_block_size = blksize;
 	lim.physical_block_size = blksize;
 	error = queue_limits_commit_update(nbd->disk->queue, &lim);
@@ -1286,19 +1292,10 @@ static void nbd_bdev_reset(struct nbd_device *nbd)
 
 static void nbd_parse_flags(struct nbd_device *nbd)
 {
-	struct nbd_config *config = nbd->config;
-	if (config->flags & NBD_FLAG_READ_ONLY)
+	if (nbd->config->flags & NBD_FLAG_READ_ONLY)
 		set_disk_ro(nbd->disk, true);
 	else
 		set_disk_ro(nbd->disk, false);
-	if (config->flags & NBD_FLAG_SEND_FLUSH) {
-		if (config->flags & NBD_FLAG_SEND_FUA)
-			blk_queue_write_cache(nbd->disk->queue, true, true);
-		else
-			blk_queue_write_cache(nbd->disk->queue, true, false);
-	}
-	else
-		blk_queue_write_cache(nbd->disk->queue, false, false);
 }
 
 static void send_disconnects(struct nbd_device *nbd)
-- 
2.43.0


