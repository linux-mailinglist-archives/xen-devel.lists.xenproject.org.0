Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999112C413A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 14:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37774.70282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khuzQ-0007ax-4Y; Wed, 25 Nov 2020 13:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37774.70282; Wed, 25 Nov 2020 13:37:44 +0000
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
	id 1khuzQ-0007aY-0z; Wed, 25 Nov 2020 13:37:44 +0000
Received: by outflank-mailman (input) for mailman id 37774;
 Wed, 25 Nov 2020 13:37:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1khuzP-0007aT-0W
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:37:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd60aa23-ce69-40de-9f3b-6480a6c76526;
 Wed, 25 Nov 2020 13:37:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A70EAC22;
 Wed, 25 Nov 2020 13:37:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 658EF1E130F; Wed, 25 Nov 2020 14:37:39 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1khuzP-0007aT-0W
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:37:43 +0000
X-Inumbo-ID: cd60aa23-ce69-40de-9f3b-6480a6c76526
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd60aa23-ce69-40de-9f3b-6480a6c76526;
	Wed, 25 Nov 2020 13:37:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A70EAC22;
	Wed, 25 Nov 2020 13:37:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 658EF1E130F; Wed, 25 Nov 2020 14:37:39 +0100 (CET)
Date: Wed, 25 Nov 2020 14:37:39 +0100
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
Subject: Re: [PATCH 08/45] loop: do not call set_blocksize
Message-ID: <20201125133739.GK16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 24-11-20 14:27:14, Christoph Hellwig wrote:
> set_blocksize is used by file systems to use their preferred buffer cache
> block size.  Block drivers should not set it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/loop.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 9a27d4f1c08aac..b42c728620c9e4 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1164,9 +1164,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
>  	size = get_loop_size(lo, file);
>  	loop_set_size(lo, size);
>  
> -	set_blocksize(bdev, S_ISBLK(inode->i_mode) ?
> -		      block_size(inode->i_bdev) : PAGE_SIZE);
> -
>  	lo->lo_state = Lo_bound;
>  	if (part_shift)
>  		lo->lo_flags |= LO_FLAGS_PARTSCAN;
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

