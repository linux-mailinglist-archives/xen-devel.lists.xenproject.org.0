Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA3ADB2EB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017294.1394272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAQj-0001Pi-Of; Mon, 16 Jun 2025 14:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017294.1394272; Mon, 16 Jun 2025 14:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAQj-0001Mu-Lf; Mon, 16 Jun 2025 14:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1017294;
 Mon, 16 Jun 2025 14:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppVY=Y7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRAQi-0001Mo-IW
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:03:20 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8261af6-4aba-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 16:03:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45347d6cba3so3060205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 07:03:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568b2a6a5sm11098350f8f.74.2025.06.16.07.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 07:03:17 -0700 (PDT)
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
X-Inumbo-ID: a8261af6-4aba-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750082599; x=1750687399; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pEtEOo3dPtG5Q3CZ9+L4F/cR8dKjHzu15YAAfWeblos=;
        b=BjIwQJpEfBl7KkhIwKBGmYP3p4nRUT92xG6AFBLJCXsnjfVRcXzLPzICKkmKxGgAao
         84lfJvKzwaq+3uXUD/N59/fJE4d2PLnqeg0Ji1Z55R20BfVpuQ7XUb99Vp7y9bNP/rip
         brYbXe2r28w0IjMKGgVXnATaqMchXUEg3hk60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082599; x=1750687399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEtEOo3dPtG5Q3CZ9+L4F/cR8dKjHzu15YAAfWeblos=;
        b=km9XR8TnfrC1fxH/ruY5FKOAec5/f1ez+0/Db2x87q4b1oB3+XcjIrAebLG6DBMURs
         Yz297/NSZZMPftUaHStyHrgjk+NNVjmqcv2wUDV3NwCIeUN8ufhLA0UpCi8XT+iOzkeV
         alo05Wek6pn6iw+80mis36SFQuhjwyUclp2HgyMeCx8yjhEwkQ/WmptMuarkMqV5it+o
         pBd/EUv4EwdVlyMK8WnbzTWv7Rnyz8oz2N+/K+x0Jwi+Ipu419PxilpMENYBNzNdAo+g
         /0a5PwF7W2DkU63PjP9QVz6pncXejqoN/WYViDqDooyJxHUN+w2dJXgzKyMdbmSyuths
         okxA==
X-Gm-Message-State: AOJu0YzV+BjacQmCOXrSp3y7jEHbft4MNDcg0D7yjkxcE8NpHERpzeaf
	q85mVCDTC09RW+Ctfbiihz3qzguRgjfktnYcdp6hs0bJ9NeWoj7DXyP1pDCnoM15gfY=
X-Gm-Gg: ASbGnctbcBu7INCd2l9CMZZDt0FlfshQ3EFLoMWHx2InpraBC4kAuAIjRhDD0dGyQPv
	gbfJiWvzUC4F5EYcsmSVZN9vHixqvxmToz/j6MWueTqcyBzxrK01I90pIKRQucv87I9BldJY9S5
	hUAGKoHprKj1iyX5+vVML+V8QYAZbcj2bLLuY9Yow8GpQiZTT+TEwDiq4eOCIG20qh1sjMNs0zB
	3GVGOL1JkfYonjToYkDS6PkHG45rznKSX0HqVYKDdrlGrdsLberoBaNsT6KGJ/tT6DXrkWSTufi
	NqDdg8pnaBGodL9IWSAQUyBehPsu/RJ0CGqkTWUu7SkBUJL7gBMD718a3Z5fCwU+qua+bLPynPU
	4o4PHM0bWvd9YKIcwPB7xAxWYLQDx026ftD5XzONTC8F2wQ==
X-Google-Smtp-Source: AGHT+IGVcdSRHWnzf31oIyEOK0xRshXxIdb08Yr/8B8YUWUXjaGkBU7v+Tx3mw0wLPWxWsxTxR6Omg==
X-Received: by 2002:a05:600c:8b2a:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4533cb488b5mr88651025e9.17.1750082597818;
        Mon, 16 Jun 2025 07:03:17 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:03:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v7] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aFAkIqMPyMLAIBh0@macbook.local>
References: <20250610144500.3176661-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610144500.3176661-1-dmukhin@ford.com>

On Tue, Jun 10, 2025 at 02:45:12PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() to simplify future modifications.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - simplified checks for PV further
> 
> Link to v6: https://lore.kernel.org/xen-devel/20250610004216.3012253-1-dmukhin@ford.com/
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1862559089
> ---
>  xen/arch/x86/domain.c | 78 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7536b6c871..fdbd064ebf 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -743,32 +743,74 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return 0;
>  }
>  
> +/*
> + * Verify that the domain's emulation flags resolve to a supported configuration.
> + *
> + * This ensures we only allow a known, safe subset of emulation combinations
> + * (for both functionality and security). Arbitrary mixes are likely to cause
> + * errors (e.g. null pointer dereferences).
> + *
> + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> + * symbols.

Not sure if it's worth expanding the sentence a bit to add the reason
why X86_EMU_XXX should be used (so that we take build-time config
options into account for short-circuited emulations).

> + */
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    enum {
> +        CAP_PV          = BIT(0, U),
> +        CAP_HVM         = BIT(1, U),
> +        CAP_HWDOM       = BIT(2, U),
> +        CAP_DOMU        = BIT(3, U),
> +    };

You probably want to name this type.

> +    static const struct {
> +        unsigned int caps;

So it can be used here

> +        uint32_t min;
> +        uint32_t opt;
> +    } configs[] = {
> +#ifdef CONFIG_PV
> +        /* PV dom0 and domU */
> +        {
> +            .caps   = CAP_PV | CAP_HWDOM | CAP_DOMU,
> +            .opt    = X86_EMU_PIT,
> +        },
> +#endif /* #ifdef CONFIG_PV */
> +
> +#ifdef CONFIG_HVM
> +        /* PVH dom0 */
> +        {
> +            .caps   = CAP_HVM | CAP_HWDOM,
> +            .min    = X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +        },
> +
> +        /* PVH domU */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_LAPIC,
> +        },
> +
> +        /* HVM domU */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> +            /* HVM PIRQ feature is user-selectable. */
> +            .opt    = X86_EMU_USE_PIRQ,
> +        },
> +#endif /* #ifdef CONFIG_HVM */
> +    };
> +    unsigned int i;
> +    unsigned int caps = (is_pv_domain(d) ? CAP_PV : CAP_HVM) |
> +                        (is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU);

And here instead of using unsigned int?

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
> +        if ( (caps & configs[i].caps) == caps &&
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

