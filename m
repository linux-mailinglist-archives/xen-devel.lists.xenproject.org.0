Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F802AEB60
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24370.51611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclTs-0002y8-LQ; Wed, 11 Nov 2020 08:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24370.51611; Wed, 11 Nov 2020 08:27:52 +0000
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
	id 1kclTs-0002x8-Fs; Wed, 11 Nov 2020 08:27:52 +0000
Received: by outflank-mailman (input) for mailman id 24370;
 Wed, 11 Nov 2020 08:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclTr-0002dF-HG
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:27:51 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1d9a267-22c6-41c1-b11d-53cc22540c4e;
 Wed, 11 Nov 2020 08:27:25 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclT6-0007Zx-Ef; Wed, 11 Nov 2020 08:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclTr-0002dF-HG
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:27:51 +0000
X-Inumbo-ID: e1d9a267-22c6-41c1-b11d-53cc22540c4e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1d9a267-22c6-41c1-b11d-53cc22540c4e;
	Wed, 11 Nov 2020 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5qPdl0lgCEFGJP5lmM9cIt5xVilmdrR4jnFYjPe6Rv8=; b=Ls58rLr6Jmuq6v/NWUCE8TiQve
	QBjPwhQnxk5CSZDABDmV5Iyu5nLZjZdDmarW2RJ3+wQ5CV5i02GTCtgGza5/Yikfz5DAuG4zguCCG
	EgI2R68wska0Fvawliu6ZPQh4vTvOEmDa4t/Qtue0sps/HKOLz+4l8CHVpEuyJgxKspc63ZIHdpKU
	Uq3vr9AJQ5geGGAUVhvBJa5nv2zB+UeNiCzfSwqeiFVJbNutC+jduzyz0hsShH64P+ui1tcelTUh9
	yk7kRWHvmVGXLbg/oeCZFpx13CQpxXc9aqGPjNAocrsQQUXFrFu2FbaPQL06RNU64LcD6XqJk4iCo
	SOHcJEpw==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclT6-0007Zx-Ef; Wed, 11 Nov 2020 08:27:04 +0000
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
Subject: [PATCH 04/24] sd: update the bdev size in sd_revalidate_disk
Date: Wed, 11 Nov 2020 09:26:38 +0100
Message-Id: <20201111082658.3401686-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

This avoids the extra call to revalidate_disk_size in sd_rescan and
is otherwise a no-op because the size did not change, or we are in
the probe path.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/scsi/sd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 656bcf4940d6d1..4a34dd5b153196 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1750,10 +1750,8 @@ static int sd_sync_cache(struct scsi_disk *sdkp, struct scsi_sense_hdr *sshdr)
 static void sd_rescan(struct device *dev)
 {
 	struct scsi_disk *sdkp = dev_get_drvdata(dev);
-	int ret;
 
-	ret = sd_revalidate_disk(sdkp->disk);
-	revalidate_disk_size(sdkp->disk, ret == 0);
+	sd_revalidate_disk(sdkp->disk);
 }
 
 static int sd_ioctl(struct block_device *bdev, fmode_t mode,
@@ -3266,7 +3264,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	sdkp->first_scan = 0;
 
 	set_capacity_revalidate_and_notify(disk,
-		logical_to_sectors(sdp, sdkp->capacity), false);
+		logical_to_sectors(sdp, sdkp->capacity), true);
 	sd_config_write_same(sdkp);
 	kfree(buffer);
 
@@ -3276,7 +3274,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	 * capacity to 0.
 	 */
 	if (sd_zbc_revalidate_zones(sdkp))
-		set_capacity_revalidate_and_notify(disk, 0, false);
+		set_capacity_revalidate_and_notify(disk, 0, true);
 
  out:
 	return 0;
-- 
2.28.0


