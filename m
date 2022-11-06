Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D853561E5FB
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 21:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438964.692860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormXk-0007mz-Ot; Sun, 06 Nov 2022 20:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438964.692860; Sun, 06 Nov 2022 20:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormXk-0007kh-Lt; Sun, 06 Nov 2022 20:47:00 +0000
Received: by outflank-mailman (input) for mailman id 438964;
 Sun, 06 Nov 2022 20:47:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormXj-0007kb-US
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 20:46:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormXj-0000Sw-J8; Sun, 06 Nov 2022 20:46:59 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormXj-0006HC-Db; Sun, 06 Nov 2022 20:46:59 +0000
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
	bh=6i5oLzJJB2aP/cTBYp+RXXVVkjdeHWLo6CfCarurGkA=; b=pll1RUk3nogziUnGuhbR+tIu1d
	tTemqAtUiAcfhkEY+TFr16sicNjiN8rSI2LZ9+4HHSrGSLsQm0d2cR3XSDE3fy7BryD5gBrXFe4Iv
	rgmrLjohIxI4hJCu6+PfMfZx9qS8oIFr7QBWAXfr2/1BVRn7xaiYbGmQHLzZ8E+OuoLE=;
Message-ID: <f83fdce2-b16e-9ef7-e3b8-d62641907aff@xen.org>
Date: Sun, 6 Nov 2022 20:46:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-10-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 09/11] xen/arm64: create boot-time MPU protection
 regions
In-Reply-To: <20221104100741.2176307-10-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Like boot-time page table in MMU system, we need a boot-time
> MPU protection region configuration in MPU system so Xen can
> fetch code and data from normal memory.
> 
> This operation need to access Armv8-R MPU system registers, but
> these system registers are not supported in GCC version < 11.
> So we have to encode these Armv8-R MPU system registers in header
> file explicitly.
> 
> As MMU system and MPU system have different functions to create
> the boot MMU/MPU data, this will introduce extra #ifdef in code
> flow, so we introduce a neutral name prepare_early_mappings to
> replace create_page_tables for MMU and MPU.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

If Penny is the original author, then her signed-off-by should be first.

> ---
>   xen/arch/arm/arm64/Makefile              |  2 +
>   xen/arch/arm/arm64/head.S                | 13 ++--
>   xen/arch/arm/arm64/head_mmu.S            |  4 +-
>   xen/arch/arm/arm64/head_mpu.S            | 70 +++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu.h     | 13 ++++
>   xen/arch/arm/include/asm/arm64/sysregs.h | 89 ++++++++++++++++++++++++
>   6 files changed, 185 insertions(+), 6 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/head_mpu.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
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
> index d9a8da9120..6c1a5f74a1 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -79,12 +79,12 @@
>    * ---------------------------
>    *
>    * The requirements are:
> - *   MMU = off, D-cache = off, I-cache = on or off,
> + *   MMU/MPU = off, D-cache = off, I-cache = on or off,
>    *   x0 = physical address to the FDT blob.
>    *
>    * This must be the very first address in the loaded image.
>    * It should be linked at XEN_VIRT_START, and loaded at any
> - * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> + * 4K-aligned address. All of text+data+bss must fit in 2MB,

The double space after the final point was valid. This is fairly common 
to use it and this is a spurious change.


>    * or the initial pagetable code below will need adjustment.
>    */
>   
> @@ -249,7 +249,12 @@ real_start_efi:
>   
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +
> +        /*
> +         * Create boot memory management data, pagetable for MMU systems
> +         * and protection regions for MPU systems.
> +         */

head.S is now meant to be generic. So I would prefer if we keep comment 
as generic as possible. IOW, anything after the first comma should be 
dropped.

> +        bl    prepare_early_mappings
>           bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> @@ -307,7 +312,7 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +        bl    prepare_early_mappings
>           bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index 1a3df81a38..fc64819a98 100644
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
> index 0000000000..f60611b556
> --- /dev/null
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Coding style:

/* SPDX ... */

> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/arm64/mpu.h>
> +#include <asm/page.h>
> +#include <asm/early_printk.h>

Headers should be included in alphabetical order.

> +
> +/*
> + * From the requirements of head.S we know that Xen image should
> + * be linked at XEN_START_ADDRESS, and all of text + data + bss
> + * must fit in 2MB. On MPU systems, XEN_START_ADDRESS is also the
> + * address that Xen image should be loaded at. So for initial MPU
> + * regions setup, we use 2MB for Xen data memory to setup boot
> + * region, or the create boot regions code below will need adjustment.
> + */
> +#define XEN_START_MEM_SIZE      0x200000

It sounds like something that should be defined in the header. Also, I 
think the size should be common between MPU and MMU.

