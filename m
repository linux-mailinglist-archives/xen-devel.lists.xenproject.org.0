Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73533673D02
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481192.745926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWSn-0006Bf-3N; Thu, 19 Jan 2023 15:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481192.745926; Thu, 19 Jan 2023 15:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWSn-00069H-0Z; Thu, 19 Jan 2023 15:04:25 +0000
Received: by outflank-mailman (input) for mailman id 481192;
 Thu, 19 Jan 2023 15:04:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIWSl-00069B-LU
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:04:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIWSl-0005LR-7m; Thu, 19 Jan 2023 15:04:23 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIWSk-0000H1-Tq; Thu, 19 Jan 2023 15:04:23 +0000
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
	bh=wxJgAXMrNU9PVYRNg3azos3+wn70c9ur0IFI73KFTE0=; b=QMks0LNKoGaIcDdV4scoUcyZl6
	pY4EJliWGWF7qvSAU9TpxVnhUhIBHEygYCH1sMew9djHdjjYMORvV3Pg5IwurKh0Tcd0Tl0w/TB/X
	GjJcQiMKM4cPdODY2WafZYpWMl0EB/Yohd/99Aq9nthyaGGXn/sP/0r6Y6wF0BK4Hd3k=;
Message-ID: <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
Date: Thu, 19 Jan 2023 15:04:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-12-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> The start-of-day Xen MPU memory region layout shall be like as follows:
> 
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> ......
> xen_mpumap[max_xen_mpumap - 2]: Xen init data
> xen_mpumap[max_xen_mpumap - 1]: Xen init text

Can you explain why the init region should be at the end of the MPU?

