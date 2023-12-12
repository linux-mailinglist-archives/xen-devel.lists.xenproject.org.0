Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF280ED29
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653123.1019395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2dY-0007b7-RD; Tue, 12 Dec 2023 13:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653123.1019395; Tue, 12 Dec 2023 13:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2dY-0007Ym-Nx; Tue, 12 Dec 2023 13:17:24 +0000
Received: by outflank-mailman (input) for mailman id 653123;
 Tue, 12 Dec 2023 13:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/80=HX=bombadil.srs.infradead.org=BATV+6f90c2f2ff3264e7ff81+7415+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rD2dX-0007XS-Io
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:17:23 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7eac0bc-98f0-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 14:17:21 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rD2d4-00Bm1M-0C; Tue, 12 Dec 2023 13:16:54 +0000
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
X-Inumbo-ID: c7eac0bc-98f0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=76xsvfvsQao0L1F4mpEWw4iFvDSKTUGOH0rkCxylyR0=; b=QmO1jXrHyamW18FiZ0XlDmH8Gd
	J6J4dTRw2FLTkkOKvQrns7exRXAFguyfbw2uOyWEWmNoQXBfbqBZNewfmIkmoQ6bdSNxZ1x5tnPZH
	084wgWpxKkNR2iIpsHjtrRZ9JY1ddTp/EvS2MbTosRtewIEI8Orvb3OQJiNOerl/hksqowqURXjvG
	fYWtLshBV60dlUDv9CIGwurTqiWt8vAiJIHs2JUjuped4+Ibfiu5fRUW9EHItbwHjIC6CXlZJyNyk
	OIbxjiE1dEkn9Ncl10qwLKuiHA8BtEyU6VYvKAm8AyY9ExdjsSwpGxcfoUdawzLHnMiAOJUPVSQrR
	k2K6LA6Q==;
Date: Tue, 12 Dec 2023 05:16:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, p.raghav@samsung.com, hare@suse.de,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
Message-ID: <ZXhdRhfr+JoWdhyj@infradead.org>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140552.973290-2-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140552.973290-2-yukuai1@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

> +void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
> +			   pgoff_t end)
> +{
> +	invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
> +}
> +EXPORT_SYMBOL_GPL(invalidate_bdev_range);

Can we have kerneldoc comments for the new helpers please?

> +struct folio *__bdev_get_folio(struct block_device *bdev, loff_t pos,
> +			       fgf_t fgp_flags, gfp_t gfp)
> +{
> +	return __filemap_get_folio(bdev->bd_inode->i_mapping, pos >> PAGE_SHIFT,
> +				   fgp_flags, gfp);
> +}
> +EXPORT_SYMBOL_GPL(__bdev_get_folio);

It's a bit silly to have a __-prefixed API without a version that
doesn't have the prefix, so I'd prefer to drop it.  Unless willy has
a good argument for keeping it the same as the filemap API.


