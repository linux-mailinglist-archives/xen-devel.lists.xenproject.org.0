Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD22AEBE7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24427.51779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVu-0004Ni-Iz; Wed, 11 Nov 2020 08:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24427.51779; Wed, 11 Nov 2020 08:29:58 +0000
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
	id 1kclVu-0004LH-1a; Wed, 11 Nov 2020 08:29:58 +0000
Received: by outflank-mailman (input) for mailman id 24427;
 Wed, 11 Nov 2020 08:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclVO-0002dF-Kn
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:26 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80988304-fd99-4571-9f7c-807a6f36633b;
 Wed, 11 Nov 2020 08:27:46 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTV-0007f7-7D; Wed, 11 Nov 2020 08:27:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclVO-0002dF-Kn
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:29:26 +0000
X-Inumbo-ID: 80988304-fd99-4571-9f7c-807a6f36633b
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80988304-fd99-4571-9f7c-807a6f36633b;
	Wed, 11 Nov 2020 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VpoGqglFmdO7rnCbfTvzOvXddLcpMeI5Oi6kPi7JzMI=; b=fh6dXrMtrp6rcPPLQiDw9sObnB
	efyUG413uhXCb/QlAb9v8YRflPAq5yVp8u+GdJ3bhDBmbClXQ1kCpqH+iSdq//kveTtc0aIkz9/t1
	NlOAJ4US+n4Craqy3YLcf0d/UIIueyp+te++vbLGVABk4rzZkClrL41F56aqypppQdeDo+E3XqxqJ
	i+R8ENt7qFBaf1eEpWEC2Ev9uhlpwv3fW3tkYO79IfCJ8e8m8V20ceNDASmk3zIUqgUWaiXo3hZ8t
	x6L5b2uRc0iF0V0qiQuq2BgZgpQ3K0E2zlRsdDc30ePD0TrZzD8SAnDEx2V9S0Ja3dbtv/5M2xPH2
	2ywmdMQw==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTV-0007f7-7D; Wed, 11 Nov 2020 08:27:29 +0000
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
Subject: [PATCH 22/24] md: remove a spurious call to revalidate_disk_size in update_size
Date: Wed, 11 Nov 2020 09:26:56 +0100
Message-Id: <20201111082658.3401686-23-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

None of the ->resize methods updates the disk size, so calling
revalidate_disk_size here won't do anything.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/md/md-cluster.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 87442dc59f6ca3..35e2690c1803dd 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -1299,8 +1299,6 @@ static void update_size(struct mddev *mddev, sector_t old_dev_sectors)
 	} else {
 		/* revert to previous sectors */
 		ret = mddev->pers->resize(mddev, old_dev_sectors);
-		if (!ret)
-			revalidate_disk_size(mddev->gendisk, true);
 		ret = __sendmsg(cinfo, &cmsg);
 		if (ret)
 			pr_err("%s:%d: failed to send METADATA_UPDATED msg\n",
-- 
2.28.0


