Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F484F830B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300901.513393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncU24-0007jM-PZ; Thu, 07 Apr 2022 15:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300901.513393; Thu, 07 Apr 2022 15:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncU24-0007hV-Md; Thu, 07 Apr 2022 15:26:48 +0000
Received: by outflank-mailman (input) for mailman id 300901;
 Thu, 07 Apr 2022 15:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4yZA=UR=suse.cz=dsterba@srs-se1.protection.inumbo.net>)
 id 1ncU22-0007h8-My
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:26:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22662023-b687-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:26:45 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7851C1F85E;
 Thu,  7 Apr 2022 15:26:45 +0000 (UTC)
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 5D6D3A3B9B;
 Thu,  7 Apr 2022 15:26:45 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 35565DA80E; Thu,  7 Apr 2022 17:22:43 +0200 (CEST)
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
X-Inumbo-ID: 22662023-b687-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649345205;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HY0WGnVyYhCp+LhKaKmQstubuC2NBeDsW4/sLmH6Z8c=;
	b=XoJXkAIgylqQHPJw/RxdnXZhZyl5PP42kkTd2vQs5Kg1qV6D3ZEimN/Ndmez2jDD02c8y/
	8Kt3GvifEuI3376MaNJ/2N1im2t4mIvENdAjGSrIrgJoXtExfV2shXkVVqkhj++pc+sxkE
	nCY7Te6kyLzniSfS/9ZPp+5ltDd/oy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649345205;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HY0WGnVyYhCp+LhKaKmQstubuC2NBeDsW4/sLmH6Z8c=;
	b=tIy2FgiTF5PZUTeuG9JADUiSC1+VAIkjbGxP/lEc71v2qsAsFxGTxeSFScU8FNeVlGcnPr
	Dj41KlwW0MN6N+Cg==
Date: Thu, 7 Apr 2022 17:22:43 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: Re: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
Message-ID: <20220407152243.GK15609@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-24-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Wed, Apr 06, 2022 at 08:05:12AM +0200, Christoph Hellwig wrote:
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-core.c                    |  2 +-
>  block/blk-lib.c                     |  2 +-
>  block/ioctl.c                       |  3 +--
>  drivers/block/drbd/drbd_main.c      |  2 +-
>  drivers/block/drbd/drbd_nl.c        | 12 +++++++-----
>  drivers/block/drbd/drbd_receiver.c  |  5 ++---
>  drivers/block/loop.c                |  9 +++------
>  drivers/block/rnbd/rnbd-srv-dev.h   |  6 +-----
>  drivers/block/xen-blkback/xenbus.c  |  2 +-
>  drivers/md/bcache/request.c         |  4 ++--
>  drivers/md/bcache/super.c           |  2 +-
>  drivers/md/bcache/sysfs.c           |  2 +-
>  drivers/md/dm-cache-target.c        |  9 +--------
>  drivers/md/dm-clone-target.c        |  9 +--------
>  drivers/md/dm-io.c                  |  2 +-
>  drivers/md/dm-log-writes.c          |  3 +--
>  drivers/md/dm-raid.c                |  9 ++-------
>  drivers/md/dm-table.c               |  4 +---
>  drivers/md/dm-thin.c                |  9 +--------
>  drivers/md/dm.c                     |  2 +-
>  drivers/md/md-linear.c              |  4 ++--
>  drivers/md/raid0.c                  |  2 +-
>  drivers/md/raid1.c                  |  6 +++---
>  drivers/md/raid10.c                 |  8 ++++----
>  drivers/md/raid5-cache.c            |  2 +-
>  drivers/target/target_core_device.c |  8 +++-----

For

>  fs/btrfs/extent-tree.c              |  4 ++--
>  fs/btrfs/ioctl.c                    |  2 +-

Acked-by: David Sterba <dsterba@suse.com>

