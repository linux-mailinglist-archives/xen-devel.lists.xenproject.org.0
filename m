Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA8432E3D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212665.370656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZQ-0001Ku-Cp; Tue, 19 Oct 2021 06:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212665.370656; Tue, 19 Oct 2021 06:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZQ-0001HK-92; Tue, 19 Oct 2021 06:25:56 +0000
Received: by outflank-mailman (input) for mailman id 212665;
 Tue, 19 Oct 2021 06:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZO-0000gN-Rb
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:25:54 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdfd2b1c-e8d1-4f43-a210-76b089f72276;
 Tue, 19 Oct 2021 06:25:47 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZA-000HXw-Kb; Tue, 19 Oct 2021 06:25:41 +0000
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
X-Inumbo-ID: cdfd2b1c-e8d1-4f43-a210-76b089f72276
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qVMoniHT8GUK08EKnqJv740ihac5REoeu/3MYlJep7k=; b=cw2FWZNlpqBbTB4MdfrasfcoUP
	hUXTb6YdSKVLbQQq5eq430vJY21sLDtE7E/fqW8XCzN/7rd1aMelUYKnYJJyq0OMnL7oJXKYp3wxp
	awNLC3EsynFT5xrA8pjbHlCqxZ38emcM3sTu81z5wMUZST+8cgygormZJBzcf63vEZ/yGJlgd5pnN
	GpS9wQsLQwP2mGW0h+tuegGOgkoEy/3dqOYnf4RZ7VH8QA5mnRhj45NvYZU+Qi8DL3mdw2eL5tLHv
	FdqYrW/ugsdtsecu3mt1hMj3j9CxRLO5QmmR0VKHNLcUpUiujUAsI5/Z6wXq4l78AW6B4J2S60/UM
	VIWW6FpA==;
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
Subject: [PATCH 2/7] block: remove __sync_blockdev
Date: Tue, 19 Oct 2021 08:25:25 +0200
Message-Id: <20211019062530.2174626-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Instead offer a new sync_blockdev_nowait helper for the !wait case.
This new helper is exported as it will grow modular callers in a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c           | 11 ++++++-----
 fs/internal.h          |  5 -----
 fs/sync.c              |  7 ++++---
 include/linux/blkdev.h |  5 +++++
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cff0bb3a4578f..fe91209881730 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -185,14 +185,13 @@ int sb_min_blocksize(struct super_block *sb, int size)
 
 EXPORT_SYMBOL(sb_min_blocksize);
 
-int __sync_blockdev(struct block_device *bdev, int wait)
+int sync_blockdev_nowait(struct block_device *bdev)
 {
 	if (!bdev)
 		return 0;
-	if (!wait)
-		return filemap_flush(bdev->bd_inode->i_mapping);
-	return filemap_write_and_wait(bdev->bd_inode->i_mapping);
+	return filemap_flush(bdev->bd_inode->i_mapping);
 }
+EXPORT_SYMBOL_GPL(sync_blockdev_nowait);
 
 /*
  * Write out and wait upon all the dirty data associated with a block
@@ -200,7 +199,9 @@ int __sync_blockdev(struct block_device *bdev, int wait)
  */
 int sync_blockdev(struct block_device *bdev)
 {
-	return __sync_blockdev(bdev, 1);
+	if (!bdev)
+		return 0;
+	return filemap_write_and_wait(bdev->bd_inode->i_mapping);
 }
 EXPORT_SYMBOL(sync_blockdev);
 
diff --git a/fs/internal.h b/fs/internal.h
index 3cd065c8a66b4..b5caa16f4645d 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -23,7 +23,6 @@ struct pipe_inode_info;
 #ifdef CONFIG_BLOCK
 extern void __init bdev_cache_init(void);
 
-extern int __sync_blockdev(struct block_device *bdev, int wait);
 void iterate_bdevs(void (*)(struct block_device *, void *), void *);
 void emergency_thaw_bdev(struct super_block *sb);
 #else
@@ -31,10 +30,6 @@ static inline void bdev_cache_init(void)
 {
 }
 
-static inline int __sync_blockdev(struct block_device *bdev, int wait)
-{
-	return 0;
-}
 static inline void iterate_bdevs(void (*f)(struct block_device *, void *),
 		void *arg)
 {
diff --git a/fs/sync.c b/fs/sync.c
index 0d6cdc507cb98..a621089eb07ee 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -3,6 +3,7 @@
  * High-level sync()-related operations
  */
 
+#include <linux/blkdev.h>
 #include <linux/kernel.h>
 #include <linux/file.h>
 #include <linux/fs.h>
@@ -45,7 +46,7 @@ int sync_filesystem(struct super_block *sb)
 	/*
 	 * Do the filesystem syncing work.  For simple filesystems
 	 * writeback_inodes_sb(sb) just dirties buffers with inodes so we have
-	 * to submit I/O for these buffers via __sync_blockdev().  This also
+	 * to submit I/O for these buffers via sync_blockdev().  This also
 	 * speeds up the wait == 1 case since in that case write_inode()
 	 * methods call sync_dirty_buffer() and thus effectively write one block
 	 * at a time.
@@ -53,14 +54,14 @@ int sync_filesystem(struct super_block *sb)
 	writeback_inodes_sb(sb, WB_REASON_SYNC);
 	if (sb->s_op->sync_fs)
 		sb->s_op->sync_fs(sb, 0);
-	ret = __sync_blockdev(sb->s_bdev, 0);
+	ret = sync_blockdev_nowait(sb->s_bdev);
 	if (ret < 0)
 		return ret;
 
 	sync_inodes_sb(sb);
 	if (sb->s_op->sync_fs)
 		sb->s_op->sync_fs(sb, 1);
-	return __sync_blockdev(sb->s_bdev, 1);
+	return sync_blockdev(sb->s_bdev);
 }
 EXPORT_SYMBOL(sync_filesystem);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index fd9771a1da096..67a3b9e04233f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1285,6 +1285,7 @@ int truncate_bdev_range(struct block_device *bdev, fmode_t mode, loff_t lstart,
 #ifdef CONFIG_BLOCK
 void invalidate_bdev(struct block_device *bdev);
 int sync_blockdev(struct block_device *bdev);
+int sync_blockdev_nowait(struct block_device *bdev);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
 {
@@ -1293,6 +1294,10 @@ static inline int sync_blockdev(struct block_device *bdev)
 {
 	return 0;
 }
+static inline int sync_blockdev_nowait(struct block_device *bdev)
+{
+	return 0;
+}
 #endif
 int fsync_bdev(struct block_device *bdev);
 
-- 
2.30.2


