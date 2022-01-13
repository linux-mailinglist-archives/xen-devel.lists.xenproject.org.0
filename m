Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3548E0AC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 23:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257436.442301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n890O-0005ql-L7; Thu, 13 Jan 2022 22:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257436.442301; Thu, 13 Jan 2022 22:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n890O-0005ob-H4; Thu, 13 Jan 2022 22:55:40 +0000
Received: by outflank-mailman (input) for mailman id 257436;
 Thu, 13 Jan 2022 22:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n890N-0005oQ-4W
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 22:55:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf33d56-74c3-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 23:55:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 545D861CB0;
 Thu, 13 Jan 2022 22:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79625C36AEA;
 Thu, 13 Jan 2022 22:55:35 +0000 (UTC)
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
X-Inumbo-ID: ebf33d56-74c3-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642114535;
	bh=Ot0SoWptL7kHsMAlvinJq9R2DRypMwicor7Cw+2akCo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DqAPnJ2jc3pmJXXtxOvl2DN4M6R1i1xB3t2Ye/UNvvMTkVeqVvNkRPyHBjCp5fmox
	 +YuqEeEct/7UxEEEMOjjf0vKFZrZXzKWiQbNX0RDVr1LJ0EcleEScFMhZQb3EnQo2l
	 T/L0FY7aWMlOzTQPjN8fJueVmqBqfL//Vez95lUhjyxzg36sigc56/PKEfg3H9ru1F
	 wzTgZrBLa4uHfPRRmJdSUJRiTR/1l34u77R5+a+uZQH8OsvBWf/I76yO0bnkHAjlBo
	 lJZBU5rOsRxIK5dZlzGCB4pTzRYDjsCWMl/bd9o3Hr/7WhP1/V1qlI+oGlShHWM7if
	 +zsG6saEGcEEA==
Date: Thu, 13 Jan 2022 14:55:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v4 00/11] direct-map memory map
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131454410.19362@ubuntu-linux-20-04-desktop>
References: <20211220052123.969876-1-penny.zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Penny,

Thanks for the update. I tested the series in a couple of different
configurations and it works great!

You can add my Tested-by to all patches


