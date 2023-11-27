Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774567F9A36
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 07:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641610.1000301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7VRY-0005O7-K9; Mon, 27 Nov 2023 06:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641610.1000301; Mon, 27 Nov 2023 06:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7VRY-0005LH-Hf; Mon, 27 Nov 2023 06:50:08 +0000
Received: by outflank-mailman (input) for mailman id 641610;
 Mon, 27 Nov 2023 06:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtR5=HI=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1r7VRW-0005GH-F8
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 06:50:07 +0000
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [2001:41d0:1004:224b::b9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 315242b8-8cf1-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 07:50:04 +0100 (CET)
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
X-Inumbo-ID: 315242b8-8cf1-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 01:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701067801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HkjYQiNIVrfX2OBhuLTiiwzS64/a/ylKVqG71mkDtoA=;
	b=DL1ZcP/KviDDoXIKv0QIFRLZT2BpMmMrebGvWHdGh9aTKtxpmaDswg71Y2nAKp49rM9zFi
	oCfHCq5KhNQGYzCFdxPL2IiRC5e4TQlt44fRgVAiZlc1g3fzyjxEcQWPI04lYpzGeBzudu
	z+mDuhqyi808TBjcj4dzEHnQIZ2UEX0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	dchinner@redhat.com, linux@weissschuh.net, min15.li@samsung.com,
	yukuai3@huawei.com, dlemoal@kernel.org, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH block/for-next v2 07/16] bcachefs: use new helper to get
 inode from block_device
Message-ID: <20231127064953.uo7bf2o62nroyjxs@moria.home.lan>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-8-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127062116.2355129-8-yukuai1@huaweicloud.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Nov 27, 2023 at 02:21:07PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Which is more efficiency, and also prepare to remove the field
> 'bd_inode' from block_device.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  fs/bcachefs/util.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/util.h b/fs/bcachefs/util.h
> index 2984b57b2958..fe7ccb3a3517 100644
> --- a/fs/bcachefs/util.h
> +++ b/fs/bcachefs/util.h
> @@ -518,7 +518,7 @@ int bch2_bio_alloc_pages(struct bio *, size_t, gfp_t);
>  
>  static inline sector_t bdev_sectors(struct block_device *bdev)
>  {
> -	return bdev->bd_inode->i_size >> 9;
> +	return bdev_inode(bdev)->i_size >> 9;
>  }
>  
>  #define closure_bio_submit(bio, cl)					\
> -- 
> 2.39.2
> 

