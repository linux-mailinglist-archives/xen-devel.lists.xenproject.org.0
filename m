Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFD902FF8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737607.1144040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtva-0000xl-PN; Tue, 11 Jun 2024 05:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737607.1144040; Tue, 11 Jun 2024 05:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtva-0000vY-KU; Tue, 11 Jun 2024 05:20:14 +0000
Received: by outflank-mailman (input) for mailman id 737607;
 Tue, 11 Jun 2024 05:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtvZ-0006gk-Ai
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:13 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 463fc4c0-27b2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:20:11 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvI-00000007Qyl-3It7; Tue, 11 Jun 2024 05:19:57 +0000
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
X-Inumbo-ID: 463fc4c0-27b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=kL0f+BmFpJHwuUReMJjo5PGBiELHza4z/Zsrvg8Z7ys=; b=gdW9T5rz4N+rEJBWq0kAF2g3Vp
	o77U9+9fDZ5/f3DhEVBIVnsx+JISiCMAKbcTag0Zkah1FJ+d7ef7a0XWw5GyKTOuAjHDH2z6PQLXI
	qqm8eVD9+X/AUEDR4su0Fv0ORO890Gug6klvG+fz9LLmonMsZ/nWiuFaMeJEtd1ZpWZnp/6SQiBuw
	sJhpQDUOouNBi1OIMt6miJfjkGSe6SkbiTNcGWDKAw5t83d+9BGwUvy+rhPKTllj7eZvWDRIHkv9C
	XGWPCU2DEv4+tkiZUyd+xNvRq9iNhaNZSATRihjuGMZhyNxWmkMH18Ug0QkgF+uOM87yi68/tGWq+
	D62iDLEw==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
Date: Tue, 11 Jun 2024 07:19:08 +0200
Message-ID: <20240611051929.513387-9-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

virtblk_update_cache_mode boils down to a single call to
blk_queue_write_cache.  Remove it in preparation for moving the cache
control flags into the queue_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2351f411fa4680..378b241911ca87 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1089,14 +1089,6 @@ static int virtblk_get_cache_mode(struct virtio_device *vdev)
 	return writeback;
 }
 
-static void virtblk_update_cache_mode(struct virtio_device *vdev)
-{
-	u8 writeback = virtblk_get_cache_mode(vdev);
-	struct virtio_blk *vblk = vdev->priv;
-
-	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-}
-
 static const char *const virtblk_cache_types[] = {
 	"write through", "write back"
 };
@@ -1116,7 +1108,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 		return i;
 
 	virtio_cwrite8(vdev, offsetof(struct virtio_blk_config, wce), i);
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(disk->queue, virtblk_get_cache_mode(vdev), false);
 	return count;
 }
 
@@ -1528,7 +1520,8 @@ static int virtblk_probe(struct virtio_device *vdev)
 	vblk->index = index;
 
 	/* configure queue flush support */
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(vblk->disk->queue, virtblk_get_cache_mode(vdev),
+			false);
 
 	/* If disk is read-only in the host, the guest should obey */
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_RO))
-- 
2.43.0


