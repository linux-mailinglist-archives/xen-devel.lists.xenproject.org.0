Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2E2B9211
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 13:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30647.60797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfigs-0002dB-RF; Thu, 19 Nov 2020 12:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30647.60797; Thu, 19 Nov 2020 12:05:30 +0000
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
	id 1kfigs-0002cm-Nj; Thu, 19 Nov 2020 12:05:30 +0000
Received: by outflank-mailman (input) for mailman id 30647;
 Thu, 19 Nov 2020 12:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfigr-0002ch-Ge
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:05:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8a9b119-fa2b-42f8-98e9-16b210096692;
 Thu, 19 Nov 2020 12:05:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1DC2AA4F;
 Thu, 19 Nov 2020 12:05:25 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4E3FB1E130B; Thu, 19 Nov 2020 13:05:25 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfigr-0002ch-Ge
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:05:29 +0000
X-Inumbo-ID: d8a9b119-fa2b-42f8-98e9-16b210096692
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d8a9b119-fa2b-42f8-98e9-16b210096692;
	Thu, 19 Nov 2020 12:05:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E1DC2AA4F;
	Thu, 19 Nov 2020 12:05:25 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 4E3FB1E130B; Thu, 19 Nov 2020 13:05:25 +0100 (CET)
Date: Thu, 19 Nov 2020 13:05:25 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct
 hd_struct
Message-ID: <20201119120525.GW1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-15-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:54, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additional the field in hd_struct did not use proper serializiation,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Overall the patch looks good but I have a couple of comments below.

> diff --git a/block/bio.c b/block/bio.c
> index fa01bef35bb1fe..0c5269997434d6 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -613,7 +613,7 @@ void guard_bio_eod(struct bio *bio)
>  	rcu_read_lock();
>  	part = __disk_get_part(bio->bi_disk, bio->bi_partno);
>  	if (part)
> -		maxsector = part_nr_sects_read(part);
> +		maxsector = bdev_nr_sectors(part->bdev);
>  	else
>  		maxsector = get_capacity(bio->bi_disk);

I have to say that after these changes I find it a bit confusing that we
have get/set_capacity() and bdev_nr_sectors() / bdev_set_nr_sectors() and
they are all the same thing (i_size of the bdev). Is there a reason for the
distinction?

> diff --git a/block/genhd.c b/block/genhd.c
> index 94de95287a6370..e101b6843f7437 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -38,6 +38,16 @@ static void disk_add_events(struct gendisk *disk);
>  static void disk_del_events(struct gendisk *disk);
>  static void disk_release_events(struct gendisk *disk);
>  
> +void set_capacity(struct gendisk *disk, sector_t sectors)
> +{
> +	struct block_device *bdev = disk->part0.bdev;
> +
> +	spin_lock(&bdev->bd_size_lock);
> +	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
> +	spin_unlock(&bdev->bd_size_lock);

AFAICT bd_size_lock is pointless after these changes so we can just remove
it?

> +}
> +EXPORT_SYMBOL(set_capacity);
> +
>  /*
>   * Set disk capacity and notify if the size is not currently zero and will not
>   * be set to zero.  Returns true if a uevent was sent, otherwise false.
> @@ -47,11 +57,12 @@ bool set_capacity_and_notify(struct gendisk *disk, sector_t size)
>  	sector_t capacity = get_capacity(disk);
>  
>  	set_capacity(disk, size);
> -	revalidate_disk_size(disk, true);
>  
>  	if (capacity != size && capacity != 0 && size != 0) {
>  		char *envp[] = { "RESIZE=1", NULL };
>  
> +		pr_info("%s: detected capacity change from %lld to %lld\n",
> +		       disk->disk_name, size, capacity);

So we are now missing above message for transitions from / to 0 capacity?
Is there any other notification in the kernel log when e.g. media is
inserted into a CD-ROM drive? I remember using these messages for detecting
that...

Also what about GENHD_FL_HIDDEN devices? Are we sure we never set capacity
for them?

>  		kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
>  		return true;
>  	}

...

> @@ -983,7 +994,7 @@ void __init printk_all_partitions(void)
>  
>  			printk("%s%s %10llu %s %s", is_part0 ? "" : "  ",
>  			       bdevt_str(part_devt(part), devt_buf),
> -			       (unsigned long long)part_nr_sects_read(part) >> 1
> +			       bdev_nr_sectors(part->bdev) >> 1
>  			       , disk_name(disk, part->partno, name_buf),
>  			       part->info ? part->info->uuid : "");
>  			if (is_part0) {
> @@ -1076,7 +1087,7 @@ static int show_partition(struct seq_file *seqf, void *v)
>  	while ((part = disk_part_iter_next(&piter)))
>  		seq_printf(seqf, "%4d  %7d %10llu %s\n",
>  			   MAJOR(part_devt(part)), MINOR(part_devt(part)),
> -			   (unsigned long long)part_nr_sects_read(part) >> 1,
> +			   bdev_nr_sectors(part->bdev) >> 1,
>  			   disk_name(sgp, part->partno, buf));
>  	disk_part_iter_exit(&piter);
>  
> @@ -1158,8 +1169,7 @@ ssize_t part_size_show(struct device *dev,
>  {
>  	struct hd_struct *p = dev_to_part(dev);
>  
> -	return sprintf(buf, "%llu\n",
> -		(unsigned long long)part_nr_sects_read(p));
> +	return sprintf(buf, "%llu\n", bdev_nr_sectors(p->bdev));

Is sector_t really guaranteed to be unsigned long long?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

