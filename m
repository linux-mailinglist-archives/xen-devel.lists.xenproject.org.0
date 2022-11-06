Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F239061E5D4
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 21:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438949.692838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orluI-00029O-8v; Sun, 06 Nov 2022 20:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438949.692838; Sun, 06 Nov 2022 20:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orluI-00025m-5Y; Sun, 06 Nov 2022 20:06:14 +0000
Received: by outflank-mailman (input) for mailman id 438949;
 Sun, 06 Nov 2022 20:06:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orluG-00025g-0H
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 20:06:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orluF-0007uH-NA; Sun, 06 Nov 2022 20:06:11 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orluF-0004nN-H2; Sun, 06 Nov 2022 20:06:11 +0000
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
	bh=wMRI6Gr6jUh/CzIymT6d3sT/rB8KayIMymPojAb8NRY=; b=NyzJLu5aLPdNGkUTMtFZDYwNlL
	93ZXsllsOrKrxFqX5dragC6+7SYOYKkWu7s9l8IQLaj4w02woV8MeV+CrqNMzWPUtvTy5KDGGPRs/
	K8AgI+eCOHaK3bKKrRogpikbINKveyKfYNPKx9eSEK+rTSdzN/lv641ER7BVxMK6sGAY=;
Message-ID: <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
Date: Sun, 6 Nov 2022 20:06:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
In-Reply-To: <20221104100741.2176307-9-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> There are lots of MMU specific code in head.S. This code will not
> be used in MPU systems. If we use #ifdef to gate them, the code
> will become messy and hard to maintain. So we move MMU related
> code to head_mmu.S, and keep common code still in head.S.

I am afraid that you can't simply move the MMU code out of head.S 
because this will break Xen when running using the identity map.

This is because we only map the first 4KB of Xen with PA == VA. At the 
moment, we guarantee it by having everything that needs to be used in 
the identity mapping before _end_boot and checking at link time if this 
fits in 4KB.

Now that you moved the MMU code outside of head.S. We need to find a 
different way to guarantee it. One way to do it would be to create a 
section that would be used for everything that needs to be identity mapped.

> 
> As we need to access "fail" and "puts" functions out of assembly
> file, so we have to export them in this patch. And the assembly
> macros: adr_l and load_paddr will be used by MMU and MPU later,
> so we move them to macros.h.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

In general, the first signed-off should match the author. So who is who 
here?

> ---
>   xen/arch/arm/arm64/Makefile             |   3 +
>   xen/arch/arm/arm64/head.S               | 407 +-----------------------
>   xen/arch/arm/arm64/head_mmu.S           | 364 +++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/macros.h |  52 ++-
>   4 files changed, 432 insertions(+), 394 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/head_mmu.S
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6d507da0d4..22da2f54b5 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -8,6 +8,9 @@ obj-y += domctl.o
>   obj-y += domain.o
>   obj-y += entry.o
>   obj-y += head.o
> +ifneq ($(CONFIG_HAS_MPU),y) > +obj-y += head_mmu.o
> +endif
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>   obj-y += smc.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index ccedf20dc7..d9a8da9120 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -25,17 +25,6 @@
>   #include <efi/efierr.h>
>   #include <asm/arm64/efibind.h>
>   
> -#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> -#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
> -#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> -#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
> -#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
> -
> -/* Convenience defines to get slot used by Xen mapping. */
> -#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
> -#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
> -#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
> -
>   #define __HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
>   
>   #define __HEAD_FLAG_PHYS_BASE   1
> @@ -82,73 +71,22 @@
>    *  x30 - lr
>    */
>   
> -#ifdef CONFIG_EARLY_PRINTK
> -/*
> - * Macro to print a string to the UART, if there is one.
> - *
> - * Clobbers x0 - x3
> - */
> -#define PRINT(_s)          \
> -        mov   x3, lr ;     \
> -        adr   x0, 98f ;    \
> -        bl    puts    ;    \
> -        mov   lr, x3 ;     \
> -        RODATA_STR(98, _s)
> +.section .text.header, "ax", %progbits
> +/*.aarch64*/

The patch is already quite difficult to read. So I would rather prefer 
if the indentation is changed separately.

Furthermore, I think it would be best if the functions moved in the 
header are done separately to help checking (I would be able to diff the 
source with the destination more easily).

>   
>   /*
> - * Macro to print the value of register \xb
> + * Kernel startup entry point.
> + * ---------------------------

Same here about the indentation. I will not comment everywhere where the 
indentation was changed. So please look at it.

[...]

> -/*
> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
> - * fixmap table in the page tables.
> - *
> - * The fixmap cannot be mapped in create_page_tables because it may
> - * clash with the 1:1 mapping.
> - *
> - * Inputs:
> - *   x20: Physical offset
> - *   x23: Early UART base physical address
> - *
> - * Clobbers x0 - x3
> - */
> -setup_fixmap:
> -#ifdef CONFIG_EARLY_PRINTK
> -        /* Add UART to the fixmap table */
> -        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> -        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
> -#endif
> -        /* Map fixmap into boot_second */
> -        ldr   x0, =FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
> -        /* Ensure any page table updates made above have occurred. */
> -        dsb   nshst
> -
> -        ret
> -ENDPROC(setup_fixmap)
> -
>   /*
>    * Setup the initial stack and jump to the C world
>    *
> @@ -810,41 +458,14 @@ launch:
>   ENDPROC(launch)
>   
>   /* Fail-stop */
> -fail:   PRINT("- Boot failed -\r\n")
> +ENTRY(fail)

This name is a bit too generic to be exposed. But it would be better to 
duplicate it.

Cheers,

-- 
Julien Grall

