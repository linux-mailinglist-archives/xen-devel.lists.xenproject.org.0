Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A92AF1A5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24753.52169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpqn-0008RN-Rm; Wed, 11 Nov 2020 13:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24753.52169; Wed, 11 Nov 2020 13:07:49 +0000
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
	id 1kcpqn-0008Qv-NM; Wed, 11 Nov 2020 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 24753;
 Wed, 11 Nov 2020 13:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Mnv=ER=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kcpqm-0008Qb-AA
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31516a66-d3e2-4728-b3eb-5226600d9b37;
 Wed, 11 Nov 2020 13:07:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E19FAD45;
 Wed, 11 Nov 2020 13:07:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8Mnv=ER=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kcpqm-0008Qb-AA
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:48 +0000
X-Inumbo-ID: 31516a66-d3e2-4728-b3eb-5226600d9b37
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 31516a66-d3e2-4728-b3eb-5226600d9b37;
	Wed, 11 Nov 2020 13:07:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5E19FAD45;
	Wed, 11 Nov 2020 13:07:46 +0000 (UTC)
Subject: Re: [PATCH 05/24] block: remove the update_bdev parameter from
 set_capacity_revalidate_and_notify
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
References: <20201111082658.3401686-1-hch@lst.de>
 <20201111082658.3401686-6-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a8416510-e3ca-a43f-a3e6-23fb1c20c34f@suse.de>
Date: Wed, 11 Nov 2020 14:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111082658.3401686-6-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/11/20 9:26 AM, Christoph Hellwig wrote:
> The update_bdev argument is always set to true, so remove it.  Also
> rename the function to the slighly less verbose set_capacity_and_notify,
> as propagating the disk size to the block device isn't really
> revalidation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/genhd.c                | 13 +++++--------
>   drivers/block/loop.c         | 11 +++++------
>   drivers/block/virtio_blk.c   |  2 +-
>   drivers/block/xen-blkfront.c |  2 +-
>   drivers/nvme/host/core.c     |  2 +-
>   drivers/scsi/sd.c            |  5 ++---
>   include/linux/genhd.h        |  3 +--
>   7 files changed, 16 insertions(+), 22 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

