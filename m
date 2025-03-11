Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62505A5D2ED
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 00:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909518.1316455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts8dv-0002hP-2H; Tue, 11 Mar 2025 23:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909518.1316455; Tue, 11 Mar 2025 23:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts8du-0002f9-Th; Tue, 11 Mar 2025 23:04:10 +0000
Received: by outflank-mailman (input) for mailman id 909518;
 Tue, 11 Mar 2025 23:04:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts8dt-0002f3-69
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 23:04:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts8ds-00ElNS-2T;
 Tue, 11 Mar 2025 23:04:08 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts8ds-005bK7-0q;
 Tue, 11 Mar 2025 23:04:08 +0000
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
	bh=D7XPpLUmOlvkrbBskEb4nrzCSx2P8UAgHA84vsAuRHc=; b=4+hzcNbdN7aFME6fFx0xHaS4Gf
	HdRkPOFcNFO3MfsxRVXv01RJXe8F2hKg8c/EVK65znC9G3b4iSws+NWShccxPuwZ8WMPR5FzL2Wkg
	tgYGITGqg2SWWcCCXUHb7ZuPiBZgoqYao3LXX+v88EREFHFfVSkvii2/4jb1b8R4c2kc=;
Message-ID: <1bcdca51-0f31-421c-81cf-699a1b94fbd6@xen.org>
Date: Tue, 11 Mar 2025 23:04:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] xen/arm: Resume memory management on Xen resume
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <2ef15cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2ef15cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 09:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The MMU needs to be enabled in the resume flow before the context
> can be restored (we need to be able to access the context data by
> virtual address in order to restore it). The configuration of system
> registers prior to branching to the routine that sets up the page
> tables is copied from xen/arch/arm/arm64/head.S.
> After the MMU is enabled, the content of TTBR0_EL2 is changed to
> point to init_ttbr (page tables used at runtime).
> 
> At boot the init_ttbr variable is updated when a secondary CPU is
> hotplugged. In the scenario where there is only one physical CPU in
> the system, the init_ttbr would not be initialized for the use in
> resume flow. To get the variable initialized in all scenarios in this
> patch we add that the boot CPU updates init_ttbr after it sets the
> page tables for runtime.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V3:
> - updated commit message
> - instead of using create_page_tables, enable_mmu, and mmu_init_secondary_cpu,
>    the existing function enable_secondary_cpu_mm is now used
> - prepare_secondary_mm (previously init_secondary_pagetables in the previous
>    patch series) is now called at the end of start_xen instead of
>    setup_pagetables. Calling it in the previous location caused a crash
> - add early printk init during resume
> 
> Changes in V2:
> - moved hyp_resume to head.S to place it near the rest of the start code
> - simplified the code in hyp_resume by using existing functions such as
>    check_cpu_mode, cpu_init, create_page_tables, and enable_mmu
> ---
>   xen/arch/arm/arm64/head.S | 23 +++++++++++++++++++++++
>   xen/arch/arm/setup.c      |  8 ++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 3522c497c5..fab2812e54 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -564,6 +564,29 @@ END(efi_xen_start)
>   #ifdef CONFIG_SYSTEM_SUSPEND
>   
>   FUNC(hyp_resume)
> +        msr   DAIFSet, 0xf           /* Disable all interrupts */

Surely we should be here with interrupts disabled. No?

> +
> +        tlbi  alle2
> +        dsb   sy                     /* Ensure completion of TLB flush */

This doesn't exist when booting Xen and I am not sure why we would need 
it for resume as we already nuke the TLbs in enable_mmu. Can you clarify?

> +        isb
> +
> +        ldr   x0, =start
> +        adr   x19, start             /* x19 := paddr (start) */
> +        sub   x20, x19, x0           /* x20 := phys-offset */

Looking at the code, I wonder if it is still necessary to set x19 and 
x20 for booting secondary CPUs and resume. There doesn't seem to be any 
use of the registers.

> +
> +        /* Initialize the UART if earlyprintk has been enabled. */
> +#ifdef CONFIG_EARLY_PRINTK
> +        bl    init_uart
> +#endif
> +        PRINT_ID("- Xen resuming -\r\n")
> +
> +        bl    check_cpu_mode
> +        bl    cpu_init
> +
> +        ldr   lr, =mmu_resumed
> +        b     enable_secondary_cpu_mm
> +
> +mmu_resumed:
>           b .
>   END(hyp_resume)
>   
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index ffcae900d7..3a89ac436b 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -508,6 +508,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>       for_each_domain( d )
>           domain_unpause_by_systemcontroller(d);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /*
> +     * It is called to initialize init_ttbr.
> +     * Without this call, Xen gets stuck after resuming.

This is not a very descriptive comment. But, you seem to make the 
assumption that prepare_secondary_mm() can be called on the boot CPU. 
This is not always the case. For instance on arm32, it will allocate 
memory and overwrite the per-cpu page-tables pointer (not great). This 
will also soon be the case for arm64.

Furthermore, this call reminded me that the secondary CPU page-tables 
are not freed when turning off a CPU. So they will leak. Not yet a 
problem for arm64 though.

So overall, I think we need a separate function that will be prepare 
init_ttbr for a given CPU (not allocate any memory). This will then need 
to be called from the suspend helper.

> +     */
 > +    prepare_secondary_mm(0);> +#endif
> +
>       /* Switch on to the dynamically allocated stack for the idle vcpu
>        * since the static one we're running on is about to be freed. */
>       memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),

Cheers,

-- 
Julien Grall


