Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669777CB29B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 20:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617922.961037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsSQr-0002B1-Oi; Mon, 16 Oct 2023 18:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617922.961037; Mon, 16 Oct 2023 18:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsSQr-00029B-Ls; Mon, 16 Oct 2023 18:35:13 +0000
Received: by outflank-mailman (input) for mailman id 617922;
 Mon, 16 Oct 2023 18:35:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsSQq-000295-0c
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 18:35:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsSQp-0002jK-LU; Mon, 16 Oct 2023 18:35:11 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsSQp-0000gk-EN; Mon, 16 Oct 2023 18:35:11 +0000
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
	bh=uxP634GNTzmNwu/sg68souTrEgRtRM2vRTiRWVz4iXw=; b=gKlmMTJo8Clm4zolN5ONr2Wihv
	pgs/Xc5nw9wSM7Oz+SosOMWFj8CjjwL/9gN8T7Yq3bRJYZVNSdfKPGt0ArAYEl1i+AUc9YpFnKsTZ
	2rl+Dn3DxOCVhG1Npfpzuh4I0uk2WOlXb3Q7HOfGLLDyfMWPWE6hYXc5MycLfoerA1gw=;
Message-ID: <f45a3278-a136-4a46-a4a6-4df9b5c6c5ee@xen.org>
Date: Mon, 16 Oct 2023 19:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v1 2/4] xen/arm32: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, wei.chen@arm.com,
 penny.zheng@arm.com, henry.wang@arm.com
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
 <20230911135942.791206-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230911135942.791206-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/09/2023 14:59, Ayan Kumar Halder wrote:
> This is based on:-
> "[PATCH v6 01/13] xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()"
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg151918.html

Most of the explanation in that commit message doesn't apply here. You 
also move call like setup_fixmap without explaining why.

Also, if you want to refer to the arm64 patch in the commit message (I 
think it would be better after ---), then it is best to point ot the now 
committed patch.

>
> This is being done for Arm32 as MPU support will be added for Arm32 as well.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/arm32/head.S | 90 +++++++++++++++++++++++++++++----------
>   1 file changed, 67 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 057c44a5a2..c0c425eac6 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -201,13 +201,10 @@ past_zImage:
>   
>           bl    check_cpu_mode
>           bl    cpu_init

NIT: I would add a newline to make it clearer.

> -        bl    create_page_tables
> +        ldr   lr, =primary_switched

The existing code was using 'mov_w ...' to avoid load from memory. Can 
you explain why you switched to 'ldr'?

> +        b     enable_boot_cpu_mm
>   
> -        /* Address in the runtime mapping to jump to after the MMU is enabled */
> -        mov_w lr, primary_switched
> -        b     enable_mmu
>   primary_switched:
> -        bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> @@ -249,27 +246,11 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
>   
> -        /* Address in the runtime mapping to jump to after the MMU is enabled */
>           mov_w lr, secondary_switched
> -        b     enable_mmu
> -secondary_switched:
> -        /*
> -         * Non-boot CPUs need to move on to the proper pagetables, which were
> -         * setup in prepare_secondary_mm.
> -         *
> -         * XXX: This is not compliant with the Arm Arm.
> -         */
> -        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
> -        ldrd  r4, r5, [r4]           /* Actual value */
> -        dsb
> -        mcrr  CP64(r4, r5, HTTBR)
> -        dsb
> -        isb
> -        flush_xen_tlb_local r0
> -        pt_enforce_wxn r0
> +        b     enable_secondary_cpu_mm
>   
> +secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> @@ -692,6 +673,69 @@ ready_to_switch:
>           mov   pc, lr
>   ENDPROC(switch_to_runtime_mapping)
>   
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers r0 - r6
> + */
> +enable_secondary_cpu_mm:
> +        mov   r6, lr

NIT:  I would add a newline to make it clearer.

> +        bl    create_page_tables
> +

I think the comment on top of "mov_w lr, secondary_switched" should be 
moved here.

> +        mov_w lr, secondary_cpu_mmu_on
> +        b     enable_mmu
> +secondary_cpu_mmu_on:

I would prefer if we use 1 to avoid introducing local label.

> +        /*
> +         * Non-boot CPUs need to move on to the proper pagetables, which were
> +         * setup in prepare_secondary_mm.
> +         *
> +         * XXX: This is not compliant with the Arm Arm.
> +         */
> +        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
> +        ldrd  r4, r5, [r4]           /* Actual value */
> +        dsb
> +        mcrr  CP64(r4, r5, HTTBR)
> +        dsb
> +        isb
> +        flush_xen_tlb_local r0
> +        pt_enforce_wxn r0
> +        mov   lr, r6
> +
> +        /* Return to the virtual address requested by the caller. */
> +        mov   pc, lr

The above two instructions can be combined to:


/* Return to the virtual address requested by the caller (r6). */
mov pc, r6

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
> + * Clobbers r0 - r6
> + */
> +enable_boot_cpu_mm:
> +        mov   r6, lr

NIT:  I would add a newline to make it clearer.

> +        bl    create_page_tables
> +
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, boot_cpu_mmu_on
> +        b     enable_mmu
> +boot_cpu_mmu_on:

Same as the lable secondary_cpu_mmu_on.

> +        bl    setup_fixmap
> +
> +        mov   lr, r6
> +
> +        /* Return to the virtual address requested by the caller. */
> +        mov   pc, lr
In this case the 3 instructions can be replaced to:

mov lr, r6
b setup_fixmap

> +ENDPROC(enable_boot_cpu_mm)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry

Cheers,

-- 
Julien Grall

