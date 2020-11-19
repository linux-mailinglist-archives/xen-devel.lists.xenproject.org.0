Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18052B8F29
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30515.60581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgS1-0003UX-F3; Thu, 19 Nov 2020 09:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30515.60581; Thu, 19 Nov 2020 09:42:01 +0000
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
	id 1kfgS1-0003U8-Bg; Thu, 19 Nov 2020 09:42:01 +0000
Received: by outflank-mailman (input) for mailman id 30515;
 Thu, 19 Nov 2020 09:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfgS0-0003U3-33
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:42:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 186c4046-a3be-4531-a423-153cc3eaca36;
 Thu, 19 Nov 2020 09:41:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3791AC98;
 Thu, 19 Nov 2020 09:41:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 286A51E1303; Thu, 19 Nov 2020 10:41:57 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfgS0-0003U3-33
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:42:00 +0000
X-Inumbo-ID: 186c4046-a3be-4531-a423-153cc3eaca36
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 186c4046-a3be-4531-a423-153cc3eaca36;
	Thu, 19 Nov 2020 09:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3791AC98;
	Thu, 19 Nov 2020 09:41:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 286A51E1303; Thu, 19 Nov 2020 10:41:57 +0100 (CET)
Date: Thu, 19 Nov 2020 10:41:57 +0100
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
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201119094157.GT1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-12-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:51, Christoph Hellwig wrote:
> To simplify block device lookup and a few other upcomdin areas, make sure
> that we always have a struct block_device available for each disk and
> each partition.  The only downside of this is that each device and
> partition uses a little more memories.  The upside will be that a lot of
				^^^ memory

> code can be simplified.
> 
> With that all we need to look up the block device is to lookup the inode
> and do a few sanity checks on the gendisk, instead of the separate lookup
> for the gendisk.
> 
> As part of the change switch bdget() to only find existing block devices,
> given that we know that the block_device structure must be allocated at
> probe / partition scan time.
> 
> blk-cgroup needed a bit of a special treatment as the only place that
> wanted to lookup a gendisk outside of the normal blkdev_get path.  It is
> switched to lookup using the block device hash now that this is the
> primary lookup path.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me and I like the simplifications! I've found just
one small issue below.

> @@ -1748,16 +1600,18 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
>  	if (!disk)
>  		return NULL;
>  
> +	disk->part0.bdev = bdev_alloc(disk, 0);
> +	if (!disk->part0.bdev)
> +		goto out_free_disk;
> +
>  	disk->part0.dkstats = alloc_percpu(struct disk_stats);
>  	if (!disk->part0.dkstats)
> -		goto out_free_disk;
> +		goto out_bdput;
>  
>  	init_rwsem(&disk->lookup_sem);
>  	disk->node_id = node_id;
> -	if (disk_expand_part_tbl(disk, 0)) {
> -		free_percpu(disk->part0.dkstats);
> -		goto out_free_disk;
> -	}
> +	if (disk_expand_part_tbl(disk, 0))
> +		goto out_free_bdstats;
>  
>  	ptbl = rcu_dereference_protected(disk->part_tbl, 1);
>  	rcu_assign_pointer(ptbl->part[0], &disk->part0);
> @@ -1772,8 +1626,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
>  	 * converted to make use of bd_mutex and sequence counters.
>  	 */
>  	hd_sects_seq_init(&disk->part0);
> -	if (hd_ref_init(&disk->part0))
> -		goto out_free_part0;
> +	if (hd_ref_init(&disk->part0)) {
> +		hd_free_part(&disk->part0);

Aren't you missing kfree(disk) here?

> +		return NULL;
> +	}
>  
>  	disk->minors = minors;
>  	rand_initialize_disk(disk);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

