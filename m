Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B152BA39A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31660.62236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg12n-0005BR-LA; Fri, 20 Nov 2020 07:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31660.62236; Fri, 20 Nov 2020 07:41:21 +0000
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
	id 1kg12n-0005B4-HY; Fri, 20 Nov 2020 07:41:21 +0000
Received: by outflank-mailman (input) for mailman id 31660;
 Fri, 20 Nov 2020 07:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg12m-0005Az-Lm
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:41:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2501d56c-f0d5-4d82-b740-f1b36ca9181c;
 Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C348AC23;
 Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg12m-0005Az-Lm
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:41:20 +0000
X-Inumbo-ID: 2501d56c-f0d5-4d82-b740-f1b36ca9181c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2501d56c-f0d5-4d82-b740-f1b36ca9181c;
	Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0C348AC23;
	Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
Subject: Re: [PATCH 64/78] dm: simplify flush_bio initialization in
 __send_empty_flush
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
 <20201116145809.410558-65-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <38ac9782-a563-b7ea-595a-124159fb755d@suse.de>
Date: Fri, 20 Nov 2020 08:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-65-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> We don't really need the struct block_device to initialize a bio.  So
> switch from using bio_set_dev to manually setting up bi_disk (bi_partno
> will always be zero and has been cleared by bio_init already).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/dm.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 54739f1b579bc8..6d7eb72d41f9ea 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1422,18 +1422,12 @@ static int __send_empty_flush(struct clone_info *ci)
>   	 */
>   	bio_init(&flush_bio, NULL, 0);
>   	flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
> +	flush_bio.bi_disk = ci->io->md->disk;
> +	bio_associate_blkg(&flush_bio);
> +
>   	ci->bio = &flush_bio;
>   	ci->sector_count = 0;
>   
> -	/*
> -	 * Empty flush uses a statically initialized bio, as the base for
> -	 * cloning.  However, blkg association requires that a bdev is
> -	 * associated with a gendisk, which doesn't happen until the bdev is
> -	 * opened.  So, blkg association is done at issue time of the flush
> -	 * rather than when the device is created in alloc_dev().
> -	 */
> -	bio_set_dev(ci->bio, ci->io->md->bdev);
> -
>   	BUG_ON(bio_has_data(ci->bio));
>   	while ((ti = dm_table_get_target(ci->map, target_nr++)))
>   		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
> 
Ah, thought as much. I've stumbled across this while debugging 
blk-interposer.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

