Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B381B0E4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658601.1027845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEto-0001l1-BD; Thu, 21 Dec 2023 08:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658601.1027845; Thu, 21 Dec 2023 08:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEto-0001eA-6y; Thu, 21 Dec 2023 08:59:24 +0000
Received: by outflank-mailman (input) for mailman id 658601;
 Thu, 21 Dec 2023 08:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MA4=IA=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rGEtn-0001b5-8P
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:59:23 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3771e1d0-9fdf-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:59:17 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SwkrF1Yndz4f3lVp
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 16:59:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 72F301A0AF4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 16:59:14 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDnNw5d_oNlEQPvEA--.24929S5;
 Thu, 21 Dec 2023 16:59:13 +0800 (CST)
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
X-Inumbo-ID: 3771e1d0-9fdf-11ee-9b0f-b553b5be7939
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	hare@suse.de,
	p.raghav@samsung.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v3 for-6.8/block 01/17] block: add some bdev apis
Date: Thu, 21 Dec 2023 16:56:56 +0800
Message-Id: <20231221085712.1766333-2-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDnNw5d_oNlEQPvEA--.24929S5
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWxKrWfCFW8Kw1DKFyrtFb_yoWfGFWfpF
	WUGFy5JrWDG34IgFs2yw47ZrySgw1IyF1fJa43Jryak3yDtr9agF95KF1UArWxtrZ7Ja12
	qFy2vFW8ur1j9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUOR6z
	UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

Those apis will be used for other modules, so that bd_inode won't be
accessed directly from other modules.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/bdev.c           | 148 +++++++++++++++++++++++++++++++++++++++++
 block/blk.h            |   2 -
 include/linux/blkdev.h |  17 +++++
 3 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 750aec178b6a..6204621c6db6 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -89,6 +89,25 @@ void invalidate_bdev(struct block_device *bdev)
 }
 EXPORT_SYMBOL(invalidate_bdev);
 
