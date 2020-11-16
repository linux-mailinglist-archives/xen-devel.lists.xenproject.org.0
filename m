Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1C2B470F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28039.56678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kefzB-0008La-1y; Mon, 16 Nov 2020 15:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28039.56678; Mon, 16 Nov 2020 15:00:05 +0000
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
	id 1kefzA-0008Ip-Sb; Mon, 16 Nov 2020 15:00:04 +0000
Received: by outflank-mailman (input) for mailman id 28039;
 Mon, 16 Nov 2020 15:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefyi-0006ni-14
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82a48279-115e-4cee-aa4f-0f74e6244596;
 Mon, 16 Nov 2020 14:58:43 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxb-0003mp-ER; Mon, 16 Nov 2020 14:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefyi-0006ni-14
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:36 +0000
X-Inumbo-ID: 82a48279-115e-4cee-aa4f-0f74e6244596
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 82a48279-115e-4cee-aa4f-0f74e6244596;
	Mon, 16 Nov 2020 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j/0/qXcDYvQ/KRFTCfbeLrD6BKftlYW1jMJrLTQknrA=; b=byXWvuFWUAS6lZPm5Zeq7p8bBe
	us/bzllqhkru2czyVVokQTTeYL+/3nVsuU4/rDhYvEj/ImRfWDgds8ciFSHt3DJegL3w+3AQaGHag
	PKasBfLdKS5E4pWdTFh6/4uyvJRFiUdVWjcV1a5aQvY/kBYNo4iLxhmPSh2kdJdTp7A4ixInIx3wo
	JpWIePokKzvwp8PcbSTxxumquRpS137WC1RZjgyVjiJeOwfVg8ecKo6rYbXAhcQrObDK5SeQ3EIfa
	OTrz4SZ5xlHtXA94sJkOV0q/92afNyn3WLIhIoPBbXq1zA8kztmL78I31XmGh7QR7o5AcHIy7rcAn
	HnC1nGVw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxb-0003mp-ER; Mon, 16 Nov 2020 14:58:27 +0000
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
Subject: [PATCH 13/78] pktcdvd: use set_capacity_and_notify
Date: Mon, 16 Nov 2020 15:57:04 +0100
Message-Id: <20201116145809.410558-14-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
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
2.29.2


