Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9F903469
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737988.1144534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwLc-00038S-25; Tue, 11 Jun 2024 07:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737988.1144534; Tue, 11 Jun 2024 07:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwLb-000365-VU; Tue, 11 Jun 2024 07:55:15 +0000
Received: by outflank-mailman (input) for mailman id 737988;
 Tue, 11 Jun 2024 07:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGwLa-00035z-2S
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:55:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edff2b10-27c7-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 09:55:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1A1F60D2D;
 Tue, 11 Jun 2024 07:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA554C32789;
 Tue, 11 Jun 2024 07:55:05 +0000 (UTC)
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
X-Inumbo-ID: edff2b10-27c7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718092510;
	bh=KMSwFKEyi35uaRtii0t7lI/4MvH1eLdQhWL/35KPWTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IS1YYCI7UiDI5FXif6bcLeLXLCw0414L3MOXmusciXh7PaojbE/cgrfs+I8YCjyJJ
	 V0+j5AdfNNezODyfiopqQYbQWcBuIJ2lWiwcBrqOui7H8bgYLm4NNYizjvbLwlEqrP
	 O2g64hgllN2eL51XXDwSw43lH278hXsPf5y/ZZzX5hxgkSpC5QFW7kLRA5elZAYCsp
	 GnDfFNfx7wcoV8dBHEwNHJaRxFY4lLNmZ2w4G3IhNEOsULl1snsZfisN/xq8Pn2fzq
	 CD/V47DAq0TI3OBp5yS7Se4f0Y8iTK1ZkHv1i7mSOq4XYXg4eyabIba1vcFOH5GNOL
	 KLm9npjmJEeqA==
Message-ID: <d21b162a-1fd3-4fd1-a17f-f127f964bdf1@kernel.org>
Date: Tue, 11 Jun 2024 16:55:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] block: move cache control settings out of
 queue->flags
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-14-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the cache control settings into the queue_limits so that they
> can be set atomically and all I/O is frozen when changing the
> flags.

...so that they can be set atomically with the device queue frozen when
changing the flags.

may be better.