In [1], I was going to name it XEN_VIRT_SIZE. I would be OK to remove 
"VIRT" in the name.

> +
> +/*
> + * In boot stage, we will use 1 MPU region:
> + * Region#0: Normal memory for Xen text + data + bss (2MB)
> + */

Are we only going to modify the MPU in head.S? If not, then I would 
define the layout in config_mpu.h so there are a single point where you 
can read how this works.

> +#define BOOT_NORMAL_REGION_IDX  0x0
> +
> +/* MPU normal memory attributes. */
> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */

IIUC, this means that Xen will be mapped write-executable. Is this going 
to be forever? If not, when can't we already mapped Xen properly?

> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */

To me, it feels like this should be fined outside of head.S because this 
could be re-used by other part of Xen.

> +
> +.macro write_pr, sel, prbar, prlar
> +    msr   PRSELR_EL2, \sel
> +    dsb   sy

Is it really necessary to use "sy"  here? Also, it would be good to 
explain the logic. I.e. why do you need two dsb but only one isb?

In fact, I was expecting an "isb" here than "dsb" to wait for the 
completion of the instruction.

> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb   sy
> +    isb
> +.endm
> +
> +.section .text.header, "ax", %progbits
> +
> +/*
> + * Static start-of-day EL2 MPU memory layout.
> + *
> + * It has a very simple structure, including:
> + *  - 2MB normal memory mappings of xen at XEN_START_ADDRESS, which
> + * is the address where Xen was loaded by the bootloader.

Missing details on the clobberred registers.

> + */
> +ENTRY(prepare_early_mappings)
> +    /* Map Xen start memory to a normal memory region. */
> +    mov x0, #BOOT_NORMAL_REGION_IDX
> +    ldr x1, =XEN_START_ADDRESS
> +    and x1, x1, #MPU_REGION_MASK
> +    mov x3, #PRBAR_NORMAL_MEM
> +    orr x1, x1, x3

It looks like to me there are a potential for a macro to compute the 
register.

> +
> +    ldr x2, =XEN_START_ADDRESS
> +    mov x3, #(XEN_START_MEM_SIZE - 1)

XEN_START_MEM_SIZE is the maximum size of Xen. IOW, Xen may be smaller 
and you will map memory that may not be part of Xen. Therefore, you 
likely want to compute the real size to avoid mapping too much.


> +    add x2, x2, x3
> +    and x2, x2, #MPU_REGION_MASK
> +    mov x3, #PRLAR_NORMAL_MEM
> +    orr x2, x2, x3
> +
> +    /*
> +     * Write to MPU protection region:
> +     * x0 for pr_sel, x1 for prbar x2 for prlar

This is not a very useful comment because this can be inferred from the 
prototype of write_pr. What would be more interesting is to explain the 
logic within this function in the same way we do in head.S and head_mmu.S.

> +     */
> +    write_pr x0, x1, x2
> +
> +    ret
> +ENDPROC(prepare_early_mappings)
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> new file mode 100644
> index 0000000000..d209eef6db
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mpu.h: Arm Memory Protection Unit definitions.
> + */
> +
> +#ifndef __ARM64_MPU_H__
> +#define __ARM64_MPU_H__
> +
> +#define MPU_REGION_SHIFT  6
> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> +
> +#endif /* __ARM64_MPU_H__ */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 54670084c3..a596042d6c 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h

In the context of this patch, it would be better to only define the 
registers you need. If you want to define all of them, then please 
define them in a separate patch before this one.

> @@ -458,6 +458,95 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>   
> +/* System registers for AArch64 with PMSA */
> +#ifdef CONFIG_HAS_MPU

The #ifdef here seems unnecessary.

