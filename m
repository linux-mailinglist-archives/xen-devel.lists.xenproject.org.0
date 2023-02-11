Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D5A692C17
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 01:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493731.763742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdqH-0002rF-PU; Sat, 11 Feb 2023 00:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493731.763742; Sat, 11 Feb 2023 00:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdqH-0002pB-MO; Sat, 11 Feb 2023 00:34:13 +0000
Received: by outflank-mailman (input) for mailman id 493731;
 Sat, 11 Feb 2023 00:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mMB=6H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQdqF-0002p5-HB
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 00:34:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8a988c-a9a3-11ed-933c-83870f6b2ba8;
 Sat, 11 Feb 2023 01:34:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD9D61EE4;
 Sat, 11 Feb 2023 00:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34040C433EF;
 Sat, 11 Feb 2023 00:34:05 +0000 (UTC)
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
X-Inumbo-ID: cb8a988c-a9a3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676075646;
	bh=fowtCkN0OB1OoqfanJ+GUfswAR2zenTwMqMgokzSFKw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cpJOldqrTc0q9FhjsVJvn2VtIfHwa7wNzGnLam67Y1Y4/xGcwUwu0DNIpcD7G1950
	 gcNwS1R46+lmqwd2Ux5jNJibYNeM+zFT9pIsXBbs1UWRiBw7dBYb4P4HWg5SBS5hos
	 ZsywC1qk6FOsc9FyPMDutpsLksPqLTbXAFTUcNgiJ/iNgruI/CZ53uM4Y4U03xTC/P
	 nOxMyPqb3anZO0ZROMvos0lhKPckD0xwVZ6f3w3KSukGhOCSQ1yRlkkeeAVyq3fUjE
	 ByrwcS3N186dTw5y6eYD2zvngkEkJm4j4tr7N8X/2AkSjL1iAkkyFHBocvTERBzcmy
	 yUZqfCjFD3u+A==
Date: Fri, 10 Feb 2023 16:34:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    rahul.singh@arm.com
Subject: Re: [XEN v3 6/9] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
In-Reply-To: <20230208120529.22313-7-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302101629560.4661@ubuntu-linux-20-04-desktop>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com> <20230208120529.22313-7-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
> Some Arm based hardware platforms which does not support LPAE
> (eg Cortex-R52), uses 32 bit physical addresses.
> Also, users may choose to use 32 bits to represent physical addresses
> for optimization.
> 
> To support the above use cases, we have introduced arch independent
> configs to choose if the physical address can be represented using
> 32 bits (PHYS_ADDR_32) or 64 bits (PHYS_ADDR_64).
> For now only ARM_32 provides support to enable 32 bit physical
> addressing.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
> 
> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
> 
> (Jan,Julien please let me know if I understood your suggestion about Kconfig correctly).
> 
>  xen/arch/Kconfig                     | 12 +++++++++++
>  xen/arch/arm/Kconfig                 | 31 ++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/page-bits.h |  2 ++
>  xen/arch/arm/include/asm/types.h     |  6 ++++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 7028f7b74f..1eff312b51 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,18 @@
>  config 64BIT
>  	bool
>  
> +config PHYS_ADDR_32
> +	bool
> +	help
> +	  Select this option if the physical addresses can be represented by
> +	  32 bits.
> +
> +config PHYS_ADDR_64
> +	bool
> +	help
> +	  Select this option if the physical addresses can be represented
> +	  64 bits.

These two config symbols should be defined in xen/arch/arm/Kconfig
(unless you plan to also define them for x86).


>  config NR_CPUS
>  	int "Maximum number of CPUs"
>  	range 1 4095
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..0955891e86 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,37 @@ config ARM
>  	select HAS_PDX
>  	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
> +	choice

This shows up at the very beginning of the global menu. I think it would
be better to move it under "Architecture Features"

Also given that there is not choice on arm64, I don't think the choice
option should be visible to the user (because the user cannot change
selection for arm64).

> +		bool "Representative width for any physical address (default 64bit)"
> +		optional

should not be "optional", optional means that neither ARM_PA_64 nor
ARM_PA_32 could be selected. I think we want one of the two to always be
selected, ARM_PA_64 being the default option, and the only option on
arm64.

> +		---help---
> +		  You may want to specify the width to represent the physical
> +		  address space.
> +		  By default, the physical addresses are represented using
> +		  64 bits.
> +
> +		  However in certain platforms, the physical addresses may be
> +		  represented using 32 bits.
> +		  Also, the user may decide that the physical addresses can be
> +		  represented using 32 bits for a given SoC. In those cases,
> +		  user may want to enable 32 bit physical address for
> +		  optimization.
> +		  For now, we have enabled this choice for ARM_32 only.
> +
> +		config ARM_PA_64
> +			select PHYS_ADDR_64
> +			bool "Select 64 bits to represent physical address"
> +			---help---
> +			  Use 64 bits to represent physical address.
> +
> +		config ARM_PA_32
> +			select PHYS_ADDR_32
> +			depends on ARM_32
> +			bool "Select 32 bits to represent physical address"
> +			---help---
> +			  Use 32 bits to represent physical address.
> +
> +    endchoice
>  
>  config ARCH_DEFCONFIG
>  	string
> diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
> index 5d6477e599..8f4dcebcfd 100644
> --- a/xen/arch/arm/include/asm/page-bits.h
> +++ b/xen/arch/arm/include/asm/page-bits.h
> @@ -5,6 +5,8 @@
>  
>  #ifdef CONFIG_ARM_64
>  #define PADDR_BITS              48
> +#elif CONFIG_ARM_PA_32
> +#define PADDR_BITS              32
>  #else
>  #define PADDR_BITS              40
>  #endif
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index e218ed77bd..26144bc87e 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>  typedef unsigned long long u64;
>  typedef u32 vaddr_t;
>  #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)
> +typedef unsigned long paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "08lx"
> +#else
>  typedef u64 paddr_t;
>  #define INVALID_PADDR (~0ULL)
>  #define PRIpaddr "016llx"
> +#endif
>  typedef u32 register_t;
>  #define PRIregister "08x"
>  #elif defined (CONFIG_ARM_64)
> -- 
> 2.17.1
> 
> 

