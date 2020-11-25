Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539052C4143
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 14:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37781.70294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khv12-0007mR-Fg; Wed, 25 Nov 2020 13:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37781.70294; Wed, 25 Nov 2020 13:39:24 +0000
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
	id 1khv12-0007m2-CZ; Wed, 25 Nov 2020 13:39:24 +0000
Received: by outflank-mailman (input) for mailman id 37781;
 Wed, 25 Nov 2020 13:39:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1khv10-0007lw-HF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:39:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af0670e9-7ae3-48f1-971f-7223551ae775;
 Wed, 25 Nov 2020 13:39:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCF50AC23;
 Wed, 25 Nov 2020 13:39:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8ACF21E130F; Wed, 25 Nov 2020 14:39:20 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1khv10-0007lw-HF
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:39:22 +0000
X-Inumbo-ID: af0670e9-7ae3-48f1-971f-7223551ae775
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id af0670e9-7ae3-48f1-971f-7223551ae775;
	Wed, 25 Nov 2020 13:39:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BCF50AC23;
	Wed, 25 Nov 2020 13:39:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 8ACF21E130F; Wed, 25 Nov 2020 14:39:20 +0100 (CET)
Date: Wed, 25 Nov 2020 14:39:20 +0100
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
Subject: Re: [PATCH 12/45] block: remove a superflous check in blkpg_do_ioctl
Message-ID: <20201125133920.GL16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-13-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-13-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 24-11-20 14:27:18, Christoph Hellwig wrote:
> sector_t is now always a u64, so this check is not needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/ioctl.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 6b785181344fe1..0c09bb7a6ff35f 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -35,15 +35,6 @@ static int blkpg_do_ioctl(struct block_device *bdev,
>  	start = p.start >> SECTOR_SHIFT;
>  	length = p.length >> SECTOR_SHIFT;
>  
> -	/* check for fit in a hd_struct */
> -	if (sizeof(sector_t) < sizeof(long long)) {
> -		long pstart = start, plength = length;
> -
> -		if (pstart != start || plength != length || pstart < 0 ||
> -		    plength < 0 || p.pno > 65535)
> -			return -EINVAL;
> -	}
> -
>  	switch (op) {
>  	case BLKPG_ADD_PARTITION:
>  		/* check if partition is aligned to blocksize */
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

