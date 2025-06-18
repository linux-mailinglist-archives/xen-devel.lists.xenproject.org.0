Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8000ADF08C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019258.1396072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuG9-0005Qc-8m; Wed, 18 Jun 2025 14:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019258.1396072; Wed, 18 Jun 2025 14:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuG9-0005Nw-5l; Wed, 18 Jun 2025 14:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1019258;
 Wed, 18 Jun 2025 14:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKfJ=ZB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRuG7-0005Nq-SM
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:59:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3af2549-4c54-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 16:59:26 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453066fad06so53074845e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:59:26 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568b5bfefsm16769594f8f.88.2025.06.18.07.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:59:25 -0700 (PDT)
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
X-Inumbo-ID: d3af2549-4c54-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750258765; x=1750863565; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUUuLeD/LYD1sOTdKCCCdJ/rDAMK4SysP+rz+njoEgo=;
        b=uLwgQ/oKjIkJ4g+7b7M1Ug1BKmSagVymHztZR1WgG+6S6WjUsNaHyW7PMnMTZj+12f
         Xux5GvhlaIGfFRve9w1P8FBSTbAWHDjr2yRFZMKbrngTO8cQ1OO1HBseWYxslMd+RtPm
         u7LS0F54TwIMs0AZhju4VgzsX6vkjrAIx+d8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258765; x=1750863565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUUuLeD/LYD1sOTdKCCCdJ/rDAMK4SysP+rz+njoEgo=;
        b=hejgsvzsEQBly0SET3FPpjwbpIZX3cSgjTWaYobZgCGIhjvcLubkGQbJqOJ2LUGBDC
         MHlqthgh6FKtuLiZ8+37qsHn+s8mHt3GTtLQE/HSYZpkoefEOYgK7bmqv0BOvTRynU4D
         9yz/UwSDdypTbWpRl/CE9hORa5KuWUO+5xHjawUFf0epVYWLeYvKfXFefy7aq8s7yMO5
         utu6JoA4DZg4vCQfSF4qhQWLHUazsd6PtsmDySryYlVMOcB02FxlWN7gQyAUoAFGPj2L
         mbZrn/8sC38wGLuDRP6CB+bYELq1/vj3OtKfOjB5p0WquFFs9ct9Dv8uearDvmp5KSMj
         LRcg==
X-Gm-Message-State: AOJu0YxdIQVrkvX1LddkKQIFRRKCafCgJfYMQgYM9AFzC2Fnjj66ycVq
	GxBPh78+Hwq2t0ZgVyEHPOfFcTnUwXec8yz2KkT13F5DfvecYvmnmMBtlti/XSRG7M8=
X-Gm-Gg: ASbGncvvP6TyuQkbJp8cn7Jd1g5ncDDmnLHHQ5v/SfFYiwV60NqZAdHTbiCVVrdSz1g
	kqCiuEg/VZE0ttuCQgkuMJY8UUT2KnC18gnhxZm4MJukAIGL5prQREWcEXguNPjxVmoyl/mcDcR
	RC9eCGTA+tS0E7BSnki9tHlDe3J2b2++C3vVyLqxiCLp+I3bLE1LiUM02fSye4RIGmQNVeBrRmH
	HRg3Cxp7t4/81Wr6Vi0rbU2faER85ZjcMVgMO7BqDKhTvl8Ja5MSf9Tk7TZ8w3weUmySrIzYgM2
	rV/e4QSk6iFJEHlHcCQ79/Pw1AlSnaS3BFvvdn425Rh4V+PeQ/UZ2yUH6l5RofAybgBDdLb4cdc
	jpV2noQUezx7EBY4rH3WGsJJO9K6+V3IIU3I=
X-Google-Smtp-Source: AGHT+IHwDHgs/oxf0e8JR2hDlOXlXPSseXbZfiCiPJ07bxW4sz7ZF0cAlyLSBFD32UR0LJWOXJYTqA==
X-Received: by 2002:a05:6000:480b:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3a57237e13bmr14574174f8f.22.1750258765541;
        Wed, 18 Jun 2025 07:59:25 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:59:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
