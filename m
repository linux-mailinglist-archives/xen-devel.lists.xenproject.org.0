Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B9CFA84A
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 20:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196437.1514253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCTT-0000Jd-Qe; Tue, 06 Jan 2026 19:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196437.1514253; Tue, 06 Jan 2026 19:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCTT-0000IR-O5; Tue, 06 Jan 2026 19:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1196437;
 Tue, 06 Jan 2026 19:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdvV=7L=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1vdCTS-0000IK-GZ
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 19:12:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 98718ec2-eb33-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 20:12:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9CDB497;
 Tue,  6 Jan 2026 11:12:00 -0800 (PST)
Received: from [10.57.46.241] (unknown [10.57.46.241])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C7853F5A1;
 Tue,  6 Jan 2026 11:12:04 -0800 (PST)
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
X-Inumbo-ID: 98718ec2-eb33-11f0-b15e-2bf370ae4941
Message-ID: <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
Date: Tue, 6 Jan 2026 19:12:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
To: Barry Song <21cnbao@gmail.com>, Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, will@kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com> <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
 <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-06 6:41 pm, Barry Song wrote:
> On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> wrote:
>>
>> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
>>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
>>>>
>>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
>>>>> From: Barry Song <baohua@kernel.org>
>>>>>
>>>>> Instead of performing a flush per SG entry, issue all cache
>>>>> operations first and then flush once. This ultimately benefits
>>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
>>>>>
>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>> ---
>>>>>   kernel/dma/direct.c | 14 +++++++-------
>>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> <...>
>>>>
>>>>> -             if (!dev_is_dma_coherent(dev)) {
>>>>> +             if (!dev_is_dma_coherent(dev))
>>>>>                        arch_sync_dma_for_device(paddr, sg->length,
>>>>>                                        dir);
>>>>> -                     arch_sync_dma_flush();
>>>>> -             }
>>>>>        }
>>>>> +     if (!dev_is_dma_coherent(dev))
>>>>> +             arch_sync_dma_flush();
>>>>
>>>> This patch should be squashed into the previous one. You introduced
>>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
>>>
>>> Hi Leon,
>>>
>>> The previous patch replaces all arch_sync_dma_for_* calls with
>>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
>>> functional change. The subsequent patches then implement the
>>> actual batching. I feel this is a better approach for reviewing
>>> each change independently. Otherwise, the previous patch would
>>> be too large.
>>
>> Don't worry about it. Your patches are small enough.
> 
> My hardware does not require a bounce buffer, but I am concerned that
> this patch may be incorrect for systems that do require one.
> 
> Now it is:
> 
> void dma_direct_sync_sg_for_cpu(struct device *dev,
>                  struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> {
>          struct scatterlist *sg;
>          int i;
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  if (!dev_is_dma_coherent(dev))
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
>                  if (dir == DMA_FROM_DEVICE)
>                          arch_dma_mark_clean(paddr, sg->length);
>          }
> 
>          if (!dev_is_dma_coherent(dev)) {
>                  arch_sync_dma_flush();
>                  arch_sync_dma_for_cpu_all();
>          }
> }
> 
> Should we call swiotlb_sync_single_for_cpu() and
> arch_dma_mark_clean() after the flush to ensure the CPU sees the
> latest data and that the memcpy is correct? I mean:

Yes, this and the equivalents in the later patches are broken for all 
the sync_for_cpu and unmap paths which may end up bouncing (beware some 
of them get a bit fiddly) - any cache maintenance *must* be completed 
before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing, 
and appears to be entirely dead now.

Thanks,
Robin.

> void dma_direct_sync_sg_for_cpu(struct device *dev,
>                  struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> {
>          struct scatterlist *sg;
>          int i;
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  if (!dev_is_dma_coherent(dev))
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
>          }
> 
>          if (!dev_is_dma_coherent(dev)) {
>                  arch_sync_dma_flush();
>                  arch_sync_dma_for_cpu_all();
>          }
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
>                  if (dir == DMA_FROM_DEVICE)
>                          arch_dma_mark_clean(paddr, sg->length);
>          }
> }
> 
> Could this be the same issue for dma_direct_unmap_sg()?
> 
> Another option is to not support batched synchronization for the bounce
> buffer case, since it is rare. In that case, it could be:
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
> What’s your view on this, Leon?
> 
> Thanks
> Barry