On Mon, 20 Dec 2021, Penny Zheng wrote:
> Cases where domU needs direct-map memory map:
>   * IOMMU not present in the system.
>   * IOMMU disabled if it doesn't cover a specific device and all the guests
> are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> a few without, then guest DMA security still could not be totally guaranteed.
> So users may want to disable the IOMMU, to at least gain some performance
> improvement from IOMMU disabled.
>   * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> To be specific, in a few extreme situation, when multiple devices do DMA
> concurrently, these requests may exceed IOMMU's transmission capacity.
>   * IOMMU disabled when it adds too much latency on DMA. For example,
> TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> progress, so users may want to disable it in some realtime scenario.
>   * Guest OS relies on the host memory layout
> 
> "direct-map" property shall be added under the appropriate domain node,
> when users requesting direct-map memory mapping for the domain.
> 
> Right now, direct-map is only supported when domain on Static Allocation,
> that is, "xen,static-mem" is also necessary in the domain configuration.
> 
> Looking into related [design link](
> https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
> for more details.
> 
> The whole design is about Static Allocation and direct-map, and this
> Patch Serie only covers parts of it, which are direct-map memory map.
> Other features will be delievered through different patch series.
> 
> See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
> for Domain on Static Allocation.
> 
> This patch serie is based on
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html\
> ---
> v4 changes:
> - introduce internal const CDF_xxx flags for domain creation
> - introduce internal flag CDF_privileged
> - introduce new internal flag CDF_directmap
> - add a directmap flag under struct arch_domain and use it to
> reimplement is_domain_direct_mapped.
> - expand arch_domain_create/domain_create to include internal-only parameter
> "const unsigned int flags"
> - use mfn_eq() instead, because it is the only value used to indicate
> there is an error and this is more lightweight than mfn_valid()
> - rename function allocate_static_memory_11() to assign_static_memory_11()
> to make clear there is actually no allocation done. Instead we are only
> mapping pre-defined host regions to pre-defined guest regions.
> - remove tot_size to directly substract psize from kinfo->unassigned_mem
> - check kinfo->unassigned_mem doesn't underflow or overflow
> - remove nested if/else
> - remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
> CONFIG_GICV3=n
> - comment and commit message refinement
> ---
> v3 changes:
> - move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
> to let it be only available for domain created by XEN.
> - name it with extra "INTERNAL" and add comments to warn developers not
> to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
> - reject this flag in x86'es arch_sanitise_domain_config()
> - add ASSERT_UNREACHABLE to catch any misuse in allocate_static_memory()
> and allocate_static_memory_11()
> - add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
> when CONFIG_STATIC_MEMORY is set.
> - simply map the CPU interface at the GPA vgic_v2_hw.cbase
> - drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
> - rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
> ---
> v2 changes:
> - remove the introduce of internal flag
> - Refine is_domain_direct_mapped to check whether the flag
> XEN_DOMCTL_CDF_directmap is set
> - reword "1:1 direct-map" to just "direct-map"
> - split the common codes into two helpers: parse_static_mem_prop and
> acquire_static_memory_bank to deduce complexity.
> - introduce a new helper allocate_static_memory_11 for allocating static
> memory for direct-map guests
> - remove panic action since it is fine to assign a non-DMA capable device when
> IOMMU and direct-map both off
> - remove redistributor accessor
> - introduce new helper "is_domain_use_host_layout()"
> - explain why vpl011 initialization before creating its device tree node
> - error out if the domain is direct-mapped and the IRQ is not found
> - harden the code and add a check/comment when the hardware UART region
> is smaller than CUEST_VPL011_SIZE.
> Penny Zheng (4):
>   xen/arm: introduce new helper parse_static_mem_prop and
>     acquire_static_memory_bank
>   xen/arm: introduce direct-map for domUs
>   xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
>   xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3
> 
> Stefano Stabellini (7):
>   xen: introduce internal CDF_xxx flags for domain creation
>   xen: introduce CDF_directmap
>   xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
>   xen/arm: if direct-map domain use native addresses for GICv2
>   xen/arm: if direct-map domain use native addresses for GICv3
>   xen/arm: if direct-map domain use native UART address and IRQ number
>     for vPL011
>   xen/docs: Document how to do passthrough without IOMMU
> 
>  docs/misc/arm/device-tree/booting.txt |   6 +
>  docs/misc/arm/passthrough-noiommu.txt |  52 +++++
>  xen/arch/arm/domain.c                 |   5 +-
>  xen/arch/arm/domain_build.c           | 308 +++++++++++++++++++++-----
>  xen/arch/arm/include/asm/domain.h     |  19 +-
>  xen/arch/arm/include/asm/new_vgic.h   |  10 +
>  xen/arch/arm/include/asm/vgic.h       |  11 +
>  xen/arch/arm/include/asm/vpl011.h     |   2 +
>  xen/arch/arm/vgic-v2.c                |  34 ++-
>  xen/arch/arm/vgic-v3.c                |  26 ++-
>  xen/arch/arm/vgic/vgic-v2.c           |  34 ++-
>  xen/arch/arm/vpl011.c                 |  60 ++++-
>  xen/arch/x86/domain.c                 |   3 +-
>  xen/arch/x86/setup.c                  |   2 +-
>  xen/common/domain.c                   |  12 +-
>  xen/common/sched/core.c               |   2 +-
>  xen/include/xen/domain.h              |   9 +-
>  xen/include/xen/sched.h               |   2 +-
>  18 files changed, 490 insertions(+), 107 deletions(-)
>  create mode 100644 docs/misc/arm/passthrough-noiommu.txt
> 
> -- 
> 2.25.1
> 

