Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FF2B795B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29477.58959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJA8-0007vC-Jm; Wed, 18 Nov 2020 08:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29477.58959; Wed, 18 Nov 2020 08:50:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJA8-0007uj-Ga; Wed, 18 Nov 2020 08:50:00 +0000
Received: by outflank-mailman (input) for mailman id 29477;
 Wed, 18 Nov 2020 08:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ9R-0006e0-36
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:17 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 803a142a-5aa8-451f-aa48-d8204aa489ba;
 Wed, 18 Nov 2020 08:48:31 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8V-0007m0-4B; Wed, 18 Nov 2020 08:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ9R-0006e0-36
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:17 +0000
X-Inumbo-ID: 803a142a-5aa8-451f-aa48-d8204aa489ba
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 803a142a-5aa8-451f-aa48-d8204aa489ba;
	Wed, 18 Nov 2020 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Hm2+pi+4EcUeDYOHdyHUHSpCkqg13LYEV8plE6Pffx8=; b=F+OqFDrimZDfU9oJC3NE+WAnBj
	7NLGpAAHAxBrMkgV1jR3eCykIQBIYIkgtzV298VqK/hLnjFuqPQGLtD2serG/rjdABz8On3RjiItS
	jkjRT9VHC9QKxUb1fSffe1v27SEXnA5UA7cfOhezqYd+B8+1RmQrgFitIopZN9HgcU4BlpENM55mc
	SmJfzHiBAgDUmmdfkk8wpbWRoWTnUjgqAObiihN+jvvcuIIiGzIpd+Z4cEyFPI9BuVali3hgqEbEh
	14dcstmz4K2XoTMFEhD0nljib+tsh8e84xtfzcg1rp0zf4RvjCV27VRRqa3U1Ob0Zbm1BuetfFb0V
	DB31SJ8A==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8V-0007m0-4B; Wed, 18 Nov 2020 08:48:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 10/20] block: refactor __blkdev_put
Date: Wed, 18 Nov 2020 09:47:50 +0100
Message-Id: <20201118084800.2339180-11-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Reorder the code to have one big section for the last close, and to use
bdev_is_partition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 29db12c3bb501c..4c4d6c30382c06 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1745,22 +1745,22 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 		WARN_ON_ONCE(bdev->bd_holders);
 		sync_blockdev(bdev);
 		kill_bdev(bdev);
-
 		bdev_write_inode(bdev);
-	}
-	if (bdev->bd_contains == bdev) {
-		if (disk->fops->release)
+
+		if (!bdev_is_partition(bdev) && disk->fops->release)
 			disk->fops->release(disk, mode);
-	}
-	if (!bdev->bd_openers) {
+
 		disk_put_part(bdev->bd_part);
 		bdev->bd_part = NULL;
 		bdev->bd_disk = NULL;
-		if (bdev != bdev->bd_contains)
+		if (bdev_is_partition(bdev))
 			victim = bdev->bd_contains;
 		bdev->bd_contains = NULL;
 
 		put_disk_and_module(disk);
+	} else {
+		if (!bdev_is_partition(bdev) && disk->fops->release)
+			disk->fops->release(disk, mode);
 	}
 	mutex_unlock(&bdev->bd_mutex);
 	bdput(bdev);
-- 
2.29.2


