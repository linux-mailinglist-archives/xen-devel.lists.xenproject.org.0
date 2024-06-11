Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092819031F0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737839.1144331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuXK-0004yr-Vr; Tue, 11 Jun 2024 05:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737839.1144331; Tue, 11 Jun 2024 05:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuXK-0004wt-RA; Tue, 11 Jun 2024 05:59:14 +0000
Received: by outflank-mailman (input) for mailman id 737839;
 Tue, 11 Jun 2024 05:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QBFV=NN=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sGuXJ-0004hc-7X
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:59:13 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9656513-27b7-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:59:11 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B7C0F68CFE; Tue, 11 Jun 2024 07:59:06 +0200 (CEST)
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
X-Inumbo-ID: b9656513-27b7-11ef-b4bb-af5377834399
Date: Tue, 11 Jun 2024 07:59:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph B??hmwalder <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 05/26] loop: regularize upgrading the lock size for
 direct I/O
Message-ID: <20240611055906.GA3640@lst.de>
References: <20240611051929.513387-1-hch@lst.de> <20240611051929.513387-6-hch@lst.de> <dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 11, 2024 at 02:56:59PM +0900, Damien Le Moal wrote:
> > +	if (!bsize)
> > +		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
> 
> If bsize is specified and there is a backing dev used with direct IO, should it
> be checked that bsize is a multiple of bdev_logical_block_size(backing_bdev) ?

For direct I/O that check would be useful.  For buffered I/O we can do
read-modify-write cycles.  However this series is already huge and not
primarily about improving the loop driver parameter validation, so
I'll defer this for now.

