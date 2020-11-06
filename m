Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF82A9DB0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21045.47251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb7Al-0006tf-PL; Fri, 06 Nov 2020 19:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21045.47251; Fri, 06 Nov 2020 19:13:19 +0000
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
	id 1kb7Al-0006tG-MB; Fri, 06 Nov 2020 19:13:19 +0000
Received: by outflank-mailman (input) for mailman id 21045;
 Fri, 06 Nov 2020 19:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb73F-0004zS-TT
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:33 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7921d658-9789-43de-af17-1d5558d8f5aa;
 Fri, 06 Nov 2020 19:04:36 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb723-00010x-Br; Fri, 06 Nov 2020 19:04:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb73F-0004zS-TT
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:05:33 +0000
X-Inumbo-ID: 7921d658-9789-43de-af17-1d5558d8f5aa
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7921d658-9789-43de-af17-1d5558d8f5aa;
	Fri, 06 Nov 2020 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tNHc+yKxFex2BA3VRJKRfYT+Q/BQGvkbTVBIgZi7Zak=; b=uwbAYUWtYsWNkpwUoogtJngFDI
	X2niLn/0gDbVghXFusMEzeWZ+C5KIQwkGtGxGZ6oxJj5WI+iW+O0SJnD2dR7Qk1cxpxM1Piqqibv1
	W2PHD40tu/vh96I3Z/yauJblfPpdXElTpc73LpnmGWgwgPicld7nbqsXMhQ6te+RWkgdNHLDoexl6
	4ZtBRCP240kPDW2iHuDGSh6PBKkb6TKwmX9M9z5dbJ2wi7u/yKw5Ye3Y1JEeN7/i6H6eJ4opYNCFv
	Z6kB/Jw1bpis23wpaAMdzULdhHjFYROT27VSovcE6cIP+UJFN2KPawN+zY68HvUyNDxCK9BDtcB3r
	KthEYJEA==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb723-00010x-Br; Fri, 06 Nov 2020 19:04:20 +0000
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
Subject: [PATCH 16/24] drbd: use set_capacity_and_notify
Date: Fri,  6 Nov 2020 20:03:28 +0100
Message-Id: <20201106190337.1973127-17-hch@lst.de>
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
 drivers/block/drbd/drbd_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 65b95aef8dbc95..1c8c18b2a25f33 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2036,8 +2036,7 @@ void drbd_set_my_capacity(struct drbd_device *device, sector_t size)
 {
 	char ppb[10];
 
-	set_capacity(device->vdisk, size);
-	revalidate_disk_size(device->vdisk, false);
+	set_capacity_and_notify(device->vdisk, size);
 
 	drbd_info(device, "size = %s (%llu KB)\n",
 		ppsize(ppb, size>>1), (unsigned long long)size>>1);
@@ -2068,8 +2067,7 @@ void drbd_device_cleanup(struct drbd_device *device)
 	}
 	D_ASSERT(device, first_peer_device(device)->connection->net_conf == NULL);
 
-	set_capacity(device->vdisk, 0);
-	revalidate_disk_size(device->vdisk, false);
+	set_capacity_and_notify(device->vdisk, 0);
 	if (device->bitmap) {
 		/* maybe never allocated. */
 		drbd_bm_resize(device, 0, 1);
-- 
2.28.0


