Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5C2B4890
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28081.56778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg8Y-00015r-8G; Mon, 16 Nov 2020 15:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28081.56778; Mon, 16 Nov 2020 15:09:46 +0000
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
	id 1keg8X-00013i-RF; Mon, 16 Nov 2020 15:09:45 +0000
Received: by outflank-mailman (input) for mailman id 28081;
 Mon, 16 Nov 2020 15:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg1D-0006ni-69
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec5bb8c-775a-4edf-b6a1-f9d2b128e1dd;
 Mon, 16 Nov 2020 14:59:24 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyI-0003z4-LX; Mon, 16 Nov 2020 14:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg1D-0006ni-69
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:11 +0000
X-Inumbo-ID: bec5bb8c-775a-4edf-b6a1-f9d2b128e1dd
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bec5bb8c-775a-4edf-b6a1-f9d2b128e1dd;
	Mon, 16 Nov 2020 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PqvTdxKlXNZLdjBDggPe+0dpl8BdkJnU5rWC71hrHK0=; b=q2Eui2HSznBIPI9cSjfWRkLiXv
	D7M1u2p1A7Bgss7fi8geS+IcBDfPIY7tG3iQsIcsu2pwlnpb6JkzHA9nQPyjhsgzFFr2f5V8gWY0R
	q0oyrC2H/s5XJqKuazQLgZxzSZuDhrLGiXIEEMHlBXx+6keZzYVXDEBv//T2nzeg8fA0yrA8TgRwk
	r0eZqTmdEAWKh5MSx2GpdmmFWrOrgA8uPwc9e459z4ahoYIjDlMtNVnWGRW3SsebzThr08Euwj40u
	FCjdDtLrrY8SFXrtoGuiZV87z8jk53zRslZsCywZYFngjpUQ7WpAm4CkVJQjfGDPL7bghqM+ajoud
	OS2SyUsg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyI-0003z4-LX; Mon, 16 Nov 2020 14:59:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 43/78] brd: use __register_blkdev to allocate devices on demand
Date: Mon, 16 Nov 2020 15:57:34 +0100
Message-Id: <20201116145809.410558-44-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the simpler mechanism attached to major_name to allocate a brd device
when a currently unregistered minor is accessed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/brd.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index cc49a921339f77..c43a6ab4b1f39f 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -426,14 +426,15 @@ static void brd_free(struct brd_device *brd)
 	kfree(brd);
 }
 
-static struct brd_device *brd_init_one(int i, bool *new)
+static void brd_probe(dev_t dev)
 {
 	struct brd_device *brd;
+	int i = MINOR(dev) / max_part;
 
-	*new = false;
+	mutex_lock(&brd_devices_mutex);
 	list_for_each_entry(brd, &brd_devices, brd_list) {
 		if (brd->brd_number == i)
-			goto out;
+			goto out_unlock;
 	}
 
 	brd = brd_alloc(i);
@@ -442,9 +443,9 @@ static struct brd_device *brd_init_one(int i, bool *new)
 		add_disk(brd->brd_disk);
 		list_add_tail(&brd->brd_list, &brd_devices);
 	}
-	*new = true;
-out:
-	return brd;
+
+out_unlock:
+	mutex_unlock(&brd_devices_mutex);
 }
 
 static void brd_del_one(struct brd_device *brd)
@@ -454,23 +455,6 @@ static void brd_del_one(struct brd_device *brd)
 	brd_free(brd);
 }
 
-static struct kobject *brd_probe(dev_t dev, int *part, void *data)
-{
-	struct brd_device *brd;
-	struct kobject *kobj;
-	bool new;
-
-	mutex_lock(&brd_devices_mutex);
-	brd = brd_init_one(MINOR(dev) / max_part, &new);
-	kobj = brd ? get_disk_and_module(brd->brd_disk) : NULL;
-	mutex_unlock(&brd_devices_mutex);
-
-	if (new)
-		*part = 0;
-
-	return kobj;
-}
-
 static inline void brd_check_and_reset_par(void)
 {
 	if (unlikely(!max_part))
@@ -510,11 +494,12 @@ static int __init brd_init(void)
 	 *	dynamically.
 	 */
 
-	if (register_blkdev(RAMDISK_MAJOR, "ramdisk"))
+	if (__register_blkdev(RAMDISK_MAJOR, "ramdisk", brd_probe))
 		return -EIO;
 
 	brd_check_and_reset_par();
 
+	mutex_lock(&brd_devices_mutex);
 	for (i = 0; i < rd_nr; i++) {
 		brd = brd_alloc(i);
 		if (!brd)
@@ -532,9 +517,7 @@ static int __init brd_init(void)
 		brd->brd_disk->queue = brd->brd_queue;
 		add_disk(brd->brd_disk);
 	}
-
-	blk_register_region(MKDEV(RAMDISK_MAJOR, 0), 1UL << MINORBITS,
-				  THIS_MODULE, brd_probe, NULL, NULL);
+	mutex_unlock(&brd_devices_mutex);
 
 	pr_info("brd: module loaded\n");
 	return 0;
@@ -544,6 +527,7 @@ static int __init brd_init(void)
 		list_del(&brd->brd_list);
 		brd_free(brd);
 	}
+	mutex_unlock(&brd_devices_mutex);
 	unregister_blkdev(RAMDISK_MAJOR, "ramdisk");
 
 	pr_info("brd: module NOT loaded !!!\n");
@@ -557,7 +541,6 @@ static void __exit brd_exit(void)
 	list_for_each_entry_safe(brd, next, &brd_devices, brd_list)
 		brd_del_one(brd);
 
-	blk_unregister_region(MKDEV(RAMDISK_MAJOR, 0), 1UL << MINORBITS);
 	unregister_blkdev(RAMDISK_MAJOR, "ramdisk");
 
 	pr_info("brd: module unloaded\n");
-- 
2.29.2


