Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356ED97C9F1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 15:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800768.1210767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srH1H-00042d-FJ; Thu, 19 Sep 2024 13:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800768.1210767; Thu, 19 Sep 2024 13:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srH1H-00040s-BS; Thu, 19 Sep 2024 13:16:27 +0000
Received: by outflank-mailman (input) for mailman id 800768;
 Thu, 19 Sep 2024 13:16:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srH1F-0003zQ-QC
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 13:16:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srH1F-0006W1-A6; Thu, 19 Sep 2024 13:16:25 +0000
Received: from [83.68.141.146] (helo=[10.134.2.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srH1F-0004pu-3c; Thu, 19 Sep 2024 13:16:25 +0000
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
	bh=lzktWJx004L1bpFM2OYgL0Tm1EKzygHga0Ynd5BlUtc=; b=eh25XSFKr+WwxP6lD3Qvp/3KTO
	cfFxo4ryNYaEjgkZBSw4KBAaM4iJZ7CrgbPQKP5fMNN67r9vHr/uO0fQJDuqDQDhTG8gFdgvv3WWT
	UfUzcXVy8EZlgrmxiuJz2JUWdvpIwfruyVySyYkKUEBf5sLtehfH+HYsmT4dlzFd6gdc=;
Message-ID: <e515dfb1-efb6-41a5-85a4-65ec7e9c60a6@xen.org>
Date: Thu, 19 Sep 2024 15:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240918175102.223076-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/09/2024 19:51, Ayan Kumar Halder wrote:
> Define enable_boot_cpu_mm() for the AArch64-V8R system.
> 
> Like boot-time page table in MMU system, we need a boot-time MPU
> protection region configuration in MPU system so Xen can fetch code and
> data from normal memory.
> 
> To do this, Xen maps the following sections of the binary as separate
> regions (with permissions) :-
> 1. Text (Read only at EL2, execution is permitted)
> 2. RO data (Read only at EL2)
> 3. RO after init data (Read/Write at EL2 as the data is RW during init)
> 4. RW data (Read/Write at EL2)
> 5. BSS (Read/Write at EL2)
> 6. Init Text (Read only at EL2, execution is permitted)
> 7. Init data (Read/Write at EL2)
> 
> If the number of MPU regions created is greater than the count defined
> in  MPUIR_EL2, then the boot fails.
> 
> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
> registers", the following
> 
> ```
> The MPU provides two register interfaces to program the MPU regions:
>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
> PRLAR<n>_ELx.
> ```
> We use the above mechanism to configure the MPU memory regions.
> 
> MPU specific registers are defined in
> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single MPU region,
> we have separate MPU regions for different parts of the Xen binary. The reason
> being different regions will nned different permissions (as mentioned in the
> linker script).
> 
> 2. Introduced a label (__init_data_begin) to mark the beginning of the init data
> section.
> 
> 3. Moved MPU specific register definitions to mpu/sysregs.h.
> 
> 4. Fixed coding style issues.
> 
> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
> (Outstanding comment not addressed).
> 
>   xen/arch/arm/Makefile                        |   1 +
>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>   xen/arch/arm/arm64/mpu/head.S                | 176 +++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
>   xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
>   xen/arch/arm/include/asm/mm.h                |   2 +
>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>   xen/arch/arm/xen.lds.S                       |   1 +
>   9 files changed, 253 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..aebccec63a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,7 @@
>   obj-$(CONFIG_ARM_32) += arm32/
>   obj-$(CONFIG_ARM_64) += arm64/
>   obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>   obj-$(CONFIG_ACPI) += acpi/
>   obj-$(CONFIG_HAS_PCI) += pci/
>   ifneq ($(CONFIG_NO_PLAT),y)
> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> new file mode 100644
> index 0000000000..ef55c8765c
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -0,0 +1,176 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/mm.h>
> +#include <asm/page.h>
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

Can you explain why we need the region to be page-aligned? Would not 
64-bytes alignment (IIRC this is the minimum by the MPU sufficient)

And more importantly, if those regions were effectively not aligned, 
would not this mean we would could configure the MPU with two clashing 
regions? IOW, this round up looks harmful to me.

> +
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * Inputs:
> + * sel:         region selector
> + * base:        reg storing base address (should be page-aligned)
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
> + *
> + * Clobber \tmp1, \tmp2
> + *
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
> +    /* Round up limit address to be PAGE_SIZE aligned */
> +    roundup_section \limit
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
> +    msr   PRSELR_EL2, \sel
> +    isb
> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb

Please use "dsb sy". This has the same meaning as "dsb" but more 
explicit for the reader.

> +    isb
> +.endm
> +
> +/* Load the physical address of a symbol into xb */
> +.macro load_paddr xb, sym
> +    ldr \xb, =\sym
> +    add \xb, \xb, x20       /* x20 - Phys offset */
> +.endm
> +
> +.section .text.header, "ax", %progbits

Does the code below actually need to be in .text.header?

> +
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch64 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.

Based on this sentence, I was expecting an instruction to clear 
SCTRL_EL2.BR. What did I miss?

> + *
> + * Clobbers x0
> + *
> + */
> +FUNC_LOCAL(enable_mpu)
> +    mrs   x0, SCTLR_EL2
> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
> +    dsb   sy

There is no memory access in enable_mpu. So what is this dsb for?

> +    msr   SCTLR_EL2, x0
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions. Some of these regions will be marked read only while the others will
> + * be read write or execute.

And some in the future may need to be memory region (e.g. to use the 
UART early) :). So how about just dropping it?

 > + *> + * Inputs:
> + *   lr : Address to return to.
> + *
> + * Clobbers x0 - x7
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
 > +    mov   x7, lr> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    load_paddr x1, _stext
> +    load_paddr x2, _etext
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen read-only data section. */
> +    load_paddr x1, _srodata
> +    load_paddr x2, _erodata
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_RO_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen read-only after init data section. */
> +    load_paddr x1, __ro_after_init_start
> +    load_paddr x2, __ro_after_init_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6

Is it necessary to have a section for the ro-after-init? IOW, could we 
just fold into...

> +
> +    add   x0, x0, #1
> +    /* Xen read-write data section. */
> +    load_paddr x1, __ro_after_init_end
> +    load_paddr x2, __init_begin
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6

... this one during boot and then fold the ro-after-init to the 
read-only region? This would possibly reduce the number of used by Xen 
and also avoid reshfulling the MPU section.

Another possibility would be to move the ro-after-init MPU region at the 
end.

 > +> +    add   x0, x0, #1
> +    /* Xen BSS section. */
> +    load_paddr x1, __bss_start
> +    load_paddr x2, __bss_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    add   x0, x0, #1
> +    /* Xen init text section. */
> +    load_paddr x1, __init_begin
> +    load_paddr x2, __init_data_begin
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen init data section. */
> +    load_paddr x1, __init_data_begin
> +    load_paddr x2, __init_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> +    mrs   x1, MPUIR_EL2
> +    cmp   x0, x1
> +    bgt   1f
> +    bl    enable_mpu

It seems to be a bit odd to check *after* we wrote. It would be useful 
to explain why this is fine.

> +
> +    mov   lr, x7
> +    ret
> +
> +1:
> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
> +    wfe
> +    b   1b
> +END(enable_boot_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> new file mode 100644
> index 0000000000..b0c31a58ec
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_ARM64_MPU_SYSREGS_H
> +#define __ASM_ARM_ARM64_MPU_SYSREGS_H
> +
> +/* Number of EL2 MPU regions */
> +#define MPUIR_EL2   S3_4_C0_C0_4
> +
> +/* EL2 MPU Protection Region Base Address Register encode */
> +#define PRBAR_EL2   S3_4_C6_C8_0
> +
> +/* EL2 MPU Protection Region Limit Address Register encode */
> +#define PRLAR_EL2   S3_4_C6_C8_1
> +
> +/* MPU Protection Region Selection Register encode */
> +#define PRSELR_EL2  S3_4_C6_C2_1
> +
> +#endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index b593e4028b..8b6b373ce9 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -2,6 +2,9 @@
>   #define __ASM_ARM_ARM64_SYSREGS_H
>   
>   #include <xen/stringify.h>
> +#if defined(CONFIG_MPU)
> +#include <asm/arm64/mpu/sysregs.h>
> +#endif

I would expect the number of user for the MPU sysregs to be limited. So 
can we include the header only when it is necessary?

Cheers,

-- 
Julien Grall


