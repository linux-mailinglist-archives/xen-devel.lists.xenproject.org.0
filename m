Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B106F9B92E2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 15:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829165.1244256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sNN-0005b8-51; Fri, 01 Nov 2024 14:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829165.1244256; Fri, 01 Nov 2024 14:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sNN-0005Yz-1P; Fri, 01 Nov 2024 14:11:45 +0000
Received: by outflank-mailman (input) for mailman id 829165;
 Fri, 01 Nov 2024 14:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t6sNL-0005Yt-Kl
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 14:11:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sNL-00F3Fh-0J;
 Fri, 01 Nov 2024 14:11:43 +0000
Received: from [2a02:8012:3a1:0:4ddd:1dd:c52d:25b6]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sNK-009eCU-2P;
 Fri, 01 Nov 2024 14:11:42 +0000
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
	bh=flw1mDMYp3QxwJmUv7lMdEoUbeLwdDFmJ0eHYxSks4c=; b=WH1whwAyNo0SbVvxpdFi+UL2LB
	p1QW+lNSeT/PO4BUIN50fhBvt5vDEm7cAhnSivW7tyJ4lhDtr/vAkmFSjTdFnxAPHQdaLx8kqhIed
	xtu7yBGvS4yjwGS1pFqWUlTwexf5B9XeEHgd4yKfxXT4Fx/JESo5wedkrzGirg0ATU4A=;
Message-ID: <dcfb8c04-78c6-46b4-868b-96bf24d1493d@xen.org>
Date: Fri, 1 Nov 2024 14:11:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/10/2024 12:45, Ayan Kumar Halder wrote:
> Define enable_boot_cpu_mm() for the AArch64-V8R system.
> 
> Like boot-time page table in MMU system, we need a boot-time MPU protection
> region configuration in MPU system so Xen can fetch code and data from normal
> memory.
> 
> To do this, Xen maps the following sections of the binary as separate regions
> (with permissions) :-
> 1. Text (Read only at EL2, execution is permitted)
> 2. RO data (Read only at EL2)
> 3. RO after init data and RW data (Read/Write at EL2)
> 4. Init Text (Read only at EL2, execution is permitted)
> 5. Init data and BSS (Read/Write at EL2)
> 
> Before creating a region, we check if the count exceeds the number defined in
> MPUIR_EL2. If so, then the boot fails.
> 
> Also we check if the region is empty or not. IOW, if the start and end address
> are same, we skip mapping the region.
> 
> To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
> Registers", to get the definitions of these registers. Also, refer to G1.2
> "Accessing MPU memory region registers", the following
> 
> ```
> The MPU provides two register interfaces to program the MPU regions:
> - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
> PRLAR<n>_ELx.
> ```
> 
> We use the above mechanism to create the MPU memory regions.
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
> v2 - 1. Extracted "enable_mpu()" in a separate patch.
> 
> 2. Removed alignment for limit address.
> 
> 3. Merged some of the sections for preparing the early boot regions.
> 
> 4. Checked for the max limit of MPU regions before creating a new region.
> 
> 5. Checked for empty regions.
> 
> v3 :- 1. Modified prepare_xen_region() so that we check for empty region within
> this. Also, index of regions (to be programmed in PRSELR_EL2) should start from
> 0.
> 
> 2. Removed load_paddr() as the offset is 0.
> 
> 3. Introduced fail_insufficient_regions() to handle failure caused when the
> number of regions to be allocated is not sufficient.
> 
>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>   xen/arch/arm/arm64/mpu/head.S                | 122 +++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
>   xen/arch/arm/include/asm/mm.h                |   2 +
>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>   xen/arch/arm/xen.lds.S                       |   1 +
>   7 files changed, 195 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
> 
> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
> index b18cec4836..a8a750a3d0 100644
> --- a/xen/arch/arm/arm64/mpu/Makefile
> +++ b/xen/arch/arm/arm64/mpu/Makefile
> @@ -1 +1,2 @@
> +obj-y += head.o
>   obj-y += mm.o
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> new file mode 100644
> index 0000000000..9377ae778c
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/mm.h>
> +#include <asm/arm64/mpu/sysregs.h>
> +
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
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
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
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
> +    msr   PRSELR_EL2, \sel
> +    isb
> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb   sy
> +    isb
> +
> +1:
> +.endm
> +
> +/*
> + * Failure caused due to insufficient MPU regions.
> + */
> +FUNC_LOCAL(fail_insufficient_regions)
> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
> +1:  wfe
> +    b   1b
> +END(fail_insufficient_regions)
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Inputs:
> + *   lr : Address to return to.
> + *
> + * Clobbers x0 - x5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +

NIT: I would remove this empty line.

> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    mrs   x5, MPUIR_EL2

Looking at the spec, the number of regions are only in the first 8-bits. 
So you want to mask before using it.

> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    ldr   x1, =_stext
> +    ldr   x2, =_etext
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    ldr   x1, =_srodata
> +    ldr   x2, =_erodata
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
> +
> +    /* Xen read-only after init and data section. (RW data) */
> +    ldr   x1, =__ro_after_init_start
> +    ldr   x2, =__init_begin
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +    /* Xen code section. */
> +    ldr   x1, =__init_begin
> +    ldr   x2, =__init_data_begin
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen data and BSS section. */
> +    ldr   x1, =__init_data_begin
> +    ldr   x2, =__bss_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +    ret
> +

NIT: I would remove this empty line.
	
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

Do you know why the compiler doesn't support MPUIR_EL2 & co natively? 
Any chance this is because we may build Xen with the wrong flags for the 
MPU port?

Cheers,

-- 
Julien Grall


