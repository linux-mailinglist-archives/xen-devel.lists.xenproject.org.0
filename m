Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B43CA086
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 16:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156650.289076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m42CP-0001ov-B5; Thu, 15 Jul 2021 14:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156650.289076; Thu, 15 Jul 2021 14:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m42CP-0001mH-83; Thu, 15 Jul 2021 14:18:49 +0000
Received: by outflank-mailman (input) for mailman id 156650;
 Thu, 15 Jul 2021 14:18:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=voBD=MH=casper.srs.infradead.org=BATV+3cac5ad57d752804f19d+6535+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1m42CN-0001mB-H4
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 14:18:47 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43279ffc-1b42-4eba-93d9-37bb40a18545;
 Thu, 15 Jul 2021 14:18:43 +0000 (UTC)
Received: from [2001:4bb8:184:8b7c:799f:7892:b8a2:a8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m42Aq-003QRr-8X; Thu, 15 Jul 2021 14:17:34 +0000
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
X-Inumbo-ID: 43279ffc-1b42-4eba-93d9-37bb40a18545
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VAAPsXJGTYSz80YaP9sj6eBH4VYcoQAKnAyYRshjrDo=; b=jjgHD1mBEs6UaGf8StmO8i350e
	XDjd2RmSfXSPhWdWaOcSlCJKQMTQeFF7DjHUEZH0fW/0ZlNSX4SV1tg5JtYmO2f+6M7Pg7HDVfn//
	S0cFmgz6KcVHkjcNur3VEWSnPQvkHGo/Uh+6tAF/cytGIeGztDxIg5SL7FhUhzQB3FE7SWadvgL37
	gSM/9m0LxRQpXV3odjqmfKYVCx5canS3n1csV5LSopfcXGWKXM+0myoQ9r6zXJpeZ/qkI8kL6nR2e
	NnZ7Sr9XN4mFgxbgUQbbn0dqKiyAIh+YBsMQ4986O5/e9RbT+IPtRxLCvOzIYR2Zr2jPlV9jL9er5
	DElIHYvA==;
From: Christoph Hellwig <hch@lst.de>
To: konrad.wilk@oracle.com,
	roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH] xen-blkfront: sanitize the removal state machine
Date: Thu, 15 Jul 2021 16:17:11 +0200
Message-Id: <20210715141711.1257293-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

xen-blkfront has a weird protocol where close message from the remote
side can be delayed, and where hot removals are treated somewhat
differently from regular removals, all leading to potential NULL
pointer removals, and a del_gendisk from the block device release
method, which will deadlock. Fix this by just performing normal hot
removals even when the device is opened like all other Linux block
drivers.

