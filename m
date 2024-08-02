Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C8945A09
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770675.1181309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnlK-0005sS-N5; Fri, 02 Aug 2024 08:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770675.1181309; Fri, 02 Aug 2024 08:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnlK-0005pN-K9; Fri, 02 Aug 2024 08:35:46 +0000
Received: by outflank-mailman (input) for mailman id 770675;
 Fri, 02 Aug 2024 08:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZnlJ-0005pH-4n
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:35:45 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350c6f1b-50aa-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 10:35:44 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7a1dcc7bc05so482924885a.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 01:35:44 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6dcf20sm67904185a.20.2024.08.02.01.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 01:35:41 -0700 (PDT)
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
X-Inumbo-ID: 350c6f1b-50aa-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722587743; x=1723192543; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IsXXsBEw2nBwJhLPq7U38pcK5WWigxV/U3pzN3u3zSQ=;
        b=ozidcaftSp0n0SangJDa5fGDCQlDVLGeIaLB/yreW9B3fyhqrMALK6UaNncuXvlDlk
         6wmpvX1C5HEJLwW7LFyaD7dRTVwJsIUNrMmZpE8Cm0ylVbueeyzrAalsj6gPdXg75oWz
         8g0vTOOP3ihG1eQb9Yee0moK2J8BGJiTJjw/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722587743; x=1723192543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsXXsBEw2nBwJhLPq7U38pcK5WWigxV/U3pzN3u3zSQ=;
        b=AEjm0wx91sCZJMI65CdWQxWcEvY8NomlEzheWcRVndCdP0m9oM8NIK0wpBiMuYBE4h
         EjtsR69T+jL7OHWYAUNDAJ3cULtSnoCCzqbbUw95vicrbi/7yQ6JEEG8ZIYEl6O4blqX
         0KCvliH/aehhMcAbc5ZLgpQyFepru3zp/hhI2Pj5efMlOUuyPW/TAxFOIcpNQb/j5B3P
         jw+LnoKKnfufm/bKyaU2bbugJr5rhtd6KC15BejG9nBMXbOsWOPy7vOH/Li2djLx3/xA
         VZt2VJaZjBzNwinINygDWx2mdOUdPz83gTXVPmR9vpiJGrAOO1QnGe/hyVKz+MFHLYbf
         1+1g==
X-Forwarded-Encrypted: i=1; AJvYcCU3HJlllAUx6t8l6GLVWY3bD4tYYLVVOq7SZAvTpV/xEtWoicejHPxO3dUdJLYro7mSUS/SM1g1KgyXaLWnp4wFQuAA9F5Cn4diEs8DztQ=
X-Gm-Message-State: AOJu0Yx26M2M0yHPrCJrNWFLoLjzSR0QeZbsloJ5lbMGrgvKs5V1Nh+q
	DZMsJpAQtBLAqxECTZ+7rO90+srZ7I+SpRcP0TEgDr4GYq2U/O78bAOOSfsMC3o=
X-Google-Smtp-Source: AGHT+IHiKaeEvd4bGvpv/xB1+MymkpTpsSWgHAAWv0J+wyGosWTW+yFAqXGk8qWRkXt7vxyCiK2AMw==
X-Received: by 2002:a05:620a:17a2:b0:79f:12e9:1e71 with SMTP id af79cd13be357-7a34edb4c89mr361540685a.0.1722587742072;
        Fri, 02 Aug 2024 01:35:42 -0700 (PDT)
Date: Fri, 2 Aug 2024 10:35:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <ZqyaWryc_42KSnK_@macbook>
References: <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
 <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>
 <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com>
 <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyUxv7UcaRcksCG@macbook>
 <BL1PR12MB584967C87F8EBC9B753C7B10E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584967C87F8EBC9B753C7B10E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Aug 02, 2024 at 08:17:15AM +0000, Chen, Jiqian wrote:
