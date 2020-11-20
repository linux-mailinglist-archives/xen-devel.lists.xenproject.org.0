Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA32BA55D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31787.62467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Ic-0008Eg-Rz; Fri, 20 Nov 2020 09:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31787.62467; Fri, 20 Nov 2020 09:01:46 +0000
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
	id 1kg2Ic-0008EK-Oq; Fri, 20 Nov 2020 09:01:46 +0000
Received: by outflank-mailman (input) for mailman id 31787;
 Fri, 20 Nov 2020 09:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg2Ib-0008EE-Au
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:01:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4bf5b1e-2083-4427-a416-3720c2612229;
 Fri, 20 Nov 2020 09:01:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4C98067373; Fri, 20 Nov 2020 10:01:42 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg2Ib-0008EE-Au
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:01:45 +0000
X-Inumbo-ID: e4bf5b1e-2083-4427-a416-3720c2612229
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e4bf5b1e-2083-4427-a416-3720c2612229;
	Fri, 20 Nov 2020 09:01:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4C98067373; Fri, 20 Nov 2020 10:01:42 +0100 (CET)
Date: Fri, 20 Nov 2020 10:01:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 13/20] block: remove ->bd_contains
Message-ID: <20201120090142.GC21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-14-hch@lst.de> <20201119103253.GV1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119103253.GV1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 19, 2020 at 11:32:53AM +0100, Jan Kara wrote:
> > @@ -1521,7 +1510,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
> >  		if (bdev->bd_bdi == &noop_backing_dev_info)
> >  			bdev->bd_bdi = bdi_get(disk->queue->backing_dev_info);
> >  	} else {
> > -		if (bdev->bd_contains == bdev) {
> > +		if (!bdev->bd_partno) {
> 
> This should be !bdev_is_partition(bdev) for consistency, right?

Yes.  Same for the same check further up for the !bdev->bd_openers
case.

> > +#define bdev_whole(_bdev) \
> > +	((_bdev)->bd_disk->part0.bdev)
> > +
> >  #define bdev_kobj(_bdev) \
> >  	(&part_to_dev((_bdev)->bd_part)->kobj)
> 
> I'd somewhat prefer if these helpers could actually be inline functions and
> not macros. I guess they are macros because hd_struct isn't in blk_types.h.
> But if we moved helpers to blkdev.h, we'd have all definitions we need...
> Is that a problem for some users?

As you pointed out the reason these are macros is that the obvious
placement doesn't work.  My plan was to look into cleaning up the block
headers, which are a complete mess between blk_types.h, bio.h, blkdev.h
and genhd.h after I'm done making sense of the data structures, so for
now I didn't want to move too much around.  Hopefully we'll be able to
convert these helpers to inlines once I'm done.

