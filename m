Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0657298E30
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12324.32120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2h7-0005ra-Sp; Mon, 26 Oct 2020 13:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12324.32120; Mon, 26 Oct 2020 13:37:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2h7-0005rA-PO; Mon, 26 Oct 2020 13:37:53 +0000
Received: by outflank-mailman (input) for mailman id 12324;
 Mon, 26 Oct 2020 13:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kX2h6-0005ql-73
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:37:52 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 470bdee7-414d-41b0-8e39-299697ea26c5;
 Mon, 26 Oct 2020 13:37:51 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v6so12077984lfa.13
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kX2h6-0005ql-73
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:37:52 +0000
X-Inumbo-ID: 470bdee7-414d-41b0-8e39-299697ea26c5
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 470bdee7-414d-41b0-8e39-299697ea26c5;
	Mon, 26 Oct 2020 13:37:51 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v6so12077984lfa.13
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jmxjB0lodzUkO8ogrxbdM7GY0PHknpA4mlDFBnfQsJA=;
        b=L8wsYGj47pIuJAgoKXL1immpbRX/bQzfuRytbjLVJWVlHwqQb905FwdOfnyA6oHllg
         +ptyS7q7EhwBXe0si8/X8KZ5sT9ZgGh+u8Ga8CGaFlF+4thSXMgFMcCscQVofAFYeRvz
         hTYeR/UWd9ZLijmff9LDOHROBbJgFB1oFLtdv87SG3thzCqrzNG+NrmTmk7owOhB0q2C
         Au71SKOerwD/CSltb5Vu4zyRS60rglfTAUdPyP46Ie3pel8A+bbyzAlk+SdJkYvcEWkl
         iYQKg7F0R2l4TUiesO+01hg/jP4o9ckk3YrHn5pW7442rx/x5sMgQUSPZiBCXe6buNt2
         WG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jmxjB0lodzUkO8ogrxbdM7GY0PHknpA4mlDFBnfQsJA=;
        b=p6Mkn/nX6dEVxQwOMlf/Jht/GUDeXGM7Y2AkudKrslEkedpIvqJ2yNuGmMr7wYM7Y7
         4wP4f6cJ8F9TzefHQEoYTQ1zKH910xtK4GWWxMv9kk6LE97Tegr3g3J3EC0nbH5Hq6Mp
         fwFHvIf/3SHCAJwkT2D7Q/jfapQbjbUjL7I31v1HiMDleYBNJkxPZUNVUhZ6nHgszosd
         xdUGuHktf5QoIZt3OnsE6LAQ8zdmJokMVFqnHikZBAQwL2WDEW+sXNdeslt3A8oiFe+H
         BCdWDSnXy9yLWe2O78iEpxjV6hM6VeK9D5TmhFZGTU8ZXUwI5G8MOCNBayI+zGBVhdkT
         /Gxg==
X-Gm-Message-State: AOAM530Boxat78+Uws+ZExDFAqDaEHJTzZKmhX+r4Ms8b0mkgk/aOjU8
	Nc6pfKXgdMYbzjvNXVAfSVRcqGGEBxVk8zb/6Ag=
X-Google-Smtp-Source: ABdhPJza02LxVp0DyRuucexgpsHIrJE1SFyPvYKMyJHMKgEB64mtFMeujsXXuToePQ70ronIrfwtd2VPDtZRubgfOXo=
X-Received: by 2002:a19:7f4a:: with SMTP id a71mr5491778lfd.202.1603719470119;
 Mon, 26 Oct 2020 06:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
 <f8f5f354-aa8d-4bd0-9c0e-ef37702e80c5@citrix.com> <48816c69ab2551a34c57a87392bb7f08ca6482ee.camel@xen.org>
In-Reply-To: <48816c69ab2551a34c57a87392bb7f08ca6482ee.camel@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 26 Oct 2020 09:37:38 -0400
Message-ID: <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
Subject: Re: XSM and the idle domain
To: Hongyan Xia <hx242@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2020 at 1:01 PM Hongyan Xia <hx242@xen.org> wrote:
>
> On Thu, 2020-10-22 at 13:51 +0100, Andrew Cooper wrote:
> > On 21/10/2020 15:34, Hongyan Xia wrote:
> > > The first question came up during ongoing work in LiveUpdate. After
> > > an
> > > LU, the next Xen needs to restore all domains. To do that, some
> > > hypercalls need to be issued from the idle domain context and
> > > apparently XSM does not like it.
> >
> > There is no such thing as issuing hypercalls from the idle domain
> > (context or otherwise), because the idle domain does not have enough
> > associated guest state for anything to make the requisite
> > SYSCALL/INT80/VMCALL/VMMCALL invocation.
> >
> > I presume from this comment that what you mean is that you're calling
> > the plain hypercall functions, context checks and everything, from
> > the
> > idle context?
>
> Yep, the restore code just calls the hypercall functions from idle
> context.
>
> > If so, this is buggy for more reasons than just XSM objecting to its
> > calling context, and that XSM is merely the first thing to explode.
> > Therefore, I don't think modifications to XSM are applicable to
> > solving
> > the problem.
> >
> > (Of course, this is all speculation because there's no concrete
> > implementation to look at.)
>
> Another explosion is the inability to create hypercall preemption,
> which for now is disabled when the calling context is the idle domain.
> Apart from XSM and preemption, the LU prototype works fine. We only
> reuse a limited number of hypercall functions and are not trying to be
> able to call all possible hypercalls from idle.

I wonder if for domain_create, it wouldn't be better to move
xsm_domain_create() out to the domctl (hypercall entry) and check it
there.  That would side-step xsm in domain_create.  Flask would need
to be modified for that.  I've an untested patch doing the
rearranging, which I'll send as a follow up.

What other hypercalls are you having issues with?  Those could also be
refactored so the hypercall entry checks permissions, and the actual
work is done in a directly callable function.

> Having a dedicated domLU just like domB (or reusing domB) sounds like a
> viable option. If the overhead can be made low enough then we won't
> need to work around XSM and hypercall preemption.
>
> Although the question was whether XSM should interact with the idle
> domain. With a good design LU should be able to sidestep this though.

Circling back to the main topic, is the idle domain Xen, or is it
distinct?  It runs in the context of Xen, so Xen isn't really in a
place to enforce policy on itself.  Hongyan, as you said earlier,
applying XSM is more of a debugging feature at that point than a
security feature.  And as Jan pointed out, you can have problems if
XSM prevents the hypervisor from performing an action it doesn't
expect to fail.

Regards,
Jason

