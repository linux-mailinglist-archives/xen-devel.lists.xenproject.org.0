Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BACAE02F6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 12:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019872.1396325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSCtW-0001Jm-Vv; Thu, 19 Jun 2025 10:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019872.1396325; Thu, 19 Jun 2025 10:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSCtW-0001IL-T0; Thu, 19 Jun 2025 10:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1019872;
 Thu, 19 Jun 2025 10:53:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uSCtV-0001IF-Ar
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 10:53:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uSCtU-009XKb-1u;
 Thu, 19 Jun 2025 10:53:20 +0000
Received: from [2a02:8012:3a1:0:3dca:1b8d:78be:b4fc]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uSCtU-00Admh-0k;
 Thu, 19 Jun 2025 10:53:20 +0000
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
	bh=AzZT0l5Je7VzzDNfzVeDAbQ20fPO4ZcYYmO2GMPNJ2k=; b=R1s70RVIGg/cPCH47mOmrez8+Z
	WiJtlV+Vl7OGDrF9i/UBGr5Q3N+EUx6/Yf3wP1FGLZrYIhlfA02ZXy4VybjhQfPuqWfaND4qrv6rl
	K2oUFrMs2DGNSaHLuzw2HYqijCnWL2Wj/Ua1BxksnzSe8pCEHnbskKxLYp2ypzPf0FEo=;
