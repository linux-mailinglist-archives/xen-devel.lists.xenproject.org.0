Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580832D4C73
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48732.86223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6fD-0002aG-6t; Wed, 09 Dec 2020 21:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48732.86223; Wed, 09 Dec 2020 21:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6fD-0002Zm-3H; Wed, 09 Dec 2020 21:06:19 +0000
Received: by outflank-mailman (input) for mailman id 48732;
 Wed, 09 Dec 2020 21:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn6fB-0002Xx-Lj
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:06:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e5a828-96d1-4c7e-97a7-e8756cdfa7a7;
 Wed, 09 Dec 2020 21:06:17 +0000 (UTC)
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
X-Inumbo-ID: 65e5a828-96d1-4c7e-97a7-e8756cdfa7a7
Date: Wed, 9 Dec 2020 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607547976;
	bh=G4kJOcGJNyShlWbHMpv/xprT01PekoPSCbwvRQ3T/LQ=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=E4oKLaT6iZq/7WPvetWRYsGL+D2XEr0dw9W4LeDiC0NQDuaXuLfN7aSTp/yYxi+UV
	 xWl8zLHk1cI0CXWY4eNOIQY7cmBLf/5jJuR1DTHclCcOeoIz8vz2NeIvpaX/f8nODx
	 MklUGZXIskaBuOTpRvpUbiUQYqQpiNs4kkJmPYzv5bxA5uG6IyQahhZqJppfmXme9Z
	 kR1k9fX1Ip5oBx0f1CVNmUTZtT2XjldtZhGVMjeJvBqyI9abUqRQZ179w2QR1NA3nB
	 767m9nf/h2+nqZOg6tTjJy46WFDgyy6v4KGvy4laMlSTu7gwJjqdTV0j37KOCP06dm
	 t3YeSBy6a2o+w==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
In-Reply-To: <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012091115280.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> Create a cpuinfo structure for guest and mask into it the features that
> we do not support in Xen or that we do not want to publish to guests.
> 
> Modify some values in the cpuinfo structure for guests to mask some
> features which we do not want to allow to guests (like AMU) or we do not
> support (like SVE).
> 
> The code is trying to group together registers modifications for the
> same feature to be able in the long term to easily enable/disable a
> feature depending on user parameters or add other registers modification
> in the same place (like enabling/disabling HCR bits).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V2: Rebase
> Changes in V3:
>   Use current_cpu_data info instead of recalling identify_cpu
> 
> ---
>  xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/cpufeature.h |  2 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index bc7ee5ac95..7255383504 100644
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
> @@ -157,6 +159,55 @@ void identify_cpu(struct cpuinfo_arm *c)
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
> +    guest_cpuinfo = current_cpu_data;
> +
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
> index 6cf83d775b..10b62bd324 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -283,6 +283,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
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

