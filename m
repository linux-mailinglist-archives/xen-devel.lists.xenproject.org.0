Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5AA982F2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964150.1355012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VMN-0002w1-Jx; Wed, 23 Apr 2025 08:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964150.1355012; Wed, 23 Apr 2025 08:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VMN-0002tm-HK; Wed, 23 Apr 2025 08:21:35 +0000
Received: by outflank-mailman (input) for mailman id 964150;
 Wed, 23 Apr 2025 08:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7VMM-0002Zw-Kb
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:21:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6ce5b3a-201b-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:21:32 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso51303685e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:21:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-44092d2b17asm16783825e9.18.2025.04.23.01.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 01:21:31 -0700 (PDT)
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
X-Inumbo-ID: f6ce5b3a-201b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745396492; x=1746001292; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3RFp77wbuQQggGtgksFPei1KDQi6Af7PLT4cK7azxO4=;
        b=pevsw9vZ2/fLsVQx/r4vzJql3j6CXx5cUX+nziKX8JKJY9Tly6nVynvuLq73U1AGSG
         Mf7FGQesTukVKmSqECiHvflnyAEHpcG3Z20W2T7ZC4GFtD6+S6vuSKUDleyx8xS6issi
         OnLGPRWqHqqInSygrLzJE1xYIygCGjs3HnHdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396492; x=1746001292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RFp77wbuQQggGtgksFPei1KDQi6Af7PLT4cK7azxO4=;
        b=sm4Cn8fQffb2W7h9y0UUOhDoIU1T1TvS3BUFOdUVpH2TSGDq9nFlh2RuqazrFOxZXy
         kr+NJAFUrAHrQQq8BxXJuAISBIrIFX0wSTjAQ7H0hot3bybUwgUjl9bJQ75kXXppZn55
         JJUoFgmXsqotF1hic2CD46pZ8igwLxHL7NttYPVST6zEyFoff0nyPuYBHpgwpkSmBd4Z
         mZ0PoHreOzQf4Ybd6QsJHmkz+HQw9iMgyFeaQ8pwnNEnVNCBJ6R0ir1qt8AQQLAZX7sd
         Q2nT51GKfwj1Og2hqI8MP+SMUUBe+LLt/8pPwY2HN/99s6JSBZA94KYrBoKC7MyCeaBe
         Hing==
X-Forwarded-Encrypted: i=1; AJvYcCVtHMpsXTqtqRXSzkEGl41aiy5g3MmYgmrK/BqkG5gnbja6oLKgGQhe9AODUs+CXJpQWExXQ6fVU6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfQYUjSZTtaokKG4V2l6kimTer5xJE8G4kJlA+G0oWHzev4SmP
	UpLF+FyaSpFLtnveF5Eae0xhaYW6Yvf0iATBEl5tCvoWBX6q0r7sCV6695Udq64=
X-Gm-Gg: ASbGncsLLNgpIimC/ratR2ZEte3/y+vvE6RPYkqp6V+DcJGVmI1I4p14mm3teTKEzNf
	8GwRyJz8gZDrOLK8Xj8obL3TVUtTrYOopLoWMW03x8/mrcw6l5jjZrix+fRbUyPP5bGNdz4/rF5
	YYJuI5yv9qGg5brxN17stRath0/64etuQhAMVNQ8luw2+zcjUPXtXHV7T6ITU6i9Xvxj8Wpi1st
	2vyHemrG0o5oRWZdbu/M9DX/m4ca5bCNpZl86M7aneLqgzeDDjSbuKjv48ReWEkr7uGFkGdKo1F
	pt6g52XNjNW9dqbGZ5Zwu4Tzjb/IPJ8xGDgpykxj//Q5Fw==
X-Google-Smtp-Source: AGHT+IFHWiPN9NJQXmz8mz8eW31B79aaS2HdAmUHQoCxpDRyUvLyVYjjn/xN764VnRM5xlE+XH04fQ==
X-Received: by 2002:a05:600c:1e18:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-4406ab7ab1emr184157185e9.3.1745396492037;
        Wed, 23 Apr 2025 01:21:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:21:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aAijCvHMhGKYeSu9@macbook.lan>
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
 <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
 <aAErECZ1Ys-Nufon@macbook.lan>
 <32297a1f-418f-403b-9529-e9f2620e1279@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32297a1f-418f-403b-9529-e9f2620e1279@suse.com>

On Tue, Apr 22, 2025 at 08:46:13AM +0200, Jan Beulich wrote:
> On 17.04.2025 18:23, Roger Pau Monné wrote:
> > On Thu, Apr 17, 2025 at 05:38:54PM +0200, Jan Beulich wrote:
> >> On 17.04.2025 17:25, Roger Pau Monne wrote:
> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/hvm/mmio.c
> >>> @@ -0,0 +1,125 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * MMIO related routines.
> >>> + *
> >>> + * Copyright (c) 2025 Cloud Software Group
> >>> + */
> >>> +
> >>> +#include <xen/io.h>
> >>> +#include <xen/mm.h>
> >>> +
> >>> +#include <asm/p2m.h>
> >>> +
> >>> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> >>> +{
> >>> +    p2m_type_t t;
> >>> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> >>> +
> >>> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> >>> +           subpage_mmio_find_page(mfn);
> >>> +}
> >>> +
> >>> +/*
> >>> + * The guest has read access to those regions, and consequently read accesses
> >>> + * shouldn't fault.  However read-modify-write operations may take this path,
> >>> + * so handling of reads is necessary.
> >>> + */
> >>> +static int cf_check subpage_mmio_read(
> >>> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> >>> +{
> >>> +    struct domain *d = v->domain;
> >>> +    unsigned long gfn = PFN_DOWN(addr);
> >>> +    p2m_type_t t;
> >>> +    mfn_t mfn;
> >>> +    struct subpage_ro_range *entry;
> >>> +    volatile void __iomem *mem;
> >>> +
> >>> +    *data = ~0UL;
> >>> +
> >>> +    if ( !IS_ALIGNED(len | addr, len) )
> >>
> >> What's the point of doing the | ? len can't be misaligned with itself?
> > 
> > Hm, it's the same form that's used in mmio_ro_emulated_write(), I
> > assumed it was to catch illegal access lengths, like 3.
> 
> Oh, I see. But that's not using IS_ALIGNED(), and imo validly so, despite the
> apparent open-coding. IS_ALIGNED() requires the 2nd argument to be a power of
> two. The combined check there is folding the power-of-2 one with the is-
> aligned one.

Do you think it's worth keeping those checks then?  I could do:

if ( len & (len - 1) || len > 8 || !IS_ALIGNED(addr, len) )

As a possibly more complete and easier to parse check?

Thanks, Roger.