> 
> Add new features and flags field for the driver set flags, and internal
> (usually sysfs-controlled) flags in the block layer.  Note that we'll
> eventually remove enough field from queue_limits to bring it back to the
> previous size.
> 
> The disable flag is inverted compared to the previous meaning, which
> means it now survives a rescan, similar to the max_sectors and
> max_discard_sectors user limits.
> 
> The FLUSH and FUA flags are now inherited by blk_stack_limits, which
> simplified the code in dm a lot, but also causes a slight behavior
> change in that dm-switch and dm-unstripe now advertise a write cache
> despite setting num_flush_bios to 0.  The I/O path will handle this
> gracefully, but as far as I can tell the lack of num_flush_bios
> and thus flush support is a pre-existing data integrity bug in those
> targets that really needs fixing, after which a non-zero num_flush_bios
> should be required in dm for targets that map to underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../block/writeback_cache_control.rst         | 67 +++++++++++--------
>  arch/um/drivers/ubd_kern.c                    |  2 +-
>  block/blk-core.c                              |  2 +-
>  block/blk-flush.c                             |  9 ++-
>  block/blk-mq-debugfs.c                        |  2 -
>  block/blk-settings.c                          | 29 ++------
>  block/blk-sysfs.c                             | 29 +++++---
>  block/blk-wbt.c                               |  4 +-
>  drivers/block/drbd/drbd_main.c                |  2 +-
>  drivers/block/loop.c                          |  9 +--
>  drivers/block/nbd.c                           | 14 ++--
>  drivers/block/null_blk/main.c                 | 12 ++--
>  drivers/block/ps3disk.c                       |  7 +-
>  drivers/block/rnbd/rnbd-clt.c                 | 10 +--
>  drivers/block/ublk_drv.c                      |  8 ++-
>  drivers/block/virtio_blk.c                    | 20 ++++--
>  drivers/block/xen-blkfront.c                  |  9 ++-
>  drivers/md/bcache/super.c                     |  7 +-
>  drivers/md/dm-table.c                         | 39 +++--------
>  drivers/md/md.c                               |  8 ++-
>  drivers/mmc/core/block.c                      | 42 ++++++------
>  drivers/mmc/core/queue.c                      | 12 ++--
>  drivers/mmc/core/queue.h                      |  3 +-
>  drivers/mtd/mtd_blkdevs.c                     |  5 +-
>  drivers/nvdimm/pmem.c                         |  4 +-
>  drivers/nvme/host/core.c                      |  7 +-
>  drivers/nvme/host/multipath.c                 |  6 --
>  drivers/scsi/sd.c                             | 28 +++++---
>  include/linux/blkdev.h                        | 38 +++++++++--
>  29 files changed, 227 insertions(+), 207 deletions(-)
> 
> diff --git a/Documentation/block/writeback_cache_control.rst b/Documentation/block/writeback_cache_control.rst
> index b208488d0aae85..9cfe27f90253c7 100644
> --- a/Documentation/block/writeback_cache_control.rst
> +++ b/Documentation/block/writeback_cache_control.rst
> @@ -46,41 +46,50 @@ worry if the underlying devices need any explicit cache flushing and how
>  the Forced Unit Access is implemented.  The REQ_PREFLUSH and REQ_FUA flags
>  may both be set on a single bio.
>  
> +Feature settings for block drivers
> +----------------------------------
>  
> -Implementation details for bio based block drivers
> ---------------------------------------------------------------
> +For devices that do not support volatile write caches there is no driver
> +support required, the block layer completes empty REQ_PREFLUSH requests before
> +entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
> +requests that have a payload.
>  
> -These drivers will always see the REQ_PREFLUSH and REQ_FUA bits as they sit
> -directly below the submit_bio interface.  For remapping drivers the REQ_FUA
> -bits need to be propagated to underlying devices, and a global flush needs
> -to be implemented for bios with the REQ_PREFLUSH bit set.  For real device
> -drivers that do not have a volatile cache the REQ_PREFLUSH and REQ_FUA bits
> -on non-empty bios can simply be ignored, and REQ_PREFLUSH requests without
> -data can be completed successfully without doing any work.  Drivers for
> -devices with volatile caches need to implement the support for these
> -flags themselves without any help from the block layer.
> +For devices with volatile write caches the driver needs to tell the block layer
> +that it supports flushing caches by setting the
>  
> +   BLK_FEAT_WRITE_CACHE
>  
> -Implementation details for request_fn based block drivers
> ----------------------------------------------------------
> +flag in the queue_limits feature field.  For devices that also support the FUA
> +bit the block layer needs to be told to pass on the REQ_FUA bit by also setting
> +the
>  
> -For devices that do not support volatile write caches there is no driver
> -support required, the block layer completes empty REQ_PREFLUSH requests before
> -entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
> -requests that have a payload.  For devices with volatile write caches the
> -driver needs to tell the block layer that it supports flushing caches by
> -doing::
> +   BLK_FEAT_FUA
> +
> +flag in the features field of the queue_limits structure.
> +
> +Implementation details for bio based block drivers
> +--------------------------------------------------
> +
> +For bio based drivers the REQ_PREFLUSH and REQ_FUA bit are simplify passed on
> +to the driver if the drivers sets the BLK_FEAT_WRITE_CACHE flag and the drivers
> +needs to handle them.
> +
> +*NOTE*: The REQ_FUA bit also gets passed on when the BLK_FEAT_FUA flags is
> +_not_ set.  Any bio based driver that sets BLK_FEAT_WRITE_CACHE also needs to
> +handle REQ_FUA.
>  
> -	blk_queue_write_cache(sdkp->disk->queue, true, false);
> +For remapping drivers the REQ_FUA bits need to be propagated to underlying
> +devices, and a global flush needs to be implemented for bios with the
> +REQ_PREFLUSH bit set.
>  
> -and handle empty REQ_OP_FLUSH requests in its prep_fn/request_fn.  Note that
> -REQ_PREFLUSH requests with a payload are automatically turned into a sequence
> -of an empty REQ_OP_FLUSH request followed by the actual write by the block
> -layer.  For devices that also support the FUA bit the block layer needs
> -to be told to pass through the REQ_FUA bit using::
> +Implementation details for blk-mq drivers
> +-----------------------------------------
>  
> -	blk_queue_write_cache(sdkp->disk->queue, true, true);
> +When the BLK_FEAT_WRITE_CACHE flag is set, REQ_OP_WRITE | REQ_PREFLUSH requests
> +with a payload are automatically turned into a sequence of a REQ_OP_FLUSH
> +request followed by the actual write by the block layer.
>  
> -and the driver must handle write requests that have the REQ_FUA bit set
> -in prep_fn/request_fn.  If the FUA bit is not natively supported the block
> -layer turns it into an empty REQ_OP_FLUSH request after the actual write.
> +When the BLK_FEA_FUA flags is set, the REQ_FUA bit simplify passed on for the

s/BLK_FEA_FUA/BLK_FEAT_FUA

