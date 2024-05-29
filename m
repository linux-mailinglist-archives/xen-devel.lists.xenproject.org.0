Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35738D2BF7
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731382.1136892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVN-0004fk-FE; Wed, 29 May 2024 05:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731382.1136892; Wed, 29 May 2024 05:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVN-0004dG-9X; Wed, 29 May 2024 05:05:41 +0000
Received: by outflank-mailman (input) for mailman id 731382;
 Wed, 29 May 2024 05:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVL-0002IP-Bf
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:39 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15fa2b76-1d79-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 07:05:37 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBVE-00000002pch-0ecf; Wed, 29 May 2024 05:05:32 +0000
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
X-Inumbo-ID: 15fa2b76-1d79-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FxMZ/TuFQWi8ppJCXfgMd7wJRUIIOyQbd6+WyEUQ+N4=; b=sP8WPUo5vAWKUtYTFsHH8zz4lY
	DJJMR33fYr4eAsLHFTZ8Z9howNp0W6fwZ2fiNjcxUBC3ODEyO2i6vzUcK33pr0IzzNeqbE0OGj1ST
	5S7X+/6iNra2QHh6wsNSXPnXFeKcQpoKWDT2h0ez391hq4EcHyXFSepiXhTUC3N2xV1AZcowiOldm
	4EXlw2b1iSu+BV1NPRisPBN1MDDygrM+eCbEpyBDZ0QTDVC2nwgktvILS31bY5S++5+So+r6x+Kgv
	BwpsZkqpUIOpxNp0XUC+iXoyBN5nUfj9Zb4EGtzt7UNxwaRV/VE3oyhLo7REgxmsgSTIrs8QWAfko
	q33GTzcg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 08/12] sd: cleanup zoned queue limits initialization
Date: Wed, 29 May 2024 07:04:10 +0200
Message-ID: <20240529050507.1392041-9-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Consolidate setting zone-related queue limits in sd_zbc_read_zones
instead of splitting them between sd_zbc_revalidate_zones and
sd_zbc_read_zones, and move the early_zone_information initialization
in sd_zbc_read_zones above setting up the queue limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd_zbc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 806036e48abeda..1c24c844e8d178 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -565,12 +565,6 @@ int sd_zbc_revalidate_zones(struct scsi_disk *sdkp)
 	sdkp->zone_info.zone_blocks = zone_blocks;
 	sdkp->zone_info.nr_zones = nr_zones;
 
-	blk_queue_chunk_sectors(q,
-			logical_to_sectors(sdkp->device, zone_blocks));
-
-	/* Enable block layer zone append emulation */
-	blk_queue_max_zone_append_sectors(q, 0);
-
 	flags = memalloc_noio_save();
 	ret = blk_revalidate_disk_zones(disk);
 	memalloc_noio_restore(flags);
@@ -625,6 +619,10 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 	if (ret != 0)
 		goto err;
 
+	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
+	sdkp->early_zone_info.nr_zones = nr_zones;
+	sdkp->early_zone_info.zone_blocks = zone_blocks;
+
 	/* The drive satisfies the kernel restrictions: set it up */
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	if (sdkp->zones_max_open == U32_MAX)
@@ -632,10 +630,10 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 	else
 		disk_set_max_open_zones(disk, sdkp->zones_max_open);
 	disk_set_max_active_zones(disk, 0);
-	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
-
-	sdkp->early_zone_info.nr_zones = nr_zones;
-	sdkp->early_zone_info.zone_blocks = zone_blocks;
+	blk_queue_chunk_sectors(q,
+			logical_to_sectors(sdkp->device, zone_blocks));
+	/* Enable block layer zone append emulation */
+	blk_queue_max_zone_append_sectors(q, 0);
 
 	return 0;
 
-- 
2.43.0


