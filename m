Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D7432E42
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212677.370711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZq-0003a5-6g; Tue, 19 Oct 2021 06:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212677.370711; Tue, 19 Oct 2021 06:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZq-0003WB-1T; Tue, 19 Oct 2021 06:26:22 +0000
Received: by outflank-mailman (input) for mailman id 212677;
 Tue, 19 Oct 2021 06:26:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZn-0000gN-SF
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:26:19 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c7c45c5-d2ad-41d1-9a12-3ab7ef7b8ef3;
 Tue, 19 Oct 2021 06:26:04 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZS-000Hcl-En; Tue, 19 Oct 2021 06:25:59 +0000
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
X-Inumbo-ID: 5c7c45c5-d2ad-41d1-9a12-3ab7ef7b8ef3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cXQ4VmbpQdlaz9Fmo/lMgXjRxPhGL2zNDx/ooEcOzSQ=; b=qUTsTibTDXkcY0Wb1gT1F8+GEQ
	wThkDWhya9HN4InkMFj6QODhitCXAaG/43QDQBJ6U3Fjp4vXx/IrMkQsiFzv2I8fLXPbwN0m3O8kW
	3y7sg+bvGJtDcnCctC1+jyXAR6zOLHW5NymOTgpEIeyeU8hCKHAFl5CJ0tdM5s16vvXAFwon35s8K
	gp66mA7cqSS2glu+vSh0xXVKc2bPlHL76YfAPqxfQJhxNi76HMGaYQK5ux9u/m+BsPWuIMULAfEeH
	2uYBjIGbGcMJNj/6YH0HrNfPDFNiBtgXp0j7i6zOLjoJnC3x4oA3ZJcRyztZ5rOI3ll6ebCYToKg6
	5IoYE03A==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH 7/7] block: simplify the block device syncing code
Date: Tue, 19 Oct 2021 08:25:30 +0200
Message-Id: <20211019062530.2174626-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Get rid of the indirections and just provide a sync_bdevs
helper for the generic sync code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c           | 17 ++++++++++++++---
 fs/internal.h          |  6 ------
 fs/sync.c              | 23 ++++-------------------
 include/linux/blkdev.h |  4 ++++
 4 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index fe91209881730..3a8a753f970bb 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1019,7 +1019,7 @@ int __invalidate_device(struct block_device *bdev, bool kill_dirty)
 }
 EXPORT_SYMBOL(__invalidate_device);
 
-void iterate_bdevs(void (*func)(struct block_device *, void *), void *arg)
+void sync_bdevs(bool wait)
 {
 	struct inode *inode, *old_inode = NULL;
 
@@ -1050,8 +1050,19 @@ void iterate_bdevs(void (*func)(struct block_device *, void *), void *arg)
 		bdev = I_BDEV(inode);
 
 		mutex_lock(&bdev->bd_disk->open_mutex);
-		if (bdev->bd_openers)
-			func(bdev, arg);
+		if (!bdev->bd_openers) {
+			; /* skip */
+		} else if (wait) {
+			/*
+			 * We keep the error status of individual mapping so
+			 * that applications can catch the writeback error using
+			 * fsync(2). See filemap_fdatawait_keep_errors() for
+			 * details.
+			 */
+			filemap_fdatawait_keep_errors(inode->i_mapping);
+		} else {
+			filemap_fdatawrite(inode->i_mapping);
+		}
 		mutex_unlock(&bdev->bd_disk->open_mutex);
 
 		spin_lock(&blockdev_superblock->s_inode_list_lock);
diff --git a/fs/internal.h b/fs/internal.h
index b5caa16f4645d..cdd83d4899bb3 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -23,17 +23,11 @@ struct pipe_inode_info;
 #ifdef CONFIG_BLOCK
 extern void __init bdev_cache_init(void);
 
-void iterate_bdevs(void (*)(struct block_device *, void *), void *);
 void emergency_thaw_bdev(struct super_block *sb);
 #else
 static inline void bdev_cache_init(void)
 {
 }
-
-static inline void iterate_bdevs(void (*f)(struct block_device *, void *),
-		void *arg)
-{
-}
 static inline int emergency_thaw_bdev(struct super_block *sb)
 {
 	return 0;
diff --git a/fs/sync.c b/fs/sync.c
index a621089eb07ee..3ce8e2137f310 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -78,21 +78,6 @@ static void sync_fs_one_sb(struct super_block *sb, void *arg)
 		sb->s_op->sync_fs(sb, *(int *)arg);
 }
 
-static void fdatawrite_one_bdev(struct block_device *bdev, void *arg)
-{
-	filemap_fdatawrite(bdev->bd_inode->i_mapping);
-}
-
-static void fdatawait_one_bdev(struct block_device *bdev, void *arg)
-{
-	/*
-	 * We keep the error status of individual mapping so that
-	 * applications can catch the writeback error using fsync(2).
-	 * See filemap_fdatawait_keep_errors() for details.
-	 */
-	filemap_fdatawait_keep_errors(bdev->bd_inode->i_mapping);
-}
-
 /*
  * Sync everything. We start by waking flusher threads so that most of
  * writeback runs on all devices in parallel. Then we sync all inodes reliably
@@ -111,8 +96,8 @@ void ksys_sync(void)
 	iterate_supers(sync_inodes_one_sb, NULL);
 	iterate_supers(sync_fs_one_sb, &nowait);
 	iterate_supers(sync_fs_one_sb, &wait);
-	iterate_bdevs(fdatawrite_one_bdev, NULL);
-	iterate_bdevs(fdatawait_one_bdev, NULL);
+	sync_bdevs(false);
+	sync_bdevs(true);
 	if (unlikely(laptop_mode))
 		laptop_sync_completion();
 }
@@ -133,10 +118,10 @@ static void do_sync_work(struct work_struct *work)
 	 */
 	iterate_supers(sync_inodes_one_sb, &nowait);
 	iterate_supers(sync_fs_one_sb, &nowait);
-	iterate_bdevs(fdatawrite_one_bdev, NULL);
+	sync_bdevs(false);
 	iterate_supers(sync_inodes_one_sb, &nowait);
 	iterate_supers(sync_fs_one_sb, &nowait);
-	iterate_bdevs(fdatawrite_one_bdev, NULL);
+	sync_bdevs(false);
 	printk("Emergency Sync complete\n");
 	kfree(work);
 }
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 67a3b9e04233f..4bb9c621e0ac3 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1286,6 +1286,7 @@ int truncate_bdev_range(struct block_device *bdev, fmode_t mode, loff_t lstart,
 void invalidate_bdev(struct block_device *bdev);
 int sync_blockdev(struct block_device *bdev);
 int sync_blockdev_nowait(struct block_device *bdev);
+void sync_bdevs(bool wait);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
 {
@@ -1298,6 +1299,9 @@ static inline int sync_blockdev_nowait(struct block_device *bdev)
 {
 	return 0;
 }
+static inline void sync_bdevs(bool wait)
+{
+}
 #endif
 int fsync_bdev(struct block_device *bdev);
 
-- 
2.30.2


