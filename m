Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038107650BB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570985.893701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy0Y-0007V8-Qn; Thu, 27 Jul 2023 10:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570985.893701; Thu, 27 Jul 2023 10:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy0Y-0007SZ-O7; Thu, 27 Jul 2023 10:14:10 +0000
Received: by outflank-mailman (input) for mailman id 570985;
 Thu, 27 Jul 2023 10:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lU1s=DN=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qOy0X-0007SQ-E1
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:14:09 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 526b1f3b-2c66-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:14:07 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5221f3affe4so971741a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 03:14:07 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qk29-20020a170906d9dd00b0098e34446464sm594912ejb.25.2023.07.27.03.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:14:06 -0700 (PDT)
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
X-Inumbo-ID: 526b1f3b-2c66-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690452847; x=1691057647;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yhoEl2UxsuhEj718Ec/sLvf/pVoPE/8RHWDMwTl0r0I=;
        b=RcrtIEP8M7xbCqPSdgWPgNnb2YIcKfxh4lFM/EN+Xh5490jP+W6YM01SCrYKIKGbDF
         EJdBFwAGJVrAEc8MQIReyV592JbA+vqql78JYxHtMKwzXb7hbDAKudN21sCRVUIJ2tSd
         pVgc15n5j4gU26Rykvozwlrfd2YFtidrvIXW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690452847; x=1691057647;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhoEl2UxsuhEj718Ec/sLvf/pVoPE/8RHWDMwTl0r0I=;
        b=ak7tBaPKfgMlCCh5nukyJaCD/WgLO3xLjUTsWjrvhzy8u39hS7MfrOwAE6b7vy3j5o
         3ATrDgc5UfIGoXFNRyJ9NgTzXQ9TkAKcr8hLQP3c76aT7afTN1pAE0r9+06dD0OPXuCj
         8fHRGOsU33QxsZMzbVpZK7p74CJYAgfPtqMFcrgCzPfwWtPTHTfOyoHQ/50bhPYullTk
         z4s7gL6ew/tYOrPYc+JwJTAg9nOeQODfGIhd9PDPVPE5JjNo9e9+4rT2ZdhsaEz2iEtL
         PfbfG98S0ufryXVnHbGXExQkDTbOFr74C8Y84jYbJgJQIykGifxzKXpbmK01BPmMDrXm
         z9rg==
X-Gm-Message-State: ABy/qLZ428TH/sGVc1quNbwQhLBGBUBMbIpp6s92bMDRawMGBW6414QT
	DBmgBvUO1enb1FSx6vdC8jUguA==
X-Google-Smtp-Source: APBJJlFfYcxrZ5guFc8s/pNZ4x3IXQOnusARslwkl4dIKtX9TwwZRzuxsOwdNVCZiwElx1jb2999Ew==
X-Received: by 2002:a17:907:b12:b0:973:d076:67ab with SMTP id h18-20020a1709070b1200b00973d07667abmr1355678ejl.42.1690452847230;
        Thu, 27 Jul 2023 03:14:07 -0700 (PDT)
Message-ID: <64c2436e.170a0220.2aacd.218c@mx.google.com>
X-Google-Original-Message-ID: <ZMJDbHlEwvlvzcjU@EMEAENGAAD19049.>
Date: Thu, 27 Jul 2023 11:14:04 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
 <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
 <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
 <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
 <dc76516e-2334-798a-216e-5ad983fea2f9@xen.org>
 <58b1901c-f5ee-8617-a5f8-0666c4ef51e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58b1901c-f5ee-8617-a5f8-0666c4ef51e6@suse.com>

On Tue, Jul 25, 2023 at 04:34:42PM +0200, Jan Beulich wrote:
> On 25.07.2023 16:27, Julien Grall wrote:
> > Hi,
> > 
> > On 25/07/2023 07:51, Jan Beulich wrote:
> >> On 24.07.2023 20:20, Julien Grall wrote:
> >>> On 24/07/2023 13:18, Alejandro Vallejo wrote:
> >>>> On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
> >>>>> Hi Alejandro,
> >>>>>
> >>>>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
> >>>>>> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
> >>>>>
> >>>>> For newer interface, I would rather prefer if we use start + size. It is
> >>>>> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
> >>>>> not) and avoid issue in the case you are trying to handle a region right at
> >>>>> the end of the address space as emfn would be 0 in the non-inclusive case
> >>>>> (not much a concern for MFNs as the last one should be invalid, but it makes
> >>>>> harder to reason).
> >>>> I could agree on this, but every single caller is based on (smfn, emfn),
> >>>> so it needlessly forces every caller to perform conversions where the
> >>>> callee can do it just once.
> >>>
> >>> That's indeed one way to see it. The problem is that...
> >>>
> >>>> That said, I think your point makes sense and
> >>>> it ought to be done. Probably as as part of a bigger refactor where
> >>>> (smfn, emfn)-based functions are turned into (base, len) variants.
> >>>
> >>> ... clean-up tends to be put in the back-burner and we just continue to
> >>> add new use. This makes the task to remove every use a lot more
> >>> difficult. So there is a point when one has to say no more.
> >>>
> >>> Therefore, I would strongly prefer if each callers are doing the
> >>> computation. The rest can be removed leisurely.
> >>>
> >>> Let see what the opinion of the other maintainers.
> >>
> >> I think [a,b] ranges are fine to pass, and may even be preferable over
> >> passing a size. I'm specifically using that term that you also used:
> >> "size" (or "length") is ambiguous when talking about page granular
> >> items - is it in bytes or number of pages?
> > 
> > I was referring to the number of pages. I don't think it make sense to 
> > have it in bytes given the start is a frame.
> > 
> >> Especially in the former
> >> case calculations at the call sites would be quite a bit more cumbersome.
> >> I could agree with (mfn,nr) tuples
> > 
> > Ok. So your objection of my proposal is just about the name, right? If 
> > so, I didn't put too much thought behind the naming when I sent my 
> > original e-mail. I am open to any.
> 
> Something like "nr" would be fine with me, for example.
> 
> > , but as said I think inclusive
> >> ranges are also fine to use (and would be less of a problem at the call
> >> sites here, afaics).
> > 
> > The problem with range is that it can lead to confusion on whether the 
> > end is inclusive or exclusive. We had one bug recently in the Arm PCI 
> > code because of that.
> 
> It's a matter of properly writing it down, I would say.
> 
> > So I would like to get rid of any use of range in new functions.
> 
> Hmm, seems to need further input from other maintainers / committers
> then.
> 
> Jan

From the look of things, I think I'm leaning on the side of Julien. The
ranges are always ambiguous in the absence of a strong code convention, but
it appears to be absent in the codebase. i.e: Are they meant to be
inclusive or exclusive? Traditionally I've seen and used the later more
often for ease of arithmetic, while from your last message you seem to be
mentioning the latter.

If the point is to disambiguate without resorting to conventions then
there's only realistic one option I see. Would refactoring it to
"paddr_t base, size_t npages" satisfy you both? If this is something to be
taken into account for future code we probably want a gitlab ticket to
refactor everything else to (base,[npages|noctets]) too. e.g:
XENPF_mem_hotadd uses the [spfn, epfn) convention, and so do a bunch of
other pieces in x86 and common code.

Thanks,
Alejandro

