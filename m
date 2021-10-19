Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60576432E3F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212664.370644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZL-0000za-2C; Tue, 19 Oct 2021 06:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212664.370644; Tue, 19 Oct 2021 06:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZK-0000xI-VG; Tue, 19 Oct 2021 06:25:50 +0000
Received: by outflank-mailman (input) for mailman id 212664;
 Tue, 19 Oct 2021 06:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZJ-0000gN-Rd
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:25:49 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 329376dc-21d6-498e-b3be-65ee5089e3df;
 Tue, 19 Oct 2021 06:25:43 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZ6-000HXN-ET; Tue, 19 Oct 2021 06:25:37 +0000
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
X-Inumbo-ID: 329376dc-21d6-498e-b3be-65ee5089e3df
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gFwPkwP9Zjsq1mqO3JahAc353BRcOUUl+PLqpsO72YI=; b=ZJW8aR8ndzAoILXJIyVOCHqhpJ
	ajMm/Ex3wKHJjPYAwkuWxVnN1ZhdLhRhrXsne7qfmZhPB7qgvjjNYCDO7FZ12EIoWigLug1zframs
	UBRixzbC81D0BL6MTo57Bq8G5/80zrEGJP7GFMWpKQtxi9CECpBnZJoXTHrn47Bce+ERZbkXLhAyY
	j5Yhf3yuHwHV/0O2mMEJ/nX6vwinouMvFWYzZ7f+gPpOqrZa5bdHTCDN1w1kF1hYq2uX2liHkPDSv
	inlHv0JYz9UWiqQw0mjEOiKX6X+poiKU7uiX6FUJ3QwZba9uou3CnATYwJyCONmS0KgeT7kpKCpq2
	O49/xozg==;
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
Subject: [PATCH 1/7] fs: remove __sync_filesystem
Date: Tue, 19 Oct 2021 08:25:24 +0200
Message-Id: <20211019062530.2174626-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

There is no clear benefit in having this helper vs just open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/sync.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/fs/sync.c b/fs/sync.c
index 1373a610dc784..0d6cdc507cb98 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -21,25 +21,6 @@
 #define VALID_FLAGS (SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE| \
 			SYNC_FILE_RANGE_WAIT_AFTER)
 
-/*
- * Do the filesystem syncing work. For simple filesystems
- * writeback_inodes_sb(sb) just dirties buffers with inodes so we have to
- * submit IO for these buffers via __sync_blockdev(). This also speeds up the
- * wait == 1 case since in that case write_inode() functions do
- * sync_dirty_buffer() and thus effectively write one block at a time.
- */
-static int __sync_filesystem(struct super_block *sb, int wait)
-{
-	if (wait)
-		sync_inodes_sb(sb);
-	else
-		writeback_inodes_sb(sb, WB_REASON_SYNC);
-
-	if (sb->s_op->sync_fs)
-		sb->s_op->sync_fs(sb, wait);
-	return __sync_blockdev(sb->s_bdev, wait);
-}
-
 /*
  * Write out and wait upon all dirty data associated with this
  * superblock.  Filesystem data as well as the underlying block
@@ -61,10 +42,25 @@ int sync_filesystem(struct super_block *sb)
 	if (sb_rdonly(sb))
 		return 0;
 
-	ret = __sync_filesystem(sb, 0);
+	/*
+	 * Do the filesystem syncing work.  For simple filesystems
+	 * writeback_inodes_sb(sb) just dirties buffers with inodes so we have
+	 * to submit I/O for these buffers via __sync_blockdev().  This also
+	 * speeds up the wait == 1 case since in that case write_inode()
+	 * methods call sync_dirty_buffer() and thus effectively write one block
+	 * at a time.
+	 */
+	writeback_inodes_sb(sb, WB_REASON_SYNC);
+	if (sb->s_op->sync_fs)
+		sb->s_op->sync_fs(sb, 0);
+	ret = __sync_blockdev(sb->s_bdev, 0);
 	if (ret < 0)
 		return ret;
-	return __sync_filesystem(sb, 1);
+
+	sync_inodes_sb(sb);
+	if (sb->s_op->sync_fs)
+		sb->s_op->sync_fs(sb, 1);
+	return __sync_blockdev(sb->s_bdev, 1);
 }
 EXPORT_SYMBOL(sync_filesystem);
 
-- 
2.30.2


