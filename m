Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CA91E3D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751797.1159865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOInA-0005Sn-N8; Mon, 01 Jul 2024 15:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751797.1159865; Mon, 01 Jul 2024 15:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOInA-0005Qe-Ij; Mon, 01 Jul 2024 15:18:08 +0000
Received: by outflank-mailman (input) for mailman id 751797;
 Mon, 01 Jul 2024 15:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFf9=OB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOIn8-0005Ef-I2
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:18:06 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cb4c0f4-37bd-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 17:18:04 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-64a6bf15db9so25958507b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:18:04 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64a9bf316fesm13790607b3.104.2024.07.01.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 08:18:03 -0700 (PDT)
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
X-Inumbo-ID: 1cb4c0f4-37bd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719847083; x=1720451883; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PZHPE3JqGjRltPPWv6ZW701bFz8qQubCu87rQyzXOfE=;
        b=M7uhUxfAjnkNqdvNOvvbYY48gM4305jyx2um0nWe2TdO4TDzLD/bDkpN9dnQK6eDI7
         EJODr6B/SaqKNRWJUR1NHeeP0KRgmc1a45yISBnxlnV0q7RiXeAdroEe6IxMLx0blET8
         X6RVUi3XErtJ1znp4vY+EVC70eeHufqqY7C6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847083; x=1720451883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZHPE3JqGjRltPPWv6ZW701bFz8qQubCu87rQyzXOfE=;
        b=PjxgvjewWs+FPBezXtNJy62Z9SnJaAN0ILZVLN7Q0hF/LAovx/hAKy4fcSZTx7sTy8
         2/a+xFr8BShIq71z9VgEt8pnBfHx4Uej08F6iKdesVqEVlG3uTN11luljoB99UG/hdzL
         ATdr2aQkiebGuAmJ6cCKBOYjF7EwCS579FRwelTEBlVU43hFUB8ouZ9bll6UvfuZ1Pxr
         j6qpHCAn532OLee4zzn2ISYQdvype5nYjST9P7a9r7dBfBPog73lzIrhiI9bpcsUPRbR
         t6lQ6/GIuy9N5Ej3eDMhmBIOmQiwUHVBGUXNgZcHr9Haoi6XEHhJnkejPQS/YWL2sCNO
         oFRA==
X-Gm-Message-State: AOJu0YwIKbTrtx4qYWXr2qqOapm19wKgIKj3lSPTmPMQxEwk6MLs8eFG
	+ziWe0FPsUQgFzJtEhEoGv0ZkYnLSfUgrcbhftA1Hp50W0qKl1+RsRKviq1e1Bc=
X-Google-Smtp-Source: AGHT+IGwqfanbSMJGubtd6gcIPavyjAnyq83KbOA58g+MHhB8zxb72AUnVOd/w+DpW9bAhIv+2w9hQ==
X-Received: by 2002:a81:918d:0:b0:61b:33e1:9641 with SMTP id 00721157ae682-64c716190bfmr43765197b3.13.1719847083424;
        Mon, 01 Jul 2024 08:18:03 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:17:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs"
 upper bounds
Message-ID: <ZoLIpulcC7dqtxYR@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>
 <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com>
 <ZoKvP6StEbMTgjrY@macbook>
 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com>

