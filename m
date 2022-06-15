Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A554D10F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 20:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350278.576570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1XwT-0003CL-WB; Wed, 15 Jun 2022 18:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350278.576570; Wed, 15 Jun 2022 18:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1XwT-0003AZ-T0; Wed, 15 Jun 2022 18:40:37 +0000
Received: by outflank-mailman (input) for mailman id 350278;
 Wed, 15 Jun 2022 18:40:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1XwS-0003AT-9b
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 18:40:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1XwR-0008WF-S6; Wed, 15 Jun 2022 18:40:35 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.191]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1XwR-0004wC-7h; Wed, 15 Jun 2022 18:40:35 +0000
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
	bh=GxGTD/Pzc2KdlNWvdelO5Y4it1voapJw4z6VC9uObwg=; b=VWCZ7f/MPWheuPoAI1kC3efA9M
	2003BzRTxyoJs56ngFn+2EzPsYI0DsvJhLNr69m57zn0Qz2pMg9V1+xkmX3TwQlrzjELjAAEutgGZ
	meF5t9qu5HVLgDdot/IYcs2Z0/JHqrYLhEEajEf3eknCnKsRt65RGQjypxrisgi194CQ=;
Message-ID: <31ef4c2b-359a-76dd-652f-03a1c4d000c4@xen.org>
Date: Wed, 15 Jun 2022 19:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/4] xen/arm: Add sb instruction support
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1655124548.git.bertrand.marquis@arm.com>
 <7fa3bf8fc27bac120e28092c8c4081d1e58f0b79.1655124548.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7fa3bf8fc27bac120e28092c8c4081d1e58f0b79.1655124548.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 13/06/2022 13:53, Bertrand Marquis wrote:
> This patch is adding sb instruction support when it is supported by a
> CPU on arm64.
> A new cpu feature capability system is introduced to enable alternative
> code using sb instruction when it is supported by the processor. This is
> decided based on the isa64 system register value and use a new hardware
> capability ARM_HAS_SB.
> 
> The sb instruction is encoded using its hexadecimal value to avoid
> recursive macro and support old compilers not having support for sb
> instruction.
> 
> Arm32 instruction support is added but it is not enabled at the moment
> due to the lack of hardware supporting it.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v3:
> - rename ARM64_HAS_SB to ARM_HAS_SB
> - define sb before including per arch macros
> Changes in v2:
> - fix commit message
> - add comment to explain the extra nop
> - add support for arm32 and move macro back to arm generic header
> - fix macro comment indentation
> - introduce cpu feature system instead of using errata
> ---
>   xen/arch/arm/cpufeature.c             | 28 +++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/cpufeature.h |  6 +++++-
>   xen/arch/arm/include/asm/macros.h     | 19 +++++++++++++++++-
>   xen/arch/arm/setup.c                  |  3 +++
>   xen/arch/arm/smpboot.c                |  1 +
>   5 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index a58965f7b9..62d5e1770a 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -26,6 +26,24 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>   
>   struct cpuinfo_arm __read_mostly guest_cpuinfo;
>   
> +#ifdef CONFIG_ARM_64
> +static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
> +{
> +    return system_cpuinfo.isa64.sb;
> +}
> +#endif
> +
> +static const struct arm_cpu_capabilities arm_features[] = {
> +#ifdef CONFIG_ARM_64
> +    {
> +        .desc = "Speculation barrier instruction (SB)",
> +        .capability = ARM_HAS_SB,
> +        .matches = has_sb_instruction,
> +    },
> +#endif
> +    {},
> +};
> +
>   void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>                                const char *info)
>   {
> @@ -70,6 +88,16 @@ void __init enable_cpu_capabilities(const struct arm_cpu_capabilities *caps)
>       }
>   }
>   
> +void check_local_cpu_features(void)
> +{
> +    update_cpu_capabilities(arm_features, "enabled support for");
> +}
> +
> +void __init enable_cpu_features(void)
> +{
> +    enable_cpu_capabilities(arm_features);
> +}
> +
>   /*
>    * Run through the enabled capabilities and enable() them on the calling CPU.
>    * If enabling of any capability fails the error is returned. After enabling a
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index f7368766c0..24c01d2b9d 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -67,8 +67,9 @@
>   #define ARM_WORKAROUND_BHB_LOOP_24 13
>   #define ARM_WORKAROUND_BHB_LOOP_32 14
>   #define ARM_WORKAROUND_BHB_SMCC_3 15
> +#define ARM_HAS_SB 16
>   
> -#define ARM_NCAPS           16
> +#define ARM_NCAPS           17
>   
>   #ifndef __ASSEMBLY__
>   
> @@ -78,6 +79,9 @@
>   
>   extern DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>   
> +void check_local_cpu_features(void);
> +void enable_cpu_features(void);
> +
>   static inline bool cpus_have_cap(unsigned int num)
>   {
>       if ( num >= ARM_NCAPS )
> diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
> index 1aa373760f..dc791245df 100644
> --- a/xen/arch/arm/include/asm/macros.h
> +++ b/xen/arch/arm/include/asm/macros.h
> @@ -5,13 +5,30 @@
>   # error "This file should only be included in assembly file"
>   #endif
>   
> +#include <asm/alternative.h>
> +
>       /*
>        * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
>        */
>       .macro sb
> +alternative_if_not ARM_HAS_SB
>       dsb nsh
>       isb
> +alternative_else
> +    /*
> +     * SB encoding in hexadecimal to prevent recursive macro.
> +     * extra nop is required to keep same number of instructions on both sides
> +     * of the alternative.
> +     */
> +#if defined(CONFIG_ARM_32)
> +    .inst 0xf57ff070
> +#elif defined(CONFIG_ARM_64)
> +    .inst 0xd50330ff
> +#else
> +#   error "missing sb encoding for ARM variant"
> +#endif
> +    nop
> +alternative_endif
>       .endm
>   
>   #if defined (CONFIG_ARM_32)
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6016471d37..577c54e6fb 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -964,6 +964,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>        */
>       check_local_cpu_errata();
>   
> +    check_local_cpu_features();
> +
>       init_xen_time();
>   
>       gic_init();
> @@ -1033,6 +1035,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>        */
>       apply_alternatives_all();
>       enable_errata_workarounds();
> +    enable_cpu_features();
>   
>       /* Create initial domain 0. */
>       if ( !is_dom0less_mode() )
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 22fede6600..3f62f3a44f 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -395,6 +395,7 @@ void start_secondary(void)
>       local_abort_enable();
>   
>       check_local_cpu_errata();
> +    check_local_cpu_features();
>   
>       printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
>   

-- 
Julien Grall

