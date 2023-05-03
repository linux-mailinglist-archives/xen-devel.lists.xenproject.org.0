Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4826F578B
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529144.823210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBBw-0007lg-9i; Wed, 03 May 2023 12:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529144.823210; Wed, 03 May 2023 12:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBBw-0007jC-6Q; Wed, 03 May 2023 12:02:40 +0000
Received: by outflank-mailman (input) for mailman id 529144;
 Wed, 03 May 2023 12:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puBBv-0007j6-7E
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBBu-0001Cs-Jm; Wed, 03 May 2023 12:02:38 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBBu-0001C8-CJ; Wed, 03 May 2023 12:02:38 +0000
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
	bh=VMVN2vAC2nE/Zj3G5fg5xXXvofC9KMg65JAvt4knDXs=; b=bdKzYUSOlnV/tUygOkaX1/EW3u
	f8BtAxDvy73ogFwi9vxzrfB+P3JBJdrgvhWR+d/lZjjWBe/E9T4QTsH4gK+2dE/how1+SBeyQNkW0
	pxOOnx+SVRvbUekyof/misBK7tQSuFp2Xj9JIg8txCTjnkluPZ/2K6VzGKMhtm5H9q2I=;
Message-ID: <6ab92e3d-03b9-91d3-ef6f-697f69a2debd@xen.org>
Date: Wed, 3 May 2023 13:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 05/12] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230428175543.11902-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/04/2023 18:55, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..192582b61d 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,13 +19,41 @@ config ARM
>   	select HAS_PMAP
>   	select IOMMU_FORCE_PT_SHARE
>   
> +menu "Architecture Features"
> +
> +choice
> +	prompt "Physical address space size" if ARM_32
> +	default ARM_PA_BITS_40 if ARM_32
> +	help
> +	  User can choose to represent the width of physical address. This can
> +	  sometimes help in optimizing the size of image when user chooses a
> +	  smaller size to represent physical address.
> +
> +config ARM_PA_BITS_32
> +	bool "32-bit"
> +	depends on ARM_32
> +	select PHYS_ADDR_T_32
> +	help
> +	  On platforms where any physical address can be represented within 32 bits,
> +	  user should choose this option. This will help is reduced size of the
> +	  binary.
> +
> +config ARM_PA_BITS_40
> +	bool "40-bit"
> +	depends on ARM_32
> +endchoice
> +
> +config PADDR_BITS
> +	int
> +	default 32 if ARM_PA_BITS_32
> +	default 40 if ARM_PA_BITS_40
> +	default 48 if ARM_64
> +
>   config ARCH_DEFCONFIG

Any particular reason to move this config under "Architectures 
features"? IOW... Why didn't you add...

>   	string
>   	default "arch/arm/configs/arm32_defconfig" if ARM_32
>   	default "arch/arm/configs/arm64_defconfig" if ARM_64
>   
> -menu "Architecture Features"
> -

... your new config here rather than moving "menu"?

>   source "arch/Kconfig"
>   
>   config ACPI
> diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
> index 5d6477e599..deb381ceeb 100644
> --- a/xen/arch/arm/include/asm/page-bits.h
> +++ b/xen/arch/arm/include/asm/page-bits.h
> @@ -3,10 +3,6 @@
>   
>   #define PAGE_SHIFT              12
>   
> -#ifdef CONFIG_ARM_64
> -#define PADDR_BITS              48
> -#else
> -#define PADDR_BITS              40
> -#endif
> +#define PADDR_BITS              CONFIG_PADDR_BITS
>   
>   #endif /* __ARM_PAGE_SHIFT_H__ */
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index e218ed77bd..e3cfbbb060 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_PHYS_ADDR_T_32)
> +typedef unsigned long paddr_t;
Looking at this again, I think this needs an explanation in the commit 
message and Kconfig at least and possibly in the code why we are not 
using uint32_t.


> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "08lx"
> +#else
>   typedef u64 paddr_t;
>   #define INVALID_PADDR (~0ULL)
>   #define PRIpaddr "016llx"
> +#endif
>   typedef u32 register_t;
>   #define PRIregister "08x"
>   #elif defined (CONFIG_ARM_64)
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 74f6ff2c6f..5ef5fd8c49 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -703,6 +703,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>       const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
>       int rc;
>   
> +    /*
> +     * The size of paddr_t should be sufficient for the complete range of
> +     * physical address.
> +     */
> +    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>       BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>   
>       if ( frametable_size > FRAMETABLE_SIZE )

Cheers,

-- 
Julien Grall

