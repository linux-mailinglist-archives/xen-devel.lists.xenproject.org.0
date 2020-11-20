Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFD2BA8DE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 12:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31971.62798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4Tm-0001bA-5d; Fri, 20 Nov 2020 11:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31971.62798; Fri, 20 Nov 2020 11:21:26 +0000
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
	id 1kg4Tm-0001al-29; Fri, 20 Nov 2020 11:21:26 +0000
Received: by outflank-mailman (input) for mailman id 31971;
 Fri, 20 Nov 2020 11:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kg4Tk-0001ag-Eh
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:21:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35edf7cf-aaef-49ff-a730-73d122afc14b;
 Fri, 20 Nov 2020 11:21:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4C79AED9;
 Fri, 20 Nov 2020 11:21:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2825E1E130B; Fri, 20 Nov 2020 12:21:21 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kg4Tk-0001ag-Eh
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:21:24 +0000
X-Inumbo-ID: 35edf7cf-aaef-49ff-a730-73d122afc14b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35edf7cf-aaef-49ff-a730-73d122afc14b;
	Fri, 20 Nov 2020 11:21:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C4C79AED9;
	Fri, 20 Nov 2020 11:21:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 2825E1E130B; Fri, 20 Nov 2020 12:21:21 +0100 (CET)
Date: Fri, 20 Nov 2020 12:21:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct
 hd_struct
Message-ID: <20201120112121.GB15537@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120090820.GD21715@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri 20-11-20 10:08:20, Christoph Hellwig wrote:
> On Thu, Nov 19, 2020 at 01:05:25PM +0100, Jan Kara wrote:
> > > @@ -613,7 +613,7 @@ void guard_bio_eod(struct bio *bio)
> > >  	rcu_read_lock();
> > >  	part = __disk_get_part(bio->bi_disk, bio->bi_partno);
> > >  	if (part)
> > > -		maxsector = part_nr_sects_read(part);
> > > +		maxsector = bdev_nr_sectors(part->bdev);
> > >  	else
> > >  		maxsector = get_capacity(bio->bi_disk);
> > 
> > I have to say that after these changes I find it a bit confusing that we
> > have get/set_capacity() and bdev_nr_sectors() / bdev_set_nr_sectors() and
> > they are all the same thing (i_size of the bdev). Is there a reason for the
> > distinction?
> 
> get_capacity/set_capacity are the existing unchanged interfaces that
> work on struct gendisk, and unchanged from what we had before.  They also
> have lots of users which makes them kinda awkward to touch.
> 
> bdev_nr_sectors is the public interface to query the size for any
> kind of struct block device, to be used by consumers of the block
> device interface.
> 
> bdev_set_nr_sectors is a private helper for the partitions core that
> avoids duplicating a bit of code, and works on partitions.

OK, I guess I'll get used to this...

> > > @@ -38,6 +38,16 @@ static void disk_add_events(struct gendisk *disk);
> > >  static void disk_del_events(struct gendisk *disk);
> > >  static void disk_release_events(struct gendisk *disk);
> > >  
> > > +void set_capacity(struct gendisk *disk, sector_t sectors)
> > > +{
> > > +	struct block_device *bdev = disk->part0.bdev;
> > > +
> > > +	spin_lock(&bdev->bd_size_lock);
> > > +	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
> > > +	spin_unlock(&bdev->bd_size_lock);
> > 
> > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > it?
> 
> I don't think it is, as reuqiring bd_mutex for size updates leads to
> rather awkward lock ordering problems.

OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
on 32-bit it is needed to prevent torn writes to i_size, right?

> > >  	if (capacity != size && capacity != 0 && size != 0) {
> > >  		char *envp[] = { "RESIZE=1", NULL };
> > >  
> > > +		pr_info("%s: detected capacity change from %lld to %lld\n",
> > > +		       disk->disk_name, size, capacity);
> > 
> > So we are now missing above message for transitions from / to 0 capacity?
> > Is there any other notification in the kernel log when e.g. media is
> > inserted into a CD-ROM drive? I remember using these messages for detecting
> > that...
> 
> True, I guess we should keep the messages for that case at least under
> some circumstances.  Let me take a closer look at what could make sense.
> 
> > Also what about GENHD_FL_HIDDEN devices? Are we sure we never set capacity
> > for them?
> 
> We absolutely set the capacity for them, as we have to.  And even use
> this interface.  But yes, I think we should skip sending the uevent for
> them.

Also previously we were not printing any messages for hidden devices and
now we do. I'm not sure whether that's intended or not.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

