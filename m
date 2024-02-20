Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAD85B5CC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683233.1062651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLon-0006mq-Is; Tue, 20 Feb 2024 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683233.1062651; Tue, 20 Feb 2024 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLon-0006ja-FM; Tue, 20 Feb 2024 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 683233;
 Tue, 20 Feb 2024 08:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDQo=J5=bombadil.srs.infradead.org=BATV+d5dc426667c65ded4f96+7485+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcLom-0006U9-E7
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:49:36 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83a6192-cfcc-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:49:35 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcLoi-0000000DnTu-1kAA; Tue, 20 Feb 2024 08:49:32 +0000
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
X-Inumbo-ID: f83a6192-cfcc-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-Type:Content-ID:Content-Description;
	bh=XB8sWvj2sJzz3ZYwbZ8ds+HCirTtw0TSEkRcDSm3wbM=; b=iO3gbqYxXIpxTuUV2zaHjet/E4
	qbRGnvwyzQ2MW6HWb7TOiCVxrGrniN76RG6Cl55RBk38TaWUCAYMDpI/oeiP1WafJ0NibOt9drWiS
	7ZdgZcXtPdA2Nv5UfZZ82AaCGhzZMs5bT+DrnYzh2t8nPzlZx3RNZgEHD4Skvr16yHW60kTGQvrUm
	rdViw5WORq44kHbU2jAlPEjFqyPhJn4KkyylSRCTXiAnGT7FuAYLnmIAiCZ2W/eQs4RDeXNPb1xNh
	WpCctydJ0Fd8j/ehtsJjIwS0eu0OEcf0MxtmI5pe7nswvRbBJzctzU98Tn9aRR3/NZNrYZiVnOFM+
	IJF+6Vqg==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 1/4] xen-blkfront: set max_discard/secure erase limits to UINT_MAX
Date: Tue, 20 Feb 2024 09:49:32 +0100
Message-Id: <20240220084935.3282351-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220084935.3282351-1-hch@lst.de>
References: <20240220084935.3282351-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Currently xen-blkfront set the max discard limit to the capacity of
the device, which is suboptimal when the capacity changes.  Just set
it to UINT_MAX, which has the same effect except and is simpler.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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


