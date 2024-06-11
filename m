Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1C902FFE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737596.1144001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvM-00077h-IJ; Tue, 11 Jun 2024 05:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737596.1144001; Tue, 11 Jun 2024 05:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvM-00074j-EU; Tue, 11 Jun 2024 05:20:00 +0000
Received: by outflank-mailman (input) for mailman id 737596;
 Tue, 11 Jun 2024 05:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtvL-0006Mb-0Y
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:19:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5b5cb7-27b2-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 07:19:58 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtv4-00000007QqN-2LdZ; Tue, 11 Jun 2024 05:19:42 +0000
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
X-Inumbo-ID: 3e5b5cb7-27b2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/rZOEnnB7Ck+WcvkswrD5CLavDNj5FzzjxdVzwDte5o=; b=WiVjV03MdppIPPUHNpSsnAOswF
	ZzMT4QsJKrqeWjtewh91sTq17Q4mo/C/OnhzWIHeo3L6EpP/u5Gsw2y5ZNZfc7s43LyqK4sDE1FpG
	n1CGW9hR1hsCjP39wbq7dK7SQZcyfIub4k/1gShQl6ug5pyEmBvaRSdlHDbKv6EQUFXWG9X2Kzvcy
	zRMbflEfBG9QqO9Hao0c27BB16ZyEsohd1SqZIqSoJ2Ac8A6Z5CwEpmzXHO5aP1ywzKVK6Fios+k2
	5kTJ0aXnUDA7DWdvI+0EcSX4K7nERHV9k7gUQZmoCHBh5G3C3UOTx9SpD50hTrGhUjyYp0My1+kjg
	Nmuwb5EA==;
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
Subject: [PATCH 04/26] loop: always update discard settings in loop_reconfigure_limits
Date: Tue, 11 Jun 2024 07:19:04 +0200
Message-ID: <20240611051929.513387-5-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Simplify loop_reconfigure_limits by always updating the discard limits.
This adds a little more work to loop_set_block_size, but doesn't change
the outcome as the discard flag won't change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 93a49c40a31a71..c658282454af1b 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -975,8 +975,7 @@ loop_set_status_from_info(struct loop_device *lo,
 	return 0;
 }
 
-static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize,
-		bool update_discard_settings)
+static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
 	struct queue_limits lim;
 
@@ -984,8 +983,7 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize,
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
 	lim.io_min = bsize;
-	if (update_discard_settings)
-		loop_config_discard(lo, &lim);
+	loop_config_discard(lo, &lim);
 	return queue_limits_commit_update(lo->lo_queue, &lim);
 }
 
@@ -1086,7 +1084,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	else
 		bsize = 512;
 
-	error = loop_reconfigure_limits(lo, bsize, true);
+	error = loop_reconfigure_limits(lo, bsize);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
@@ -1496,7 +1494,7 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	invalidate_bdev(lo->lo_device);
 
 	blk_mq_freeze_queue(lo->lo_queue);
-	err = loop_reconfigure_limits(lo, arg, false);
+	err = loop_reconfigure_limits(lo, arg);
 	loop_update_dio(lo);
 	blk_mq_unfreeze_queue(lo->lo_queue);
 
-- 
2.43.0


