Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE73A85CD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 17:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142253.262538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBSJ-0005is-Id; Tue, 15 Jun 2021 15:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142253.262538; Tue, 15 Jun 2021 15:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBSJ-0005fx-El; Tue, 15 Jun 2021 15:58:23 +0000
Received: by outflank-mailman (input) for mailman id 142253;
 Tue, 15 Jun 2021 15:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0zBy=LJ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1ltBSI-0005fr-ID
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 15:58:22 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 859362b2-a941-4111-8521-36d730b248c3;
 Tue, 15 Jun 2021 15:58:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 757AD67373; Tue, 15 Jun 2021 17:58:17 +0200 (CEST)
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
X-Inumbo-ID: 859362b2-a941-4111-8521-36d730b248c3
Date: Tue, 15 Jun 2021 17:58:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 09/30] mtd_blkdevs: use blk_mq_alloc_disk
Message-ID: <20210615155817.GA31047@lst.de>
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-10-hch@lst.de> <CGME20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61@eucas1p1.samsung.com> <13b21a07-b7c7-37db-fdc9-77bf174b6f8f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13b21a07-b7c7-37db-fdc9-77bf174b6f8f@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 15, 2021 at 05:47:44PM +0200, Marek Szyprowski wrote:
> Hi,
> 
> On 02.06.2021 08:53, Christoph Hellwig wrote:
> > Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> > allocation.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> This patch landed in linux-next as commit 6966bb921def ("mtd_blkdevs: 
> use blk_mq_alloc_disk"). It causes the following regression on my QEMU 
> arm64 setup:

Please try the patch below:

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 5dc4c966ea73..6ce4bc57f919 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -382,6 +382,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 
 	new->disk = gd;
+	new->rq = new->disk->queue;
 	gd->private_data = new;
 	gd->major = tr->major;
 	gd->first_minor = (new->devnum) << tr->part_bits;