Message-ID: <374ccb5b-8d43-4ac8-bef9-5fd3a4d5ca76@xen.org>
Date: Thu, 19 Jun 2025 11:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions
 for arm32
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Hari Limaye <hari.limaye@arm.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 17/06/2025 12:12, Ayan Kumar Halder wrote:
> Define prepare_selector(), read_protection_region() and
> write_protection_region() for arm32. Also, define
> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 254.
> 
> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
> Enable pr_of_addr() for arm32.
> 
> The maximum number of regions supported is 255 (which corresponds to the
> maximum value in HMPUIR).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes from :-
> 
> v1 - 1. Enable write_protection_region() for aarch32.
> 
> v2 - 1. Enable access to protection regions from 0 - 255.
> 
> v3 - 1. The maximum number of regions is 255. Thus, regions numbered 0 - 254
> are supported.
> 
> 2. prepare_selector() is modified to ensure HPRSELR is written when accessing
> any region beyond 31 and the current value differs from the region number to
> be accessed.
> 
>   xen/arch/arm/include/asm/mpu.h  |   2 -
>   xen/arch/arm/mpu/Makefile       |   1 +
>   xen/arch/arm/mpu/arm32/Makefile |   1 +
>   xen/arch/arm/mpu/arm32/mm.c     | 164 ++++++++++++++++++++++++++++++++
>   xen/arch/arm/mpu/mm.c           |   2 -
>   5 files changed, 166 insertions(+), 4 deletions(-)
>   create mode 100644 xen/arch/arm/mpu/arm32/Makefile
>   create mode 100644 xen/arch/arm/mpu/arm32/mm.c
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 8f06ddac0f..63560c613b 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -25,7 +25,6 @@
>   
>   #ifndef __ASSEMBLY__
>   
> -#ifdef CONFIG_ARM_64
>   /*
>    * Set base address of MPU protection region.
>    *
> @@ -85,7 +84,6 @@ static inline bool region_is_valid(const pr_t *pr)
>   {
>       return pr->prlar.reg.en;
>   }
> -#endif /* CONFIG_ARM_64 */
>   
>   #endif /* __ASSEMBLY__ */
>   
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 5ad15e93be..58c9b5b4e8 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_ARM_32) += domain-page.o
> +obj-$(CONFIG_ARM_32) += arm32/
>   obj-$(CONFIG_ARM_64) += arm64/
>   obj-y += mm.o
>   obj-y += p2m.o
> diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
> new file mode 100644
> index 0000000000..b18cec4836
> --- /dev/null
> +++ b/xen/arch/arm/mpu/arm32/Makefile
> @@ -0,0 +1 @@
> +obj-y += mm.o
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> new file mode 100644
> index 0000000000..c0317a4ada
> --- /dev/null
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/types.h>
> +#include <asm/mpu.h>
> +#include <asm/sysregs.h>
> +#include <asm/system.h>
> +
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
> +    case num:                                             \
> +    {                                                     \
> +        WRITE_SYSREG(pr->prbar.bits, HPRBAR##num);        \
> +        WRITE_SYSREG(pr->prlar.bits, HPRLAR##num);        \
> +        break;                                            \
> +    }
> +
> +#define GENERATE_WRITE_PR_REG_OTHERS(num, pr)             \
> +    case num:                                             \
> +    {                                                     \
> +        WRITE_SYSREG(pr->prbar.bits, HPRBAR);             \
> +        WRITE_SYSREG(pr->prlar.bits, HPRLAR);             \
> +        break;                                            \
> +    }
> +
> +#define GENERATE_READ_PR_REG_CASE(num, pr)                \
> +    case num:                                             \
> +    {                                                     \
> +        pr->prbar.bits = READ_SYSREG(HPRBAR##num);        \
> +        pr->prlar.bits = READ_SYSREG(HPRLAR##num);        \
> +        break;                                            \
> +    }
> +
> +#define GENERATE_READ_PR_REG_OTHERS(num, pr)              \
> +    case num:                                             \
> +    {                                                     \
> +        pr->prbar.bits = READ_SYSREG(HPRBAR);             \
> +        pr->prlar.bits = READ_SYSREG(HPRLAR);             \
> +        break;                                            \
> +    }
> +
> +/*
> + * Armv8-R supports direct access and indirect access to the MPU regions through
> + * registers:
> + *  - indirect access involves changing the MPU region selector, issuing an isb
> + *    barrier and accessing the selected region through specific registers
> + *  - direct access involves accessing specific registers that point to
> + *    specific MPU regions, without changing the selector, avoiding the use of
> + *    a barrier.
> + * For Arm32 the HPR{B,L}AR<n> (for n=0..31) are used for direct access to the
> + * first 32 MPU regions.
> + * For MPU region numbered 32..254, one need to set the region number in HPRSELR,
> + * followed by configuring HPR{B,L}AR.
> + */
> +static void prepare_selector(uint8_t *sel)
> +{
> +    uint8_t cur_sel = *sel;
> +    /* The top 24 bits of HPRSELR are RES0. */
> +    uint8_t val = READ_SYSREG(HPRSELR) & 0xff;
> +
> +    if ( (cur_sel > 31) && (cur_sel != val) )
> +    {
> +        WRITE_SYSREG(cur_sel, HPRSELR);
> +        isb();
> +    }
> +}
> +
> +void read_protection_region(pr_t *pr_read, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_READ_PR_REG_CASE(0, pr_read);
> +        GENERATE_READ_PR_REG_CASE(1, pr_read);
> +        GENERATE_READ_PR_REG_CASE(2, pr_read);
> +        GENERATE_READ_PR_REG_CASE(3, pr_read);
> +        GENERATE_READ_PR_REG_CASE(4, pr_read);
> +        GENERATE_READ_PR_REG_CASE(5, pr_read);
> +        GENERATE_READ_PR_REG_CASE(6, pr_read);
> +        GENERATE_READ_PR_REG_CASE(7, pr_read);
> +        GENERATE_READ_PR_REG_CASE(8, pr_read);
> +        GENERATE_READ_PR_REG_CASE(9, pr_read);
> +        GENERATE_READ_PR_REG_CASE(10, pr_read);
> +        GENERATE_READ_PR_REG_CASE(11, pr_read);
> +        GENERATE_READ_PR_REG_CASE(12, pr_read);
> +        GENERATE_READ_PR_REG_CASE(13, pr_read);
> +        GENERATE_READ_PR_REG_CASE(14, pr_read);
> +        GENERATE_READ_PR_REG_CASE(15, pr_read);
> +        GENERATE_READ_PR_REG_CASE(16, pr_read);
> +        GENERATE_READ_PR_REG_CASE(17, pr_read);
> +        GENERATE_READ_PR_REG_CASE(18, pr_read);
> +        GENERATE_READ_PR_REG_CASE(19, pr_read);
> +        GENERATE_READ_PR_REG_CASE(20, pr_read);
> +        GENERATE_READ_PR_REG_CASE(21, pr_read);
> +        GENERATE_READ_PR_REG_CASE(22, pr_read);
> +        GENERATE_READ_PR_REG_CASE(23, pr_read);
> +        GENERATE_READ_PR_REG_CASE(24, pr_read);
> +        GENERATE_READ_PR_REG_CASE(25, pr_read);
> +        GENERATE_READ_PR_REG_CASE(26, pr_read);
> +        GENERATE_READ_PR_REG_CASE(27, pr_read);
> +        GENERATE_READ_PR_REG_CASE(28, pr_read);
> +        GENERATE_READ_PR_REG_CASE(29, pr_read);
> +        GENERATE_READ_PR_REG_CASE(30, pr_read);
> +        GENERATE_READ_PR_REG_CASE(31, pr_read);
> +        GENERATE_READ_PR_REG_OTHERS(32 ... 254, pr_read);
> +    default:
> +        BUG(); /* Can't happen */
> +        break;
> +    }
> +}
> +
> +void write_protection_region(const pr_t *pr_write, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
> +        GENERATE_WRITE_PR_REG_OTHERS(32 ... 254, pr_write);
> +    default:
> +        BUG(); /* Can't happen */
> +        break;
> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 7ab68fc8c7..ccfb37a67b 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -39,7 +39,6 @@ static void __init __maybe_unused build_assertions(void)
>       BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>   }
>   
> -#ifdef CONFIG_ARM_64
>   pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>   {
>       unsigned int attr_idx = PAGE_AI_MASK(flags);
> @@ -110,7 +109,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>   
>       return region;
>   }
> -#endif /* CONFIG_ARM_64 */
>   
>   void __init setup_mm(void)
>   {

-- 
Julien Grall


