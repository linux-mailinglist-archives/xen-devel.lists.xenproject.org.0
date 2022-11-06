Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7E61E604
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 21:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438970.692870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormgk-000121-Jh; Sun, 06 Nov 2022 20:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438970.692870; Sun, 06 Nov 2022 20:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormgk-0000zV-H2; Sun, 06 Nov 2022 20:56:18 +0000
Received: by outflank-mailman (input) for mailman id 438970;
 Sun, 06 Nov 2022 20:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormgj-0000zP-Bi
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 20:56:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormgi-0000cc-6l; Sun, 06 Nov 2022 20:56:16 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormgi-0006Z3-0e; Sun, 06 Nov 2022 20:56:16 +0000
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
	bh=Ykobt1IReiaxgDo/u6xr7n5pDvpOSSLl0q1tIiQMGxU=; b=RqXXrxlPpCCyLf61MkxjiYioGq
	8NPdg36FXhoCiAT7TjsBsPuWXnipH7ckH6YUcGxPpKxcMEXXNYtfdBbdXzShWWGbjxH1HchKfMAmw
	xq7JvvkyXTIXtmY79OgSPJn7ri4qqL0DlcPJrxMsYKKNQ/e2ae4k3Teef6rvPNyoEyh4=;
Message-ID: <54d6e747-c791-c321-3c75-87613393d789@xen.org>
Date: Sun, 6 Nov 2022 20:56:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-11-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
In-Reply-To: <20221104100741.2176307-11-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> We need some helpers for Xen to enable/disable MPU in boot-time
> and runtime. For MPU enable helper, we know that it's an
> essential requirement of MPU system. But for MPU disable,
> we need to use it for some special situations. For example,
> in the progress of tranferring from boot-time to runtime,
> we need to update the MPU protection regions configuration,
> but we can't modify an MPU protection region if there is some
> data accessed by Xen. But in boot-time all of Xen text, data
> and BSS are in one MPU protection region, if Xen want to update
> this protection region, above restriction will be triggered.

This raises the following question: Why can't we create the split 
regions right now?

In particular, disabling the MMU/Cache is fairly risky because you need 
to ensure that anything in the cache you care about have been written 
back to the RAM).

> So in this situation, we need to disable the whole MPU to update
> the protection regions.
> 
> In these helper, enable/disable MPU will also enable/disable
> the D-cache. There are two reasons for it:
> 1. Make the function semantic be consistent with enable_mmu.
>     For MMU systems, enable_mmu will turn MMU and D-Cache at
>     the same time.
> 2. When MPU is disabled, the MPU background attributes will
>     be used. On some platforms, the background will treat all
>     memory as device memory. The access to device memory will
>     bypass the cache, even if the C bit is enabled in SCTLR.
>     To avoid this implicit behavior, we disable cache with MPU
>     explicitly to tell user that when MPU is disabled, the
>     memory access is uncacheable.
> 
> In this patch, we also introduce a neutral name enable_mm for
> Xen to enable MMU/MPU. This can help us to keep one code flow
> in head.S
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/arm64/head.S     |  5 +++--
>   xen/arch/arm/arm64/head_mmu.S |  4 ++--
>   xen/arch/arm/arm64/head_mpu.S | 35 +++++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 6c1a5f74a1..228f01db69 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -255,7 +255,8 @@ real_start_efi:
>            * and protection regions for MPU systems.
>            */
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        /* Turn on MMU or MPU */
> +        bl    enable_mm
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =primary_switched
> @@ -313,7 +314,7 @@ GLOBAL(init_secondary)
>           bl    check_cpu_mode
>           bl    cpu_init
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        bl    enable_mm
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =secondary_switched
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index fc64819a98..b542755bd2 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -217,7 +217,7 @@ ENDPROC(prepare_early_mappings)
>    *
>    * Clobbers x0 - x3
>    */
> -ENTRY(enable_mmu)
> +ENTRY(enable_mm)
>           PRINT("- Turning on paging -\r\n")
>   
>           /*
> @@ -239,7 +239,7 @@ ENTRY(enable_mmu)
>           msr   SCTLR_EL2, x0          /* now paging is enabled */
>           isb                          /* Now, flush the icache */
>           ret
> -ENDPROC(enable_mmu)
> +ENDPROC(enable_mm)
>   
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> index f60611b556..5a1b03e293 100644
> --- a/xen/arch/arm/arm64/head_mpu.S
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -68,3 +68,38 @@ ENTRY(prepare_early_mappings)
>   
>       ret
>   ENDPROC(prepare_early_mappings)
> +
> +/*
> + * Enable EL2 MPU and data cache. Because we will disable cache
> + * with MPU at the same time, in accordance with that, we have
> + * to enable cache with MPU at the same time in this function.
> + * When MPU is disabled, the MPU background attributes will
> + * be used. On some platform, the background will treat all
> + * memory as IO memory.

I was under the impression that all access would be treated as Device 
Memory when the MMU is off. Isn't it the case for the MPU?

Also, I think the correct wording is "device memory" rather than "IO 
memory".

> The access to IO memory will bypass

Ditto.

> + * the cache, even you have enabled the C bit in SCTLR.
> + * To avoid this implicit behavior, we disable cache with MPU
> + * explicitly to tell user that when MPU is disabled, the memory
> + * access is uncacheable.
> + */
> +ENTRY(enable_mm)
> +    mrs   x0, SCTLR_EL2
> +    mov   x1, #(SCTLR_Axx_ELx_M | SCTLR_Axx_ELx_C)
> +    /* Enable EL2 MPU and D-cache */
> +    orr   x0, x0, x1
> +    dsb   sy
> +    msr   SCTLR_EL2, x0
> +    isb
> +    ret
> +ENDPROC(enable_mm)
> +
> +/* Disable MPU system, including data cache. */
> +ENTRY(disable_mm)

I would rather not introduce this function until there is a caller. This 
is because, I believe, there are some assumptions on the state of the 
cache before we can turn off the MMU. So I would like to see the caller 
in order to assess whether this function makes sense.

Cheers,

-- 
Julien Grall

