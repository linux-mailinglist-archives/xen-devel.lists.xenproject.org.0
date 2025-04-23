Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD984A9842E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964210.1355063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VqB-0001eS-Rb; Wed, 23 Apr 2025 08:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964210.1355063; Wed, 23 Apr 2025 08:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VqB-0001d1-Oj; Wed, 23 Apr 2025 08:52:23 +0000
Received: by outflank-mailman (input) for mailman id 964210;
 Wed, 23 Apr 2025 08:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7VqA-0001cu-St
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:52:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 445c8d88-2020-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:52:20 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so45300005e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:52:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa4a4c0fsm17928147f8f.88.2025.04.23.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 01:52:19 -0700 (PDT)
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
X-Inumbo-ID: 445c8d88-2020-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745398340; x=1746003140; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8p8OYh48a16Y97SdJ+FIk2IEWJmWKw041ht74MhX+tw=;
        b=vkpjhmJLz1eEgzO3lrgkNpg9qJELLz6qUv6r+/fJgFBybbqbe1S6vWTnCDkAYaP9LT
         s9PoTkn3roZJbvoXNtSr4PVy+Y06DFKIlDh0yv2zxPzXq+W7RTQfcj/ULyEcjfzpG7u0
         XUKZpn+xcmet8qhGOPnA0/btC+fT079tMmzgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398340; x=1746003140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p8OYh48a16Y97SdJ+FIk2IEWJmWKw041ht74MhX+tw=;
        b=Mq9egyQ8+daNDYogAxkVnIAs9EzYv+oNYSaq/mKLk9xHrrxP+TszvvFstC98WL1G7i
         tFY9w1tr9Szh0d5k907jft7v1M4XgA5jh+MeF9zilgW5ZsET9MlS1yIMU7hG1Lb9HKlB
         UAwybdvFKhrVEecoSynXIFMPif3og+DZXWGwgXM8X5e8+2vvYIhlG+G6nQ+TplQiZimB
         57sNXzIjEBelLrzqTcveS6jNNyhB0FXZsJAj6+ysBI+cEvTUOqhAIUz+I+xTj1A7nTCu
         fvfM9+gFTGEd+xB6v5MhK0bLWVw3R5CvELBgghn6JzuBZ1FaLSyIBAhivB4bA75tUU09
         LrMg==
X-Forwarded-Encrypted: i=1; AJvYcCXwEQSv9skzKrGOIgCYY6M2a5F6YbEkZuEeXVs6Hn0EMsRbZ0XT3z/rIu1fU7EYwdNUpqArzltz4bY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2ZhcQ5gVKEe9EdMsqIY8qx8JQsTdp+S+xFXCK5kgJOVMPpESa
	xpYFejbQc5zi8NEE+O8TK6n8EmtM0uZkLzJFXPpiNpXkIUsK9Nsn+AMa2hzFolQ=
X-Gm-Gg: ASbGnctYu0otdOGYhcfoG+m0SompXiy+J0Ge1vSgDTkWQxTdNPkrWrpdovrkhs2mtPY
	RtdLy5A8clkRcQhSFac0h4CIvknq4OIidod78txZEWu0IBzvNw+JG6UFmK+eMgCVVekJzpgGd9V
	K2kJSTMVUYXNCGq36oVo3STqn0sadxX34+rvXm9mtWCdC6SIDkglMRpekKK0PUkBV+efWlSvFHD
	0gy3b/XdAub/GbrC49cGbf0q014LCEk8OGDa3W4ZgeVph6Mbp/ParrZpmcCw9s3KLI90ZmYG0xZ
	qaNren+haUuS/kUl6dqUCDfVHKfEJmFw3/vrzEYPsLKojQ==
