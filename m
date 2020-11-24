Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7A2C2D99
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36614.68590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbfq-0005HD-I4; Tue, 24 Nov 2020 17:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36614.68590; Tue, 24 Nov 2020 17:00:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbfq-0005Gn-EW; Tue, 24 Nov 2020 17:00:14 +0000
Received: by outflank-mailman (input) for mailman id 36614;
 Tue, 24 Nov 2020 17:00:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khbfp-0005Gi-80
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:00:13 +0000
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f498b134-b06a-4ece-a250-e32d7943231f;
 Tue, 24 Nov 2020 17:00:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g17so16584423qts.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:00:12 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id q20sm13543500qke.0.2020.11.24.09.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:00:11 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khbfp-0005Gi-80
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:00:13 +0000
X-Inumbo-ID: f498b134-b06a-4ece-a250-e32d7943231f
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f498b134-b06a-4ece-a250-e32d7943231f;
	Tue, 24 Nov 2020 17:00:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g17so16584423qts.5
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fWmahOo+BxCVV9NEre8zWFBYKORZfhSvfmLWizAk7Sk=;
        b=pkS1IsRKMFFQKIiQOFY8WLSirKTKy5vlf5vBnIHJQYY8QvEC/15BTkG00rjnGztDPS
         MPnwXECAwJubj26/AKIoLsOqJXTzH20co1dwm6n/ihZPA8R/GncgR5Nn7BAW2WaJHH5L
         tpbCDHrNvMRBQDAisHHKNo7eGDqcuHeaFIgkH8ZC9CSiQc7xH6mkLcfA+jtEEIACMHfa
         u3OVfgqj6hqatE6LBJWSWupUvafe+983boP6OtbOOXJy3CJYXaRV2xsgTTuY8gHl3o7O
         iFEoPfxU2lYaOEolDJw8+Asj3AIZ8QN2eniPlD554d4692r1CYqrwtcGwNWS1nLFzZNO
         sY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fWmahOo+BxCVV9NEre8zWFBYKORZfhSvfmLWizAk7Sk=;
        b=Fs5Nzob3SRS0tvJTWgpQuGaLvFLBlW3Twkx+VBI4XiJtZJDlDCK0JLvFe2RVL7Jt6z
         /zZyYe5PeHcY4EWVRyxjrSszfoccn3tD4XnsCoTOWfMpQRE5a489RnvZEHQVDN7pqokO
         4nyc6RSBH9BkxVC+fPhFT6zaIHeSqDiYVR4n8ZoLmqobsTIM21rceBk+vCvu/kNo0iko
         NEfUWVK2GJQnKb96WTLuQ8CpcUZ5N+TzedGMhe4UUbgYGBSW4QTEqiZTXrVbo9KyyoA4
         9+d0chbj0ujEua+6XeQlkPmh6/4hVNS9YDjWG+2oU7cwCL33xBMrjiLtCbEvk5DwD81a
         weYg==
X-Gm-Message-State: AOAM532cbUnYDK7OLO1MKoicf5QmRTEoaNjYWJTvS0F/K3hYBwVrFaiE
	AlOjiI+Hiw8baQ4tbrsrhpg=
X-Google-Smtp-Source: ABdhPJw9lXoUdb+9nSlmHwoziLxai+Rt3I7zgIJ1oTBqcvjWZC4/0fG7FN8qIJjp6NzaYQdsfu0bWw==
X-Received: by 2002:a05:622a:18d:: with SMTP id s13mr5279508qtw.306.1606237211875;
        Tue, 24 Nov 2020 09:00:11 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id q20sm13543500qke.0.2020.11.24.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:00:11 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 11:59:49 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <X708BTJ5njtbC2z1@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-12-hch@lst.de>

Hello,

This is great. So much simpler & better. Some nits below.

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index a02e224115943d..0ba0bf44b88af3 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -340,12 +340,11 @@ void delete_partition(struct hd_struct *part)
>  	device_del(part_to_dev(part));
>  
>  	/*
> -	 * Remove gendisk pointer from idr so that it cannot be looked up
> -	 * while RCU period before freeing gendisk is running to prevent
> -	 * use-after-free issues. Note that the device number stays
> -	 * "in-use" until we really free the gendisk.
> +	 * Remove the block device from the inode hash, so that it cannot be
> +	 * looked up while waiting for the RCU grace period.
>  	 */
> -	blk_invalidate_devt(part_devt(part));
> +	remove_inode_hash(part->bdev->bd_inode);

I don't think this is necessary now that the bdev and inode lifetimes are
one. Before, punching out the association early was necessary because we
could be in a situation where we can successfully look up a part from idr
and then try to pin the associated disk which may already be freed. With the
new code, the lookup is through the inode whose lifetime is one and the same
with gendisk, so use-after-free isn't possible and __blkdev_get() will
reliably reject such open attempts.

...
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 4c4d6c30382c06..e94633dc6ad93b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -870,34 +870,50 @@ void __init bdev_cache_init(void)
>  	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
>  }
>  
> -static struct block_device *bdget(dev_t dev)
> +struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
>  {
>  	struct block_device *bdev;
>  	struct inode *inode;
>  
> -	inode = iget_locked(blockdev_superblock, dev);
> +	inode = new_inode(blockdev_superblock);
>  	if (!inode)
>  		return NULL;
>  
> -	bdev = &BDEV_I(inode)->bdev;
> +	bdev = I_BDEV(inode);
> +	spin_lock_init(&bdev->bd_size_lock);
> +	bdev->bd_disk = disk;
> +	bdev->bd_partno = partno;
> +	bdev->bd_contains = NULL;
> +	bdev->bd_super = NULL;
> +	bdev->bd_inode = inode;
> +	bdev->bd_part_count = 0;
> +
> +	inode->i_mode = S_IFBLK;
> +	inode->i_rdev = 0;
> +	inode->i_bdev = bdev;
> +	inode->i_data.a_ops = &def_blk_aops;

Missing the call to mapping_set_gfp_mask().

>  
> -	if (inode->i_state & I_NEW) {
> -		spin_lock_init(&bdev->bd_size_lock);
> -		bdev->bd_contains = NULL;
> -		bdev->bd_super = NULL;
> -		bdev->bd_inode = inode;
> -		bdev->bd_part_count = 0;
> -		bdev->bd_dev = dev;
> -		inode->i_mode = S_IFBLK;
> -		inode->i_rdev = dev;
> -		inode->i_bdev = bdev;
> -		inode->i_data.a_ops = &def_blk_aops;
> -		mapping_set_gfp_mask(&inode->i_data, GFP_USER);
> -		unlock_new_inode(inode);
> -	}
>  	return bdev;
>  }
...
>  /**
>   * bdgrab -- Grab a reference to an already referenced block device
>   * @bdev:	Block device to grab a reference to.
> @@ -957,6 +973,10 @@ static struct block_device *bd_acquire(struct inode *inode)
>  		bd_forget(inode);
>  
>  	bdev = bdget(inode->i_rdev);
> +	if (!bdev) {
> +		blk_request_module(inode->i_rdev);
> +		bdev = bdget(inode->i_rdev);
> +	}

One side effect here is that, before, a device which uses the traditional
consecutive devt range would reserve all minors for the partitions whether
they exist or not and fail open requests without requesting the matching
module. After the change, trying to open an non-existent partition would
trigger module probe. I don't think the behavior change is consequential in
any sane not-crazily-arcane setup but it might be worth mentioning in the
commit log.

Thank you.

-- 
tejun

