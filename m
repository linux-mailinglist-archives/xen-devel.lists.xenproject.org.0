Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C940183A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179497.325781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAIh-0006wp-HS; Mon, 06 Sep 2021 08:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179497.325781; Mon, 06 Sep 2021 08:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAIh-0006tk-DH; Mon, 06 Sep 2021 08:48:23 +0000
Received: by outflank-mailman (input) for mailman id 179497;
 Mon, 06 Sep 2021 08:48:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNAIg-0006te-6c
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:48:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNAIc-00088p-UG; Mon, 06 Sep 2021 08:48:18 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNAIc-0001IX-O6; Mon, 06 Sep 2021 08:48:18 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qgP+hT12nMxjdDowc+pmDpM6YfKK2qq0BIsypq9S8TQ=; b=f1IymJEEkbNVWgm6AmeL9FLn2R
	CQNqwFkVqniWLiVKx6jxtsIHtLj3pt45extwmdqpFTEViIEKMGvDxQf6uv82ISB8odz1xU/r1AZTw
	p8ZZ2ChPVfjMIWp2mhug7KsZarI/nrqr3ZGc8uGr0i4PqXIExgKPsfMGwoPN/YFHKBVY=;
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
 <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
Date: Mon, 6 Sep 2021 09:48:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 06/09/2021 08:02, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi Oleksandr,

> On 03.09.21 12:04, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> vPCI may map and unmap PCI device memory (BARs) being passed through which
>>> may take a lot of time. For this those operations may be deferred to be
>>> performed later, so that they can be safely preempted.
>>> Run the corresponding vPCI code while switching a vCPU.
>>
>> IIUC, you are talking about the function map_range() in xen/drivers/vpci/header. The function has the following todo for Arm:
>>
>>          /*
>>           * ARM TODOs:
>>           * - On ARM whether the memory is prefetchable or not should be passed
>>           *   to map_mmio_regions in order to decide which memory attributes
>>           *   should be used.
>>           *
>>           * - {un}map_mmio_regions doesn't support preemption.
>>           */
>>
>> This doesn't seem to be addressed in the two series for PCI passthrough sent so far. Do you have any plan to handle it?
> 
> No plan yet.
> 
> All the mappings are happening with p2m_mmio_direct_dev as of now.

So this address the first TODO but how about the second TODO? It refers 
to the lack of preemption on Arm but in this patch you suggest there are 
some and hence we need to call vpci_process_pending().

For a tech preview, the lack of preemption would be OK. However, the 
commit message should be updated to make clear there are no such 
preemption yet or avoid to mention it.

> 
>>
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>>    xen/arch/arm/traps.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index 219ab3c3fbde..1571fb8afd03 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -34,6 +34,7 @@
>>>    #include <xen/symbols.h>
>>>    #include <xen/version.h>
>>>    #include <xen/virtual_region.h>
>>> +#include <xen/vpci.h>
>>>      #include <public/sched.h>
>>>    #include <public/xen.h>
>>> @@ -2304,6 +2305,11 @@ static bool check_for_vcpu_work(void)
>>>        }
>>>    #endif
>>>    +    local_irq_enable();
>>> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
>>
>> Looking at the code of vpci_process_pending(), it looks like there are some rework to do for guest. Do you plan to handle it as part of the vPCI series?
> Yes, vPCI code is heavily touched to support guest non-identity mappings

I wasn't referring to the non-identity mappings here. I was referring to 
TODOs such as:

             /*
              * FIXME: in case of failure remove the device from the domain.
              * Note that there might still be leftover mappings. While 
this is
              * safe for Dom0, for DomUs the domain will likely need to be
              * killed in order to avoid leaking stale p2m mappings on
              * failure.
              */

You still have them after the series reworking the vPCI. As for the 
preemption this is OK to ignore it for a tech preview. Although, we want 
to at least track them.

>>
>>> +        raise_softirq(SCHEDULE_SOFTIRQ);
>>> +    local_irq_disable();
>>> +
>>
>>  From my understanding of vcpi_process_pending(). The function will return true if there are more work to schedule.
> Yes
>> However, if check_for_vcpu_for_work() return false, then we will return to the guest before any work for vCPI has finished. This is because check_for_vcpu_work() will not be called again.
> Correct
>>
>> In this case, I think you want to return as soon as you know we need to reschedule.
> Not sure I understand this

The return value of check_for_vcpu_for_work() indicates whether we have 
more work to do before returning to return to the guest.

When vpci_process_pending() returns true, it tells us we need to call 
the function at least one more time before returning to the guest.

In your current implementation, you leave that decision to whoeever is 
next in the function.

It is not safe to return to the guest as long as vpci_process_pending() 
returns true. So you want to write something like:

if ( vpci_process_pending() )
   return true;

>>
>> However, looking at the rest of the code, we already have a check for vpci in the common IOREQ code.
> 
> Which may not be enabled as it depends on CONFIG_IOREQ_SERVER.

Right. My point is when CONFIG_IOREQ_SERVER is set then you would end up 
to call twice vpci_process_pending(). This will have an impact how on 
long your vCPU is going to running because you are doubling the work.

> 
> My understanding is that for x86 it is always enabled, but this might not be the case for Arm
> 
>> So we would end up to call twice vpci_process_pending().
> So, if CONFIG_IOREQ_SERVER is not enabled then we end up with only calling it from traps.c on Arm
>> Maybe we should move the call from the IOREQ to arch-code.
> 
> Hm. I would better think of moving it from IOREQ to some other common code: for x86 (if
> 
> my understanding correct about CONFIG_IOREQ_SERVER) it is by coincidence that we call vPCI
> 
> code from there and IOREQ is always enabled.

I am not aware of another suitable common helper that would be called on 
the return to the guest path. Hence why I suggest to possibly duplicated 
the code in each arch path.

Cheers,

-- 
Julien Grall

