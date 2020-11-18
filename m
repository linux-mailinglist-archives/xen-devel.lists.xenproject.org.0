Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF02B86C4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 22:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30263.60167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfV6H-0000JS-5z; Wed, 18 Nov 2020 21:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30263.60167; Wed, 18 Nov 2020 21:34:49 +0000
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
	id 1kfV6H-0000IZ-1m; Wed, 18 Nov 2020 21:34:49 +0000
Received: by outflank-mailman (input) for mailman id 30263;
 Wed, 18 Nov 2020 21:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfV6F-0008UU-3u
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 240796fb-8a5f-4bb0-a2eb-b63b6a5f901c;
 Wed, 18 Nov 2020 21:34:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D032B009;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D003A1E1316; Wed, 18 Nov 2020 15:18:00 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfV6F-0008UU-3u
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:47 +0000
X-Inumbo-ID: 240796fb-8a5f-4bb0-a2eb-b63b6a5f901c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 240796fb-8a5f-4bb0-a2eb-b63b6a5f901c;
	Wed, 18 Nov 2020 21:34:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2D032B009;
	Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id D003A1E1316; Wed, 18 Nov 2020 15:18:00 +0100 (CET)
Date: Wed, 18 Nov 2020 15:18:00 +0100
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
Subject: Re: [PATCH 03/20] block: add a bdev_kobj helper
Message-ID: <20201118141800.GH1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:43, Christoph Hellwig wrote:
> Add a little helper to find the kobject for a struct block_device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/md/bcache/super.c |  7 ++-----
>  drivers/md/md.c           |  4 +---
>  fs/btrfs/sysfs.c          | 15 +++------------
>  include/linux/blk_types.h |  3 +++
>  4 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 46a00134a36ae1..a6a5e21e4fd136 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1447,8 +1447,7 @@ static int register_bdev(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  
>  	err = "error creating kobject";
> -	if (kobject_add(&dc->disk.kobj, &part_to_dev(bdev->bd_part)->kobj,
> -			"bcache"))
> +	if (kobject_add(&dc->disk.kobj, bdev_kobj(bdev), "bcache"))
>  		goto err;
>  	if (bch_cache_accounting_add_kobjs(&dc->accounting, &dc->disk.kobj))
>  		goto err;
> @@ -2342,9 +2341,7 @@ static int register_cache(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  	}
>  
> -	if (kobject_add(&ca->kobj,
> -			&part_to_dev(bdev->bd_part)->kobj,
> -			"bcache")) {
> +	if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
>  		err = "error calling kobject_add";
>  		ret = -ENOMEM;
>  		goto out;
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index b2edf5e0f965b5..7ce6047c856ea2 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -2414,7 +2414,6 @@ EXPORT_SYMBOL(md_integrity_add_rdev);
>  static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
>  {
>  	char b[BDEVNAME_SIZE];
> -	struct kobject *ko;
>  	int err;
>  
>  	/* prevent duplicates */
> @@ -2477,9 +2476,8 @@ static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
>  	if ((err = kobject_add(&rdev->kobj, &mddev->kobj, "dev-%s", b)))
>  		goto fail;
>  
> -	ko = &part_to_dev(rdev->bdev->bd_part)->kobj;
>  	/* failure here is OK */
> -	err = sysfs_create_link(&rdev->kobj, ko, "block");
> +	err = sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "block");
>  	rdev->sysfs_state = sysfs_get_dirent_safe(rdev->kobj.sd, "state");
>  	rdev->sysfs_unack_badblocks =
>  		sysfs_get_dirent_safe(rdev->kobj.sd, "unacknowledged_bad_blocks");
> diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
> index 279d9262b676d4..24b6c6dc69000a 100644
> --- a/fs/btrfs/sysfs.c
> +++ b/fs/btrfs/sysfs.c
> @@ -1232,8 +1232,6 @@ int btrfs_sysfs_add_space_info_type(struct btrfs_fs_info *fs_info,
>  
>  void btrfs_sysfs_remove_device(struct btrfs_device *device)
>  {
> -	struct hd_struct *disk;
> -	struct kobject *disk_kobj;
>  	struct kobject *devices_kobj;
>  
>  	/*
> @@ -1243,11 +1241,8 @@ void btrfs_sysfs_remove_device(struct btrfs_device *device)
>  	devices_kobj = device->fs_info->fs_devices->devices_kobj;
>  	ASSERT(devices_kobj);
>  
> -	if (device->bdev) {
> -		disk = device->bdev->bd_part;
> -		disk_kobj = &part_to_dev(disk)->kobj;
> -		sysfs_remove_link(devices_kobj, disk_kobj->name);
> -	}
> +	if (device->bdev)
> +		sysfs_remove_link(devices_kobj, bdev_kobj(device->bdev)->name);
>  
>  	if (device->devid_kobj.state_initialized) {
>  		kobject_del(&device->devid_kobj);
> @@ -1353,11 +1348,7 @@ int btrfs_sysfs_add_device(struct btrfs_device *device)
>  	nofs_flag = memalloc_nofs_save();
>  
>  	if (device->bdev) {
> -		struct hd_struct *disk;
> -		struct kobject *disk_kobj;
> -
> -		disk = device->bdev->bd_part;
> -		disk_kobj = &part_to_dev(disk)->kobj;
> +		struct kobject *disk_kobj = bdev_kobj(device->bdev);
>  
>  		ret = sysfs_create_link(devices_kobj, disk_kobj, disk_kobj->name);
>  		if (ret) {
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index d9b69bbde5cc54..0069bee992063e 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -48,6 +48,9 @@ struct block_device {
>  	struct mutex		bd_fsfreeze_mutex;
>  } __randomize_layout;
>  
> +#define bdev_kobj(_bdev) \
> +	(&part_to_dev((_bdev)->bd_part)->kobj)
> +
>  /*
>   * Block error status values.  See block/blk-core:blk_errors for the details.
>   * Alpha cannot write a byte atomically, so we need to use 32-bit value.
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

