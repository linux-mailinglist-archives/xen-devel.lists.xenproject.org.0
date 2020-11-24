Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F326F2C2866
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36244.68251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYZK-0006u5-UH; Tue, 24 Nov 2020 13:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36244.68251; Tue, 24 Nov 2020 13:41:18 +0000
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
	id 1khYZK-0006ov-B1; Tue, 24 Nov 2020 13:41:18 +0000
Received: by outflank-mailman (input) for mailman id 36244;
 Tue, 24 Nov 2020 13:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYQi-0000Qf-7e
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:32:24 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08250f10-ed3b-4acd-8142-aaba6d8fc385;
 Tue, 24 Nov 2020 13:29:25 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNL-0006gB-5u; Tue, 24 Nov 2020 13:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYQi-0000Qf-7e
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:32:24 +0000
X-Inumbo-ID: 08250f10-ed3b-4acd-8142-aaba6d8fc385
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 08250f10-ed3b-4acd-8142-aaba6d8fc385;
	Tue, 24 Nov 2020 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NGuMWbj7Hg5v+XoGXrw8eAVP/9gQlmCuUHhC+WDsnSI=; b=PtqbLTmGvI72SjOaseMqSoUl08
	gFij7fODIcUn1AJw6NyQEnXxMGhEqSJFQy0SK4i3BUfbpHfHaY3GadtPW1NFaHMUjuNEmqhI0LbEX
	MDKB13JlP2H1i8AWUXFcdqYryFwg224s1J+kcQt8ldbQri7UgunhmVOGWvbhExv8yF9MRqSOMF6h3
	FlrR3d7hwat2bwzeIiKvec23VdKPbe5SzrxAR+SzOup8yf23yYwFxKQToCC/mG2C7FXd/jomuQUnv
	o5egXoePz+VBB5OEp8ToM4bxj28Lgm60oHM8nynmakiBtLGQVXJLY0Gt3Y1sYS6SWivIcYOgdK6PG
	xUfcTHZQ==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYNL-0006gB-5u; Tue, 24 Nov 2020 13:28:55 +0000
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
Subject: [PATCH 36/45] block: move the policy field to struct block_device
Date: Tue, 24 Nov 2020 14:27:42 +0100
Message-Id: <20201124132751.3747337-37-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Move the policy field to struct block_device and rename it to the
more descriptive bd_read_only.  Also turn the field into a bool as it
is used as such.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 2 +-
 block/genhd.c             | 8 ++++----
 block/ioctl.c             | 2 +-
 block/partitions/core.c   | 4 ++--
 include/linux/blk_types.h | 1 +
 include/linux/genhd.h     | 4 ++--
 6 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9121390be97a76..d64ffcb6f9ae5d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -696,7 +696,7 @@ static inline bool bio_check_ro(struct bio *bio, struct hd_struct *part)
 {
 	const int op = bio_op(bio);
 
-	if (part->policy && op_is_write(op)) {
+	if (part->bdev->bd_read_only && op_is_write(op)) {
 		char b[BDEVNAME_SIZE];
 
 		if (op_is_flush(bio->bi_opf) && !bio_sectors(bio))
diff --git a/block/genhd.c b/block/genhd.c
index 8c734a4e8ff31c..8aed77cc8ad169 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1671,14 +1671,14 @@ void set_disk_ro(struct gendisk *disk, int flag)
 	struct disk_part_iter piter;
 	struct hd_struct *part;
 
-	if (disk->part0.policy != flag) {
+	if (disk->part0.bdev->bd_read_only != flag) {
 		set_disk_ro_uevent(disk, flag);
-		disk->part0.policy = flag;
+		disk->part0.bdev->bd_read_only = flag;
 	}
 
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter)))
-		part->policy = flag;
+		part->bdev->bd_read_only = flag;
 	disk_part_iter_exit(&piter);
 }
 
@@ -1688,7 +1688,7 @@ int bdev_read_only(struct block_device *bdev)
 {
 	if (!bdev)
 		return 0;
-	return bdev->bd_part->policy;
+	return bdev->bd_read_only;
 }
 
 EXPORT_SYMBOL(bdev_read_only);
diff --git a/block/ioctl.c b/block/ioctl.c
index a6d8171221c7dc..d61d652078f41c 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -345,7 +345,7 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		if (ret)
 			return ret;
 	}
-	bdev->bd_part->policy = n;
+	bdev->bd_read_only = n;
 	return 0;
 }
 
diff --git a/block/partitions/core.c b/block/partitions/core.c
index ff60a14ed4dcdd..fd00428e437a63 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -199,7 +199,7 @@ static ssize_t part_ro_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	struct hd_struct *p = dev_to_part(dev);
-	return sprintf(buf, "%d\n", p->policy ? 1 : 0);
+	return sprintf(buf, "%d\n", p->bdev->bd_read_only);
 }
 
 static ssize_t part_alignment_offset_show(struct device *dev,
@@ -420,7 +420,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	bdev->bd_start_sect = start;
 	bdev_set_nr_sectors(bdev, len);
 	p->partno = partno;
-	p->policy = get_disk_ro(disk);
+	bdev->bd_read_only = get_disk_ro(disk);
 
 	if (info) {
 		err = -ENOMEM;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index b237f1e4081405..758cf71c9aa2a6 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -23,6 +23,7 @@ struct block_device {
 	sector_t		bd_start_sect;
 	struct disk_stats __percpu *bd_stats;
 	unsigned long		bd_stamp;
+	bool			bd_read_only;	/* read-only policy */
 	dev_t			bd_dev;
 	int			bd_openers;
 	struct inode *		bd_inode;	/* will die */
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 5d46ea7be7e4f0..08d00b526b0a3b 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -55,7 +55,7 @@ struct hd_struct {
 
 	struct block_device *bdev;
 	struct device __dev;
-	int policy, partno;
+	int partno;
 	struct rcu_work rcu_work;
 };
 
@@ -279,7 +279,7 @@ extern void set_disk_ro(struct gendisk *disk, int flag);
 
 static inline int get_disk_ro(struct gendisk *disk)
 {
-	return disk->part0.policy;
+	return disk->part0.bdev->bd_read_only;
 }
 
 extern void disk_block_events(struct gendisk *disk);
-- 
2.29.2


