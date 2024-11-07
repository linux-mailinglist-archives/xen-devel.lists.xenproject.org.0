Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588569C0AD0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 17:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832085.1247484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t952s-0004Ii-Kt; Thu, 07 Nov 2024 16:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832085.1247484; Thu, 07 Nov 2024 16:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t952s-0004HD-IF; Thu, 07 Nov 2024 16:07:42 +0000
Received: by outflank-mailman (input) for mailman id 832085;
 Thu, 07 Nov 2024 16:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t952r-0004H5-6o
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 16:07:41 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fd8703-9d22-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 17:07:37 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cec7cde922so1465827a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 08:07:37 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7e87asm929025a12.20.2024.11.07.08.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 08:07:36 -0800 (PST)
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
X-Inumbo-ID: 67fd8703-9d22-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY3ZmQ4NzAzLTlkMjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk1NjU3LjI3NTQ4NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730995657; x=1731600457; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dhvmXxfHbapXpqGm8fl5N0bzv/si7HULfLf8tDohfA=;
        b=s8IoaGakD2eCh1GacyypBXMwFb/fj9h1ttI5WmUxjMXmRX6rlejwj3w7Vc0L/0Bx0b
         In/SuOhMXMVB/e56kWuh3pKa2hvx1Yx6eDeOQAoAsTkYlMC7sOwP3Qgpfes86UOf/JRe
         HClZZtBShBFHhy+o//Bbnz9gSMPlz3D/cGpxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995657; x=1731600457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dhvmXxfHbapXpqGm8fl5N0bzv/si7HULfLf8tDohfA=;
        b=MTxG6rWK82vNh5BGeq3R6R3JH60BFTmkDUQ9KZD6xmAX0Wu0XYYPEqz7xI59xzxDim
         a7LFhEH664Ex+paGcu5otIbSbY4tfOUQI0ono7gu8cJkQkrjXkfGm8sRpGX9AKyW5iqw
         4mVoL9eukKGyAa8b4wlOUvKz6fa6f1y9FN4WdJrWYK9piKUEpilLGaI2/JXShmeSAH+W
         nETB2fqWMG5hwj4iqHlM7/ac4WnCZHXjQGWpO98peydCHcOQTJrVJ7nuMpghQRvqugXS
         wnghtznNz/5IhnE+p0IhH43vODxEf2xhWG9O3TM2MNMd8XXEMJdj6aWe7myC5kKpWEnW
         cIpA==
X-Forwarded-Encrypted: i=1; AJvYcCWxQ4ppDYBZQFrpd3X+L+cac20izAVFitrOHGLpFEQ6vH2k95Ip+GRkXU1i4VS69Of/+8SsPGng80I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvQ8HYn3PtNfel67u2nDFPWkDK3M2YN0cN+03qB5AzSbonc/IM
	hZQRMJM1gt3Ya1Q+YIA9Vpgt3tbNix6AqB1wrfrrp5pQ3iOuY1kQgcyBYrO5xpc=
X-Google-Smtp-Source: AGHT+IHEkRgQpIu/7IRr2IZdTj/Na8n7/b9Ukg+05EC8uO66Ybr00rzk9xGID6f3L4xhCclHhKI8Vw==
X-Received: by 2002:a05:6402:5193:b0:5cb:b68d:8def with SMTP id 4fb4d7f45d1cf-5cf08c6be4emr341920a12.31.1730995656466;
        Thu, 07 Nov 2024 08:07:36 -0800 (PST)
Date: Thu, 7 Nov 2024 17:07:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page
 alignment
Message-ID: <ZyzlxiipPvbUjs0r@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-2-roger.pau@citrix.com>
 <85d6a128-965b-4f39-8d08-2b2084db65b4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85d6a128-965b-4f39-8d08-2b2084db65b4@suse.com>

On Thu, Nov 07, 2024 at 11:42:11AM +0100, Jan Beulich wrote:
> On 06.11.2024 13:29, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/page.h
> > +++ b/xen/arch/x86/include/asm/page.h
> > @@ -200,6 +200,12 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
> >  #define l4_table_offset(a)         \
> >      (((a) >> L4_PAGETABLE_SHIFT) & (L4_PAGETABLE_ENTRIES - 1))
> >  
> > +/* Check if an address is aligned for a given slot level. */
> > +#define SLOT_IS_ALIGNED(v, m, s) \
> > +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
> 
> The check involving an address and an MFN, I think the comment would better
> also reflect this. "Check if a (va,mfn) tuple is suitably aligned to be
> mapped by a large page at a given page table level"?
> 
> As to the name of this helper macro - "SLOT" can mean about anything when
> not further qualified. If the macro was local to ...
> 
> > +#define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
> > +#define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
> > +
> >  /* Convert a pointer to a page-table entry into pagetable slot index. */
> >  #define pgentry_ptr_to_slot(_p)    \
> >      (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> 
> ... this (sole) file using the derived ones, that might be acceptable. If
> it's to remain in page.h, how about e.g. IS_LnE_ALIGNED()?

Since you expressed further concerns in the next patch, I will move it
to being local to mm.c.  I don't have any other use-case, but assumed
the macros are generic enough to be useful in other contexts.

> I further wonder whether it wouldn't be neater if just the level was passed
> into the helper. Doing so wouldn't even require token concatenation (which
> iirc both you and Andrew don't like in situations like this one), as the
> mask can be calculated from just level and PAGETABLE_ORDER. At which point
> it may even make sense to leave out the wrapper macros.

I can see what I can do.

Thanks, Roger.

