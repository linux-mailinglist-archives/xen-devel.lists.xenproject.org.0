Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EB2A9DB4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21047.47276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb7Av-00073N-Lb; Fri, 06 Nov 2020 19:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21047.47276; Fri, 06 Nov 2020 19:13:29 +0000
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
	id 1kb7Av-00072X-Gg; Fri, 06 Nov 2020 19:13:29 +0000
Received: by outflank-mailman (input) for mailman id 21047;
 Fri, 06 Nov 2020 19:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb73j-0004zS-Uc
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:06:03 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 671ed6c6-ed7f-496a-86e9-f374c89d5dce;
 Fri, 06 Nov 2020 19:04:50 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb72H-00017b-Qy; Fri, 06 Nov 2020 19:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb73j-0004zS-Uc
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:06:03 +0000
X-Inumbo-ID: 671ed6c6-ed7f-496a-86e9-f374c89d5dce
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 671ed6c6-ed7f-496a-86e9-f374c89d5dce;
	Fri, 06 Nov 2020 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MupYDI4l/YovZ7RWUiZbIkKTEoIVA+KjloyNnUiTimo=; b=iiGVfdCIPPX+IkfTbBzmxkNClz
	t982+XiX0rLzTMHY8HFo1Fp5Mtn7rK+diWNO+RHxxMdKcJUTti2/wcEDk1JuKfU/o4+K8dKleodTE
	HTiaGtNCpYoo9vb3GGX4aLbLQQjLGGtNWkpDZpYqEwfuTn9hbBczupYDxFhREBpBASbSx6M7Lze9e
	iKaTzCv7Ayt/qABbDvowSzznAcYB/VzFYgYnipTJO4suLkefkpjbVL2Cs7whyJwZIOchXyT0sQa+l
	gQuWBa19/ZwoPZGFHeWQytUlRCgvx6EJq35hta2jU2txOK4i/ZI7bcgxRU7PROSuEa2OkMTwR08Xi
	9io2po4w==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb72H-00017b-Qy; Fri, 06 Nov 2020 19:04:34 +0000
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
Subject: [PATCH 23/24] virtio-blk: remove a spurious call to revalidate_disk_size
Date: Fri,  6 Nov 2020 20:03:35 +0100
Message-Id: <20201106190337.1973127-24-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

revalidate_disk_size just updates the block device size from the disk
size.  Thus calling it from revalidate_disk_size doesn't actually do
anything.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 3e812b4c32e669..145606dc52db1e 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -598,7 +598,6 @@ static void virtblk_update_cache_mode(struct virtio_device *vdev)
 	struct virtio_blk *vblk = vdev->priv;
 
 	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-	revalidate_disk_size(vblk->disk, true);
 }
 
 static const char *const virtblk_cache_types[] = {
-- 
2.28.0


