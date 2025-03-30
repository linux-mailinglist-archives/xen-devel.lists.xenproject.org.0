Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F937A75C4A
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931748.1333937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzrb-0004Us-Ow; Sun, 30 Mar 2025 21:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931748.1333937; Sun, 30 Mar 2025 21:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzrb-0004TM-Lt; Sun, 30 Mar 2025 21:06:39 +0000
Received: by outflank-mailman (input) for mailman id 931748;
 Sun, 30 Mar 2025 21:06:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyzra-0004TG-7z
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:06:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzrZ-000VPo-2e;
 Sun, 30 Mar 2025 21:06:37 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzrZ-00APBq-1w;
 Sun, 30 Mar 2025 21:06:37 +0000
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
	bh=+DKOibKiZeXRiFS8ThBN+x1SsY/hT/+j62qwQilR/ZM=; b=y/sCMZZqjJoRdzI8w110fTRMwT
	i6Y9KMuqkFQZ3O1p1YYbSLTD30z39QeuIbKC5bEFj+C4AreO+L/hMZmsvCEMQxUo8/iEFD41CowOR
	wBEAHG/oexZyj9RUzBkiRjkB7AHwAqr992UvhbA0JdEf44PKAhgrtNIBIpvSwMOJXvQM=;
Message-ID: <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
Date: Sun, 30 Mar 2025 22:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 30/03/2025 19:03, Ayan Kumar Halder wrote:
> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
> configurations across arm64 and arm32.

While I understand the desire to consolidate the code, I am quite 
unconvinced this should be done for assembly code. A few examples below why.

I would be interested to hear the view of the other Arm maintainers.

> 
> prepare_xen_region, enable_boot_cpu, fail_insufficient_regions() will be used by
> both arm32 and arm64. Thus, they have been moved to prepare_xen_region.inc.
> 
> REGION_* are moved to arm64/sysregs.h. Introduced LOAD_SYSREG and STORE_SYSREG
> to read/write to the system registers from the common asm file. One could not
> reuse READ_SYSREG and WRITE_SYSREG as they have been defined to be invoked from
> C files.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos.
> 
> v2 -
> 1. Extracted the arm64 head.S functions/macros in a common file.
> 
>   xen/arch/arm/arm64/mpu/head.S                 | 132 +-----------------
>   xen/arch/arm/include/asm/arm64/sysregs.h      |  15 ++
>   .../include/asm/mpu/prepare_xen_region.inc    | 128 +++++++++++++++++
>   3 files changed, 148 insertions(+), 127 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 4d00de4869..90b4c8c18f 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,83 +3,7 @@
>    * Start-of-day code for an Armv8-R MPU system.
>    */
>   
> -#include <asm/early_printk.h>
> -#include <asm/mpu.h>
> -
> -/* Backgroud region enable/disable */
> -#define SCTLR_ELx_BR    BIT(17, UL)
> -
> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
> -
> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
> -
> -/*
> - * Macro to prepare and set a EL2 MPU memory region.
> - * We will also create an according MPU memory region entry, which
> - * is a structure of pr_t,  in table \prmap.
> - *
> - * sel:         region selector
> - * base:        reg storing base address
> - * limit:       reg storing limit address
> - * prbar:       store computed PRBAR_EL2 value
> - * prlar:       store computed PRLAR_EL2 value
> - * maxcount:    maximum number of EL2 regions supported
> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_DATA_PRBAR
> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_NORMAL_PRLAR
> - *
> - * Preserves \maxcount
> - * Output:
> - *  \sel: Next available region selector index.
> - * Clobbers \base, \limit, \prbar, \prlar
> - *
> - * Note that all parameters using registers should be distinct.
> - */
> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> -    /* Check if the region is empty */
> -    cmp   \base, \limit
> -    beq   1f
> -
> -    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> -    cmp   \sel, \maxcount
> -    bge   fail_insufficient_regions
> -
> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> -    and   \base, \base, #MPU_REGION_MASK
> -    mov   \prbar, #\attr_prbar
> -    orr   \prbar, \prbar, \base
> -
> -    /* Limit address should be inclusive */
> -    sub   \limit, \limit, #1
> -    and   \limit, \limit, #MPU_REGION_MASK
> -    mov   \prlar, #\attr_prlar
> -    orr   \prlar, \prlar, \limit
> -
> -    msr   PRSELR_EL2, \sel
> -    isb
> -    msr   PRBAR_EL2, \prbar
> -    msr   PRLAR_EL2, \prlar
> -    dsb   sy
> -    isb
> -
> -    add   \sel, \sel, #1
> -
> -1:
> -.endm
> -
> -/*
> - * Failure caused due to insufficient MPU regions.
> - */
> -FUNC_LOCAL(fail_insufficient_regions)
> -    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> -1:  wfe
> -    b   1b
> -END(fail_insufficient_regions)
> +#include <asm/mpu/prepare_xen_region.inc>
>   
>   /*
>    * Enable EL2 MPU and data cache
> @@ -108,62 +32,16 @@ END(enable_mpu)
>    * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>    * regions.
>    *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>    *
>    */
>   FUNC(enable_boot_cpu_mm)
> -    /* Get the number of regions specified in MPUIR_EL2 */
> -    mrs   x5, MPUIR_EL2
> -    and   x5, x5, #NUM_MPU_REGIONS_MASK
> -
> -    /* x0: region sel */
> -    mov   x0, xzr
> -    /* Xen text section. */
> -    ldr   x1, =_stext
> -    ldr   x2, =_etext
> -    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> -
> -    /* Xen read-only data section. */
> -    ldr   x1, =_srodata
> -    ldr   x2, =_erodata
> -    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
> -
> -    /* Xen read-only after init and data section. (RW data) */
> -    ldr   x1, =__ro_after_init_start
> -    ldr   x2, =__init_begin
> -    prepare_xen_region x0, x1, x2, x3, x4, x5
> -
> -    /* Xen code section. */
> -    ldr   x1, =__init_begin
> -    ldr   x2, =__init_data_begin
> -    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> -
> -    /* Xen data and BSS section. */
> -    ldr   x1, =__init_data_begin
> -    ldr   x2, =__bss_end
> -    prepare_xen_region x0, x1, x2, x3, x4, x5
> -
> -#ifdef CONFIG_EARLY_PRINTK
> -    /* Xen early UART section. */
> -    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
> -    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> -    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
> -#endif
> -
> -    b    enable_mpu
> +    mov   x6, lr

