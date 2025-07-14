Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72492B04AFB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043169.1413276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRxg-0003fF-No; Mon, 14 Jul 2025 22:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043169.1413276; Mon, 14 Jul 2025 22:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRxg-0003do-K0; Mon, 14 Jul 2025 22:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1043169;
 Mon, 14 Jul 2025 22:47:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ubRxf-0003di-UP
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:47:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubRxf-00HPHJ-0z;
 Mon, 14 Jul 2025 22:47:51 +0000
Received: from [2a02:8012:3a1:0:c39:bfa1:8126:9920]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubRxe-007pDR-3D;
 Mon, 14 Jul 2025 22:47:51 +0000
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
	bh=fjkIWhuyn+AYV+ENF+j34Cm8Bhp9YwL97Zc9swEDp0w=; b=Qe5aH9XgqAjuUwsIGofhLwVPzw
	U62N1XEhso3LM6b+x6eNIQUJXEQVZ2nps045DaXqzEQtaFAiWlWM2ragC9hHiF2sSMAz2CLA0UWKu
	Gbj+1AIGpEDLvRml8zvTz5CBT98NuuDybSf83UbI6GSrFxTXKMIJbS4QAn+gzOleqGQM=;
Message-ID: <b17f56d8-9021-4220-8c39-8c073fe5e281@xen.org>
Date: Mon, 14 Jul 2025 23:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
Content-Language: en-GB
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <e3a03602-656e-4efb-b9b6-3a6d33781ca0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stewards,

On 14/07/2025 22:12, Stewart Hildebrand wrote:
> On 7/12/25 06:08, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 11/07/2025 01:25, Stefano Stabellini wrote:
>>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
>>> index 5cb1987481..dae5fc0caa 100644
>>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>>> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>    {
>>>        p2m_type_t t;
>>>   -    /*
>>> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
>>> -     * returned by the hypercall is the MFN (not the IPA). For device
>>> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
>>> -     * p2m to allow DMA request to work.
>>> -     * This is only valid when the domain is directed mapped. Hence this
>>> -     * function should only be used by gnttab code with gfn == mfn == dfn.
>>> -     */
>>> -    BUG_ON(!is_domain_direct_mapped(d));
>>> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
>>> -
>>
>> Shouldn't arm_iommu_unmap_page() also be updated? It would not result to a crash, but we would not be able to
>> remove the mapping.
> 
> f9f6b22abf1d didn't add any calls to iommu_unmap(). As this is still
> only hwdom for now, hwdom is not expected to be destroyed, so the
> mapping is not expected to be removed for now.

I already gathered that by looking at the fixes tag in my previous 
answer. Maybe I should have been clearer at that point. Even though 
iommu_unmap() is not called today, this is meant to be the reverse of 
what was done by iommu_map(). So it looks very odd to update one but not 
the other.

Furthermore, AFAIU, this patch is going a bit further than just fixing 
the bug introduced by f9f6b22abf1d. At which point, we should properly
fix it in the same patch rather than hoping that someone else will 
remember that this needed be updated.

> 
> With that said, in the future when we expose vITS to domU, you'd be
> right. In the xlnx downstream we have something like this:
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index ef8bd4b6ab33..2f5b79279ff9 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -133,7 +133,8 @@ static inline int p2m_remove_mapping(struct domain *d,
>           mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
>                                            &cur_order, NULL);
>   
> -        if ( p2m_is_any_ram(t) &&
> +        if ( !mfn_eq(mfn, INVALID_MFN) &&
> +             p2m_is_any_ram(t) &&

I don't quite understand why you need to update this function. Can you 
clarify?

>                (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
>           {
>               rc = -EILSEQ;
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
> index 04b7e98e4aae..d59a9cf5a48b 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -63,14 +63,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
>                                         unsigned int order,
>                                         unsigned int *flush_flags)
>   {
> -    /*
> -     * This function should only be used by gnttab code when the domain
> -     * is direct mapped (i.e. gfn == mfn == dfn).
> -     */
> -    if ( !is_domain_direct_mapped(d) )
> -        return -EINVAL;
> -
> -    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
> +    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN,
>                                        order);
>   }

Cheers,

-- 
Julien Grall


