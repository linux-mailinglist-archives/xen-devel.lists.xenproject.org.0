Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7351240CEF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 20:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5CUj-0004Kh-S9; Mon, 10 Aug 2020 18:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyEj=BU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5CUi-0004KW-8W
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 18:26:00 +0000
X-Inumbo-ID: 5d9a9b2d-609d-4e16-be6f-42127c4ab7dd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d9a9b2d-609d-4e16-be6f-42127c4ab7dd;
 Mon, 10 Aug 2020 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvymexlVpdJ7sRZiNLtAZV337z413VmfBXPfJrLI204=; b=priKNzHIl7r4Gs9NF1+/AoXgyj
 gz4bQQyNXAidUFdpJqRZPH6ltQVDuAepfmahSpDFxB7Ak4uTk5reLOJ+X0ZJUBILrb8hsuJca3//W
 8v8wraFuGVv9u2iw2TbCXjQSplE1xhBmFOAHUW4PpyayWqrbWQe8BvuohSrzCl9VtrZ0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5CUX-0005G2-WC; Mon, 10 Aug 2020 18:25:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5CUX-00029u-N5; Mon, 10 Aug 2020 18:25:49 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
 <952392d9-22cc-af66-c1af-f82360b75cf4@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <31914fc1-9a00-ef1c-2935-20ced2a2b574@xen.org>
Date: Mon, 10 Aug 2020 19:25:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <952392d9-22cc-af66-c1af-f82360b75cf4@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 06/08/2020 14:27, Oleksandr wrote:
> 
> On 06.08.20 14:08, Julien Grall wrote:
> 
> Hi Julien
> 
>>
>>>> What is this function supposed to do?
>>> Agree, sounds confusing a bit. I assume it is supposed to complete 
>>> Guest MMIO access after finishing emulation.
>>>
>>> Shall I rename it to something appropriate (maybe by adding ioreq 
>>> prefix)?
>>
>> How about ioreq_handle_complete_mmio()?
> 
> For me it sounds fine.
> 
> 
> 
>>
>>>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>>>> index 9283e5e..0000477 100644
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -8,6 +8,7 @@
>>>>>    */
>>>>>     #include <xen/domain_page.h>
>>>>> +#include <xen/hvm/ioreq.h>
>>>>>   #include <xen/types.h>
>>>>>   #include <xen/lib.h>
>>>>>   #include <xen/mm.h>
>>>>> @@ -30,10 +31,6 @@
>>>>>   #include <public/memory.h>
>>>>>   #include <xsm/xsm.h>
>>>>>   -#ifdef CONFIG_IOREQ_SERVER
>>>>> -#include <xen/hvm/ioreq.h>
>>>>> -#endif
>>>>> -
>>>>
>>>> Why do you remove something your just introduced?
>>> The reason I guarded that header is to make "xen/mm: Make x86's 
>>> XENMEM_resource_ioreq_server handling common" (previous) patch 
>>> buildable on Arm
>>> without arch IOREQ header added yet. I tried to make sure that the 
>>> result after each patch was buildable to retain bisectability.
>>> As current patch adds Arm IOREQ specific bits (including header), 
>>> that guard could be removed as not needed anymore.
>> I agree we want to have the build bisectable. However, I am still 
>> puzzled why it is necessary to remove the #ifdef and move it earlier 
>> in the list.
>>
>> Do you mind to provide more details?
> Previous patch "xen/mm: Make x86's XENMEM_resource_ioreq_server handling 
> common" breaks build on Arm as it includes xen/hvm/ioreq.h which 
> requires arch header
> to be present (asm/hvm/ioreq.h). But the missing arch header together 
> with other arch specific bits are introduced here in current patch. 

I understand that both Arm and x86 now implement the asm/hvm/ioreq.h.
However, please keep in mind that there might be other architectures in 
the future.

With your change here, you would impose a new arch to implement 
asm/hvm/ioreq.h even if the developper have no plan to use the feature.

> Probably I should have rearranged
> changes in a way to not introduce #ifdef and then remove it...

Ideally we want to avoid #ifdef in the common code. But if this can't be 
done in an header, then the #ifdef here would be fine.

> 
> 
>>
>> [...]
>>
>>>>> +
>>>>> +bool handle_mmio(void);
>>>>> +
>>>>> +static inline bool handle_pio(uint16_t port, unsigned int size, 
>>>>> int dir)
>>>>> +{
>>>>> +    /* XXX */
>>>>
>>>> Can you expand this TODO? What do you expect to do?
>>> I didn't expect this to be called on Arm. Sorry, I am not sure l have 
>>> an idea how to handle this properly. I would keep it unimplemented 
>>> until a real reason.
>>> Will expand TODO.
>>
>> Let see how the conversation on patch#1 goes about PIO vs MMIO.
> 
> ok
> 
> 
>>
>>>>
>>>>
>>>>> +    BUG();
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>> +static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
>>>>> +{
>>>>> +    return p->addr;
>>>>> +}
>>>>
>>>> I understand that the x86 version is more complex as it check p->df. 
>>>> However, aside reducing the complexity, I am not sure why we would 
>>>> want to diverge it.
>>>>
>>>> After all, IOREQ is now meant to be a common feature.
>>> Well, no objections at all.
>>> Could you please clarify how could 'df' (Direction Flag?) be 
>>> handled/used on Arm?
>>
>> On x86, this is used by 'rep' instruction to tell the direction to 
>> iterate (forward or backward).
>>
>> On Arm, all the accesses to MMIO region will do a single memory 
>> access. So for now, we can safely always set to 0.
>>
>>> I see that try_fwd_ioserv() always sets it 0. Or I need to just reuse 
>>> x86's helpers as is,
>>> which (together with count = df = 0) will result in what we actually 
>>> have here?
>> AFAIU, both count and df should be 0 on Arm.
> 
> Thanks for the explanation. The only one question remains where to put 
> common helpers hvm_mmio_first_byte/hvm_mmio_last_byte (common io.h?)?

It feels to me it should be part of the common ioreq.h.

Cheers,

-- 
Julien Grall

