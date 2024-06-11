Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E619033A7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737936.1144455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvxx-0002Z3-KT; Tue, 11 Jun 2024 07:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737936.1144455; Tue, 11 Jun 2024 07:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvxx-0002Vz-HM; Tue, 11 Jun 2024 07:30:49 +0000
Received: by outflank-mailman (input) for mailman id 737936;
 Tue, 11 Jun 2024 07:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGvxw-0002Vt-K7
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:30:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b4d173-27c4-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 09:30:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E9A560D2B;
 Tue, 11 Jun 2024 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC6CC2BD10;
 Tue, 11 Jun 2024 07:30:40 +0000 (UTC)
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
X-Inumbo-ID: 84b4d173-27c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091045;
	bh=mXwlDhzGw5x2p2Nr8gAFPISP2nDIAfZIJOaFJyvJXOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VCI1eDgXTsePnpt155uEye/3wYDicIPNZJ3+S2Hq2BKZNkLNvV5I0fT+JdCzdUnSb
	 yuXJ7xiSHP9TiSA6PVPXt+qO9Dn4e1NQaWtG0WZKRDKr7qk2obBVABl9+DPiAto15R
	 ZY06Qeaqugg7VSWPCcJ0qkt9/u4FV8hF/W3PG2hU6Xg27Ev50hNdLuTn4EcUBYyJ8n
	 S+KRGHhRfCxLhpogZoDRTutfmrs5hXd1HvW8FhrlCCZSHQ5haYJkZbrzON8/BzrfEH
	 kcYMtKu/xYq8uguhHsXhgHJwfT/OivpjDtyI/mVqW6dF9WSlmB2m2KaCIH1Th4AQTt
	 8udJurnL3fqPA==
Message-ID: <fdfc024a-368a-4495-8b85-b5ab7741f6d4@kernel.org>
Date: Tue, 11 Jun 2024 16:30:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when they
 fail
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
 <20240611051929.513387-11-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> blkfront always had a robust negotiation protocol for detecting a write
> cache.  Stop simply disabling cache flushes when they fail as that is
> a grave error.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me but maybe mention that removal of xlvbd_flush() as well ?
And it feels like the "stop disabling cache flushes when they fail" part should
be a fix patch sent separately...

Anyway, for both parts, feel free to add:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/block/xen-blkfront.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 9b4ec3e4908cce..9794ac2d3299d1 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -982,18 +982,6 @@ static const char *flush_info(struct blkfront_info *info)
>  		return "barrier or flush: disabled;";
>  }
>  
> -static void xlvbd_flush(struct blkfront_info *info)
> -{
> -	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> -			      info->feature_fua ? true : false);
> -	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> -		info->gd->disk_name, flush_info(info),
> -		"persistent grants:", info->feature_persistent ?
> -		"enabled;" : "disabled;", "indirect descriptors:",
> -		info->max_indirect_segments ? "enabled;" : "disabled;",
> -		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
> -}
> -
>  static int xen_translate_vdev(int vdevice, int *minor, unsigned int *offset)
>  {
>  	int major;
> @@ -1162,7 +1150,15 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
>  	info->sector_size = sector_size;
>  	info->physical_sector_size = physical_sector_size;
>  
> -	xlvbd_flush(info);
> +	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> +			      info->feature_fua ? true : false);
> +
> +	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> +		info->gd->disk_name, flush_info(info),
> +		"persistent grants:", info->feature_persistent ?
> +		"enabled;" : "disabled;", "indirect descriptors:",
> +		info->max_indirect_segments ? "enabled;" : "disabled;",
> +		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
>  
>  	if (info->vdisk_info & VDISK_READONLY)
>  		set_disk_ro(gd, 1);
> @@ -1622,13 +1618,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
> -			if (unlikely(blkif_req(req)->error)) {
> -				if (blkif_req(req)->error == BLK_STS_NOTSUPP)
> -					blkif_req(req)->error = BLK_STS_OK;
> -				info->feature_fua = 0;
> -				info->feature_flush = 0;
> -				xlvbd_flush(info);
> -			}
>  			fallthrough;
>  		case BLKIF_OP_READ:
>  		case BLKIF_OP_WRITE:

-- 
Damien Le Moal
Western Digital Research


