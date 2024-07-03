Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076529254EB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 09:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752757.1160986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuho-0004A7-DR; Wed, 03 Jul 2024 07:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752757.1160986; Wed, 03 Jul 2024 07:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuho-00047w-91; Wed, 03 Jul 2024 07:47:08 +0000
Received: by outflank-mailman (input) for mailman id 752757;
 Wed, 03 Jul 2024 07:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOuhm-00047q-RY
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 07:47:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71442730-3910-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 09:47:05 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so137768f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 00:47:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675f9dfbdbsm14822862f8f.103.2024.07.03.00.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 00:47:04 -0700 (PDT)
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
X-Inumbo-ID: 71442730-3910-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719992825; x=1720597625; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrdL3QcJU/kD06YheeMtMz4eXLJavNhafGT420lqN1U=;
        b=fnVCZHZ0poAyxK0ldYuQO//u9NoliPam2TOoyNdi29LJHHW73thLmJsuqvoquu4r4f
         YH8XcuEe+MuZhNSPrOa/zGEH808kLsvGugLlAnKBu/O1d3tm7BP56wDajeXzVfjoSltK
         1OFDsa/qp51WyGH9Th7/cKXl7NyZL1AF7YLoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719992825; x=1720597625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrdL3QcJU/kD06YheeMtMz4eXLJavNhafGT420lqN1U=;
        b=q80cMcaP88Opkyyg21maTi6DE7H5iWaz/7BCRkP4AhC1sBs3+kXiwDftgb5jKNi272
         zwrReSWWgl5qM/CpwZ9NdNNAN9DQYtuopssw2O9KOLeZata19sfGlzoLVAe2iU1ctngA
         5uFuilMcIuV3sb+6FnRBrgaW2ayE85/PhjRSmGraXxBKqv+3hS9MvW98CzUnIQkgwgN4
         GHu2GzzFo0oneHkdag7d0E9IwdaLBA7dPkCK76lE9qclgN/UtIxqmFAU3TG1/uBPd1lr
         cRLR6HTu32ZjiP6fibaDqQ+jFX6wzWLE9MGOl6xVUMqBoCdiyVnPmoP2u/xByVLZdH2P
         V/lw==
X-Gm-Message-State: AOJu0Yzbd5GBwoMSwRi3tH7XH2m2wvlC2SKRRdaWqzl1JgbwmJzdcdOI
	7OjDp5CLUN8PB3Bv8M0GR5b2hqsXpRxKWkdhy5AbbbPCI4BGOE8rUb0fpsWxuPc=
X-Google-Smtp-Source: AGHT+IERHY/zFmd182jAfhjIGe4w8ObwB1Hbuk0mxYXdVZzLSTQ++rY2mjQwNY0hHXXt7K5QqhRIfg==
X-Received: by 2002:a5d:5581:0:b0:362:d875:6dab with SMTP id ffacd0b85a97d-367756a8c60mr7605884f8f.25.1719992824648;
        Wed, 03 Jul 2024 00:47:04 -0700 (PDT)
Date: Wed, 3 Jul 2024 09:47:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 for-4.19? 1/2] cmdline: document and enforce
 "extra_guest_irqs" upper bounds
Message-ID: <ZoUB90zfNiTfy7G-@macbook.local>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
 <c76a60c9-c491-44bd-a6be-0199f0022e3d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c76a60c9-c491-44bd-a6be-0199f0022e3d@suse.com>

On Tue, Jul 02, 2024 at 11:52:04AM +0200, Jan Beulich wrote:
> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
> more than 32k pIRQ-s can be used by a domain on x86. Document this upper
> bound.
> 
> To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
> parameter type) and setup_system_domains(). This is primarily to avoid
> exposing the two static variables or introducing yet further arch hooks.
> 
> While touching arch_hwdom_irqs() also mark it hwdom-init.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
> used. That would make the connection to setup_system_domains() yet more
> weak, though.
> ---
> v4: arch_hwdom_irqs() -> __hwdom_init. Local constant for upper bound in
>     arch_hwdom_irqs(). Re-base.
> v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
>     only. Re-base over new earlier patch.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1175,7 +1175,8 @@ common for all domUs, while the optional
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
> @@ -2660,18 +2660,20 @@ void __init ioapic_init(void)
>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>  }
>  
> -unsigned int arch_hwdom_irqs(domid_t domid)
> +unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
>  {
>      unsigned int n = fls(num_present_cpus());
> +    /* Bounded by the domain pirq EOI bitmap gfn. */
> +    const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;

Seeing next patch where we return nr_irqs for PVH, should max_irqs be
min(nr_irqs, PAGE_SIZE * BITS_PER_BYTE)?

As that has the bonus of avoiding the nested min() in the expression
below.

>  
> -    if ( !domid )
> -        n = min(n, dom0_max_vcpus());
> -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
> +    if ( is_system_domain(d) )
> +        return max_irqs;
>  
> -    /* Bounded by the domain pirq eoi bitmap gfn. */
> -    n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
> +    if ( !d->domain_id )
> +        n = min(n, dom0_max_vcpus());
> +    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, min(nr_irqs, max_irqs));
>  
> -    printk("Dom%d has maximum %u PIRQs\n", domid, n);
> +    printk("%pd has maximum %u PIRQs\n", d, n);
>  
>      return n;
>  }
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -695,7 +695,7 @@ struct domain *domain_create(domid_t dom
>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>          else
>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> -                                           : arch_hwdom_irqs(domid);
> +                                           : arch_hwdom_irqs(d);
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> @@ -829,6 +829,24 @@ void __init setup_system_domains(void)
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

FWIW; I fear the open-coded 32 here and the one in the
extra_domU_irqs initialization can go out of sync.  It might be
helpful to define this as a constant close to the extra_domU_irqs
definition.

Thanks, Roger.