> +
> +/* EL1 MPU Protection Region Base Address Register encode */
> +#define PRBAR_EL1   S3_0_C6_C8_0
> +#define PRBAR1_EL1  S3_0_C6_C8_4
> +#define PRBAR2_EL1  S3_0_C6_C9_0
> +#define PRBAR3_EL1  S3_0_C6_C9_4
> +#define PRBAR4_EL1  S3_0_C6_C10_0
> +#define PRBAR5_EL1  S3_0_C6_C10_4
> +#define PRBAR6_EL1  S3_0_C6_C11_0
> +#define PRBAR7_EL1  S3_0_C6_C11_4
> +#define PRBAR8_EL1  S3_0_C6_C12_0
> +#define PRBAR9_EL1  S3_0_C6_C12_4
> +#define PRBAR10_EL1 S3_0_C6_C13_0
> +#define PRBAR11_EL1 S3_0_C6_C13_4
> +#define PRBAR12_EL1 S3_0_C6_C14_0
> +#define PRBAR13_EL1 S3_0_C6_C14_4
> +#define PRBAR14_EL1 S3_0_C6_C15_0
> +#define PRBAR15_EL1 S3_0_C6_C15_4
> +
> +/* EL1 MPU Protection Region Limit Address Register encode */
> +#define PRLAR_EL1   S3_0_C6_C8_1
> +#define PRLAR1_EL1  S3_0_C6_C8_5
> +#define PRLAR2_EL1  S3_0_C6_C9_1
> +#define PRLAR3_EL1  S3_0_C6_C9_5
> +#define PRLAR4_EL1  S3_0_C6_C10_1
> +#define PRLAR5_EL1  S3_0_C6_C10_5
> +#define PRLAR6_EL1  S3_0_C6_C11_1
> +#define PRLAR7_EL1  S3_0_C6_C11_5
> +#define PRLAR8_EL1  S3_0_C6_C12_1
> +#define PRLAR9_EL1  S3_0_C6_C12_5
> +#define PRLAR10_EL1 S3_0_C6_C13_1
> +#define PRLAR11_EL1 S3_0_C6_C13_5
> +#define PRLAR12_EL1 S3_0_C6_C14_1
> +#define PRLAR13_EL1 S3_0_C6_C14_5
> +#define PRLAR14_EL1 S3_0_C6_C15_1
> +#define PRLAR15_EL1 S3_0_C6_C15_5
> +
> +/* EL2 MPU Protection Region Base Address Register encode */
> +#define PRBAR_EL2   S3_4_C6_C8_0
> +#define PRBAR1_EL2  S3_4_C6_C8_4
> +#define PRBAR2_EL2  S3_4_C6_C9_0
> +#define PRBAR3_EL2  S3_4_C6_C9_4
> +#define PRBAR4_EL2  S3_4_C6_C10_0
> +#define PRBAR5_EL2  S3_4_C6_C10_4
> +#define PRBAR6_EL2  S3_4_C6_C11_0
> +#define PRBAR7_EL2  S3_4_C6_C11_4
> +#define PRBAR8_EL2  S3_4_C6_C12_0
> +#define PRBAR9_EL2  S3_4_C6_C12_4
> +#define PRBAR10_EL2 S3_4_C6_C13_0
> +#define PRBAR11_EL2 S3_4_C6_C13_4
> +#define PRBAR12_EL2 S3_4_C6_C14_0
> +#define PRBAR13_EL2 S3_4_C6_C14_4
> +#define PRBAR14_EL2 S3_4_C6_C15_0
> +#define PRBAR15_EL2 S3_4_C6_C15_4
> +
> +/* EL2 MPU Protection Region Limit Address Register encode */
> +#define PRLAR_EL2   S3_4_C6_C8_1
> +#define PRLAR1_EL2  S3_4_C6_C8_5
> +#define PRLAR2_EL2  S3_4_C6_C9_1
> +#define PRLAR3_EL2  S3_4_C6_C9_5
> +#define PRLAR4_EL2  S3_4_C6_C10_1
> +#define PRLAR5_EL2  S3_4_C6_C10_5
> +#define PRLAR6_EL2  S3_4_C6_C11_1
> +#define PRLAR7_EL2  S3_4_C6_C11_5
> +#define PRLAR8_EL2  S3_4_C6_C12_1
> +#define PRLAR9_EL2  S3_4_C6_C12_5
> +#define PRLAR10_EL2 S3_4_C6_C13_1
> +#define PRLAR11_EL2 S3_4_C6_C13_5
> +#define PRLAR12_EL2 S3_4_C6_C14_1
> +#define PRLAR13_EL2 S3_4_C6_C14_5
> +#define PRLAR14_EL2 S3_4_C6_C15_1
> +#define PRLAR15_EL2 S3_4_C6_C15_5
> +
> +/* MPU Protection Region Enable Register encode */
> +#define PRENR_EL1 S3_0_C6_C1_1
> +#define PRENR_EL2 S3_4_C6_C1_1
> +
> +/* MPU Protection Region Selection Register encode */
> +#define PRSELR_EL1 S3_0_C6_C2_1
> +#define PRSELR_EL2 S3_4_C6_C2_1
> +
> +/* MPU Type registers encode */
> +#define MPUIR_EL1 S3_0_C0_C0_4
> +#define MPUIR_EL2 S3_4_C0_C0_4
> +
> +#endif
> +
>   /* Access to system registers */
>   
>   #define WRITE_SYSREG64(v, name) do {                    \

Cheers,

[1] https://lore.kernel.org/all/20221022150422.17707-2-julien@xen.org/

-- 
Julien Grall

