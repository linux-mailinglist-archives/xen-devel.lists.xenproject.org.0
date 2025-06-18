Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8060ADEEE5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019195.1396002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtVv-0004gN-GB; Wed, 18 Jun 2025 14:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019195.1396002; Wed, 18 Jun 2025 14:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtVv-0004dr-D1; Wed, 18 Jun 2025 14:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1019195;
 Wed, 18 Jun 2025 14:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKfJ=ZB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRtVt-0004dD-CT
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:11:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f198846-4c4e-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:11:26 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45347d6cba3so11280055e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:11:26 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568b2371bsm17158389f8f.70.2025.06.18.07.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:11:23 -0700 (PDT)
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
X-Inumbo-ID: 1f198846-4c4e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750255886; x=1750860686; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+D/J9O1NLio4YTbb/PkzggLIEPFuRsZgdPFbHBAqYc=;
        b=wKeTx0J4VvK2cm6ACNeGOu/s07ViRxCe/QpUXAd6tS784O2toQbPQwjxBtFS84/neE
         0adYWOccYNW+oTMQDFy1RNlk0z1o1U/HJjAuW23S3OcX+O5/0lKV5vq1TbonjU5KzNjc
         YzJB1gJirEgMpKQnQhPi0seLZAasZpyX/mpcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255886; x=1750860686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+D/J9O1NLio4YTbb/PkzggLIEPFuRsZgdPFbHBAqYc=;
        b=FO8N6wnSybpHD9HKUQTkj+VJPE/irUKWmangSeoVHTVWYqUxuEukCPp7ZgOUlFcWlq
         cElcibyJ4xqIFtn8qY1PJFIjwh0S0uKnwPgtiKfzghistSWzDM1QVDMcBjddRtpZj5Qb
         jm49x3mRd3+tjm2jcJuP12LPlAMPPuvhUXFZTVWVI3c5W/86S2sn+v+/GWCSb4jUHyVm
         P0MvC7tqBa8+Y3oWsm37cNgw7p7HkA7/fX+ZAIgvyndI9rO4s9ifIiwWg/WxPPh5PSuq
         9GkXzfk92kMVL6tUgY1FrQ3iLcLIJ984x4fZNAzXHgJedY4LA8LzUW/fyi4JrM5uP1pO
         FGCw==
X-Forwarded-Encrypted: i=1; AJvYcCVwspgDgpS8whPfnifd8neJfNk0zBQVAcXxV2LCG+CeaxdK0RSM87zC2SmyjL5c/uGLDP48RjtN7NI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkryiz2v/Fxo+wAWY5axHVKllcxvJC49HZfGoF4MGLMXavUXP4
	JIUC2Ol3lI8VfYw+2rrK89ac5zr09XNbIoG5S22V5J8lLmx93iCo4DawcBP0aUi8MqM=
X-Gm-Gg: ASbGnctHh3RRw4gCz7C9I5p/xw9253p6tklQMnUqAMD5rGFyzLdrVeGyeWjHwtB0dhe
	MFflsH/eyTbTYEqDqRmwzC3TqHQlzZ0H5cURvZHkTyRcDnnQQr89jMEi95aMh+WeFPhwJoyGJ1D
	jsZn68RjFm4sOqf06DWkAc+bLwqjTbKLHFO96QKck5KaCmmvE6/K1l2CbDgtBCkB2WWKLtMwR6u
	/BDlxfzoS6tARqGmx4xn219l9HahIP/HzExLNuD5KdnhBwYr21kbp/cOjDIDEgR8hxqmec0/CpZ
	sx4+HQf2NgpqKOKNScNIqyg7tf8nnluMQC/uU7FiGMSLQ9cvAVJd4bDMXYW4N9HR6rixK/icUoa
	HDjFgfyu1I1Q7+vYyt4JKqAxV8UBq3vCZYs/jWy+PglAg4A==
X-Google-Smtp-Source: AGHT+IGTgMdhwjTWJh/W9J/dOM7d5EylSk5h5aRCf6iM6ib8VKtoeSAirUu9qX3Mf0Zz0qYBP6h1JQ==
X-Received: by 2002:a05:600c:4f43:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-453514a1e54mr74522565e9.22.1750255884049;
        Wed, 18 Jun 2025 07:11:24 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:11:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
Message-ID: <aFLJCnJjQYrH1iWv@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
 <4e8efcc9-9721-450b-b27c-2caac4aedfb7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e8efcc9-9721-450b-b27c-2caac4aedfb7@suse.com>

On Wed, Jun 18, 2025 at 03:02:34PM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > With the appearance of Intel Sierra Forest and Granite Rapids it's not
> > possible to get a production x86 host wit the following memory map:
> > 
> > SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> > SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> > SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> > SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> > SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
> 
> Looks like these aren't the numbers that the test harness uses. The main
> properties (relevant for the algorithms) look to be the same, though.

