Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDA2B7F13
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29846.59535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfO8x-0001cp-Ns; Wed, 18 Nov 2020 14:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29846.59535; Wed, 18 Nov 2020 14:09:07 +0000
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
	id 1kfO8x-0001cQ-KJ; Wed, 18 Nov 2020 14:09:07 +0000
Received: by outflank-mailman (input) for mailman id 29846;
 Wed, 18 Nov 2020 14:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfO8w-0001cL-28
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:09:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 208269a4-836f-4a18-84d8-5c9f1022cbf0;
 Wed, 18 Nov 2020 14:09:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3BF2AC90;
 Wed, 18 Nov 2020 14:09:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5DDFD1E130B; Wed, 18 Nov 2020 15:09:03 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfO8w-0001cL-28
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:09:06 +0000
X-Inumbo-ID: 208269a4-836f-4a18-84d8-5c9f1022cbf0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 208269a4-836f-4a18-84d8-5c9f1022cbf0;
	Wed, 18 Nov 2020 14:09:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E3BF2AC90;
	Wed, 18 Nov 2020 14:09:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 5DDFD1E130B; Wed, 18 Nov 2020 15:09:03 +0100 (CET)
Date: Wed, 18 Nov 2020 15:09:03 +0100
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
Subject: Re: [PATCH 01/20] blk-cgroup: fix a hd_struct leak in
 blkcg_fill_root_iostats
Message-ID: <20201118140903.GF1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:41, Christoph Hellwig wrote:
> disk_get_part needs to be paired with a disk_put_part.
> 
> Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-cgroup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
> index c68bdf58c9a6e1..54fbe1e80cc41a 100644
> --- a/block/blk-cgroup.c
> +++ b/block/blk-cgroup.c
> @@ -849,6 +849,7 @@ static void blkcg_fill_root_iostats(void)
>  			blkg_iostat_set(&blkg->iostat.cur, &tmp);
>  			u64_stats_update_end(&blkg->iostat.sync);
>  		}
> +		disk_put_part(part);
>  	}
>  }
>  
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

