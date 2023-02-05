Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE268B1F4
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 22:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489923.758485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmcL-0007UP-GR; Sun, 05 Feb 2023 21:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489923.758485; Sun, 05 Feb 2023 21:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmcL-0007RV-Df; Sun, 05 Feb 2023 21:32:09 +0000
Received: by outflank-mailman (input) for mailman id 489923;
 Sun, 05 Feb 2023 21:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOmcK-0007RP-5Q
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 21:32:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmcJ-0001me-TK; Sun, 05 Feb 2023 21:32:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmcJ-0007lM-Oe; Sun, 05 Feb 2023 21:32:07 +0000
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
	bh=rgQPzDvNwaKEKzxLcArcFBSuFajaFYaULD9DIlRdUEY=; b=drtTmNOUOAb5jH8kUsYwgJOO9V
	jbpITAJGEbCH3TjTn52VR6O47TyYGYSRk/jhjcdViYx13KcKxem3QaoHRlZpcnMdvrQPwzXLAsGDl
	R7qc8VOLjyYqRlR/o6Bgu9wnZbE9Emgy2zH2sIabKv+m2qRR9+23fWR80VNXPSGyFts8=;
Message-ID: <906699b8-14ae-d038-3693-63338d7a52cf@xen.org>
Date: Sun, 5 Feb 2023 21:32:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/40] xen/arm: introduce setup_mm_mappings
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-17-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-17-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> Function setup_pagetables is responsible for boot-time pagetable setup
> in MMU system.
> But in MPU system, we have already built up start-of-day Xen MPU memory region
> mapping at the very beginning in assembly.
> 
> So in order to keep only one codeflow in arm/setup.c, setup_mm_mappings
> , with a more generic name, is introduced and act as an empty stub in
> MPU system.

is the empty stub temporarily?

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/mm.h     |  2 ++
>   xen/arch/arm/include/asm/mm_mpu.h | 16 ++++++++++++++++
>   xen/arch/arm/setup.c              |  2 +-
>   3 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/include/asm/mm_mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 1b9fdb6ff5..9b4c07d965 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -243,6 +243,8 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>   
>   #ifndef CONFIG_HAS_MPU
>   #include <asm/mm_mmu.h>
> +#else
> +#include <asm/mm_mpu.h>
>   #endif
>   
>   /* Page-align address and convert to frame number format */
> diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
> new file mode 100644
> index 0000000000..1f3cff7743
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mm_mpu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ARCH_ARM_MM_MPU__
> +#define __ARCH_ARM_MM_MPU__
> +
> +#define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
> +
> +#endif /* __ARCH_ARM_MM_MPU__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..d7d200179c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1003,7 +1003,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       /* Initialize traps early allow us to get backtrace when an error occurred */
>       init_traps();
>   
> -    setup_pagetables(boot_phys_offset);
> +    setup_mm_mappings(boot_phys_offset);

You are renaming the caller but not the function. Why?

>   
>       smp_clear_cpu_maps();
>   

Cheers,

-- 
Julien Grall

