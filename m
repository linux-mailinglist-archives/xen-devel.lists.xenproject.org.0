Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D22504BDD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306877.522101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOZ-0002rd-Md; Mon, 18 Apr 2022 04:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306877.522101; Mon, 18 Apr 2022 04:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOZ-0002hT-BZ; Mon, 18 Apr 2022 04:53:51 +0000
Received: by outflank-mailman (input) for mailman id 306877;
 Mon, 18 Apr 2022 04:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOW-0001c8-Ey
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:48 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e10c8b-bed3-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 06:53:47 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJOE-00FYjt-Uc; Mon, 18 Apr 2022 04:53:31 +0000
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
X-Inumbo-ID: 87e10c8b-bed3-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jJDfNJ+noyJ0aQwSxPjfuM0bukOLXIlZdKOCCRo7UC0=; b=xuIkX7BaO7YLYo2xtforYUeJSz
	D4ZkceNgWZcqsdA4kKDR70kSEQCNujP+EuBqv6qBw0ZF92W/0/cEfjWOan0nETRKihTYr6lzIZlZl
	bBcwq/JHARHxWpbiEMaI9y7fhWsSop569zSNCbdEUmCgnceKeTdNHmdubHo2T02f4jZnDeMuy9YEp
	gX5Gk0YQFUdeh+lTgVE6905xov9XyUfA8uV/rEBVxEimHbnB03TXVy+Q+6Z3Gp8bR9szIE8Cp8Ndy
	rknbV4gm7RVldjeoTzmK+sn63+wAUNv9Myo89P/eXTHdhfPYO+SAS69EJRqWmwD6yqU/r8IFcrYqq
	/61rhfuw==;
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
Subject: [PATCH 05/11] dm-zoned: don't set the discard_alignment queue limit
Date: Mon, 18 Apr 2022 06:53:08 +0200
Message-Id: <20220418045314.360785-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The discard_alignment queue limit is named a bit misleading means the
offset into the block device at which the discard granularity starts.
Setting it to the discard granularity as done by dm-zoned is mostly
harmless but also useless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-zoned-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index cac295cc8840e..0ec5d8b9b1a4e 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1001,7 +1001,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	blk_limits_io_min(limits, DMZ_BLOCK_SIZE);
 	blk_limits_io_opt(limits, DMZ_BLOCK_SIZE);
 
-	limits->discard_alignment = DMZ_BLOCK_SIZE;
+	limits->discard_alignment = 0;
 	limits->discard_granularity = DMZ_BLOCK_SIZE;
 	limits->max_discard_sectors = chunk_sectors;
 	limits->max_hw_discard_sectors = chunk_sectors;
-- 
2.30.2


