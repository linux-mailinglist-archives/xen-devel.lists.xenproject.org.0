Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2EA93156
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 06:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958673.1351371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5dkl-0003oZ-BX; Fri, 18 Apr 2025 04:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958673.1351371; Fri, 18 Apr 2025 04:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5dkl-0003lx-5J; Fri, 18 Apr 2025 04:55:03 +0000
Received: by outflank-mailman (input) for mailman id 958673;
 Fri, 18 Apr 2025 04:55:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u5dkk-0003lr-50
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 04:55:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u5dkj-005hQM-1x;
 Fri, 18 Apr 2025 04:55:01 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u5dkj-003O2p-03;
 Fri, 18 Apr 2025 04:55:01 +0000
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
	bh=6oJcOc57u4hiPZM8iduG/VSJ6526yXSNaJnYjbn3674=; b=JtAq+3shu88avNUC79KPTbzr25
	MNSJ1rhjwQSReE24mPQFTpdHnlHMmeRDFGSDI9ZG2dAS9fVvGP5Hn+tYN4mkQYMO9RvwQ4JqYSATL
	bEwlPs1DdKA0mCrm3KJT/Rf8AuPtEo4xr/P6cq2Y6yCYxw5UOTo6ODF+sRLi1mfbREBA=;
Message-ID: <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
Date: Fri, 18 Apr 2025 13:54:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/04/2025 00:55, Ayan Kumar Halder wrote:
> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 HPRBAR<n>,
> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
> 
> Introduce pr_t typedef which is a structure having the prbar and prlar members,
> each being structured as the registers of the AArch32-V8R architecture.
> This is the arm32 equivalent of
> "arm/mpu: Introduce MPU memory region map structure".
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> This patch should be applied after
> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to enable
> compilation for AArch32.
> 
>   xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
>   xen/arch/arm/include/asm/mpu.h        |   4 +
>   xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
>   3 files changed, 198 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> new file mode 100644
> index 0000000000..4aabd93479
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
> + */
> +
> +#ifndef __ARM_ARM32_MPU_H
> +#define __ARM_ARM32_MPU_H
> +
> +#define XN_EL2_ENABLED  0x1

I understand the define is introduced in Luca's patch, but this a bit 
non-descriptive... Can we find a better name? Maybe by adding the name 
of the register and some documentation?

> +
> +#ifndef __ASSEMBLY__
> +
> +/* Hypervisor Protection Region Base Address Register */
> +typedef union {
> +    struct {
> +        unsigned int xn:1;       /* Execute-Never */
> +        unsigned int ap:2;       /* Acess Permission */
> +        unsigned int sh:2;       /* Sharebility */
> +        unsigned int res0:1;     /* Reserved as 0 */
> +        unsigned int base:26;    /* Base Address */
> +    } reg;
> +    uint32_t bits;
> +} prbar_t;
> +
> +/* Hypervisor Protection Region Limit Address Register */
> +typedef union {
> +    struct {
> +        unsigned int en:1;     /* Region enable */
> +        unsigned int ai:3;     /* Memory Attribute Index */
> +        /*
> +         * There is no actual ns bit in hardware. It is used here for
> +         * compatibility with Armr64 code. Thus, we are reusing a res0 bit for ns.

typo: Arm64.

> +         */

Hmmmm, this would mean someone may mistakenly set the bit to 0 by 
mistake. If the field is always meant to be 0 on arm64, then I would 
consider to name is res0 on arm64 with an explanation.

This would make clear the bit is not supposed to have a value other than 0.

> +        unsigned int ns:1;     /* Reserved 0 by hardware */
> +        unsigned int res0:1;   /* Reserved 0 by hardware */
> +        unsigned int limit:26;  /* Limit Address */

NIT: Can we align the comments?

> +    } reg;
> +    uint32_t bits;
> +} prlar_t;
> +
> +/* Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    uint64_t p2m_type;          /* Used to store p2m types. */
> +} pr_t;

This looks to be common with arm64. If so, I would prefer if the 
structure is in a common header.

> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM_ARM32_MPU_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 77d0566f97..67127149c0 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -8,8 +8,12 @@
>   
>   #if defined(CONFIG_ARM_64)
>   # include <asm/arm64/mpu.h>
> +#elif defined(CONFIG_ARM_32)
> +# include <asm/arm32/mpu.h>
>   #endif
>   
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>   #define MPU_REGION_SHIFT  6
>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index d5cd0e04d5..7cf52aa09a 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,18 +6,153 @@
>   /* CP15 CR0: MPU Type Register */
>   #define HMPUIR          p15,4,c0,c0,4
>   
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>   /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>   #define HPRSELR         p15,4,c6,c2,1
>   #define HPRBAR          p15,4,c6,c3,0
>   #define HPRLAR          p15,4,c6,c8,1
>   
> +/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
> +#define HPRBAR0         p15,4,c6,c8,0
> +#define HPRLAR0         p15,4,c6,c8,1
> +#define HPRBAR1         p15,4,c6,c8,4
> +#define HPRLAR1         p15,4,c6,c8,5
> +#define HPRBAR2         p15,4,c6,c9,0
> +#define HPRLAR2         p15,4,c6,c9,1
> +#define HPRBAR3         p15,4,c6,c9,4
> +#define HPRLAR3         p15,4,c6,c9,5
> +#define HPRBAR4         p15,4,c6,c10,0
> +#define HPRLAR4         p15,4,c6,c10,1
> +#define HPRBAR5         p15,4,c6,c10,4
> +#define HPRLAR5         p15,4,c6,c10,5
> +#define HPRBAR6         p15,4,c6,c11,0
> +#define HPRLAR6         p15,4,c6,c11,1
> +#define HPRBAR7         p15,4,c6,c11,4
> +#define HPRLAR7         p15,4,c6,c11,5
> +#define HPRBAR8         p15,4,c6,c12,0
> +#define HPRLAR8         p15,4,c6,c12,1
> +#define HPRBAR9         p15,4,c6,c12,4
> +#define HPRLAR9         p15,4,c6,c12,5
> +#define HPRBAR10        p15,4,c6,c13,0
> +#define HPRLAR10        p15,4,c6,c13,1
> +#define HPRBAR11        p15,4,c6,c13,4
> +#define HPRLAR11        p15,4,c6,c13,5
> +#define HPRBAR12        p15,4,c6,c14,0
> +#define HPRLAR12        p15,4,c6,c14,1
> +#define HPRBAR13        p15,4,c6,c14,4
> +#define HPRLAR13        p15,4,c6,c14,5
> +#define HPRBAR14        p15,4,c6,c15,0
> +#define HPRLAR14        p15,4,c6,c15,1
> +#define HPRBAR15        p15,4,c6,c15,4
> +#define HPRLAR15        p15,4,c6,c15,5
> +#define HPRBAR16        p15,5,c6,c8,0
> +#define HPRLAR16        p15,5,c6,c8,1
> +#define HPRBAR17        p15,5,c6,c8,4
> +#define HPRLAR17        p15,5,c6,c8,5
> +#define HPRBAR18        p15,5,c6,c9,0
> +#define HPRLAR18        p15,5,c6,c9,1
> +#define HPRBAR19        p15,5,c6,c9,4
> +#define HPRLAR19        p15,5,c6,c9,5
> +#define HPRBAR20        p15,5,c6,c10,0
> +#define HPRLAR20        p15,5,c6,c10,1
> +#define HPRBAR21        p15,5,c6,c10,4
> +#define HPRLAR21        p15,5,c6,c10,5
> +#define HPRBAR22        p15,5,c6,c11,0
> +#define HPRLAR22        p15,5,c6,c11,1
> +#define HPRBAR23        p15,5,c6,c11,4
> +#define HPRLAR23        p15,5,c6,c11,5
> +#define HPRBAR24        p15,5,c6,c12,0
> +#define HPRLAR24        p15,5,c6,c12,1
> +#define HPRBAR25        p15,5,c6,c12,4
> +#define HPRLAR25        p15,5,c6,c12,5
> +#define HPRBAR26        p15,5,c6,c13,0
> +#define HPRLAR26        p15,5,c6,c13,1
> +#define HPRBAR27        p15,5,c6,c13,4
> +#define HPRLAR27        p15,5,c6,c13,5
> +#define HPRBAR28        p15,5,c6,c14,0
> +#define HPRLAR28        p15,5,c6,c14,1
> +#define HPRBAR29        p15,5,c6,c14,4
> +#define HPRLAR29        p15,5,c6,c14,5
> +#define HPRBAR30        p15,5,c6,c15,0
> +#define HPRLAR30        p15,5,c6,c15,1
> +#define HPRBAR31        p15,5,c6,c15,4
> +#define HPRLAR31        p15,5,c6,c15,5

NIT: Is there any way we could generate the values using macros?

> +
>   /* Aliases of AArch64 names for use in common code */
>   #ifdef CONFIG_ARM_32
>   /* Alphabetically... */
>   #define MPUIR_EL2       HMPUIR
>   #define PRBAR_EL2       HPRBAR
> +#define PRBAR0_EL2      HPRBAR0

AFAIU, the alias will be mainly used in the macro generate
the switch. Rather than open-coding all the PR*AR_EL2, can we
provide two macros PR{B, L}AR_N that will be implemented as
HPR{B,L}AR##n for arm32 and PR{B,L}AR##n for arm64?

>   #define PRSELR_EL2      HPRSELR
> +
>   #endif /* CONFIG_ARM_32 */
>   
>   #endif /* __ARM_MPU_CPREGS_H */

Cheers,

-- 
Julien Grall