+/**
+ * invalidate_bdev_pages - Invalidate clean unused buffers and pagecache.
+ * @bdev: the block device which holds the cache to invalidate
+ * @start: the offset 'from' which to invalidate
+ * @end: the offset 'to' which to invalidate (inclusive)
+ *
+ * This function removes pages that are clean, unmapped and unlocked,
+ * as well as shadow entries. It will not block on IO activity.
+ *
+ * If you want to remove all the pages of one block device, regardless of
+ * their use and writeback state, use truncate_bdev_range().
+ */
+void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
+			   pgoff_t end)
+{
+	invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
+}
+EXPORT_SYMBOL_GPL(invalidate_bdev_range);
+
 /*
  * Drop all buffers & page cache for given bdev range. This function bails
  * with error if bdev has other exclusive owner (such as filesystem).
@@ -121,6 +140,7 @@ int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
 					     lstart >> PAGE_SHIFT,
 					     lend >> PAGE_SHIFT);
 }
+EXPORT_SYMBOL_GPL(truncate_bdev_range);
 
 static void set_init_blocksize(struct block_device *bdev)
 {
@@ -1102,3 +1122,131 @@ void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
 
 	blkdev_put_no_open(bdev);
 }
+
+/**
+ * bdev_read_folio - Read into block device page cache.
+ * @bdev: the block device which holds the cache to read.
+ * @pos: the offset that allocated folio will contain.
+ *
+ * Read one page into the block device page cache. If it succeeds, the folio
+ * returned will contain @pos;
+ *
+ * Return: Uptodate folio on success, ERR_PTR() on failure.
+ */
+struct folio *bdev_read_folio(struct block_device *bdev, loff_t pos)
+{
+	return mapping_read_folio_gfp(bdev->bd_inode->i_mapping,
+				      pos >> PAGE_SHIFT, GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(bdev_read_folio);
+
+/**
+ * bdev_get_folio - Find and get a reference to a folio.
+ * @bdev: the block device which holds the address_space to search.
+ * @pos: the offset the returned folio will contain.
+ * @fgp_flags: %FGP flags modify how the folio is returned.
+ * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
+ *
+ * Looks up the page cache entry at @bdev->bd_inode->i_mapping from @pos. If
+ * this function returns a folio, it is returned with an increased refcount.
+ *
+ * Return: The found folio or an ERR_PTR() otherwise.
+ */
+struct folio *bdev_get_folio(struct block_device *bdev, loff_t pos,
+			     fgf_t fgp_flags, gfp_t gfp)
+{
+	return __filemap_get_folio(bdev->bd_inode->i_mapping, pos >> PAGE_SHIFT,
+				   fgp_flags, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_get_folio);
+
+/**
+ * bdev_wb_err_check - Has block device writeback error occurred?
+ * @bdev: the block device to check.
+ * @since: Previously-sampled @bdev->bd_inode->i_mapping->wb_err.
+ *
+ * Grab @bdev->bd_inode->i_mapping->wb_err, and see if it has changed @since
+ * the given value was sampled.
+ *
+ * Return: The latest error or 0 if it hasn't changed.
+ */
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since)
+{
+	return errseq_check(&bdev->bd_inode->i_mapping->wb_err, since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check);
+
+/**
+ * bdev_wb_err_check_and_advance() - Check block device writeback error and
+ * advance to current value.
+ * @bdev: the block device to check;
+ * @since: Pointer to previously-sampled @bdev->bd_inode->i_mapping->wb_err to
+ * check against and advance.
+ *
+ * Grab @bdev->bd_inode->i_mapping->wb_err, and see whether it matches the
+ * value that @since points to. If it does, then just return 0; If it doesn't,
+ * then the value has changed. Set the "seen" flag, and try to swap it into
+ * place as the new eseq value. Then, set that value as the new @since value,
+ * and return whatever the error portion is set to.
+ *
+ * Return: Negative errno if one has been stored, or 0 if no new error has
+ * occurred.
+ */
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since)
+{
+	return errseq_check_and_advance(&bdev->bd_inode->i_mapping->wb_err,
+					since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check_and_advance);
+
+/**
+ * bdev_balance_dirty_pages_ratelimited - balance dirty memory state.
+ * @bdev: the block device which was dirtied.
+ *
+ * Check the system's dirty state and will initiate writeback if needed.
+ */
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev)
+{
+	return balance_dirty_pages_ratelimited(bdev->bd_inode->i_mapping);
+}
+EXPORT_SYMBOL_GPL(bdev_balance_dirty_pages_ratelimited);
+
+/**
+ * bdev_async_readahead - readahead for marked block device pages
+ * @bdev: the block device to read.
+ * @ra: file_ra_state which holds the readahead state.
+ * @file: Used by the filesystem for authentication.
+ * @index: Index of first page to be read.
+ * @req_count: Total number of pages being read by the caller.
+ *
+ * Read multiple pages into the block device page cache. The readahead logic may
+ * decide to piggyback more pages onto the read request if access patterns
+ * suggest it will improve performance.
+ */
+void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
+			 struct file *file, pgoff_t index,
+			 unsigned long req_count)
+{
+	struct file_ra_state tmp_ra = {};
+
+	if (!ra) {
+		ra = &tmp_ra;
+		file_ra_state_init(ra, bdev->bd_inode->i_mapping);
+	}
+	page_cache_sync_readahead(bdev->bd_inode->i_mapping, ra, file, index,
+				  req_count);
+}
+EXPORT_SYMBOL_GPL(bdev_sync_readahead);
+
+/**
+ * bdev_attach_wb - associate an block device with its wb
+ * @bdev: block device of interest
+ *
+ * If @bdev->bd_inode doesn't have its wb, associate it with the wb matching the
+ * %current.
+ */
+void bdev_attach_wb(struct block_device *bdev)
+{
+	inode_attach_wb(bdev->bd_inode, NULL);
+}
+EXPORT_SYMBOL_GPL(bdev_attach_wb);
diff --git a/block/blk.h b/block/blk.h
index 1ef920f72e0f..ce5fcd927eaa 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -465,8 +465,6 @@ extern struct device_attribute dev_attr_events_poll_msecs;
 extern struct attribute_group blk_trace_attr_group;
 
 blk_mode_t file_to_blk_mode(struct file *file);
-int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
-		loff_t lstart, loff_t lend);
 long blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 long compat_blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bc236e77d85e..ccac7d32bb86 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -24,6 +24,7 @@
 #include <linux/sbitmap.h>
 #include <linux/uuid.h>
 #include <linux/xarray.h>
+#include <linux/pagemap.h>
 
 struct module;
 struct request_queue;
@@ -1475,6 +1476,22 @@ struct block_device *blkdev_get_no_open(dev_t dev);
 void blkdev_put_no_open(struct block_device *bdev);
 
 struct block_device *I_BDEV(struct inode *inode);
+void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
+			   pgoff_t end);
+int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
+		loff_t lstart, loff_t lend);
+struct folio *bdev_read_folio(struct block_device *bdev, loff_t pos);
+struct folio *bdev_get_folio(struct block_device *bdev, loff_t pos,
+			     fgf_t fgp_flags, gfp_t gfp);
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since);
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since);
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev);
+void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
+			 struct file *file, pgoff_t index,
+			 unsigned long req_count);
+void bdev_attach_wb(struct block_device *bdev);
+void bdev_associated_mapping(struct block_device *bdev,
+			     struct address_space *mapping);
 
 #ifdef CONFIG_BLOCK
 void invalidate_bdev(struct block_device *bdev);
-- 
2.39.2


