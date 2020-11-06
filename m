Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20282A9CFD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20997.47155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb729-00055J-Hb; Fri, 06 Nov 2020 19:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20997.47155; Fri, 06 Nov 2020 19:04:25 +0000
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
	id 1kb729-00054o-E0; Fri, 06 Nov 2020 19:04:25 +0000
Received: by outflank-mailman (input) for mailman id 20997;
 Fri, 06 Nov 2020 19:04:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb727-0004zS-RK
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:23 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6a1d530-ceae-4c28-a0ef-252dc15e9ac8;
 Fri, 06 Nov 2020 19:04:12 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb71P-0000t7-34; Fri, 06 Nov 2020 19:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb727-0004zS-RK
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:23 +0000
X-Inumbo-ID: d6a1d530-ceae-4c28-a0ef-252dc15e9ac8
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6a1d530-ceae-4c28-a0ef-252dc15e9ac8;
	Fri, 06 Nov 2020 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KZOj2ixaxfr+x29An18oeDfaJx3FSv//8uc71Hhn2A0=; b=snjJGRx7qVkoWA28XGyBSN/FU5
	1P5/6U8yQxPbAyQppy+ZGNo7hD7TWcSzoG9wJV5MoXxMDDYieBlcG6uvG1NU21CqTnxt3WKQtAuJf
	UqKqna1ID0lcpQmhrivJzFz3YtmWKpZm0KUamzMFajaTMK5TOilliU8pAMmZ7jcA4xKsEPe9u9FQe
	QLgag4ggR9M8REy4gaAzi95ookXu/+vKsN1gxvlBcIDCNpbUaA+k+bepajweHAsKHRlnIci3X0/gt
	+qiwIBcx7dd+5GmJaUUfQwr2V0s1euix28lr0Y0k8IK6gPjGXKGEZvDvsOwgNI/M1zhmywSH4Q6X6
	FMOFWKCQ==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71P-0000t7-34; Fri, 06 Nov 2020 19:03:47 +0000
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
Subject: cleanup updating the size of block devices
Date: Fri,  6 Nov 2020 20:03:12 +0100
Message-Id: <20201106190337.1973127-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this series builds on top of the work that went into the last merge window,
and make sure we have a single coherent interfac for updating the size of a
block device.

Diffstat:
 block/genhd.c                  |   16 +++----
 drivers/block/aoe/aoecmd.c     |   15 +-----
 drivers/block/drbd/drbd_main.c |    6 --
 drivers/block/loop.c           |   36 ++--------------
 drivers/block/nbd.c            |   88 +++++++++++++----------------------------
 drivers/block/pktcdvd.c        |    3 -
 drivers/block/rbd.c            |    3 -
 drivers/block/rnbd/rnbd-clt.c  |    3 -
 drivers/block/virtio_blk.c     |    3 -
 drivers/block/xen-blkfront.c   |    2 
 drivers/block/zram/zram_drv.c  |    7 ---
 drivers/md/dm-raid.c           |    3 -
 drivers/md/dm.c                |    3 -
 drivers/md/md-cluster.c        |    8 ---
 drivers/md/md-linear.c         |    3 -
 drivers/md/md.c                |   24 ++++-------
 drivers/nvme/host/core.c       |   18 --------
 drivers/scsi/sd.c              |    9 +---
 fs/block_dev.c                 |    7 ---
 include/linux/genhd.h          |    3 -
 20 files changed, 76 insertions(+), 184 deletions(-)