> +REQ_OP_WRITE request, else a REQ_OP_FLUSH request is sent by the block layer
> +after the completion of the write request for bio submissions with the REQ_FUA
> +bit set.
	
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 5c787965b7d09e..4f524c1d5e08bd 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -423,32 +423,41 @@ static ssize_t queue_io_timeout_store(struct request_queue *q, const char *page,
>  
>  static ssize_t queue_wc_show(struct request_queue *q, char *page)
>  {
> -	if (test_bit(QUEUE_FLAG_WC, &q->queue_flags))
> -		return sprintf(page, "write back\n");
> -
> -	return sprintf(page, "write through\n");
> +	if (q->limits.features & BLK_FLAGS_WRITE_CACHE_DISABLED)
> +		return sprintf(page, "write through\n");
> +	return sprintf(page, "write back\n");
>  }
>  
>  static ssize_t queue_wc_store(struct request_queue *q, const char *page,
>  			      size_t count)
>  {
> +	struct queue_limits lim;
> +	bool disable;
> +	int err;
> +
>  	if (!strncmp(page, "write back", 10)) {
> -		if (!test_bit(QUEUE_FLAG_HW_WC, &q->queue_flags))
> -			return -EINVAL;
> -		blk_queue_flag_set(QUEUE_FLAG_WC, q);
> +		disable = false;
>  	} else if (!strncmp(page, "write through", 13) ||
> -		 !strncmp(page, "none", 4)) {
> -		blk_queue_flag_clear(QUEUE_FLAG_WC, q);
> +		   !strncmp(page, "none", 4)) {
> +		disable = true;
>  	} else {
>  		return -EINVAL;
>  	}

I think you can drop the curly brackets for this chain of if-else-if-else.

>  
> +	lim = queue_limits_start_update(q);
> +	if (disable)
> +		lim.flags |= BLK_FLAGS_WRITE_CACHE_DISABLED;
> +	else
> +		lim.flags &= ~BLK_FLAGS_WRITE_CACHE_DISABLED;
> +	err = queue_limits_commit_update(q, &lim);
> +	if (err)
> +		return err;
>  	return count;
>  }


> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index fd789eeb62d943..fbe125d55e25b4 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -1686,34 +1686,16 @@ int dm_calculate_queue_limits(struct dm_table *t,
>  	return validate_hardware_logical_block_alignment(t, limits);
>  }
>  
> -static int device_flush_capable(struct dm_target *ti, struct dm_dev *dev,
> -				sector_t start, sector_t len, void *data)
> -{
> -	unsigned long flush = (unsigned long) data;
> -	struct request_queue *q = bdev_get_queue(dev->bdev);
> -
> -	return (q->queue_flags & flush);
> -}
> -
> -static bool dm_table_supports_flush(struct dm_table *t, unsigned long flush)
> +/*
> + * Check if an target requires flush support even if none of the underlying

s/an/a

> + * devices need it (e.g. to persist target-specific metadata).
> + */
> +static bool dm_table_supports_flush(struct dm_table *t)
>  {
> -	/*
> -	 * Require at least one underlying device to support flushes.
> -	 * t->devices includes internal dm devices such as mirror logs
> -	 * so we need to use iterate_devices here, which targets
> -	 * supporting flushes must provide.
> -	 */
>  	for (unsigned int i = 0; i < t->num_targets; i++) {
>  		struct dm_target *ti = dm_table_get_target(t, i);
>  
> -		if (!ti->num_flush_bios)
> -			continue;
> -
> -		if (ti->flush_supported)
> -			return true;
> -
> -		if (ti->type->iterate_devices &&
> -		    ti->type->iterate_devices(ti, device_flush_capable, (void *) flush))
> +		if (ti->num_flush_bios && ti->flush_supported)
>  			return true;
>  	}


> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index c792d4d81e5fcc..4e8931a2c76b07 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -282,6 +282,28 @@ static inline bool blk_op_is_passthrough(blk_opf_t op)
>  	return op == REQ_OP_DRV_IN || op == REQ_OP_DRV_OUT;
>  }
>  
> +/* flags set by the driver in queue_limits.features */
> +enum {
> +	/* supports a a volatile write cache */

Repeated "a".

> +	BLK_FEAT_WRITE_CACHE			= (1u << 0),
> +
> +	/* supports passing on the FUA bit */
> +	BLK_FEAT_FUA				= (1u << 1),
> +};


> +static inline bool blk_queue_write_cache(struct request_queue *q)
> +{
> +	return (q->limits.features & BLK_FEAT_WRITE_CACHE) &&
> +		(q->limits.flags & BLK_FLAGS_WRITE_CACHE_DISABLED);

Hmm, shouldn't this be !(q->limits.flags & BLK_FLAGS_WRITE_CACHE_DISABLED) ?

> +}
> +
>  static inline bool bdev_write_cache(struct block_device *bdev)
>  {
> -	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
> +	return blk_queue_write_cache(bdev_get_queue(bdev));
>  }
>  
>  static inline bool bdev_fua(struct block_device *bdev)
>  {
> -	return test_bit(QUEUE_FLAG_FUA, &bdev_get_queue(bdev)->queue_flags);
> +	return bdev_get_queue(bdev)->limits.features & BLK_FEAT_FUA;
>  }
>  
>  static inline bool bdev_nowait(struct block_device *bdev)

-- 
Damien Le Moal
Western Digital Research


