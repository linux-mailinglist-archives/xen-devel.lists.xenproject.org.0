Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D682A9CF7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20996.47144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb724-000524-Af; Fri, 06 Nov 2020 19:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20996.47144; Fri, 06 Nov 2020 19:04:20 +0000
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
	id 1kb724-00051F-5z; Fri, 06 Nov 2020 19:04:20 +0000
Received: by outflank-mailman (input) for mailman id 20996;
 Fri, 06 Nov 2020 19:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb722-0004zS-R7
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:18 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eaefe42-f66e-4f13-82d6-e370c42c2d0e;
 Fri, 06 Nov 2020 19:04:11 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb71X-0000tW-UC; Fri, 06 Nov 2020 19:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb722-0004zS-R7
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:18 +0000
X-Inumbo-ID: 2eaefe42-f66e-4f13-82d6-e370c42c2d0e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2eaefe42-f66e-4f13-82d6-e370c42c2d0e;
	Fri, 06 Nov 2020 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=stmwFAlkeYayJwqxLAzxAb5snaHT5ewOrHfW4MD4mwk=; b=tB2Wdu/PMT4HaSqbNXLjbJSinK
	5hsrT8s37btBvfcSB9O4uU93SD5PFBnxHXny99OrIualpr25xUxUD6huKCkWn/+mqbBjsPu8GBT2K
	BThvX+OWl/FleZFRHiOhjc346V7c34ia1qBhD1BbATvc5xUrGPzH/rmzYuoB0ZX7+lPL+RKQlCljc
	jG3EgsYXLaMRAjav+9rOo/D7/8GwP4iHme6XgziXy4nXb8g0UObGiuuRw0pjd58Xmnsj883VpUPPn
	/WqbOngIbQjdRi22wAva6IBkP7TmfNzppcbD1VYiYpN4uQufsS9sHdI0GfKYll6bY7LU3TdfwkqXU
	DJQocnLQ==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71X-0000tW-UC; Fri, 06 Nov 2020 19:03:50 +0000
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
Subject: [PATCH 01/24] block: remove the call to __invalidate_device in check_disk_size_change
Date: Fri,  6 Nov 2020 20:03:13 +0100
Message-Id: <20201106190337.1973127-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

__invalidate_device without the kill_dirty parameter just invalidates
various clean entries in caches, which doesn't really help us with
anything, but can cause all kinds of horrible lock orders due to how
it calls into the file system.  The only reason this hasn't been a
major issue is because so many people use partitions, for which no
invalidation was performed anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 9e84b1928b9401..66ebf594c97f47 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1334,12 +1334,6 @@ static void check_disk_size_change(struct gendisk *disk,
 		i_size_write(bdev->bd_inode, disk_size);
 	}
 	spin_unlock(&bdev->bd_size_lock);
-
-	if (bdev_size > disk_size) {
-		if (__invalidate_device(bdev, false))
-			pr_warn("VFS: busy inodes on resized disk %s\n",
-				disk->disk_name);
-	}
 }
 
 /**
-- 
2.28.0


