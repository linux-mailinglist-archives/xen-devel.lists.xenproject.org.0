Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A94A922A1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958274.1351183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5S1r-00040W-5G; Thu, 17 Apr 2025 16:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958274.1351183; Thu, 17 Apr 2025 16:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5S1r-0003xa-2e; Thu, 17 Apr 2025 16:23:55 +0000
Received: by outflank-mailman (input) for mailman id 958274;
 Thu, 17 Apr 2025 16:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5S1p-0003xU-Jy
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:23:53 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58cbfdd6-1ba8-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 18:23:51 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-223fb0f619dso13178935ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 09:23:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73dbf8e1535sm34482b3a.47.2025.04.17.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 09:23:49 -0700 (PDT)
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
X-Inumbo-ID: 58cbfdd6-1ba8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744907030; x=1745511830; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNdFN0BhTLzvKFYlUQYklo928rK7wP7sb/0C9aa38Os=;
        b=RZDCqzvLPswIEDHS4zyFimEWhxeOw2GdsoB14w5rR24gP9MqCIwru1dKjZuovlBbYs
         5FESB9P/c8UgKhal/imres93mo7/3agWAkhCyIyIVM9e2Zshj/K39x7GmmmAN8E+a46C
         GrzNYtcebnihSB34ktKW6o0U2tT/RAyTzq+iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907030; x=1745511830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNdFN0BhTLzvKFYlUQYklo928rK7wP7sb/0C9aa38Os=;
        b=E7rcJLc7AkptEuR3zBI7mQKyr4Rl6p6o/Z4fbdSAnow4SGkkhqxNpq1aWOuTjEBMMu
         WNFse74RQ4AsntGh9U8iS9k6xy/1BpOZepYLtUUGOttiMqP7lZJteNofQG4yfY/uLv2B
         VCXNQnAZvx+hVCOMUAT+YP4Zk3qinSaCjgppvWkZ92btoh5bBHo04vHDykPSRt9yQCfI
         l4GFFxxWzoZDn+dNFQ5d4vJoMIEjAS8Z8Hq5oLuJhUFBNOVlULYX/nlCekF98+oi/pjY
         yhI02BJsfg6QQdwQLJW16FsdbeCeKzBrbx+Qxu1RAUS8exnGNVNnSFFk5uHeZraeCi/2
         ihCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtMPs5VtkBD3kWJmk5iVzzqLwhPH41oGgV6lU07VAJ62YJetR2temmz1WDu1CIYG6d1qdVAy1CyIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrppL2rOfSu4ojdm0gCrCWEjKVVlKPYl01S+dIjlIadakAOnDI
	Fr6hKlhmUVkEN4OzK+Rolp8oFyie5yIocPFCn3C5FbQIW+RWxbBMJ7Sx/gW+YQU=
X-Gm-Gg: ASbGnctffuKl2uyJ7BuajtuPSidS1WY/W/qANkhfHp5w0qeO07UctT9GQPifS+Q8HGo
	2tjYVs7K+R6r/x+A+v9uTUCAPtIsYR71mw3uThZwuphn4HWyUnHg7mMzeyqV+I3rg2WEYv1hfbk
	Q/OLnxEqg81oG+SXciKRjWX+ny1xhWFUBRv+pc1F8IDaAXiIulJ+xxoYmE5VJ0SflQDLvK/IZvl
	ypnBzDrL13j8LO1KSUUzQUlhBDJV4ax6LIB+ZGdCu8Ejl/8m4Ywkcpm6iDObS0AlHdEqVKNe9Yq
	kMXtW5NsiXazQnp5ANLOClohvdqyTOWqHvKUbTxm1D9PHw==
X-Google-Smtp-Source: AGHT+IHlFTa6JbhfXeuFYaHXo4wXbunBH6gZblGDWH+j4ZTfJpcoleUu4u2/oSrJq34pCyXij3JjVg==
X-Received: by 2002:a17:902:d2c1:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22c51f35ab8mr2086665ad.22.1744907029952;
        Thu, 17 Apr 2025 09:23:49 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:23:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aAErECZ1Ys-Nufon@macbook.lan>
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
 <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>

On Thu, Apr 17, 2025 at 05:38:54PM +0200, Jan Beulich wrote:
> On 17.04.2025 17:25, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -370,7 +370,15 @@ static int hvmemul_do_io(
> >          /* If there is no suitable backing DM, just ignore accesses */
> >          if ( !s )
> >          {
> > -            if ( is_mmio && is_hardware_domain(currd) )
> > +            if ( is_mmio && is_hardware_domain(currd) &&
> > +                 /*
> > +                  * Do not attempt to fixup write accesses to r/o MMIO regions,
> > +                  * they are expected to be terminated by the null handler
> > +                  * below.
> > +                  */
> > +                 (!rangeset_contains_singleton(mmio_ro_ranges,
> > +                                               PFN_DOWN(addr)) ||
> > +                  dir == IOREQ_READ) )
> 
> These two would better be swapped, for the cheap one to be done first.

Can swap, thanks for pointing out.

> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/mmio.c
> > @@ -0,0 +1,125 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * MMIO related routines.
> > + *
> > + * Copyright (c) 2025 Cloud Software Group
> > + */
> > +
> > +#include <xen/io.h>
> > +#include <xen/mm.h>
> > +
> > +#include <asm/p2m.h>
> > +
> > +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> > +{
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> > +
> > +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> > +           subpage_mmio_find_page(mfn);
> > +}
> > +
> > +/*
> > + * The guest has read access to those regions, and consequently read accesses
> > + * shouldn't fault.  However read-modify-write operations may take this path,
> > + * so handling of reads is necessary.
> > + */
> > +static int cf_check subpage_mmio_read(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +{
> > +    struct domain *d = v->domain;
> > +    unsigned long gfn = PFN_DOWN(addr);
> > +    p2m_type_t t;
> > +    mfn_t mfn;
> > +    struct subpage_ro_range *entry;
> > +    volatile void __iomem *mem;
> > +
> > +    *data = ~0UL;
> > +
> > +    if ( !IS_ALIGNED(len | addr, len) )
> 
> What's the point of doing the | ? len can't be misaligned with itself?

Hm, it's the same form that's used in mmio_ro_emulated_write(), I
assumed it was to catch illegal access lengths, like 3.

> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -554,6 +554,18 @@ int cf_check mmio_ro_emulated_write(
> >      enum x86_segment seg, unsigned long offset, void *p_data,
> >      unsigned int bytes, struct x86_emulate_ctxt *ctxt);
> >  
> > +/* r/o MMIO subpage access handlers. */
> > +struct subpage_ro_range {
> > +    struct list_head list;
> > +    mfn_t mfn;
> > +    void __iomem *mapped;
> > +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> > +};
> > +struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn);
> > +void __iomem *subpage_mmio_map_page(struct subpage_ro_range *entry);
> 
> I notice you didn't move the __iomem, which - as indicated - I agree with,
> but Andrew didn't. Did you sort this with him privately?

I will raise with him, seeing as he didn't reply to your last email, I
assumed he was OK with the reasoning?

Thanks, Roger.

