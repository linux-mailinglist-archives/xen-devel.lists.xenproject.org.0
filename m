Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F039459BD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770412.1181279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnSo-0000da-Gs; Fri, 02 Aug 2024 08:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770412.1181279; Fri, 02 Aug 2024 08:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnSo-0000bz-DY; Fri, 02 Aug 2024 08:16:38 +0000
Received: by outflank-mailman (input) for mailman id 770412;
 Fri, 02 Aug 2024 08:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZnOF-0007QK-BQ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:11:55 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e10daa8b-50a6-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 10:11:54 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-44fe188d25cso28026311cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 01:11:54 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a781303sm5483091cf.95.2024.08.02.01.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 01:11:52 -0700 (PDT)
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
X-Inumbo-ID: e10daa8b-50a6-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722586314; x=1723191114; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MK/jxrHQUVsD+3Bwa975sGauqK671Qx9bmsQqfiytsc=;
        b=KvxcTpskG363Hhro6W9acmAnwbcl8CnyC7+UClXgJ3XOZCS9omc0oyvjGlUy0NLolM
         Yste/EVWcaF8Rm/kPVgfCaPmtOyRz8cWDRboKQdo+GfrnVBo4gl03q3Kb6aswg5r6Jcr
         tLcJjKfI3W6XPnYsMlvD5eHjaaQB1nRJxwwyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722586314; x=1723191114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MK/jxrHQUVsD+3Bwa975sGauqK671Qx9bmsQqfiytsc=;
        b=hDnA6AHmMocUuutzivaVfzkUjxB7RJm6Nf3A3JXPjQEIeZ5nWxJuRG6NmPvbp7WPLU
         3qciH5+qcIwARjSvlsb4dWCMTGXPdS3c8KqkxbF0OyitoOumoj08N+7IyVTg/A3YbZEe
         HIcutL6wklgQ0QIx4MOCLLrWHjEEKgK72EWvKbvy8YQayA+LXZYHzw5NY5dzXCUuWxz5
         2NB6mrQSvSiy8C0NslHGMDTil8xdVslWAN4hOr5mEtcbdwKgtbRWJoFVV+L+ehV5NfqD
         ReCt+lBhB9favRJ57CYnHIA1eHKVnTByLFcQSU8E5vIbbFwJG9XbqczDATyUmzqDU838
         WrUA==
X-Forwarded-Encrypted: i=1; AJvYcCXOYQlDEIFpp5Oz2kZQK+UQ3eesyTvE+qjUvQSxxWlub3uhyZTcomTu6MVwZdj5vZtxG6RXW4EN0gWiMLlVHQLleBYf6oyV9SzOHCtVd+w=
X-Gm-Message-State: AOJu0Yykv+s7cQGpna7OqDSd9kHQiKpOrJdqJJah7LvuZzqNVg1/sB5f
	yIz77dmsYgBayeU3V7TQGUQQ4/QP4NB8BL9mdk5jLoxdI3au19xljY4r8Ujvpu8=
X-Google-Smtp-Source: AGHT+IFMtxPVf08HwzGe0JlysWGGzK4mdZZlLGybpBybhG1SD1ohdSF+QJQ9tLhj7J1q67m8VdA56A==
X-Received: by 2002:ac8:578b:0:b0:447:f0cc:abe1 with SMTP id d75a77b69052e-451892048d6mr30956881cf.1.1722586313368;
        Fri, 02 Aug 2024 01:11:53 -0700 (PDT)
Date: Fri, 2 Aug 2024 10:11:50 +0200
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
Message-ID: <ZqyUxv7UcaRcksCG@macbook>
References: <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
 <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
 <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>
 <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com>
 <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Aug 02, 2024 at 02:37:24AM +0000, Chen, Jiqian wrote:
