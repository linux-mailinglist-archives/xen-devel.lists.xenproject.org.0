Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D875258FA
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 02:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328080.550991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJEu-0003zV-1M; Fri, 13 May 2022 00:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328080.550991; Fri, 13 May 2022 00:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJEt-0003wE-UQ; Fri, 13 May 2022 00:33:03 +0000
Received: by outflank-mailman (input) for mailman id 328080;
 Fri, 13 May 2022 00:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npJEr-0003w7-VK
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 00:33:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dae0c5e-d254-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 02:33:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 294EA620A7;
 Fri, 13 May 2022 00:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13AC34113;
 Fri, 13 May 2022 00:32:57 +0000 (UTC)
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
X-Inumbo-ID: 3dae0c5e-d254-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652401978;
	bh=mJEFxR3D2mwBmlg9euCPAxtD5PlfuLv6x1KLxUN9VxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i6iljFMfrwUq3koJL5gxLbiQ9E/xH0GqfQhxMsY58+8/GE93KOFUyIDBOo7L1ZmVo
	 nTcE/ft4lx9eQhQo/ZQrz3sff5ParUJJpJpr1FUiexpYS8HCOjOmBsaiEkaAVjRTFu
	 52MjRH4Z4jdyRGqvEO9Udh22pq3hfn0mPE8H1Adva+LuTUHIbY+aMC9XN8XO4FT8AY
	 m59e3qm5PzD/1l3r/QXUtyQBKhcVrk9WXgnmBlZ9hnYL/lmdbVphrZMvOok+mxvg/F
	 okzOWRIm86Q0qSpVD3n7t7h/2yT1bJlk2xDucSRpRVp6j330c0PPdafej+FCSK9JGr
	 8sLIX6HUODNTg==
Date: Thu, 12 May 2022 17:32:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jiamei Xie <jiamei.xie@arm.com>
Subject: Re: [PATCH v3 4/9] xen: introduce an arch helper for default dma
 zone status
In-Reply-To: <20220511014639.197825-5-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205121726340.3842@ubuntu-linux-20-04-desktop>
References: <20220511014639.197825-1-wei.chen@arm.com> <20220511014639.197825-5-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Wei Chen wrote:
> In current code, when Xen is running in a multiple nodes
> NUMA system, it will set dma_bitsize in end_boot_allocator
> to reserve some low address memory as DMA zone.
> 
> There are some x86 implications in the implementation.
> Because on x86, memory starts from 0. On a multiple-nodes
> NUMA system, if a single node contains the majority or all
> of the DMA memory, x86 prefers to give out memory from
> non-local allocations rather than exhausting the DMA memory
> ranges. Hence x86 uses dma_bitsize to set aside some largely
> arbitrary amount of memory for DMA zone. The allocations
> from DMA zone would happen only after exhausting all other
> nodes' memory.
> 
> But the implications are not shared across all architectures.
> For example, Arm cannot guarantee the availability of memory
> below a certain boundary for DMA limited-capability devices
> either. But currently, Arm doesn't need a reserved DMA zone
> in Xen. Because there is no DMA device in Xen. And for guests,
> Xen Arm only allows Dom0 to have DMA operations without IOMMU.
> Xen will try to allocate memory under 4GB or memory range that
> is limited by dma_bitsize for Dom0 in boot time. For DomU, even
> Xen can passthrough devices to DomU without IOMMU, but Xen Arm
> doesn't guarantee their DMA operations. So, Xen Arm doesn't
> need a reserved DMA zone to provide DMA memory for guests.
> 
> In this patch, we introduce an arch_want_default_dmazone helper
> for different architectures to determine whether they need to
> set dma_bitsize for DMA zone reservation or not.
> 
> At the same time, when x86 Xen is built with CONFIG_PV=n could
> probably leverage this new helper to actually not trigger DMA
> zone reservation.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 -> v3:
> 1. Add Tb.
> 2. Rename arch_have_default_dmazone to arch_want_default_dmazone.
> v1 -> v2:
> 1. Extend the description of Arm's workaround for reserve DMA
>    allocations to avoid the same discussion every time.
> 2. Use a macro to define arch_have_default_dmazone, because
>    it's little hard to make x86 version to static inline.
>    Use a macro will also avoid add __init for this function.
> 3. Change arch_have_default_dmazone return value from
>    unsigned int to bool.
> 4. Un-addressed comment: make arch_have_default_dmazone
>    of x86 to be static inline. Because, if we move
>    arch_have_default_dmazone to x86/asm/numa.h, it depends
>    on nodemask.h to provide num_online_nodes. But nodemask.h
>    needs numa.h to provide MAX_NUMANODES. This will cause a
>    loop dependency. And this function can only be used in
>    end_boot_allocator, in Xen initialization. So I think,
>    compared to the changes introduced by inline, it doesn't
>    mean much.
> ---
>  xen/arch/arm/include/asm/numa.h | 1 +
>  xen/arch/x86/include/asm/numa.h | 1 +
>  xen/common/page_alloc.c         | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
> index 31a6de4e23..e4c4d89192 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
> +#define arch_want_default_dmazone() (false)
>  
>  #endif /* __ARCH_ARM_NUMA_H */
>  /*
> diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
> index bada2c0bb9..5d8385f2e1 100644
> --- a/xen/arch/x86/include/asm/numa.h
> +++ b/xen/arch/x86/include/asm/numa.h
> @@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>  #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
>  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
>  				 NODE_DATA(nid)->node_spanned_pages)
> +#define arch_want_default_dmazone() (num_online_nodes() > 1)
>  
>  extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
>  
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 319029140f..b3bddc719b 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>      }
>      nr_bootmem_regions = 0;
>  
> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
> +    if ( !dma_bitsize && arch_want_default_dmazone() )
>          dma_bitsize = arch_get_dma_bitsize();
>  
>      printk("Domain heap initialised");
> -- 
> 2.25.1
> 

