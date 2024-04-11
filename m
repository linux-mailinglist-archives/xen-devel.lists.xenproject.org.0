Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF28A1C8E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 19:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704084.1100218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruyYJ-0003s7-Fo; Thu, 11 Apr 2024 17:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704084.1100218; Thu, 11 Apr 2024 17:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruyYJ-0003pi-Cy; Thu, 11 Apr 2024 17:49:35 +0000
Received: by outflank-mailman (input) for mailman id 704084;
 Thu, 11 Apr 2024 17:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czEU=LQ=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1ruyYH-0003p8-8w
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 17:49:34 +0000
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [2001:41d0:203:375::bc])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d93292e1-f82b-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 19:49:31 +0200 (CEST)
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
X-Inumbo-ID: d93292e1-f82b-11ee-94a3-07e782e9044d
Date: Thu, 11 Apr 2024 13:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712857769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/TZdE1FK3O4qkESTbUB1nUL6z8CdzrLZmjris90VHw=;
	b=aI/Km0jiSMVL4A1tCs8hlsrV66vbuWxJKZ+EgkonCW2LmuJAGBaIivtgu4+3HhSKhbSBh3
	uS3+3l/YqK0GsHToDiJSOy8jQgouByPKNokiyLYxRwngjkex1lryU/nDL4TDH7+GmcHLtc
	35AcbG0Y+MpEd8VLadpzkGxeP5lZ1Bo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de, 
	kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, 
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com, 
	konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org, hare@suse.de, 
	p.raghav@samsung.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, yukuai3@huawei.com, 
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 07/17] bcachefs: remove dead
 function bdev_sectors()
Message-ID: <2pat6ombemqnq5wjl6eb4lbip2pfgg5tkubmbwqphvcvpdc6cu@poiexziaa2q4>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-8-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221085712.1766333-8-yukuai1@huaweicloud.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Dec 21, 2023 at 04:57:02PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> bdev_sectors() is not used hence remove it.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  fs/bcachefs/util.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/fs/bcachefs/util.h b/fs/bcachefs/util.h
> index 2984b57b2958..22a0acc1704f 100644
> --- a/fs/bcachefs/util.h
> +++ b/fs/bcachefs/util.h
> @@ -516,11 +516,6 @@ static inline unsigned fract_exp_two(unsigned x, unsigned fract_bits)
>  void bch2_bio_map(struct bio *bio, void *base, size_t);
>  int bch2_bio_alloc_pages(struct bio *, size_t, gfp_t);
>  
> -static inline sector_t bdev_sectors(struct block_device *bdev)
> -{
> -	return bdev->bd_inode->i_size >> 9;
> -}
> -
>  #define closure_bio_submit(bio, cl)					\
>  do {									\
>  	closure_get(cl);						\
> -- 
> 2.39.2
> 

