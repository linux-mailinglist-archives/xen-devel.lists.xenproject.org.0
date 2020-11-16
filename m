Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E62B488E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28083.56793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg8Z-00018m-Ci; Mon, 16 Nov 2020 15:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28083.56793; Mon, 16 Nov 2020 15:09:47 +0000
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
	id 1keg8Y-00015w-Sd; Mon, 16 Nov 2020 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 28083;
 Mon, 16 Nov 2020 15:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg0e-0006ni-59
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18fe1c3d-ab60-458b-bf87-aa52f0c77773;
 Mon, 16 Nov 2020 14:59:12 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefy5-0003vm-UU; Mon, 16 Nov 2020 14:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg0e-0006ni-59
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:36 +0000
X-Inumbo-ID: 18fe1c3d-ab60-458b-bf87-aa52f0c77773
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 18fe1c3d-ab60-458b-bf87-aa52f0c77773;
	Mon, 16 Nov 2020 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v/lQzgfk3g8cFkaFjGaW1PVi+J4d/Qp7XTb0qTcrcMw=; b=YqzdVakmLdPHF6ezNwy3j22Rhk
	XQVP6AxA/GIysbqTVVeNbFaXKt7fGm9agC08PMgcnJUJeh74vxBSvOfGIuDA/W9HICp10ASgp343S
	hLuXPuNnKIIaKSmewfilQzler2ZMSLSZNnA3JzXsI/oA/vpGcupQtF+vIl+sykv24N3IbJmKQaPjW
	Jn9WRJEVebbUFdcTwhZRo/qo4f5NgH2pRWNmJeZrAnILNTOw/lnNzTwrq9w/rBYEhDgZjS59KWZ4g
	UrBImqs7+qvykUY+GYj6lm5Ht8/hTyu9yEFUWTYQLA51bItg9eUgBTuodXJbLE5gVUevZsuOFItUu
	Kp0yfIOw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefy5-0003vm-UU; Mon, 16 Nov 2020 14:58:58 +0000
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
Subject: [PATCH 34/78] block: propagate BLKROSET to all partitions
Date: Mon, 16 Nov 2020 15:57:25 +0100
Message-Id: <20201116145809.410558-35-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

When setting the whole device read-only (or clearing the read-only
state), also update the policy for all partitions.  The s390 dasd
driver has awlways been doing this and it makes a lot of sense.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 6b785181344fe1..22f394d118c302 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -354,7 +354,10 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		if (ret)
 			return ret;
 	}
-	bdev->bd_part->policy = n;
+	if (bdev_is_partition(bdev))
+		bdev->bd_part->policy = n;
+	else
+		set_disk_ro(bdev->bd_disk, n);
 	return 0;
 }
 
-- 
2.29.2


