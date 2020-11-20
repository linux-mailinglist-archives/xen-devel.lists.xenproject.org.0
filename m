Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26D2BA2FE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31582.62074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0kA-0001V7-QL; Fri, 20 Nov 2020 07:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31582.62074; Fri, 20 Nov 2020 07:22:06 +0000
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
	id 1kg0kA-0001Ui-NH; Fri, 20 Nov 2020 07:22:06 +0000
Received: by outflank-mailman (input) for mailman id 31582;
 Fri, 20 Nov 2020 07:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0k9-0001Ub-EK
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:22:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff627d50-ace3-42d3-b47d-6face4669ae3;
 Fri, 20 Nov 2020 07:22:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91CBDAE76;
 Fri, 20 Nov 2020 07:22:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0k9-0001Ub-EK
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:22:05 +0000
X-Inumbo-ID: ff627d50-ace3-42d3-b47d-6face4669ae3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ff627d50-ace3-42d3-b47d-6face4669ae3;
	Fri, 20 Nov 2020 07:22:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91CBDAE76;
	Fri, 20 Nov 2020 07:22:02 +0000 (UTC)
Subject: Re: [PATCH 33/78] block: remove __blkdev_driver_ioctl
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
 <20201116145809.410558-34-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <82dee133-3696-7fb5-efb5-d0a4122846db@suse.de>
Date: Fri, 20 Nov 2020 08:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-34-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Just open code it in the few callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/ioctl.c               | 25 +++++--------------------
>   drivers/block/pktcdvd.c     |  6 ++++--
>   drivers/md/bcache/request.c |  5 +++--
>   drivers/md/dm.c             |  5 ++++-
>   include/linux/blkdev.h      |  2 --
>   5 files changed, 16 insertions(+), 27 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