Aside what I wrote above, why do we need to save/restore lr?

> +    enable_boot_cpu x0, x1, x2, x3, x4, x5
> +    mov   lr, x6
>       ret
>   END(enable_boot_cpu_mm)
>   
> -/*
> - * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
> - * please the common code.
> - */
> -ENTRY(enable_secondary_cpu_mm)
> -    PRINT("- SMP not enabled yet -\r\n")
> -1:  wfe
> -    b 1b
> -ENDPROC(enable_secondary_cpu_mm)
> -
>   /*
>    * Local variables:
>    * mode: ASM
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index b593e4028b..9b833fe73b 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,19 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>   
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */

While those makes sense in sysreg.h because they are definition based on 
the Arm Arm. The definition for ...

> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */

for PRLAR are specific to Xen. So I think they should be moved under 
mpu/. I would also consider *_PRBAR ones.

Also, are those values truely arm64 specific? Asking because you are 
using them in common code.

> +
> +#define STORE_SYSREG(v, name) "msr " __stringify(name,) #v;
> +#define LOAD_SYSREG(v, name) "mrs " #v __stringify(,) #name;
> +
> +#ifndef __ASSEMBLY__
> +
>   /* Access to system registers */
>   
>   #define WRITE_SYSREG64(v, name) do {                    \
> @@ -481,6 +494,8 @@
>   #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
>   #define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
>   
> +#endif /* __ASSEMBLY__ */
> +
>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
> new file mode 100644
> index 0000000000..3402ed23da
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <asm/sysregs.h>
> +#include <asm/mpu.h>
> +
> +/* Backgroud region enable/disable */
> +#define SCTLR_ELx_BR    BIT(17, UL)
> +
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * sel:         region selector
> + * base:        reg storing base address
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
> + *
> + * Preserves maxcount
> + * Output:
> + *  sel: Next available region selector index.
> + * Clobbers base, limit, prbar, prlar
> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Check if the region is empty */
> +    cmp   \base, \limit
> +    beq   1f
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> +    cmp   \sel, \maxcount
> +    bge   fail_insufficient_regions
> +
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
> +    STORE_SYSREG(\sel, PRSELR_EL2)
> +    isb
> +    STORE_SYSREG(\prbar, PRBAR_EL2)
> +    STORE_SYSREG(\prlar, PRLAR_EL2)
> +    dsb   sy
> +    isb
> +
> +    add   \sel, \sel, #1
> +
> +1:
> +.endm
> +
 > +.macro enable_boot_cpu, reg0, reg1, reg2, reg3, reg4, reg5

If we go this approach, this will need some documentation on top 
(similar to the other macro in this file).

> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    LOAD_SYSREG(\reg5, MPUIR_EL2)
> +    and   \reg5, \reg5, #NUM_MPU_REGIONS_MASK
> +
> +    /* reg0: region sel */
> +    mov   \reg0, #0
> +    /* Xen text section. */
> +    ldr   \reg1, =_stext

For instance, on Arm32, this could be replaced with ``mov_w`` which is 
doesn't involve memory load.

> +    ldr   \reg2, =_etext
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    ldr   \reg1, =_srodata
> +    ldr   \reg2, =_erodata
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_RO_PRBAR
> +
> +    /* Xen read-only after init and data section. (RW data) */
> +    ldr   \reg1, =__ro_after_init_start
> +    ldr   \reg2, =__init_begin
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
> +
> +    /* Xen code section. */
> +    ldr   \reg1, =__init_begin
> +    ldr   \reg2, =__init_data_begin
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen data and BSS section. */
> +    ldr   \reg1, =__init_data_begin
> +    ldr   \reg2, =__bss_end
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Xen early UART section. */
> +    ldr   \reg1, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    ldr   \reg2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
> +#endif
> +
> +    bl    enable_mpu
> +.endm
> +
> +/* Failure caused due to insufficient MPU regions. */
> +FUNC_LOCAL(fail_insufficient_regions)
> +    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> +1:  wfe
> +    b   1b
> +END(fail_insufficient_regions)
> +
> +/*
> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
> + * please the common code.
> + */
> +ENTRY(enable_secondary_cpu_mm)

I really doubt we will be able to keep this function common in the future.

> +    PRINT("- SMP not enabled yet -\r\n")
> +1:  wfe
> +    b 1b
> +ENDPROC(enable_secondary_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall


