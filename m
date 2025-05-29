Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155EEAC8548
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 01:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000269.1380609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmy6-0002SX-Km; Thu, 29 May 2025 23:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000269.1380609; Thu, 29 May 2025 23:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmy6-0002Pr-HA; Thu, 29 May 2025 23:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1000269;
 Thu, 29 May 2025 23:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKmy5-0002Pl-GB
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 23:47:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44077036-3ce7-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 01:47:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2595CA4FD13;
 Thu, 29 May 2025 23:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571C3C4CEE7;
 Thu, 29 May 2025 23:47:20 +0000 (UTC)
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
X-Inumbo-ID: 44077036-3ce7-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748562441;
	bh=VmHBNTzEsGFZH1JVr/mkgcHBWzzB4z5CYt3fb/dtee4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dva+GxYFJpBYeGbRS3MiFVm/+j0HivfeBbqMzb4wDBijk2BPwk8HegZoLyluMyEZl
	 ILXzXUcJIhh6u0t+ObzDBr3dpyXZVLP0QUQLneZrpdnkSR2qv6xV367KKgNmuQ9ung
	 +P8pDlPzPcmqeaFb2J7xrg3A14zTehS/ETn5fBbdqwNZt6gn5VBjrsOxkbbG60o6nz
	 cLzaz3UcaulbSnkjoXATG01yg85vo77E1k+fYioezqJ1kXyuCWs1w/YzjNlgDoPFaC
	 oMLTP7eVmf65uMOpUB3oXjJGZzDJ2B8RhcDYMfy9pOLjFkTwbhTi5sk7YaW52jnqKl
	 TH1DS6RXPtF1A==
Date: Thu, 29 May 2025 16:47:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3 2/2] xen/domain: rewrite emulation_flags_ok()
In-Reply-To: <20250528210139.2572609-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505291645090.135336@ubuntu-linux-20-04-desktop>
References: <20250528210139.2572609-1-dmukhin@ford.com> <20250528210139.2572609-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() to simplify future modifications.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - addressed review feedback
> - added some explanatory comments for emulation_flags_ok()
> ---
>  xen/arch/x86/domain.c | 92 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 74 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 0363ccb384..1d41d26c4d 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -743,32 +743,88 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return 0;
>  }
>  
> +/*
> + * Verify that the domain's emulation flags resolve to a supported configuration.
> + *
> + * This ensures we only allow a known, safe subset of emulation combinations
> + * (for both functionality and security). Arbitrary mixes are likely to cause
> + * errors (e.g., null pointer dereferences).
> + *
> + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> + * symbols.
> + */
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    enum {
> +        CAP_PV          = BIT(0, U),
> +        CAP_HVM         = BIT(1, U),
> +        CAP_HWDOM       = BIT(2, U),
> +        CAP_DOMU        = BIT(3, U),
> +    };
> +    static const struct {
> +        unsigned int caps;
> +        uint32_t min;
> +        uint32_t opt;
> +    } configs[] = {
> +#ifdef CONFIG_PV
> +        /* PV */
> +        {
> +            .caps   = CAP_PV | CAP_DOMU,
> +            .min    = 0,
> +            .opt    = 0,
> +        },
> +
> +        /* PV (likely dom0) */
> +        {
> +            .caps   = CAP_PV | CAP_HWDOM,
> +            .min    = X86_EMU_PIT,
> +            .opt    = 0,
> +        },
> +#endif /* #ifdef CONFIG_PV */
> +
> +#ifdef CONFIG_HVM
> +        /* PVH dom0/domU or HVM domU */
> +        {
> +            .caps   = CAP_HVM | CAP_HWDOM,
> +            .min    = X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +            .opt    = 0,
> +        },
> +
> +

NIT: double \n

I checked carefully and the new semantic matches the old one with the
extra clarification that X86_EMU_PIT is only for hwdom.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +        /* HVM domU */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> +            /* HVM PIRQ feature is user-selectable. */
> +            .opt    = X86_EMU_USE_PIRQ,
> +        },
> +
> +        /* PVH */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_LAPIC,
> +            .opt    = 0,
> +        },
> +#endif /* #ifdef CONFIG_HVM */
> +    };
> +    unsigned int i, caps = is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU;
> +
> +    if ( is_pv_domain(d) )
> +        caps |= CAP_PV;
> +    else if ( is_hvm_domain(d) )
> +        caps |= CAP_HVM;
> +
>  #ifdef CONFIG_HVM
>      /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>  #endif
>  
> -    if ( is_hvm_domain(d) )
> -    {
> -        if ( is_hardware_domain(d) &&
> -             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> -            return false;
> -        if ( !is_hardware_domain(d) &&
> -             /* HVM PIRQ feature is user-selectable. */
> -             (emflags & ~X86_EMU_USE_PIRQ) !=
> -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> -             emflags != X86_EMU_LAPIC )
> -            return false;
> -    }
> -    else if ( emflags != 0 && emflags != X86_EMU_PIT )
> -    {
> -        /* PV or classic PVH. */
> -        return false;
> -    }
> +    for ( i = 0; i < ARRAY_SIZE(configs); i++ )
> +        if ( caps == configs[i].caps &&
> +             (emflags & ~configs[i].opt) == configs[i].min )
> +            return true;
>  
> -    return true;
> +    return false;
>  }
>  
>  void __init arch_init_idle_domain(struct domain *d)
> -- 
> 2.34.1
> 
> 

