Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B626D2BA3A7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31667.62248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg14U-0005Kx-6I; Fri, 20 Nov 2020 07:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31667.62248; Fri, 20 Nov 2020 07:43:06 +0000
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
	id 1kg14U-0005Kc-2q; Fri, 20 Nov 2020 07:43:06 +0000
Received: by outflank-mailman (input) for mailman id 31667;
 Fri, 20 Nov 2020 07:43:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg14S-0005KX-SY
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:43:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d04ed4f-ca80-4566-b552-2f29bd0a7521;
 Fri, 20 Nov 2020 07:43:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6A77AB3D;
 Fri, 20 Nov 2020 07:43:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg14S-0005KX-SY
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:43:04 +0000
X-Inumbo-ID: 4d04ed4f-ca80-4566-b552-2f29bd0a7521
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4d04ed4f-ca80-4566-b552-2f29bd0a7521;
	Fri, 20 Nov 2020 07:43:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6A77AB3D;
	Fri, 20 Nov 2020 07:43:02 +0000 (UTC)
Subject: Re: [PATCH 65/78] dm: remove the block_device reference in struct
 mapped_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-66-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <310bff8b-dbda-609a-a392-619733b86bd1@suse.de>
Date: Fri, 20 Nov 2020 08:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-66-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Get rid of the long-lasting struct block_device reference in
> struct mapped_device.  The only remaining user is the freeze code,
> where we can trivially look up the block device at freeze time
> and release the reference at thaw time.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/dm-core.h |  2 --
>   drivers/md/dm.c      | 22 +++++++++++-----------
>   2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> index d522093cb39dda..b1b400ed76fe90 100644
> --- a/drivers/md/dm-core.h
> +++ b/drivers/md/dm-core.h
> @@ -107,8 +107,6 @@ struct mapped_device {
>   	/* kobject and completion */
>   	struct dm_kobject_holder kobj_holder;
>   
> -	struct block_device *bdev;
> -
>   	struct dm_stats stats;
>   
>   	/* for blk-mq request-based DM support */
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 6d7eb72d41f9ea..c789ffea2badde 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1744,11 +1744,6 @@ static void cleanup_mapped_device(struct mapped_device *md)
>   
>   	cleanup_srcu_struct(&md->io_barrier);
>   
> -	if (md->bdev) {
> -		bdput(md->bdev);
> -		md->bdev = NULL;
> -	}
> -
>   	mutex_destroy(&md->suspend_lock);
>   	mutex_destroy(&md->type_lock);
>   	mutex_destroy(&md->table_devices_lock);
> @@ -1840,10 +1835,6 @@ static struct mapped_device *alloc_dev(int minor)
>   	if (!md->wq)
>   		goto bad;
>   
> -	md->bdev = bdget_disk(md->disk, 0);
> -	if (!md->bdev)
> -		goto bad;
> -
>   	dm_stats_init(&md->stats);
>   
>   	/* Populate the mapping, nobody knows we exist yet */
> @@ -2384,12 +2375,17 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
>    */
>   static int lock_fs(struct mapped_device *md)
>   {
> +	struct block_device *bdev;
>   	int r;
>   
>   	WARN_ON(md->frozen_sb);
>   
> -	md->frozen_sb = freeze_bdev(md->bdev);
> +	bdev = bdget_disk(md->disk, 0);
> +	if (!bdev)
> +		return -ENOMEM;
> +	md->frozen_sb = freeze_bdev(bdev);
>   	if (IS_ERR(md->frozen_sb)) {
> +		bdput(bdev);
>   		r = PTR_ERR(md->frozen_sb);
>   		md->frozen_sb = NULL;
>   		return r;
> @@ -2402,10 +2398,14 @@ static int lock_fs(struct mapped_device *md)
>   
>   static void unlock_fs(struct mapped_device *md)
>   {
> +	struct block_device *bdev;
> +
>   	if (!test_bit(DMF_FROZEN, &md->flags))
>   		return;
>   
> -	thaw_bdev(md->bdev, md->frozen_sb);
> +	bdev = md->frozen_sb->s_bdev;
> +	thaw_bdev(bdev, md->frozen_sb);
> +	bdput(bdev);
>   	md->frozen_sb = NULL;
>   	clear_bit(DMF_FROZEN, &md->flags);
>   }
> 
Yay. Just what I need for the blk-interposer code, where the ->bdev
pointer is really getting in the way.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