> 
> max_xen_mpumap refers to the number of regions supported by the EL2 MPU.
> The layout shall be compliant with what we describe in xen.lds.S, or the
> codes need adjustment.
> 
> As MMU system and MPU system have different functions to create
> the boot MMU/MPU memory management data, instead of introducing
> extra #ifdef in main code flow, we introduce a neutral name
> prepare_early_mappings for both, and also to replace create_page_tables for MMU.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/Makefile              |   2 +
>   xen/arch/arm/arm64/head.S                |  17 +-
>   xen/arch/arm/arm64/head_mmu.S            |   4 +-
>   xen/arch/arm/arm64/head_mpu.S            | 323 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu.h     |  63 +++++
>   xen/arch/arm/include/asm/arm64/sysregs.h |  49 ++++
>   xen/arch/arm/mm_mpu.c                    |  48 ++++
>   xen/arch/arm/xen.lds.S                   |   4 +
>   8 files changed, 502 insertions(+), 8 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/head_mpu.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>   create mode 100644 xen/arch/arm/mm_mpu.c
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 22da2f54b5..438c9737ad 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -10,6 +10,8 @@ obj-y += entry.o
>   obj-y += head.o
>   ifneq ($(CONFIG_HAS_MPU),y)
>   obj-y += head_mmu.o
> +else
> +obj-y += head_mpu.o
>   endif
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 782bd1f94c..145e3d53dc 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -68,9 +68,9 @@
>    *  x24 -
>    *  x25 -
>    *  x26 - skip_zero_bss (boot cpu only)
> - *  x27 -
> - *  x28 -
> - *  x29 -
> + *  x27 - region selector (mpu only)
> + *  x28 - prbar (mpu only)
> + *  x29 - prlar (mpu only) >    *  x30 - lr
>    */
>   
> @@ -82,7 +82,7 @@
>    * ---------------------------
>    *
>    * The requirements are:
> - *   MMU = off, D-cache = off, I-cache = on or off,
> + *   MMU/MPU = off, D-cache = off, I-cache = on or off,
>    *   x0 = physical address to the FDT blob.
>    *
>    * This must be the very first address in the loaded image.
> @@ -252,7 +252,12 @@ real_start_efi:
>   
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +
> +        /*
> +         * Create boot memory management data, pagetable for MMU systems
> +         * and memory regions for MPU systems.
> +         */
> +        bl    prepare_early_mappings
>           bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> @@ -310,7 +315,7 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +        bl    prepare_early_mappings
>           bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index 6ff13c751c..2346f755df 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -123,7 +123,7 @@
>    *
>    * Clobbers x0 - x4
>    */
> -ENTRY(create_page_tables)
> +ENTRY(prepare_early_mappings)
>           /* Prepare the page-tables for mapping Xen */
>           ldr   x0, =XEN_VIRT_START
>           create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> @@ -208,7 +208,7 @@ virtphys_clash:
>           /* Identity map clashes with boot_third, which we cannot handle yet */
>           PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
>           b     fail
> -ENDPROC(create_page_tables)
> +ENDPROC(prepare_early_mappings)
>   
>   /*
>    * Turn on the Data Cache and the MMU. The function will return on the 1:1
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> new file mode 100644
> index 0000000000..0b97ce4646
> --- /dev/null
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -0,0 +1,323 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R AArch64 MPU system.
> + */
> +
> +#include <asm/arm64/mpu.h>
> +#include <asm/early_printk.h>
> +#include <asm/page.h>
> +
> +/*
> + * One entry in Xen MPU memory region mapping table(xen_mpumap) is a structure
> + * of pr_t, which is 16-bytes size, so the entry offset is the order of 4.
> + */
> +#define MPU_ENTRY_SHIFT         0x4
> +
> +#define REGION_SEL_MASK         0xf
> +
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +
> +/*
> + * Macro to round up the section address to be PAGE_SIZE aligned
> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
> + * or in the end
> + */
> +.macro roundup_section, xb
> +        add   \xb, \xb, #(PAGE_SIZE-1)
> +        and   \xb, \xb, #PAGE_MASK
> +.endm
> +
> +/*
> + * Macro to create a new MPU memory region entry, which is a structure
> + * of pr_t,  in \prmap.
> + *
> + * Inputs:
> + * prmap:   mpu memory region map table symbol
> + * sel:     region selector
> + * prbar:   preserve value for PRBAR_EL2
> + * prlar    preserve value for PRLAR_EL2
> + *
> + * Clobbers \tmp1, \tmp2
> + *
> + */
> +.macro create_mpu_entry prmap, sel, prbar, prlar, tmp1, tmp2
> +    mov   \tmp2, \sel
> +    lsl   \tmp2, \tmp2, #MPU_ENTRY_SHIFT
> +    adr_l \tmp1, \prmap
> +    /* Write the first 8 bytes(prbar_t) of pr_t */
> +    str   \prbar, [\tmp1, \tmp2]
> +
> +    add   \tmp2, \tmp2, #8
> +    /* Write the last 8 bytes(prlar_t) of pr_t */
> +    str   \prlar, [\tmp1, \tmp2]

Any particular reason to not use 'stp'?

Also, AFAICT, with data cache disabled. But at least on ARMv8-A, the 
cache is never really off. So don't need some cache maintainance?

FAOD, I know the existing MMU code has the same issue. But I would 
rather prefer if the new code introduced is compliant to the Arm Arm.

> +.endm
> +
> +/*
> + * Macro to store the maximum number of regions supported by the EL2 MPU
> + * in max_xen_mpumap, which is identified by MPUIR_EL2.
> + *
> + * Outputs:
> + * nr_regions: preserve the maximum number of regions supported by the EL2 MPU
> + *
> + * Clobbers \tmp1
> + * > + */

Are you going to have multiple users? If not, then I would prefer if 
this is folded in the only caller.

> +.macro read_max_el2_regions, nr_regions, tmp1
> +    load_paddr \tmp1, max_xen_mpumap

I would rather prefer if we restrict the use of global while the MMU if 
off (see why above).

> +    mrs   \nr_regions, MPUIR_EL2
> +    isb

What's that isb for?

