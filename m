Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54288644E38
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455607.713126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2frE-0002ya-Bl; Tue, 06 Dec 2022 21:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455607.713126; Tue, 06 Dec 2022 21:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2frE-0002wp-8T; Tue, 06 Dec 2022 21:52:08 +0000
Received: by outflank-mailman (input) for mailman id 455607;
 Tue, 06 Dec 2022 21:52:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2frC-0002wj-UN
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:52:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2frC-0003U6-GA; Tue, 06 Dec 2022 21:52:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2frC-0003ag-Al; Tue, 06 Dec 2022 21:52:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=YHHIAWiZJz9+aky9OfP2qR7uY8Rr++QcRDmif+5d/bw=; b=UWok0XmvUv/8qlOhW2Z48/z1+Y
	khpnW7jK4uFH80tKv+j7LB/dbeZbN4j2S5DuFgetjgBHQCylPDKoDbTcIbAARUv8vk5nkB9t3BPOc
	2wkR0sFufWQrAvzIOkSSSyRmVUwjg1/frZ1125/TcZkyaLzocGetIlO2x5L8N3OmSBCA=;
Message-ID: <e225cf3f-ac77-7bf9-79ad-91bf9a09c8ff@xen.org>
Date: Tue, 6 Dec 2022 21:52:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <c4716207f7f269b8adf7ed1b1928558cfc1d3bc8.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 13/19] xen/arm: Resume memory management on Xen resume
In-Reply-To: <c4716207f7f269b8adf7ed1b1928558cfc1d3bc8.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The MMU needs to be enabled in the resume flow before the context
> can be restored (we need to be able to access the context data by
> virtual address in order to restore it). The configuration of system
> registers prior to branching to the routine that sets up the page
> tables is copied from xen/arch/arm/arm64/head.S.
> After the MMU is enabled, the content of TTBR0_EL2 is changed to
> point to init_ttbr (page tables used at runtime).

This is not Arm Arm compliant. Please look at the series [1] to see how 
you can safely switch the MMU on and use the page tables.

> 
> At boot the init_ttbr variable is updated when a secondary CPU is
> hotplugged. In the scenario where there is only one physical CPU in
> the system, the init_ttbr would not be initialized for the use in
> resume flow. To get the variable initialized in all scenarios in this
> patch we add that the boot CPU updates init_ttbr after it sets the
> page tables for runtime.
> 
> After the memory management is resumed, the SCTLR_WXN in SCTLR_EL2
> has to be set in order to configure that a mapping cannot be both
> writable and executable (this was configured prior to suspend).
> This is done using an existing function (mmu_init_secondary_cpu).
> 
> Update: moved hyp_resume to head.S to place it near the rest of the
> start code
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/arm64/entry.S      |  2 ++
>   xen/arch/arm/arm64/head.S       | 30 ++++++++++++++++++++++++++++++
>   xen/arch/arm/mm.c               |  1 +
>   xen/arch/arm/suspend.c          |  6 ++++++
>   xen/include/asm-arm/processor.h | 22 ++++++++++++++++++++++
>   5 files changed, 61 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index fc3811ad0a..f49f1daf46 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -1,4 +1,6 @@
>   #include <asm/current.h>
> +#include <asm/macros.h>
> +#include <asm/page.h>
>   #include <asm/regs.h>
>   #include <asm/alternative.h>
>   #include <asm/smccc.h>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 8857955699..82d83214dc 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -958,6 +958,36 @@ ENTRY(efi_xen_start)
>   ENDPROC(efi_xen_start)
>   
>   ENTRY(hyp_resume)
> +        msr   DAIFSet, 0xf           /* Disable all interrupts */
> +
> +        tlbi  alle2
> +        dsb   sy                     /* Ensure completion of TLB flush */
> +        isb

Please explain what this TLB is for.

> +
> +        ldr   x0, =start
> +        adr   x19, start             /* x19 := paddr (start) */
> +        sub   x20, x19, x0           /* x20 := phys-offset */
> +
> +        mov   x22, #0                /* x22 := is_secondary_cpu */

x22 is not hold the is_secondary_cpu anymore.

