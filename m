Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4B2B48CB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28279.57393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAX-00075t-CL; Mon, 16 Nov 2020 15:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28279.57393; Mon, 16 Nov 2020 15:11:48 +0000
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
	id 1kegAV-0006wr-Aw; Mon, 16 Nov 2020 15:11:47 +0000
Received: by outflank-mailman (input) for mailman id 28279;
 Mon, 16 Nov 2020 15:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg1S-0006ni-6r
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:26 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e1cd4b6-f80e-4819-83f6-cebff75a7493;
 Mon, 16 Nov 2020 14:59:25 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyK-0003zL-Gc; Mon, 16 Nov 2020 14:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg1S-0006ni-6r
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:26 +0000
X-Inumbo-ID: 5e1cd4b6-f80e-4819-83f6-cebff75a7493
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5e1cd4b6-f80e-4819-83f6-cebff75a7493;
	Mon, 16 Nov 2020 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PZFkyvf1145z+UDf1b5Hj+jOh1AFkHrQzn1ghiqKhDM=; b=nsafq+rGm1Rv8PLkOskpq2E1WT
	GblaGkEbRxaXt7tMa8lsB0T/f5O44rOftO550QMTTXAsaN06O33HbZWw8qR8BuIC5LY1K1bDXw7h0
	fXI0JFhYf8Q4CM2W+FyYMvt6rxUABlRFuwShsT5ZmrGbHYU704qrV+elTl5Y7tXYggWdyVa22D/65
	XFEMEvNDmXdMEgGAPYiI8eQrdp7u2i1IGbuQVMZNL0XJlhyMGFQuZahfLnp3Jg/O7cmqHPhKanuYM
	OxeKkCkWcJqNNHH4YMUIOwRSUBMRc+b1rwJCOum2gr3Iswu9BqnghgCeZoZpkFA0tR3BGhjo23NTg
	G+sn0B+g==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyK-0003zL-Gc; Mon, 16 Nov 2020 14:59:12 +0000
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
Subject: [PATCH 44/78] loop: use __register_blkdev to allocate devices on demand
Date: Mon, 16 Nov 2020 15:57:35 +0100
Message-Id: <20201116145809.410558-45-hch@lst.de>
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
 drivers/block/loop.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 41caf799df721f..9a27d4f1c08aac 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2231,24 +2231,18 @@ static int loop_lookup(struct loop_device **l, int i)
 	return ret;
 }
 
-static struct kobject *loop_probe(dev_t dev, int *part, void *data)
+static void loop_probe(dev_t dev)
 {
+	int idx = MINOR(dev) >> part_shift;
 	struct loop_device *lo;
-	struct kobject *kobj;
-	int err;
+
+	if (max_loop && idx >= max_loop)
+		return;
 
 	mutex_lock(&loop_ctl_mutex);
-	err = loop_lookup(&lo, MINOR(dev) >> part_shift);
-	if (err < 0)
-		err = loop_add(&lo, MINOR(dev) >> part_shift);
-	if (err < 0)
-		kobj = NULL;
-	else
-		kobj = get_disk_and_module(lo->lo_disk);
+	if (loop_lookup(&lo, idx) < 0)
+		loop_add(&lo, idx);
 	mutex_unlock(&loop_ctl_mutex);
-
-	*part = 0;
-	return kobj;
 }
 
 static long loop_control_ioctl(struct file *file, unsigned int cmd,
@@ -2368,14 +2362,11 @@ static int __init loop_init(void)
 		goto err_out;
 
 
-	if (register_blkdev(LOOP_MAJOR, "loop")) {
+	if (__register_blkdev(LOOP_MAJOR, "loop", loop_probe)) {
 		err = -EIO;
 		goto misc_out;
 	}
 
-	blk_register_region(MKDEV(LOOP_MAJOR, 0), range,
-				  THIS_MODULE, loop_probe, NULL, NULL);
-
 	/* pre-create number of devices given by config or max_loop */
 	mutex_lock(&loop_ctl_mutex);
 	for (i = 0; i < nr; i++)
@@ -2401,16 +2392,11 @@ static int loop_exit_cb(int id, void *ptr, void *data)
 
 static void __exit loop_exit(void)
 {
-	unsigned long range;
-
-	range = max_loop ? max_loop << part_shift : 1UL << MINORBITS;
-
 	mutex_lock(&loop_ctl_mutex);
 
 	idr_for_each(&loop_index_idr, &loop_exit_cb, NULL);
 	idr_destroy(&loop_index_idr);
 
-	blk_unregister_region(MKDEV(LOOP_MAJOR, 0), range);
 	unregister_blkdev(LOOP_MAJOR, "loop");
 
 	misc_deregister(&loop_misc);
-- 
2.29.2