X-Google-Smtp-Source: AGHT+IEG7xl9pQzG2YP3gKHodGQVnlDH5X8vQFYlIAnQpUY7bB7mChVZEVxdy5t1eQsaLmcEKnooHQ==
X-Received: by 2002:a05:600c:1e8f:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-4406ab9426cmr206007195e9.10.1745398340130;
        Wed, 23 Apr 2025 01:52:20 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:52:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aAiqQnRXrXQAX1Vl@macbook.lan>
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
 <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
 <aAErECZ1Ys-Nufon@macbook.lan>
 <32297a1f-418f-403b-9529-e9f2620e1279@suse.com>
 <aAijCvHMhGKYeSu9@macbook.lan>
 <b63ff1ca-2752-44fe-8a32-0a721eec1abb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b63ff1ca-2752-44fe-8a32-0a721eec1abb@suse.com>

On Wed, Apr 23, 2025 at 10:32:33AM +0200, Jan Beulich wrote:
> On 23.04.2025 10:21, Roger Pau Monné wrote:
> > On Tue, Apr 22, 2025 at 08:46:13AM +0200, Jan Beulich wrote:
> >> On 17.04.2025 18:23, Roger Pau Monné wrote:
> >>> On Thu, Apr 17, 2025 at 05:38:54PM +0200, Jan Beulich wrote:
> >>>> On 17.04.2025 17:25, Roger Pau Monne wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/xen/arch/x86/hvm/mmio.c
> >>>>> @@ -0,0 +1,125 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +/*
> >>>>> + * MMIO related routines.
> >>>>> + *
> >>>>> + * Copyright (c) 2025 Cloud Software Group
> >>>>> + */
> >>>>> +
> >>>>> +#include <xen/io.h>
> >>>>> +#include <xen/mm.h>
> >>>>> +
> >>>>> +#include <asm/p2m.h>
> >>>>> +
> >>>>> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> >>>>> +{
> >>>>> +    p2m_type_t t;
> >>>>> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> >>>>> +
> >>>>> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> >>>>> +           subpage_mmio_find_page(mfn);
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * The guest has read access to those regions, and consequently read accesses
> >>>>> + * shouldn't fault.  However read-modify-write operations may take this path,
> >>>>> + * so handling of reads is necessary.
> >>>>> + */
> >>>>> +static int cf_check subpage_mmio_read(
> >>>>> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> >>>>> +{
> >>>>> +    struct domain *d = v->domain;
> >>>>> +    unsigned long gfn = PFN_DOWN(addr);
> >>>>> +    p2m_type_t t;
> >>>>> +    mfn_t mfn;
> >>>>> +    struct subpage_ro_range *entry;
> >>>>> +    volatile void __iomem *mem;
> >>>>> +
> >>>>> +    *data = ~0UL;
> >>>>> +
> >>>>> +    if ( !IS_ALIGNED(len | addr, len) )
> >>>>
> >>>> What's the point of doing the | ? len can't be misaligned with itself?
> >>>
> >>> Hm, it's the same form that's used in mmio_ro_emulated_write(), I
> >>> assumed it was to catch illegal access lengths, like 3.
> >>
> >> Oh, I see. But that's not using IS_ALIGNED(), and imo validly so, despite the
> >> apparent open-coding. IS_ALIGNED() requires the 2nd argument to be a power of
> >> two. The combined check there is folding the power-of-2 one with the is-
> >> aligned one.
> > 
> > Do you think it's worth keeping those checks then?
> 
> Yes, I think we should be as strict as possible in what we (try to) emulate.
> 
> >  I could do:
> > 
> > if ( len & (len - 1) || len > 8 || !IS_ALIGNED(addr, len) )
> > 
> > As a possibly more complete and easier to parse check?
> 
> If you dislike the form mmio_ro_emulated_write() uses, sure. However, you
> will want to check len to be non-zero, while I'm unsure you need to check
> len > 8 - mmio_ro_emulated_write() doesn't have such. Albeit - perhaps
> wrongly so; we'd end at the ASSERT_UNREACHABLE() in
> subpage_mmio_write_emulate() if a wider store was used. I guess I ought to
> make a patch there, and you want to keep the "len > 8".

OK, let me send v4 with those adjustments then.

Thanks, Roger.

