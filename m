Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3ECEC1DC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 15:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194565.1512927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaxQM-00038T-Ie; Wed, 31 Dec 2025 14:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194565.1512927; Wed, 31 Dec 2025 14:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaxQM-00036l-FM; Wed, 31 Dec 2025 14:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1194565;
 Wed, 31 Dec 2025 14:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7szS=7F=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1vaxQL-00036f-2b
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 14:43:41 +0000
Received: from mailout1.w1.samsung.com (unknown [210.118.77.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13616cbd-e657-11f0-b15d-2bf370ae4941;
 Wed, 31 Dec 2025 15:43:35 +0100 (CET)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251231144330euoutp012b4b98da0a0ee7973e3abd06409fe05a~GU-PoEOpK3076130761euoutp014
 for <xen-devel@lists.xenproject.org>; Wed, 31 Dec 2025 14:43:30 +0000 (GMT)
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251231144330eucas1p2e45e514c58572acda6dc94e809f9d2ee~GU-PNyoET1215412154eucas1p27;
 Wed, 31 Dec 2025 14:43:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251231144321eusmtip23facba6ecea740b65bcbedd64e01dd62~GU-GtmYe61784117841eusmtip2B;
 Wed, 31 Dec 2025 14:43:21 +0000 (GMT)
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
X-Inumbo-ID: 13616cbd-e657-11f0-b15d-2bf370ae4941
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251231144330euoutp012b4b98da0a0ee7973e3abd06409fe05a~GU-PoEOpK3076130761euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767192210;
	bh=M8aPWywfPFOyTSGu0q6hhPXyHxVoa1F4hqfQwCmIl58=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Alom80QxoG+L7ICMesd3Euki0jWEh5m9WrDQOO82KpT3M8GlUii6jb4NC/BUwrtla
	 x3F2P1lkvxBq8MsCMGMLR2GRCZGVZ1OzbjGOF4McE9zgsSSTUJqP6FtdiWlME5ilT5
	 BOXZctdYokjY0BnnWLe9y+syt3f3BRIA9KcPecjg=
Message-ID: <d19c559e-c93b-4a4d-9a0d-ec289ed4c2e6@samsung.com>
Date: Wed, 31 Dec 2025 15:43:19 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
To: Barry Song <21cnbao@gmail.com>, Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, robin.murphy@arm.com, will@kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Ada Couprie
	Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Marc
	Zyngier <maz@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
	Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251231144330eucas1p2e45e514c58572acda6dc94e809f9d2ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251228213843eucas1p298280bb01abe59739cd6e0482f570455
X-EPHeader: CA
X-CMS-RootMailID: 20251228213843eucas1p298280bb01abe59739cd6e0482f570455
References: <20251226225254.46197-1-21cnbao@gmail.com>
	<20251226225254.46197-5-21cnbao@gmail.com> <20251227200706.GN11869@unreal>
	<CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
	<20251228144909.GR11869@unreal>
	<CGME20251228213843eucas1p298280bb01abe59739cd6e0482f570455@eucas1p2.samsung.com>
	<CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>

On 28.12.2025 22:38, Barry Song wrote:
> On Mon, Dec 29, 2025 at 3:49 AM Leon Romanovsky <leon@kernel.org> wrote:
>> On Sun, Dec 28, 2025 at 10:45:13AM +1300, Barry Song wrote:
>>> On Sun, Dec 28, 2025 at 9:07 AM Leon Romanovsky <leon@kernel.org> wrote:
>>>> On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
>>>>> From: Barry Song <baohua@kernel.org>
>>>>>
>>>>> Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
>>>>> always wait for the completion of each DMA buffer. That is,
>>>>> issuing the DMA sync and waiting for completion is done in a
>>>>> single API call.
>>>>>
>>>>> For scatter-gather lists with multiple entries, this means
>>>>> issuing and waiting is repeated for each entry, which can hurt
>>>>> performance. Architectures like ARM64 may be able to issue all
>>>>> DMA sync operations for all entries first and then wait for
>>>>> completion together.
>>>>>
>>>>> To address this, arch_sync_dma_for_* now issues DMA operations in
>>>>> batch, followed by a flush. On ARM64, the flush is implemented
>>>>> using a dsb instruction within arch_sync_dma_flush().
>>>>>
>>>>> For now, add arch_sync_dma_flush() after each
>>>>> arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
>>>>> no-op on all architectures except arm64, so this patch does not
>>>>> change existing behavior. Subsequent patches will introduce true
>>>>> batching for SG DMA buffers.
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
>>>>> Cc: Joerg Roedel <joro@8bytes.org>
>>>>> Cc: Juergen Gross <jgross@suse.com>
>>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>> ---
>>>>>   arch/arm64/include/asm/cache.h |  6 ++++++
>>>>>   arch/arm64/mm/dma-mapping.c    |  4 ++--
>>>>>   drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
>>>>>   drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
>>>>>   include/linux/dma-map-ops.h    |  6 ++++++
>>>>>   kernel/dma/direct.c            |  8 ++++++--
>>>>>   kernel/dma/direct.h            |  9 +++++++--
>>>>>   kernel/dma/swiotlb.c           |  4 +++-
>>>>>   8 files changed, 73 insertions(+), 25 deletions(-)
>>>> <...>
>>>>
>>>>> +#ifndef arch_sync_dma_flush
>>>>> +static inline void arch_sync_dma_flush(void)
>>>>> +{
>>>>> +}
>>>>> +#endif
>>>> Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
>>>> options: they make it straightforward to inspect the entire DMA path simply
>>>> by looking at the .config.
>>> I am not quite sure how much this benefits users, as the same
>>> information could also be obtained by grepping for
>>> #define arch_sync_dma_flush in the source code.
>> It differs slightly. Users no longer need to grep around or guess whether this
>> platform used the arch_sync_dma_flush path. A simple grep for ARCH_HAVE_ in
>> /proc/config.gz provides the answer.
> In any case, it is only two or three lines of code, so I am fine with
> either approach. Perhaps Marek, Robin, and others have a point here?

If possible I would suggest to follow the already used style in the 
given code even if it means a bit larger patch.

>>>> Thanks,
>>>> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
>>> Thanks very much, Leon, for reviewing this over the weekend. One thing
>>> you might have missed is that I place arch_sync_dma_flush() after all
>>> arch_sync_dma_for_*() calls, for both single and sg cases. I also
>>> used a Python script to scan the code and verify that every
>>> arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
>>> that no call is left out.
>>>
>>> In the subsequent patches, for sg cases, the per-entry flush is
>>> replaced by a single flush of the entire sg. Each sg case has
>>> different characteristics: some are straightforward, while others
>>> can be tricky and involve additional contexts.
>> I didn't overlook it, and I understand your rationale. However, this is
>> not how kernel patches should be structured. You should not introduce
>> code in patch X and then move it elsewhere in patch X + Y.
> I am not quite convinced by this concern. This patch only
> separates DMA sync issuing from completion waiting, and it
> reflects that the development is done step by step.
>
>> Place the code in the correct location from the start. Your patches are
>> small enough to review as is.
> My point is that this patch places the code in the correct locations
> from the start. It splits arch_sync_dma_for_*() into
> arch_sync_dma_for_*() plus arch_sync_dma_flush() everywhere, without
> introducing any functional changes from the outset.
> The subsequent patches clearly show which parts are truly batched.
>
> In the meantime, I do not have a strong preference here. If you think
> it is better to move some of the straightforward batching code here,
> I can follow that approach. Perhaps I could move patch 5, patch 8,
> and the iommu_dma_iova_unlink_range_slow change from patch 7 here,
> while keeping
>
>    [PATCH 6] dma-mapping: Support batch mode for
>    dma_direct_{map,unmap}_sg
>
> and the IOVA link part from patch 7 as separate patches, since that
> part is not straightforward. The IOVA link changes affect both
> __dma_iova_link() and dma_iova_sync(), which are two separate
> functions and require a deeper understanding of the contexts to
> determine correctness. That part also lacks testing.
>
> Would that be okay with you?

Yes, this will be okay. The changes are easy to understand, so we don't 
need to go there with such very small steps.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


