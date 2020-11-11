Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A02AEBE3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:29:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24422.51742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVo-00047x-LV; Wed, 11 Nov 2020 08:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24422.51742; Wed, 11 Nov 2020 08:29:52 +0000
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
	id 1kclVo-00046K-DQ; Wed, 11 Nov 2020 08:29:52 +0000
Received: by outflank-mailman (input) for mailman id 24422;
 Wed, 11 Nov 2020 08:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclUV-0002dF-JE
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:31 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 221d66e4-11d5-4821-a163-918ee6d1d23e;
 Wed, 11 Nov 2020 08:27:32 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTI-0007c0-C4; Wed, 11 Nov 2020 08:27:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclUV-0002dF-JE
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:31 +0000
X-Inumbo-ID: 221d66e4-11d5-4821-a163-918ee6d1d23e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 221d66e4-11d5-4821-a163-918ee6d1d23e;
	Wed, 11 Nov 2020 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aTYccYixW8gbHYOBakp7ukQbj8m53SZz7oZSluFWVGc=; b=u/ozI6WBA8REfAwdRvhywExuNr
	JLlsRRFbzxUvhpbOhxUj8/yRTolc2kh0ts2NzCUCtvtIGjt7R+mL86s4iNKKy19DxPdRahEdhs7pR
	VWtl3HgZF75ovljLu1zA3T/5X+fFn3rmuS8w2OpsYFgzn7J0YuXm5T5t2THdt8scAYc5+kG47mtie
	yNOj6g1hD19a3zBv5h1AdD75GWTJEyW2t6w6Ar1OufkGiHlajaAgfjYMc64Hrs99tQQwSRtuKeGPk
	C900mkX+WRHnV1MWMEPhCqV0DdkzBlCFAXPcCILEVO5ocQBjNPNvC67NrkhDk+Rw1ZN2Zzateo5JG
	8ZYIrJAA==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTI-0007c0-C4; Wed, 11 Nov 2020 08:27:16 +0000
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
Subject: [PATCH 13/24] dm: use set_capacity_and_notify
Date: Wed, 11 Nov 2020 09:26:47 +0100
Message-Id: <20201111082658.3401686-14-hch@lst.de>
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
 drivers/md/dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c18fc25485186d..62ad44925e73ec 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1971,8 +1971,7 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
 	if (size != dm_get_size(md))
 		memset(&md->geometry, 0, sizeof(md->geometry));
 
-	set_capacity(md->disk, size);
-	bd_set_nr_sectors(md->bdev, size);
+	set_capacity_and_notify(md->disk, size);
 
 	dm_table_event_callback(t, event_callback, md);
 
-- 
2.28.0


