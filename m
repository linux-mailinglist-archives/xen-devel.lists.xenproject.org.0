Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65C228103
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 15:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxsNx-0006we-0M; Tue, 21 Jul 2020 13:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxsNv-0006wX-HW
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 13:32:43 +0000
X-Inumbo-ID: a781b036-cb56-11ea-851a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a781b036-cb56-11ea-851a-bc764e2007e4;
 Tue, 21 Jul 2020 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/oQMUvLsWaA3Azjhg0EuKclaN5GGnHC85kr1bPK/DM=; b=GMhIYrSNoGS3HeVAasn/mQT2r6
 0dmSZVxRsmPA3RoNRriDlwRArsH6XeBb8dH/Ycp9BQgomVZEYHSS96t2zVYan0TOQ3s7MK8sAB8zd
 wK9pBD+GTcRcpwMfBTyWZcJY+mqyNSvzsLFaQfI4Yf+ZMkGAL/8VlP0JSFuwpFV6xR4I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsNt-00076z-HO; Tue, 21 Jul 2020 13:32:41 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsNt-0001bW-4E; Tue, 21 Jul 2020 13:32:41 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
 <20200720102023.GH7191@Air-de-Roger>
 <alpine.DEB.2.21.2007201322060.32544@sstabellini-ThinkPad-T480s>
 <390f3a67-5ca5-d9bd-f13a-2c5920bad45a@xen.org>
 <20200721132503.GP7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <606db7cd-123a-f824-7eb3-689d74215f47@xen.org>
Date: Tue, 21 Jul 2020 14:32:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721132503.GP7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alex.bennee@linaro.org,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 21/07/2020 14:25, Roger Pau Monné wrote:
> On Tue, Jul 21, 2020 at 01:31:48PM +0100, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 20/07/2020 21:37, Stefano Stabellini wrote:
>>> On Mon, 20 Jul 2020, Roger Pau Monné wrote:
>>>> On Mon, Jul 20, 2020 at 10:40:40AM +0100, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 20/07/2020 10:17, Roger Pau Monné wrote:
>>>>>> On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
>>>>>>> On 17.07.20 18:00, Roger Pau Monné wrote:
>>>>>>>> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
>>>>>>>> Do you have any plans to try to upstream a modification to the VirtIO
>>>>>>>> spec so that grants (ie: abstract references to memory addresses) can
>>>>>>>> be used on the VirtIO ring?
>>>>>>>
>>>>>>> But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
>>>>>>> guest. Nothing to upsteam)
>>>>>>
>>>>>> OK, so there's no intention to add grants (or a similar interface) to
>>>>>> the spec?
>>>>>>
>>>>>> I understand that you want to support unmodified VirtIO frontends, but
>>>>>> I also think that long term frontends could negotiate with backends on
>>>>>> the usage of grants in the shared ring, like any other VirtIO feature
>>>>>> negotiated between the frontend and the backend.
>>>>>>
>>>>>> This of course needs to be on the spec first before we can start
>>>>>> implementing it, and hence my question whether a modification to the
>>>>>> spec in order to add grants has been considered.
>>>>> The problem is not really the specification but the adoption in the
>>>>> ecosystem. A protocol based on grant-tables would mostly only be used by Xen
>>>>> therefore:
>>>>>      - It may be difficult to convince a proprietary OS vendor to invest
>>>>> resource on implementing the protocol
>>>>>      - It would be more difficult to move in/out of Xen ecosystem.
>>>>>
>>>>> Both, may slow the adoption of Xen in some areas.
>>>>
>>>> Right, just to be clear my suggestion wasn't to force the usage of
>>>> grants, but whether adding something along this lines was in the
>>>> roadmap, see below.
>>>>
>>>>> If one is interested in security, then it would be better to work with the
>>>>> other interested parties. I think it would be possible to use a virtual
>>>>> IOMMU for this purpose.
>>>>
>>>> Yes, I've also heard rumors about using the (I assume VirtIO) IOMMU in
>>>> order to protect what backends can map. This seems like a fine idea,
>>>> and would allow us to gain the lost security without having to do the
>>>> whole work ourselves.
>>>>
>>>> Do you know if there's anything published about this? I'm curious
>>>> about how and where in the system the VirtIO IOMMU is/should be
>>>> implemented.
>>>
>>> Not yet (as far as I know), but we have just started some discussons on
>>> this topic within Linaro.
>>>
>>>
>>> You should also be aware that there is another proposal based on
>>> pre-shared-memory and memcpys to solve the virtio security issue:
>>>
>>> https://marc.info/?l=linux-kernel&m=158807398403549
>>>
>>> It would be certainly slower than the "virtio IOMMU" solution but it
>>> would take far less time to develop and could work as a short-term
>>> stop-gap.
>>
>> I don't think I agree with this blank statement. In the case of "virtio
>> IOMMU", you would need to potentially map/unmap pages every request which
>> would result to a lot of back and forth to the hypervisor.
>>
>> So it may turn out that pre-shared-memory may be faster on some setup.
> 
> AFAICT you could achieve the same with an IOMMU: pre-share (ie: add to
> the device IOMMU page tables) a bunch of pages and keep bouncing data
> to/from them in order to interact with the device, that way you could
> avoid the map and unmaps (and is effectively how persistent grants
> work in the blkif protocol).

Yes it is possible to do the same with the virtio IOMMU. I was more 
arguing on the statement that pre-shared-memory is going to be slower 
than the IOMMU case.

> 
> The thread referenced by Stefano seems to point out this shared memory
> model is targeted for very limited hypervisors that don't have the
> capacity to trap, decode and emulate accesses to memory?

Technically we are in the same case for Xen on Arm as we don't have the 
IOREQ support yet. But I think IOREQ is worthwhile as it would enable 
existing unmodified Linux with virtio driver to boot on Xen.

Cheers,

-- 
Julien Grall

