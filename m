Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC2772B7B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578737.906389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3Rb-00058i-OD; Mon, 07 Aug 2023 16:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578737.906389; Mon, 07 Aug 2023 16:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3Rb-00056R-LN; Mon, 07 Aug 2023 16:50:59 +0000
Received: by outflank-mailman (input) for mailman id 578737;
 Mon, 07 Aug 2023 16:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JzBl=DY=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qT3Ra-00056H-4Y
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:50:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92525037-3542-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 18:50:53 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so9901685e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 09:50:53 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k14-20020adfd84e000000b003177e9b2e64sm10978183wrl.90.2023.08.07.09.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:50:52 -0700 (PDT)
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
X-Inumbo-ID: 92525037-3542-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691427053; x=1692031853;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LKEm6G/V3XIQ0C2dYNohL+O7aJTA4lRLDP7gzEGgA2Q=;
        b=QEJDqAL6bDyZGDe82wOJ73Ywp0jMWfSPrMc2KIpwhdE0OZq9KZzrs0WZJzJXPtEPk6
         hZ8IuAU8AOVR+oVQtd9VT2f2bWNYWkJcWaS1L/Zmu1uFyXIEeu05f6z2hSI6cj3gbTmx
         AIZvkLevrcHQx7LMAySlbGXobPfXMRPjqggrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691427053; x=1692031853;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKEm6G/V3XIQ0C2dYNohL+O7aJTA4lRLDP7gzEGgA2Q=;
        b=hdBpYqZzJVx7szRo6lHfKI6uEzYGkzGo1kCSyEyZzRkVLwtSexDqPk4BahaXJm5k9L
         BwSP7Z2m3b1P2SaUQkSFlFi58fkhGCqUvN3VlYk6u2NEaYtykKOkOHiB9vpoRk09S0MX
         9cFWUH5yzz1/BtJxE2PYJv9YRl/wdayp25a9jYi7uArznRlqMjwR8sK8iwxyr6Yvhszq
         Zv83ThwMXQhgBZfKwtJyyEon47xuDIYl+dhVqFvcs8zdakcrR++DWjLfoGlCMSwm9qgo
         RbXsiYoCirH+GXq/ejICqALEF+yuAoWFU6S6ELCHacqJej4/QkMDK81TsJHaqQxLaA8A
         AaSw==
X-Gm-Message-State: AOJu0YyQlPtY5OcXpe6jCSbTYuoHsNKkxypmo9Lr1tyI8v/F1+2p9rls
	f7WK4/xnrukaav4wZKZWH0jcuQ==
X-Google-Smtp-Source: AGHT+IFjt2mnEDISgicoju+YH8lirAuvEMaxpaGRNahXNXLJbcJGz2ye/mPyRRAbO7LdE6Wv8TeH4Q==
X-Received: by 2002:a05:600c:2119:b0:3fc:1a6:7764 with SMTP id u25-20020a05600c211900b003fc01a67764mr6396663wml.16.1691427052993;
        Mon, 07 Aug 2023 09:50:52 -0700 (PDT)
Message-ID: <64d120ec.df0a0220.84f23.bc02@mx.google.com>
X-Google-Original-Message-ID: <ZNEg6p0Zk2twAbQu@EMEAENGAAD19049.>
Date: Mon, 7 Aug 2023 17:50:50 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/5] mm/pdx: Standardize region validation wrt pdx
 compression
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-4-alejandro.vallejo@cloud.com>
 <ca38d130-ba56-33b2-3134-3b8d4d0dc4fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca38d130-ba56-33b2-3134-3b8d4d0dc4fe@suse.com>

On Mon, Jul 31, 2023 at 05:27:22PM +0200, Jan Beulich wrote:
> On 28.07.2023 09:59, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/x86_64/mm.c
> > +++ b/xen/arch/x86/x86_64/mm.c
> > @@ -1159,6 +1159,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
> >  {
> >      unsigned long s, e, length, sidx, eidx;
> >  
> > +    paddr_t mem_base = pfn_to_paddr(spfn);
> > +    unsigned long mem_npages = epfn - spfn;
> > +
> >      if ( (spfn >= epfn) )
> >          return 0;
> 
> While occasionally groups of declarations indeed want separating, the
> rule of thumb is that the first blank line after declarations separates
> them from statements. I don't see reason here to diverge from this.
Ack.

> 
> > @@ -1660,6 +1663,8 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
> >  
> >  void __init efi_init_memory(void)
> >  {
> > +    paddr_t mem_base;
> > +    unsigned long mem_npages;
> 
> Why in the outermost scope when ...
> 
> > @@ -1732,6 +1737,9 @@ void __init efi_init_memory(void)
> >          smfn = PFN_DOWN(desc->PhysicalStart);
> >          emfn = PFN_UP(desc->PhysicalStart + len);
> >  
> > +        mem_base = pfn_to_paddr(smfn);
> > +        mem_npages = emfn - smfn;
> > +
> >          if ( desc->Attribute & EFI_MEMORY_WB )
> >              prot |= _PAGE_WB;
> >          else if ( desc->Attribute & EFI_MEMORY_WT )
> > @@ -1759,8 +1767,7 @@ void __init efi_init_memory(void)
> >              prot |= _PAGE_NX;
> >  
> >          if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
> > -             !(smfn & pfn_hole_mask) &&
> > -             !((smfn ^ (emfn - 1)) & ~pfn_pdx_bottom_mask) )
> > +             pdx_is_region_compressible(mem_base, mem_npages))
> >          {
> >              if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
> >                  prot &= ~_PAGE_GLOBAL;
> 
> ... you use the variables only in an inner one?
No good reason. I defaulted to the top of the function because C90 was
picky about declaring midway through a scope and I didn't consider going to
the top of the scope instead. Ack.

> 
> > --- a/xen/common/pdx.c
> > +++ b/xen/common/pdx.c
> > @@ -88,7 +88,7 @@ bool __mfn_valid(unsigned long mfn)
> >  }
> >  
> >  /* Sets all bits from the most-significant 1-bit down to the LSB */
> > -static uint64_t __init fill_mask(uint64_t mask)
> > +static uint64_t fill_mask(uint64_t mask)
> >  {
> >      while (mask & (mask + 1))
> >          mask |= mask + 1;
> 
> I see why you want __init dropped here, but the function wasn't written
> for "common use" and hence may want improving first when intended for
> more frequent (post-init) use as well.
It's not so much that I want it rather than I need it. hotadd_mem_check()
uses it and it's not part of the init process. That's the only non-init use
of it, and it hardly qualifies as "common". IMO, 
don't matter a whole

> Then again I wonder why original
> checking all got away without using this function ...
> 
> Jan
My guess is that most real systems don't exercise the corner cases, and so
the code was just silently broken passing the checks all the time. I could
not find an explanation for the OR check in hotadd_mem_check(), so I just
attributed it to being a bug introduced out of lack of knowledge of pdx.

Thanks,
Alejandro