> +
> +        bl    check_cpu_mode
> +        bl    cpu_init
> +        bl    create_page_tables
> +        bl    enable_mmu
> +
> +        ldr   x0, =mmu_resumed      /* Explicit vaddr, not RIP-relative */
> +        br    x0                    /* Get a proper vaddr into PC */
> +
> +mmu_resumed:
> +        ldr   x4, =init_ttbr         /* VA of TTBR0_EL2 stashed by CPU 0 */
> +        ldr   x4, [x4]               /* Actual value */
> +        dsb   sy
> +        msr   TTBR0_EL2, x4
> +        dsb   sy
> +        isb
> +        tlbi  alle2
> +        dsb   sy                     /* Ensure completion of TLB flush */
> +        isb
>           b .
>   
>   /*
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index eea926d823..29cdaff3bf 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -708,6 +708,7 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>       switch_ttbr(ttbr);
>   
>       xen_pt_enforce_wnx();
> +    init_secondary_pagetables(0);

This function is used to prepare the page tables for the secondary CPUs. 
This may allocate memory. So this is incorrect to call for CPU0.

In this case, I think it would be better if the code to suspend sets 
init_ttbr and clear the boot pages tables. This could be done by split 
init_secondary_pagetables() in two:
  1) Allocate memory for the page tables
  2) Clear the boot page tables and the init_ttbr

>   
>   #ifdef CONFIG_ARM_32
>       per_cpu(xen_pgtable, 0) = cpu0_pgtable;
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index a0258befc9..aa5ee4714b 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -167,6 +167,12 @@ static long system_suspend(void *data)
>   
>       system_state = SYS_STATE_resume;
>   
> +    /*
> +     * SCTLR_WXN needs to be set to configure that a mapping cannot be both
> +     * writable and executable. This is done by mmu_init_secondary_cpu.
> +     */

Let's avoid to describe what a function does in the caller. This can be 
easily rot.

> +    mmu_init_secondary_cpu();

I dislike the idea of using this function here. It is meant to be used 
by secondary CPUs, not CPU0.

If you want to use it here, then it should be renamed to reflect how the 
function is used.

> +
>       gic_resume();
>   
>   resume_irqs:
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> index 8ab2940f68..ecf97f1ab4 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -133,6 +133,28 @@
>   #define TTBCR_PD1       (_AC(1,U)<<5)
>   
>   /* SCTLR System Control Register. */
> +/* HSCTLR is a subset of this. */
> +#define SCTLR_TE        (_AC(1,U)<<30)
> +#define SCTLR_AFE       (_AC(1,U)<<29)
> +#define SCTLR_TRE       (_AC(1,U)<<28)
> +#define SCTLR_NMFI      (_AC(1,U)<<27)
> +#define SCTLR_EE        (_AC(1,U)<<25)
> +#define SCTLR_VE        (_AC(1,U)<<24)
> +#define SCTLR_U         (_AC(1,U)<<22)
> +#define SCTLR_FI        (_AC(1,U)<<21)
> +#define SCTLR_WXN       (_AC(1,U)<<19)
> +#define SCTLR_HA        (_AC(1,U)<<17)
> +#define SCTLR_RR        (_AC(1,U)<<14)
> +#define SCTLR_V         (_AC(1,U)<<13)
> +#define SCTLR_I         (_AC(1,U)<<12)
> +#define SCTLR_Z         (_AC(1,U)<<11)
> +#define SCTLR_SW        (_AC(1,U)<<10)
> +#define SCTLR_B         (_AC(1,U)<<7)
> +#define SCTLR_C         (_AC(1,U)<<2)
> +#define SCTLR_A         (_AC(1,U)<<1)
> +#define SCTLR_M         (_AC(1,U)<<0)
> +
> +#define HSCTLR_BASE     _AC(0x30c51878,U)

I don't see any use of SCTLR_* and HSCTLR_* here. What why do you need 
to define them?

>   
>   /* Bits specific to SCTLR_EL1 for Arm32 */
>   

Cheers,

[2] https://lore.kernel.org/all/20221022150422.17707-1-julien@xen.org/

-- 
Julien Grall

