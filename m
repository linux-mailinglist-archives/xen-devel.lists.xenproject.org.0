Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D6D027BD
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 12:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197605.1515093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdoS0-0000qR-Qp; Thu, 08 Jan 2026 11:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197605.1515093; Thu, 08 Jan 2026 11:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdoS0-0000nt-Ni; Thu, 08 Jan 2026 11:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1197605;
 Thu, 08 Jan 2026 11:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6fl=7N=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1vdoRy-0000nl-Uo
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 11:45:11 +0000
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b8eb26-ec87-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 12:45:05 +0100 (CET)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260108114503euoutp02c48034d3cb6d31c0a9b6d5217b172eae~Ivtt7Ahof2079520795euoutp02A
 for <xen-devel@lists.xenproject.org>; Thu,  8 Jan 2026 11:45:03 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260108114503eucas1p1a3e0deb0e605e7382bf16448c83ec6f8~Ivtth0YBR2914529145eucas1p1x;
 Thu,  8 Jan 2026 11:45:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260108114501eusmtip15f0fd6545e69b98729bf484cf7dc88fd~IvtsWADvp1512515125eusmtip1d;
 Thu,  8 Jan 2026 11:45:01 +0000 (GMT)
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
X-Inumbo-ID: 78b8eb26-ec87-11f0-9ccf-f158ae23cfc8
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260108114503euoutp02c48034d3cb6d31c0a9b6d5217b172eae~Ivtt7Ahof2079520795euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767872703;
	bh=80K+d4Szn6RvlP9wVPPYJwKN3aMRnNo3dCDMAoay0As=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=J2E4DuaCy6+4FUxry+Tn1XeH87/YA0Nm4UjVkxrph9SmNJ2a1v6zW2o9uouRlYEw2
	 1c9XdXUQVm5I2ZNtBxe3VoeEt91ceOeW9lZzN5rAjuzl7L+j7KDFSFmuEWTieDulaq
	 ApUx4sYyPm8IAEoAXJLbbAvSh0YdDr+VrE/+/ohI=
Message-ID: <b331d1a8-e5ff-40ae-89b8-e1e30f523d06@samsung.com>
Date: Thu, 8 Jan 2026 12:45:01 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
To: Robin Murphy <robin.murphy@arm.com>, Barry Song <21cnbao@gmail.com>
Cc: Leon Romanovsky <leon@kernel.org>, catalin.marinas@arm.com,
	will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Anshuman
	Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng
	<zhengtangquan@oppo.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <551bb2e3-d7c7-4949-a9bd-ce0cf70e7134@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260108114503eucas1p1a3e0deb0e605e7382bf16448c83ec6f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16
X-EPHeader: CA
X-CMS-RootMailID: 20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16
References: <20251226225254.46197-1-21cnbao@gmail.com>
	<20251226225254.46197-6-21cnbao@gmail.com> <20251227200933.GO11869@unreal>
	<CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
	<20251228145041.GS11869@unreal>
	<CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
	<de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
	<CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
	<CGME20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16@eucas1p1.samsung.com>
	<551bb2e3-d7c7-4949-a9bd-ce0cf70e7134@arm.com>

