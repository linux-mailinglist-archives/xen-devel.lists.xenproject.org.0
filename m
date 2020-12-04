Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF72CF7BC
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 00:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45129.80623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKxI-00039K-E4; Fri, 04 Dec 2020 23:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45129.80623; Fri, 04 Dec 2020 23:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKxI-00038s-9G; Fri, 04 Dec 2020 23:57:40 +0000
Received: by outflank-mailman (input) for mailman id 45129;
 Fri, 04 Dec 2020 23:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNFP=FI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klKxG-00038n-T1
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 23:57:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48ed7307-cfde-4bf3-b860-1304d03df2a9;
 Fri, 04 Dec 2020 23:57:38 +0000 (UTC)
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
X-Inumbo-ID: 48ed7307-cfde-4bf3-b860-1304d03df2a9
Date: Fri, 4 Dec 2020 15:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607126257;
	bh=5h37HYw38QL1InbByuCWEuuiG/Y2OGL9FZe2XfEIETo=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=KZ0NhyrsVXbfPNDqjW0roWv56n5aXd3VB93jD5XQbURqEi7v88xn25EroTTWkKq7h
	 KfJQaBaRBlKtEcxsjz3FNcs8nPnPHt0eJnUdciqlg0W52XypwiDSxbgTJhNJL9N2UC
	 25B7fwuZV4fG5CdmzBbX+lEr92iPyZHBPlSr6uSF8lcoxTUQ4BdhlP7yHKD+oDt1W+
	 wrICrUMTzoROy4zshk6la5MYGmUQoPjaxY5oEnfJ63/gXRlEmVlfH2xWWtAicVeRZP
	 QHZtgFRSkmZW5t84vUTw/DzE7kiprmnIX9BJQworvf8wYWXOX5AXws3BW5gWRLDIT3
	 dAorYU4rvNVoQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
In-Reply-To: <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012041531420.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606742184.git.bertrand.marquis@arm.com> <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Bertrand Marquis wrote:
> Create a cpuinfo structure for guest and mask into it the features that
> we do not support in Xen or that we do not want to publish to guests.
> 
> Modify some values in the cpuinfo structure for guests to mask some
> features which we do not want to allow to guests (like AMU) or we do not
> support (like SVE).

The first two sentences seem to say the same thing in two different
ways.


> The code is trying to group together registers modifications for the
> same feature to be able in the long term to easily enable/disable a
> feature depending on user parameters or add other registers modification
> in the same place (like enabling/disabling HCR bits).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/cpufeature.h |  2 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 204be9b084..309941ff37 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -24,6 +24,8 @@
>  
>  DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>  
> +struct cpuinfo_arm __read_mostly guest_cpuinfo;
> +
>  void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>                               const char *info)
>  {
> @@ -156,6 +158,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>  #endif
>  }
>  
> +/*
> + * This function is creating a cpuinfo structure with values modified to mask
> + * all cpu features that should not be published to guest.
> + * The created structure is then used to provide ID registers values to guests.
> + */
> +static int __init create_guest_cpuinfo(void)
> +{
> +    /*
> +     * TODO: The code is currently using only the features detected on the boot
> +     * core. In the long term we should try to compute values containing only
> +     * features supported by all cores.
> +     */
> +    identify_cpu(&guest_cpuinfo);

Given that we already have boot_cpu_data and current_cpu_data, which
should be already initialized at this point, we could simply:

  guest_cpuinfo = current_cpu_data;

or

  guest_cpuinfo = boot_cpu_data;

?


> +#ifdef CONFIG_ARM_64
> +    /* Disable MPAM as xen does not support it */
> +    guest_cpuinfo.pfr64.mpam = 0;
> +    guest_cpuinfo.pfr64.mpam_frac = 0;
> +
> +    /* Disable SVE as Xen does not support it */
> +    guest_cpuinfo.pfr64.sve = 0;
> +    guest_cpuinfo.zfr64.bits[0] = 0;
> +
> +    /* Disable MTE as Xen does not support it */
> +    guest_cpuinfo.pfr64.mte = 0;
> +#endif
> +
> +    /* Disable AMU */
> +#ifdef CONFIG_ARM_64
> +    guest_cpuinfo.pfr64.amu = 0;
> +#endif
> +    guest_cpuinfo.pfr32.amu = 0;
> +
> +    /* Disable RAS as Xen does not support it */
> +#ifdef CONFIG_ARM_64
> +    guest_cpuinfo.pfr64.ras = 0;
> +    guest_cpuinfo.pfr64.ras_frac = 0;
> +#endif
> +    guest_cpuinfo.pfr32.ras = 0;
> +    guest_cpuinfo.pfr32.ras_frac = 0;
> +
> +    return 0;
> +}
> +/*
> + * This function needs to be run after all smp are started to have
> + * cpuinfo structures for all cores.
> + */
> +__initcall(create_guest_cpuinfo);
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 64354c3f19..0ab6dd42a0 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -290,6 +290,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
>  extern struct cpuinfo_arm cpu_data[];
>  #define current_cpu_data cpu_data[smp_processor_id()]
>  
> +extern struct cpuinfo_arm guest_cpuinfo;
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> -- 
> 2.17.1
> 

