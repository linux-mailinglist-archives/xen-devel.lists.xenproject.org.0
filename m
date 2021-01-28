Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F023C307B93
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77275.139858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Af7-0000L6-Ph; Thu, 28 Jan 2021 17:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77275.139858; Thu, 28 Jan 2021 17:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Af7-0000Kh-Lq; Thu, 28 Jan 2021 17:00:53 +0000
Received: by outflank-mailman (input) for mailman id 77275;
 Thu, 28 Jan 2021 16:59:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMWF=G7=kernel.org=djwong@srs-us1.protection.inumbo.net>)
 id 1l5Ae4-00082Y-P0
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:59:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf9f499b-1317-4784-9461-0663aededbcf;
 Thu, 28 Jan 2021 16:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EEE564E0E;
 Thu, 28 Jan 2021 16:59:47 +0000 (UTC)
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
X-Inumbo-ID: bf9f499b-1317-4784-9461-0663aededbcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611853187;
	bh=f6FDYR+2fbZ3ZjuVDKmJrkeFHlqyA4P3vGdmoyOPa1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rzag2xxRHgFBGSJ365/QUldWd9CTCZVGt3cs71rJutBhKs94QB4O0wVHJ78U0xIF9
	 n96V7cXtAmPsB9hu9gUYvKXwcH1SXtYNdkFw15Hr/lW1MQ6ApKzq4voIl5psE+u1SS
	 oIYlBt3CEfmzYKr/W9GKeV1ES9XtHwmC1KiXTL4cmN2/9EoY9kXCbDD71u9sIp+Nfr
	 FbyyfdHM+E5ZA+F8801PzzCElIq3kyLXwweF8LRAnfmH79wwG+57YuSijr3uE7kbk9
	 /DpcS6Ckt3f1RwDjmwI1QhKt/MkNHods9aX+BJj1ComGJOXJH3o25qnvlVltgShwCo
	 r/bA/dJbtb2Sw==
Date: Thu, 28 Jan 2021 08:59:46 -0800
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
Subject: Re: [RFC PATCH 17/34] iomap: use bio_new in iomap_dio_zero
Message-ID: <20210128165946.GL7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-18-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128071133.60335-18-chaitanya.kulkarni@wdc.com>

On Wed, Jan 27, 2021 at 11:11:16PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

Looks ok to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/direct-io.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index ea1e8f696076..f6c557a1bd25 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -189,15 +189,13 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
>  	int flags = REQ_SYNC | REQ_IDLE;
>  	struct bio *bio;
>  
> -	bio = bio_alloc(GFP_KERNEL, 1);
> -	bio_set_dev(bio, iomap->bdev);
> -	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
> +	bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), REQ_OP_WRITE,
> +		      flags, 1, GFP_KERNEL);
>  	bio->bi_private = dio;
>  	bio->bi_end_io = iomap_dio_bio_end_io;
>  
>  	get_page(page);
>  	__bio_add_page(bio, page, len, 0);
> -	bio_set_op_attrs(bio, REQ_OP_WRITE, flags);
>  	iomap_dio_submit_bio(dio, iomap, bio, pos);
>  }
>  
> -- 
> 2.22.1
> 

