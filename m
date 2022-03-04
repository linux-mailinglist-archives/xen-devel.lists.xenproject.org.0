Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3174CDD68
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 20:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284878.484116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQDtO-0003tc-65; Fri, 04 Mar 2022 19:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284878.484116; Fri, 04 Mar 2022 19:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQDtO-0003rO-2J; Fri, 04 Mar 2022 19:47:10 +0000
Received: by outflank-mailman (input) for mailman id 284878;
 Fri, 04 Mar 2022 19:47:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQDtN-0003rI-Cq
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 19:47:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQDtM-0001f4-Nx; Fri, 04 Mar 2022 19:47:08 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQDtM-00052L-HP; Fri, 04 Mar 2022 19:47:08 +0000
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
	bh=MHZ1ghPOuUlg0YkSfRK3QND5tj+Y12pFl7behRxNpkc=; b=HfKTR+0Pc1XCPBgBLKqEVYiUXb
	LkNmVsC+wTVExQ/r6P6hwWPniI88NXJggrHFYl36j4h3JkJl30mrMBEZFW0U7esDqt0iKZ4CKoalI
	oGhxY1/2MjRUxVnUu2ZsVOswXvYK7GIzbHyuAOp+VRWxWYFZF/JOekBeRbYGcPrLG+Y8=;
Message-ID: <d6216110-7cf0-b647-8a5d-ec5f8f437941@xen.org>
Date: Fri, 4 Mar 2022 19:47:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 27/36] xen/arch: add coloring support for Xen
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-28-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-28-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Introduce a new implementation of setup_pagetables that uses coloring
> logic in order to isolate Xen code using its color selection.
> Page tables construction is essentially copied, except for the xenmap
> table, where coloring logic is needed.  Given the absence of a contiguous
> physical mapping, pointers to next level tables need to be manually
> calculated.

The implementation of setup_pagetables() is not compliant to the Arm 
Arm. And I have plan to completely get rid of it.

The main part that is not compliant is switch_ttbr() because it keeps 
the MMU on. We should switch the MMU off, update the TTBR and then 
switch on the MMU. This implies that we need an identity mapping of the 
part of Xen that will run with MMU off.

I understand that rebuilding the page-tables and therefore switching the 
TTBR will be necessary for cache coloring. So before any new use, I 
would like the implementation of switch_ttbr() to be fixed.

What we will need to do is find space in the virtual layout that also 
match a physical address. With that in place, we could use the mapping 
to switch between TTBR.

[...]

>   void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
> @@ -721,6 +885,7 @@ void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
>       per_cpu(xen_dommap, 0) = cpu0_dommap;
>   #endif
>   }
> +#endif /* !CONFIG_COLORING */
>   
>   static void clear_boot_pagetables(void)
>   {
> @@ -735,6 +900,9 @@ static void clear_boot_pagetables(void)
>   #endif
>       clear_table(boot_second);
>       clear_table(boot_third);
> +#ifdef CONFIG_COLORING
> +    clear_table(boot_colored_xen);
> +#endif

AFAICT, this is going to clear the boot pagetables in the cache coloring 
version of Xen. However, the secondary CPUs will build their page-tables 
using the version in the old Xen.

So you will need to update the code to clear the correct boot page tables.

[...]

> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 0c90c2305c..d443fac6a2 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -25,6 +25,7 @@
>   #include <asm/cpufeature.h>
>   #include <asm/psci.h>
>   #include <asm/acpi.h>
> +#include <asm/coloring.h>
>   
>   /*
>    * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -49,7 +50,8 @@ int call_psci_cpu_on(int cpu)
>   {
>       struct arm_smccc_res res;
>   
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
> +    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                  __pa(virt_boot_xen((vaddr_t)init_secondary)),
>                     &res);
>   
>       return PSCI_RET(res);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 13b10515a8..294b806120 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -924,6 +924,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       struct domain *d;
>       int rc;
>       paddr_t xen_paddr = (paddr_t)(_start + boot_phys_offset);
> +    uint32_t xen_size = (_end - _start);
>   
>       dcache_line_bytes = read_dcache_line_bytes();
>   
> @@ -952,13 +953,16 @@ void __init start_xen(unsigned long boot_phys_offset,
>       if ( !coloring_init() )
>           panic("Xen Coloring support: setup failed\n");
>   
> +    xen_size = XEN_COLOR_MAP_SIZE;
> +#ifdef CONFIG_COLORING
> +    xen_paddr = get_xen_paddr(xen_size);
> +#endif
> +
>       /* Register Xen's load address as a boot module. */
> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr,
> -                             (paddr_t)(uintptr_t)(_end - _start + 1), false);
> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr, xen_size, false);

How do you plan to exclude the memory allocate the cache coloring version?

Cheers,

-- 
Julien Grall

