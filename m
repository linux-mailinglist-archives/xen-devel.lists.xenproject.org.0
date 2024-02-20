Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A296685B5CB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683234.1062661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLoq-00072i-Rc; Tue, 20 Feb 2024 08:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683234.1062661; Tue, 20 Feb 2024 08:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLoq-000705-Mb; Tue, 20 Feb 2024 08:49:40 +0000
Received: by outflank-mailman (input) for mailman id 683234;
 Tue, 20 Feb 2024 08:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDQo=J5=bombadil.srs.infradead.org=BATV+d5dc426667c65ded4f96+7485+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcLop-0006Sb-3M
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:49:39 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9df1a36-cfcc-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:49:37 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcLol-0000000DnUO-0bhr; Tue, 20 Feb 2024 08:49:35 +0000
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
X-Inumbo-ID: f9df1a36-cfcc-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-Type:Content-ID:Content-Description;
	bh=qIptjw8o7Oz7t0MBkVD69QjyMkpNVljZIeCgpSOPynU=; b=MiwA9mC1nUXdlp4EQ9i9PgWEcc
	zPQC3qBNpnwdxPm8TZxkbIhUkH9DVy5VbBvDvd5vK9z4cs7wyZpWo7K9ijlkJoBLZ4azIUJsK+AA6
	z+fghEuCvV7VbDZNb6gpNsMwiZBJKstzkf6HRABTqMX0LltW3i1VWQJscMPwb2guGUuN5ZHYm9WoM
	DLYQaU2kaY3KaH9tXa/CiU2lvl4KF5hMAOVh2mGQ++656UQx0Y4BlamhBHh/9nk+sdbD7XvOHvtnS
	SyqZB4+RBR5raaZoQ0BTTcijnSqjTXxxI2DmYhgSweS0VEuuYh8xYSCif+K1Ek+eBXXH6P1jhwGo8
	Oik2Hfdw==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 2/4] xen-blkfront: rely on the default discard granularity
Date: Tue, 20 Feb 2024 09:49:33 +0100
Message-Id: <20240220084935.3282351-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220084935.3282351-1-hch@lst.de>
References: <20240220084935.3282351-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The block layer now sets the discard granularity to the physical
block size default.  Take advantage of that in xen-blkfront and only
set the discard granularity if explicitly specified.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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


