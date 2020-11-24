Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175FE2C2841
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36130.67950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYYL-0004PE-Ty; Tue, 24 Nov 2020 13:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36130.67950; Tue, 24 Nov 2020 13:40:17 +0000
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
	id 1khYYL-0004NI-L5; Tue, 24 Nov 2020 13:40:17 +0000
Received: by outflank-mailman (input) for mailman id 36130;
 Tue, 24 Nov 2020 13:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYP6-0000Qf-4b
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:30:44 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac69b391-4604-41e3-b476-dba3f133e5c8;
 Tue, 24 Nov 2020 13:28:56 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYN8-0006dt-TQ; Tue, 24 Nov 2020 13:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYP6-0000Qf-4b
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:30:44 +0000
X-Inumbo-ID: ac69b391-4604-41e3-b476-dba3f133e5c8
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ac69b391-4604-41e3-b476-dba3f133e5c8;
	Tue, 24 Nov 2020 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s2bj0ka9tzVXa7iO1xuCgon+nWLgrfiF05EXz6Wq7iQ=; b=jo7jitVZLk7dE0nFi35W7LDPJN
	tFqdEul2zhhIuA5tOCbi5aycGTNvy8TrCwjvdqjWRV+CbsHXj1uHR9YGBIHpgX5k1OrWEEjG1OBGS
	05uqltCoKW08gYj1Exy9DRh4S20GKqktTwAhDBgXdpa6tr3gbKlx7crJ/yMgRgYb5bj1t1DPrZcGR
	/hwdibm8NOcUYLKg0vLiJpGjPeRHco2g+1GJeSTgoyu6wnqw78bcOPXI+iGIr/LCTqUZw/z9tv92S
	lld+DSHqPLq7Hfkngg8JscAjZbW0u/H0x3XHbCsyaVQZAi5fsRHdRkbzm4rSxa6gS65lVwxUXtiGV
	AvXj9emg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYN8-0006dt-TQ; Tue, 24 Nov 2020 13:28:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 29/45] block: initialize struct block_device in bdev_alloc
Date: Tue, 24 Nov 2020 14:27:35 +0100
Message-Id: <20201124132751.3747337-30-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Don't play tricks with slab constructors as bdev structures tends to not
get reused very much, and this makes the code a lot less error prone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 43a0fda982c879..1e5c6d0eb92677 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -784,20 +784,11 @@ static void bdev_free_inode(struct inode *inode)
 	kmem_cache_free(bdev_cachep, BDEV_I(inode));
 }
 
-static void init_once(void *foo)
+static void init_once(void *data)
 {
-	struct bdev_inode *ei = (struct bdev_inode *) foo;
-	struct block_device *bdev = &ei->bdev;
+	struct bdev_inode *ei = data;
 
-	memset(bdev, 0, sizeof(*bdev));
-	mutex_init(&bdev->bd_mutex);
-#ifdef CONFIG_SYSFS
-	INIT_LIST_HEAD(&bdev->bd_holder_disks);
-#endif
-	bdev->bd_bdi = &noop_backing_dev_info;
 	inode_init_once(&ei->vfs_inode);
-	/* Initialize mutex for freeze. */
-	mutex_init(&bdev->bd_fsfreeze_mutex);
 }
 
 static void bdev_evict_inode(struct inode *inode)
@@ -872,12 +863,17 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	inode->i_data.a_ops = &def_blk_aops;
 
 	bdev = I_BDEV(inode);
+	memset(bdev, 0, sizeof(*bdev));
+	mutex_init(&bdev->bd_mutex);
+	mutex_init(&bdev->bd_fsfreeze_mutex);
 	spin_lock_init(&bdev->bd_size_lock);
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
-	bdev->bd_super = NULL;
 	bdev->bd_inode = inode;
-	bdev->bd_part_count = 0;
+	bdev->bd_bdi = &noop_backing_dev_info;
+#ifdef CONFIG_SYSFS
+	INIT_LIST_HEAD(&bdev->bd_holder_disks);
+#endif
 	return bdev;
 }
 
-- 
2.29.2