On 07.01.2026 14:16, Robin Murphy wrote:
> On 2026-01-06 7:47 pm, Barry Song wrote:
>> On Wed, Jan 7, 2026 at 8:12 AM Robin Murphy <robin.murphy@arm.com> 
>> wrote:
>>>
>>> On 2026-01-06 6:41 pm, Barry Song wrote:
>>>> On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> 
>>>> wrote:
>>>>>
>>>>> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
>>>>>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> 
>>>>>> wrote:
>>>>>>>
>>>>>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
>>>>>>>> From: Barry Song <baohua@kernel.org>
>>>>>>>>
>>>>>>>> Instead of performing a flush per SG entry, issue all cache
>>>>>>>> operations first and then flush once. This ultimately benefits
>>>>>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
>>>>>>>>
>>>>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>>>>> ---
>>>>>>>>    kernel/dma/direct.c | 14 +++++++-------
>>>>>>>>    1 file changed, 7 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> <...>
>>>>>>>
>>>>>>>> -             if (!dev_is_dma_coherent(dev)) {
>>>>>>>> +             if (!dev_is_dma_coherent(dev))
>>>>>>>> arch_sync_dma_for_device(paddr, sg->length,
>>>>>>>>                                         dir);
>>>>>>>> -                     arch_sync_dma_flush();
>>>>>>>> -             }
>>>>>>>>         }
>>>>>>>> +     if (!dev_is_dma_coherent(dev))
>>>>>>>> +             arch_sync_dma_flush();
>>>>>>>
>>>>>>> This patch should be squashed into the previous one. You introduced
>>>>>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
>>>>>>
>>>>>> Hi Leon,
>>>>>>
>>>>>> The previous patch replaces all arch_sync_dma_for_* calls with
>>>>>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
>>>>>> functional change. The subsequent patches then implement the
>>>>>> actual batching. I feel this is a better approach for reviewing
>>>>>> each change independently. Otherwise, the previous patch would
>>>>>> be too large.
>>>>>
>>>>> Don't worry about it. Your patches are small enough.
>>>>
>>>> My hardware does not require a bounce buffer, but I am concerned that
>>>> this patch may be incorrect for systems that do require one.
>>>>
>>>> Now it is:
>>>>
>>>> void dma_direct_sync_sg_for_cpu(struct device *dev,
>>>>                   struct scatterlist *sgl, int nents, enum 
>>>> dma_data_direction dir)
>>>> {
>>>>           struct scatterlist *sg;
>>>>           int i;
>>>>
>>>>           for_each_sg(sgl, sg, nents, i) {
>>>>                   phys_addr_t paddr = dma_to_phys(dev, 
>>>> sg_dma_address(sg));
>>>>
>>>>                   if (!dev_is_dma_coherent(dev))
>>>>                           arch_sync_dma_for_cpu(paddr, sg->length, 
>>>> dir);
>>>>
>>>>                   swiotlb_sync_single_for_cpu(dev, paddr, 
>>>> sg->length, dir);
>>>>
>>>>                   if (dir == DMA_FROM_DEVICE)
>>>>                           arch_dma_mark_clean(paddr, sg->length);
>>>>           }
>>>>
>>>>           if (!dev_is_dma_coherent(dev)) {
>>>>                   arch_sync_dma_flush();
>>>>                   arch_sync_dma_for_cpu_all();
>>>>           }
>>>> }
>>>>
>>>> Should we call swiotlb_sync_single_for_cpu() and
>>>> arch_dma_mark_clean() after the flush to ensure the CPU sees the
>>>> latest data and that the memcpy is correct? I mean:
>>>
>>> Yes, this and the equivalents in the later patches are broken for all
>>> the sync_for_cpu and unmap paths which may end up bouncing (beware some
>>> of them get a bit fiddly) - any cache maintenance *must* be completed
>>> before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 
>>> thing,
>>> and appears to be entirely dead now.
>>
>> Thanks, Robin. Personally, I would prefer an approach like the one 
>> below—
>> that is, not optimizing the bounce buffer cases, as they are already 
>> slow
>> due to hardware limitations with memcpy, and optimizing them would make
>> the code quite messy.
>>
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index 550a1a13148d..a4840f7e8722 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>>          for_each_sg(sgl, sg, nents, i) {
>>                  phys_addr_t paddr = dma_to_phys(dev, 
>> sg_dma_address(sg));
>>
>> -               if (!dev_is_dma_coherent(dev))
>> +               if (!dev_is_dma_coherent(dev)) {
>>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
>> +                       if (unlikely(dev->dma_io_tlb_mem))
>> +                               arch_sync_dma_flush();
>> +               }
>>
>>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, 
>> dir);
>>
>> I’d like to check with you, Leon, and Marek on your views about this.
>
> That doesn't work, since dma_io_tlb_mem is always initialised if a 
> SWIOTLB buffer exists at all. Similarly I think the existing 
> dma_need_sync tracking is also too coarse, as that's also always going 
> to be true for a non-coherent device.
>
> Really this flush wants to be after the swiotlb_find_pool() check in 
> the swiotlb_tbl_unmap_single()/__swiotlb_sync_single_for_cpu() paths, 
> as that's the only point we know for sure it's definitely needed for 
> the given address. It would then be rather fiddly to avoid 
> potentially-redundant flushes for the non-sg cases (and the final 
> segment of an sg), but as you already mentioned, if it's limited to 
> cases when we *are* already paying the cost of bouncing anyway, 
> perhaps one extra DSB isn't *too* bad if it means zero impact to the 
> non-bouncing paths.

I agree with Robin, optimizing the swiotlb path doesn't make much sense.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


