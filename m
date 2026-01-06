Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7BACFABD9
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 20:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196449.1514264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCwf-0004M0-1g; Tue, 06 Jan 2026 19:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196449.1514264; Tue, 06 Jan 2026 19:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCwe-0004KG-Uo; Tue, 06 Jan 2026 19:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1196449;
 Tue, 06 Jan 2026 19:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdvV=7L=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1vdCwd-0004KA-7I
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 19:42:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ce23d1c8-eb37-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 20:42:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01059497;
 Tue,  6 Jan 2026 11:42:09 -0800 (PST)
Received: from [10.57.46.241] (unknown [10.57.46.241])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 259E33F5A1;
 Tue,  6 Jan 2026 11:42:13 -0800 (PST)
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
X-Inumbo-ID: ce23d1c8-eb37-11f0-b15e-2bf370ae4941
Message-ID: <73c533b9-1315-409f-baad-ef9a46ab6bf0@arm.com>
Date: Tue, 6 Jan 2026 19:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
To: Barry Song <21cnbao@gmail.com>, Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, will@kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Joerg Roedel <joro@8bytes.org>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-9-21cnbao@gmail.com> <20251227201642.GQ11869@unreal>
 <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-27 8:59 pm, Barry Song wrote:
> On Sun, Dec 28, 2025 at 9:16 AM Leon Romanovsky <leon@kernel.org> wrote:
>>
>> On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
>>> From: Barry Song <baohua@kernel.org>
>>>
>>> Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
>>> iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
>>> a single flush operation is needed.
>>>
>>> I do not have the hardware to test this, so the patch is marked as
>>> RFC. I would greatly appreciate any testing feedback.
>>>
>>> Cc: Leon Romanovsky <leon@kernel.org>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Joerg Roedel <joro@8bytes.org>
>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>> ---
>>>   drivers/iommu/dma-iommu.c | 15 +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>>> index ffa940bdbbaf..b68dbfcb7846 100644
>>> --- a/drivers/iommu/dma-iommu.c
>>> +++ b/drivers/iommu/dma-iommu.c
>>> @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
>>>                        iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
>>>                                                      sg->length, dir);
>>>        } else if (!dev_is_dma_coherent(dev)) {
>>> -             for_each_sg(sgl, sg, nelems, i) {
>>> +             for_each_sg(sgl, sg, nelems, i)
>>>                        arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
>>> -                     arch_sync_dma_flush();
>>> -             }
>>> +             arch_sync_dma_flush();
>>
>> This and previous patches should be squashed into the one which
>> introduced arch_sync_dma_flush().
> 
> Hi Leon,
> 
> The series is structured to first introduce no functional change by
> replacing all arch_sync_dma_for_* calls with arch_sync_dma_for_* plus
> arch_sync_dma_flush(). Subsequent patches then add batching for
> different scenarios as separate changes.
> 
> Another issue is that I was unable to find a board that both runs
> mainline and exercises the IOMMU paths affected by these changes.
> As a result, patches 7 and 8 are marked as RFC, while the other
> patches have been tested on a real board running mainline + changes.

FWIW if you can get your hands on an M.2 NVMe for the Rock5 then that 
has an SMMU in front of PCIe (and could also work to test non-coherent 
SWIOTLB, with the SMMU in bypass and either some fake restrictive 
dma-ranges in the DT or a hack to reduce the DMA mask in the NVMe driver.)

Cheers,
Robin.

