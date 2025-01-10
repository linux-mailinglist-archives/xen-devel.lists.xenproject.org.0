Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596DA09379
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869727.1281185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG23-0001pH-00; Fri, 10 Jan 2025 14:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869727.1281185; Fri, 10 Jan 2025 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG22-0001nT-TW; Fri, 10 Jan 2025 14:30:38 +0000
Received: by outflank-mailman (input) for mailman id 869727;
 Fri, 10 Jan 2025 14:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWG21-0001nG-24
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:30:37 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74cfb70b-cf5f-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:30:36 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so3042942a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:30:36 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9904a55f9sm1646074a12.81.2025.01.10.06.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:30:34 -0800 (PST)
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
X-Inumbo-ID: 74cfb70b-cf5f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736519435; x=1737124235; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8DTASg4jbJWXanhAOi8KUszSGgZ/02wo2hT/AYrVuw=;
        b=LUwJ7nhD42U0c5ljsKXMz6i8AU3nqceq2kzAXsBignvcgeIdvtDYiogy0iHrLHYa6W
         3+Nf+LSgsma6sDa477udqIH/Ef240Dvi40OfKEJIYlnnsxP3IzmvgxFYIAqc44hR3zdE
         k+/Ma+CYEggDqgeuP19jhaaVpxgJt/gg2RhhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519435; x=1737124235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DTASg4jbJWXanhAOi8KUszSGgZ/02wo2hT/AYrVuw=;
        b=dCJIhZnLIoZJlUoedgQpwgN15E37Qtxq9EJSVg145tNEzDY81apcFyJU2gufFMhPwA
         KPuu3qO1sGK4jvd+CuT1CUC/j9FaVOdPrEY5hzMb7GT6Vt6pBE/9jjKsYAdqMZGmbUPd
         Jplao8naHSwK/V4sUfF/Offo2Sk/gkywXGtIxeK+CnfdISZJQgADTw0fGStPPgWIAcC0
         p8g7Z9jemNeDAtTpsWk/uwDsINLUoIjoncdOc8pwyXCbASVOIZuQ8ZG96Kik0JBA1R0d
         6K5wnNX5OGzX7pKbNOlUuLI+iaWWM8i0yEMcTffY/eWqWYH+1SuEKkRVXro2YdZOeVIa
         uu6g==
X-Gm-Message-State: AOJu0YxjqxRCzjCyZez6f1WLEVvtbFoYnqW0L2qZ/w9L/mgO18EdfrN7
	eBpGwxyEn/zfsM/XttYf4mgNOZQUTdsNj8LC1xoRPDFCz2G6gCaWryTWpdoD3AY=
X-Gm-Gg: ASbGncuHI5kZ7Tl8JJpwycNqjBNzeDaOuNjYL90uAUB5IhMGZsZxqAsWiTkYp2qYOj7
	TyBRinySyKCBiefp9NH6Q2cA43cMkBke83KGXbPQ5e+ooOqSvjUqZR5MSzyBN3zyxLFWVShxyHd
	U82vpUEfUFQyXybxp66f8DgKuf/fVRfRhMTtWr+JZcVxSBCB5gMjT5//QHGw6znzWBnCmRe4xxM
	sdIRnko0XKigyAVkatIRp3KmAzpLltmPN3LGXVYtNJTwNiyQuRXfCA3Df2NV78zV/A=
X-Google-Smtp-Source: AGHT+IFhQIIy8/LplsGWKcUHIByTMMO22PwTyKoru9A5hZ/izwK5NhnHr//u6mqed5sZBK+tG6AtDw==
X-Received: by 2002:a05:6402:400a:b0:5d4:4143:c082 with SMTP id 4fb4d7f45d1cf-5d972e4e726mr8114422a12.21.1736519435474;
        Fri, 10 Jan 2025 06:30:35 -0800 (PST)
Date: Fri, 10 Jan 2025 15:30:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/18] x86/mm: switch destroy_perdomain_mapping()
 parameter from domain to vCPU
Message-ID: <Z4EvCHlGo-svVgHe@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-6-roger.pau@citrix.com>
 <D6XGFLRRLY4N.3IFSIDMFC4BVJ@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6XGFLRRLY4N.3IFSIDMFC4BVJ@cloud.com>

On Thu, Jan 09, 2025 at 10:02:19AM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > In preparation for the per-domain area being populated with per-vCPU mappings
> > change the parameter of destroy_perdomain_mapping() to be a vCPU instead of a
> > domain, and also update the function logic to allow manipulation of per-domain
> > mappings using the linear page table mappings.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/include/asm/mm.h |  2 +-
> >  xen/arch/x86/mm.c             | 24 +++++++++++++++++++++++-
> >  xen/arch/x86/pv/domain.c      |  3 +--
> >  xen/arch/x86/x86_64/mm.c      |  2 +-
> >  4 files changed, 26 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> > index b50a51327b2b..65cd751087dc 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -605,7 +605,7 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
> >                               struct page_info **ppg);
> >  void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> >                                  mfn_t *mfn, unsigned long nr);
> > -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> > +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
> >                                 unsigned int nr);
> >  void free_perdomain_mappings(struct domain *d);
> >  
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 0abea792486c..713ae8dd6fa3 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -6511,10 +6511,11 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> >      unmap_domain_page(l3tab);
> >  }
> >  
> > -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> > +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
> >                                 unsigned int nr)
> >  {
> >      const l3_pgentry_t *l3tab, *pl3e;
> > +    const struct domain *d = v->domain;
> >  
> >      ASSERT(va >= PERDOMAIN_VIRT_START &&
> >             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> > @@ -6523,6 +6524,27 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> >      if ( !d->arch.perdomain_l3_pg )
> >          return;
> >  
> > +    /* Use likely to force the optimization for the fast path. */
> > +    if ( likely(v == current) )
> 
> As in the previous patch, doesn't using curr_vcpu here...
> 
> > +    {
> > +        l1_pgentry_t *pl1e;
> > +
> > +        /* Ensure page-tables are from current (if current != curr_vcpu). */
> > +        sync_local_execstate();
> 
> ... avoid the need for this?

See previous reply and the hazards of curr_vcpu changing as a result
of an interrupt triggering a sync_local_execstate() call.

Thanks, Roger.

