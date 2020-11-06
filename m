Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C972A9DBA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21054.47323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb7B6-0007Kn-9R; Fri, 06 Nov 2020 19:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21054.47323; Fri, 06 Nov 2020 19:13:40 +0000
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
	id 1kb7B6-0007JV-1q; Fri, 06 Nov 2020 19:13:40 +0000
Received: by outflank-mailman (input) for mailman id 21054;
 Fri, 06 Nov 2020 19:13:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb73e-0004zS-UN
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:58 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d2a0a4-76e6-42f3-b969-4861d3bd38cf;
 Fri, 06 Nov 2020 19:04:44 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb725-00012H-Kj; Fri, 06 Nov 2020 19:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb73e-0004zS-UN
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:58 +0000
X-Inumbo-ID: e2d2a0a4-76e6-42f3-b969-4861d3bd38cf
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e2d2a0a4-76e6-42f3-b969-4861d3bd38cf;
	Fri, 06 Nov 2020 19:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N8UuGGw9lDirN906bdHNl2lOQB2uewg0ZSFqxQb7Dc4=; b=EbShoq0e9ZdxuHzJ//Stacuw58
	fWC0EbT3bDkc4a76CHYJxCWttwRI59GvoSaEU0SW0M22mNQkH3EhRrAKd+QvVHizyPlJeJ0kMVJ4i
	zHx7ItnO6W/fLLrYnw+S/gSCKqgdFCCws7Nqwvf507VfDEMI+rvO4uJnsRlROtxVrdeIy2E7YL3TL
	S7BmHPSe96rpbKQWzhRBiwcBzWjvB4sisrJVYeefsUF98+rDlF7LunTgLETgKBtlqQ1KRVmOxV937
	0aBRSGfCuluO2qQ6XYWclmFOBtO86wc6DyjOSAZKELdbbXCgn+Cmrf4JQhJv1RVmx1A2l424dcPHJ
	70sIudTA==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb725-00012H-Kj; Fri, 06 Nov 2020 19:04:22 +0000
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
Date: Fri,  6 Nov 2020 20:03:29 +0100
Message-Id: <20201106190337.1973127-18-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_capacity_and_notify to set the size of both the disk and block
device.  This also gets the uevent notifications for the resize for free.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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


