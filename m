Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B339828B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135600.251979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKv2-0007rF-6P; Wed, 02 Jun 2021 07:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135600.251979; Wed, 02 Jun 2021 07:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKv1-0007io-Q3; Wed, 02 Jun 2021 07:03:59 +0000
Received: by outflank-mailman (input) for mailman id 135600;
 Wed, 02 Jun 2021 07:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKns-0007A2-70
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:56:36 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9809242-a8e4-4f1a-9400-4e7f8bf7d610;
 Wed, 02 Jun 2021 06:55:23 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmI-0025hI-AR; Wed, 02 Jun 2021 06:54:58 +0000
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
X-Inumbo-ID: c9809242-a8e4-4f1a-9400-4e7f8bf7d610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uZ7id5h0Y8eTodjolim75Nh4xqN5GmxeKJFIibiB+SQ=; b=Y+ZIEpYOA2iHCs2T6tZeqlhwn4
	2PZNnbXaohXgLYFyDB1Km2Bu2wyT0psxnFom5uMCa1WL63p08XIPFssnnwdwOWXz6S+f1NQhfrJgw
	DT/OnKnomp1fr4hlxHzl1uRlbcM58luxBJNmSQR1ISWEmb6j+xDelW/EPSueMH5qVJqvrMzGOnsJB
	1yLmbxBIjZuZM4gaGqkWw/56tktEZ+pXt7zHVQEX0324IpvUKx/kGJ0wdmf5QkCuJQDan3LvZi1gh
	v7Tu3lvr/4iTt31gmsoCM89vROF9iZm4xBhs773hy5MvLL57mXmlU4k/Fy9BEGPPXaP9XwV6nM+1f
	cFvfrZKA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 14/30] gdrom: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:29 +0300
Message-Id: <20210602065345.355274-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/cdrom/gdrom.c | 45 ++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index c6d8c0f59722..8e1fe75af93f 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -772,53 +772,50 @@ static int probe_gdrom(struct platform_device *devptr)
 		goto probe_fail_no_mem;
 	}
 	probe_gdrom_setupcd();
-	gd.disk = alloc_disk(1);
-	if (!gd.disk) {
-		err = -ENODEV;
-		goto probe_fail_no_disk;
+
+	err = blk_mq_alloc_sq_tag_set(&gd.tag_set, &gdrom_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (err)
+		goto probe_fail_free_cd_info;
+
+	gd.disk = blk_mq_alloc_disk(&gd.tag_set, NULL);
+	if (IS_ERR(gd.disk)) {
+		err = PTR_ERR(gd.disk);
+		goto probe_fail_free_tag_set;
 	}
+	gd.gdrom_rq = gd.disk->queue;
 	probe_gdrom_setupdisk();
 	if (register_cdrom(gd.disk, gd.cd_info)) {
 		err = -ENODEV;
-		goto probe_fail_cdrom_register;
+		goto probe_fail_cleanup_disk;
 	}
 	gd.disk->fops = &gdrom_bdops;
 	gd.disk->events = DISK_EVENT_MEDIA_CHANGE;
 	/* latch on to the interrupt */
 	err = gdrom_set_interrupt_handlers();
 	if (err)
-		goto probe_fail_cmdirq_register;
-
-	gd.gdrom_rq = blk_mq_init_sq_queue(&gd.tag_set, &gdrom_mq_ops, 1,
-				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
-	if (IS_ERR(gd.gdrom_rq)) {
-		err = PTR_ERR(gd.gdrom_rq);
-		gd.gdrom_rq = NULL;
-		goto probe_fail_requestq;
-	}
+		goto probe_fail_cleanup_disk;
 
 	err = probe_gdrom_setupqueue();
 	if (err)
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 
 	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
 	if (!gd.toc) {
 		err = -ENOMEM;
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 	}
 	add_disk(gd.disk);
 	return 0;
 
-probe_fail_toc:
-	blk_cleanup_queue(gd.gdrom_rq);
-	blk_mq_free_tag_set(&gd.tag_set);
-probe_fail_requestq:
+probe_fail_free_irqs:
 	free_irq(HW_EVENT_GDROM_DMA, &gd);
 	free_irq(HW_EVENT_GDROM_CMD, &gd);
-probe_fail_cmdirq_register:
-probe_fail_cdrom_register:
-	del_gendisk(gd.disk);
-probe_fail_no_disk:
+probe_fail_cleanup_disk:
+	blk_cleanup_disk(gd.disk);
+probe_fail_free_tag_set:
+	blk_mq_free_tag_set(&gd.tag_set);
+probe_fail_free_cd_info:
 	kfree(gd.cd_info);
 probe_fail_no_mem:
 	unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
-- 
2.30.2


