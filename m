Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BE2BA5A6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31812.62515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2WG-0001US-Vv; Fri, 20 Nov 2020 09:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31812.62515; Fri, 20 Nov 2020 09:15:52 +0000
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
	id 1kg2WG-0001U3-Sm; Fri, 20 Nov 2020 09:15:52 +0000
Received: by outflank-mailman (input) for mailman id 31812;
 Fri, 20 Nov 2020 09:15:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg2WF-0001Ty-3Z
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:15:51 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 927debf0-bede-4d9c-bc4d-e25a3a00d421;
 Fri, 20 Nov 2020 09:15:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D37C67373; Fri, 20 Nov 2020 10:15:47 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg2WF-0001Ty-3Z
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:15:51 +0000
X-Inumbo-ID: 927debf0-bede-4d9c-bc4d-e25a3a00d421
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 927debf0-bede-4d9c-bc4d-e25a3a00d421;
	Fri, 20 Nov 2020 09:15:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8D37C67373; Fri, 20 Nov 2020 10:15:47 +0100 (CET)
Date: Fri, 20 Nov 2020 10:15:46 +0100
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
Subject: Re: [PATCH 15/20] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201120091546.GE21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-16-hch@lst.de> <20201119143921.GX1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119143921.GX1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 19, 2020 at 03:39:21PM +0100, Jan Kara wrote:
> This patch is kind of difficult to review due to the size of mostly
> mechanical changes mixed with not completely mechanical changes. Can we
> perhaps split out the mechanical bits? E.g. the rq->part => rq->bdev
> renaming is mechanical and notable part of the patch. Similarly the
> part->foo => part->bd_foo bits...

We'd end with really weird patches that way.  Never mind that I'm not
even sure how we could mechnically do the renaming.

> 
> Also I'm kind of wondering: AFAIU the new lifetime rules, gendisk holds
> bdev reference and bdev is created on gendisk allocation so bdev lifetime is
> strictly larger than gendisk lifetime. But what now keeps bdev->bd_disk
> reference safe in presence device hot unplug? In most cases we are still
> protected by gendisk reference taken in __blkdev_get() but how about
> disk->lookup_sem and disk->flags dereferences before we actually grab the
> reference?

Good question.  I'll need to think about this a bit more.

> Also I find it rather non-obvious (although elegant ;) that bdev->bd_device
> rules the lifetime of gendisk. Can you perhaps explain this in the
> changelog and probably also add somewhere to source a documentation about
> the new lifetime rules?

Yes.

> > -struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
> > +static inline struct block_device *__bdget_disk(struct gendisk *disk,
> > +		int partno)
> > +{
> > +	struct disk_part_tbl *ptbl = rcu_dereference(disk->part_tbl);
> > +
> > +	if (unlikely(partno < 0 || partno >= ptbl->len))
> > +		return NULL;
> > +	return rcu_dereference(ptbl->part[partno]);
> > +}
> 
> I understand this is lower-level counterpart of bdget_disk() but it is
> confusing to me that this has 'bdget' in the name and returns no bdev
> reference. Can we call it like __bdev_from_disk() or something like that?

Sure.

