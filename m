Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D72BA54D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 09:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31774.62443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Fi-00074g-5Y; Fri, 20 Nov 2020 08:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31774.62443; Fri, 20 Nov 2020 08:58:46 +0000
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
	id 1kg2Fi-00074J-2U; Fri, 20 Nov 2020 08:58:46 +0000
Received: by outflank-mailman (input) for mailman id 31774;
 Fri, 20 Nov 2020 08:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg2Fg-00074E-5q
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:58:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7404143-8c2d-4004-96c9-386086a4fdcc;
 Fri, 20 Nov 2020 08:58:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CAD1AC23;
 Fri, 20 Nov 2020 08:58:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg2Fg-00074E-5q
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:58:44 +0000
X-Inumbo-ID: d7404143-8c2d-4004-96c9-386086a4fdcc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7404143-8c2d-4004-96c9-386086a4fdcc;
	Fri, 20 Nov 2020 08:58:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CAD1AC23;
	Fri, 20 Nov 2020 08:58:42 +0000 (UTC)
Subject: Re: [PATCH 74/78] block: merge struct block_device and struct
 hd_struct
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
 <20201116145809.410558-75-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f6e6b948-44c8-50f0-beea-921eb3a268dd@suse.de>
Date: Fri, 20 Nov 2020 09:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-75-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:58 PM, Christoph Hellwig wrote:
> Instead of having two structures that represent each block device with
> different lift time rules merged them into a single one.  This also
> greatly simplifies the reference counting rules, as we can use the inode
> reference count as the main reference count for the new struct
> block_device, with the device model reference front ending it for device
> model interaction.  The percpu refcount in struct hd_struct is entirely
> gone given that struct block_device must be opened and thus valid for
> the duration of the I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/bio.c                        |   6 +-
>   block/blk-cgroup.c                 |   9 +-
>   block/blk-core.c                   |  85 +++++-----
>   block/blk-flush.c                  |   2 +-
>   block/blk-lib.c                    |   2 +-
>   block/blk-merge.c                  |   6 +-
>   block/blk-mq.c                     |  11 +-
>   block/blk-mq.h                     |   5 +-
>   block/blk.h                        |  38 ++---
>   block/genhd.c                      | 242 +++++++++++------------------
>   block/ioctl.c                      |   4 +-
>   block/partitions/core.c            | 221 +++++++-------------------
>   drivers/block/drbd/drbd_receiver.c |   2 +-
>   drivers/block/drbd/drbd_worker.c   |   2 +-
>   drivers/block/zram/zram_drv.c      |   2 +-
>   drivers/md/bcache/request.c        |   4 +-
>   drivers/md/dm.c                    |   8 +-
>   drivers/md/md.c                    |   4 +-
>   drivers/nvme/target/admin-cmd.c    |  20 +--
>   drivers/s390/block/dasd.c          |   8 +-
>   fs/block_dev.c                     |  68 +++-----
>   fs/ext4/super.c                    |  18 +--
>   fs/ext4/sysfs.c                    |  10 +-
>   fs/f2fs/checkpoint.c               |   5 +-
>   fs/f2fs/f2fs.h                     |   2 +-
>   fs/f2fs/super.c                    |   6 +-
>   fs/f2fs/sysfs.c                    |   9 --
>   include/linux/blk_types.h          |  23 ++-
>   include/linux/blkdev.h             |  13 +-
>   include/linux/genhd.h              |  67 ++------
>   include/linux/part_stat.h          |  17 +-
>   init/do_mounts.c                   |  20 +--
>   kernel/trace/blktrace.c            |  54 ++-----
>   33 files changed, 351 insertions(+), 642 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

