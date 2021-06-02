Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27383398281
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135552.251870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKub-0001j7-UZ; Wed, 02 Jun 2021 07:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135552.251870; Wed, 02 Jun 2021 07:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKub-0001SB-Df; Wed, 02 Jun 2021 07:03:33 +0000
Received: by outflank-mailman (input) for mailman id 135552;
 Wed, 02 Jun 2021 07:03:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKov-0007A2-9Q
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:57:41 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 753a3bf8-eb67-40a9-9ab9-e22be25b8ddd;
 Wed, 02 Jun 2021 06:55:51 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmj-00260g-93; Wed, 02 Jun 2021 06:55:26 +0000
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
X-Inumbo-ID: 753a3bf8-eb67-40a9-9ab9-e22be25b8ddd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dPXgPagX0YUjFpHkmb7+BJvE2rgQGNh10xmKRHSEoBw=; b=BmfFZoZgZc3og4CmFwOmdLx19i
	QO/EHgrku+yvgdhYC17jfB1aTEH3npIjzEWzSTOP+FtfRG47SoCYsd6XDZdDvG8QFc30baslGnBO5
	603qv1a5lD3zj6piDqc7/7HezJHswlQmBy2hQzdsqi+Pq2AqXMvtz6CZelFZP4OuEsOQ481G/g0oe
	2D5d45xL9+Y8IhSZ0SJ7QgmfDd59y+PvwieZLqYIaXHXwCMZQBwPlFGdwrK57V7ShUrkG8V37WJ3E
	EOpP42tJMZNBze5kjBlU3735zuT501c+A9ju4eeM4xto97GnaI9ogfZqwLOqhLmVBPmt6XU0UdEOR
	G7vAYXaA==;
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
Subject: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:35 +0300
Message-Id: <20210602065345.355274-21-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/null_blk/main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index d8e098f1e5b5..74fb2ec63219 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1851,13 +1851,12 @@ static int null_add_dev(struct nullb_device *dev)
 
 		rv = -ENOMEM;
 		nullb->tag_set->timeout = 5 * HZ;
-		nullb->q = blk_mq_init_queue_data(nullb->tag_set, nullb);
-		if (IS_ERR(nullb->q))
-			goto out_cleanup_tags;
-		nullb->disk = alloc_disk_node(1, nullb->dev->home_node);
-		if (!nullb->disk)
+		nullb->disk = blk_mq_alloc_disk(nullb->tag_set, nullb);
+		if (IS_ERR(nullb->disk)) {
+			rv = PTR_ERR(nullb->disk);
 			goto out_cleanup_disk;
-		nullb->disk->queue = nullb->q;
+		}
+		nullb->q = nullb->disk->queue;
 	} else if (dev->queue_mode == NULL_Q_BIO) {
 		rv = -ENOMEM;
 		nullb->disk = blk_alloc_disk(nullb->dev->home_node);
-- 
2.30.2


