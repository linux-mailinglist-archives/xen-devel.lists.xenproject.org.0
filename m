Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABE85D88B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684015.1063670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBh-000880-VX; Wed, 21 Feb 2024 12:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684015.1063670; Wed, 21 Feb 2024 12:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBh-00085G-SJ; Wed, 21 Feb 2024 12:59:01 +0000
Received: by outflank-mailman (input) for mailman id 684015;
 Wed, 21 Feb 2024 12:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCxi=J6=bombadil.srs.infradead.org=BATV+bafd7931fd2c4139f05c+7486+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcmBg-00082S-KX
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:59:00 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9a37b58-d0b8-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 13:58:58 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcmBb-00000000wEZ-31In; Wed, 21 Feb 2024 12:58:56 +0000
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
X-Inumbo-ID: f9a37b58-d0b8-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=AJ2bO5DndZrmPq3Dd1zge+YVJmxcGzOjpW+1dV9o8hU=; b=0UI5+v3RaoEG0RwA7cWThgCcBh
	esLhJcrhMRUggkzC3n/4WDY0UPLEB3eIPfNGc5SfzVyCRwnouge7req2d+k03fvIdw33zXtgsi5N4
	SZGC0hXnZr/F5F7mVsOi7dpCqpk+Mq9cOndOQxcfPMFQ4ASMLkvPk1XrXCqxdTVSraaJ9eTxWDEWs
	EKoQDODwTqxpDQD+A+1HdUu6hSb8QnA+pWAlYPN2+tlhTtdm2dQrPOCI335+Xq60VKFT0y1pGHBZC
	pJh9NMBWck+arfFAIvRkghaw/C0wKXw5g2H2GBmr5DGLBJexBghbC6ZrNWRZOQYDcbqnNl3e2Qlz2
	OUPaQu3g==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 2/4] xen-blkfront: rely on the default discard granularity
Date: Wed, 21 Feb 2024 13:58:43 +0100
Message-Id: <20240221125845.3610668-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The block layer now sets the discard granularity to the physical
block size default.  Take advantage of that in xen-blkfront and only
set the discard granularity if explicitly specified.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkfront.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index f78167cd5a6333..1258f24b285500 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -951,8 +951,8 @@ static void blkif_set_queue_limits(struct blkfront_info *info)
 
 	if (info->feature_discard) {
 		blk_queue_max_discard_sectors(rq, UINT_MAX);
-		rq->limits.discard_granularity = info->discard_granularity ?:
-						 info->physical_sector_size;
+		if (info->discard_granularity)
+			rq->limits.discard_granularity = info->discard_granularity;
 		rq->limits.discard_alignment = info->discard_alignment;
 		if (info->feature_secdiscard)
 			blk_queue_max_secure_erase_sectors(rq, UINT_MAX);
-- 
2.39.2