Yeah, seems like the report we got has two different memory setups,
one with 1TB, and one with 2TB of total RAM.  The layout however
(offsets) are the same.

> > ---
> > We can discuss whether we want both the fast and the slow variants.  The
> > slow (brute force) was added as a result of me playing with weird region
> > layouts where the fast one didn't manage to compress, or the resulting
> > coefficients had a poor compression ratio.  However at this point the
> > slow variant has only proven helpful in synthetic cases, I haven't (yet?)
> > seen a real host memory layout that would benefit from it.
> 
> I'm not convinced we need the slow variant right away. What exactly (if
> anything) is going to be wanted/needed on future hardware we'll only really
> know when such arrives. However, see also my comment on xen/pdx.h.

I've implemented the lookup table as you suggested, and I think that's
more efficient than the current div plus mod.  With the lookup table
implementation there's no longer a fast vs slow variants.

> > @@ -297,7 +309,223 @@ void __init pfn_pdx_compression_reset(void)
> >      pfn_pdx_hole_shift = 0;
> >  }
> >  
> > -#endif /* CONFIG_PDX_COMPRESSION */
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> > +
> > +unsigned long __ro_after_init pdx_offset = ~0UL;
> > +unsigned long __ro_after_init pdx_size = ~0UL;
> > +
> > +static unsigned long __initdata top_pfn;
> > +
> > +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> > +{
> > +    return !pdx_size ? true
> > +                     : (PFN_DOWN(base) % pdx_offset) + npages <= pdx_size;
> > +}
> > +
> > +STATIC bool __init pfn_offset_calculate_fast(unsigned long base)
> > +{
> > +    unsigned long size = max((1UL << MAX_ORDER), base);
> 
> Since pfn_pdx_compression_setup(), where "base" originally comes from, has no
> caller (yet), it's hard to follow what "base" is and why it would affect "size".

pfn_pdx_compression_setup() has existing callers from patch 4: "pdx:
provide a unified set of unit functions".

> > +    unsigned long offset = ~0UL;
> > +    unsigned int i;
> > +
> > +    if ( nr <= 1 )
> > +        return false;
> > +
> > +    /* Calculate minimal offset between regions. */
> > +    for ( i = 1; i < nr; i++ )
> > +        offset = min(offset, ranges[i].base - ranges[i - 1].base);
> > +
> > +    /* Return early if offset is smaller than the minimum size. */
> > +    if ( size >= offset )
> > +        return false;
> 
> Comment and code are off by one with one another. I actually wonder whether, for
> the scheme to be beneficial, there shouldn't be some threshold below which we
> would also go without doing any compression.

Yeah, I've wondered the same, but I didn't know where to put the
threshold.

> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -65,6 +65,31 @@
> >   * This scheme also holds for multiple regions, where HHHHHHH acts as
> >   * the region identifier and LLLLLL fully contains the span of every
> >   * region involved.
> > + *
> > + * ## PDX offset compression
> > + *
> > + * Alternative compression mechanism that relies on RAM ranges having a similar
> > + * size and offset between them:
> > + *
> > + * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
> > + * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
> > + * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
> > + * │<------>│          │
> > + * │  size             │
> > + * │<----------------->│
> > + *         offset
> > + *
> > + * The compression removes the holes between RAM regions:
> > + *
> > + * ┌────────┬────────┐   ┌────────┐
> > + * │ RAM 0  │ RAM 1  │...│ RAM N  │
> > + * ├────────┼────────┘   └────────┘
> > + * │<------>│
> > + *    size
> > + *
> > + * The compressed index is calculated as:
> > + *
> > + * index = (pfn % offset) + ((pfn / offset) * size)
> >   */
> 
> Would be nice imo if the presentation here wouldn't give the impression that
> the offsets are all identical, and hence the compressed map ends up being
> entirely without holes.

OK, I've made this too nice I guess.

> In fact I can't help the impression that with enough
> nodes (but otherwise the same properties, i.e. only node 0 being special) at
> least the "fast" calculation will fail. Which in turn would be an argument
> to keep the "slow" one.

It depends.  Fast calculation assumes the minimal offset and then just
adjusts the size.  If the offset is not the same between ranges this
leads to size being expanded to ensure the selected offset works with
all ranges.  If there are enough nodes, and spread enough it's
possible for the algorithm to converge in offset == size.

> In fact, the alternative approach we discussed - avoiding division, but
> using a table of offsets - would seem to avoid such a weakness, because the
> offsets can then vary (to some degree; it still needs to be possible to
> easily determine the table indexes).

Yeah, that's what I'm preparing to send.

Thanks, Roger.

