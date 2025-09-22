Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE2B93452
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 22:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128031.1468525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0nUp-0004yX-OI; Mon, 22 Sep 2025 20:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128031.1468525; Mon, 22 Sep 2025 20:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0nUp-0004vo-Le; Mon, 22 Sep 2025 20:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1128031;
 Mon, 22 Sep 2025 20:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyC/=4B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v0nUo-0004vg-Ae
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 20:50:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10f1d97-97f5-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 22:50:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 23D5744FA2;
 Mon, 22 Sep 2025 20:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AAAC4CEF5;
 Mon, 22 Sep 2025 20:50:45 +0000 (UTC)
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
X-Inumbo-ID: d10f1d97-97f5-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574247;
	bh=nILeU37UX1ua/jwG/uBmy8uCKASAiO+/TPWVYEYKYDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KY1fPMpYJccRRvRfSLaUdp8eBGZeeGSp1E+ETef+QBaXy5JBE1UnM1A2SNAgNqR2d
	 pTwGr2URIvq7Rhm6hthlcdQ/f54MALZb+ly91TMbO55Ax5RDjXPlPfQZm/dYXKWXcy
	 6cc8aVHF0jHl/ImezmQUkSV4yG/5fbCzbltrVV1B38naSIZNSeLdYFBUYgQM/qjNFj
	 sRdO8EqXU5plm6wxwmdg0jpHrQgr0UarDrx6tK9Ea+kNjGpFF8fJxJFWOhldpIeScx
	 rbA1iWM73CKVow/dctjcF6nYwrO70cbAQfvRquQ+f9/acNzMDv78zUAYxJRgU68EUu
	 Eqkr73iuM1H0g==
Date: Mon, 22 Sep 2025 13:50:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
In-Reply-To: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509221348480.2244509@ubuntu-linux-20-04-desktop>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Sep 2025, Ayan Kumar Halder wrote:
> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
> Test that Xen is able to generate SGIs.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> One of the aim of functional safety is to test hw/sw interface. This means that
> Xen is able to configure the hardware correctly for the desired functionalities.
> 
> Normally this is tested from the VMs. For eg if a VM is able to receive irq, this
> implies that Xen has configured the GICv3 interface 'correctly'. However this is
> a high level (or integration) test which uses not only the GICv3 interface
> between Xen and VM, but the interrupt injection code for Xen to VMs.
> 
> We want to have some kind of unit tests to check that Xen is able to receive
> various interrupts, set priorities, etc. Here, we have written unit tests for
> software generated interrupts (SGIs) as example.
> 
> These tests are expected to be triggered as Xen boots (right after Xen has
> initialised the GICv3 interface ie gicv3_init(). The aim of this test is to
> check whether Xen can trigger SGIs after gicv3_init() is invoked. If so, we can
> claim that gicv3_init() was done properly to be able to trigger SGIs. Likewise
> we will have tests to check for priorities, SPIs, etc.
> 
> A script will parse the logs and claim that Xen is able to trigger SGIs.

I like this approach and I think it is OK if Xen is not functional after
some of the SELFTESTS because it is not the goal to run those in a
working system.

My only suggestion is to separate the SELFTESTS in a separate __init
function, keeping them isolated from the rest of the code, for simplicy
and also ease of understanding.

See for example stub_selftest.


>  xen/arch/arm/Kconfig  |  8 ++++++++
>  xen/arch/arm/gic-v3.c |  7 +++++++
>  xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 950e4452c1..739f99eaa9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -73,6 +73,14 @@ config GICV3
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
>  
> +config GICV3_SELFTEST
> +    bool "GICv3 driver self test"
> +    default n
> +    depends on GICV3
> +    ---help---
> +
> +      Self tests to validate GICV3 driver.
> +
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4e6c98bada..eb0c05231c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>  
>      gicv3_hyp_init();
>  
> +#ifdef CONFIG_GICV3_SELFTEST
> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
> +    send_SGI_self(GIC_SGI_DUMP_STATE);
> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
> +    send_SGI_self(GIC_SGI_MAX);
> +#endif
> +
>  out:
>      spin_unlock(&gicv3.lock);
>  
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index d922ea67aa..5cb58cdb92 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -346,6 +346,26 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>       */
>      smp_rmb();
>  
> +#ifdef CONFIG_GICV3_SELFTEST
> +    switch (sgi)
> +    {
> +    case GIC_SGI_EVENT_CHECK:
> +        printk("GIC_SGI_EVENT_CHECK received\n");
> +        break;
> +    case GIC_SGI_DUMP_STATE:
> +        printk("GIC_SGI_DUMP_STATE received\n");
> +        break;
> +    case GIC_SGI_CALL_FUNCTION:
> +        printk("GIC_SGI_CALL_FUNCTION received\n");
> +        break;
> +    case GIC_SGI_MAX:
> +        printk("GIC_SGI_MAX received\n");
> +        break;
> +    default:
> +        panic("Unknown SGI triggered\n");
> +        break;
> +    }
> +#else
>      switch (sgi)
>      {
>      case GIC_SGI_EVENT_CHECK:
> @@ -361,6 +381,7 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>          panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>          break;
>      }
> +#endif
>  
>      /* Deactivate */
>      gic_hw_ops->deactivate_irq(desc);
> -- 
> 2.25.1
> 

