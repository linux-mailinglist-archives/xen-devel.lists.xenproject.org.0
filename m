Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742265FF312
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 19:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422970.669394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojOfv-0001pl-Ht; Fri, 14 Oct 2022 17:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422970.669394; Fri, 14 Oct 2022 17:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojOfv-0001nI-FE; Fri, 14 Oct 2022 17:40:47 +0000
Received: by outflank-mailman (input) for mailman id 422970;
 Fri, 14 Oct 2022 17:40:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojOft-0001nC-Ez
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 17:40:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojOft-0006M4-6f; Fri, 14 Oct 2022 17:40:45 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojOfs-0005dj-WF; Fri, 14 Oct 2022 17:40:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=RK4/JrJrs2TnS03PnU1cHiEPWzNKJM3EZ2vbkQuF3Hk=; b=iKmosFfMUv+7tlYdblvniIlCCd
	0HgdWC+aKjGCXFiN0ioLXqY5GIMYfO57I//CDhBDyA4LZYtPdsLElYwylYzzop5OIL8ZWK3+3vDgS
	qOOWvjUCeafHQlgZcazD3iN4sVYAFvPGYnQ4Wb9sLBPjB7f548XGOt4U8TR/S7exFuqE=;
Message-ID: <e53601a1-a5ac-897a-334d-de45d96e9863@xen.org>
Date: Fri, 14 Oct 2022 18:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-2-Henry.Wang@arm.com>
 <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
 <AS8PR08MB799119B54A5FE419CDDB9C1592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3cfdcd2b-cc18-0585-d837-f5932d9eeb0f@xen.org>
 <AS8PR08MB7991508880001B08C602881692249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991508880001B08C602881692249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/10/2022 10:31, Henry Wang wrote:
> Hi Julien,

Hi,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>>> +Users should be mindful that the static heap should at least satisfy the
>>>>> +allocation of the P2M maps for all guests. Currently, the minimal
>>>> requirement
>>>>> +of per-domain P2M pages pool is in-sync with function
>>>>> +libxl__get_required_paging_memory() (for xl-created domUs) and
>>>>> +domain_p2m_pages() (for dom0less domUs), that is, 1MB per vCPU,
>> plus
>>>> 4KiB per
>>>>> +MiB of RAM for the P2M map, and plus 512KiB to cover extended
>> regions.
>>>>
>>>> I think this wording is OK if the feature is a tech preview. However, if
>>>> this is security supported, we need to provide some more details about
>>>> the size.
>>>>
>>>> In particular, this doesn't tell a user how they can find the size that
>>>> would fit them. Can this be decided with a formula?
>>> My feeling of the formula would be:
>>>
>>> Total heap size needed per guest =  1MB * num_guest_vcpu +
>>>       4KB * guest_ram_size_in_mb + 512KB +
>>>       the memory allocated from heap by xzalloc/xzalloc_array for
>> 	various uses
>>>       for example alloc_domain_struct(), d->shared_info, evtchn_bucket, etc.
>>
>> There are also some pages allocated using alloc_{xen,dom}heap_pages().
>> We also need to take into account runtime allocation done by some
>> hypercalls (I can't remember which one) or subsystem like OPTee.
>>
>> In addition to that, you also have memory for the system. E.g
>> frametables, Xen page-tables, various driver allocations...
>>
>>>
>>> Is this formula somehow make sense to you? I think we need to have a
>>> rough estimation of the last part (boot time allocation) though.
>>
>> That's going to be hard. It will vary depending on your system and this
>> could change in the future as we add more features. For instance, I
>> expect the PCI passthrough will need some memory to keep track of all
>> the devices.
>>
>> I am worry the formula will become complex. Ideally we need to have a
>> very simple formula. If that's not possible, then we need to provide a
>> way for the user to estimate it at runtime (like what I suggested before).
> 
> I agree, I think the simple formula can only be achieved is we have an
> estimation of the worst case scenario of those scattered memory usages.
> I remember I once had a try so let me try to find the results back that time...
> 
> I am also very interested in the method that you proposed to provide a
> mechanism for users to get the system memory allocation at runtime. But
> IIUC this needs some work in another series. Could you please confirm if I
> am understanding correctly? Or probably Xen has some mechanisms that
> I am likely unaware? Thanks!

It will depend the way you account memory statically allocated to 
domains in Xen.

We already provide the total amount of memory in the system and how much 
is free. The values can be retrieved using ``xl info``.

  * When not allocated, is this considered free or used?
  * Are they included in the total memory?

If the answer is no for both (possibly just one), then we will need to 
provide extra hypercalls to expose the size of the xenheap and how much 
is free.

Cheers,

-- 
Julien Grall