> +    str   \nr_regions, [\tmp1]
> +.endm
> +
> +/*
> + * Macro to prepare and set a MPU memory region
> + *
> + * Inputs:
> + * base:        base address symbol (should be page-aligned)
> + * limit:       limit address symbol
> + * sel:         region selector
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be REGION_NORMAL_PRLAR
> + *
> + * Clobber \tmp1

This macro will also clobber x27, x28, x29.

> + *
> + */
> +.macro prepare_xen_region, base, limit, sel, prbar, prlar, tmp1, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    load_paddr \prbar, \base
> +    and   \prbar, \prbar, #MPU_REGION_MASK
> +    mov   \tmp1, #\attr_prbar
> +    orr   \prbar, \prbar, \tmp1
> +
> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
> +    load_paddr \prlar, \limit
> +    /* Round up limit address to be PAGE_SIZE aligned */
> +    roundup_section \prlar
> +    /* Limit address should be inclusive */
> +    sub   \prlar, \prlar, #1
> +    and   \prlar, \prlar, #MPU_REGION_MASK
> +    mov   \tmp1, #\attr_prlar
> +    orr   \prlar, \prlar, \tmp1
> +
> +    mov   x27, \sel
> +    mov   x28, \prbar
> +    mov   x29, \prlar
> +    /*
> +     * x27, x28, x29 are special registers designed as
> +     * inputs for function write_pr
> +     */
> +    bl    write_pr
> +.endm
> +
> +.section .text.idmap, "ax", %progbits
> +
> +/*
> + * ENTRY to configure a EL2 MPU memory region
> + * ARMv8-R AArch64 at most supports 255 MPU protection regions.
> + * See section G1.3.18 of the reference manual for ARMv8-R AArch64,
> + * PRBAR<n>_EL2 and PRLAR<n>_EL2 provides access to the EL2 MPU region
> + * determined by the value of 'n' and PRSELR_EL2.REGION as
> + * PRSELR_EL2.REGION<7:4>:n.(n = 0, 1, 2, ... , 15)
> + * For example to access regions from 16 to 31 (0b10000 to 0b11111):
> + * - Set PRSELR_EL2 to 0b1xxxx
> + * - Region 16 configuration is accessible through PRBAR0_EL2 and PRLAR0_EL2
> + * - Region 17 configuration is accessible through PRBAR1_EL2 and PRLAR1_EL2
> + * - Region 18 configuration is accessible through PRBAR2_EL2 and PRLAR2_EL2
> + * - ...
> + * - Region 31 configuration is accessible through PRBAR15_EL2 and PRLAR15_EL2
> + *
> + * Inputs:
> + * x27: region selector
> + * x28: preserve value for PRBAR_EL2
> + * x29: preserve value for PRLAR_EL2
> + *
> + */
> +ENTRY(write_pr)

AFAICT, this function would not be necessary if the index for the init 
sections were hardcoded.

So I would like to understand why the index cannot be hardcoded.

> +    msr   PRSELR_EL2, x27
> +    dsb   sy

What is this 'dsb' for? Also why 'sy'?

