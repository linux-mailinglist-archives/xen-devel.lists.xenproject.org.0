Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0D90A330
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 06:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741579.1148191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ4Nb-0001S0-Pg; Mon, 17 Jun 2024 04:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741579.1148191; Mon, 17 Jun 2024 04:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ4Nb-0001Ov-Mw; Mon, 17 Jun 2024 04:54:07 +0000
Received: by outflank-mailman (input) for mailman id 741579;
 Mon, 17 Jun 2024 04:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SiCA=NT=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sJ4NZ-0001Op-M2
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 04:54:05 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ccc3cc8-2c65-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 06:54:01 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EB40668B05; Mon, 17 Jun 2024 06:53:56 +0200 (CEST)
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
X-Inumbo-ID: 9ccc3cc8-2c65-11ef-b4bb-af5377834399
Date: Mon, 17 Jun 2024 06:53:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
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
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
Message-ID: <20240617045356.GA16277@lst.de>
References: <20240611051929.513387-1-hch@lst.de> <20240611051929.513387-3-hch@lst.de> <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org> <20240613093918.GA27629@lst.de> <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 17, 2024 at 08:01:04AM +0900, Damien Le Moal wrote:
> On 6/13/24 18:39, Christoph Hellwig wrote:
> > On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
> >>> +	if (sdkp->device->type == TYPE_ZBC)
> >>
> >> Nit: use sd_is_zoned() here ?
> > 
> > Actually - is there much in even keeping sd_is_zoned now that the
> > host aware support is removed?  Just open coding the type check isn't
> > any more code, and probably easier to follow.
> 
> Removing this helper is fine by me.

FYI, I've removed it yesterday, but not done much of the cleanups suggest
here.  We should probably do those in a follow up up, uncluding removing
the !ZBC check in sd_zbc_check_zoned_characteristics.


