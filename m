Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC12AEBDB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24419.51720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVm-00041k-GA; Wed, 11 Nov 2020 08:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24419.51720; Wed, 11 Nov 2020 08:29:50 +0000
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
	id 1kclVl-000406-SR; Wed, 11 Nov 2020 08:29:49 +0000
Received: by outflank-mailman (input) for mailman id 24419;
 Wed, 11 Nov 2020 08:29:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclVY-0002dF-LF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cfb7a9c-a23b-4275-8c7d-eddb810445ce;
 Wed, 11 Nov 2020 08:27:48 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTY-0007gX-LB; Wed, 11 Nov 2020 08:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclVY-0002dF-LF
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:36 +0000
X-Inumbo-ID: 1cfb7a9c-a23b-4275-8c7d-eddb810445ce
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1cfb7a9c-a23b-4275-8c7d-eddb810445ce;
	Wed, 11 Nov 2020 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qTvXuSKxmUERuRhycJyctBDf7GzVXaeOz2hEmG1jnCY=; b=StdRHq9eqGBzFFXpMKfN8ot2yd
	jPC1U+22bkuUiJFL3H0mb/9/1vlelGLQvG1hCH467eSdVW15dn8Pibm3EIxJwicffJfGSFU2WZAlL
	tM76FQA8Mhz7J0Dt012NqxGVof6CBWaiq+71e7SWBXxgz9PGD/HSjyzrq5laC3bHahSJjAdt/YgSg
	VK5FG4/KAjlBjCF1Mxk5ErE82Aw6rkXyhTwsy/FUzDELWaBKzEkjqbZ7oRMK+Qd8mrTJBHvgsXqEQ
	R94YnaXqfp4e3S0Qk0xduyFHl/C3X5yAr/DgMPQvmpUp8si6GBSW2z68gBmwcJiLLaIwE1WsQpe7C
	3Of9U5JA==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTY-0007gX-LB; Wed, 11 Nov 2020 08:27:33 +0000
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
Subject: [PATCH 24/24] block: unexport revalidate_disk_size
Date: Wed, 11 Nov 2020 09:26:58 +0100
Message-Id: <20201111082658.3401686-25-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

revalidate_disk_size is now only called from set_capacity_and_notify,
so drop the export.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 66ebf594c97f47..d8664f5c1ff669 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1362,7 +1362,6 @@ void revalidate_disk_size(struct gendisk *disk, bool verbose)
 		bdput(bdev);
 	}
 }
-EXPORT_SYMBOL(revalidate_disk_size);
 
 void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors)
 {
-- 
2.28.0


