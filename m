Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64085D88D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684014.1063658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBf-0007kZ-LF; Wed, 21 Feb 2024 12:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684014.1063658; Wed, 21 Feb 2024 12:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBf-0007er-GL; Wed, 21 Feb 2024 12:58:59 +0000
Received: by outflank-mailman (input) for mailman id 684014;
 Wed, 21 Feb 2024 12:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCxi=J6=bombadil.srs.infradead.org=BATV+bafd7931fd2c4139f05c+7486+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcmBd-0007bV-W7
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:58:57 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7cf6c8e-d0b8-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 13:58:55 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcmBY-00000000wCC-3HMp; Wed, 21 Feb 2024 12:58:53 +0000
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
X-Inumbo-ID: f7cf6c8e-d0b8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=YF5q7+3VG37xUS7LPqZfsPI94l1e0iY4W/WI3XMTmts=; b=dkELOht3p/0mBMKM01rj7u26/q
	qcbpOHS8c81tO6wKhp3hfJBcoa9XaxFluK9tPHejblLd+YoNybr/5oUbaCH6Rz6uiXfPWnQRhCaCI
	8JvnTbk3uqKcRVo8gGzY4kSYXPC2O9d1ni5VzzUVcyzyvc8B6Z7xGk5dPY1+W6x7wI+hTqhgT6106
	3fsxLlpNBthXWs28REaKn48G5qJyHe2DJluaZaYrWr1D7R3zkPF91U0ZlZoCG2dBNgE3U6bNPOHfB
	q7LUzpc1YJEJS+PLzs6CgoNCN9j/YbATIzIf7LVo1thF4XI+Uwjv1CP8TJge/Xr1yokbgtT25ftf8
	hqSdMJ2g==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 1/4] xen-blkfront: set max_discard/secure erase limits to UINT_MAX
Date: Wed, 21 Feb 2024 13:58:42 +0100
Message-Id: <20240221125845.3610668-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Currently xen-blkfront set the max discard limit to the capacity of
the device, which is suboptimal when the capacity changes.  Just set
it to UINT_MAX, which has the same effect and is simpler.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkfront.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 4cc2884e748463..f78167cd5a6333 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -944,20 +944,18 @@ static const struct blk_mq_ops blkfront_mq_ops = {
 static void blkif_set_queue_limits(struct blkfront_info *info)
 {
 	struct request_queue *rq = info->rq;
-	struct gendisk *gd = info->gd;
 	unsigned int segments = info->max_indirect_segments ? :
 				BLKIF_MAX_SEGMENTS_PER_REQUEST;
 
 	blk_queue_flag_set(QUEUE_FLAG_VIRT, rq);
 
 	if (info->feature_discard) {
-		blk_queue_max_discard_sectors(rq, get_capacity(gd));
+		blk_queue_max_discard_sectors(rq, UINT_MAX);
 		rq->limits.discard_granularity = info->discard_granularity ?:
 						 info->physical_sector_size;
 		rq->limits.discard_alignment = info->discard_alignment;
 		if (info->feature_secdiscard)
-			blk_queue_max_secure_erase_sectors(rq,
-							   get_capacity(gd));
+			blk_queue_max_secure_erase_sectors(rq, UINT_MAX);
 	}
 
 	/* Hard sector size and max sectors impersonate the equiv. hardware. */
-- 
2.39.2


