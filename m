Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD80670DC1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480001.744142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvVo-0001k9-51; Tue, 17 Jan 2023 23:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480001.744142; Tue, 17 Jan 2023 23:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvVo-0001hM-27; Tue, 17 Jan 2023 23:37:04 +0000
Received: by outflank-mailman (input) for mailman id 480001;
 Tue, 17 Jan 2023 23:37:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHvVm-0001hG-DZ
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:37:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvVm-00077R-2k; Tue, 17 Jan 2023 23:37:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvVl-0003gh-U0; Tue, 17 Jan 2023 23:37:02 +0000
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
	bh=IKfIAhQJC6HRnc793AOkK3DmG185u2zwyKSHZ5OwvUw=; b=mdy8n5csz9O7HOc9uS83OEn+Nb
	J04NUKZSwA57QNy7C79V5sIuXJAtVyPcZX0TPe7WCbjVX+7wQGGefXeeGrTCcbM3DVmQcMRGHQ96/
	1cflyo65ISDrhbBiNsFASW6A2pstCWLSmDMYtocDBrrze4N+PgR7Zh9BMP2OlaCqj3dU=;
Message-ID: <f78755d8-0b43-ebe4-4b2c-c88875347796@xen.org>
Date: Tue, 17 Jan 2023 23:37:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
In-Reply-To: <20230113052914.3845596-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> We want to reuse head.S for MPU systems, but there are some
> code implemented for MMU systems only. We will move such
> code to another MMU specific file. But before that, we will
> do some preparations in this patch to make them easier
> for reviewing:

Well, I agree that...

> 1. Fix the indentations of code comments.

... changing the indentation is better here. But...

> 2. Export some symbols that will be accessed out of file
>     scope.

... I have no idea which functions are going to be used in a separate 
file. So I think they should belong to the patch moving the code.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Your signed-off-by is missing.

> ---
> v1 -> v2:
> 1. New patch.
> ---
>   xen/arch/arm/arm64/head.S | 40 +++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 93f9b0b9d5..b2214bc5e3 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -136,22 +136,22 @@
>           add \xb, \xb, x20
>   .endm
>   
> -        .section .text.header, "ax", %progbits
> -        /*.aarch64*/
> +.section .text.header, "ax", %progbits
> +/*.aarch64*/

This change is not mentioned.

>   
> -        /*
> -         * Kernel startup entry point.
> -         * ---------------------------
> -         *
> -         * The requirements are:
> -         *   MMU = off, D-cache = off, I-cache = on or off,
> -         *   x0 = physical address to the FDT blob.
> -         *
> -         * This must be the very first address in the loaded image.
> -         * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> -         * or the initial pagetable code below will need adjustment.
> -         */
> +/*
> + * Kernel startup entry point.
> + * ---------------------------
> + *
> + * The requirements are:
> + *   MMU = off, D-cache = off, I-cache = on or off,
> + *   x0 = physical address to the FDT blob.
> + *
> + * This must be the very first address in the loaded image.
> + * It should be linked at XEN_VIRT_START, and loaded at any
> + * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> + * or the initial pagetable code below will need adjustment.
> + */
>   
>   GLOBAL(start)
>           /*
> @@ -586,7 +586,7 @@ ENDPROC(cpu_init)
>    *
>    * Clobbers x0 - x4
>    */
> -create_page_tables:
> +ENTRY(create_page_tables)

I am not sure about keeping this name. Now we have create_page_tables() 
and arch_setup_page_tables().

I would conside to name it create_boot_page_tables().

>           /* Prepare the page-tables for mapping Xen */
>           ldr   x0, =XEN_VIRT_START
>           create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> @@ -680,7 +680,7 @@ ENDPROC(create_page_tables)
>    *
>    * Clobbers x0 - x3
>    */
> -enable_mmu:
> +ENTRY(enable_mmu)
>           PRINT("- Turning on paging -\r\n")
>   
>           /*
> @@ -714,7 +714,7 @@ ENDPROC(enable_mmu)
>    *
>    * Clobbers x0 - x1
>    */
> -remove_identity_mapping:
> +ENTRY(remove_identity_mapping)

Patch #14 should be before this patch. So you don't have to export 
remove_identity_mapping temporarily.

This will also avoid (transient) naming confusing with my work (see [1]).

>           /*
>            * Find the zeroeth slot used. Remove the entry from zeroeth
>            * table if the slot is not XEN_ZEROETH_SLOT.
> @@ -775,7 +775,7 @@ ENDPROC(remove_identity_mapping)
>    *
>    * Clobbers x0 - x3
>    */
> -setup_fixmap:
> +ENTRY(setup_fixmap)
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Add UART to the fixmap table */
>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> @@ -871,7 +871,7 @@ ENDPROC(init_uart)
>    * x0: Nul-terminated string to print.
>    * x23: Early UART base address
>    * Clobbers x0-x1 */
> -puts:
> +ENTRY(puts)

This name is a bit too generic to be globally exported. It is also now 
quite confusing because we have "early_puts" and "puts".

I would consider to name it asm_puts(). It is still not great but 
hopefully it would give a hint that should be call from assembly code.

>           early_uart_ready x23, 1
>           ldrb  w1, [x0], #1           /* Load next char */
>           cbz   w1, 1f                 /* Exit on nul */

Cheers,

[1] https://lore.kernel.org/all/20230113101136.479-13-julien@xen.org/

-- 
Julien Grall

