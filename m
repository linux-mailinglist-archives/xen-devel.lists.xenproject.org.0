Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67B9A499F
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822210.1236187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vQ0-0004RQ-0p; Fri, 18 Oct 2024 22:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822210.1236187; Fri, 18 Oct 2024 22:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vPz-0004PH-UW; Fri, 18 Oct 2024 22:25:59 +0000
Received: by outflank-mailman (input) for mailman id 822210;
 Fri, 18 Oct 2024 22:25:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vPy-0004PB-VW
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:25:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vPy-0006Sb-HY; Fri, 18 Oct 2024 22:25:58 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vPy-0007Rz-AU; Fri, 18 Oct 2024 22:25:58 +0000
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
	bh=p+x2eJFladDLbsN+a+86YLfuVAHBlcVQVW40+FQX8m0=; b=7IuXe0szg5/dTGivEndU7V3Opu
	R62Cp+RrZ1jhUZktsETfIr7HIht0ME3BBVQ7jURZ0aqgdVLCtA45sV2smiHcnxsJs5jhtGSEMbPYD
	r9AVjrtx/SqfvAjVhcDuiacLLbNetZokfpDJZW4xcH+yId/pgAQf5yOzVVwPjkAXTQ68=;
Message-ID: <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
Date: Fri, 18 Oct 2024 23:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> After the regions have been created, now we enable the MPU. For this we disable
> the background region so that the new memory map created for the regions take
> effect. Also, we treat all RW regions as non executable and the data cache is
> enabled.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v2 - 1. Extracted from the previous patch into a new one.
> 
> 2. Disabled background region.
> 
>   xen/arch/arm/arm64/mpu/head.S                | 29 ++++++++++++++++++--
>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
>   2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 4a21bc815c..e354f4552b 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -61,6 +61,30 @@
>       add \xb, \xb, x20       /* x20 - Phys offset */
>   .endm
>   
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch64 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + *
> + * Clobbers x0
> + *
> + */
> +FUNC_LOCAL(enable_mpu)
> +    mrs   x0, SCTLR_EL2
> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */

NIT: Can't we have a single "orr" instruction to set all the flags?

> +    dsb   sy

I still question this use of "dsb sy"...

> +    msr   SCTLR_EL2, x0
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
>   /*
>    * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>    * regions.
> @@ -68,10 +92,11 @@
>    * Inputs:
>    *   lr : Address to return to.
>    *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>    *
>    */
>   FUNC(enable_boot_cpu_mm)
> +    mov   x6, lr
>   
>       /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>       mrs   x5, MPUIR_EL2
> @@ -113,7 +138,7 @@ FUNC(enable_boot_cpu_mm)
>       beq 5f
>       prepare_xen_region x0, x1, x2, x3, x4, x5
>   
> -5:
> +5:  mov   lr, x6
>       ret
>   
>   fail:
> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> index b0c31a58ec..3769d23c80 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> @@ -15,6 +15,9 @@
>   /* MPU Protection Region Selection Register encode */
>   #define PRSELR_EL2  S3_4_C6_C2_1
>   
> +/* Backgroud region enable/disable */
> +#define SCTLR_ELx_BR    BIT(17, UL)
> +
>   #endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
>   
>   /*

Cheers,


-- 
Julien Grall

