Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB94307C1C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77306.139954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AzS-0002xX-8t; Thu, 28 Jan 2021 17:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77306.139954; Thu, 28 Jan 2021 17:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AzS-0002x9-5O; Thu, 28 Jan 2021 17:21:54 +0000
Received: by outflank-mailman (input) for mailman id 77306;
 Thu, 28 Jan 2021 17:21:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMWF=G7=kernel.org=djwong@srs-us1.protection.inumbo.net>)
 id 1l5AzR-0002x0-E1
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:21:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd12ed7-5e5e-45cd-ab45-a469d7bf3847;
 Thu, 28 Jan 2021 17:21:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14BA564E14;
 Thu, 28 Jan 2021 17:21:52 +0000 (UTC)
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
X-Inumbo-ID: dbd12ed7-5e5e-45cd-ab45-a469d7bf3847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854512;
	bh=3wcbDXIsfKokQbmfUCYjGrgS3GF5z08Qdptdga5fUN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWOP7EPqmN6b3MiW9yEAgNNtNjSRtrXyFEpjaAGYBZII1sVNYI1YtSMwAvt9fuQBa
	 67CiLo3o5RvfcoATyHS1j02NITEEA3iqExwlLXezGs5RMp4QWJbqX9Dn+nc6m+I4rS
	 ryQ81C45k5DR4mIk6Zm2DTepJlJx7ughkR/Vt0AUwH3+rYDSQLjDOWM7DJGp0ETUnl
	 xurghfp/gRCwfqedNMDMPHZbg7F0alqw1H/gKUa0SjDmFnvopggMP4TjgUC2t6LP2S
	 1ujXulQBT2zqjOQLupxjXSsgT0HMqyI+WyoITl6y/0OvHf8iHp4HzyLmR4yVI/FSxp
	 yznAeENjD3n6w==
Date: Thu, 28 Jan 2021 09:21:51 -0800
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
Subject: Re: [RFC PATCH 27/34] xfs: use bio_new in xfs_buf_ioapply_map
Message-ID: <20210128172151.GN7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-28-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128071133.60335-28-chaitanya.kulkarni@wdc.com>

On Wed, Jan 27, 2021 at 11:11:26PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_buf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index f8400bbd6473..3ff6235e4f94 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -1507,12 +1507,10 @@ xfs_buf_ioapply_map(
>  	atomic_inc(&bp->b_io_remaining);
>  	nr_pages = min(total_nr_pages, BIO_MAX_PAGES);
>  
> -	bio = bio_alloc(GFP_NOIO, nr_pages);
> -	bio_set_dev(bio, bp->b_target->bt_bdev);
> -	bio->bi_iter.bi_sector = sector;
> +	bio = bio_new(bp->b_target->bt_bdev, sector, op, 0, nr_pages,
> +		      GFP_NOIO);
>  	bio->bi_end_io = xfs_buf_bio_end_io;
>  	bio->bi_private = bp;
> -	bio->bi_opf = op;
>  
>  	for (; size && nr_pages; nr_pages--, page_index++) {
>  		int	rbytes, nbytes = PAGE_SIZE - offset;
> -- 
> 2.22.1
> 

