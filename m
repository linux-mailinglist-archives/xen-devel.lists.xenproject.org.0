Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EC7F8BB7
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 15:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641138.999950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6tiU-0000bx-Ol; Sat, 25 Nov 2023 14:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641138.999950; Sat, 25 Nov 2023 14:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6tiU-0000a0-M0; Sat, 25 Nov 2023 14:33:06 +0000
Received: by outflank-mailman (input) for mailman id 641138;
 Sat, 25 Nov 2023 14:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKti=HG=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1r6tiS-0000Zu-Lx
 for xen-devel@lists.xenproject.org; Sat, 25 Nov 2023 14:33:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b2da80-8b9f-11ee-98e2-6d05b1d4d9a1;
 Sat, 25 Nov 2023 15:33:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD2BD60C23;
 Sat, 25 Nov 2023 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF1EC433C9;
 Sat, 25 Nov 2023 14:32:57 +0000 (UTC)
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
X-Inumbo-ID: 88b2da80-8b9f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700922779;
	bh=oSd7BcOK3bP0I8DfntCNNyxB1mRx7mQJk5aYCZ56Jps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb+b1AGjl66gEFJb49YPJaFeRIASRiFOTSxrZYFb/9UEMzhBhJ7dj03XjtnQqURkF
	 TfRgGHRdUiAjOE44N/FKpf7JzCF5V8n47LggUk8mYZ6WAEYe+BIWeDP2a/vA3Woy4L
	 +jv6Fe3Kj+6ny2tml8PShu+0hReicMnk89ZJEMIM=
Date: Sat, 25 Nov 2023 14:32:55 +0000
From: Greg KH <gregkh@linuxfoundation.org>
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
	dlemoal@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next] block: remove field 'bd_inode' from block_device
Message-ID: <2023112544-subpanel-national-58e5@gregkh>
References: <20231125093912.141486-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125093912.141486-1-yukuai1@huaweicloud.com>

On Sat, Nov 25, 2023 at 05:39:12PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> block_devcie is allocated from bdev_alloc() by bdev_alloc_inode(), and
> currently block_device contains a pointer that point to the address of
> inode, while such inode is allocated together:
> 
> bdev_alloc
>  inode = new_inode()
>   // inode is &bdev_inode->vfs_inode
>  bdev = I_BDEV(inode)
>   // bdev is &bdev_inode->bdev
>  bdev->inode = inode
> 
> Add a new helper to get address of inode from bdev by add operation
> instead of memory access, which is more efficiency. Also prepare to
> add a new field 'bd_flags' in the first cacheline(64 bytes).
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  block/bdev.c                       | 39 +++++++++++++++++-------------
>  block/blk-zoned.c                  |  4 +--
>  block/fops.c                       |  4 +--
>  block/genhd.c                      |  8 +++---
>  block/ioctl.c                      |  8 +++---
>  block/partitions/core.c            |  9 ++++---
>  drivers/block/xen-blkback/xenbus.c |  2 +-
>  drivers/md/bcache/super.c          |  2 +-
>  drivers/mtd/devices/block2mtd.c    | 12 ++++-----
>  drivers/s390/block/dasd_ioctl.c    |  2 +-
>  drivers/scsi/scsicam.c             |  2 +-
>  fs/bcachefs/util.h                 |  2 +-
>  fs/btrfs/disk-io.c                 |  6 ++---
>  fs/btrfs/volumes.c                 |  4 +--
>  fs/btrfs/zoned.c                   |  2 +-
>  fs/buffer.c                        |  8 +++---
>  fs/cramfs/inode.c                  |  2 +-
>  fs/erofs/data.c                    |  2 +-
>  fs/ext4/dir.c                      |  2 +-
>  fs/ext4/ext4_jbd2.c                |  2 +-
>  fs/ext4/super.c                    |  8 +++---
>  fs/gfs2/glock.c                    |  2 +-
>  fs/gfs2/ops_fstype.c               |  2 +-
>  fs/jbd2/journal.c                  |  3 ++-
>  fs/jbd2/recovery.c                 |  2 +-
>  fs/nilfs2/segment.c                |  2 +-
>  include/linux/blk_types.h          | 10 ++++++--
>  include/linux/blkdev.h             |  4 +--
>  include/linux/buffer_head.h        |  4 +--
>  29 files changed, 86 insertions(+), 73 deletions(-)

You should do this as a patch series, add the helper function that does
nothing, convert all the different portions of the kernel as different
patches, and _then_ change the implementation of the block layer to
handle the change in the structure.

Otherwise this is going to be hard to get accepted.

Also, one note:

> @@ -85,6 +84,13 @@ struct block_device {
>  #define bdev_kobj(_bdev) \
>  	(&((_bdev)->bd_device.kobj))
>  
> +static inline struct inode *bdev_inode(struct block_device *bdev)
> +{
> +	void *inode = bdev + 1;

That's crazy, if something changes, this will keep working yet the
kernel will break and no one will know why.

Please use container_of(), that's what it is there for, this exact type
of thing.  Or if not, are you just assuming that the memory location
right after bdev is the inode?  That's a tough assumption, how are you
going to assure it really stays there?

thanks,

greg k-h

