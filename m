Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C758D2BA40E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31697.62308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg1JF-00078p-IW; Fri, 20 Nov 2020 07:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31697.62308; Fri, 20 Nov 2020 07:58:21 +0000
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
	id 1kg1JF-00078T-FD; Fri, 20 Nov 2020 07:58:21 +0000
Received: by outflank-mailman (input) for mailman id 31697;
 Fri, 20 Nov 2020 07:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg1JE-00078O-0z
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:58:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f405a87-d001-498f-899d-ca4c10e93eb1;
 Fri, 20 Nov 2020 07:58:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75B07AC0C;
 Fri, 20 Nov 2020 07:58:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg1JE-00078O-0z
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:58:20 +0000
X-Inumbo-ID: 0f405a87-d001-498f-899d-ca4c10e93eb1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f405a87-d001-498f-899d-ca4c10e93eb1;
	Fri, 20 Nov 2020 07:58:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 75B07AC0C;
	Fri, 20 Nov 2020 07:58:17 +0000 (UTC)
Subject: Re: [PATCH 70/78] block: replace bd_mutex with a per-gendisk mutex
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
 <20201116145809.410558-71-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c854459e-d124-d0fd-2159-d40ef4d6ca75@suse.de>
Date: Fri, 20 Nov 2020 08:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-71-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:58 PM, Christoph Hellwig wrote:
> bd_mutex is primarily used for synchronizing the block device open and
> release path, which recurses from partitions to the whole disk device.
> The fact that we have two locks makes life unnecessarily complex due
> to lock order constrains.  Replace the two levels of locking with a
> single mutex in the gendisk structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/genhd.c                   |  7 ++--
>   block/ioctl.c                   |  4 +-
>   block/partitions/core.c         | 22 +++++-----
>   drivers/block/loop.c            | 14 +++----
>   drivers/block/xen-blkfront.c    |  8 ++--
>   drivers/block/zram/zram_drv.c   |  4 +-
>   drivers/block/zram/zram_drv.h   |  2 +-
>   drivers/md/md.h                 |  7 +---
>   drivers/s390/block/dasd_genhd.c |  8 ++--
>   drivers/scsi/sd.c               |  4 +-
>   fs/block_dev.c                  | 71 +++++++++++++++++----------------
>   fs/btrfs/volumes.c              |  2 +-
>   fs/super.c                      |  8 ++--
>   include/linux/blk_types.h       |  1 -
>   include/linux/genhd.h           |  1 +
>   15 files changed, 80 insertions(+), 83 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

