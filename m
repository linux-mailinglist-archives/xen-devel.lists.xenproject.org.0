Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA43ABF8CD
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992042.1375831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl2L-0007ed-Tf; Wed, 21 May 2025 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992042.1375831; Wed, 21 May 2025 15:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl2L-0007bW-QA; Wed, 21 May 2025 15:07:17 +0000
Received: by outflank-mailman (input) for mailman id 992042;
 Wed, 21 May 2025 15:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHl2K-0007bO-J3
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:07:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47180149-3655-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 17:07:14 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso62514665e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:07:14 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442eb85a8f8sm160210345e9.0.2025.05.21.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 08:07:13 -0700 (PDT)
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
X-Inumbo-ID: 47180149-3655-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747840034; x=1748444834; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zppJwBYcToytG4EhXhFNvwdzt1AUcH92gNWkwpcV0xM=;
        b=YUhEpUW1XL0eWb7JAOltCfRT0VuCphHPlakijQUkES0Swe2mgOvg9/Nh46Zq1TvUMR
         aocqyl3aHdqPT6qR6Qsj87soQF8IHQ3MCzWbYMa016NncdbZhk05VrQyWAGSq3nrYm1d
         9znXaASvXa8kcBqjH/FHSdMDqZft6sQPfk1IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840034; x=1748444834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zppJwBYcToytG4EhXhFNvwdzt1AUcH92gNWkwpcV0xM=;
        b=Li4Z/+XXGv+1wSK+JCj58+4zDjZiyQYfjrOpN3vUc/7OMM0eB8VSv5uG6fZMEl8aWe
         KzTG3sNgYCIjaQ4glApJ6z0KPOSfngHWf4li9xCeFxPTo8Ugyi8l+CyVuk6oau6q3KS8
         Jj+j4NLXwTrccpOMYmvMqWdkwURv1AYpslz/DMf8ohnlZaq9DbUlpuOdYWlO30T3+ajH
         sK4oJCi7CgSgpIsKfXwn7XzxhULOLRIYcgaZWhfyTHNSI7T6UfA+JrhFG0cGKdVuOuO3
         dlruZZp+VyZF8qZrW5+C5epa+eWAAmfSIS7qBN0lGbAPBi8lqtKVUwIAS3D2npVyfkp1
         At6w==
X-Gm-Message-State: AOJu0YxTMJ18HH/B0Ryby0N2tSIvveDEe7dvy8p8s9j5bY6ydHtGUu4i
	ELQPvB9Kwt5KURKYocmDLPJP5n4J6eJCWn3WPthmDDJ07B3Hr+sPcJWjJ5absiK6eBg=
X-Gm-Gg: ASbGncvhrDbfzjGxzTMdFug41eUPCxoO1v+gQhHjxUb7TxhIZx3da5U9aN2CcqLnUzV
	dDa8AoC2fMomvgfNy8LCIRSyVz9LN3hlOFs3h9+4dR2gO5BgpOg1UWjJHcxd5WRhzQ0RENJ0N0N
	NvjX1DrZZXp4bDep0R6n/UKZp0CgcHHGVkpwQOrjUHa7qhSBou2HdlqZe4yObgZ0OCHf8qhkiKe
	WfwvBIMz2+vlYYaJ9HNYzMxAVQcBCVTRBwNksVKO5CPIrHpY67aRn6ijAQYl33ASldjvILnINFc
	X5QvKBkQzoP1T6AILXaEvu+tzdzMeZADMDwyDrN4xZLPD25D7diy0j8L8Nm/y4aoMgUpA+IEvPc
	0Lw20sQqjzMB0H+O5pTJpLx5y5GBx8Q==
X-Google-Smtp-Source: AGHT+IHxXERf8wAAgHh075zWFqlNI4Uy3eoq4MmdAux2SPPfRdW10WhcFhkZBMY/m0PEF0FAB/uBSQ==
X-Received: by 2002:a05:600c:1e0f:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-442fd606a72mr191038855e9.6.1747840033664;
        Wed, 21 May 2025 08:07:13 -0700 (PDT)
Date: Wed, 21 May 2025 17:07:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aC3sIHgUpCFxW35K@macbook.local>
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516022855.1146121-3-dmukhin@ford.com>

On Fri, May 16, 2025 at 02:29:16AM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() to simplify future modifications.
> 
> Also, introduce X86_EMU_{BASELINE,OPTIONAL} helper macros.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - kept use of non-public X86_EMU_XXX flags
> - corrected some comments and macro definitions
> ---
>  xen/arch/x86/domain.c             | 29 +++++++++++------------------
>  xen/arch/x86/include/asm/domain.h |  6 ++++++
>  2 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index f197dad4c0..c64c2c6fef 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -750,25 +750,18 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
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
> +    /* PV */
> +    if ( !is_hvm_domain(d) )
> +        return emflags == 0 || emflags == X86_EMU_PIT;
>  
> -    return true;
> +    /* HVM */
> +    if ( is_hardware_domain(d) )
> +        return emflags == (X86_EMU_LAPIC |
> +                           X86_EMU_IOAPIC |
> +                           X86_EMU_VPCI);
> +
> +    return (emflags & ~X86_EMU_OPTIONAL) == X86_EMU_BASELINE ||
> +            emflags == X86_EMU_LAPIC;
>  }
>  
>  void __init arch_init_idle_domain(struct domain *d)
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 8c0dea12a5..3a9a9fd80d 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -494,6 +494,12 @@ struct arch_domain
>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
>                                   X86_EMU_VPCI)
>  
> +/* User-selectable features. */
> +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
> +
> +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
> +
> X86_EMU_OPTIONAL))

If you go this route I think you need to name those
X86_EMU_HVM_{BASELINE,OPTIONAL}, because they are really meaningful
only for HVM domains.

Regarding vPCI and HVM: we might want to enable it in the future for
domUs, but the fact is that right now it will collide badly with
ioreqs.  So for the time being on x86 it would be best if vPCI is
limited to PVH hardware domain exclusively, otherwise the hypervisor
internals might malfunction.  We shouldn't really allow dom0 to create
this kind of malformed domain as much as possible.

static const struct {
   bool pv, hwdom;
   uint32_t base, optional;
} allowed_conf[] = {
    /* PV */
    { true, false, 0, X86_EMU_PIT },
    /* PVH hardware domain */
    { false, true, X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI, 0 },
    /* PVH domU */
    { false, false, X86_EMU_LAPIC, 0 },
    /* HVM */
    { false, false, X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
      X86_EMU_VPCI | X86_EMU_USE_PIRQ },
};
unsigned int i;

for ( i = 0; i < ARRAY_SIZE(allowed_conf); i++ )
{
    if ( is_pv_domain(d) == allowed_conf[i].pv &&
         /*
	  * A hardware domain can also use !hwdom entries, but not the
	  * other way around
	  */
         (is_hardware_domain(d) || !allowed_conf[i].hwdom) &&
	 (emflags & ~allowed_conf[i].optional) == allowed_conf[i].base )
        return true;
}

printk(XENLOG_INFO "%pd: invalid emulation flags: %#x\n", d, emflags);

return false;

I think the above (not even build tested) is slightly clearer, and
allows for easier expansion going forward?

Regards, Roger.

