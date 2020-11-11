Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3889D2AEBD4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24416.51678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVe-0003pK-LA; Wed, 11 Nov 2020 08:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24416.51678; Wed, 11 Nov 2020 08:29:42 +0000
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
	id 1kclVe-0003od-Fc; Wed, 11 Nov 2020 08:29:42 +0000
Received: by outflank-mailman (input) for mailman id 24416;
 Wed, 11 Nov 2020 08:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclUp-0002dF-JS
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:51 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8891f72b-1465-4c5b-b8d1-26dbe9cb2862;
 Wed, 11 Nov 2020 08:27:40 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTN-0007dE-Rp; Wed, 11 Nov 2020 08:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclUp-0002dF-JS
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:51 +0000
X-Inumbo-ID: 8891f72b-1465-4c5b-b8d1-26dbe9cb2862
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8891f72b-1465-4c5b-b8d1-26dbe9cb2862;
	Wed, 11 Nov 2020 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WnN/7srg5pLReznCKKgcsF3AnXJUcZlbQO74sw0EfcM=; b=Yn9ZJJkFPKY+e/NLCTNecyPGTK
	il0irebR1t1HO/8eJQn4fbMXYeP8mJXUek8GZzwX4pJgWyXrPl2bszTSxZ11r9soxMYwduEgujiGA
	X5SuddMPNCCFAoWdlddCDN/5gXkyf48GJYtL9OOOBNVOfNJhfwKRc3vMXYv39ISngvdGZZ9qpscdU
	AAJZ8mdncp//thuUaUj0lxPvvkPCJyExBd5wbS0H7c6UR2fYb5ZxUpZQH4S5OO2eDLwnVsXgO8EC4
	/1K1AFxavSBN/H461PJ4OR0/zQpmT35t91FrNDjKal2wDZL90UO4VAADrInrBUoiXiOYnHJ5kHoNj
	G44xLvFQ==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTN-0007dE-Rp; Wed, 11 Nov 2020 08:27:22 +0000
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 17/24] rbd: use set_capacity_and_notify
Date: Wed, 11 Nov 2020 09:26:51 +0100
Message-Id: <20201111082658.3401686-18-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_capacity_and_notify to set the size of both the disk and block
device.  This also gets the uevent notifications for the resize for free.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/block/rbd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index f84128abade319..b7a194ffda55b4 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
 	    !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
 		size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
 		dout("setting size to %llu sectors", (unsigned long long)size);
-		set_capacity(rbd_dev->disk, size);
-		revalidate_disk_size(rbd_dev->disk, true);
+		set_capacity_and_notify(rbd_dev->disk, size);
 	}
 }
 
-- 
2.28.0


