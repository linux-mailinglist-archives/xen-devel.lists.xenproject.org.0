Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23747E2ABC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628228.979448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r038d-0001jl-CC; Mon, 06 Nov 2023 17:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628228.979448; Mon, 06 Nov 2023 17:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r038d-0001i4-8f; Mon, 06 Nov 2023 17:11:47 +0000
Received: by outflank-mailman (input) for mailman id 628228;
 Mon, 06 Nov 2023 17:11:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r038b-0001hu-IX
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:11:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r038b-0007Ji-1B; Mon, 06 Nov 2023 17:11:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.14.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r038a-0002cA-Ry; Mon, 06 Nov 2023 17:11:44 +0000
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
	bh=/tlXdg1zsTQDxNrnksF8yi1uUeG7Q24OPNiDvP4b4bU=; b=E4hkHYuJexe9W2drNZHVcgYWVc
	HPiiG8Bw1tVGudijs9Qqi+LZVqWQD7MXykafaiRmA4/0qixnGbMnuXNfhJzmNAevDEEdk8mtVbuRG
	xMBctjUSRRTVVvUSnGZt/xjhofX4QY1HVdxUwz7iMl0wGsqTTYWxpOZ5IB8iUSTHuWVY=;
Message-ID: <342f045a-0291-4f4b-9e89-db0b208a8ae1@xen.org>
Date: Mon, 6 Nov 2023 17:11:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm32: head: Introduce
 enable_{boot,secondary}_cpu_mm()
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@arm.com,
 henry.wang@arm.com, Volodymyr_Babchuk@epam.com
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
 <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 03/11/2023 17:34, Ayan Kumar Halder wrote:
> All the MMU related functionality have been clubbed together in
> enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
> booting secondary cpus.
> This is done in preparation for moving the code related to MMU in MMU specific
> file and in order to support non MMU cpus in future.
> 
> This is based on d2f8df5b3ede commit.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> 
> v1 - 1. Added a proper commit message.
> 2. Some style and other fixes suggested in v1.
> 
>   xen/arch/arm/arm32/head.S | 89 +++++++++++++++++++++++++++++----------
>   1 file changed, 67 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 2d7e690bf5..7004443798 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -201,13 +201,11 @@ past_zImage:
>   
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
>   
> -        /* Address in the runtime mapping to jump to after the MMU is enabled */
>           mov_w lr, primary_switched
> -        b     enable_mmu
> +        b     enable_boot_cpu_mm
> +
>   primary_switched:
> -        bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> @@ -249,27 +247,11 @@ GLOBAL(init_secondary)
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
> @@ -692,6 +674,69 @@ ready_to_switch:
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

r12 will also be set. I think you want to mention it (may be not in 
clobbers) with its purpose within the function as it is less obvious 
than r6.

> + */
> +enable_secondary_cpu_mm:
> +        mov   r6, lr
> +
> +        bl    create_page_tables
> +
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, 1f
> +        b     enable_mmu
> +1:
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
> +
> +        /* Return to the virtual address requested by the caller. */
> +        mov   pc, r6
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

Same here.


With that and Michal's comment addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

