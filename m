Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC14307C1A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77304.139943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Az9-0002sB-UW; Thu, 28 Jan 2021 17:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77304.139943; Thu, 28 Jan 2021 17:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Az9-0002rk-RE; Thu, 28 Jan 2021 17:21:35 +0000
Received: by outflank-mailman (input) for mailman id 77304;
 Thu, 28 Jan 2021 17:21:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMWF=G7=kernel.org=djwong@srs-us1.protection.inumbo.net>)
 id 1l5Az8-0002rc-Cz
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:21:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a2d89ab-ba32-4dc4-acdd-213be3800a36;
 Thu, 28 Jan 2021 17:21:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C458764DED;
 Thu, 28 Jan 2021 17:21:32 +0000 (UTC)
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
X-Inumbo-ID: 3a2d89ab-ba32-4dc4-acdd-213be3800a36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854492;
	bh=wN/vYbjN9dGjcLcGdnyPwaVCaPorwnyIWndgrJa+c0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4Jj9WXKrn+6FaWHbaqLTTirarAYDVXXbmjKm43Pwyv9CvWF/FCcMNgRPgrx3ByMo
	 28fxrNXlVVTo5g3juSTT+7sNpMpJgqbGb4DuHZ8KF3an7+1BY6+nbU2z1+n7iGhwih
	 wkXCxISTeJgnl/ygSyJKGjvjcoECGRGnzVlWu3E9jKtn6wt5VP3JuKjRalNmzU1hCy
	 4OORtBiU8sk9BK43/E82eZ6NyUeC5IBPMIffBmVCBQkowGnqLXw2BEreMWAztT9vas
	 UyeabZv1xy0SE+hBOV4TAGEolTup4mRCss8y10V/Fh7qEXQ2ropSARSls0wsWRnCVn
	 9DTzlrlwSUtJA==
Date: Thu, 28 Jan 2021 09:21:32 -0800
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
Subject: Re: [RFC PATCH 26/34] xfs: use bio_new in xfs_rw_bdev
Message-ID: <20210128172132.GM7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-27-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128071133.60335-27-chaitanya.kulkarni@wdc.com>

On Wed, Jan 27, 2021 at 11:11:25PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

Seems fine to me...
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_bio_io.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
> index e2148f2d5d6b..e4644f22ebe6 100644
> --- a/fs/xfs/xfs_bio_io.c
> +++ b/fs/xfs/xfs_bio_io.c
> @@ -26,11 +26,8 @@ xfs_rw_bdev(
>  	if (is_vmalloc && op == REQ_OP_WRITE)
>  		flush_kernel_vmap_range(data, count);
>  
> -	bio = bio_alloc(GFP_KERNEL, bio_max_vecs(left));
> -	bio_set_dev(bio, bdev);
> -	bio->bi_iter.bi_sector = sector;
> -	bio->bi_opf = op | REQ_META | REQ_SYNC;
> -
> +	bio = bio_new(bdev, sector, op, REQ_META | REQ_SYNC, bio_max_vecs(left),
> +		      GFP_KERNEL);
>  	do {
>  		struct page	*page = kmem_to_page(data);
>  		unsigned int	off = offset_in_page(data);
> -- 
> 2.22.1
> 

