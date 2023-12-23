Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AEC81D60E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Dec 2023 19:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659760.1029499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH6uP-0007Bs-ML; Sat, 23 Dec 2023 18:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659760.1029499; Sat, 23 Dec 2023 18:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH6uP-00079V-J8; Sat, 23 Dec 2023 18:39:37 +0000
Received: by outflank-mailman (input) for mailman id 659760;
 Sat, 23 Dec 2023 18:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS80=IC=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1rH6uN-00079P-Uc
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2023 18:39:36 +0000
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d63c619-a1c2-11ee-9b0f-b553b5be7939;
 Sat, 23 Dec 2023 19:39:33 +0100 (CET)
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
X-Inumbo-ID: 9d63c619-a1c2-11ee-9b0f-b553b5be7939
Date: Sat, 23 Dec 2023 13:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703356772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8KqWKpD6wWjbvJJznLUba3EPd6rpJb9056eV80EZI=;
	b=mLUUfEd7gfPYDe3oleQ9tbdyTO5xnWBH1tZ17cgI4qqbATl0NNgyxkk9s86/LqjribMhXF
	icSGv6krf/Bb8nP/Rk+sLamzbNdocnFQ0i9s/yQOF2bzXjM3YAZVaDOCpBwjSIvilLWEoR
	/klCC3TPr9UUNblk28yYvK2TJLs04lQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, 
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, 
	hoeppner@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com, 
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org, nico@fluxnic.net, 
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, 
	jack@suse.com, konishi.ryusuke@gmail.com, akpm@linux-foundation.org, 
	hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, 
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <j52xmye4qmjqv4mq524ppvqr7naicobnwn2qfcvftbj4zoowga@t6klttrjtq2d>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
 <ZYcZi5YYvt5QHrG9@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYcZi5YYvt5QHrG9@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT

On Sat, Dec 23, 2023 at 05:31:55PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> > @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
> >  		 * Drop the page of the primary superblock, so later read will
> >  		 * always read from the device.
> >  		 */
> > -		invalidate_inode_pages2_range(mapping,
> > -				bytenr >> PAGE_SHIFT,
> > +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
> >  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
> >  	}
> >  
> > -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> > -	if (IS_ERR(page))
> > -		return ERR_CAST(page);
> > +	nofs_flag = memalloc_nofs_save();
> > +	folio = bdev_read_folio(bdev, bytenr);
> > +	memalloc_nofs_restore(nofs_flag);
> 
> This is the wrong way to use memalloc_nofs_save/restore.  They should be
> used at the point that the filesystem takes/releases whatever lock is
> also used during reclaim.  I don't know btrfs well enough to suggest
> what lock is missing these annotations.

Yes, but considering this is a cross-filesystem cleanup I wouldn't want
to address that in this patchset. And the easier, more incremental
approach for the conversion would be to first convert every GFP_NOFS
usage  to memalloc_nofs_save() like this patch does, as small local
changes, and then let the btrfs people combine them and move them to the
approproate location in a separate patchstet.

