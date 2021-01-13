Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5E2F519E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66661.118483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkUZ-0006j8-KG; Wed, 13 Jan 2021 18:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66661.118483; Wed, 13 Jan 2021 18:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkUZ-0006ij-H6; Wed, 13 Jan 2021 18:03:35 +0000
Received: by outflank-mailman (input) for mailman id 66661;
 Wed, 13 Jan 2021 18:03:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYp6=GQ=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1kzkUY-0006iK-0Z
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:03:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e5798563-c3db-4ab2-bccb-f2e1c2731722;
 Wed, 13 Jan 2021 18:03:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1C051FB;
 Wed, 13 Jan 2021 10:03:27 -0800 (PST)
Received: from [10.57.56.43] (unknown [10.57.56.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D66F23F66E;
 Wed, 13 Jan 2021 10:03:18 -0800 (PST)
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
X-Inumbo-ID: e5798563-c3db-4ab2-bccb-f2e1c2731722
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, joro@8bytes.org,
 will@kernel.org, frowand.list@gmail.com, konrad.wilk@oracle.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 hch@lst.de, m.szyprowski@samsung.com
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, saravanak@google.com, peterz@infradead.org,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 grant.likely@arm.com, rdunlap@infradead.org, gregkh@linuxfoundation.org,
 xen-devel@lists.xenproject.org, dan.j.williams@intel.com,
 treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
 <7ed51025f051f65f3dfe10a88caeb648821994b1.camel@suse.de>
 <4c4989b5-f825-7e04-ca66-038cf6b9d5e9@arm.com>
 <9b4fe35f-a880-fcea-0591-b65406abbfa8@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7cb70e95-f352-5fde-cc0a-b2a65b07ef29@arm.com>
Date: Wed, 13 Jan 2021 18:03:16 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9b4fe35f-a880-fcea-0591-b65406abbfa8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2021-01-13 17:43, Florian Fainelli wrote:
> On 1/13/21 7:27 AM, Robin Murphy wrote:
>> On 2021-01-13 13:59, Nicolas Saenz Julienne wrote:
>>> Hi All,
>>>
>>> On Tue, 2021-01-12 at 16:03 -0800, Florian Fainelli wrote:
>>>> On 1/5/21 7:41 PM, Claire Chang wrote:
>>>>> Add the initialization function to create restricted DMA pools from
>>>>> matching reserved-memory nodes in the device tree.
>>>>>
>>>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>>>> ---
>>>>>    include/linux/device.h  |   4 ++
>>>>>    include/linux/swiotlb.h |   7 +-
>>>>>    kernel/dma/Kconfig      |   1 +
>>>>>    kernel/dma/swiotlb.c    | 144
>>>>> ++++++++++++++++++++++++++++++++++------
>>>>>    4 files changed, 131 insertions(+), 25 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/device.h b/include/linux/device.h
>>>>> index 89bb8b84173e..ca6f71ec8871 100644
>>>>> --- a/include/linux/device.h
>>>>> +++ b/include/linux/device.h
>>>>> @@ -413,6 +413,7 @@ struct dev_links_info {
>>>>>     * @dma_pools:    Dma pools (if dma'ble device).
>>>>>     * @dma_mem:    Internal for coherent mem override.
>>>>>     * @cma_area:    Contiguous memory area for dma allocations
>>>>> + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
>>>>>     * @archdata:    For arch-specific additions.
>>>>>     * @of_node:    Associated device tree node.
>>>>>     * @fwnode:    Associated device node supplied by platform firmware.
>>>>> @@ -515,6 +516,9 @@ struct device {
>>>>>    #ifdef CONFIG_DMA_CMA
>>>>>        struct cma *cma_area;        /* contiguous memory area for dma
>>>>>                           allocations */
>>>>> +#endif
>>>>> +#ifdef CONFIG_SWIOTLB
>>>>> +    struct io_tlb_mem    *dma_io_tlb_mem;
>>>>>    #endif
>>>>>        /* arch specific additions */
>>>>>        struct dev_archdata    archdata;
>>>>> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
>>>>> index dd8eb57cbb8f..a1bbd7788885 100644
>>>>> --- a/include/linux/swiotlb.h
>>>>> +++ b/include/linux/swiotlb.h
>>>>> @@ -76,12 +76,13 @@ extern enum swiotlb_force swiotlb_force;
>>>>>     *
>>>>>     * @start:    The start address of the swiotlb memory pool. Used
>>>>> to do a quick
>>>>>     *        range check to see if the memory was in fact allocated
>>>>> by this
>>>>> - *        API.
>>>>> + *        API. For restricted DMA pool, this is device tree
>>>>> adjustable.
>>>>
>>>> Maybe write it as this is "firmware adjustable" such that when/if ACPI
>>>> needs something like this, the description does not need updating.
>>
>> TBH I really don't think this needs calling out at all. Even in the
>> regular case, the details of exactly how and where the pool is allocated
>> are beyond the scope of this code - architectures already have several
>> ways to control that and make their own decisions.
>>
>>>>
>>>> [snip]
>>>>
>>>>> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>>>>> +                    struct device *dev)
>>>>> +{
>>>>> +    struct io_tlb_mem *mem = rmem->priv;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (dev->dma_io_tlb_mem)
>>>>> +        return -EBUSY;
>>>>> +
>>>>> +    if (!mem) {
>>>>> +        mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>>>>> +        if (!mem)
>>>>> +            return -ENOMEM;
>>>>> +
>>>>> +        if (!memremap(rmem->base, rmem->size, MEMREMAP_WB)) {
>>>>
>>>> MEMREMAP_WB sounds appropriate as a default.
>>>
>>> As per the binding 'no-map' has to be disabled here. So AFAIU, this
>>> memory will
>>> be part of the linear mapping. Is this really needed then?
>>
>> More than that, I'd assume that we *have* to use the linear/direct map
>> address rather than anything that has any possibility of being a vmalloc
>> remap, otherwise we can no longer safely rely on
>> phys_to_dma/dma_to_phys, no?
> 
> I believe you are right, which means that if we want to make use of the
> restricted DMA pool on a 32-bit architecture (and we do, at least, I do)
> we should probably add some error checking/warning to ensure the
> restricted DMA pool falls within the linear map.

Oh, good point - I'm so used to 64-bit that I instinctively just blanked 
out the !PageHighMem() condition in try_ram_remap(). So maybe the 
original intent here *was* to effectively just implement that check, but 
if so it could still do with being a lot more explicit.

Cheers,
Robin.

