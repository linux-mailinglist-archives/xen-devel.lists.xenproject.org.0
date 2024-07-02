Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDC9238E6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752092.1160226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ8q-0001TH-LH; Tue, 02 Jul 2024 08:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752092.1160226; Tue, 02 Jul 2024 08:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ8q-0001RE-IU; Tue, 02 Jul 2024 08:45:36 +0000
Received: by outflank-mailman (input) for mailman id 752092;
 Tue, 02 Jul 2024 08:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzxX=OC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOZ8o-0000tJ-Rq
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:45:34 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716fbe1a-384f-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 10:45:33 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so2461735f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 01:45:33 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a103e5esm12509189f8f.108.2024.07.02.01.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 01:45:31 -0700 (PDT)
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
X-Inumbo-ID: 716fbe1a-384f-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719909932; x=1720514732; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJv3H9wfwWYfqvs89ZyOnJSbY2pxhP8diuBe6G8tqO4=;
        b=Mz8kMYuSpj3RZ42zm7GR1DW0Uc34MT4Wz9lPDqgbdw4qftdl+c1Y3eauyRxFpipq9l
         gqxvhMPhJVcRlOQGY2PMj1bBrl+Hq1CTzPCPv1SWCoGmb2jEBSPKczMgfohsGEIvWaT9
         gDs3NVMlr33yN7VSjRtyPt6n2sJLtJ8jwIvKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909932; x=1720514732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJv3H9wfwWYfqvs89ZyOnJSbY2pxhP8diuBe6G8tqO4=;
        b=mOfkewf8yCPm3ddhrakRLqvVZyqXhfBNvRvrTuxdB7A5AM7N56DfbcaZ8AGfufhfwB
         AbN2g30AE2AMoVA8/mcN93D9lVAD4Xm9W3tGoP7ErWBLavx5u3gvsKEXttRhMEoOtXej
         8MyGr2cTWbObDVH/1ceTkJZFB3C/Dyhje+f4YaiDpxtuy5U8i1byBkvk+ecfGXRAXys/
         e1UAf+MJ42m4OwXWlc/yEU8CU9FA9/Mjp8/1iLqhJDYVidxBJzZtwxn417i+1CTJsngW
         T864sVICOrJNkk3nlwU6JlbWD21SwAYgPIsLFwK0YgJ22gx9VadbBX2+qEUW7OX+hOrk
         iFxA==
X-Gm-Message-State: AOJu0Yw8bIVsgReJd4ykh4U/7X9CV4mvUAkAL7ynJIn+mhakZ6c281h0
	LCqMZZ8R2sRYe0kxABvhylx/qaW0sVq+kcGYz0XTlaraOvVXYZBMXI+sad8y/pc=
X-Google-Smtp-Source: AGHT+IFY2g9wy4Q/S3fuqe2cM2KISazdEdxhZhWoK9lPBWLQJs87FSt4k2SLrVbOeJswsfE3pggY8w==
X-Received: by 2002:adf:f98a:0:b0:35f:b03:bf45 with SMTP id ffacd0b85a97d-367756adf42mr5398950f8f.24.1719909932128;
        Tue, 02 Jul 2024 01:45:32 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:45:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs"
 upper bounds
Message-ID: <ZoO-K9ll9XW2gFFM@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>
 <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com>
 <ZoKvP6StEbMTgjrY@macbook>
 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com>
 <ZoLIpulcC7dqtxYR@macbook>
 <a7df11bc-ab68-4ee2-9b96-53f3890a9803@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7df11bc-ab68-4ee2-9b96-53f3890a9803@suse.com>

On Tue, Jul 02, 2024 at 10:30:03AM +0200, Jan Beulich wrote:
> On 01.07.2024 17:17, Roger Pau Monné wrote:
> > On Mon, Jul 01, 2024 at 05:07:19PM +0200, Jan Beulich wrote:
> >> On 01.07.2024 15:29, Roger Pau Monné wrote:
> >>> On Mon, Jul 01, 2024 at 12:40:35PM +0200, Jan Beulich wrote:
> >>>> On 01.07.2024 11:55, Roger Pau Monné wrote:
> >>>>> On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/common/domain.c
> >>>>>> +++ b/xen/common/domain.c
> >>>>>> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
> >>>>>>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> >>>>>>          else
> >>>>>>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> >>>>>> -                                           : arch_hwdom_irqs(domid);
> >>>>>> +                                           : arch_hwdom_irqs(d);
> >>>>>>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
> >>>>>>  
> >>>>>>          radix_tree_init(&d->pirq_tree);
> >>>>>> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
> >>>>>>      if ( IS_ERR(dom_xen) )
> >>>>>>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
> >>>>>>  
> >>>>>> +#ifdef CONFIG_HAS_PIRQ
> >>>>>> +    /* Bound-check values passed via "extra_guest_irqs=". */
> >>>>>> +    {
> >>>>>> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
> >>>>>> +
> >>>>>> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
> >>>>>> +        {
> >>>>>> +            extra_hwdom_irqs = n - nr_static_irqs;
> >>>>>> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
> >>>>>> +        }
> >>>>>> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
> >>>>>> +        {
> >>>>>> +            extra_domU_irqs = n - nr_static_irqs;
> >>>>>> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
> >>>>>> +        }
> >>>>>> +    }
> >>>>>> +#endif
> >>>>>
> >>>>> IMO this is kind of a weird placement. Wouldn't this be more naturally
> >>>>> handled in parse_extra_guest_irqs()?
> >>>>
> >>>> Indeed it is and yes it would, but no, it can't. We shouldn't rely on
> >>>> the particular behavior of arch_hwdom_irqs(), and in the general case
> >>>> we can't call it as early as when command line arguments are parsed. I
> >>>> couldn't think of a neater way of doing this, and it not being pretty
> >>>> is why I'm saying "(ab)use" in the description.
> >>>
> >>> I see, nr_static_irqs is an alias of nr_irqs_gsi, which is not properly
> >>> set by the time we evaluate command line arguments.
> >>>
> >>> My only possible suggestion would be to do it as a presmp initcall,
> >>> and define/register such initcall for x86 only, the only benefit would
> >>> be that such inicall could be defined in the same translation unit as
> >>> arch_hwdom_irqs() then.
> >>
> >> Which then would require making extra_{hwdom,domU}_irqs available to
> >> x86/io_apic.c, which also wouldn't be very nice. To be honest, I'd prefer
> >> to keep the logic where it is, until such time where perhaps we move pIRQ
> >> stuff wholesale to x86-only files.
> > 
> > Fine by me.
> > 
> > I think we are in agreement about what needs doing.
> 
> Hmm, after further thinking I'm not sure splitting would be the way to go.
> We should rather properly remove the concept of pIRQ from PVH, i.e. not
> only not have them visible to the kernel, but also not use e.g. ->nr_pirqs
> and ->pirq_tree internally. Then we could presumably drop the constraining
> via this command line option (documenting it as inapplicable to PVH).

Removing it from PVH would also imply removing from HVM AFAICT (unless
it's HVM with explicitly pIRQ support).  I think the main issue there
would be dealing with the change in all the interfaces that currently
take pIRQ parameters, albeit I could be wrong.  Seems like a
worthwhile improvement.

Thanks, Roger.

