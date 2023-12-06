Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9518066C7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 06:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648867.1012856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAkst-0005Sg-Hv; Wed, 06 Dec 2023 05:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648867.1012856; Wed, 06 Dec 2023 05:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAkst-0005Q9-Es; Wed, 06 Dec 2023 05:55:47 +0000
Received: by outflank-mailman (input) for mailman id 648867;
 Wed, 06 Dec 2023 05:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sruh=HR=bombadil.srs.infradead.org=BATV+2d31c4bdfe93494595b7+7409+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rAkss-0005Ob-2b
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 05:55:46 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17624826-93fc-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 06:55:44 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rAksK-0098VN-1r; Wed, 06 Dec 2023 05:55:12 +0000
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
X-Inumbo-ID: 17624826-93fc-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xcibP2/q8bOqf4fxy/s4jPIW/mCxqp75SLAGVg7i4NU=; b=b3J5XsDs0PyA92hRCgS7oXZdR9
	ifDdarPmUYCMrG98S736dZG8kM1x/gQQQMc5wbP6LBstLaiBbMkgjdmm3ZBz1/VZYMYl2CKgSrOqA
	6sv2Lx0erfBewjEuwGujlJGlwetZ28Sn5fFPkgpl7w9ObSzuwh0lFLzpJv0wptOrDoURjTJADLCwA
	y9AxQ2Xb02C1t9sqLtDibhZsQhjvZhTJUa5jTZPHO/j47wPs5TAzpE67yotaXPyN/SzYNI4wSM+4B
	R9yJgisFwpCMYV8xJB8jj/Ab+L1VErOFhZIjCSHrQBRU44+YzUnRp28je/BG611oRLdUIqfreibNC
	VVVWoI6Q==;
Date: Tue, 5 Dec 2023 21:55:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 02/14] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <ZXAMwBD8pd48qwX/@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-3-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205123728.1866699-3-yukuai1@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Dec 05, 2023 at 08:37:16PM +0800, Yu Kuai wrote:
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index e34219ea2b05..e645afa4af57 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -104,8 +104,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
>  		xenbus_dev_error(blkif->be->dev, err, "block flush");
>  		return;
>  	}
> -	invalidate_inode_pages2(
> -			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
> +	invalidate_bdev(blkif->vbd.bdev_handle->bdev);

blkbak is a bdev exported.   I don't think it should ever call
invalidate_inode_pages2, through a wrapper or not.


