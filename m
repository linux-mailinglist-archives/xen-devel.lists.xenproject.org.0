Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823C3CA001
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 15:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156631.289043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m41hf-0004us-7l; Thu, 15 Jul 2021 13:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156631.289043; Thu, 15 Jul 2021 13:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m41hf-0004qx-4j; Thu, 15 Jul 2021 13:47:03 +0000
Received: by outflank-mailman (input) for mailman id 156631;
 Thu, 15 Jul 2021 13:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aGUF=MH=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m41hd-0004m9-Pf
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 13:47:01 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ffd1226-e573-11eb-88d4-12813bfff9fa;
 Thu, 15 Jul 2021 13:46:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AF04D67373; Thu, 15 Jul 2021 15:46:56 +0200 (CEST)
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
X-Inumbo-ID: 1ffd1226-e573-11eb-88d4-12813bfff9fa
Date: Thu, 15 Jul 2021 15:46:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [BUG report] Deadlock in xen-blkfront upon device hot-unplug
Message-ID: <20210715134656.GA4167@lst.de>
References: <87pmvk0wep.fsf@vitty.brq.redhat.com> <20210715124622.GA32693@lst.de> <87k0lr1zta.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0lr1zta.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 15, 2021 at 03:17:37PM +0200, Vitaly Kuznetsov wrote:
> Christoph Hellwig <hch@lst.de> writes:
> 
> > On Thu, Jul 15, 2021 at 11:16:30AM +0200, Vitaly Kuznetsov wrote:
> >> I'm observing a deadlock every time I try to unplug a xen-blkfront
> >> device. With 5.14-rc1+ the deadlock looks like:
> >
> > I did actually stumble over this a few days ago just from code
> > inspection.  Below is what I come up with, can you give it a spin?
> 
> This eliminates the deadlock, thanks! Unfortunately, this reveals the
> same issue I observed when I just dropped taking the mutex from
> blkfront_closing():

Yeah, this still left too much cruft in blkfront_closing.  Can you
try this version instead?

---
From 4d926a44f15d2051909132182345754df23cc13d Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 29 Jun 2021 13:49:22 +0200
Subject: xen-blkfront: sanitize the removal state machine

xen-blkfront has a weird protocol where close message from the remote
side can be delayed, and where hot removals are treated somewhat
differently from regular removals, all leading to potential NULL
pointer removals.  Fix this by just performing normal hot removals
even when the device is opened like all other Linux block drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 208 ++++-------------------------------
 1 file changed, 24 insertions(+), 184 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8d49f8fa98bb..09ceb7bd585a 100644
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
@@ -2126,38 +2083,26 @@ static int blkfront_resume(struct xenbus_device *dev)
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
-
-	if (info->gd)
-		bdev = bdgrab(info->gd->part0);
 
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
@@ -2472,8 +2417,7 @@ static void blkback_changed(struct xenbus_device *dev,
 			break;
 		fallthrough;
 	case XenbusStateClosing:
-		if (info)
-			blkfront_closing(info);
+		blkfront_closing(info);
 		break;
 	}
 }
@@ -2481,55 +2425,19 @@ static void blkback_changed(struct xenbus_device *dev,
 static int blkfront_remove(struct xenbus_device *xbdev)
 {
 	struct blkfront_info *info = dev_get_drvdata(&xbdev->dev);
-	struct block_device *bdev = NULL;
-	struct gendisk *disk;
 
 	dev_dbg(&xbdev->dev, "%s removed", xbdev->nodename);
 
-	if (!info)
-		return 0;
+	del_gendisk(info->gd);
 
 	blkif_free(info, 0);
+	xlbd_release_minors(info->gd->first_minor, info->gd->minors);
+	blk_cleanup_disk(info->gd);
+	blk_mq_free_tag_set(&info->tag_set);
 
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
-
-	if (info && !bdev->bd_openers) {
-		xlvbd_release_gendisk(info);
-		disk->private_data = NULL;
-		mutex_lock(&blkfront_mutex);
-		free_info(info);
-		mutex_unlock(&blkfront_mutex);
-	}
-
-	mutex_unlock(&disk->open_mutex);
-	bdput(bdev);
+	mutex_lock(&blkfront_mutex);
+	free_info(info);
+	mutex_unlock(&blkfront_mutex);
 
 	return 0;
 }
@@ -2541,77 +2449,9 @@ static int blkfront_is_ready(struct xenbus_device *dev)
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


