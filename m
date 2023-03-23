Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00426C68FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513860.795515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKVW-0005rr-Lx; Thu, 23 Mar 2023 12:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513860.795515; Thu, 23 Mar 2023 12:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKVW-0005oo-Hn; Thu, 23 Mar 2023 12:57:30 +0000
Received: by outflank-mailman (input) for mailman id 513860;
 Thu, 23 Mar 2023 12:57:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pfKVV-0005og-9q
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:57:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKVU-0007i7-V0; Thu, 23 Mar 2023 12:57:28 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.18.79]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKVU-0000jZ-O3; Thu, 23 Mar 2023 12:57:28 +0000
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
	bh=9IhYIh/6u1RRdfzg8zCsWQtVgG0+GFfcqP4abHpr3WE=; b=4Kg7VIi5ESrcVa5hxzv8VW3pIH
	GuUGtu1gDDLe5nsKrkZAE0fBVWai7TmLFetdoaEA4xBJPeQXg68KkgvubdCj2hLVlrs1NChF986+T
	FfauDfsQ3A79JEWb4zkdJN5txEvsAXV9yggk5/U80cLVOpAtH0dXvu8ZirZARo3DkAaI=;
Message-ID: <1527b04a-cc68-e6f4-2d12-4774110c25d1@xen.org>
Date: Thu, 23 Mar 2023 12:57:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-3-michal.orzel@amd.com>
 <130680d1-155e-e989-8ab9-2ef59ca59fd6@xen.org>
 <b0253701-3696-fd18-ba74-9fb7e6150a1f@amd.com>
 <05196f3f-213c-e93c-c5be-1d2e83927bef@xen.org>
 <611499ff-1922-221e-ad9b-9303e3a88502@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <611499ff-1922-221e-ad9b-9303e3a88502@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/03/2023 12:13, Michal Orzel wrote:
> Hi Julien,
> 
> On 23/03/2023 12:33, Julien Grall wrote:
>>
>>
>> On 23/03/2023 11:10, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 22/03/2023 17:19, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 22/03/2023 10:29, Michal Orzel wrote:
>>>>> When vgic_reserve_virq() fails and backend is in domain, we should also
>>>>> free the allocated event channel.
>>>>>
>>>>> When backend is in Xen and call to xzalloc() returns NULL, there is no
>>>>> need to call xfree(). This should be done instead on an error path
>>>>> from vgic_reserve_virq().
>>>>
>>>> Most likely this was implemented this way to avoid a double "if (
>>>> vpl011->backend_in_domain)". TBH, I am not very thrilled with this
>>>> approach. Could we instead consider to use domain_pl011_deinit()? (A
>>>> couple of tweak would be necessary to use it)
>>> I think we could. More about it later.
>>>
>>>>
>>>>> Also, take the opportunity to return -ENOMEM
>>>>> instead of -EINVAL when memory allocation fails.
>>>>>
>>>>> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>>     xen/arch/arm/vpl011.c | 11 +++++++----
>>>>>     1 file changed, 7 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>>>>> index 541ec962f189..df29a65ad365 100644
>>>>> --- a/xen/arch/arm/vpl011.c
>>>>> +++ b/xen/arch/arm/vpl011.c
>>>>> @@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>>             vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
>>>>>             if ( vpl011->backend.xen == NULL )
>>>>>             {
>>>>> -            rc = -EINVAL;
>>>>> -            goto out1;
>>>>> +            rc = -ENOMEM;
>>>>> +            goto out;
>>>>>             }
>>>>>         }
>>>>>
>>>>> @@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>>     out2:
>>>>>         vgic_free_virq(d, vpl011->virq);
>>>>>
>>>>> +    if ( vpl011->backend_in_domain )
>>>>> +        free_xen_event_channel(d, vpl011->evtchn);
>>>>> +    else
>>>>> +        xfree(vpl011->backend.xen);
>>>>
>>>> There is another bug here (unrelated to your change). You want to use
>>>> XFREE() to avoid an extra free in domain_pl011_deinit(). Can you look at it?
>>> Strictly speaking this is not a bug. Memory allocation can only happen if backend is in Xen.
>>> This means, that if vpl011 init fails, we will call free only once (domain_vpl011_deinit
>>> will not be called on this path i.e. we will invoke panic after construct_domU).
>>
>> Well yes, in the current use this is not a real bug (it is only latent).
>> But the same reasoning is also true for adding the call to
>> free_xen_event_channel() because we would not continue to run the domain
>> if domain_vpl011_init() is failing (even when the backend is in the
>> domain). And even if we were going to continue this is just a channel
>> that cannot be used. It will get free when the domain is destroyed
>> (either explicitly in deinit() or by evtchn_destroy()).
>>
>>> Of course, we could switch to XFREE just for sanity.
>> This is just not about sanity here. You are relying on how the caller is
>> behaving. And we have no guarantee this is going to be the same forever.
>> For instance, one may decide that it would fine to continue even if
>> construct_domU() is failing (e.g. because the domain is not critical).
>> At this point, this would become a real bug.
> ok, makes sense.
> 
>>
>>>>> +
>>>>>     out1:
>>>>>         if ( vpl011->backend_in_domain )
>>>>>             destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>>>>>                                     vpl011->backend.dom.ring_page);
>>>>> -    else
>>>>> -        xfree(vpl011->backend.xen);
>>>>>
>>>>>     out:
>>>>>         return rc;
>>>>
>>> Solution to reuse domain_pl011_deinit would be as follows:
>>>
>>>        vgic_free_virq(d, vpl011->virq);
>>
>> We should move this call in domain_vpl011_deinit();
> True and I think it does not need any guard as in case of a not registered virq it will
> just clear the already cleared bit.

Technically it could have been reserved by someone else afterwards. So 
it would be best to 0 it (we allocate a SPI so we could use 0 as invalid).

Cheers,

-- 
Julien Grall

