Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE0AD6854
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 08:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012377.1390809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbsJ-0003t3-5j; Thu, 12 Jun 2025 06:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012377.1390809; Thu, 12 Jun 2025 06:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbsJ-0003qw-2E; Thu, 12 Jun 2025 06:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1012377;
 Thu, 12 Jun 2025 06:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPbsH-0003qq-HJ
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 06:57:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c30ff73-475a-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 08:57:20 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so318130f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 23:57:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e172b03sm10812955e9.36.2025.06.11.23.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 23:57:19 -0700 (PDT)
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
X-Inumbo-ID: 7c30ff73-475a-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749711440; x=1750316240; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55o822H8e2PldMgk8POtsqloOM8M58Ext2aqbafU+dE=;
        b=LbQ+Z7Nqv7k0DfgMgmu8rKnjSahmQtwQCkiTodGGDXgTYjBNPj7fWJuK8IgdQmqvdt
         DMdBa5E6nUDMs3O2Bn3LzmNMP1j7JddRyBUufSgz+QX8XTTZEuJvfXfhbsvosUE1UEa+
         x761f3ykhMMS4RrQcksEmc/Aidrn2pymZP7X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711440; x=1750316240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55o822H8e2PldMgk8POtsqloOM8M58Ext2aqbafU+dE=;
        b=jU89ETceyEs/2FzSs1X/bgsMXZgocGO1Ns53TsBB4mo+8/Tc6Rv1njrm1/o7DMV2/n
         GJGRhiT5Z/GUxa83ooy7RKyKfhqdlJ3fDK6kIG0RrzN/sZNV29NRDBVu5QdehlIq9OWf
         J+ocOEKWY0nvWV6fSd/2vqikVrtLvZ60qPoj2W6smEalyaaV4vis+EZFfxCQVooBQN2N
         QFH9LJRtl0RzdrFeJn5REJrxIc2mFiaHmZuhfgzwp7lyXF09/LQ7erva4QMABBbwAQwX
         QNuCdwlsp5ASyFoil7MUbCrp6IWlu7A8jASKR/lWECnZSvnCDNXHqQIRIZCnDfNOVulj
         uiZQ==
X-Gm-Message-State: AOJu0Yz9srNZhOGPaIOx4XpisFkkW3HNp8ec9iH4zKHr9aJgxOjZ0Os1
	VlKKUVWYPr3ARzsL+baBnv3QmDT64T2MDDLOKckedKKz4Pw4mE828sTc4qR3mrmffRA=
X-Gm-Gg: ASbGncsnnWz3bX0QAXeJiitl30u7LSAENfBteovt3pkm8bLGa5o45CJeWADpnWdZk0f
	PIcIPj3NwBlBv+fDITYkWaGJOoA6onjB0/F3SqSiMxJ0RunJMeJ74Rt5Ug8svLW7DVa/ubADq5x
	AeaDC1czYLde6l4SclLhJTSlwfezJDx4j0xEGMX+nEr4KJnghNqBjcyGUvq9GL5L8WufxhgzunN
	dd/2G4zG73AVkM9HoVsvHDhqwbjtulxMw0Rx2ZNP7t3O9g+9iWm5y2Sx/96KlzRvA+9rVbI0mL6
	5tQ/zQMMArpKb0AwyHngZ1jUYXUmg56TVI3XZns9BnQTjyjrj6Pse/8Z/X2Gfa5U5zygTxWtfab
	U4K46pfXg/yVgMKrWrPaK1WFofFNMG4bMX70=
X-Google-Smtp-Source: AGHT+IH6KxSbGu7iPPUZlR8DT419YjztuQPT/Aznzs+FBEBKbb3cKfsD41jtpatF8nrJpwifpnwxMg==
X-Received: by 2002:a5d:64e3:0:b0:3a5:1220:36d4 with SMTP id ffacd0b85a97d-3a560814c09mr1799097f8f.22.1749711439872;
        Wed, 11 Jun 2025 23:57:19 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:57:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
Message-ID: <aEp6TveXYxHXFgnF@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-2-roger.pau@citrix.com>
 <b78a4877-353d-4320-95a2-f3cefa018a61@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b78a4877-353d-4320-95a2-f3cefa018a61@citrix.com>

On Wed, Jun 11, 2025 at 06:58:31PM +0100, Andrew Cooper wrote:
> On 11/06/2025 6:16 pm, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 7536b6c8717e..2f438ce367cf 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -461,30 +461,6 @@ void domain_cpu_policy_changed(struct domain *d)
> >      }
> >  }
> >  
> > -#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
> > -/*
> > - * The hole may be at or above the 44-bit boundary, so we need to determine
> > - * the total bit count until reaching 32 significant (not squashed out) bits
> > - * in PFN representations.
> > - * Note that the way "bits" gets initialized/updated/bounds-checked guarantees
> > - * that the function will never return zero, and hence will never be called
> > - * more than once (which is important due to it being deliberately placed in
> > - * .init.text).
> > - */
> > -static unsigned int __init noinline _domain_struct_bits(void)
> > -{
> > -    unsigned int bits = 32 + PAGE_SHIFT;
> > -    unsigned int sig = hweight32(~pfn_hole_mask);
> > -    unsigned int mask = pfn_hole_mask >> 32;
> > -
> > -    for ( ; bits < BITS_PER_LONG && sig < 32; ++bits, mask >>= 1 )
> > -        if ( !(mask & 1) )
> > -            ++sig;
> > -
> > -    return bits;
> > -}
> > -#endif
> > -
> 
> I'm very happy to see this disappear.  Both because of a non-__init
> function calling an __init function, and because this internal is just
> horrible.
> 
> >  struct domain *alloc_domain_struct(void)
> >  {
> >      struct domain *d;
> > @@ -498,14 +474,15 @@ struct domain *alloc_domain_struct(void)
> >       * On systems with CONFIG_BIGMEM there's no packing, and so there's no
> >       * such restriction.
> >       */
> > -#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
> > -    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
> > -                                                          32 + PAGE_SHIFT;
> > +#if defined(CONFIG_BIGMEM)
> > +    const unsigned int bits = 0;
> >  #else
> > -    static unsigned int __read_mostly bits;
> > +    static unsigned int __ro_after_init bits;
> >  
> >      if ( unlikely(!bits) )
> > -         bits = _domain_struct_bits();
> > +         bits = flsl(pfn_to_paddr(pdx_to_pfn(
> > +             1UL << (sizeof(((struct page_info *)NULL)->v.inuse._domain) * 8))))
> > +             - 1;
> 
> I think this would benefit greatly by not being a oneliner.  There's
> sizeof_field() which helps a little.

Oh, I missed that.  I was expecting to find something like
member_size() or similar.

> But, isn't this UB with CONFIG_BIGMEM?  You're shifting 1UL by 64.

CONFIG_BIGMEM doesn't get here (see the #fidef above).

> When __pdx_t is unsigned long, there's no bits restriction necessary. 
> Therefore, don't you want !bits && sizeof_field(...) < BYTES_PER_LONG as
> the entry criteria?

__pdx_t being unsigned long can only happen for CONFIG_BIGMEM, and
that's still handled separately using a #if defined(CONFIG_BIGMEM) ...
(which I should have converted to #ifdef instead).

Thanks, Roger.