Fixes: c76f48eb5c08 ("block: take bd_mutex around delete_partitions in del_gendisk")
Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/block/xen-blkfront.c | 224 ++++-------------------------------
 1 file changed, 26 insertions(+), 198 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8d49f8fa98bb..d83fee21f6c5 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -502,34 +502,21 @@ static int blkif_getgeo(struct block_device *bd, struct hd_geometry *hg)
 static int blkif_ioctl(struct block_device *bdev, fmode_t mode,
 		       unsigned command, unsigned long argument)
 {
-	struct blkfront_info *info = bdev->bd_disk->private_data;
 	int i;
 
-	dev_dbg(&info->xbdev->dev, "command: 0x%x, argument: 0x%lx\n",
-		command, (long)argument);
-
 	switch (command) {
 	case CDROMMULTISESSION:
-		dev_dbg(&info->xbdev->dev, "FIXME: support multisession CDs later\n");
 		for (i = 0; i < sizeof(struct cdrom_multisession); i++)
 			if (put_user(0, (char __user *)(argument + i)))
 				return -EFAULT;
 		return 0;
-
-	case CDROM_GET_CAPABILITY: {
-		struct gendisk *gd = info->gd;
-		if (gd->flags & GENHD_FL_CD)
+	case CDROM_GET_CAPABILITY:
+		if (bdev->bd_disk->flags & GENHD_FL_CD)
 			return 0;
 		return -EINVAL;
-	}
-
 	default:
-		/*printk(KERN_ALERT "ioctl %08x not supported by Xen blkdev\n",
-		  command);*/
-		return -EINVAL; /* same return as native Linux */
+		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
@@ -1177,36 +1164,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	return err;
 }
 
-static void xlvbd_release_gendisk(struct blkfront_info *info)
-{
-	unsigned int minor, nr_minors, i;
-	struct blkfront_ring_info *rinfo;
-
-	if (info->rq == NULL)
-		return;
-
-	/* No more blkif_request(). */
-	blk_mq_stop_hw_queues(info->rq);
-
-	for_each_rinfo(info, rinfo, i) {
-		/* No more gnttab callback work. */
-		gnttab_cancel_free_callback(&rinfo->callback);
-
-		/* Flush gnttab callback work. Must be done with no locks held. */
-		flush_work(&rinfo->work);
-	}
-
-	del_gendisk(info->gd);
-
-	minor = info->gd->first_minor;
-	nr_minors = info->gd->minors;
-	xlbd_release_minors(minor, nr_minors);
-
-	blk_cleanup_disk(info->gd);
-	info->gd = NULL;
-	blk_mq_free_tag_set(&info->tag_set);
-}
-
 /* Already hold rinfo->ring_lock. */
 static inline void kick_pending_request_queues_locked(struct blkfront_ring_info *rinfo)
 {
@@ -1756,12 +1713,6 @@ static int write_per_ring_nodes(struct xenbus_transaction xbt,
 	return err;
 }
 
-static void free_info(struct blkfront_info *info)
-{
-	list_del(&info->info_list);
-	kfree(info);
-}
-
 /* Common code used when first setting up, and when resuming. */
 static int talk_to_blkback(struct xenbus_device *dev,
 			   struct blkfront_info *info)
@@ -1880,13 +1831,6 @@ static int talk_to_blkback(struct xenbus_device *dev,
 		xenbus_dev_fatal(dev, err, "%s", message);
  destroy_blkring:
 	blkif_free(info, 0);
-
-	mutex_lock(&blkfront_mutex);
-	free_info(info);
-	mutex_unlock(&blkfront_mutex);
-
-	dev_set_drvdata(&dev->dev, NULL);
-
 	return err;
 }
 
@@ -2126,38 +2070,26 @@ static int blkfront_resume(struct xenbus_device *dev)
 static void blkfront_closing(struct blkfront_info *info)
 {
 	struct xenbus_device *xbdev = info->xbdev;
-	struct block_device *bdev = NULL;
-
-	mutex_lock(&info->mutex);
+	struct blkfront_ring_info *rinfo;
+	unsigned int i;
 
-	if (xbdev->state == XenbusStateClosing) {
-		mutex_unlock(&info->mutex);
+	if (xbdev->state == XenbusStateClosing)
 		return;
-	}
 
-	if (info->gd)
-		bdev = bdgrab(info->gd->part0);
-
-	mutex_unlock(&info->mutex);
-
-	if (!bdev) {
-		xenbus_frontend_closed(xbdev);
-		return;
-	}
+	/* No more blkif_request(). */
+	blk_mq_stop_hw_queues(info->rq);
+	blk_set_queue_dying(info->rq);
+	set_capacity(info->gd, 0);
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
+	for_each_rinfo(info, rinfo, i) {
+		/* No more gnttab callback work. */
+		gnttab_cancel_free_callback(&rinfo->callback);
 
-	if (bdev->bd_openers) {
-		xenbus_dev_error(xbdev, -EBUSY,
-				 "Device in use; refusing to close");
-		xenbus_switch_state(xbdev, XenbusStateClosing);
-	} else {
-		xlvbd_release_gendisk(info);
-		xenbus_frontend_closed(xbdev);
+		/* Flush gnttab callback work. Must be done with no locks held. */
+		flush_work(&rinfo->work);
 	}
 
-	mutex_unlock(&bdev->bd_disk->open_mutex);
-	bdput(bdev);
+	xenbus_frontend_closed(xbdev);
 }
 
 static void blkfront_setup_discard(struct blkfront_info *info)
@@ -2472,8 +2404,7 @@ static void blkback_changed(struct xenbus_device *dev,
 			break;
 		fallthrough;
 	case XenbusStateClosing:
-		if (info)
-			blkfront_closing(info);
+		blkfront_closing(info);
 		break;
 	}
 }
@@ -2481,56 +2412,21 @@ static void blkback_changed(struct xenbus_device *dev,
 static int blkfront_remove(struct xenbus_device *xbdev)
 {
 	struct blkfront_info *info = dev_get_drvdata(&xbdev->dev);
-	struct block_device *bdev = NULL;
-	struct gendisk *disk;
 
 	dev_dbg(&xbdev->dev, "%s removed", xbdev->nodename);
 
-	if (!info)
-		return 0;
-
-	blkif_free(info, 0);
-
-	mutex_lock(&info->mutex);
-
-	disk = info->gd;
-	if (disk)
-		bdev = bdgrab(disk->part0);
-
-	info->xbdev = NULL;
-	mutex_unlock(&info->mutex);
-
-	if (!bdev) {
-		mutex_lock(&blkfront_mutex);
-		free_info(info);
-		mutex_unlock(&blkfront_mutex);
-		return 0;
-	}
-
-	/*
-	 * The xbdev was removed before we reached the Closed
-	 * state. See if it's safe to remove the disk. If the bdev
-	 * isn't closed yet, we let release take care of it.
-	 */
-
-	mutex_lock(&disk->open_mutex);
-	info = disk->private_data;
-
-	dev_warn(disk_to_dev(disk),
-		 "%s was hot-unplugged, %d stale handles\n",
-		 xbdev->nodename, bdev->bd_openers);
+	del_gendisk(info->gd);
 
-	if (info && !bdev->bd_openers) {
-		xlvbd_release_gendisk(info);
-		disk->private_data = NULL;
-		mutex_lock(&blkfront_mutex);
-		free_info(info);
-		mutex_unlock(&blkfront_mutex);
-	}
+	mutex_lock(&blkfront_mutex);
+	list_del(&info->info_list);
+	mutex_unlock(&blkfront_mutex);
 
-	mutex_unlock(&disk->open_mutex);
-	bdput(bdev);
+	blkif_free(info, 0);
+	xlbd_release_minors(info->gd->first_minor, info->gd->minors);
+	blk_cleanup_disk(info->gd);
+	blk_mq_free_tag_set(&info->tag_set);
 
+	kfree(info);
 	return 0;
 }
 
@@ -2541,77 +2437,9 @@ static int blkfront_is_ready(struct xenbus_device *dev)
 	return info->is_ready && info->xbdev;
 }
 
-static int blkif_open(struct block_device *bdev, fmode_t mode)
-{
-	struct gendisk *disk = bdev->bd_disk;
-	struct blkfront_info *info;
-	int err = 0;
-
-	mutex_lock(&blkfront_mutex);
-
-	info = disk->private_data;
-	if (!info) {
-		/* xbdev gone */
-		err = -ERESTARTSYS;
-		goto out;
-	}
-
-	mutex_lock(&info->mutex);
-
-	if (!info->gd)
-		/* xbdev is closed */
-		err = -ERESTARTSYS;
-
-	mutex_unlock(&info->mutex);
-
-out:
-	mutex_unlock(&blkfront_mutex);
-	return err;
-}
-
-static void blkif_release(struct gendisk *disk, fmode_t mode)
-{
-	struct blkfront_info *info = disk->private_data;
-	struct xenbus_device *xbdev;
-
-	mutex_lock(&blkfront_mutex);
-	if (disk->part0->bd_openers)
-		goto out_mutex;
-
-	/*
-	 * Check if we have been instructed to close. We will have
-	 * deferred this request, because the bdev was still open.
-	 */
-
-	mutex_lock(&info->mutex);
-	xbdev = info->xbdev;
-
-	if (xbdev && xbdev->state == XenbusStateClosing) {
-		/* pending switch to state closed */
-		dev_info(disk_to_dev(disk), "releasing disk\n");
-		xlvbd_release_gendisk(info);
-		xenbus_frontend_closed(info->xbdev);
- 	}
-
-	mutex_unlock(&info->mutex);
-
-	if (!xbdev) {
-		/* sudden device removal */
-		dev_info(disk_to_dev(disk), "releasing disk\n");
-		xlvbd_release_gendisk(info);
-		disk->private_data = NULL;
-		free_info(info);
-	}
-
-out_mutex:
-	mutex_unlock(&blkfront_mutex);
-}
-
 static const struct block_device_operations xlvbd_block_fops =
 {
 	.owner = THIS_MODULE,
-	.open = blkif_open,
-	.release = blkif_release,
 	.getgeo = blkif_getgeo,
 	.ioctl = blkif_ioctl,
 	.compat_ioctl = blkdev_compat_ptr_ioctl,
-- 
2.30.2


