Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E9B3B497
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100771.1454099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtnY-0007nr-5p; Fri, 29 Aug 2025 07:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100771.1454099; Fri, 29 Aug 2025 07:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtnY-0007mA-2i; Fri, 29 Aug 2025 07:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1100771;
 Fri, 29 Aug 2025 07:45:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urtnW-0007ll-Jd
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:45:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtnV-00CVde-2g;
 Fri, 29 Aug 2025 07:45:22 +0000
Received: from [2a02:8012:3a1:0:a40e:c7d9:d4:3bff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtnV-007E7x-2i;
 Fri, 29 Aug 2025 07:45:21 +0000
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
	bh=jIDd9kp8UwZ9IkomjvQMBNDqneCbCyJMG4u4Bf0oTWg=; b=6TpkEl/N0ejjuqt2+RqFHpQU1J
	9lNCvNUzvxNsUJD7dCps7+Z388DxAGOdxkf3uGD2qlmU7i+SNy98n+tPdlowOfmM8+z8Sv5l0XZBl
	sXLVVB66Gij40D92LhV8iS4XR1vZTK+YKcJGDoHXCXqsefJEwW2U9q3wTuN/3Jqy2Z3g=;
Message-ID: <80c24bfe-3b26-4c16-8d5e-012662d16ca9@xen.org>
Date: Fri, 29 Aug 2025 08:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm/mpu: Implement transient mapping
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <6dc15f5279ea76ac52e89b75d56e3bd2063e91f3.1756379422.git.hari.limaye@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6dc15f5279ea76ac52e89b75d56e3bd2063e91f3.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/08/2025 12:12, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Add a scheme to distinguish transient MPU regions, to identify MPU
> regions which will be mapped for a short period of time. This is needed
> for the functions which transiently map and unmap memory ranges on
> demand which will be introduced in a future commit.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes from v2:
> - Define offsets programmatically, rather than hard-coding these
> - Add Michal's R-b
> 
> Changes from v1:
> - Improve commit message
> - Mark parameter in read helper as const
> ---
>   xen/arch/arm/arm32/asm-offsets.c         |  3 ++-
>   xen/arch/arm/arm64/asm-offsets.c         |  2 ++
>   xen/arch/arm/include/asm/arm32/mpu.h     |  2 ++
>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 ++
>   xen/arch/arm/include/asm/mpu/mm.h        | 14 +++++++++++++-
>   xen/arch/arm/include/asm/mpu/regions.inc | 17 +++++++++++++----
>   xen/arch/arm/mpu/mm.c                    | 23 ++++++++++++++---------
>   7 files changed, 48 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
> index c203ce269d..f354bf374d 100644
> --- a/xen/arch/arm/arm32/asm-offsets.c
> +++ b/xen/arch/arm/arm32/asm-offsets.c
> @@ -43,7 +43,6 @@ void __dummy__(void)
>      OFFSET(UREGS_SP_und, struct cpu_user_regs, sp_und);
>      OFFSET(UREGS_LR_und, struct cpu_user_regs, lr_und);
>      OFFSET(UREGS_SPSR_und, struct cpu_user_regs, spsr_und);
> -

Spurious change?

>      OFFSET(UREGS_SP_irq, struct cpu_user_regs, sp_irq);
>      OFFSET(UREGS_LR_irq, struct cpu_user_regs, lr_irq);
>      OFFSET(UREGS_SPSR_irq, struct cpu_user_regs, spsr_irq);
> @@ -79,6 +78,8 @@ void __dummy__(void)
>   #ifdef CONFIG_MPU
>      DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>      DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>      BLANK();
>   #endif
>   }
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
> index 320289b281..38a3894a3b 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -73,6 +73,8 @@ void __dummy__(void)
>   #ifdef CONFIG_MPU
>      DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>      DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>      BLANK();
>   #endif
>   }
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index 0a6930b3a0..9906d98809 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -39,6 +39,8 @@ typedef union {
>   typedef struct {
>       prbar_t prbar;
>       prlar_t prlar;
> +    bool transient;
 > +    uint8_t pad[7]; /* Pad structure to 16 Bytes */>   } pr_t;
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index f0ce344e78..1d1843eda0 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -38,6 +38,8 @@ typedef union {
>   typedef struct {
>       prbar_t prbar;
>       prlar_t prlar;
> +    bool transient;
> +    uint8_t pad[15]; /* Pad structure to 32 Bytes */
>   } pr_t;
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e1ded6521d..566d338986 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -55,6 +55,16 @@ static inline void context_sync_mpu(void)
>       isb();
>   }
>   
> +static inline bool region_is_transient(const pr_t *pr)
> +{
> +    return pr->transient;
> +}
> +
> +static inline void region_set_transient(pr_t *pr, bool transient)
> +{
> +    pr->transient = transient;
> +}
> +
>   /*
>    * The following API requires context_sync_mpu() after being used to modify MPU
>    * regions:
> @@ -75,9 +85,11 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>    * @param base      Base address of the range to map (inclusive).
>    * @param limit     Limit address of the range to map (exclusive).
>    * @param flags     Flags for the memory range to map.
> + * @param transient True for a transient mapping, otherwise False.

Why can't this be part of the flags?

>    * @return          0 on success, negative on error.
>    */
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> +                      bool transient);
>   
>   /*
>    * Creates a pr_t structure describing a protection region.
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 23fead3b21..09e1dcf03f 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -14,19 +14,25 @@
>   #define PRLAR_ELx_EN            0x1
>   
>   #ifdef CONFIG_ARM_64
> -#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
> -
>   .macro store_pair reg1, reg2, dst
>       stp \reg1, \reg2, [\dst]
>   .endm
>   
> -#else
> -#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
> +.macro zero_pair dst, offset, tmp1, tmp2
 > +    stp xzr, xzr, [\dst, \offset]> +.endm
>   
> +#else
>   .macro store_pair reg1, reg2, dst
>       strd  \reg1, \reg2, [\dst]
>   .endm
>   
> +.macro zero_pair dst, offset, tmp1, tmp2
> +    mov \tmp1, #0
> +    mov \tmp2, #0
> +    strd \tmp1, \tmp2, [\dst, \offset]
> +.endm
 > +

TBH the addition of zero_pair feels a bit overkill when there is one 
user. Why can't we open-code the use case below and use ``store_pair``?

This would also avoid the "tmp1" and "tmp2" which are not used by arm64.

Cheers,

-- 
Julien Grall


