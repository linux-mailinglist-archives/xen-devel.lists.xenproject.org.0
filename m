Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D32B4893
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28080.56767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg8X-00013w-N9; Mon, 16 Nov 2020 15:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28080.56767; Mon, 16 Nov 2020 15:09:45 +0000
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
	id 1keg8X-000121-5J; Mon, 16 Nov 2020 15:09:45 +0000
Received: by outflank-mailman (input) for mailman id 28080;
 Mon, 16 Nov 2020 15:09:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg0F-0006ni-4R
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f63c7646-2def-498b-8709-adcc420b5b00;
 Mon, 16 Nov 2020 14:59:09 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefy1-0003uf-KX; Mon, 16 Nov 2020 14:58:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg0F-0006ni-4R
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:11 +0000
X-Inumbo-ID: f63c7646-2def-498b-8709-adcc420b5b00
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f63c7646-2def-498b-8709-adcc420b5b00;
	Mon, 16 Nov 2020 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yQQZQPCQfQM7CUBXzCMUyqgLnLGQ9YPa8lq6jkcafKI=; b=WtUs/ZHHHWoA+J542Y6mYXW7Ql
	wMixYk/BvE60aD54t7ExUm0AxV6UzJxr06L6viTlvpgjC2bEe3/zxQDkJkIFlS0bzo78ksny7Nq6W
	OKlhR7wy5ubVTlN/2Y0WDj6CW0pG+vIu/78iIeWE+YehwQa4BqiEFEcMODKoBOrTVdWrXl0Sdysf+
	pclwOsbyiCLrKl06HyP8fs+vPQOuBjK9Uq0ldqvVHcha7jCChZf433xQg5wtWEVmIZ0Td1rSjgQ2R
	mY13xJ5gm6oR6Cum62zjZhpTXXhQHhsumfYYoZ2+ylyEnlTiukpjjXmewaWHdYuHaxhjjM+xQVSh0
	CxfvNOfw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefy1-0003uf-KX; Mon, 16 Nov 2020 14:58:53 +0000
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
Subject: [PATCH 31/78] loop: use set_disk_ro
Date: Mon, 16 Nov 2020 15:57:22 +0100
Message-Id: <20201116145809.410558-32-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_disk_ro instead of set_device_ro to match all other block
drivers and to ensure all partitions mirror the read-only flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 84a36c242e5550..41caf799df721f 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1134,7 +1134,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	if (error)
 		goto out_unlock;
 
-	set_device_ro(bdev, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
+	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
 	lo->lo_device = bdev;
-- 
2.29.2


