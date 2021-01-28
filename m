Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7265307C30
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77314.139967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5B1Z-0003AN-LM; Thu, 28 Jan 2021 17:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77314.139967; Thu, 28 Jan 2021 17:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5B1Z-00039x-I2; Thu, 28 Jan 2021 17:24:05 +0000
Received: by outflank-mailman (input) for mailman id 77314;
 Thu, 28 Jan 2021 17:24:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMWF=G7=kernel.org=djwong@srs-us1.protection.inumbo.net>)
 id 1l5B1Y-00039r-BX
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:24:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 383f1d05-3695-4fae-9c0a-a6da0f9bcd89;
 Thu, 28 Jan 2021 17:24:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B21F464DF9;
 Thu, 28 Jan 2021 17:24:02 +0000 (UTC)
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
X-Inumbo-ID: 383f1d05-3695-4fae-9c0a-a6da0f9bcd89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854642;
	bh=Zs2s8ZvTIPYGR4BFwbfSOZLDbQpy7x8YdhBNvxD8Dok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYixlgG2K3aWwDLaJowzYgnOFmByUyz6PjYTAvhTfbvB+e9gPk0mBgRRvBez32mDu
	 g+/BEjUeO2s7tBkV+OtFiT2UlC3mn8gjSXsXC5Xpxm6KRmfDNpc8Z7+gIuibodKK4H
	 l1i2cwlyEJsSukyTcGjNrcpQfEjVAbCBE6DwgrePquTtnF0XcOLlk2eq3YbBOrXlcF
	 50KQtEwBjnE5+b+zJhPCQRu9YN8ISWqvJskcg8GQfdpqKteYo166Aso1a23IfJvuVj
	 VfAojNA36QPu6qz6sKkxuvacugxCY5JwWT3tNh6OxRrRzVwkEqP+vyF3JrdyJAT+Ys
	 o8BRepJ02vTLA==
Date: Thu, 28 Jan 2021 09:24:02 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org, axboe@kernel.dk,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	konrad.wilk@oracle.com, roger.pau@citrix.com, minchan@kernel.org,
	ngupta@vflare.org, sergey.senozhatsky.work@gmail.com,
	agk@redhat.com, snitzer@redhat.com, hch@lst.de, sagi@grimberg.me,
	martin.petersen@oracle.com, viro@zeniv.linux.org.uk, tytso@mit.edu,
	jaegeuk@kernel.org, ebiggers@kernel.org, shaggy@kernel.org,
	konishi.ryusuke@gmail.com, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, damien.lemoal@wdc.com,
	naohiro.aota@wdc.com, jth@kernel.org, rjw@rjwysocki.net,
	len.brown@intel.com, pavel@ucw.cz, akpm@linux-foundation.org,
	hare@suse.de, gustavoars@kernel.org, tiwai@suse.de,
	alex.shi@linux.alibaba.com, asml.silence@gmail.com,
	ming.lei@redhat.com, tj@kernel.org, osandov@fb.com,
	bvanassche@acm.org, jefflexu@linux.alibaba.com
Subject: Re: [RFC PATCH 18/34] iomap: use bio_new in iomap_dio_bio_actor
Message-ID: <20210128172402.GO7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-19-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128071133.60335-19-chaitanya.kulkarni@wdc.com>

On Wed, Jan 27, 2021 at 11:11:17PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  fs/iomap/direct-io.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index f6c557a1bd25..0737192f7e5c 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -267,9 +267,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  			goto out;
>  		}
>  
> -		bio = bio_alloc(GFP_KERNEL, nr_pages);
> -		bio_set_dev(bio, iomap->bdev);
> -		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
> +		bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), 0, 0,
> +			      nr_pages, GFP_KERNEL);

op == 0?  It seems a little odd to me that we'd set the field to zero
and then construct bi_opf later.

It also strikes me as a little strange that bi_opf is combined from the
third and fourth parameters, but maybe some day you'll want to do some
parameter verification on debug kernels or something...?

--D

>  		bio->bi_write_hint = dio->iocb->ki_hint;
>  		bio->bi_ioprio = dio->iocb->ki_ioprio;
>  		bio->bi_private = dio;
> -- 
> 2.22.1
> 

