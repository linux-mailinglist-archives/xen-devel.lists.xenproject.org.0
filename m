Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54646962AFC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 17:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784962.1194391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjKAn-0000Zr-EM; Wed, 28 Aug 2024 15:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784962.1194391; Wed, 28 Aug 2024 15:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjKAn-0000Xa-AQ; Wed, 28 Aug 2024 15:01:25 +0000
Received: by outflank-mailman (input) for mailman id 784962;
 Wed, 28 Aug 2024 15:01:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sjKAm-0000XU-1V
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 15:01:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjKAl-0002Nv-FK; Wed, 28 Aug 2024 15:01:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjKAl-0007CO-8u; Wed, 28 Aug 2024 15:01:23 +0000
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
	bh=CKhoBEdU1oBU1ObBf+zxVNpjO6KmigcCl/gcErSgd2M=; b=PqxLnBNobXUV2DyPO0oIrrvn3C
	BZ9LBqH1ZOvVxqbZtfaosxhsSvISsveHFU49w64qvDxHrP82FZq9lThPsEZugOgwzN4jjuRLN0VSV
	U30hJcj8gcM5Fiq/b1F2rhjcT59QF0Dgxo8o8IGiH7xwUb+XDcz1ajoWBerHhsG+QIkU=;
Message-ID: <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
Date: Wed, 28 Aug 2024 16:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/08/2024 17:31, Ayan Kumar Halder wrote:
> Define enable_boot_cpu_mm() for the AArch64-V8R system.
> 
> Like boot-time page table in MMU system, we need a boot-time MPU
> protection region configuration in MPU system so Xen can fetch code and
> data from normal memory.
> 
> START_ADDRESS + 2MB memory is mapped to contain the text and data
> required for early boot of Xen.
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
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/Makefile                    |  1 +
>   xen/arch/arm/arm64/mpu/Makefile          |  1 +
>   xen/arch/arm/arm64/mpu/head.S            | 70 ++++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/sysregs.h | 50 +++++++++++++++++
>   xen/arch/arm/include/asm/mpu/arm64/mm.h  | 13 +++++
>   xen/arch/arm/include/asm/mpu/mm.h        | 18 ++++++
>   6 files changed, 153 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
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
> index 0000000000..2b023c346a
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Coding style: /* ... */

> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/mm.h>
> +#include <asm/page.h>

I can't see any use of the definition of page.h. Is it necessary?

> +#include <asm/early_printk.h>

You include early_printk.h but don't use it.

> +
> +/*
> + * From the requirements of head.S we know that Xen image should
> + * be linked at XEN_START_ADDRESS, and all of text + data + bss
> + * must fit in 2MB.

Xen can be bigger than 2MB. But rather than hardcoding the limit, you 
want to use _end.

> On MPU systems, XEN_START_ADDRESS is also the
> + * address that Xen image should be loaded at. So for initial MPU
> + * regions setup, we use 2MB for Xen data memory to setup boot
> + * region, or the create boot regions code below will need adjustment.
> + */
> +#define XEN_START_MEM_SIZE      0x200000

See above.

> +
> +/*
> + * In boot stage, we will use 1 MPU region:
> + * Region#0: Normal memory for Xen text + data + bss (2MB)
> + */
> +#define BOOT_NORMAL_REGION_IDX  0x0
> +
> +/* MPU normal memory attributes. */
> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
> +
> +.macro write_pr, sel, prbar, prlar
> +    msr   PRSELR_EL2, \sel
> +    dsb   sy

I am not sure I understand why this is a dsb rather than isb. Can you 
clarify?

If a "dsb" is necessary, "sy" seems to be quite strict.

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
> + */

Please document a bit more the code and how the registers are used. For 
an example see the mmu/head.S code.

> +ENTRY(enable_boot_cpu_mm)
> +    /* Map Xen start memory to a normal memory region. */
> +    mov x0, #BOOT_NORMAL_REGION_IDX
> +    ldr x1, =XEN_START_ADDRESS
> +    and x1, x1, #MPU_REGION_MASK
> +    mov x3, #PRBAR_NORMAL_MEM
> +    orr x1, x1, x3
> +
> +    ldr x2, =XEN_START_ADDRESS
> +    mov x3, #(XEN_START_MEM_SIZE - 1)
> +    add x2, x2, x3
> +    and x2, x2, #MPU_REGION_MASK
> +    mov x3, #PRLAR_NORMAL_MEM
> +    orr x2, x2, x3
> +
> +    /*
> +     * Write to MPU protection region:
> +     * x0 for pr_sel, x1 for prbar x2 for prlar
> +     */
> +    write_pr x0, x1, x2
> +
> +    ret
> +ENDPROC(enable_boot_cpu_mm)

Missing emacs magic.

> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index b593e4028b..0d122e1fa6 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,56 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>   
> +/* System registers for AArch64 with PMSA */
> +#ifdef CONFIG_MPU

Can we define the registers in mpu/sysregs.h? This can then be included 
only where it is needed.

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
> +#define PRENR_EL2 S3_4_C6_C1_1
> +
> +/* MPU Protection Region Selection Register encode */
> +#define PRSELR_EL2 S3_4_C6_C2_1
> +
> +/* MPU Type registers encode */
> +#define MPUIR_EL2 S3_4_C0_C0_4
> +
> +#endif
> +
>   /* Access to system registers */
>   
>   #define WRITE_SYSREG64(v, name) do {                    \
> diff --git a/xen/arch/arm/include/asm/mpu/arm64/mm.h b/xen/arch/arm/include/asm/mpu/arm64/mm.h
> new file mode 100644
> index 0000000000..d209eef6db
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/arm64/mm.h
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Coding style: /* ... */

> +/*
> + * mpu.h: Arm Memory Protection Unit definitions.

The file is name mm.h.

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

Missing emacs magic.

> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> new file mode 100644
> index 0000000000..f5ebca8261
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/mm.h

Do we need this file?

> @@ -0,0 +1,18 @@
> +#ifndef __ARCH_ARM_MPU__
> +#define __ARCH_ARM_MPU__
> +
> +#if defined(CONFIG_ARM_64)
> +# include <asm/mpu/arm64/mm.h>
> +#else
> +# error "unknown ARM variant"
> +#endif
> +
> +#endif /*  __ARCH_ARM_MPU__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall


