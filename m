Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4DC9161C7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747482.1154908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1zs-0000K7-Na; Tue, 25 Jun 2024 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747482.1154908; Tue, 25 Jun 2024 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1zs-0000IA-Kk; Tue, 25 Jun 2024 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 747482;
 Tue, 25 Jun 2024 08:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o8Ww=N3=bombadil.srs.infradead.org=BATV+ee3bcc3f6418456cddbd+7611+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sM1zq-0000GZ-2C
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:57:50 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe449146-32d0-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:57:48 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sM1zb-00000002Btq-1pcn;
 Tue, 25 Jun 2024 08:57:35 +0000
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
X-Inumbo-ID: fe449146-32d0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=THcdDm0A+7qsrmlgD/s5mbaI1bo21sJBUVFRJUuckjU=; b=iT2Kf8Ts7SV0ZMpN1tnhXxPtMH
	Ffv8ZJFKB4PVB/IdNXjk7V0C/EqzT+g2n4rI1ZqlvQji9lJIwZfjHfG1Y7Cb5TXIeVGCM4nTH9crp
	4zyWvlsKZ4WoJ7XDaIrgLwNl3YRoXD5zh+VKywveOkw7i38S3zZmoxTmQHKWk7riwSg6VmFiReOf7
	0vMD17gabcLDjQNIftPl8VaQ0ZrC/qk7EH/0G/IiWcIA8u56veyp3C42DoJVrtu8OAb3RerYCYvx8
	kxEfDPsLLm6uiPifVX8Lcu0WzNjdMGJQI+mys12zLdW5z+VY7pu7ChDIbK8PMhXWCu88C5Voy7C5+
	gU8eTZWA==;
Date: Tue, 25 Jun 2024 01:57:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZnqGf49cvy6W-xWf@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406250948.e0044f1d-oliver.sang@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi Oliver,

can you test the patch below?  It restores the previous behavior if
the device did not have a volatile write cache.  I think at least
for raid0 and raid1 without bitmap the new behavior actually is correct
and better, but it will need fixes for other modes.  If the underlying
devices did have a volatile write cache I'm a bit lost what the problem
was and this probably won't fix the issue.

---
From 81c816827197f811e14add7a79220ed9eef6af02 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 25 Jun 2024 08:48:18 +0200
Subject: md: set md-specific flags for all queue limits

The md driver wants to enforce a number of flags to an all devices, even
when not inheriting them from the underlying devices.  To make sure these
flags survive the queue_limits_set calls that md uses to update the
queue limits without deriving them form the previous limits add a new
md_init_stacking_limits helper that calls blk_set_stacking_limits and sets
these flags.

Fixes: 1122c0c1cc71 ("block: move cache control settings out of queue->flags")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c     | 13 ++++++++-----
 drivers/md/md.h     |  1 +
 drivers/md/raid0.c  |  2 +-
 drivers/md/raid1.c  |  2 +-
 drivers/md/raid10.c |  2 +-
 drivers/md/raid5.c  |  2 +-
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 69ea54aedd99a1..8368438e58e989 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5853,6 +5853,13 @@ static void mddev_delayed_delete(struct work_struct *ws)
 	kobject_put(&mddev->kobj);
 }
 
+void md_init_stacking_limits(struct queue_limits *lim)
+{
+	blk_set_stacking_limits(lim);
+	lim->features = BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
+			BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
+}
+
 struct mddev *md_alloc(dev_t dev, char *name)
 {
 	/*
@@ -5871,10 +5878,6 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	int shift;
 	int unit;
 	int error;
-	struct queue_limits lim = {
-		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
-					  BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT,
-	};
 
 	/*
 	 * Wait for any previous instance of this device to be completely
@@ -5914,7 +5917,7 @@ struct mddev *md_alloc(dev_t dev, char *name)
 		 */
 		mddev->hold_active = UNTIL_STOP;
 
-	disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
+	disk = blk_alloc_disk(NULL, NUMA_NO_NODE);
 	if (IS_ERR(disk)) {
 		error = PTR_ERR(disk);
 		goto out_free_mddev;
diff --git a/drivers/md/md.h b/drivers/md/md.h
index c4d7ebf9587d07..28cb4b0b6c1740 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -893,6 +893,7 @@ extern int strict_strtoul_scaled(const char *cp, unsigned long *res, int scale);
 
 extern int mddev_init(struct mddev *mddev);
 extern void mddev_destroy(struct mddev *mddev);
+void md_init_stacking_limits(struct queue_limits *lim);
 struct mddev *md_alloc(dev_t dev, char *name);
 void mddev_put(struct mddev *mddev);
 extern int md_run(struct mddev *mddev);
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 62634e2a33bd0f..32d58752477847 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -379,7 +379,7 @@ static int raid0_set_limits(struct mddev *mddev)
 	struct queue_limits lim;
 	int err;
 
-	blk_set_stacking_limits(&lim);
+	md_init_stacking_limits(&lim);
 	lim.max_hw_sectors = mddev->chunk_sectors;
 	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
 	lim.io_min = mddev->chunk_sectors << 9;
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 1a0eba65b8a92b..04a0c2ca173245 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3194,7 +3194,7 @@ static int raid1_set_limits(struct mddev *mddev)
 	struct queue_limits lim;
 	int err;
 
-	blk_set_stacking_limits(&lim);
+	md_init_stacking_limits(&lim);
 	lim.max_write_zeroes_sectors = 0;
 	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
 	if (err) {
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 3334aa803c8380..2a9c4ee982e023 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3974,7 +3974,7 @@ static int raid10_set_queue_limits(struct mddev *mddev)
 	struct queue_limits lim;
 	int err;
 
-	blk_set_stacking_limits(&lim);
+	md_init_stacking_limits(&lim);
 	lim.max_write_zeroes_sectors = 0;
 	lim.io_min = mddev->chunk_sectors << 9;
 	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 0192a6323f09ba..10219205160bbf 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7708,7 +7708,7 @@ static int raid5_set_limits(struct mddev *mddev)
 	 */
 	stripe = roundup_pow_of_two(data_disks * (mddev->chunk_sectors << 9));
 
-	blk_set_stacking_limits(&lim);
+	md_init_stacking_limits(&lim);
 	lim.io_min = mddev->chunk_sectors << 9;
 	lim.io_opt = lim.io_min * (conf->raid_disks - conf->max_degraded);
 	lim.features |= BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE;
-- 
2.43.0


