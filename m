Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F65CFDE25
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 14:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196699.1514444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdTPN-0004Ts-T4; Wed, 07 Jan 2026 13:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196699.1514444; Wed, 07 Jan 2026 13:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdTPN-0004Re-Pv; Wed, 07 Jan 2026 13:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1196699;
 Wed, 07 Jan 2026 13:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Hc1=7M=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1vdTPM-0004RF-4k
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 13:17:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 24b97ddf-ebcb-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 14:16:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C02F497;
 Wed,  7 Jan 2026 05:16:50 -0800 (PST)
Received: from [10.57.48.49] (unknown [10.57.48.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0A33F5A1;
 Wed,  7 Jan 2026 05:16:54 -0800 (PST)
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
X-Inumbo-ID: 24b97ddf-ebcb-11f0-9ccf-f158ae23cfc8
Message-ID: <551bb2e3-d7c7-4949-a9bd-ce0cf70e7134@arm.com>
Date: Wed, 7 Jan 2026 13:16:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
To: Barry Song <21cnbao@gmail.com>
Cc: Leon Romanovsky <leon@kernel.org>, catalin.marinas@arm.com,
 m.szyprowski@samsung.com, will@kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com> <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
 <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
 <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
 <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-06 7:47 pm, Barry Song wrote:
> On Wed, Jan 7, 2026 at 8:12 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2026-01-06 6:41 pm, Barry Song wrote:
>>> On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> wrote:
>>>>
>>>> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
>>>>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
>>>>>>
>>>>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
>>>>>>> From: Barry Song <baohua@kernel.org>
>>>>>>>
>>>>>>> Instead of performing a flush per SG entry, issue all cache
>>>>>>> operations first and then flush once. This ultimately benefits
>>>>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
>>>>>>>
>>>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>>>> ---
>>>>>>>    kernel/dma/direct.c | 14 +++++++-------
>>>>>>>    1 file changed, 7 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> <...>
>>>>>>
>>>>>>> -             if (!dev_is_dma_coherent(dev)) {
>>>>>>> +             if (!dev_is_dma_coherent(dev))
>>>>>>>                         arch_sync_dma_for_device(paddr, sg->length,
>>>>>>>                                         dir);
>>>>>>> -                     arch_sync_dma_flush();
>>>>>>> -             }
>>>>>>>         }
>>>>>>> +     if (!dev_is_dma_coherent(dev))
>>>>>>> +             arch_sync_dma_flush();
>>>>>>
>>>>>> This patch should be squashed into the previous one. You introduced
>>>>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
>>>>>
>>>>> Hi Leon,
>>>>>
>>>>> The previous patch replaces all arch_sync_dma_for_* calls with
>>>>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
>>>>> functional change. The subsequent patches then implement the
>>>>> actual batching. I feel this is a better approach for reviewing
>>>>> each change independently. Otherwise, the previous patch would
>>>>> be too large.
>>>>
>>>> Don't worry about it. Your patches are small enough.
>>>
>>> My hardware does not require a bounce buffer, but I am concerned that
>>> this patch may be incorrect for systems that do require one.
>>>
>>> Now it is:
>>>
>>> void dma_direct_sync_sg_for_cpu(struct device *dev,
>>>                   struct scatterlist *sgl, int nents, enum dma_data_direction dir)
>>> {
>>>           struct scatterlist *sg;
>>>           int i;
>>>
>>>           for_each_sg(sgl, sg, nents, i) {
>>>                   phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
>>>
>>>                   if (!dev_is_dma_coherent(dev))
>>>                           arch_sync_dma_for_cpu(paddr, sg->length, dir);
>>>
>>>                   swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
>>>
>>>                   if (dir == DMA_FROM_DEVICE)
>>>                           arch_dma_mark_clean(paddr, sg->length);
>>>           }
>>>
>>>           if (!dev_is_dma_coherent(dev)) {
>>>                   arch_sync_dma_flush();
>>>                   arch_sync_dma_for_cpu_all();
>>>           }
>>> }
>>>
>>> Should we call swiotlb_sync_single_for_cpu() and
>>> arch_dma_mark_clean() after the flush to ensure the CPU sees the
>>> latest data and that the memcpy is correct? I mean:
>>
>> Yes, this and the equivalents in the later patches are broken for all
>> the sync_for_cpu and unmap paths which may end up bouncing (beware some
>> of them get a bit fiddly) - any cache maintenance *must* be completed
>> before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing,
>> and appears to be entirely dead now.
> 
> Thanks, Robin. Personally, I would prefer an approach like the one below—
> that is, not optimizing the bounce buffer cases, as they are already slow
> due to hardware limitations with memcpy, and optimizing them would make
> the code quite messy.
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 550a1a13148d..a4840f7e8722 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
> -               if (!dev_is_dma_coherent(dev))
> +               if (!dev_is_dma_coherent(dev)) {
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> +                       if (unlikely(dev->dma_io_tlb_mem))
> +                               arch_sync_dma_flush();
> +               }
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
> I’d like to check with you, Leon, and Marek on your views about this.

That doesn't work, since dma_io_tlb_mem is always initialised if a 
SWIOTLB buffer exists at all. Similarly I think the existing 
dma_need_sync tracking is also too coarse, as that's also always going 
to be true for a non-coherent device.

Really this flush wants to be after the swiotlb_find_pool() check in the 
swiotlb_tbl_unmap_single()/__swiotlb_sync_single_for_cpu() paths, as 
that's the only point we know for sure it's definitely needed for the 
given address. It would then be rather fiddly to avoid 
potentially-redundant flushes for the non-sg cases (and the final 
segment of an sg), but as you already mentioned, if it's limited to 
cases when we *are* already paying the cost of bouncing anyway, perhaps 
one extra DSB isn't *too* bad if it means zero impact to the 
non-bouncing paths.

Thanks,
Robin.