On Mon, Jul 01, 2024 at 05:07:19PM +0200, Jan Beulich wrote:
> On 01.07.2024 15:29, Roger Pau Monné wrote:
> > On Mon, Jul 01, 2024 at 12:40:35PM +0200, Jan Beulich wrote:
> >> On 01.07.2024 11:55, Roger Pau Monné wrote:
> >>> On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/io_apic.c
> >>>> +++ b/xen/arch/x86/io_apic.c
> >>>> @@ -2663,18 +2663,21 @@ void __init ioapic_init(void)
> >>>>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
> >>>>  }
> >>>>  
> >>>> -unsigned int arch_hwdom_irqs(domid_t domid)
> >>>> +unsigned int arch_hwdom_irqs(const struct domain *d)
> >>>
> >>> While at it, should this be __hwdom_init?
> >>
> >> It indeed can be, so I've done this for v4.
> >>
> >>> I'm fine with changing the function to take a domain parameter...
> >>>
> >>>>  {
> >>>>      unsigned int n = fls(num_present_cpus());
> >>>>  
> >>>> -    if ( !domid )
> >>>> +    if ( is_system_domain(d) )
> >>>> +        return PAGE_SIZE * BITS_PER_BYTE;
> >>>
> >>> ... but why do we need a function call just to get a constant value?
> >>> Wouldn't this better be a define in a header?
> >>
> >> Would be an option, but would result in parts of the logic living is
> >> distinct places.
> >>
> >>>> +
> >>>> +    if ( !d->domain_id )
> >>>>          n = min(n, dom0_max_vcpus());
> >>>>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
> >>>>  
> >>>>      /* Bounded by the domain pirq eoi bitmap gfn. */
> >>>>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
> >>>
> >>> So that could also use the same constant here?
> > 
> > I would have a slight preference for PAGE_SIZE * BITS_PER_BYTE being
> > defined inside of this function as:
> > 
> > /* Bounded by the domain pirq eoi bitmap gfn. */
> > const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;
> > 
> > Or similar for clarity purposes.
> 
> Can do, sure.
> 
> > While at it, I've noticed that PHYSDEVOP_pirq_eoi_gmfn_v{1,2} is not
> > available to HVM guests (not even when exposing PIRQ support) and
> > hence I wonder if we should special case PVH dom0, but maybe it's best
> > to deal with this properly rather than hacking something special
> > just for PVH dom0.  At the end of the day the current limit is high
> > enough to not cause issues on current systems I would expect.
> 
> Oh, so entirely the other way around than mentioned when we talked, once
> again due to the filtering in hvm/hypercall.h that I keep forgetting. So
> in principle we could avoid the bounding for HVM. Just that right now
> extra_domU_irqs covers both PV and HVM, and would hence need splitting
> first.

Yes, we would need to split, that's why I'm OK with what you propose
here.  We can do the split as a later change.

> >>>> --- a/xen/common/domain.c
> >>>> +++ b/xen/common/domain.c
> >>>> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
> >>>>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> >>>>          else
> >>>>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> >>>> -                                           : arch_hwdom_irqs(domid);
> >>>> +                                           : arch_hwdom_irqs(d);
> >>>>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
> >>>>  
> >>>>          radix_tree_init(&d->pirq_tree);
> >>>> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
> >>>>      if ( IS_ERR(dom_xen) )
> >>>>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
> >>>>  
> >>>> +#ifdef CONFIG_HAS_PIRQ
> >>>> +    /* Bound-check values passed via "extra_guest_irqs=". */
> >>>> +    {
> >>>> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
> >>>> +
> >>>> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
> >>>> +        {
> >>>> +            extra_hwdom_irqs = n - nr_static_irqs;
> >>>> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
> >>>> +        }
> >>>> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
> >>>> +        {
> >>>> +            extra_domU_irqs = n - nr_static_irqs;
> >>>> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
> >>>> +        }
> >>>> +    }
> >>>> +#endif
> >>>
> >>> IMO this is kind of a weird placement. Wouldn't this be more naturally
> >>> handled in parse_extra_guest_irqs()?
> >>
> >> Indeed it is and yes it would, but no, it can't. We shouldn't rely on
> >> the particular behavior of arch_hwdom_irqs(), and in the general case
> >> we can't call it as early as when command line arguments are parsed. I
> >> couldn't think of a neater way of doing this, and it not being pretty
> >> is why I'm saying "(ab)use" in the description.
> > 
> > I see, nr_static_irqs is an alias of nr_irqs_gsi, which is not properly
> > set by the time we evaluate command line arguments.
> > 
> > My only possible suggestion would be to do it as a presmp initcall,
> > and define/register such initcall for x86 only, the only benefit would
> > be that such inicall could be defined in the same translation unit as
> > arch_hwdom_irqs() then.
> 
> Which then would require making extra_{hwdom,domU}_irqs available to
> x86/io_apic.c, which also wouldn't be very nice. To be honest, I'd prefer
> to keep the logic where it is, until such time where perhaps we move pIRQ
> stuff wholesale to x86-only files.

Fine by me.

I think we are in agreement about what needs doing.  I can provide:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

With the changes we have agreed to arch_hwdom_irqs().

Thanks, Roger.

