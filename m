Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18B2C2843
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36131.67965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYYN-0004Rt-01; Tue, 24 Nov 2020 13:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36131.67965; Tue, 24 Nov 2020 13:40:18 +0000
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
	id 1khYYM-0004P4-Et; Tue, 24 Nov 2020 13:40:18 +0000
Received: by outflank-mailman (input) for mailman id 36131;
 Tue, 24 Nov 2020 13:40:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYOh-0000Qf-3x
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:30:19 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb682eb6-e81b-4fab-9c78-d20579156464;
 Tue, 24 Nov 2020 13:28:48 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMx-0006bA-OT; Tue, 24 Nov 2020 13:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYOh-0000Qf-3x
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:30:19 +0000
X-Inumbo-ID: bb682eb6-e81b-4fab-9c78-d20579156464
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb682eb6-e81b-4fab-9c78-d20579156464;
	Tue, 24 Nov 2020 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mhpy0Cb59wkbzThtZwDnrbLXD1rWczYtJDTvhh8SMU0=; b=Ea+9q0/5U1C3lxpYG+cp8W8+yq
	HDJXNs1xkR6d5Q3Tqe8DzJMoqEQ7/6jzh7BdzDFOCgM6eJtZ/NdJBDr4wa1fg4oXr74Y5kroSq79K
	VzT26zUATIM8C+jMZIcZTGU/6xcbiiu6NMExdkpxZExa8l29GhQ0Qte1UYrKyFBP9keFbOOHO8Do8
	pg6wptGVpopV7o1YV4zwjSA2vi6DqZrN+W1PPJvGBKFgFYLTf6Hhc/xGBLAwEP1JaP8w6JU559eQE
	bqw7WPqgNie7PhEXK192YC8HvtakiLkYEPYmuhZflhhpqi33qULhu7LUJVG5R4zXadf40txQOM3eh
	EzrjvHUQ==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMx-0006bA-OT; Tue, 24 Nov 2020 13:28:32 +0000
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
Subject: [PATCH 24/45] blk-cgroup: stop abusing get_gendisk
Date: Tue, 24 Nov 2020 14:27:30 +0100
Message-Id: <20201124132751.3747337-25-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Properly open the device instead of relying on deep internals by
using get_gendisk.  Note that this uses FMODE_NDELAY without either
FMODE_READ or FMODE_WRITE, which is a special open mode to allow
for opening without media access, thus avoiding unexpexted interactions
especially on removable media.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c         | 42 +++++++++++++++++++-------------------
 block/blk-iocost.c         | 36 ++++++++++++++++----------------
 include/linux/blk-cgroup.h |  4 ++--
 3 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 54fbe1e80cc41a..23437b96ea41e6 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -556,22 +556,22 @@ static struct blkcg_gq *blkg_lookup_check(struct blkcg *blkcg,
 }
 
 /**
- * blkg_conf_prep - parse and prepare for per-blkg config update
+ * blkcg_conf_open_bdev - parse and open bdev for per-blkg config update
  * @inputp: input string pointer
  *
  * Parse the device node prefix part, MAJ:MIN, of per-blkg config update
- * from @input and get and return the matching gendisk.  *@inputp is
+ * from @input and get and return the matching bdev.  *@inputp is
  * updated to point past the device node prefix.  Returns an ERR_PTR()
  * value on error.
  *
  * Use this function iff blkg_conf_prep() can't be used for some reason.
  */
-struct gendisk *blkcg_conf_get_disk(char **inputp)
+struct block_device *blkcg_conf_open_bdev(char **inputp)
 {
 	char *input = *inputp;
 	unsigned int major, minor;
-	struct gendisk *disk;
-	int key_len, part;
+	struct block_device *bdev;
+	int key_len;
 
 	if (sscanf(input, "%u:%u%n", &major, &minor, &key_len) != 2)
 		return ERR_PTR(-EINVAL);
@@ -581,16 +581,16 @@ struct gendisk *blkcg_conf_get_disk(char **inputp)
 		return ERR_PTR(-EINVAL);
 	input = skip_spaces(input);
 
-	disk = get_gendisk(MKDEV(major, minor), &part);
-	if (!disk)
+	bdev = blkdev_get_by_dev(MKDEV(major, minor), FMODE_NDELAY, NULL);
+	if (!bdev)
 		return ERR_PTR(-ENODEV);
-	if (part) {
-		put_disk_and_module(disk);
+	if (bdev_is_partition(bdev)) {
+		blkdev_put(bdev, FMODE_NDELAY);
 		return ERR_PTR(-ENODEV);
 	}
 
 	*inputp = input;
-	return disk;
+	return bdev;
 }
 
 /**
@@ -607,18 +607,18 @@ struct gendisk *blkcg_conf_get_disk(char **inputp)
  */
 int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 		   char *input, struct blkg_conf_ctx *ctx)
