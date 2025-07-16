Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC44B0725D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 12:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045026.1415092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyvW-0006pI-Ot; Wed, 16 Jul 2025 09:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045026.1415092; Wed, 16 Jul 2025 09:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyvW-0006nD-Lf; Wed, 16 Jul 2025 09:59:50 +0000
Received: by outflank-mailman (input) for mailman id 1045026;
 Wed, 16 Jul 2025 09:59:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ubyvV-0006n7-0q
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 09:59:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubyvU-002z1l-2J;
 Wed, 16 Jul 2025 09:59:48 +0000
Received: from [15.248.3.92] (helo=[10.24.67.240])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubyvU-00BzXT-1i;
 Wed, 16 Jul 2025 09:59:48 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=u1+pGE8a2Gd3yDa94WOgJ4EjPRD9SFBIJU4uzxSTwRk=; b=I2MEv+fpD6yMjt/ZYcZoUmvwJm
	P/a3ZQDbx/hyT1LNjAq9zqXUZAnbELoJyxTg6g2UqcpdJIM+LoDyPUK4G209ER9QjuJgvWH17k26q
	Ztq3gOqdrKsh0KaUKA0OJ+wa/Dlv1mtDkb145iZg85z7vS2xirOYbiG6SRGIj9K/JTpU=;
Message-ID: <5cc13cbf-bb66-42e1-8b20-604b282fdfa4@xen.org>
Date: Wed, 16 Jul 2025 10:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
From: Julien Grall <julien@xen.org>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, jason.andryuk@amd.com
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
 <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
 <e3a03602-656e-4efb-b9b6-3a6d33781ca0@amd.com>
 <b17f56d8-9021-4220-8c39-8c073fe5e281@xen.org>
 <2e2f3a53-15a9-439d-af57-1fdf881b7e8b@amd.com>
 <be21ce7b-4d9f-4a8a-b96c-6c0eb76bf9cf@xen.org>
Content-Language: en-US
In-Reply-To: <be21ce7b-4d9f-4a8a-b96c-6c0eb76bf9cf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/07/2025 10:56, Julien Grall wrote:
> On 15/07/2025 16:58, Stewart Hildebrand wrote:
>> On 7/14/25 18:47, Julien Grall wrote:
>>> Hi Stewards,
>>>
>>> On 14/07/2025 22:12, Stewart Hildebrand wrote:
>>>> On 7/12/25 06:08, Julien Grall wrote:
>>>>> Hi Stefano,
>>>>>
>>>>> On 11/07/2025 01:25, Stefano Stabellini wrote:
>>>>>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/ 
>>>>>> drivers/passthrough/arm/iommu_helpers.c
>>>>>> index 5cb1987481..dae5fc0caa 100644
>>>>>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>>>>>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>>>>>> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct 
>>>>>> domain *d, dfn_t dfn, mfn_t mfn,
>>>>>>     {
>>>>>>         p2m_type_t t;
>>>>>>    -    /*
>>>>>> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
>>>>>> -     * returned by the hypercall is the MFN (not the IPA). For 
>>>>>> device
>>>>>> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in 
>>>>>> the domain
>>>>>> -     * p2m to allow DMA request to work.
>>>>>> -     * This is only valid when the domain is directed mapped. 
>>>>>> Hence this
>>>>>> -     * function should only be used by gnttab code with gfn == 
>>>>>> mfn == dfn.
>>>>>> -     */
>>>>>> -    BUG_ON(!is_domain_direct_mapped(d));
>>>>>> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
>>>>>> -
>>>>>
>>>>> Shouldn't arm_iommu_unmap_page() also be updated? It would not 
>>>>> result to a crash, but we would not be able to
>>>>> remove the mapping.
>>>>
>>>> f9f6b22abf1d didn't add any calls to iommu_unmap(). As this is still
>>>> only hwdom for now, hwdom is not expected to be destroyed, so the
>>>> mapping is not expected to be removed for now.
>>>
>>> I already gathered that by looking at the fixes tag in my previous 
>>> answer. Maybe I should have been clearer at that point. Even though 
>>> iommu_unmap() is not called today, this is meant to be the reverse of 
>>> what was done by iommu_map(). So it looks very odd to update one but 
>>> not the other.
>>>
>>> Furthermore, AFAIU, this patch is going a bit further than just 
>>> fixing the bug introduced by f9f6b22abf1d. At which point, we should 
>>> properly
>>> fix it in the same patch rather than hoping that someone else will 
>>> remember that this needed be updated.
>>
>> I'd like to suggest splitting this into two patches then, so we don't
>> let preparation for future work get in the way of fixing the reported
>> issue:
>>
>> Patch #1 to fix the reported issue with a simple
>> s/is_domain_direct_mapped/domain_use_host_layout/ in both
>> arm_iommu_map_page() and arm_iommu_unmap_page().
>>
>> Patch #2 to allow translated mappings in preparation for future work.
> 
> This sounds good to me.
> 
>>
>>>>
>>>> With that said, in the future when we expose vITS to domU, you'd be
>>>> right. In the xlnx downstream we have something like this:
>>>>
>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index ef8bd4b6ab33..2f5b79279ff9 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -133,7 +133,8 @@ static inline int p2m_remove_mapping(struct 
>>>> domain *d,
>>>>            mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, 
>>>> i), &t, NULL,
>>>>                                             &cur_order, NULL);
>>>>    -        if ( p2m_is_any_ram(t) &&
>>>> +        if ( !mfn_eq(mfn, INVALID_MFN) &&
>>>> +             p2m_is_any_ram(t) &&
>>>
>>> I don't quite understand why you need to update this function. Can 
>>> you clarify?
>>
>> Since arm_iommu_unmap_page() doesn't have the mfn, we needed a way to
>> remove a p2m mapping without the mfn available. INVALID_MFN is a
>> sentinel/placeholder in lieu of the missing mfn.
> 
> Ah, I didn't spot you changed the MFN passed in 
> guest_physmap_remove_page() below. Hmmm... The code in 
> p2m_remove_mapping() is checking MFN to avoid any race. IIRC this is to 
> close a race in the grant-table mapping.
> 
> So I am a bit uncomfortable to allow bypassing the check when 
> INVALID_MFN is passed. Looking at the code, I see the check is also 
> gated with p2m_is_any_ram(). I would argue that none of the IOMMU 
> mapping we are creating should be considered as RAM (the grant mapping 
> is arguable, but definitely not the doorbell). So I think it would be 
> better to use a different p2m type for the IOMMU mapping.

Actually, looking at the code, IOMMU mapping will use 
p2m_iommu_map_{rw,ro}. If I am not mistaken, neither of them are 
included in p2m_is_any_ram(). So I don't see why this check is needed in 
upstream.

Did I miss anything? Do you happen to have downstream change?

Cheers,

-- 
Julien Grall


