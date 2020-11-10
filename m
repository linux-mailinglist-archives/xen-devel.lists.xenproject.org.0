Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2262AD031
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 08:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23034.49583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcNdq-0007t7-5s; Tue, 10 Nov 2020 07:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23034.49583; Tue, 10 Nov 2020 07:00:34 +0000
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
	id 1kcNdq-0007sm-2l; Tue, 10 Nov 2020 07:00:34 +0000
Received: by outflank-mailman (input) for mailman id 23034;
 Tue, 10 Nov 2020 07:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O/Cu=EQ=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kcNdo-0007sh-Do
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 07:00:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79a9254e-10c7-4ff6-91e6-5324dba2946c;
 Tue, 10 Nov 2020 07:00:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4ADE6ABCC;
 Tue, 10 Nov 2020 07:00:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=O/Cu=EQ=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kcNdo-0007sh-Do
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 07:00:32 +0000
X-Inumbo-ID: 79a9254e-10c7-4ff6-91e6-5324dba2946c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79a9254e-10c7-4ff6-91e6-5324dba2946c;
	Tue, 10 Nov 2020 07:00:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4ADE6ABCC;
	Tue, 10 Nov 2020 07:00:29 +0000 (UTC)
Subject: Re: [PATCH 03/24] nvme: let set_capacity_revalidate_and_notify update
 the bdev size
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
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
 <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
 <d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c883475d-c154-a123-521e-4723b87534cd@suse.de>
Date: Tue, 10 Nov 2020 08:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/10/20 12:28 AM, Sagi Grimberg wrote:
> 
>> [ .. ]
>>>> Originally nvme multipath would update/change the size of the multipath
>>>> device according to the underlying path devices.
>>>> With this patch the size of the multipath device will _not_ change 
>>>> if there
>>>> is a change on the underlying devices.
>>>
>>> Yes, it will.  Take a close look at nvme_update_disk_info and how it is
>>> called.
>>>
>> Okay, then: What would be the correct way of handling a size update 
>> for NVMe multipath?
>> Assuming we're getting an AEN for each path signalling the size change
>> (or a controller reset leading to a size change).
>> So if we're updating the size of the multipath device together with 
>> the path device at the first AEN/reset we'll end up with the other 
>> paths having a different size than the multipath device (and the path 
>> we've just been updating).
>> - Do we care, or cross fingers and hope for the best?
>> - Shouldn't we detect the case where we won't get a size update for 
>> the other paths, or, indeed, we have a genuine device size mismatch 
>> due to a misconfiguration on the target?
>>
>> IE shouldn't we have a flag 'size update pending' for the other 
>> paths,, to take them out ouf use temporarily until the other 
>> AENs/resets have been processed?
> 
> the mpath device will take the minimum size from all the paths, that is
> what blk_stack_limits does. When the AEN for all the paths will arrive
> the mpath size will update.
> 
But that's precisely my point; there won't be an AEN for _all_ paths, 
but rather one AEN per path. Which will be processed separately, leading 
to the issue described above.

> Not sure how this is different than what we have today...

Oh, that is a problem even today.
So we should probably move it to a different thread...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

