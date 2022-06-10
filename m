Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C0546C3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 20:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346642.572511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzjFe-0006dS-GB; Fri, 10 Jun 2022 18:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346642.572511; Fri, 10 Jun 2022 18:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzjFe-0006bf-DJ; Fri, 10 Jun 2022 18:20:54 +0000
Received: by outflank-mailman (input) for mailman id 346642;
 Fri, 10 Jun 2022 18:20:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzjFd-0006bZ-8p
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 18:20:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzjFd-0006eP-09; Fri, 10 Jun 2022 18:20:53 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzjFc-0005xn-Ob; Fri, 10 Jun 2022 18:20:52 +0000
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
	bh=E/e75di51FqReb6gjA5OOPtz2t8eNRiBDZ4982t2t+k=; b=u23rpDxm+W4EYQYRyucBZw4Iu/
	zcnY4CWk5a+5pIxEZsD3hoh0+0D+dRoKT2KyJrNEfpC6tVklv9RkUswGHtR2EfISEms6zVS8UKeJT
	ib0nXWJrUWBAGKJ9ScJ+J5oXah9SK/Bzvw7XYN9tJ5c56AfZEdwQQsblzdbblP4ISlQo=;
Message-ID: <25cfe471-8e82-97cd-7a47-b5e85c849eae@xen.org>
Date: Fri, 10 Jun 2022 19:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] xen/arm: Add sb instruction support
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
 <efc2f01da9f9dfc0f678eaf7d8fe81f9b3d0cbc3.1653993431.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <efc2f01da9f9dfc0f678eaf7d8fe81f9b3d0cbc3.1653993431.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 31/05/2022 11:43, Bertrand Marquis wrote:
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index f7368766c0..9649a7afee 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -67,8 +67,9 @@
>   #define ARM_WORKAROUND_BHB_LOOP_24 13
>   #define ARM_WORKAROUND_BHB_LOOP_32 14
>   #define ARM_WORKAROUND_BHB_SMCC_3 15
> +#define ARM64_HAS_SB 16

The feature is for both 32-bit and 64-bit. So I would prefer if it is 
called ARM_HAS_SB.

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
> index 1aa373760f..33e863d982 100644
> --- a/xen/arch/arm/include/asm/macros.h
> +++ b/xen/arch/arm/include/asm/macros.h
> @@ -5,14 +5,7 @@
>   # error "This file should only be included in assembly file"
>   #endif
>   
> -    /*
> -     * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
> -     */
> -    .macro sb
> -    dsb nsh
> -    isb
> -    .endm

Looking at the patch bcab2ac84931 "xen/arm64: Place a speculation 
barrier following an ret instruction", the macro was defined before 
including <asm/arm*/macros.h> so 'sb' could be used in macros defined by 
the headers.

I can't remember whether I chose the order because I had a failure on 
some compilers. However, I couldn't find anything in the assembler 
documentation suggesting that a macro A could use B before it is used.

So I would rather avoid to move the macro if there are no strong 
argument for it.

> +#include <asm/alternative.h>
>   
>   #if defined (CONFIG_ARM_32)
>   # include <asm/arm32/macros.h>
> @@ -29,4 +22,28 @@
>       .endr
>       .endm
>   
> +    /*
> +     * Speculative barrier
> +     */
> +    .macro sb
> +alternative_if_not ARM64_HAS_SB
> +    dsb nsh
> +    isb
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
> +    .endm
> +
>   #endif /* __ASM_ARM_MACROS_H */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index ea1f5ee3d3..b44494c9a9 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -961,6 +961,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>        */
>       check_local_cpu_errata();
>   
> +    check_local_cpu_features();
> +
>       init_xen_time();
>   
>       gic_init();
> @@ -1030,6 +1032,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>        */
>       apply_alternatives_all();
>       enable_errata_workarounds();
> +    enable_cpu_features();
>   
>       /* Create initial domain 0. */
>       if ( !is_dom0less_mode() )
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 9bb32a301a..fb7cc43a93 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -389,6 +389,7 @@ void start_secondary(void)
>       local_abort_enable();
>   
>       check_local_cpu_errata();
> +    check_local_cpu_features();
>   
>       printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
>   

Cheers,

-- 
Julien Grall

