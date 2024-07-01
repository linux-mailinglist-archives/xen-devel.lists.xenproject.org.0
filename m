Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E091DBC6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 11:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751438.1159410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODkp-0006UV-QA; Mon, 01 Jul 2024 09:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751438.1159410; Mon, 01 Jul 2024 09:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODkp-0006Qu-NE; Mon, 01 Jul 2024 09:55:23 +0000
Received: by outflank-mailman (input) for mailman id 751438;
 Mon, 01 Jul 2024 09:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFf9=OB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sODko-0006Qo-EQ
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 09:55:22 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07487a22-3790-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 11:55:21 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4463b71d5b0so22315471cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 02:55:21 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-446513d42d3sm29627571cf.20.2024.07.01.02.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 02:55:19 -0700 (PDT)
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
X-Inumbo-ID: 07487a22-3790-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719827720; x=1720432520; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APxz1MJtTXBoGBpS2Haof9kQS1XVMkzRZUquA3K6WGU=;
        b=nZulPUEK/mLcFVDH4TgFGUs2ksj3Y2go+zpc6MFqZx+ogV2z2vq2qTNZqdR7LZNWjC
         qkrhdXVVBfJy8XeJfwP36DX6f1oW0EGVDIV3UMoaNSi4JU8RvOAyJXaqnSVOAcQpBr+z
         ILIDEpWpqGEbqWhErrTXgeIWZBqf3aorNEDsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719827720; x=1720432520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APxz1MJtTXBoGBpS2Haof9kQS1XVMkzRZUquA3K6WGU=;
        b=O6m++XkiEhCuIX4kTD2mHGfiYUpq7lk8bK+f+LrnppACX4VgXcEToyd3JHmie9rNT+
         gv+64nNjyEIPK1qzCWI8yT6eXXauhH2G3AR2h+BYcrSIj+JflBr+4TWS3mxiYGavXPjO
         qIIjyHQ4Hnkn0m3CpPtVhRPmVmiK137dKVUCL3cKmsp2/QWiR2msFOKEkF1KBgvOkTNL
         a97dMFNvdWiZL4Soi4+nmvLYyIw1fQyQb37jDYKoWkLDlOIMSyfvMbGap7E8DxCJME3H
         r/T+U0Qlh7SuKtOCs9dWJlTlgVqv3UXFwr/2Nk2qYNZtZY7onA7FTIA4mEiaBSyhKC6v
         tTgg==
X-Gm-Message-State: AOJu0YxEllBdYMpglIlyn4117TBteA/ubJWqUFfiVYw3hJr5T1egxtkX
	jX7fy3zwO+DjF3O8iw3cKlXjw+HF/h26vP7jlJ8araGBz8aKHJHiiNnPAsoQYMk=
X-Google-Smtp-Source: AGHT+IE+f2/PT6AYJ1/ZPTtr4ZjGBdtibTSdyzg7EzFo2RVX8+PxDwfWx/N9jDoChKfyl78MLyugaw==
X-Received: by 2002:ac8:57d2:0:b0:43f:f615:c5d6 with SMTP id d75a77b69052e-446556c265fmr168289221cf.21.1719827720148;
        Mon, 01 Jul 2024 02:55:20 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:55:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs"
 upper bounds
Message-ID: <ZoJ9Bd2kg3IQ0Z28@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>

On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
> more than 32k pIRQ-s can be used by a domain on x86. Document this upper
> bound.
> 
> To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
> parameter type) and setup_system_domains(). This is primarily to avoid
> exposing the two static variables or introducing yet further arch hooks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
> used. That would make the connection to setup_system_domains() yet more
> weak, though.
> 
> Passing the domain pointer instead of the domain ID would also allow
> to return a possibly different value if sensible for PVH Dom0 (which
> presently has no access to PHYSDEVOP_pirq_eoi_gmfn_v<N> in the first
> place).
> ---
> v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
>     only. Re-base over new earlier patch.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1146,7 +1146,8 @@ common for all domUs, while the optional
>  is for dom0.  Changing the setting for domU has no impact on dom0 and vice
>  versa.  For example to change dom0 without changing domU, use
>  `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
> -hardware domain is architecture dependent.
> +hardware domain is architecture dependent.  The upper limit for both values on
> +x86 is such that the resulting total number of IRQs can't be higher than 32768.
>  Note that specifying zero as domU value means zero, while for dom0 it means
>  to use the default.
>  
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2663,18 +2663,21 @@ void __init ioapic_init(void)
>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>  }
>  
> -unsigned int arch_hwdom_irqs(domid_t domid)
> +unsigned int arch_hwdom_irqs(const struct domain *d)

While at it, should this be __hwdom_init?

I'm fine with changing the function to take a domain parameter...

>  {
>      unsigned int n = fls(num_present_cpus());
>  
> -    if ( !domid )
> +    if ( is_system_domain(d) )
> +        return PAGE_SIZE * BITS_PER_BYTE;

... but why do we need a function call just to get a constant value?
Wouldn't this better be a define in a header?

> +
> +    if ( !d->domain_id )
>          n = min(n, dom0_max_vcpus());
>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
>  
>      /* Bounded by the domain pirq eoi bitmap gfn. */
>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);

So that could also use the same constant here?

> -    printk("Dom%d has maximum %u PIRQs\n", domid, n);
> +    printk("%pd has maximum %u PIRQs\n", d, n);
>  
>      return n;
>  }
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>          else
>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> -                                           : arch_hwdom_irqs(domid);
> +                                           : arch_hwdom_irqs(d);
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
>      if ( IS_ERR(dom_xen) )
>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>  
> +#ifdef CONFIG_HAS_PIRQ
> +    /* Bound-check values passed via "extra_guest_irqs=". */
> +    {
> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
> +
> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
> +        {
> +            extra_hwdom_irqs = n - nr_static_irqs;
> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
> +        }
> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
> +        {
> +            extra_domU_irqs = n - nr_static_irqs;
> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
> +        }
> +    }
> +#endif

IMO this is kind of a weird placement. Wouldn't this be more naturally
handled in parse_extra_guest_irqs()?

Thanks, Roger.