Message-ID: <aFLUTPNt1_DbPNTD@macbook.local>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
 <2969b5d8-5879-4674-8332-046898e17257@suse.com>
 <aFA7OiV8AX-ua-W_@macbook.local>
 <a56574c0-6744-4249-9410-60858f49d04c@suse.com>
 <aFBTA3wklAejAUPT@macbook.local>
 <8f3f8815-a60d-4c8b-af2b-fc8ed5f9ba32@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f3f8815-a60d-4c8b-af2b-fc8ed5f9ba32@suse.com>

On Wed, Jun 18, 2025 at 02:04:12PM +0200, Jan Beulich wrote:
> On 16.06.2025 19:23, Roger Pau Monné wrote:
> > On Mon, Jun 16, 2025 at 06:02:07PM +0200, Jan Beulich wrote:
> >> On 16.06.2025 17:41, Roger Pau Monné wrote:
> >>> On Mon, Jun 16, 2025 at 05:20:45PM +0200, Jan Beulich wrote:
> >>>> On 16.06.2025 16:46, Roger Pau Monné wrote:
> >>>>> One question I have though, on systems with a low amount of memory
> >>>>> (let's say 8GB), does this lead to an increase in domain construction
> >>>>> time due to having to fallback to order 0 allocations when running out
> >>>>> of non-DMA memory?
> >>>>
> >>>> It'll likely be slower, yes, but I can't guesstimate by how much.
> >>>
> >>> Should there be some way to control this behavior then?  I'm mostly
> >>> thinking about client systems like Qubes where memory is likely
> >>> limited, and the extra slowness to create VMs could become
> >>> noticeable?
> >>
> >> What kind of control would you be thinking of here? Yet another command
> >> line option?
> > 
> > I guess that would be enough.  I think we need a way to resort to the
> > previous behavior if required,
> 
> Thinking about it, there already is "dma_bits=". Simply setting this low
> enough would have largely the same effect as yet another new command line
> option. Thoughts?
> 
> > and likely a CHANGELOG entry to notice the change.
> 
> Hmm, not sure here. This is too small imo, and really an implementation
> detail.

I think it's possible to have a noticeable effect for some use-cases,
so it should be listed on CHANGELOG in case users see divergence from
previous Xen versions.  That can given them a hint at what needs
adjusting.

It's not only the possible domain creation overhead: if the guest
being created is HVM with p2m, the resulting p2m will also be
shattered leading to worse guest performance.

> > Overall, would it be possible to only include the flag if we know
> > there's non-DMA memory available to allocate?  Otherwise we are
> > crippling allocation performance when there's only DMA memory left.
> 
> Imo trying to determine this would only make sense if the result can
> then be relied upon. To determine we'd need to obtain the heap lock,
> and we'd need to not drop it until after the allocation(s) were done.
> I think that's far away from being a realistic option.

Couldn't Xen do best effort?

A mismatch won't be fatal anyway.  Error cases: you set MEMF_no_dma and
there's no non-DMA memory to allocate from, in which case it's the
same that's unconditionally done.  Other possible failure is you don't
set non-DMA and there's still non-DMA memory that's not consumed,
which is the current behavior.  IMO it would be safer in terms of
behavior change to do:

if ( a->extent_order && <non-DMA memory available> )
   a->memflags |= MEMF_no_dma;

I think that's likely to be less intrusive and won't lead to system
malfunctions, even if strictly it's (kind of?) a TOCTOU race.

> > That also raises the question whether it's an acceptable trade-off to
> > possibly shatter p2m super pages (that could be used if allocating
> > from the DMA pool) at the expense of not allocating from the DMA pool
> > until there's non-DMA memory left.
> 
> This being an acceptable tradeoff is imo an implicit pre-condition of
> adding such a heuristic. For the system as a whole, exhausting special
> purpose memory is likely worse than some loss of performance. Plus as
> said above, people valuing performance more can reduce the "DMA pool".

That's an acceptable workaround, but it might be helpful to note this
in the commit message, as otherwise it will get lost in xen-devel.

Thanks, Roger.

