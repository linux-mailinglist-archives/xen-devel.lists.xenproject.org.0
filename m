Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9A7476BE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558564.872777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGitT-0006nR-6I; Tue, 04 Jul 2023 16:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558564.872777; Tue, 04 Jul 2023 16:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGitT-0006kI-3R; Tue, 04 Jul 2023 16:28:47 +0000
Received: by outflank-mailman (input) for mailman id 558564;
 Tue, 04 Jul 2023 16:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHqM=CW=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1qGitR-0006kC-T3
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:28:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d79cc4da-1a87-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 18:28:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A3D9612CF;
 Tue,  4 Jul 2023 16:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8C9C433C7;
 Tue,  4 Jul 2023 16:28:39 +0000 (UTC)
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
X-Inumbo-ID: d79cc4da-1a87-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688488122;
	bh=ZbfFFniWhSahnp7jSJ3oIaV9POCcbiLvynkhKSgpXe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYhrvsNpwqCJwn41eekT5X8PaPVwBQ6ub8Netmz5zCPt/qzVPnkLxH2Kjiq9nv1Cm
	 yUeZjhUrBrMq2ThgKqf6VqdUdYp1P2/zpT5yvYD7siJiybpmyKwoPpaa5gXpr6CMMv
	 akxinQnPPwXHrxodKNqiTb/6JTMYG4lY9mmxI0dhS9y7wawVJYcWdRHa64BuE/8weJ
	 eX7co1v82fmGWp5kKAm9BaeWX8/tRjFqKX1EDWvGtKd5aZ5LCCXaAY86lmuE5eezEu
	 Ix6OVXIAm9Wp1Cia2H4ClFO9rKC6nhjukt+dwjQnGXu6F26u0+VUNsprhPIs/s+nRo
	 qHwq5/jxHTM8Q==
Date: Tue, 4 Jul 2023 10:28:36 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <ZKRItBRhm8f5Vba/@kbusch-mbp>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704122224.16257-1-jack@suse.cz>

On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> +		void *holder, const struct blk_holder_ops *hops)
> +{
> +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> +					     GFP_KERNEL);

I believe 'sizeof(*handle)' is the preferred style.

> +	struct block_device *bdev;
> +
> +	if (!handle)
> +		return ERR_PTR(-ENOMEM);
> +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> +	if (IS_ERR(bdev))
> +		return ERR_CAST(bdev);

Need a 'kfree(handle)' before the error return. Or would it be simpler
to get the bdev first so you can check the mode settings against a
read-only bdev prior to the kmalloc?

> +	handle->bdev = bdev;
> +	handle->holder = holder;
> +	return handle;
> +}
> +EXPORT_SYMBOL(blkdev_get_handle_by_dev);
> +
>  /**
>   * blkdev_get_by_path - open a block device by name
>   * @path: path to the block device to open
> @@ -884,6 +902,28 @@ struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
>  }
>  EXPORT_SYMBOL(blkdev_get_by_path);
>  
> +struct bdev_handle *blkdev_get_handle_by_path(const char *path, blk_mode_t mode,
> +		void *holder, const struct blk_holder_ops *hops)
> +{
> +	struct bdev_handle *handle;
> +	dev_t dev;
> +	int error;
> +
> +	error = lookup_bdev(path, &dev);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	handle = blkdev_get_handle_by_dev(dev, mode, holder, hops);
> +	if (!IS_ERR(handle) && (mode & BLK_OPEN_WRITE) &&
> +	    bdev_read_only(handle->bdev)) {
> +		blkdev_handle_put(handle);
> +		return ERR_PTR(-EACCES);
> +	}
> +
> +	return handle;
> +}
> +EXPORT_SYMBOL(blkdev_get_handle_by_path);

