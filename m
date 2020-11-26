Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569B2C4C75
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 02:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38211.70929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki5tX-0004rz-W4; Thu, 26 Nov 2020 01:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38211.70929; Thu, 26 Nov 2020 01:16:23 +0000
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
	id 1ki5tX-0004ra-Sb; Thu, 26 Nov 2020 01:16:23 +0000
Received: by outflank-mailman (input) for mailman id 38211;
 Thu, 26 Nov 2020 01:16:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87l1=FA=gmail.com=minchan.kim@srs-us1.protection.inumbo.net>)
 id 1ki5tX-0004rV-7E
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 01:16:23 +0000
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6088136-ad1b-4bdc-ba8f-c27f5dff07d2;
 Thu, 26 Nov 2020 01:16:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id j19so292099pgg.5
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 17:16:22 -0800 (PST)
Received: from google.com (c-67-188-94-199.hsd1.ca.comcast.net.
 [67.188.94.199])
 by smtp.gmail.com with ESMTPSA id e128sm2978987pfe.154.2020.11.25.17.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 17:16:20 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=87l1=FA=gmail.com=minchan.kim@srs-us1.protection.inumbo.net>)
	id 1ki5tX-0004rV-7E
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 01:16:23 +0000
X-Inumbo-ID: d6088136-ad1b-4bdc-ba8f-c27f5dff07d2
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6088136-ad1b-4bdc-ba8f-c27f5dff07d2;
	Thu, 26 Nov 2020 01:16:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id j19so292099pgg.5
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 17:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ffbgfORDd1J1xm3xxXp8xWzEs5sXbivtuhWMZ6CRpX8=;
        b=QvBDhQabcPJJmll9n1XSftf1/oCdc4AbjJKr3e1lsYr3oC6BYqnsjBtTeyYy83i7U3
         CiBd9FBSulwPjxAjN7h2emgRFMFS1h+Lw6DqhxGTuZzg7+z7LjtCeMG+R8Iu7GvPbymk
         ToF3QU0Kl5XY8lJh/Qkx9aL7d+kCec25ZtdGP0mSVt69+sY7dMUe9kHgs59VUC7F5d4d
         nBojS3btHNUmyJAhv9TgzqtLgQeQkeeQKwwl8KyW2EiBpga6aEsYA+VodfFczjdFHus+
         VDSakrHxOOPEEYbfR18sM6jijaOJSIrXZ6isVycVVCHpctMR7iHPW0kXlgmPrbk46btj
         mYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ffbgfORDd1J1xm3xxXp8xWzEs5sXbivtuhWMZ6CRpX8=;
        b=k8DdS2QTomAhPlNeOFhsGYMveHi3j9imynNJV06Sk2RKiL+6d24yHsKRvrTYigwQXe
         YZ9sNYbDTO9uA5e/i3XoVHQs2voLCJ2Ao+LHC7DcF+Bi8KVb7gU/cNXAGmVvOa9IZMvk
         8OumpCY2VjkzhKWYAlfWFFNN60P0g1EJdg+zen+845jf/rFd4m0H1FfmKNkXegdC1Wsl
         AKvOdmpnkZ5IXg9BedkMmGSloYqAh2wGhOZy8lqfZR2OdSfhP4/octnHFeF/bctQ5lcS
         agEx0dXnpFoalf0aqEB1gLTlxcZ6qVnYV+gEwHSYrPVaxQZA3SqwQ8iQZaCvjfaJQPoC
         QIlQ==
X-Gm-Message-State: AOAM530yPooMb7we9CSV1qDsCaxm9ef4qft2kOqrWDcL1g1ScslLkJqj
	YHEYcZPgtGQLMrJKpyIvgf8=
X-Google-Smtp-Source: ABdhPJxuwzDVcKoe4o/wMgwyIQrHY+YPGkp4YxJA+sp/vPwpgqgEvxXOvnlOmZ0BtRJFwRde4WH8Zg==
X-Received: by 2002:a62:8cc6:0:b029:19a:87b1:99bb with SMTP id m189-20020a628cc60000b029019a87b199bbmr637857pfd.6.1606353381534;
        Wed, 25 Nov 2020 17:16:21 -0800 (PST)
Received: from google.com (c-67-188-94-199.hsd1.ca.comcast.net. [67.188.94.199])
        by smtp.gmail.com with ESMTPSA id e128sm2978987pfe.154.2020.11.25.17.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 17:16:20 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Wed, 25 Nov 2020 17:16:16 -0800
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sergey.senozhatsky.work@gmail.com
Subject: Re: [PATCH 61/78] zram:  do not call set_blocksize
Message-ID: <20201126011616.GB57352@google.com>
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-62-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116145809.410558-62-hch@lst.de>

On Mon, Nov 16, 2020 at 03:57:52PM +0100, Christoph Hellwig wrote:
> set_blocksize is used by file systems to use their preferred buffer cache
> block size.  Block drivers should not set it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>

Thanks.

> ---
>  drivers/block/zram/zram_drv.c | 11 +----------
>  drivers/block/zram/zram_drv.h |  1 -
>  2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 3641434a9b154d..d00b5761ec0b21 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -403,13 +403,10 @@ static void reset_bdev(struct zram *zram)
>  		return;
>  
>  	bdev = zram->bdev;
> -	if (zram->old_block_size)
> -		set_blocksize(bdev, zram->old_block_size);
>  	blkdev_put(bdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
>  	/* hope filp_close flush all of IO */
>  	filp_close(zram->backing_dev, NULL);
>  	zram->backing_dev = NULL;
> -	zram->old_block_size = 0;
>  	zram->bdev = NULL;
>  	zram->disk->fops = &zram_devops;
>  	kvfree(zram->bitmap);
> @@ -454,7 +451,7 @@ static ssize_t backing_dev_store(struct device *dev,
>  	struct file *backing_dev = NULL;
>  	struct inode *inode;
>  	struct address_space *mapping;
> -	unsigned int bitmap_sz, old_block_size = 0;
> +	unsigned int bitmap_sz;
>  	unsigned long nr_pages, *bitmap = NULL;
>  	struct block_device *bdev = NULL;
>  	int err;
> @@ -509,14 +506,8 @@ static ssize_t backing_dev_store(struct device *dev,
>  		goto out;
>  	}
>  
> -	old_block_size = block_size(bdev);
> -	err = set_blocksize(bdev, PAGE_SIZE);
> -	if (err)
> -		goto out;
> -
>  	reset_bdev(zram);
>  
> -	zram->old_block_size = old_block_size;
>  	zram->bdev = bdev;
>  	zram->backing_dev = backing_dev;
>  	zram->bitmap = bitmap;
> diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
> index f2fd46daa76045..712354a4207c77 100644
> --- a/drivers/block/zram/zram_drv.h
> +++ b/drivers/block/zram/zram_drv.h
> @@ -118,7 +118,6 @@ struct zram {
>  	bool wb_limit_enable;
>  	u64 bd_wb_limit;
>  	struct block_device *bdev;
> -	unsigned int old_block_size;
>  	unsigned long *bitmap;
>  	unsigned long nr_pages;
>  #endif
> -- 
> 2.29.2
> 