> +    and   x27, x27, #REGION_SEL_MASK
> +    cmp   x27, #0
> +    bne   1f
> +    msr   PRBAR0_EL2, x28
> +    msr   PRLAR0_EL2, x29
> +    b     out
> +1:
> +    cmp   x27, #1
> +    bne   2f
> +    msr   PRBAR1_EL2, x28
> +    msr   PRLAR1_EL2, x29
> +    b     out
> +2:
> +    cmp   x27, #2
> +    bne   3f
> +    msr   PRBAR2_EL2, x28
> +    msr   PRLAR2_EL2, x29
> +    b     out
> +3:
> +    cmp   x27, #3
> +    bne   4f
> +    msr   PRBAR3_EL2, x28
> +    msr   PRLAR3_EL2, x29
> +    b     out
> +4:
> +    cmp   x27, #4
> +    bne   5f
> +    msr   PRBAR4_EL2, x28
> +    msr   PRLAR4_EL2, x29
> +    b     out
> +5:
> +    cmp   x27, #5
> +    bne   6f
> +    msr   PRBAR5_EL2, x28
> +    msr   PRLAR5_EL2, x29
> +    b     out
> +6:
> +    cmp   x27, #6
> +    bne   7f
> +    msr   PRBAR6_EL2, x28
> +    msr   PRLAR6_EL2, x29
> +    b     out
> +7:
> +    cmp   x27, #7
> +    bne   8f
> +    msr   PRBAR7_EL2, x28
> +    msr   PRLAR7_EL2, x29
> +    b     out
> +8:
> +    cmp   x27, #8
> +    bne   9f
> +    msr   PRBAR8_EL2, x28
> +    msr   PRLAR8_EL2, x29
> +    b     out
> +9:
> +    cmp   x27, #9
> +    bne   10f
> +    msr   PRBAR9_EL2, x28
> +    msr   PRLAR9_EL2, x29
> +    b     out
> +10:
> +    cmp   x27, #10
> +    bne   11f
> +    msr   PRBAR10_EL2, x28
> +    msr   PRLAR10_EL2, x29
> +    b     out
> +11:
> +    cmp   x27, #11
> +    bne   12f
> +    msr   PRBAR11_EL2, x28
> +    msr   PRLAR11_EL2, x29
> +    b     out
> +12:
> +    cmp   x27, #12
> +    bne   13f
> +    msr   PRBAR12_EL2, x28
> +    msr   PRLAR12_EL2, x29
> +    b     out
> +13:
> +    cmp   x27, #13
> +    bne   14f
> +    msr   PRBAR13_EL2, x28
> +    msr   PRLAR13_EL2, x29
> +    b     out
> +14:
> +    cmp   x27, #14
> +    bne   15f
> +    msr   PRBAR14_EL2, x28
> +    msr   PRLAR14_EL2, x29
> +    b     out
> +15:
> +    msr   PRBAR15_EL2, x28
> +    msr   PRLAR15_EL2, x29
> +out:
> +    isb

What is this 'isb' for?

> +    ret
> +ENDPROC(write_pr)
> +
> +/*
> + * Static start-of-day Xen EL2 MPU memory region layout.
> + *
> + *     xen_mpumap[0] : Xen text
> + *     xen_mpumap[1] : Xen read-only data
> + *     xen_mpumap[2] : Xen read-only after init data
> + *     xen_mpumap[3] : Xen read-write data
> + *     xen_mpumap[4] : Xen BSS
> + *     ......
> + *     xen_mpumap[max_xen_mpumap - 2]: Xen init data
> + *     xen_mpumap[max_xen_mpumap - 1]: Xen init text
> + *
> + * Clobbers x0 - x6
> + *
> + * It shall be compliant with what describes in xen.lds.S, or the below
> + * codes need adjustment.
> + * It shall also follow the rules of putting fixed MPU memory region in
> + * the front, and the others in the rear, which, here, mainly refers to
> + * boot-only region, like Xen init text region.
> + */
> +ENTRY(prepare_early_mappings)
> +    /* stack LR as write_pr will be called later like nested function */
> +    mov   x6, lr
> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    prepare_xen_region _stext, _etext, x0, x1, x2, x3, attr_prbar=REGION_TEXT_PRBAR
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4

You always seem to call prepare_xen_region and create_mpu_entry. Can 
they be combined?

Also, will the first parameter of create_mpu_entry always be xen_mpumap? 
If so, I will remove it from the parameter.


[...]

> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index bc45ea2c65..79965a3c17 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -91,6 +91,8 @@ SECTIONS
>         __ro_after_init_end = .;
>     } : text
>   
> +  . = ALIGN(PAGE_SIZE);

Why do you need this ALIGN?

> +  __data_begin = .;
>     .data.read_mostly : {
>          /* Exception table */
>          __start___ex_table = .;
> @@ -157,7 +159,9 @@ SECTIONS
>          *(.altinstr_replacement)

I know you are not using alternative instructions yet. But, you should 
make sure they are included. So I think rather than introduce 
__init_data_begin, you want to use "_einitext" for the start of the 
"Init data" section.

>     } :text
>     . = ALIGN(PAGE_SIZE);
> +

Spurious?

>     .init.data : {
> +       __init_data_begin = .;            /* Init data */
>          *(.init.rodata)
>          *(.init.rodata.*)
>   

Cheers,

-- 
Julien Grall

