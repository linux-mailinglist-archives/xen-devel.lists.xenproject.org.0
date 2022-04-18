Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB6504BD5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306876.522080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOY-0002IB-5I; Mon, 18 Apr 2022 04:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306876.522080; Mon, 18 Apr 2022 04:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOX-00029z-Rv; Mon, 18 Apr 2022 04:53:49 +0000
Received: by outflank-mailman (input) for mailman id 306876;
 Mon, 18 Apr 2022 04:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOW-0001do-5T
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:48 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85b226ba-bed3-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 06:53:45 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJO6-00FYhe-Hq; Mon, 18 Apr 2022 04:53:23 +0000
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
X-Inumbo-ID: 85b226ba-bed3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=koCagwvOxhN7Shu8/AJxKzZVAKuzrO1L5//iYnC02Iw=; b=AfuHTR/V7lcr3zFbVv43aXi0wl
	9BXiL1MXkRpqJBplwxZBu6BMXzKAwM3cLacngv6w9v/xu4r4wsZXJzUpjj8oykifbHGOdLOj9+cXd
	w57UeuYr1aXFL4KN5snqFZNRlx3/zg/as2hg/byKwuFPkRBWSqYCMgz6Nalf6bjYlUrYWYMFOg7lM
	VVtAyBmc/UB6YQDpwNy9RxJMNN3OFjU5UKmrw+vl4PuZd7vQ6hmG2jXje40n9Bl31/uUTw3g/iABO
	fgajCyxoKwPRp2bRxD9DHepUAQfpOnb0+QEai/a9nd+iaTwNGZ7XqT7mmOiN9r3r1T9l317vuoSmZ
	0Zs1vSZQ==;
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
Subject: [PATCH 02/11] nbd: don't set the discard_alignment queue limit
Date: Mon, 18 Apr 2022 06:53:05 +0200
Message-Id: <20220418045314.360785-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The discard_alignment queue limit is named a bit misleading means the
offset into the block device at which the discard granularity starts.
Setting it to the discard granularity as done by nbd is mostly harmless
but also useless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 4729aef8c6462..102597a4277b9 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -333,7 +333,6 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = blksize;
-		nbd->disk->queue->limits.discard_alignment = blksize;
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, blksize);
@@ -1316,7 +1315,6 @@ static void nbd_config_put(struct nbd_device *nbd)
 
 		nbd->tag_set.timeout = 0;
 		nbd->disk->queue->limits.discard_granularity = 0;
-		nbd->disk->queue->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
 
 		mutex_unlock(&nbd->config_lock);
@@ -1781,7 +1779,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
 	disk->queue->limits.discard_granularity = 0;
-	disk->queue->limits.discard_alignment = 0;
 	blk_queue_max_discard_sectors(disk->queue, 0);
 	blk_queue_max_segment_size(disk->queue, UINT_MAX);
 	blk_queue_max_segments(disk->queue, USHRT_MAX);
-- 
2.30.2


