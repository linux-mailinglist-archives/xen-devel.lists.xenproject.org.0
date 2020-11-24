Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83362C30C6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36953.69058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khe82-0006Bh-Rk; Tue, 24 Nov 2020 19:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36953.69058; Tue, 24 Nov 2020 19:37:30 +0000
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
	id 1khe82-0006BI-Od; Tue, 24 Nov 2020 19:37:30 +0000
Received: by outflank-mailman (input) for mailman id 36953;
 Tue, 24 Nov 2020 19:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khe81-0006BD-5T
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:37:29 +0000
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c205fd3-08c4-4ce3-b808-880f517c869b;
 Tue, 24 Nov 2020 19:37:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 7so17013114qtp.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 11:37:28 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id t126sm68819qkh.133.2020.11.24.11.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:37:27 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khe81-0006BD-5T
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:37:29 +0000
X-Inumbo-ID: 8c205fd3-08c4-4ce3-b808-880f517c869b
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8c205fd3-08c4-4ce3-b808-880f517c869b;
	Tue, 24 Nov 2020 19:37:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 7so17013114qtp.1
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 11:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MOALJb5ZWPUh3aGAOfM0OVshborSGP7hJGfOxgGOGv8=;
        b=F5LkT6+P6W0m+3hlLX1OTdLAaWDWNPd5qU0zVXgoS6irqhQG1KPClCgLDacxdrz201
         tuSkOD3Pi7npw/jwH1Nvh11d7rq8LRNxgjQNm41OqnMYV7uCJqaXEwyai41Uj47dAbX3
         JK7du1QUlRFM6taLlQQ447SfHtDJsH8zezvU1GOUPlebgL174F6/7EsV7OtuCUoF3f9x
         Bkfc9gd/0KWs5FVV7usVufNl9+blVTvGwiyUy7osMlVAVbdFXgSTZohKeNl02jc4WQz4
         A0OAp0Qtsho7RAxf4m3roj9E2ZLkZ4zwUy7kn8kRWPQltha8Qf/YzRNO/2ELqU44tB/d
         HyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=MOALJb5ZWPUh3aGAOfM0OVshborSGP7hJGfOxgGOGv8=;
        b=JV2CP7aXQ3CVx3f0qUls4kOlKnuOiCRlowcPfKW+WWQqbl//XTURuZRr2D2rOkF/1T
         gf1V1wvIfbTGztYXliIXi8WR+4uxkGhkDvkO0WJMOzZRTt0/9ESCTI/qB+/8AZ1Sndgl
         Xo/+b1wFB5RMYmavO1Arkcyl1c5KZcLpmJ1cMfhuoBggp7T7cyNlv4RLvqEwucF7RcAR
         G+gz8GBPfjJhbSvtdU/nTnmuYAv0W54b2KXvDE2In5Ty590dq3Rv2Uj5NFlGQL6JUkav
         HOYAJsT1HQIlKC7TVYdZvXtIQEnKA/XVExjDeJhgt6aGAswGvad/z7oo2ov60toso9nj
         VOsg==
X-Gm-Message-State: AOAM533pdOWWBg2zXa2fpTx+nR5Im/bWVEKhn6Hz6gPgczLkXcnNGh0T
	KDm9ZY8YyO5u1Z7k10/Ac/M=
X-Google-Smtp-Source: ABdhPJybxY5/E0+KDq94c9P/N9IKjFDU+Ct8NW6WiHsGOrtJ7iW5aHJE2Msrh+VJOHLo1ru6UJnxSg==
X-Received: by 2002:ac8:7192:: with SMTP id w18mr6129290qto.149.1606246647881;
        Tue, 24 Nov 2020 11:37:27 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id t126sm68819qkh.133.2020.11.24.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:37:27 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 14:37:05 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 23/45] block: remove i_bdev
Message-ID: <X71g4Tm+3RiRg4Gf@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-24-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:29PM +0100, Christoph Hellwig wrote:
> Switch the block device lookup interfaces to directly work with a dev_t
> so that struct block_device references are only acquired by the
> blkdev_get variants (and the blk-cgroup special case).  This means that
> we not don't need an extra reference in the inode and can generally
     ^
     now
> simplify handling of struct block_device to keep the lookups contained
> in the core block layer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
...
> @@ -1689,14 +1599,12 @@ static int blkdev_open(struct inode * inode, struct file * filp)
>  	if ((filp->f_flags & O_ACCMODE) == 3)
>  		filp->f_mode |= FMODE_WRITE_IOCTL;
>  
> -	bdev = bd_acquire(inode);
> -	if (bdev == NULL)
> -		return -ENOMEM;
> -
> +	bdev = blkdev_get_by_dev(inode->i_rdev, filp->f_mode, filp);
> +	if (IS_ERR(bdev))
> +		return PTR_ERR(bdev);
>  	filp->f_mapping = bdev->bd_inode->i_mapping;
>  	filp->f_wb_err = filemap_sample_wb_err(filp->f_mapping);
> -
> -	return blkdev_get(bdev, filp->f_mode, filp);
> +	return 0;
>  }

I was wondering whether losing the stale bdev flushing in bd_acquire() would
cause user-visible behavior changes but can't see how it would given that
userland has no way of holding onto a specific instance of block inode.
Maybe it's something worth mentioning in the commit message?

Other than that, for the block part:

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

