Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D121805477
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 13:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647745.1011348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUhK-0003fU-M6; Tue, 05 Dec 2023 12:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647745.1011348; Tue, 05 Dec 2023 12:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUhK-0003bS-Il; Tue, 05 Dec 2023 12:38:46 +0000
Received: by outflank-mailman (input) for mailman id 647745;
 Tue, 05 Dec 2023 12:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQhx=HQ=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rAUhJ-00035R-Iu
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 12:38:45 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d688c0-936b-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 13:38:41 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sl0Sj4lhDz4f3lDT
 for <xen-devel@lists.xenproject.org>; Tue,  5 Dec 2023 20:38:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 5C53D1A0A42
 for <xen-devel@lists.xenproject.org>; Tue,  5 Dec 2023 20:38:34 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDnNw7GGW9lr8E8Cw--.35507S5;
 Tue, 05 Dec 2023 20:38:33 +0800 (CST)
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
X-Inumbo-ID: 35d688c0-936b-11ee-98e5-6d05b1d4d9a1
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
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
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
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH -next RFC 01/14] block: add some bdev apis
Date: Tue,  5 Dec 2023 20:37:15 +0800
Message-Id: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDnNw7GGW9lr8E8Cw--.35507S5
X-Coremail-Antispam: 1UD129KBjvJXoW3GrykCryfur18GF48Cw1xXwb_yoW3tF48pF
	yUKa45JrWUGr1Igrs2yw43Zr1agw10k3WxZa4xA34Yk3yktrn2gF95Kw1UArWSqrWkAFZr
	XFW3ZrWxur1jkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULXo7U
	UUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

Those apis will be used for other modules, so that bd_inode won't be
accessed directly from other modules.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/bdev.c           | 116 +++++++++++++++++++++++++++++++++++++++++
 block/bio.c            |   1 +
 block/blk.h            |   2 -
 include/linux/blkdev.h |  27 ++++++++++
 4 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 6f73b02d549c..fcba5c1bd113 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -92,6 +92,13 @@ void invalidate_bdev(struct block_device *bdev)
 }
 EXPORT_SYMBOL(invalidate_bdev);
 
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
@@ -124,6 +131,7 @@ int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
 					     lstart >> PAGE_SHIFT,
 					     lend >> PAGE_SHIFT);
 }
+EXPORT_SYMBOL_GPL(truncate_bdev_range);
 
 static void set_init_blocksize(struct block_device *bdev)
 {
@@ -138,6 +146,18 @@ static void set_init_blocksize(struct block_device *bdev)
 	bdev->bd_inode->i_blkbits = blksize_bits(bsize);
 }
 
+loff_t bdev_size(struct block_device *bdev)
+{
+	loff_t size;
+
+	spin_lock(&bdev->bd_size_lock);
+	size = i_size_read(bdev->bd_inode);
+	spin_unlock(&bdev->bd_size_lock);
+
+	return size;
+}
+EXPORT_SYMBOL_GPL(bdev_size);
+
 int set_blocksize(struct block_device *bdev, int size)
 {
 	/* Size must be a power of two, and between 512 and PAGE_SIZE */
@@ -1144,3 +1164,99 @@ static int __init setup_bdev_allow_write_mounted(char *str)
 	return 1;
 }
 __setup("bdev_allow_write_mounted=", setup_bdev_allow_write_mounted);
