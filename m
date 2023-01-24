Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C47967A1EB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 19:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483691.750008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKORa-0000Ai-MV; Tue, 24 Jan 2023 18:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483691.750008; Tue, 24 Jan 2023 18:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKORa-00007y-It; Tue, 24 Jan 2023 18:54:54 +0000
Received: by outflank-mailman (input) for mailman id 483691;
 Tue, 24 Jan 2023 18:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKORZ-00007s-B6
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 18:54:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKORY-00025e-TI; Tue, 24 Jan 2023 18:54:52 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKORY-0001Rv-MS; Tue, 24 Jan 2023 18:54:52 +0000
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
	bh=qiKkbjNHba8n4ibZQ1qefH3703iGasc0Lc7/wN4aHn0=; b=nfoSOeuZ1gqyRWoDjv+JqC1q5O
	zxbi04sZpXfUMJs3lPfpSicRJbZgr8HSs7WoGEA1fDDburKwQ9PnZoww7z7wSRNqw50qDL8wKT+vY
	ZPoqTYdpvccfGOnoesyeCK4pvo8JQnh4dEs4KZJc04TirYlBEft9aWAz4BXY4VIfPDVA=;
Message-ID: <af8cec04-9817-0830-d989-b7453abdd931@xen.org>
Date: Tue, 24 Jan 2023 18:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/40] xen/mpu: introduce helpers for MPU enablement
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-13-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-13-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> We need a new helper for Xen to enable MPU in boot-time.
> The new helper is semantically consistent with the original enable_mmu.
> 
> If the Background region is enabled, then the MPU uses the default memory
> map as the Background region for generating the memory
> attributes when MPU is disabled.
> Since the default memory map of the Armv8-R AArch64 architecture is
> IMPLEMENTATION DEFINED, we always turn off the Background region.

You are saying this. But I don't see any code below clearing 
SCTLR_EL2.BR. Can you clarify?

> 
> In this patch, we also introduce a neutral name enable_mm for
> Xen to enable MMU/MPU. This can help us to keep one code flow
> in head.S

NIT: Missing full stop.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/head.S     |  5 +++--
>   xen/arch/arm/arm64/head_mmu.S |  4 ++--
>   xen/arch/arm/arm64/head_mpu.S | 19 +++++++++++++++++++
>   3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 145e3d53dc..7f3f973468 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -258,7 +258,8 @@ real_start_efi:
>            * and memory regions for MPU systems.
>            */
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        /* Turn on MMU or MPU */
> +        bl    enable_mm
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =primary_switched
> @@ -316,7 +317,7 @@ GLOBAL(init_secondary)
>           bl    check_cpu_mode
>           bl    cpu_init
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        bl    enable_mm
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =secondary_switched
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index 2346f755df..b59c40495f 100644
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
> index 0b97ce4646..e2ac69b0cc 100644
> --- a/xen/arch/arm/arm64/head_mpu.S
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -315,6 +315,25 @@ ENDPROC(prepare_early_mappings)
>   
>   GLOBAL(_end_boot)
>   
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch64 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.

Please document which register you are clobberring. See the MMU code for 
examples how to do you.

> + */
> +ENTRY(enable_mm)
> +    mrs   x0, SCTLR_EL2
> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
> +    dsb   sy

Please document the reason of each dsb. In this case, it is not entirely 
clear what this is for.

> +    msr   SCTLR_EL2, x0
> +    isb

Likely for isb.

> +    ret
> +ENDPROC(enable_mm)
> +
Cheers,

-- 
Julien Grall

