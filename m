Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECABE2C2819
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36107.67870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYSf-0003GK-30; Tue, 24 Nov 2020 13:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36107.67870; Tue, 24 Nov 2020 13:34:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYSe-0003Fv-W5; Tue, 24 Nov 2020 13:34:24 +0000
Received: by outflank-mailman (input) for mailman id 36107;
 Tue, 24 Nov 2020 13:34:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1khYSe-0003Fp-1D
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:34:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40281fb5-d1b4-4aff-8d04-fe3db5abd4e9;
 Tue, 24 Nov 2020 13:34:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61EB5AF33;
 Tue, 24 Nov 2020 13:34:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
	id 1khYSe-0003Fp-1D
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:34:24 +0000
X-Inumbo-ID: 40281fb5-d1b4-4aff-8d04-fe3db5abd4e9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 40281fb5-d1b4-4aff-8d04-fe3db5abd4e9;
	Tue, 24 Nov 2020 13:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 61EB5AF33;
	Tue, 24 Nov 2020 13:34:22 +0000 (UTC)
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct
 hd_struct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-31-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <044dd4ec-c64d-3c5d-cf54-a4ca665b8912@suse.de>
Date: Tue, 24 Nov 2020 21:34:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-31-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/24/20 9:27 PM, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additional the field in hd_struct did not use proper serializiation,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

For the bcache part, Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>  block/bio.c                        |  4 +-
>  block/blk-core.c                   |  2 +-
>  block/blk.h                        | 53 ----------------------
>  block/genhd.c                      | 55 +++++++++++-----------
>  block/partitions/core.c            | 17 ++++---
>  drivers/block/loop.c               |  1 -
>  drivers/block/nbd.c                |  2 +-
>  drivers/block/xen-blkback/common.h |  4 +-
>  drivers/md/bcache/super.c          |  2 +-
>  drivers/s390/block/dasd_ioctl.c    |  4 +-
>  drivers/target/target_core_pscsi.c |  7 +--
>  fs/block_dev.c                     | 73 +-----------------------------
>  fs/f2fs/super.c                    |  2 +-
>  fs/pstore/blk.c                    |  2 +-
>  include/linux/genhd.h              | 29 +++---------
>  kernel/trace/blktrace.c            |  2 +-
>  16 files changed, 60 insertions(+), 199 deletions(-)
> 
[snipped]

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index c55d3c58a7ef55..04fa40868fbe10 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1408,7 +1408,7 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  			q->limits.raid_partial_stripes_expensive;
>  
>  	ret = bcache_device_init(&dc->disk, block_size,
> -			 dc->bdev->bd_part->nr_sects - dc->sb.data_offset,
> +			 bdev_nr_sectors(dc->bdev) - dc->sb.data_offset,
>  			 dc->bdev, &bcache_cached_ops);
>  	if (ret)
>  		return ret;
[snipped]

