Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DA81D55D
	for <lists+xen-devel@lfdr.de>; Sat, 23 Dec 2023 18:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659740.1029469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH5sM-0007Rl-8G; Sat, 23 Dec 2023 17:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659740.1029469; Sat, 23 Dec 2023 17:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH5sM-0007Ot-4i; Sat, 23 Dec 2023 17:33:26 +0000
Received: by outflank-mailman (input) for mailman id 659740;
 Sat, 23 Dec 2023 17:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsuN=IC=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1rH5sG-0007OX-G5
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2023 17:33:24 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab1b8ca-a1b9-11ee-9b0f-b553b5be7939;
 Sat, 23 Dec 2023 18:33:17 +0100 (CET)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rH5qt-00BIro-7V; Sat, 23 Dec 2023 17:31:55 +0000
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
X-Inumbo-ID: 5ab1b8ca-a1b9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cxs7b1r/Fe+mA08T4R0mNQ1fxv7+YhK2lTuot6SaQik=; b=n5ecZBTziYZYMztlj2287d4czK
	ml7cm9aw1T+0iVgkbnWKxaTTXKBcb46wrTtLR2cpZ6JzPt87e/ZOk+YN+BcmHpGceFYQwbG6TCmUn
	2/VVFTmvky5olmxAfDG+0qZ8z+LPPpf8u70Ai7d5Slq1K484QQZDKCm7dBvsESdFibfIkn0wHOZFA
	dZJMlBYBjYa9hkvZpbAVrPS56AMkvhhCeNeu4AfGdy+6akR7Z9BIJQ6lfh3OOUC9V+pNhgGo/mfiK
	S401NuO0YUaMlRsvZHgjfMbObBG2ZmuSJGS1ljZCYKmYCBguSKNIaneuWlwbS7egy1SGKjDV3fGW4
	digukkoQ==;
Date: Sat, 23 Dec 2023 17:31:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <ZYcZi5YYvt5QHrG9@casper.infradead.org>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221085712.1766333-10-yukuai1@huaweicloud.com>

On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
>  		 * Drop the page of the primary superblock, so later read will
>  		 * always read from the device.
>  		 */
> -		invalidate_inode_pages2_range(mapping,
> -				bytenr >> PAGE_SHIFT,
> +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
>  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
>  	}
>  
> -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> -	if (IS_ERR(page))
> -		return ERR_CAST(page);
> +	nofs_flag = memalloc_nofs_save();
> +	folio = bdev_read_folio(bdev, bytenr);
> +	memalloc_nofs_restore(nofs_flag);

This is the wrong way to use memalloc_nofs_save/restore.  They should be
used at the point that the filesystem takes/releases whatever lock is
also used during reclaim.  I don't know btrfs well enough to suggest
what lock is missing these annotations.


