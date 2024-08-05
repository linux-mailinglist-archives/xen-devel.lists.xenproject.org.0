Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB19474BB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 07:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771754.1182195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saqTz-0000Pk-8J; Mon, 05 Aug 2024 05:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771754.1182195; Mon, 05 Aug 2024 05:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saqTz-0000Nc-5H; Mon, 05 Aug 2024 05:42:11 +0000
Received: by outflank-mailman (input) for mailman id 771754;
 Mon, 05 Aug 2024 05:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvKm=PE=iweiny-mobl=iweiny@srs-se1.protection.inumbo.net>)
 id 1saqMn-0007Wz-7s
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 05:34:45 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68035286-52ec-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 07:34:40 +0200 (CEST)
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 22:34:36 -0700
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.125.110.189])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 22:34:33 -0700
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
X-Inumbo-ID: 68035286-52ec-11ef-8776-851b0ebba9a2
X-CSE-ConnectionGUID: z2/LkfXyRJ+bV+h2cJd8zA==
X-CSE-MsgGUID: hFnhIHTYQbi3ZRDos5dOCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20731495"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20731495"
X-CSE-ConnectionGUID: 1NXb37qGSpirdIrbQu6z0A==
X-CSE-MsgGUID: VDS3b8awRmeD430ULxE1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="56135504"
Date: Mon, 5 Aug 2024 00:34:31 -0500
From: Ira Weiny <iweiny@iweiny-mobl>
To: Christoph Hellwig <hch@lst.de>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>, ira.weiny@intel.com
Subject: Re: [PATCH 20/26] block: move the dax flag to queue_limits
Message-ID: <ZrBkFKs5i9P_Wbxr@iweiny-mobl>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-21-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-21-hch@lst.de>

On Mon, Jun 17, 2024 at 08:04:47AM +0200, Christoph Hellwig wrote:
> Move the dax flag into the queue_limits feature field so that it can be
> set atomically with the queue frozen.

I've only just bisected this issue.  So I'm not at all sure what is going on.

What I do know is that the ndctl dax-ext4.sh and dax-xfs.sh tests are failing
in 6.11.  I bisected to this patch.  A revert fixes ext4 but not xfs.

I plan to continue looking into it in the morning.

Alison, Dave, AFAICS this is not related to the panics you are seeing in other
tests.

Ira

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  block/blk-mq-debugfs.c       | 1 -
>  drivers/md/dm-table.c        | 4 ++--
>  drivers/nvdimm/pmem.c        | 7 ++-----
>  drivers/s390/block/dcssblk.c | 2 +-
>  include/linux/blkdev.h       | 6 ++++--
>  5 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
> index 62b132e9a9ce3b..f4fa820251ce83 100644
> --- a/block/blk-mq-debugfs.c
> +++ b/block/blk-mq-debugfs.c
> @@ -88,7 +88,6 @@ static const char *const blk_queue_flag_name[] = {
>  	QUEUE_FLAG_NAME(SAME_FORCE),
>  	QUEUE_FLAG_NAME(INIT_DONE),
>  	QUEUE_FLAG_NAME(POLL),
> -	QUEUE_FLAG_NAME(DAX),
>  	QUEUE_FLAG_NAME(STATS),
>  	QUEUE_FLAG_NAME(REGISTERED),
>  	QUEUE_FLAG_NAME(QUIESCED),
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 84d636712c7284..e44697037e86f4 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -1834,11 +1834,11 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>  		limits->features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
>  
>  	if (dm_table_supports_dax(t, device_not_dax_capable)) {
> -		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
> +		limits->features |= BLK_FEAT_DAX;
>  		if (dm_table_supports_dax(t, device_not_dax_synchronous_capable))
>  			set_dax_synchronous(t->md->dax_dev);
>  	} else
> -		blk_queue_flag_clear(QUEUE_FLAG_DAX, q);
> +		limits->features &= ~BLK_FEAT_DAX;
>  
>  	if (dm_table_any_dev_attr(t, device_dax_write_cache_enabled, NULL))
>  		dax_write_cache(t->md->dax_dev, true);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index b821dcf018f6ae..1dd74c969d5a09 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -465,7 +465,6 @@ static int pmem_attach_disk(struct device *dev,
>  	struct dax_device *dax_dev;
>  	struct nd_pfn_sb *pfn_sb;
>  	struct pmem_device *pmem;
> -	struct request_queue *q;
>  	struct gendisk *disk;
>  	void *addr;
>  	int rc;
> @@ -499,6 +498,8 @@ static int pmem_attach_disk(struct device *dev,
>  	}
>  	if (fua)
>  		lim.features |= BLK_FEAT_FUA;
> +	if (is_nd_pfn(dev))
> +		lim.features |= BLK_FEAT_DAX;
>  
>  	if (!devm_request_mem_region(dev, res->start, resource_size(res),
>  				dev_name(&ndns->dev))) {
> @@ -509,7 +510,6 @@ static int pmem_attach_disk(struct device *dev,
>  	disk = blk_alloc_disk(&lim, nid);
>  	if (IS_ERR(disk))
>  		return PTR_ERR(disk);
> -	q = disk->queue;
>  
>  	pmem->disk = disk;
>  	pmem->pgmap.owner = pmem;
> @@ -547,9 +547,6 @@ static int pmem_attach_disk(struct device *dev,
>  	}
>  	pmem->virt_addr = addr;
>  
> -	if (pmem->pfn_flags & PFN_MAP)
> -		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
> -
>  	disk->fops		= &pmem_fops;
>  	disk->private_data	= pmem;
>  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
> diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> index 6d1689a2717e5f..d5a5d11ae0dcdf 100644
> --- a/drivers/s390/block/dcssblk.c
> +++ b/drivers/s390/block/dcssblk.c
> @@ -548,6 +548,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
>  {
>  	struct queue_limits lim = {
>  		.logical_block_size	= 4096,
> +		.features		= BLK_FEAT_DAX,
>  	};
>  	int rc, i, j, num_of_segments;
>  	struct dcssblk_dev_info *dev_info;
> @@ -643,7 +644,6 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
>  	dev_info->gd->fops = &dcssblk_devops;
>  	dev_info->gd->private_data = dev_info;
>  	dev_info->gd->flags |= GENHD_FL_NO_PART;
> -	blk_queue_flag_set(QUEUE_FLAG_DAX, dev_info->gd->queue);
>  
>  	seg_byte_size = (dev_info->end - dev_info->start + 1);
>  	set_capacity(dev_info->gd, seg_byte_size >> 9); // size in sectors
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index f3d4519d609d95..7022e06a3dd9a3 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -307,6 +307,9 @@ enum {
>  
>  	/* supports REQ_NOWAIT */
>  	BLK_FEAT_NOWAIT				= (1u << 7),
> +
> +	/* supports DAX */
> +	BLK_FEAT_DAX				= (1u << 8),
>  };
>  
>  /*
> @@ -575,7 +578,6 @@ struct request_queue {
>  #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
>  #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
>  #define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
> -#define QUEUE_FLAG_DAX		19	/* device supports DAX */
>  #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
>  #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
>  #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
> @@ -602,7 +604,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
>  #define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
>  #define blk_queue_zone_resetall(q)	\
>  	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
> -#define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
> +#define blk_queue_dax(q)	((q)->limits.features & BLK_FEAT_DAX)
>  #define blk_queue_pci_p2pdma(q)	\
>  	test_bit(QUEUE_FLAG_PCI_P2PDMA, &(q)->queue_flags)
>  #ifdef CONFIG_BLK_RQ_ALLOC_TIME
> -- 
> 2.43.0
> 

