Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346872A9DC1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21073.47395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb7BL-0007v0-Bi; Fri, 06 Nov 2020 19:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21073.47395; Fri, 06 Nov 2020 19:13:55 +0000
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
	id 1kb7BL-0007tH-6M; Fri, 06 Nov 2020 19:13:55 +0000
Received: by outflank-mailman (input) for mailman id 21073;
 Fri, 06 Nov 2020 19:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb730-0004zS-T0
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:18 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3194473-3722-401b-8c84-454df2605b44;
 Fri, 06 Nov 2020 19:04:33 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb71y-0000yy-W9; Fri, 06 Nov 2020 19:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb730-0004zS-T0
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:18 +0000
X-Inumbo-ID: c3194473-3722-401b-8c84-454df2605b44
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c3194473-3722-401b-8c84-454df2605b44;
	Fri, 06 Nov 2020 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lumJq5B2fyOOj2vqJR3cb92lXUnjwfkYYs/CdjVL7AE=; b=eyjkFqW2Lg8XRbrrVkiRkq/qq2
	49XVx9Yxw07JHDacMMOeLzZz8HG1JveigO/MGLL9NyNBjvo9oJC6aYyW+UCA7pyMcIg2mlykFZ8zX
	ty8nCCzVLygdCiZkudRiTdi/W/FqGRVOeMQ9wpUURGDFOeF8z5DD8i/HOXTvwBHN3fV5U4peZe9Pq
	DgD3Jqo41QfIfZOp1cR5hXwFKm1Z/l9ILA6PmCBeYnfhJASEsooVpF4wac7NBiKSpHFXTDdkS/nwj
	fC+l47uqcwWBpLri1fI067m613ULNzIVBLSf1JS15xnnKfEZd/fTWViAQq5S1YviscxPom3cx2ros
	iJRrYOEA==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71y-0000yy-W9; Fri, 06 Nov 2020 19:04:15 +0000
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
Subject: [PATCH 14/24] pktcdvd: use set_capacity_and_notify
Date: Fri,  6 Nov 2020 20:03:26 +0100
Message-Id: <20201106190337.1973127-15-hch@lst.de>
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
 drivers/block/pktcdvd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 467dbd06b7cdb1..4326401cede445 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2130,8 +2130,7 @@ static int pkt_open_dev(struct pktcdvd_device *pd, fmode_t write)
 	}
 
 	set_capacity(pd->disk, lba << 2);
-	set_capacity(pd->bdev->bd_disk, lba << 2);
-	bd_set_nr_sectors(pd->bdev, lba << 2);
+	set_capacity_and_notify(pd->bdev->bd_disk, lba << 2);
 
 	q = bdev_get_queue(pd->bdev);
 	if (write) {
-- 
2.28.0


