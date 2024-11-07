Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91819C0CB4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 18:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832125.1247524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t96AW-0007vT-ER; Thu, 07 Nov 2024 17:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832125.1247524; Thu, 07 Nov 2024 17:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t96AW-0007ta-Bn; Thu, 07 Nov 2024 17:19:40 +0000
Received: by outflank-mailman (input) for mailman id 832125;
 Thu, 07 Nov 2024 17:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t96AV-0007tU-Dr
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 17:19:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75cc7d68-9d2c-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 18:19:35 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso204563266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 09:19:35 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2d7absm119807666b.179.2024.11.07.09.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 09:19:34 -0800 (PST)
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
X-Inumbo-ID: 75cc7d68-9d2c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc1Y2M3ZDY4LTlkMmMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTk5OTc1LjUyMzgwNiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730999975; x=1731604775; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uiozKql4La8jnILXuv5BTnGU3Py29MEA6j1yU5W8bg=;
        b=r/TuH25aZ0z/BW/CUkiSsXKo1/cI7tEa1CVSPtJzuJioGlL1aj8ir1btZZuaztC997
         tI0MY5g9XfRmiY5x0JOQ8uEviCfpEJPtegf5LD0GxMGacxM2WoTLCii8vTixg+V2ESrL
         J6UdhPCQJLF1sT4CpMrwanwATlS9d8mpVt+5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730999975; x=1731604775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uiozKql4La8jnILXuv5BTnGU3Py29MEA6j1yU5W8bg=;
        b=mmaW9CJ/ZfNxSvQ7nWIrmw8PSFJN6whuLnRkQziM3psJUTs6JRYZ8ibDBaBEdni+Qm
         hZlHP4+XFdILR7R+hcl0j01N/sdg/5yIl5zwWwy4PGB9LNz0zl2m5G+mkUKqkL6L1cxy
         iDehjthAbS4XX+e96RbIQmXcPo8oxDRqdcGl4tttmunalfM5yj33NxO3hFM+9hoH3Gaf
         8vZ9cnRtuDs5/jjr94ADImA/pJ8UGOgHTI6RsRxCeGC3Z4bYyYguALh5kXwm/L/5QsLN
         lnld7ORWo/6BFM98UfQCtMcvDPtdjFkNZwJfsM4dJs5xDQUnvH1YQ0M2MM8bK5Hc2G7u
         HcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKub6z3Z/6l1nT9QPzOTjH5kS2MwrkiM0ZW05W4wjbxeLCdndJRolZwcp0dt2lZgiSMar8QFlyTVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx1gj0+gB2SKI5/Y0k436KJtu58by2bRi30RjKXBT3rIhYvhwe
	0x4q0OXgt29hWAev8bBVqJIEx7HVWB5WQ+cq8sg9geLXKDezMO79gPf82TfxanWp8+euX69igP9
	k
X-Google-Smtp-Source: AGHT+IGodC2H459SjXXEndd9/3T38Bij95f4Lg+7qSdLBLeVID5PEPy+UpTUYmiHXaH6NUAzMzMtBg==
X-Received: by 2002:a17:907:86a2:b0:a9a:134:9887 with SMTP id a640c23a62f3a-a9de6167ad2mr4143256766b.41.1730999974664;
        Thu, 07 Nov 2024 09:19:34 -0800 (PST)
Date: Thu, 7 Nov 2024 18:19:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page
 alignment
Message-ID: <Zyz2pYEjbh9SVnAl@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-2-roger.pau@citrix.com>
 <85d6a128-965b-4f39-8d08-2b2084db65b4@suse.com>
 <ZyzlxiipPvbUjs0r@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyzlxiipPvbUjs0r@macbook>

On Thu, Nov 07, 2024 at 05:07:34PM +0100, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 11:42:11AM +0100, Jan Beulich wrote:
> > On 06.11.2024 13:29, Roger Pau Monne wrote:
> > > --- a/xen/arch/x86/include/asm/page.h
> > > +++ b/xen/arch/x86/include/asm/page.h
> > > @@ -200,6 +200,12 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
> > >  #define l4_table_offset(a)         \
> > >      (((a) >> L4_PAGETABLE_SHIFT) & (L4_PAGETABLE_ENTRIES - 1))
> > >  
> > > +/* Check if an address is aligned for a given slot level. */
> > > +#define SLOT_IS_ALIGNED(v, m, s) \
> > > +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
> > 
> > The check involving an address and an MFN, I think the comment would better
> > also reflect this. "Check if a (va,mfn) tuple is suitably aligned to be
> > mapped by a large page at a given page table level"?
> > 
> > As to the name of this helper macro - "SLOT" can mean about anything when
> > not further qualified. If the macro was local to ...
> > 
> > > +#define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
> > > +#define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
> > > +
> > >  /* Convert a pointer to a page-table entry into pagetable slot index. */
> > >  #define pgentry_ptr_to_slot(_p)    \
> > >      (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
> > > --- a/xen/arch/x86/mm.c
> > > +++ b/xen/arch/x86/mm.c
> > 
> > ... this (sole) file using the derived ones, that might be acceptable. If
> > it's to remain in page.h, how about e.g. IS_LnE_ALIGNED()?
> 
> Since you expressed further concerns in the next patch, I will move it
> to being local to mm.c.  I don't have any other use-case, but assumed
> the macros are generic enough to be useful in other contexts.
> 
> > I further wonder whether it wouldn't be neater if just the level was passed
> > into the helper. Doing so wouldn't even require token concatenation (which
> > iirc both you and Andrew don't like in situations like this one), as the
> > mask can be calculated from just level and PAGETABLE_ORDER. At which point
> > it may even make sense to leave out the wrapper macros.
> 
> I can see what I can do.

Would something like:

#define IS_LnE_ALIGNED(v, m, n) \
    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)

Defined only in the context of map_pages_to_xen() be OK with you?

I'm unsure whether it would be better if I still provided the
IS_L{2,3}E_ALIGNED() macros based on that, as IMO those macros made
the conditionals clearer to read.

Thanks, Roger.

