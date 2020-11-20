Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A82BA308
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31587.62086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0lM-0001fg-5G; Fri, 20 Nov 2020 07:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31587.62086; Fri, 20 Nov 2020 07:23:20 +0000
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
	id 1kg0lM-0001fH-1Y; Fri, 20 Nov 2020 07:23:20 +0000
Received: by outflank-mailman (input) for mailman id 31587;
 Fri, 20 Nov 2020 07:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0lK-0001fB-P8
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:23:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49602c85-020e-44fe-95a1-8d02b84c59a3;
 Fri, 20 Nov 2020 07:23:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDB7EAC0C;
 Fri, 20 Nov 2020 07:23:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0lK-0001fB-P8
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:23:18 +0000
X-Inumbo-ID: 49602c85-020e-44fe-95a1-8d02b84c59a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 49602c85-020e-44fe-95a1-8d02b84c59a3;
	Fri, 20 Nov 2020 07:23:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EDB7EAC0C;
	Fri, 20 Nov 2020 07:23:16 +0000 (UTC)
Subject: Re: [PATCH 34/78] block: propagate BLKROSET to all partitions
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
 <20201116145809.410558-35-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <11ea0b89-d8e6-2d5d-59e4-90e928d54042@suse.de>
Date: Fri, 20 Nov 2020 08:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-35-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> When setting the whole device read-only (or clearing the read-only
> state), also update the policy for all partitions.  The s390 dasd
> driver has awlways been doing this and it makes a lot of sense.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/ioctl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 6b785181344fe1..22f394d118c302 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -354,7 +354,10 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
>   		if (ret)
>   			return ret;
>   	}
> -	bdev->bd_part->policy = n;
> +	if (bdev_is_partition(bdev))
> +		bdev->bd_part->policy = n;
> +	else
> +		set_disk_ro(bdev->bd_disk, n);
>   	return 0;
>   }
>   
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

