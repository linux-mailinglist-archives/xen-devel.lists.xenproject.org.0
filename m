Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF462B86CA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 22:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30273.60204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfV6W-0000bl-EW; Wed, 18 Nov 2020 21:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30273.60204; Wed, 18 Nov 2020 21:35:04 +0000
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
	id 1kfV6W-0000ay-9V; Wed, 18 Nov 2020 21:35:04 +0000
Received: by outflank-mailman (input) for mailman id 30273;
 Wed, 18 Nov 2020 21:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfV6U-0008UU-4P
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:35:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d11608f-e805-418b-99fc-e1b0779d1a6e;
 Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C215B013;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 90FA11E1319; Wed, 18 Nov 2020 15:19:27 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfV6U-0008UU-4P
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:35:02 +0000
X-Inumbo-ID: 7d11608f-e805-418b-99fc-e1b0779d1a6e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7d11608f-e805-418b-99fc-e1b0779d1a6e;
	Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3C215B013;
	Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 90FA11E1319; Wed, 18 Nov 2020 15:19:27 +0100 (CET)
Date: Wed, 18 Nov 2020 15:19:27 +0100
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
Subject: Re: [PATCH 04/20] block: use disk_part_iter_exit in
 disk_part_iter_next
Message-ID: <20201118141927.GI1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:44, Christoph Hellwig wrote:
> Call disk_part_iter_exit in disk_part_iter_next instead of duplicating
> the functionality.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

OK. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/genhd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 4e039524f92b8f..0bd9c41dd4cb69 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -227,8 +227,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
>  	int inc, end;
>  
>  	/* put the last partition */
> -	disk_put_part(piter->part);
> -	piter->part = NULL;
> +	disk_part_iter_exit(piter);
>  
>  	/* get part_tbl */
>  	rcu_read_lock();
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

