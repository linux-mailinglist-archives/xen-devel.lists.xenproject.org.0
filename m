Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A0A91F06
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957755.1350794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PmD-0003dy-5P; Thu, 17 Apr 2025 13:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957755.1350794; Thu, 17 Apr 2025 13:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PmD-0003bC-0g; Thu, 17 Apr 2025 13:59:37 +0000
Received: by outflank-mailman (input) for mailman id 957755;
 Thu, 17 Apr 2025 13:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5PmB-0003b6-BX
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 13:59:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3129d28a-1b94-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 15:59:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acb415dd8faso122387166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 06:59:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb5747173esm127972466b.152.2025.04.17.06.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 06:59:33 -0700 (PDT)
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
X-Inumbo-ID: 3129d28a-1b94-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744898374; x=1745503174; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nz2SSNBGeVvEjrFUcuqjIHFAMdl1GlO02Oan4EstqZs=;
        b=OkGMrzZXbBcKfH3O7tujd6Y41Tsv5vZHWPUc6khWf43HG7EsLOS3OpYIg8RHUveIYm
         G2WY6rusBpF6K8lezWq9CC0B6JP/wEjJwf3leXmarFs8FDiBrvFRYf56t2vjgbkQL/78
         MJ+fvBqV7Hf9B1l4B4djhWCUVUUkGkRBPOnZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898374; x=1745503174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz2SSNBGeVvEjrFUcuqjIHFAMdl1GlO02Oan4EstqZs=;
        b=c0FAn+//gcMdhnGgLe81QYGz6CnEHl8dOjdffjnAZNvN7Cc6249ISb7fW9MRlrukms
         jdwJ4Gx9scdBeDmLSkL4JLL65LylsNwN0fBX+UnY7f651CjZgZQED/1NO03mPk4TnXcy
         lxfPdCPlopcnmigmmm1Cp13Nt9Ca6eZrkFCtNP2PHn0W1xAa0sqsizGnBYdhzISyay5v
         kxn9LQWMFC1kt0MCTuDLAGlOqN8AEPZVq6HSGMOPDQ+NKGnQn5Je5KH/tqEgv6v9XUZ5
         tuwG80aj1a8feXzlLwj/bH4MRVWnMq4QCr3Td3CbfYuqCnew/J8mAKHIBbwaqYedMC6N
         ROCw==
X-Forwarded-Encrypted: i=1; AJvYcCVopZUPBzE+v98wDB2Wwu3T0pp+/ssLcAk7YSLiJQCvX5d+3fgUy5vNJSXzM/iwa8D9QdBPZzSB6mc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcHl4NWOQhyTuIerVeI8wA70SVL/LlvFbdTtmfcEjh7CaDcqu+
	sN8/3OuJmbyzOhwhtlmB4jDR43ySyOyywBXSCHDU84L3Yk8XTWuPM7PvkXxIvrI=
X-Gm-Gg: ASbGncsYopaE3ob2L7OH8Hcb067A50KEcbc9Y5TM53aGHd+RGpy5mnvb0Xk4nNbe7hW
	6RaOHR80N5F+gW3fhSP9+GbpT/CMrumnZB64iMxvidlgQlPcne7jXuDUxthKFpWdbgQpQq3pVJB
	uuVXhl8Rt2UQSz8B8F/YyIju3SLemg9Jjsrixqe/VP09+b/777gWrciMDpyxM5ZQ1+nT1i+EXKm
	iHEQdYnjcro+pafKnbHVCJXKgY9c9eO8s23fuNFDdhft2DlqfEQ8NMK1zS7Q47eu3Aaq79/30IJ
	TpH3uVQRfYF55oCKwDBmnVxesLdotjWv1/zh21yR4BoZfA==
X-Google-Smtp-Source: AGHT+IFZj2hrOjAWaZrEBWHMc4Lf/qGCHgk/2dT8ves9PcTcVZrrgmZXqGhtItqFUxfgeu+SX9frUw==
X-Received: by 2002:a17:907:728e:b0:ac3:8537:904e with SMTP id a640c23a62f3a-acb42c07205mr531016766b.49.1744898373687;
        Thu, 17 Apr 2025 06:59:33 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:59:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aAEJRB52xyRFYrIz@macbook.lan>
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-3-roger.pau@citrix.com>
 <c890cef7-da7c-4cb1-922d-8b0b155eca43@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c890cef7-da7c-4cb1-922d-8b0b155eca43@suse.com>

On Thu, Apr 17, 2025 at 09:57:29AM +0200, Jan Beulich wrote:
> On 15.04.2025 17:32, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -370,7 +370,12 @@ static int hvmemul_do_io(
> >          /* If there is no suitable backing DM, just ignore accesses */
> >          if ( !s )
> >          {
> > -            if ( is_mmio && is_hardware_domain(currd) )
> > +            if ( is_mmio && is_hardware_domain(currd) &&
> > +                 /*
> > +                  * Do not attempt to fixup accesses to r/o MMIO regions, they
> > +                  * are expected to be terminated by the null handler below.
> > +                  */
> > +                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )
> >              {
> >                  /*
> >                   * PVH dom0 is likely missing MMIO mappings on the p2m, due to
> 
> Doesn't this need limiting to writes, i.e. permitting reads to still be
> handled right here?

Oh, I see, yes, it would be fine to attempt to fixup read accesses to
mmio_ro_ranges ranges.

> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/mmio.c
> > @@ -0,0 +1,100 @@
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
> > +    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);
> 
> Don't you need to use PFN_DOWN() on addr?
> 
> > +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> > +           subpage_mmio_find_page(mfn);
> > +}
> > +
> > +static int cf_check subpage_mmio_read(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +{
> > +    struct domain *d = v->domain;
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query(d, addr, &t);
> 
> Same here and further down, and in the write case?

Hm, yes I do.

> > +    struct subpage_ro_range *entry;
> > +    volatile void __iomem *mem;
> > +
> > +    *data = ~0UL;
> > +
> > +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> > +    {
> > +        put_gfn(d, addr);
> > +        return X86EMUL_RETRY;
> > +    }
> > +
> > +    entry = subpage_mmio_find_page(mfn);
> > +    if ( !entry )
> > +    {
> > +        put_gfn(d, addr);
> > +        return X86EMUL_OKAY;
> > +    }
> > +
> > +    mem = subpage_mmio_map_page(entry);
> > +    if ( !mem )
> > +    {
> > +        put_gfn(d, addr);
> > +        gprintk(XENLOG_ERR,
> > +                "Failed to map page for MMIO read at %#lx -> %#lx\n",
> > +                addr, mfn_to_maddr(mfn) + PAGE_OFFSET(addr));
> > +        return X86EMUL_OKAY;
> > +    }
> > +
> > +    *data = read_mmio(mem + PAGE_OFFSET(addr), len);
> 
> What if this crosses the trailing page boundary? Imo subpage_mmio_accept()
> would better reject misaligned accesses (at least until we know we need to
> handle such for some obscure reason).

Yes, the previous mmio_ro_emulated_write() did already reject such
accesses.

Thanks, Roger.

