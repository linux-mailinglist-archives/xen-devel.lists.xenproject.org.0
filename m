Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0791E0BB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751583.1159573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOH6F-00007h-EH; Mon, 01 Jul 2024 13:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751583.1159573; Mon, 01 Jul 2024 13:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOH6F-00005v-Bc; Mon, 01 Jul 2024 13:29:43 +0000
Received: by outflank-mailman (input) for mailman id 751583;
 Mon, 01 Jul 2024 13:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFf9=OB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOH6D-00005p-DU
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:29:41 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7c3ce07-37ad-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 15:29:40 +0200 (CEST)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-48f96299046so1116314137.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 06:29:40 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692613e0sm348720285a.9.2024.07.01.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 06:29:38 -0700 (PDT)
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
X-Inumbo-ID: f7c3ce07-37ad-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719840579; x=1720445379; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FFlsDpCIS+Yt+GUBlXKxtNMYwdSM9Fh/6AqqZmrr8gU=;
        b=FXQhB0CyeBsdJ0FuKw2XLYQhQcF2omjNOPWKiVxtsgH1L+6AL6S23NsncrDRDxut+7
         yV4ozivoeWFnzp7s+vIW2L779DWV3Mgw7MXMlOWBcYkF2AFDdLyTV15OGDAnxGTXMRsd
         Rr8Oaz6ukoXFU6kEaV7mXCPQsoB08hx1UkmoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840579; x=1720445379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFlsDpCIS+Yt+GUBlXKxtNMYwdSM9Fh/6AqqZmrr8gU=;
        b=H6XomSJ3LrK0K82z55m12yBaXEmKBJOMWEQY/wwabr965P7r+JGL6fl2EIB6sttIXV
         R6xio3eBamjTGp266adxPCOU5ZfOn/10OWnoHUONUBvh7ivRvPlmReSQz2RGlvz4lKwR
         Tim9Dip9uItKUK89pQ1uoD1bDt1WZ+BSaAW//p2Wvu9HbIT9XVMqa4XYNNfj4Xn88fkW
         bDkM88Rmz6sz/w0qf9jR7cDs1gdLxV8p95H8Pln5AbJxeppsxFydmShMkT/ImdmN6Wmk
         6iJ6+LPwfE5oNZq4Cd0aZMBDJ3ssagO+nPiCRpNESf4YzBf2kNCw4G1HPcWisiDLS37S
         GhhA==
X-Gm-Message-State: AOJu0YzPAPQjEePj5fuZmJyCb5dr8FRbRQ5nXiPzfoY2HGNfTcykGBs7
	KFQmQ8rN5q5bBaYcuufTmG33GfOIvAPE9rDHfx/og8nhFpF8h7JPR8wd3LcSmms=
X-Google-Smtp-Source: AGHT+IEaa1YYUQEkfrxNc8X7Njjp3jQcsuBnT9eU+scp0dfdflq9aPKRoOEnHzOOjoppi+TtslLhgQ==
X-Received: by 2002:a05:6102:114e:b0:48f:3f9a:7609 with SMTP id ada2fe7eead31-48faf06a565mr5775538137.5.1719840579079;
        Mon, 01 Jul 2024 06:29:39 -0700 (PDT)
Date: Mon, 1 Jul 2024 15:29:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs"
 upper bounds
Message-ID: <ZoKvP6StEbMTgjrY@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>
 <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com>

On Mon, Jul 01, 2024 at 12:40:35PM +0200, Jan Beulich wrote:
> On 01.07.2024 11:55, Roger Pau Monné wrote:
> > On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/io_apic.c
> >> +++ b/xen/arch/x86/io_apic.c
> >> @@ -2663,18 +2663,21 @@ void __init ioapic_init(void)
> >>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
> >>  }
> >>  
> >> -unsigned int arch_hwdom_irqs(domid_t domid)
> >> +unsigned int arch_hwdom_irqs(const struct domain *d)
> > 
> > While at it, should this be __hwdom_init?
> 
> It indeed can be, so I've done this for v4.
> 
> > I'm fine with changing the function to take a domain parameter...
> > 
> >>  {
> >>      unsigned int n = fls(num_present_cpus());
> >>  
> >> -    if ( !domid )
> >> +    if ( is_system_domain(d) )
> >> +        return PAGE_SIZE * BITS_PER_BYTE;
> > 
> > ... but why do we need a function call just to get a constant value?
> > Wouldn't this better be a define in a header?
> 
> Would be an option, but would result in parts of the logic living is
> distinct places.
> 
> >> +
> >> +    if ( !d->domain_id )
> >>          n = min(n, dom0_max_vcpus());
> >>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
> >>  
> >>      /* Bounded by the domain pirq eoi bitmap gfn. */
> >>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
> > 
> > So that could also use the same constant here?

I would have a slight preference for PAGE_SIZE * BITS_PER_BYTE being
defined inside of this function as:

/* Bounded by the domain pirq eoi bitmap gfn. */
const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;

Or similar for clarity purposes.

While at it, I've noticed that PHYSDEVOP_pirq_eoi_gmfn_v{1,2} is not
available to HVM guests (not even when exposing PIRQ support) and
hence I wonder if we should special case PVH dom0, but maybe it's best
to deal with this properly rather than hacking something special
just for PVH dom0.  At the end of the day the current limit is high
enough to not cause issues on current systems I would expect.

> >> -    printk("Dom%d has maximum %u PIRQs\n", domid, n);
> >> +    printk("%pd has maximum %u PIRQs\n", d, n);
> >>  
> >>      return n;
> >>  }
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
> >>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> >>          else
> >>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> >> -                                           : arch_hwdom_irqs(domid);
> >> +                                           : arch_hwdom_irqs(d);
> >>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
> >>  
> >>          radix_tree_init(&d->pirq_tree);
> >> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
> >>      if ( IS_ERR(dom_xen) )
> >>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
> >>  
> >> +#ifdef CONFIG_HAS_PIRQ
> >> +    /* Bound-check values passed via "extra_guest_irqs=". */
> >> +    {
> >> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
> >> +
> >> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
> >> +        {
> >> +            extra_hwdom_irqs = n - nr_static_irqs;
> >> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
> >> +        }
> >> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
> >> +        {
> >> +            extra_domU_irqs = n - nr_static_irqs;
> >> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
> >> +        }
> >> +    }
> >> +#endif
> > 
> > IMO this is kind of a weird placement. Wouldn't this be more naturally
> > handled in parse_extra_guest_irqs()?
> 
> Indeed it is and yes it would, but no, it can't. We shouldn't rely on
> the particular behavior of arch_hwdom_irqs(), and in the general case
> we can't call it as early as when command line arguments are parsed. I
> couldn't think of a neater way of doing this, and it not being pretty
> is why I'm saying "(ab)use" in the description.

I see, nr_static_irqs is an alias of nr_irqs_gsi, which is not properly
set by the time we evaluate command line arguments.

My only possible suggestion would be to do it as a presmp initcall,
and define/register such initcall for x86 only, the only benefit would
be that such inicall could be defined in the same translation unit as
arch_hwdom_irqs() then.

Thanks, Roger.

