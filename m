Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CD2AEBD3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24417.51690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVf-0003qY-96; Wed, 11 Nov 2020 08:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24417.51690; Wed, 11 Nov 2020 08:29:43 +0000
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
	id 1kclVe-0003pG-Rh; Wed, 11 Nov 2020 08:29:42 +0000
Received: by outflank-mailman (input) for mailman id 24417;
 Wed, 11 Nov 2020 08:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclV9-0002dF-K5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d5f442b-70e7-48e9-8b55-ee48768ad375;
 Wed, 11 Nov 2020 08:27:44 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTS-0007eJ-94; Wed, 11 Nov 2020 08:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclV9-0002dF-K5
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:11 +0000
X-Inumbo-ID: 6d5f442b-70e7-48e9-8b55-ee48768ad375
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6d5f442b-70e7-48e9-8b55-ee48768ad375;
	Wed, 11 Nov 2020 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WS/5HaJpXF8+Aj3VZ2GQ3e6HnWhXjc79y2mDNxe6L1Y=; b=f4V0HAWekMYcBSj6o8XWWUTCFm
	T5BclxNb2e1/yCArOCAZtaHpaI5MIvAMBAlmQ09k0Vs5C7H5osSMi/yyi2ooqWwolZX/hl/HmmgsB
	D+jP8pA5ScU2KctsL6oRx5X33ddFNfX2rqUIjTaXwq9GiEa355k5oV92nC5tQ+6+9kGxVSh/UNgqs
	aOBS/lcTMjIHcJ1f2lfO4I99IxF6tvVGFNOs4sU6QXK89CfJsoeXu3Sdp0W7hScHrIw+mif8uzQfL
	3ybKz/y66nVaw99jpra4/f6IwWze87BLSvE7QXpx7MYzrjqlbJlkDiYUTnrhStUMf69bg/OhD0sEJ
	FL2tuymg==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTS-0007eJ-94; Wed, 11 Nov 2020 08:27:26 +0000
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
Subject: [PATCH 20/24] dm-raid: use set_capacity_and_notify
Date: Wed, 11 Nov 2020 09:26:54 +0100
Message-Id: <20201111082658.3401686-21-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use set_capacity_and_notify to set the size of both the disk and block
device.  This also gets the uevent notifications for the resize for free.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-raid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 9c1f7c4de65b35..294f34d2d61bae 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -700,8 +700,7 @@ static void rs_set_capacity(struct raid_set *rs)
 {
 	struct gendisk *gendisk = dm_disk(dm_table_get_md(rs->ti->table));
 
-	set_capacity(gendisk, rs->md.array_sectors);
-	revalidate_disk_size(gendisk, true);
+	set_capacity_and_notify(gendisk, rs->md.array_sectors);
 }
 
 /*
-- 
2.28.0


