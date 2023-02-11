Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A6692FDE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 11:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493848.763886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmhg-0006mM-2b; Sat, 11 Feb 2023 10:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493848.763886; Sat, 11 Feb 2023 10:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmhf-0006k3-VQ; Sat, 11 Feb 2023 10:01:55 +0000
Received: by outflank-mailman (input) for mailman id 493848;
 Sat, 11 Feb 2023 10:01:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQmhe-0006jx-BJ
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 10:01:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmhd-0003Zd-JE; Sat, 11 Feb 2023 10:01:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmhd-0004A5-DO; Sat, 11 Feb 2023 10:01:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=6dexXVAvbrJnM3ieaiV6wLjCkQKxgSvXJjNxfAESCHg=; b=nEDtejRgRJiPDYxJUFc/ocUkqO
	WKpeV7F8ilwTZuzxmq9cBOcarxtDv87EjT4otYwacekNkqzAymFZJEiSxg60VIwvjONz9KYUmQQXW
	mZQ3eeJqLb9V/gRNId4Fu+gPgIRJYfC34Zzzo4bTgYBLI7a02/TwOCXbDZ+d0aUeefds=;
Message-ID: <f8e156f3-933c-03c4-1146-980acc669130@xen.org>
Date: Sat, 11 Feb 2023 10:01:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-7-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v3 6/9] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
In-Reply-To: <20230208120529.22313-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 08/02/2023 12:05, Ayan Kumar Halder wrote:
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
>   xen/arch/Kconfig                     | 12 +++++++++++
>   xen/arch/arm/Kconfig                 | 31 ++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/page-bits.h |  2 ++
>   xen/arch/arm/include/asm/types.h     |  6 ++++++
>   4 files changed, 51 insertions(+)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 7028f7b74f..1eff312b51 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,18 @@
>   config 64BIT
>   	bool
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
> +
So you likely don't want to allow the user to select them directly (IOW 
remove the help section). However, I don't see any code using it. Did 
you actually intended to use PHYS_ADDR_{32, 64} in the code?

>   config NR_CPUS
>   	int "Maximum number of CPUs"
>   	range 1 4095
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..0955891e86 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,37 @@ config ARM
>   	select HAS_PDX
>   	select HAS_PMAP
>   	select IOMMU_FORCE_PT_SHARE
> +	choice

I think this is a bit odd that this choice is part of CONFIG_ARM. It 
would be better it is separate. You can do that by removing one indentation.

> +		bool "Representative width for any physical address (default 64bit)"
> +		optional
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

As I wrote in v2, I think this is a bit odd to ask the user what would 
be the width of paddr_t. It is also not scalable if we decide in the 
future to define different PADDR_BITS (i.e. 48, 40, 36, 32).

So it would be better to allow the user to define PADDR_BITS that can 
then be translated by Xen to which ever paddr_t is suitable.

Something like:

choice
    prompt: "Physical address space size" if ARM_32
    default ARM_PA_48 if ARM_64
    default AMR_PA_40 if ARM_32
    help
      ...

config ARM_PA_BITS_32
    bool "32-bit"
    help
        XXX Add help here to explain the benefits of using 32-bit.

    select PHYS_ADDR_T_32
    depends on ARM_32

config ARM_PA_BITS_40
    bool "40-bit"
    select PHYS_ADDR_T_64
    depends on ARM_32

config ARM_PA_BITS_48
    bool "40-bit"
    select PHYS_ADDR_T_64
    depends on ARM_48
endchoice

config PADDR_BITS
    int
    default 32 if ARM_PA_BITS_32
    default 40 if ARM_PA_BITS_40
    default 48 if ARM_PA_BITS_48

With this approach, there would be no structural change in the Kconfig 
if we wanted to support 32/40-bit on Arm64.

> +
> +    endchoice
>   
>   config ARCH_DEFCONFIG
>   	string
> diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
> index 5d6477e599..8f4dcebcfd 100644
> --- a/xen/arch/arm/include/asm/page-bits.h
> +++ b/xen/arch/arm/include/asm/page-bits.h
> @@ -5,6 +5,8 @@
>   
>   #ifdef CONFIG_ARM_64
>   #define PADDR_BITS              48
> +#elif CONFIG_ARM_PA_32
> +#define PADDR_BITS              32
>   #else
>   #define PADDR_BITS              40
>   #endif

With what I suggested above. This would be replaced with:

#define PADDR_BITS CONFIG_PADDR_BITS

> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index e218ed77bd..26144bc87e 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)

And this could be replaced with
#ifdef CONFIG_PHY_ADDR_T_32

I would also consider to add the following in mm.c

BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);

This is to make sure that the PADDR_BITS will always fit in paddr_t.

> +typedef unsigned long paddr_t;
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

Cheers,

-- 
Julien Grall

