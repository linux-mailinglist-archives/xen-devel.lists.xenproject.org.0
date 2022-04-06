Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49A4F555A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 08:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299532.510440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbynl-00039J-9G; Wed, 06 Apr 2022 06:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299532.510440; Wed, 06 Apr 2022 06:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbynk-00032H-UY; Wed, 06 Apr 2022 06:05:56 +0000
Received: by outflank-mailman (input) for mailman id 299532;
 Wed, 06 Apr 2022 06:05:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huFP=UQ=bombadil.srs.infradead.org=BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbynj-0000hu-CH
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 06:05:55 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de280a1-b56f-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 08:05:54 +0200 (CEST)
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynb-003uwx-AJ; Wed, 06 Apr 2022 06:05:47 +0000
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
X-Inumbo-ID: 9de280a1-b56f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WTqESTvtfO4RX0qAqhs2oFd2Ik59q54vLqp/V/y7bnI=; b=FyJUmCuIohn+Rc7Inqu3BniYMO
	qIbi7WgRq0N7qblPyTDtikeMFm5V1dbLiaJQYES35HwVVDM5F002rNedhKojSjZSangf3g4TTB5H8
	ose/VQW92oLsoNNnrgmuQ76bdKKE4T6Y3dmmZVsUWsnsPjVGMnUiPjquePmKO+IeMAi+ZQQvMCCYS
	5PMGec+vFR133rAMQYM0lD1ltqCTBtpWog3Ko4h+ioJJRDUI+WLYZoytyDGy8Ig1GoZQ2cZVQBaiq
	VeAMRPUX1EVBht4ncdSOvQy0zHk56lci0PZ4ia4LUpztUXudJZTNfnXGvXSxvvSo+c89mmlg6GRYS
	FB4ItY+g==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org
Subject: [PATCH 07/27] btrfs: use bdev_max_active_zones instead of open coding it
Date: Wed,  6 Apr 2022 08:04:56 +0200
Message-Id: <20220406060516.409838-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/zoned.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index b7b5fac1c7790..5b85004d85d6c 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -350,7 +350,6 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 	struct btrfs_fs_info *fs_info = device->fs_info;
 	struct btrfs_zoned_device_info *zone_info = NULL;
 	struct block_device *bdev = device->bdev;
-	struct request_queue *queue = bdev_get_queue(bdev);
 	unsigned int max_active_zones;
 	unsigned int nactive;
 	sector_t nr_sectors;
@@ -410,7 +409,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 	if (!IS_ALIGNED(nr_sectors, zone_sectors))
 		zone_info->nr_zones++;
 
-	max_active_zones = queue_max_active_zones(queue);
+	max_active_zones = bdev_max_active_zones(bdev);
 	if (max_active_zones && max_active_zones < BTRFS_MIN_ACTIVE_ZONES) {
 		btrfs_err_in_rcu(fs_info,
 "zoned: %s: max active zones %u is too small, need at least %u active zones",
-- 
2.30.2