> On 2024/8/2 16:11, Roger Pau Monné wrote:
> > On Fri, Aug 02, 2024 at 02:37:24AM +0000, Chen, Jiqian wrote:
> >> On 2024/7/31 21:03, Roger Pau Monné wrote:
> >>> On Wed, Jul 31, 2024 at 01:39:40PM +0200, Jan Beulich wrote:
> >>>> On 31.07.2024 13:29, Roger Pau Monné wrote:
> >>>>> On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
> >>>>>> On 31.07.2024 11:37, Roger Pau Monné wrote:
> >>>>>>> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
> >>>>>>>> On 31.07.2024 10:51, Roger Pau Monné wrote:
> >>>>>>>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
> >>>>>>>>> hypercalls should be gated on this.  As said a PV dom0 is already
> >>>>>>>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> >>>>>>>>> domU.
> >>>>>>>>
> >>>>>>>> Okay, I can accept that as an intermediate position. We ought to deny
> >>>>>>>> such requests at some point though for PVH domains, the latest in the
> >>>>>>>> course of making vPCI work there.
> >>>>>>>
> >>>>>>> Hm, once physdev_map_pirq() works as intended against PVH domains, I
> >>>>>>> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
> >>>>>>> against such domains.
> >>>>>>
> >>>>>> Well. If it can be made work as intended, then I certainly agree. However,
> >>>>>> without even the concept of pIRQ in PVH I'm having a hard time seeing how
> >>>>>> it can be made work. Iirc you were advocating for us to not introduce pIRQ
> >>>>>> into PVH.
> >>>>>
> >>>>> From what I'm seeing here the intention is to expose
> >>>>> PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
> >>>>> pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.
> >>>>
> >>>> Only in so far as it is an abstract, handle-like value pertaining solely
> >>>> to the target domain.
> >>>>
> >>>>>> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
> >>>>>> pass in GSIs?
> >>>>>
> >>>>> I think that was one my proposals, to either introduce a new
> >>>>> hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
> >>>>> in an ABI compatible way so that semantically the field could be a GSI
> >>>>> rather than a pIRQ.  We however would also need a way to reference an
> >>>>> MSI entry.
> >>>>
> >>>> Of course.
> >>>>
> >>>>> My main concern is not with pIRQs by itself, pIRQs are just an
> >>>>> abstract way to reference interrupts, my concern and what I wanted to
> >>>>> avoid on PVH is being able to route pIRQs over event channels.  IOW:
> >>>>> have interrupts from physical devices delivered over event channels.
> >>>>
> >>>> Oh, I might have slightly misunderstood your intentions then.
> >>>
> >>> My intention would be to not even use pIRQs at all, in order to avoid
> >>> the temptation of the guest itself managing interrupts using
> >>> hypercalls, hence I would have preferred that abstract interface to be
> >>> something else.
> >>>
> >>> Maybe we could even expose the Xen IRQ space directly, and just use
> >>> that as interrupt handles, but since I'm not the one doing the work
> >>> I'm not sure it's fair to ask for something that would require more
> >>> changes internally to Xen.
> >>>
> >>>>>> I think I suggested something along these lines also to
> >>>>>> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
> >>>>>> not sure this could be made work reliably.
> >>>>>
> >>>>> I'm afraid I've been lacking behind on reviewing those series.
> >>>>>
> >>>>>> Which reminds me of another question I had: What meaning does the pirq
> >>>>>> field have right now, if Dom0 would issue the request against a PVH DomU?
> >>>>>> What meaning will it have for a !has_pirq() HVM domain?
> >>>>>
> >>>>> The pirq field could be a way to reference an interrupt.  It doesn't
> >>>>> need to be exposed to the PVH domU at all, but it's a way for the
> >>>>> device model to identify which interrupt should be mapped to which
> >>>>> domain.
> >>>>
> >>>> Since pIRQ-s are per-domain, _that_ kind of association won't be
> >>>> helped. But yes, as per above it could serve as an abstract handle-
> >>>> like value.
> >>>
> >>> I would be fine with doing the interrupt bindings based on IRQs
> >>> instead of pIRQs, but I'm afraid that would require more changes to
> >>> hypercalls and Xen internals.
> >>>
> >>> At some point I need to work on a new interface to do passthrough, so
> >>> that we can remove the usage of domctls from QEMU.  That might be a
> >>> good opportunity to switch from using pIRQs.
> >>
> >> Thanks for your input, but I may be a bit behind you with my knowledge and can't fully understand the discussion.
> >> How should I modify this question later?
> >> Should I add a new hypercall specifically for passthrough?
> >> Or if it is to prevent the (un)map from being used for PVH guests, can I just add a new function to check if the subject domain is a PVH type? Like is_pvh_domain().
> > 
> > I think that would be part of a new interface, as said before I don't
> > think it would be fair to force you to do all this work.  I won't
> > oppose with the approach to attempt to re-use the existing interfaces
> > as much as possible.
> Thanks.
> 
> > 
> > I think this patch needs to be adjusted to drop the change to
> > xen/arch/x86/physdev.c, as just allowing PHYSDEVOP_{,un}map_pirq
> > without any change to do_physdev_op() should result in the correct
> > behavior.
> Do you mean that I don't need to add any further restrictions in do_physdev_op(), just simply allow PHYSDEVOP_{,un}map_pirq in hvm_physdev_op() ?

That's my understanding, yes, no further restrictions should be added.

Thanks, Roger.