> On 2024/7/31 21:03, Roger Pau Monné wrote:
> > On Wed, Jul 31, 2024 at 01:39:40PM +0200, Jan Beulich wrote:
> >> On 31.07.2024 13:29, Roger Pau Monné wrote:
> >>> On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
> >>>> On 31.07.2024 11:37, Roger Pau Monné wrote:
> >>>>> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
> >>>>>> On 31.07.2024 10:51, Roger Pau Monné wrote:
> >>>>>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
> >>>>>>> hypercalls should be gated on this.  As said a PV dom0 is already
> >>>>>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> >>>>>>> domU.
> >>>>>>
> >>>>>> Okay, I can accept that as an intermediate position. We ought to deny
> >>>>>> such requests at some point though for PVH domains, the latest in the
> >>>>>> course of making vPCI work there.
> >>>>>
> >>>>> Hm, once physdev_map_pirq() works as intended against PVH domains, I
> >>>>> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
> >>>>> against such domains.
> >>>>
> >>>> Well. If it can be made work as intended, then I certainly agree. However,
> >>>> without even the concept of pIRQ in PVH I'm having a hard time seeing how
> >>>> it can be made work. Iirc you were advocating for us to not introduce pIRQ
> >>>> into PVH.
> >>>
> >>> From what I'm seeing here the intention is to expose
> >>> PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
> >>> pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.
> >>
> >> Only in so far as it is an abstract, handle-like value pertaining solely
> >> to the target domain.
> >>
> >>>> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
> >>>> pass in GSIs?
> >>>
> >>> I think that was one my proposals, to either introduce a new
> >>> hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
> >>> in an ABI compatible way so that semantically the field could be a GSI
> >>> rather than a pIRQ.  We however would also need a way to reference an
> >>> MSI entry.
> >>
> >> Of course.
> >>
> >>> My main concern is not with pIRQs by itself, pIRQs are just an
> >>> abstract way to reference interrupts, my concern and what I wanted to
> >>> avoid on PVH is being able to route pIRQs over event channels.  IOW:
> >>> have interrupts from physical devices delivered over event channels.
> >>
> >> Oh, I might have slightly misunderstood your intentions then.
> > 
> > My intention would be to not even use pIRQs at all, in order to avoid
> > the temptation of the guest itself managing interrupts using
> > hypercalls, hence I would have preferred that abstract interface to be
> > something else.
> > 
> > Maybe we could even expose the Xen IRQ space directly, and just use
> > that as interrupt handles, but since I'm not the one doing the work
> > I'm not sure it's fair to ask for something that would require more
> > changes internally to Xen.
> > 
> >>>> I think I suggested something along these lines also to
> >>>> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
> >>>> not sure this could be made work reliably.
> >>>
> >>> I'm afraid I've been lacking behind on reviewing those series.
> >>>
> >>>> Which reminds me of another question I had: What meaning does the pirq
> >>>> field have right now, if Dom0 would issue the request against a PVH DomU?
> >>>> What meaning will it have for a !has_pirq() HVM domain?
> >>>
> >>> The pirq field could be a way to reference an interrupt.  It doesn't
> >>> need to be exposed to the PVH domU at all, but it's a way for the
> >>> device model to identify which interrupt should be mapped to which
> >>> domain.
> >>
> >> Since pIRQ-s are per-domain, _that_ kind of association won't be
> >> helped. But yes, as per above it could serve as an abstract handle-
> >> like value.
> > 
> > I would be fine with doing the interrupt bindings based on IRQs
> > instead of pIRQs, but I'm afraid that would require more changes to
> > hypercalls and Xen internals.
> > 
> > At some point I need to work on a new interface to do passthrough, so
> > that we can remove the usage of domctls from QEMU.  That might be a
> > good opportunity to switch from using pIRQs.
> 
> Thanks for your input, but I may be a bit behind you with my knowledge and can't fully understand the discussion.
> How should I modify this question later?
> Should I add a new hypercall specifically for passthrough?
> Or if it is to prevent the (un)map from being used for PVH guests, can I just add a new function to check if the subject domain is a PVH type? Like is_pvh_domain().

I think that would be part of a new interface, as said before I don't
think it would be fair to force you to do all this work.  I won't
oppose with the approach to attempt to re-use the existing interfaces
as much as possible.

I think this patch needs to be adjusted to drop the change to
xen/arch/x86/physdev.c, as just allowing PHYSDEVOP_{,un}map_pirq
without any change to do_physdev_op() should result in the correct
behavior.

Thanks, Roger.

