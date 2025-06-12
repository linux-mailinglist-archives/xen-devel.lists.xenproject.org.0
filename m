Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A327CAD6E29
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012804.1391317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfSE-0004lM-Ke; Thu, 12 Jun 2025 10:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012804.1391317; Thu, 12 Jun 2025 10:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfSE-0004id-Gt; Thu, 12 Jun 2025 10:46:42 +0000
Received: by outflank-mailman (input) for mailman id 1012804;
 Thu, 12 Jun 2025 10:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPfSD-0004iX-H1
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:46:41 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 850b54c1-477a-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 12:46:39 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cea01b9cso3735285e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:46:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e241b70sm16394115e9.18.2025.06.12.03.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:46:38 -0700 (PDT)
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
X-Inumbo-ID: 850b54c1-477a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749725199; x=1750329999; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sy0YOumkYq3+7URylCUGUpdoND9CFrD93Btzp8FuStE=;
        b=cedCOZmknPIY9EpPhLpB4zJnKSpPPVxZ6EK03yO9l++gbiPkdYyjapA2tYALTriwSQ
         rYBp0lyDKZOWVPkc+nAaOHK/pF57VEyEaodCmmRxtWcstvphDT1t2MYDDcgeV6gplPh/
         PoKd4RcvVYhbHIJoMyamekX4M/b41veWd4ce8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725199; x=1750329999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy0YOumkYq3+7URylCUGUpdoND9CFrD93Btzp8FuStE=;
        b=VYhcf5udWxCLlgqKrzGEjxTdAPkOd3BKLc6rrEFWpi50OT/umWT6W8is6vUTIetzuL
         3N4nD9QgW+28VK/3+/uyZbpJuTIJ/h0FzP4yVU91Lu6onK9xcC8pjjHmRmgFjKXVzrKL
         wGZXt2uaGCJ9W3Qgx4ElgJu4gmquuPxp0nn4hwkEA4aNH8PxCFq7SjSGdWN6gsJzuPMW
         Un2vA/pyw85FhB116GClkzfS7PKbHLAiA4ocDt2h9zCEwe6hsdGWu9uL/Imt7vQ1myXP
         omK+NdyxVrQamhxUIjimT81J6utJLdHlMTd/CB5i//aJvQpw823Fykf9W8fOY1OZoLTt
         YaKw==
X-Forwarded-Encrypted: i=1; AJvYcCV19wbJ5lkyxxR5RslYZaX3kA/PCssyi5gWMXNBYlACifu4vAUdYH58kfZx8wnI+Sxc3x8gVpZRBiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAjIycf5ppuH8CdFvF3W61Pcrv+LDS8LLpOWq31KkuXwlufM9l
	SIMOXLBJcCk3lXmYdztYhpGJdesls2TKuVFnhle1YFU6XXh5EJoXZOS/CtI1MtAbUQA=
X-Gm-Gg: ASbGncvJ3npc4I/EIEt56ZdWB6xLhE1aJ/WI4AZKNGBoiu1D1rmpr0tVqWxnPxtwkyu
	AY1Y3ysm6ayE1vG8ZGvwCMNAeDR/T19h5Y2V0PSYlQdqXi9oz7xdoDckYLGK/HcupvgMpkkCrQq
	b+WztzCY9Yw3c2O+UUR5l0U1padDvPch+WV4fUp1MY+h9DZInPFZeARkpu7yCkXctG2O3YgN1ri
	t1JT4coDXhK55uMnAiDcRAHc+htmNdb2mZ5BYcV/Xhkyd5LUQLgi65Pku5WbbAVmYBV2iK0FEg4
	p+euWIFWAg4zwQRsD1uKXMUkHKfsDG33nzHfF2HmNROfScbA/jrZu7qVFzA6GWoGq4Bh56f5jsV
	Mp+FUpG3mAMvse48nsIkXN0Nh36Z41Q==
X-Google-Smtp-Source: AGHT+IEfPIBSnzzhzGh6QQjw7WzC1343Pnn7hF1G2RxoncUJcV6wDw0KsDtDbPLjLXBmh4wcDSHFAA==
X-Received: by 2002:a05:600c:3487:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-4532b8c566fmr32105185e9.2.1749725198674;
        Thu, 12 Jun 2025 03:46:38 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:46:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
Message-ID: <aEqwDZc8u8FFW2Al@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-2-roger.pau@citrix.com>
 <6abadf32-836f-45fb-bb3a-3afdf97e157b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6abadf32-836f-45fb-bb3a-3afdf97e157b@suse.com>

On Thu, Jun 12, 2025 at 11:03:21AM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
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
> While Andrew did point you at sizeof_field(), we can have this even less verbose
> by utilizing that frame_table is of the right type and (almost) globally in scope.
> 
> Further, why use pfn_to_paddr()?
> 
>          bits = flsl(pdx_to_pfn(1UL << 
>                                 (sizeof(frame_table->v.inuse._domain) * 8))) +
>                 PAGE_SHIFT - 1;

I've introduced and used pdx_to_paddr(), which I think it's more
natural.  We already had a paddr_to_pdx() which was missing it's
bidirectional equivalent.  It's now:

         bits = flsl(pdx_to_paddr(1UL << (sizeof_field(struct page_info,
                                                       v.inuse._domain) * 8)))
                - 1;

> However, it further feels like this was off by one; we had similar issues over
> time in several places. There potentially being a gap between one less than
> the PDX used here and that very PDX, don't we need to calculate based on the
> "one less" value here? Hmm, there being a gap means no allocation would
> succeed for the precise value of "bits" (in the mask-compression scheme), so
> functionally all would be fine. Yet just to avoid setting a bad precedent I
> think we'd still be better off using
> 
>          bits = flsl(pdx_to_pfn((1UL << 
>                                  (sizeof(frame_table->v.inuse._domain) * 8)) -
>                                 1)) + PAGE_SHIFT;
> 
> If one would log the value of bits, the result would then also be less
> confusing in (at least) the mask-compression scheme.


Is the above correct tough?

Take for example the hypothetical case where pdx_to_pfn() returns
0x10.  Then flsl() will return 5 (let's leave the PAGE_SHIFT
adjustment out for the example here).  The allocation bit width would
be off-by-one, because allocating using a bit width of 5 would also
allow 0x11 to be allocated, and that won't be correct.

I think we need to get the bit width of the next pdx (so the
non-inclusive end of the range), and then subtract 1 from it,
otherwise the allocation bit width is possibly off-by-one.

Thanks, Roger.

