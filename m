Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3D7BAEFE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 00:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613163.953510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoXE6-0000Sz-OZ; Thu, 05 Oct 2023 22:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613163.953510; Thu, 05 Oct 2023 22:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoXE6-0000Qp-LZ; Thu, 05 Oct 2023 22:53:50 +0000
Received: by outflank-mailman (input) for mailman id 613163;
 Thu, 05 Oct 2023 22:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoXE5-0000Qj-Uy
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 22:53:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a8ba946-63d2-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 00:53:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7CAF0CE2473;
 Thu,  5 Oct 2023 22:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EF6C433C7;
 Thu,  5 Oct 2023 22:53:43 +0000 (UTC)
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
X-Inumbo-ID: 0a8ba946-63d2-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696546424;
	bh=inUW/zl+amBdD3v2Aah04R5NSnHA50HPSvUoFdUhKVc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n0p6pfINoXGDlPCeQdZ3EtYjzsV1Os7l1sH5zTvmU56J4SmIUZx1sueyhKMfvSnWh
	 ihtafSc4D7IycNDOUFgqR5Mev5jI37qltyttOPaL2vRnX1PZbKasSf9/Y4FC7Ctj4J
	 ArwKfaHINHwSWwJgLyOeBJ3ZX1xK70Wy3aeP0TU54kN2/h7kI6bm2FGu8MmYLESlnL
	 QcfxgvaS7zSMAsBmFjQUoxB4oxdEWtdxBJV+jc2m36IsILGr4y2JpWe6nj9mNzaxEr
	 VHRvSBM0FlCkIE4n0erD9WvfjccCKq2JvSsJaALL7q0wXECWznqGu0w062PDw63Pe+
	 XJHikyip/qqAQ==
Date: Thu, 5 Oct 2023 15:53:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
    dan.driscoll@siemens.com, arvind.raghuraman@siemens.com, 
    michal.orzel@amd.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical
 timer interrupt for ACPI
In-Reply-To: <20231005165454.18143-1-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310051552570.2348112@ubuntu-linux-20-04-desktop>
References: <20231005165454.18143-1-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
> the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
> in non-secure world is meant to ignore the values.
> 
> However, Xen is trying to reserve the value. When booting on Graviton
> 2 metal instances, this would result to crash a boot because the
> value is 0 which is already reserved (I haven't checked for which device).
> While nothing prevent a PPI to be shared, the field should have been
> ignored by Xen.
> 
> For the Device-Tree case, I couldn't find a statement suggesting
> that the secure physical timer interrupt  is ignored. In fact, I have
> found some code in Linux using it as a fallback. That said, it should
> never be used.
> 
> As I am not aware of any issue when booting using Device-Tree, the
> physical timer interrupt is only ignored for ACPI.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> This has not been tested on Graviton 2 because I can't seem to get
> the serial console working properly. @Dan would you be able to try it?
> 
> It would also be good to understand why 0 why already reserved. This
> may be a sign for other issues in the ACPI code.
> ---
>  xen/arch/arm/time.c   |  4 ----
>  xen/arch/arm/vtimer.c | 17 +++++++++++++++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 3535bd8ac7c7..8fc14cd3ff62 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -78,10 +78,6 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
>      irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
>      timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
>  
> -    irq_type = acpi_get_timer_irq_type(gtdt->secure_el1_flags);
> -    irq_set_type(gtdt->secure_el1_interrupt, irq_type);
> -    timer_irq[TIMER_PHYS_SECURE_PPI] = gtdt->secure_el1_interrupt;
> -
>      irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
>      irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
>      timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index c54360e20266..e73ae33c1b58 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -8,6 +8,7 @@
>   * Copyright (c) 2011 Citrix Systems.
>   */
>  
> +#include <xen/acpi.h>
>  #include <xen/lib.h>
>  #include <xen/perfc.h>
>  #include <xen/sched.h>
> @@ -61,10 +62,22 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>  
>      config->clock_frequency = timer_dt_clock_frequency;
>  
> -    /* At this stage vgic_reserve_virq can't fail */
> +    /*
> +     * Per the ACPI specification, providing a secure EL1 timer
> +     * interrupt is optional and will be ignored by non-secure OS.
> +     * Therefore don't reserve the interrupt number for the HW domain
> +     * and ACPI.
> +     *
> +     * Note that we should still reserve it when using the Device-Tree
> +     * because the interrupt is not optional. That said, we are not
> +     * expecting any OS to use it when running on top of Xen.
> +     *
> +     * At this stage vgic_reserve_virq() is not meant to fail.
> +    */

NIT: minor code style issue that can be solved on commit

Assuming it passes Dan's test:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>      if ( is_hardware_domain(d) )
>      {
> -        if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)) )
> +        if ( acpi_disabled &&
> +             !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)) )
>              BUG();
>  
>          if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_NONSECURE_PPI)) )
> -- 
> 2.40.1
> 

