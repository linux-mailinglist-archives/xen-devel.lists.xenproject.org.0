Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFDB151B1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062929.1428667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnb4-0001yQ-Cf; Tue, 29 Jul 2025 16:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062929.1428667; Tue, 29 Jul 2025 16:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnb4-0001vv-A2; Tue, 29 Jul 2025 16:54:38 +0000
Received: by outflank-mailman (input) for mailman id 1062929;
 Tue, 29 Jul 2025 16:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y9DQ=2K=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugnb2-0001vp-Mi
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:54:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46ed0e9-6c9c-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 18:54:34 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4561607166aso57335e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 09:54:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b778f0c5dfsm12511046f8f.63.2025.07.29.09.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 09:54:33 -0700 (PDT)
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
X-Inumbo-ID: b46ed0e9-6c9c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753808074; x=1754412874; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSvmZzpSrjEo4A2vIROR4b1w/2BLuwqD9iWRdDy36aA=;
        b=psQ21GMsT2VpY/4bD/o0RktsTuBLCkylttIsoB9GaPv9BRtbNpPdbZVQt5rtYDVm7j
         2AnyQg7Y2hus9xRStPph8lrFOLgjJ31imi0Gyx9XvwJhseaqzTJMw8yTgt7uk8ymyb31
         iTpZqqV132Qr2OWchxLwKTchqYLY01zRcwBUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753808074; x=1754412874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSvmZzpSrjEo4A2vIROR4b1w/2BLuwqD9iWRdDy36aA=;
        b=XRx01lF7KjE97LlIFncACqdAPJP59Wn4FHDnCJuLJ1AAjW+XYCLb3sVfDNXL/XhjUA
         YeiwaE8Yr9Aqyr6DP4nrW95Wd/WWCfuSZKilUZCbGYmLY2nJ8/q0vyFlo/NSHkE3wiE6
         13MQ0EhKQEZk2GgodFrNPb0xOJ0yJpSqxKTD3Bsz8rbYTOAH1fWj1aZHIMpu8/cZ6gm3
         bGYgbVf5uR2vIEOOly1BDwuJElcObRLki90fKjW7xY5Gc5vsS71tJPzGDAmHxY9OKneu
         SVL0XhJ98tetpJhUNhWypLJdvYk/SR25ZS2QVLdexn55Q8+terFWQPjvCceXQtuTWG+1
         hS/w==
X-Forwarded-Encrypted: i=1; AJvYcCX5l178VMTASwaReHiv1zAP6UPEWXewZ4hZXW3mfji0O457KWFdvGsQWQtPtGZRAzbjHZwrZsHN7xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJXmLR0FgdsFv7UQDVZygeM6BaQRICfCt1f3HruGMGVniHk+AO
	DidWYTzqP+Awh2nAMwpwyuXWmoBs1sc7DnKz/3nqMDERBuFTITaeyqyC8B8g80HJAx8=
X-Gm-Gg: ASbGncuM08jUcfXLJvGEYD9rA4Y9SYGKrKbMpIYKXwWAo9uFo8v6AGq/i1NaWGcN+Wr
	GWH+hGLa7KFRiY9XLAL5wOh0wo95+yp9LX3o7SxLhp6gUWEQrkIgtOSVWjRLLrb6VcCk7IAQ01y
	wvwD6zSCM9fIqIac8nO0Q5o6WDZhRFC1BlG2+PN38iVvgUfsMom7dcjR0ylYiyzvngQxoSsNQTc
	H9XLE+XYiwkCssrfVDKonVbvP4oLhOkzUrm4tKljpoB29RN+r4s0DLOLmDsNj37oKRrUUHi9uNJ
	WJ/KRFo98qWlFFRq2IhpQ3LFpJ8vJGMGnMc568aE7kWQ9YrxERLJGkyaVDwwhq97HeUspiorcrk
	ZQsRW3QB70A0+Io55URQptv2HPB2i12kyvi/Kv0i+pkMfxzzDorVwSnzObixyj7WmaA==
X-Google-Smtp-Source: AGHT+IE/3zuU+mjF/1lCpJ80ix9fiM+6xgeBvj+bSJ/DzH+xNJu6rrZM/BGB/JHY1tNFxhgnhZ9C9w==
X-Received: by 2002:a05:600c:8b81:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45892ba3686mr5682025e9.15.1753808074128;
        Tue, 29 Jul 2025 09:54:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 18:54:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
Message-ID: <aIj8uzIa-wcpmvOH@macbook.local>
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-9-roger.pau@citrix.com>
 <690b5769-3602-4514-bd26-8119697b32f6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <690b5769-3602-4514-bd26-8119697b32f6@suse.com>

On Tue, Jul 29, 2025 at 04:33:53PM +0200, Jan Beulich wrote:
> On 24.07.2025 13:04, Roger Pau Monne wrote:
> > There's a loop in arch_init_memory() that iterates over holes and non-RAM
> > regions to possibly mark any page_info structures matching those addresses
> > as IO.  The looping there is done over the PFN space.
> > 
> > PFNs not covered by the PDX space will always fail the mfn_valid() check,
> > hence re-write the loop to iterate over the PDX space and avoid checking
> > any holes that are not covered by the PDX translation.
> > 
> > On a system with a ~6TiB hole this change together with using PDX
> > compression reduces boot time in approximately 20 seconds.  Xen boot time
> > without the change is ~50s, with the change it's ~30s.
> 
> That's nice, and I agree what we currently do isn't very efficient, but ...
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
> >  
> >  void __init arch_init_memory(void)
> >  {
> > -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
> > +    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
> >  
> >      /*
> >       * Basic guest-accessible flags:
> > @@ -328,9 +328,14 @@ void __init arch_init_memory(void)
> >              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
> >                                   (unsigned long)mfn_to_virt(ioend_pfn));
> >  
> > -        /* Mark as I/O up to next RAM region. */
> > -        for ( ; pfn < rstart_pfn; pfn++ )
> > +        /*
> > +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
> > +         * skip holes which would always fail the mfn_valid() check.
> > +         */
> > +        for ( pdx = pfn_to_pdx(pfn); pdx < pfn_to_pdx(rstart_pfn); pdx++ )
> 
> ... pfn_to_pdx() isn't well-defined for a non-RAM PFN, or more precisely for any
> PFN that fails the mfn_valid() check. That is, I think, particularly noticeable
> with the new offset compression you introduce.

rstart_pfn will always point to the start of the next RAM region (or
the end of the current region if it's the last one).  So for that case
pfn_to_pdx() is always provided a RAM PFN as input parameter.

However for the pfn parameter, we would need to do pfn_to_pdx(pfn -
1), as that's the last address in the previous RAM range.  The loop
would then possibly be:

for ( pdx = pfn_to_pdx((pfn ?: 1) - 1) + 1; pdx < pfn_to_pdx(rstart_pfn); pdx++ )
{
    ...

This also assumes that PFN 0 will always have a valid PDX translation,
regardless of whether it's RAM or not (which is the case given the PDX
code currently used).

Thanks, Roger.

