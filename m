Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6F67174A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480244.744527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4aB-0000bk-PV; Wed, 18 Jan 2023 09:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480244.744527; Wed, 18 Jan 2023 09:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4aB-0000Yc-Mn; Wed, 18 Jan 2023 09:18:11 +0000
Received: by outflank-mailman (input) for mailman id 480244;
 Wed, 18 Jan 2023 09:18:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI4a9-0000YW-Nw
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:18:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4a9-0003t8-D5; Wed, 18 Jan 2023 09:18:09 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4a9-0003uo-3I; Wed, 18 Jan 2023 09:18:09 +0000
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
	bh=h/9SYWu66KwxLzEcqWysHLfvLOSNrN4fa5oUb2J1ZJI=; b=w15JLnpxhmcIJs9PDwTx/DOU8o
	ALc5TyuAkQ7XVAZgbY0wBMaYFwvNln9BaeqyZ4NOSCfbHmeypbuuMeooy4PxpG+kQXD6GYG55CZxa
	8mRvh1wBli8VwTnofluQufBz681hoJh+Z6M/YahAdSC71MCX9fTcAeTAxzVM9Mnoje/A=;
Message-ID: <4c35f1bc-b065-dd72-5cdd-5187e4474410@xen.org>
Date: Wed, 18 Jan 2023 09:18:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-10-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117174358.15344-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 17/01/2023 17:43, Ayan Kumar Halder wrote:
> We have introduced a new config option to support 32 bit physical address.
> By default, it is disabled.
> ARM_PA_32 cannot be enabled on ARM_64 as the memory management unit works
> on 48bit physical addresses.

I don't understand the "cannot" here. It is possible to have a 64-bit HW 
that support only 32-bit physical address.

After your series, I also don't see any restriction in Xen to enable 
ARM_PA_32.

Whether we want to do it is a different discussion. I don't have any 
strong opinion. But the wording should be clarified.

> On ARM_32, it can be used on systems where large page address extension is
> not supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v1 - 1. No changes.
> 
>   xen/arch/arm/Kconfig                 | 9 +++++++++
>   xen/arch/arm/include/asm/page-bits.h | 2 ++
>   xen/arch/arm/include/asm/types.h     | 7 +++++++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..aeb0f7252e 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -39,6 +39,15 @@ config ACPI
>   config ARM_EFI
>   	bool
>   
> +config ARM_PA_32
> +	bool "32 bit Physical Address"
> +	depends on ARM_32
> +	default n
> +	---help---
> +
> +	  Support 32 bit physical addresses.

The description is a bit misleading. If you select N, then you can still 
still boot on HW supporting only 32-bit physical address.

It is only not clear from the description why a user may want to select it.

 From an external interface PoV, I think it would be better if we let 
the user decide how much physical address bits they want Xen to support.

In the Kconfig, this would translate as a "choice". For Arm64, there 
will only be one (48 bits) where-as Arm32 there would be two (32, 40).


For an internal interface PoV, this could still translate to select 
ARM_PA_32 (or whichever name we decide) to indicate the type of paddr_t.

> +	  If unsure, say N
> +
>   config GICV3
>   	bool "GICv3 driver"
>   	depends on !NEW_VGIC
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
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index 083acbd151..f9595b9098 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -37,9 +37,16 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)
> +typedef u32 paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PADDR_SHIFT BITS_PER_LONG
> +#define PRIpaddr PRIx32
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

