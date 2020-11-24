Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAFA2C282D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36116.67882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYWn-0003SO-Kw; Tue, 24 Nov 2020 13:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36116.67882; Tue, 24 Nov 2020 13:38:41 +0000
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
	id 1khYWn-0003Rz-HD; Tue, 24 Nov 2020 13:38:41 +0000
Received: by outflank-mailman (input) for mailman id 36116;
 Tue, 24 Nov 2020 13:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1khYWl-0003Rt-Qt
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:38:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b7af852-0673-4c3c-a815-09a2a59dc2ac;
 Tue, 24 Nov 2020 13:38:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8E43AC2D;
 Tue, 24 Nov 2020 13:38:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
	id 1khYWl-0003Rt-Qt
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:38:39 +0000
X-Inumbo-ID: 2b7af852-0673-4c3c-a815-09a2a59dc2ac
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2b7af852-0673-4c3c-a815-09a2a59dc2ac;
	Tue, 24 Nov 2020 13:38:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E8E43AC2D;
	Tue, 24 Nov 2020 13:38:37 +0000 (UTC)
Subject: Re: [PATCH 23/45] block: remove i_bdev
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <bbb4130b-6848-f2ed-b7e0-c86b68c2663a@suse.de>
Date: Tue, 24 Nov 2020 21:38:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-24-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/24/20 9:27 PM, Christoph Hellwig wrote:
> Switch the block device lookup interfaces to directly work with a dev_t
> so that struct block_device references are only acquired by the
> blkdev_get variants (and the blk-cgroup special case).  This means that
> we not don't need an extra reference in the inode and can generally
> simplify handling of struct block_device to keep the lookups contained
> in the core block layer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For the bcache part, Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>  block/ioctl.c                                |   3 +-
>  drivers/block/loop.c                         |   8 +-
>  drivers/md/bcache/super.c                    |  20 +-
>  drivers/md/dm-table.c                        |   9 +-
>  drivers/mtd/mtdsuper.c                       |  17 +-
>  drivers/target/target_core_file.c            |   6 +-
>  drivers/usb/gadget/function/storage_common.c |   8 +-
>  fs/block_dev.c                               | 195 +++++--------------
>  fs/btrfs/volumes.c                           |  13 +-
>  fs/inode.c                                   |   3 -
>  fs/internal.h                                |   7 +-
>  fs/io_uring.c                                |  10 +-
>  fs/pipe.c                                    |   5 +-
>  fs/quota/quota.c                             |  19 +-
>  fs/statfs.c                                  |   2 +-
>  fs/super.c                                   |  37 ++--
>  include/linux/blkdev.h                       |   2 +-
>  include/linux/fs.h                           |   1 -
>  18 files changed, 114 insertions(+), 251 deletions(-)
> 

[snipped]

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index a6a5e21e4fd136..c55d3c58a7ef55 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -2380,38 +2380,38 @@ kobj_attribute_write(register,		register_bcache);
>  kobj_attribute_write(register_quiet,	register_bcache);
>  kobj_attribute_write(pendings_cleanup,	bch_pending_bdevs_cleanup);
>  
> -static bool bch_is_open_backing(struct block_device *bdev)
> +static bool bch_is_open_backing(dev_t dev)
>  {
>  	struct cache_set *c, *tc;
>  	struct cached_dev *dc, *t;
>  
>  	list_for_each_entry_safe(c, tc, &bch_cache_sets, list)
>  		list_for_each_entry_safe(dc, t, &c->cached_devs, list)
> -			if (dc->bdev == bdev)
> +			if (dc->bdev->bd_dev == dev)
>  				return true;
>  	list_for_each_entry_safe(dc, t, &uncached_devices, list)
> -		if (dc->bdev == bdev)
> +		if (dc->bdev->bd_dev == dev)
>  			return true;
>  	return false;
>  }
>  
> -static bool bch_is_open_cache(struct block_device *bdev)
> +static bool bch_is_open_cache(dev_t dev)
>  {
>  	struct cache_set *c, *tc;
>  
>  	list_for_each_entry_safe(c, tc, &bch_cache_sets, list) {
>  		struct cache *ca = c->cache;
>  
> -		if (ca->bdev == bdev)
> +		if (ca->bdev->bd_dev == dev)
>  			return true;
>  	}
>  
>  	return false;
>  }
>  
> -static bool bch_is_open(struct block_device *bdev)
> +static bool bch_is_open(dev_t dev)
>  {
> -	return bch_is_open_cache(bdev) || bch_is_open_backing(bdev);
> +	return bch_is_open_cache(dev) || bch_is_open_backing(dev);
>  }
>  
>  struct async_reg_args {
> @@ -2535,9 +2535,11 @@ static ssize_t register_bcache(struct kobject *k, struct kobj_attribute *attr,
>  				  sb);
>  	if (IS_ERR(bdev)) {
>  		if (bdev == ERR_PTR(-EBUSY)) {
> -			bdev = lookup_bdev(strim(path));
> +			dev_t dev;
> +
>  			mutex_lock(&bch_register_lock);
> -			if (!IS_ERR(bdev) && bch_is_open(bdev))
> +			if (lookup_bdev(strim(path), &dev) == 0 &&
> +			    bch_is_open(dev))
>  				err = "device already registered";
>  			else
>  				err = "device busy";
[snipped]

