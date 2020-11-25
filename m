Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC602C402D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37727.70194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtvp-0000u3-Hq; Wed, 25 Nov 2020 12:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37727.70194; Wed, 25 Nov 2020 12:29:57 +0000
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
	id 1khtvp-0000ti-Ef; Wed, 25 Nov 2020 12:29:57 +0000
Received: by outflank-mailman (input) for mailman id 37727;
 Wed, 25 Nov 2020 12:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1khtvn-0000td-Px
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:29:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b297b2f-0c74-4ea9-a344-a5f17df76e05;
 Wed, 25 Nov 2020 12:29:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF41AACBD;
 Wed, 25 Nov 2020 12:29:53 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 416E21E130F; Wed, 25 Nov 2020 13:29:53 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1khtvn-0000td-Px
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:29:55 +0000
X-Inumbo-ID: 1b297b2f-0c74-4ea9-a344-a5f17df76e05
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1b297b2f-0c74-4ea9-a344-a5f17df76e05;
	Wed, 25 Nov 2020 12:29:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BF41AACBD;
	Wed, 25 Nov 2020 12:29:53 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 416E21E130F; Wed, 25 Nov 2020 13:29:53 +0100 (CET)
Date: Wed, 25 Nov 2020 13:29:53 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
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
Subject: Re: [PATCH 04/45] fs: simplify freeze_bdev/thaw_bdev
Message-ID: <20201125122953.GH16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 24-11-20 14:27:10, Christoph Hellwig wrote:
> Store the frozen superblock in struct block_device to avoid the awkward
> interface that can return a sb only used a cookie, an ERR_PTR or NULL.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Some comments below...

> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index d8664f5c1ff669..60492620d51866 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -548,55 +548,47 @@ EXPORT_SYMBOL(fsync_bdev);
>   * count down in thaw_bdev(). When it becomes 0, thaw_bdev() will unfreeze
>   * actually.
>   */
> -struct super_block *freeze_bdev(struct block_device *bdev)
> +int freeze_bdev(struct block_device *bdev)
>  {
>  	struct super_block *sb;
>  	int error = 0;
>  
>  	mutex_lock(&bdev->bd_fsfreeze_mutex);
> -	if (++bdev->bd_fsfreeze_count > 1) {
> -		/*
> -		 * We don't even need to grab a reference - the first call
> -		 * to freeze_bdev grab an active reference and only the last
> -		 * thaw_bdev drops it.
> -		 */
> -		sb = get_super(bdev);
> -		if (sb)
> -			drop_super(sb);
> -		mutex_unlock(&bdev->bd_fsfreeze_mutex);
> -		return sb;
> -	}
> +	if (++bdev->bd_fsfreeze_count > 1)
> +		goto done;
>  
>  	sb = get_active_super(bdev);
>  	if (!sb)
> -		goto out;
> +		goto sync;
>  	if (sb->s_op->freeze_super)
>  		error = sb->s_op->freeze_super(sb);
>  	else
>  		error = freeze_super(sb);
> +	deactivate_super(sb);
> +
>  	if (error) {
> -		deactivate_super(sb);
>  		bdev->bd_fsfreeze_count--;
> -		mutex_unlock(&bdev->bd_fsfreeze_mutex);
> -		return ERR_PTR(error);
> +		goto done;
>  	}
> -	deactivate_super(sb);
> - out:
> +	bdev->bd_fsfreeze_sb = sb;
> +
> +sync:
>  	sync_blockdev(bdev);
> +done:
>  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> -	return sb;	/* thaw_bdev releases s->s_umount */
> +	return error;	/* thaw_bdev releases s->s_umount */

The comment about thaw_bdev() seems to be stale? At least I don't see what
it's speaking about...

>  }
>  EXPORT_SYMBOL(freeze_bdev);
>  
>  /**
>   * thaw_bdev  -- unlock filesystem
>   * @bdev:	blockdevice to unlock
> - * @sb:		associated superblock
>   *
>   * Unlocks the filesystem and marks it writeable again after freeze_bdev().
>   */
> -int thaw_bdev(struct block_device *bdev, struct super_block *sb)
> +int thaw_bdev(struct block_device *bdev)
>  {
> +	struct super_block *sb;
>  	int error = -EINVAL;
>  
>  	mutex_lock(&bdev->bd_fsfreeze_mutex);
> @@ -607,6 +599,7 @@ int thaw_bdev(struct block_device *bdev, struct super_block *sb)
>  	if (--bdev->bd_fsfreeze_count > 0)
>  		goto out;
>  
> +	sb = bdev->bd_fsfreeze_sb;
>  	if (!sb)
>  		goto out;
>  
> @@ -618,7 +611,7 @@ int thaw_bdev(struct block_device *bdev, struct super_block *sb)
>  		bdev->bd_fsfreeze_count++;
>  out:
>  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> -	return error;
> +	return 0;

But we now won't return -EINVAL if this gets called e.g. with
bd_fsfreeze_count == 0, right?

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

