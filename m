Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2A9D4B43
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841353.1256843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE538-0001vx-NZ; Thu, 21 Nov 2024 11:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841353.1256843; Thu, 21 Nov 2024 11:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE538-0001so-Kk; Thu, 21 Nov 2024 11:08:38 +0000
Received: by outflank-mailman (input) for mailman id 841353;
 Thu, 21 Nov 2024 11:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE537-0001si-3o
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:08:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3113674-a7f8-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 12:08:34 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so53880466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:08:34 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f431890bsm67837766b.135.2024.11.21.03.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 03:08:33 -0800 (PST)
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
X-Inumbo-ID: f3113674-a7f8-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYzMTEzNjc0LWE3ZjgtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg3MzE0LjQ5NjY4NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732187314; x=1732792114; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ROnYd64rE6h4KD6m2oKnsy8stDQbnXo/C9dYZHNhfRE=;
        b=sYswj+xQPRRCshtQhZmci20GXooVXanD0ZmbsfpcPzPshlkyu9sns4DA/168yXu8jV
         zhbX8PSXc80sEJlbidCEJ3PSgNM32F81nmkaj/j3JxogrZksJ9pe9rtb36qvlvm+rm7O
         /NP0nMzpD2DtxA6m8TubAc4EHwlX9/LywaIo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732187314; x=1732792114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROnYd64rE6h4KD6m2oKnsy8stDQbnXo/C9dYZHNhfRE=;
        b=GVj6uabnQHFTUViGEPfKo9UriF0Ma46r08Pp45FeqZdVbuCf6i/oL7iRgBMZuOj+/t
         SlTTYexarOR94sUUO0LLC/m5TG7kpDPSdvO//WCZspFZ7xXyytvvpylFpnWSc6IjywqF
         8+0nt+8wrfIBr/jantP7a6HHBwzWiORgaxGnpjrpZ+dWCKhzV23ukpp10OkKc5O1M77l
         IvZ6GAE5Hxd8/vkPsSJv1CIAb95T1dSncm2BEmnye1X3JwAqJ+TIvtens9fY4rzrdYlK
         sXBRhlRmC8M+B05Yt+oK+uEBE+zCAvfCDu4tKvr4gMa1iyUsYGblpXsHgw+kPFrNTLGp
         5rdA==
X-Forwarded-Encrypted: i=1; AJvYcCV5+XQgY2TSZ9IYS1fa4uYpnaF7sYL1GEAQ/oUZpmX2CvSf8SXBntGIoLLI2I7wJHplBUi+35aXwLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIfFtV1vwOJ5+D+UwiXsqEbDQhFWl6PIW2kvECRAiP4E2c95e6
	QTcuLS6Gn3uQ+frbNGV+TRaNFDgh/CNDT+/wUqF2eGh/XpxKqD9keOi6K+1sLux1DAmyOIdl1ZS
	R
X-Google-Smtp-Source: AGHT+IFdLI6UfhBlCJSUTheHCByZVCa38MAICxrCnUia6H1Z7HDVQLE0qxsrf5bJkSlYckrk0e2GtQ==
X-Received: by 2002:a05:6402:274b:b0:5cf:c22f:524a with SMTP id 4fb4d7f45d1cf-5cff4b1440bmr6050878a12.8.1732187313558;
        Thu, 21 Nov 2024 03:08:33 -0800 (PST)
Date: Thu, 21 Nov 2024 12:08:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for
 PVH
Message-ID: <Zz8UsJ4nJXyExQ53@macbook>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-3-roger.pau@citrix.com>
 <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com>

On Thu, Nov 21, 2024 at 11:54:49AM +0100, Jan Beulich wrote:
> On 20.11.2024 12:35, Roger Pau Monne wrote:
> > Do not return early in the PVH/HVM case, so that the number of pIRQs is also
> > printed.
> 
> What you're printing ...
> 
> > Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/io_apic.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> > index bd5ad61c85e4..d9db2efc4f58 100644
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
> >  
> >      /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
> >      if ( is_hvm_domain(d) )
> > -        return nr_irqs;
> > -
> > -    if ( !d->domain_id )
> > -        n = min(n, dom0_max_vcpus());
> > -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
> > +        n = nr_irqs;
> 
> ... is rather the number of IRQs we picked for the system. That may happen to
> end up being the upper bound for PVH Dom0, yet not logging this at all was
> because of the limited use pIRQ-s have there. Granted at the time I was still
> under the impression they have no use there at all, so this isn't really an
> objection to the change. I would have been nice though if the description had
> mentioned why significance pIRQ-s actually have in PVH Dom0.

Sure, what about adding to the commit message:

"While PVH dom0 doesn't have access to the hypercalls to manage pIRQs
itself, neither the knowledge to do so, pIRQs are still used by Xen to
map and bind interrupts to a PVH dom0 behind its back.  Hence the
pIRQ limit is still relevant for a PVH dom0."

Thanks, Roger.