-	__acquires(rcu) __acquires(&disk->queue->queue_lock)
+	__acquires(rcu) __acquires(&bdev->bd_disk->queue->queue_lock)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct request_queue *q;
 	struct blkcg_gq *blkg;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	q = disk->queue;
+	q = bdev->bd_disk->queue;
 
 	rcu_read_lock();
 	spin_lock_irq(&q->queue_lock);
@@ -689,7 +689,7 @@ int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 			goto success;
 	}
 success:
-	ctx->disk = disk;
+	ctx->bdev = bdev;
 	ctx->blkg = blkg;
 	ctx->body = input;
 	return 0;
@@ -700,7 +700,7 @@ int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 	spin_unlock_irq(&q->queue_lock);
 	rcu_read_unlock();
 fail:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	/*
 	 * If queue was bypassing, we should retry.  Do so after a
 	 * short msleep().  It isn't strictly necessary but queue
@@ -723,11 +723,11 @@ EXPORT_SYMBOL_GPL(blkg_conf_prep);
  * with blkg_conf_prep().
  */
 void blkg_conf_finish(struct blkg_conf_ctx *ctx)
-	__releases(&ctx->disk->queue->queue_lock) __releases(rcu)
+	__releases(&ctx->bdev->bd_disk->queue->queue_lock) __releases(rcu)
 {
-	spin_unlock_irq(&ctx->disk->queue->queue_lock);
+	spin_unlock_irq(&ctx->bdev->bd_disk->queue->queue_lock);
 	rcu_read_unlock();
-	put_disk_and_module(ctx->disk);
+	blkdev_put(ctx->bdev, FMODE_NDELAY);
 }
 EXPORT_SYMBOL_GPL(blkg_conf_finish);
 
diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index bbe86d1199dc5b..9f219718e9813c 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -3120,23 +3120,23 @@ static const match_table_t qos_tokens = {
 static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
 			     size_t nbytes, loff_t off)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct ioc *ioc;
 	u32 qos[NR_QOS_PARAMS];
 	bool enable, user;
 	char *p;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	ioc = q_to_ioc(disk->queue);
+	ioc = q_to_ioc(bdev->bd_disk->queue);
 	if (!ioc) {
-		ret = blk_iocost_init(disk->queue);
+		ret = blk_iocost_init(bdev->bd_disk->queue);
 		if (ret)
 			goto err;
-		ioc = q_to_ioc(disk->queue);
+		ioc = q_to_ioc(bdev->bd_disk->queue);
 	}
 
 	spin_lock_irq(&ioc->lock);
@@ -3231,12 +3231,12 @@ static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
 	ioc_refresh_params(ioc, true);
 	spin_unlock_irq(&ioc->lock);
 
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return nbytes;
 einval:
 	ret = -EINVAL;
 err:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return ret;
 }
 
@@ -3287,23 +3287,23 @@ static const match_table_t i_lcoef_tokens = {
 static ssize_t ioc_cost_model_write(struct kernfs_open_file *of, char *input,
 				    size_t nbytes, loff_t off)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct ioc *ioc;
 	u64 u[NR_I_LCOEFS];
 	bool user;
 	char *p;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	ioc = q_to_ioc(disk->queue);
+	ioc = q_to_ioc(bdev->bd_disk->queue);
 	if (!ioc) {
-		ret = blk_iocost_init(disk->queue);
+		ret = blk_iocost_init(bdev->bd_disk->queue);
 		if (ret)
 			goto err;
-		ioc = q_to_ioc(disk->queue);
+		ioc = q_to_ioc(bdev->bd_disk->queue);
 	}
 
 	spin_lock_irq(&ioc->lock);
@@ -3356,13 +3356,13 @@ static ssize_t ioc_cost_model_write(struct kernfs_open_file *of, char *input,
 	ioc_refresh_params(ioc, true);
 	spin_unlock_irq(&ioc->lock);
 
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return nbytes;
 
 einval:
 	ret = -EINVAL;
 err:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return ret;
 }
 
diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index c8fc9792ac776d..b9f3c246c3c908 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -197,12 +197,12 @@ void blkcg_print_blkgs(struct seq_file *sf, struct blkcg *blkcg,
 u64 __blkg_prfill_u64(struct seq_file *sf, struct blkg_policy_data *pd, u64 v);
 
 struct blkg_conf_ctx {
-	struct gendisk			*disk;
+	struct block_device		*bdev;
 	struct blkcg_gq			*blkg;
 	char				*body;
 };
 
-struct gendisk *blkcg_conf_get_disk(char **inputp);
+struct block_device *blkcg_conf_open_bdev(char **inputp);
 int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 		   char *input, struct blkg_conf_ctx *ctx);
 void blkg_conf_finish(struct blkg_conf_ctx *ctx);
-- 
2.29.2


