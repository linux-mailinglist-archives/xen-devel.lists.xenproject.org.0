Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C75775E56
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580989.909501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qThqu-0002yz-Uv; Wed, 09 Aug 2023 11:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580989.909501; Wed, 09 Aug 2023 11:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qThqu-0002vy-RM; Wed, 09 Aug 2023 11:59:48 +0000
Received: by outflank-mailman (input) for mailman id 580989;
 Wed, 09 Aug 2023 11:59:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qThqt-0002vs-FC
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:59:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qThqs-0007Hq-UG; Wed, 09 Aug 2023 11:59:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qThqs-0004tZ-Lt; Wed, 09 Aug 2023 11:59:46 +0000
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
	bh=ruK1AP6TCGwvuXlVRjH6SGh3dbWYvlB5t99ppl+Ov1E=; b=L2aJJUYeeO9lsTXf8cjVA4Ujpj
	pGNrXUz4md1hyeJFJrY690BeKKqzVlyss9flT6ZcD1t1B/M3r7M+p/Vnv4iDMlOA5QX3nE1KOSVJ9
	8Vn6Bhx99qjq1LY5tT4TZe49ScI1pVsihxMlK9eeEXhdHVPBGKm2Xlwb7IVDbjoVCQG8=;
Message-ID: <d1e7a6b0-d3a6-4d85-a26c-019fc67ba463@xen.org>
Date: Wed, 9 Aug 2023 12:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

Title: NIT: Add () after _mm to stay consistent with the rest.

On 01/08/2023 04:44, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called on the boot CPU to remove all 1:1 mapping.
> 
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
> 
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
> enable_secondary_cpu_mm() for secondary CPUs in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v4:
> - Clarify remove_identity_mapping() is called on boot CPU and keep
>    the function/proc format consistent in commit msg.
> - Drop inaccurate (due to the refactor) in-code comment.
> - Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
> - Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
> - Call "fail" for unreachable code.
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S | 89 ++++++++++++++++++++++++++++++---------
>   1 file changed, 70 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 31cdb54d74..2af9f974d5 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -313,21 +313,11 @@ real_start_efi:
>   
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -        bl    enable_mmu
>   
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =primary_switched
> -        br    x0
> +        ldr   lr, =primary_switched
> +        b     enable_boot_cpu_mm
> +
>   primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>           bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -372,13 +362,10 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -        bl    enable_mmu
>   
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =secondary_switched
> -        br    x0
> +        ldr   lr, =secondary_switched
> +        b     enable_secondary_cpu_mm
> +
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -737,6 +724,70 @@ enable_mmu:
>           ret
>   ENDPROC(enable_mmu)
>   
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_secondary_cpu_mm:
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* return to secondary_switched */

Technically, you will return to the virtual address set in 'lr'. This is 
'secondary_switched' today but this could change.

So it would be better to have a more generic comment like:

Return to the virtual address requested by the caller.

> +        ret
> +ENDPROC(enable_secondary_cpu_mm)
> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_cpu_mm:
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.

Same remark here.

> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Below is supposed to be unreachable code, as "ret" in
> +         * remove_identity_mapping will use the return address in LR in advance.
> +         */
> +        b     fail

Looking at this again, I am not entirely sure how this could reached if 
remove_identity_mapping use 'ret' and you call it with 'b'. So I would 
suggest to drop it and move 'mov lr, x5' closer to 'b 
remove_identity_mapping'. So it is clearer that it will return.

> +ENDPROC(enable_boot_cpu_mm)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry

Cheers,

-- 
Julien Grall

