Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878F747A24
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 00:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558741.873104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGoSM-00011q-K2; Tue, 04 Jul 2023 22:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558741.873104; Tue, 04 Jul 2023 22:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGoSM-0000zT-H4; Tue, 04 Jul 2023 22:25:10 +0000
Received: by outflank-mailman (input) for mailman id 558741;
 Tue, 04 Jul 2023 22:25:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGoSL-0000zL-CW
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 22:25:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGoSK-0004ml-MX; Tue, 04 Jul 2023 22:25:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGoSK-0000kw-Fz; Tue, 04 Jul 2023 22:25:08 +0000
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
	bh=XHBXrx06SoJfakVZDdkRrVGK/PyBkCUKDhPfidkHeWQ=; b=Uy1ML2TeeUC1ZF/0M1auULkqEL
	0CHN1h9dMcnSjTHrZQv87I38GU+E7jeiY+kgeCMUW+kCysm8D2wyjBNGrxBY94+WNPVWleM8d6nQq
	E39uDJV5uk47H0V1qISwa+akQ2NyDRHJeAtUrkbwOZzb2hbNi85PZm2N0t+L/VZIPkyg=;
Message-ID: <78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org>
Date: Tue, 4 Jul 2023 23:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/52] xen/mmu: extract early uart mapping from
 setup_fixmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-13-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-13-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

Title: You want to clarify that this change is arm64 only. So:

xen/arm64: mmu: ...

On 26/06/2023 04:34, Penny Zheng wrote:
> Original setup_fixmap is actually doing two seperate tasks, one is enabling
> the early UART when earlyprintk on, and the other is to set up the fixmap
> even when earlyprintk is not configured.
> 
> To be more dedicated and precise, the old function shall be split into two
> functions, setup_early_uart and new setup_fixmap.
While some of the split before would be warrant even without the MPU 
support. This one is not because there is limited point to have 3 lines 
function. So I think you want to justify based on what you plan to do 
with the MPU code.

That said, I don't think we need to introduce setup_fixmap. See below.


> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S     |  3 +++
>   xen/arch/arm/arm64/mmu/head.S | 24 +++++++++++++++++-------
>   2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index e63886b037..55a4cfe69e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -258,7 +258,10 @@ real_start_efi:
>           b     enable_boot_mm
>   
>   primary_switched:
> +        bl    setup_early_uart
> +#ifdef CONFIG_HAS_FIXMAP
>           bl    setup_fixmap
> +#endif
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 2b209fc3ce..295596aca1 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -367,24 +367,34 @@ identity_mapping_removed:
>   ENDPROC(remove_identity_mapping)
>   
>   /*
> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
> - * fixmap table in the page tables.
> - *
> - * The fixmap cannot be mapped in create_page_tables because it may
> - * clash with the 1:1 mapping.

Since commit 9d267c049d92 ("xen/arm64: Rework the memory layout"), there 
is no chance that the fixmap will clash with the 1:1 mapping. So rather 
than introducing a new function, I would move the creation of the fixmap 
in create_pagetables().

This would avoid the #ifdef CONFIG_HAS_FIXMAP in head.S.

> + * Map the UART in the fixmap (when earlyprintk is used)
>    *
>    * Inputs:
> - *   x20: Physical offset
>    *   x23: Early UART base physical address
>    *
>    * Clobbers x0 - x3
>    */
> -ENTRY(setup_fixmap)
> +ENTRY(setup_early_uart)
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Add UART to the fixmap table */
>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>           create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
> +        /* Ensure any page table updates made above have occurred. */
> +        dsb   nshst
> +
> +        ret

The 'ret' needs to be outside of the '#ifdef' block. But, in this case, 
I would prefer if we don't call setup_early_uart() when 
!CONFIG_EARLY_PRINTK in head.S

>   #endif
> +ENDPROC(setup_early_uart)
> +
> +/*
> + * Map the fixmap table in the page tables.
> + *
> + * The fixmap cannot be mapped in create_page_tables because it may
> + * clash with the 1:1 mapping.
> + *
> + * Clobbers x0 - x3
> + */
> +ENTRY(setup_fixmap)
>           /* Map fixmap into boot_second */
>           ldr   x0, =FIXMAP_ADDR(0)
>           create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3

Cheeers,

-- 
Julien Grall

