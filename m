Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA4504BDE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306878.522116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOb-0003R5-Re; Mon, 18 Apr 2022 04:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306878.522116; Mon, 18 Apr 2022 04:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOb-0003Oz-L8; Mon, 18 Apr 2022 04:53:53 +0000
Received: by outflank-mailman (input) for mailman id 306878;
 Mon, 18 Apr 2022 04:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOa-0001do-6Y
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:52 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a06660d-bed3-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 06:53:51 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJOI-00FYkg-0o; Mon, 18 Apr 2022 04:53:34 +0000
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
X-Inumbo-ID: 8a06660d-bed3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5rcnJ83GrgSSabCav/BawazCovpIiEvHei2b2gmullQ=; b=CjJhpozaz3ZvUqlOlRhUG6HF0e
	L1k08qBdI7FjLxrC+2SHHoNWrKKNNyMlTyF4yTi95nmPu6QjzipSWH9TvaHMjTe8XoTWpzOf49Xwn
	/jTNmyPXW291lu9ai/kVpUcGZy0BEma/a+v71WBQptYeQK53Oa4G3wRCg1iH80jgNCDh+UkonCJTi
	b2hNWpI0YPpjBR+0L2Bg82wVndKnPmP8XXH33hc/RLegnrrgdomyqC3ANZRjwyzqph4yUIcfGGV1b
	13e7GSLfhf8SaHCAofITijpch9zJ9GPiLs40aqk7qM6e7KoHhSnPrPVcNE2jwVOMrxC25OuZ8i44W
	kFZNgihA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Song Liu <song@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	dm-devel@redhat.com
Subject: [PATCH 06/11] raid5: don't set the discard_alignment queue limit
Date: Mon, 18 Apr 2022 06:53:09 +0200
Message-Id: <20220418045314.360785-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The discard_alignment queue limit is named a bit misleading means the
offset into the block device at which the discard granularity starts.
Setting it to the discard granularity as done by raid5 is mostly
harmless but also useless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/raid5.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 59f91e392a2ae..39b0afdf40d0a 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7749,7 +7749,6 @@ static int raid5_run(struct mddev *mddev)
 		 */
 		stripe = stripe * PAGE_SIZE;
 		stripe = roundup_pow_of_two(stripe);
-		mddev->queue->limits.discard_alignment = stripe;
 		mddev->queue->limits.discard_granularity = stripe;
 
 		blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
-- 
2.30.2


