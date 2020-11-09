Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A92AB38D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22246.48513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc3Qb-0000RV-My; Mon, 09 Nov 2020 09:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22246.48513; Mon, 09 Nov 2020 09:25:33 +0000
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
	id 1kc3Qb-0000RD-Dj; Mon, 09 Nov 2020 09:25:33 +0000
Received: by outflank-mailman (input) for mailman id 22246;
 Mon, 09 Nov 2020 09:25:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UZOx=EP=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kc3QZ-0000R7-8Z
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:25:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b25ea218-31cd-4d33-84bf-09e3ba447283;
 Mon, 09 Nov 2020 09:25:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA23CABCC;
 Mon,  9 Nov 2020 09:25:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UZOx=EP=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kc3QZ-0000R7-8Z
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:25:31 +0000
X-Inumbo-ID: b25ea218-31cd-4d33-84bf-09e3ba447283
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b25ea218-31cd-4d33-84bf-09e3ba447283;
	Mon, 09 Nov 2020 09:25:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CA23CABCC;
	Mon,  9 Nov 2020 09:25:23 +0000 (UTC)
Subject: Re: [PATCH 03/24] nvme: let set_capacity_revalidate_and_notify update
 the bdev size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
 Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
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
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-4-hch@lst.de>
 <1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
 <20201109085340.GB27483@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
Date: Mon, 9 Nov 2020 10:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109085340.GB27483@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/9/20 9:53 AM, Christoph Hellwig wrote:
> On Mon, Nov 09, 2020 at 08:53:58AM +0100, Hannes Reinecke wrote:
>>> index 376096bfc54a83..4e86c9aafd88a7 100644
>>> --- a/drivers/nvme/host/core.c
>>> +++ b/drivers/nvme/host/core.c
>>> @@ -2053,7 +2053,7 @@ static void nvme_update_disk_info(struct gendisk *disk,
>>>    			capacity = 0;
[ .. ]
>> Originally nvme multipath would update/change the size of the multipath
>> device according to the underlying path devices.
>> With this patch the size of the multipath device will _not_ change if there
>> is a change on the underlying devices.
> 
> Yes, it will.  Take a close look at nvme_update_disk_info and how it is
> called.
> 
Okay, then: What would be the correct way of handling a size update for 
NVMe multipath?
Assuming we're getting an AEN for each path signalling the size change
(or a controller reset leading to a size change).
So if we're updating the size of the multipath device together with the 
path device at the first AEN/reset we'll end up with the other paths 
having a different size than the multipath device (and the path we've 
just been updating).
- Do we care, or cross fingers and hope for the best?
- Shouldn't we detect the case where we won't get a size update for the 
other paths, or, indeed, we have a genuine device size mismatch due to a 
misconfiguration on the target?

IE shouldn't we have a flag 'size update pending' for the other paths,, 
to take them out ouf use temporarily until the other AENs/resets have 
been processed?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