+
+struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index)
+{
+	return read_mapping_folio(bdev->bd_inode->i_mapping, index, NULL);
+}
+EXPORT_SYMBOL_GPL(bdev_read_folio);
+
+struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
+				  gfp_t gfp)
+{
+	return mapping_read_folio_gfp(bdev->bd_inode->i_mapping, index, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_read_folio_gfp);
+
+struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index)
+{
+	return filemap_get_folio(bdev->bd_inode->i_mapping, index);
+}
+EXPORT_SYMBOL_GPL(bdev_get_folio);
+
+struct folio *bdev_find_or_create_folio(struct block_device *bdev,
+					pgoff_t index, gfp_t gfp)
+{
+	return __filemap_get_folio(bdev->bd_inode->i_mapping, index,
+				   FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_find_or_create_folio);
+
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since)
+{
+	return errseq_check(&bdev->bd_inode->i_mapping->wb_err, since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check);
+
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since)
+{
+	return errseq_check_and_advance(&bdev->bd_inode->i_mapping->wb_err,
+					since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check_and_advance);
+
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev)
+{
+	return balance_dirty_pages_ratelimited(bdev->bd_inode->i_mapping);
+}
+EXPORT_SYMBOL_GPL(bdev_balance_dirty_pages_ratelimited);
+
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
+void bdev_attach_wb(struct block_device *bdev)
+{
+	inode_attach_wb(bdev->bd_inode, NULL);
+}
+EXPORT_SYMBOL_GPL(bdev_attach_wb);
+
+void bdev_correlate_mapping(struct block_device *bdev,
+			    struct address_space *mapping)
+{
+	mapping->host = bdev->bd_inode;
+}
+EXPORT_SYMBOL_GPL(bdev_correlate_mapping);
+
+gfp_t bdev_gfp_constraint(struct block_device *bdev, gfp_t gfp)
+{
+	return mapping_gfp_constraint(bdev->bd_inode->i_mapping, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_gfp_constraint);
+
+/*
+ * The del_gendisk() function uninitializes the disk-specific data
+ * structures, including the bdi structure, without telling anyone
+ * else.  Once this happens, any attempt to call mark_buffer_dirty()
+ * (for example, by ext4_commit_super), will cause a kernel OOPS.
+ * This is a kludge to prevent these oops until we can put in a proper
+ * hook in del_gendisk() to inform the VFS and file system layers.
+ */
+int bdev_ejected(struct block_device *bdev)
+{
+	struct backing_dev_info *bdi = inode_to_bdi(bdev->bd_inode);
+
+	return bdi->dev == NULL;
+}
+EXPORT_SYMBOL_GPL(bdev_ejected);
diff --git a/block/bio.c b/block/bio.c
index 816d412c06e9..f7123ad9b4ee 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1119,6 +1119,7 @@ void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
 	WARN_ON_ONCE(off > UINT_MAX);
 	__bio_add_page(bio, &folio->page, len, off);
 }
+EXPORT_SYMBOL_GPL(bio_add_folio_nofail);
 
 /**
  * bio_add_folio - Attempt to add part of a folio to a bio.
diff --git a/block/blk.h b/block/blk.h
index 08a358bc0919..da4becd4f7e9 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -467,8 +467,6 @@ extern struct device_attribute dev_attr_events_poll_msecs;
 extern struct attribute_group blk_trace_attr_group;
 
 blk_mode_t file_to_blk_mode(struct file *file);
-int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
-		loff_t lstart, loff_t lend);
 long blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 long compat_blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3f8a21cd9233..a55db77274a4 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1342,6 +1342,11 @@ static inline unsigned int block_size(struct block_device *bdev)
 	return 1 << bdev->bd_inode->i_blkbits;
 }
 
+static inline u8 block_bits(struct block_device *bdev)
+{
+	return bdev->bd_inode->i_blkbits;
+}
+
 int kblockd_schedule_work(struct work_struct *work);
 int kblockd_mod_delayed_work_on(int cpu, struct delayed_work *dwork, unsigned long delay);
 
@@ -1515,6 +1520,28 @@ struct block_device *blkdev_get_no_open(dev_t dev);
 void blkdev_put_no_open(struct block_device *bdev);
 
 struct block_device *I_BDEV(struct inode *inode);
+loff_t bdev_size(struct block_device *bdev);
+void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
+			   pgoff_t end);
+int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
+		loff_t lstart, loff_t lend);
+struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index);
+struct folio *bdev_find_or_create_folio(struct block_device *bdev,
+					pgoff_t index, gfp_t gfp);
+struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index);
+struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
+				  gfp_t gfp);
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since);
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since);
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev);
+void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
+			 struct file *file, pgoff_t index,
+			 unsigned long req_count);
+void bdev_attach_wb(struct block_device *bdev);
+void bdev_correlate_mapping(struct block_device *bdev,
+			    struct address_space *mapping);
+gfp_t bdev_gfp_constraint(struct block_device *bdev, gfp_t gfp);
+int bdev_ejected(struct block_device *bdev);
 
 #ifdef CONFIG_BLOCK
 void invalidate_bdev(struct block_device *bdev);
-- 
2.39.2


