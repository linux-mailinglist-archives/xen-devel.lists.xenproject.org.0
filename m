Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC372F8321
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 18:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68504.122642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0TLC-000343-V5; Fri, 15 Jan 2021 17:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68504.122642; Fri, 15 Jan 2021 17:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0TLC-00033e-Rp; Fri, 15 Jan 2021 17:56:54 +0000
Received: by outflank-mailman (input) for mailman id 68504;
 Fri, 15 Jan 2021 17:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0TLB-00033Z-RN
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 17:56:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba904d1d-a4c1-4f60-84a0-e65dd76a4558;
 Fri, 15 Jan 2021 17:56:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE1FE23A59;
 Fri, 15 Jan 2021 17:56:51 +0000 (UTC)
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
X-Inumbo-ID: ba904d1d-a4c1-4f60-84a0-e65dd76a4558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610733412;
	bh=9uUqN66JVb7FKJG3zbSCzPBomeoUqfvd6tq4pgVbgrE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tz35c56qv83NJq0xS/qGADnjBzY/fqwhmENvV3oBqxrQ3shX6W6AeAgBTo9z4X82t
	 ojrv6tGE1+x22ViO79aTZl2x4zAyqAW3POMJacbkw0Hj6R4KMVKoGDLYJduaS99ETW
	 Ci7XSjWJbbhv6TvMi7XN/9kM2UQzkZ9TQ0aY1XPsxGFgEGR/HvcPJXehyRxaU70AmI
	 sXFRb+J1NsnE+ThORPTr+MMr6X2/HwfrhNcKkBtxn9hYVPv8Bpo+lbz7Vy+NzSVnfL
	 J18OcjiU3/akNWw+vgMpHALW+i42BtagG3J08RASHs7J+Gz/RmlnprPwf/5c+caJbN
	 2qu14R6wCtjVA==
Date: Fri, 15 Jan 2021 09:56:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Rahul Singh <Rahul.Singh@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
In-Reply-To: <3e49735c-adc8-775d-3115-cf623ed1cef0@suse.com>
Message-ID: <alpine.DEB.2.21.2101150956350.31265@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com> <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com> <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
 <ce896f84-917b-14e8-40e4-46b5ce3cb2f6@suse.com> <alpine.DEB.2.21.2101141546350.31265@sstabellini-ThinkPad-T480s> <EA49F7DE-22AF-4F95-9158-0EE42519FE7A@arm.com> <3e49735c-adc8-775d-3115-cf623ed1cef0@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1286266114-1610733412=:31265"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1286266114-1610733412=:31265
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 15 Jan 2021, Jan Beulich wrote:
> On 15.01.2021 13:14, Rahul Singh wrote:
> > Hello,
> > 
> >> On 14 Jan 2021, at 11:47 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>
> >> On Thu, 14 Jan 2021, Jan Beulich wrote:
> >>> On 13.01.2021 00:30, Stefano Stabellini wrote:
> >>>> On Tue, 12 Jan 2021, Jan Beulich wrote:
> >>>>> On 08.01.2021 15:46, Rahul Singh wrote:
> >>>>>> -Wimplicit-fallthrough warns when a switch case falls through. Warning
> >>>>>> can be suppress by either adding a /* fallthrough */ comment, or by
> >>>>>> using a null statement: __attribute__ ((fallthrough))
> >>>>>
> >>>>> Why is the comment variant (which we use in many places already,
> >>>>> albeit with varying wording) not the route of choice?
> >>>>
> >>>> See previous discussion:
> >>>>
> >>>> https://marc.info/?l=xen-devel&m=160707274517270
> >>>> https://marc.info/?l=xen-devel&m=160733742810605
> >>>> https://marc.info/?l=xen-devel&m=160733852011023
> >>>>
> >>>> We thought it would be best to introduce "fallthrough" and only resort
> >>>> to comments as a plan B. The usage of the keyword should allow GCC to do
> >>>> better checks.
> >>>
> >>> Hmm, this earlier discussion was on an Arm-specific thread, and I
> >>> have to admit I can't see arguments there pro and/or con either
> >>> of the two alternatives.
> >>>
> >>>>>> Define the pseudo keyword 'fallthrough' for the ability to convert the
> >>>>>> various case block /* fallthrough */ style comments to null statement
> >>>>>> "__attribute__((__fallthrough__))"
> >>>>>>
> >>>>>> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> >>>>>> the same time the warning and the comment parsing were introduced.
> >>>>>>
> >>>>>> fallthrough devolves to an empty "do {} while (0)" if the compiler
> >>>>>> version (any version less than gcc 7) does not support the attribute.
> >>>>>
> >>>>> What about Coverity? It would be nice if we wouldn't need to add
> >>>>> two separate constructs everywhere to make both compiler and static
> >>>>> code checker happy.
> >>>>
> >>>> I don't think I fully understand your reply here: Coverity doesn't come
> >>>> into the picture. Given that GCC provides a special keyword to implement
> >>>> fallthrough, it makes sense to use it when available. When it is not
> >>>> available (e.g. clang or older GCC) we need to have an alternative to
> >>>> suppress the compiler warnings. Hence the need for this check:
> >>>>
> >>>>  #if (!defined(__clang__) && (__GNUC__ >= 7))
> >>>
> >>> I'm not sure how this interacts with Coverity. My point bringing up
> >>> that one is that whatever gets done here should _also_ result in
> >>> Coverity recognizing the fall-through as intentional, or else we'll
> >>> end up with many unwanted reports of new issues once the pseudo-
> >>> keyword gets made use of. The comment model is what we currently
> >>> use to "silence" Coverity; I'd like it to be clear up front that
> >>> any new alternative to be used is also going to "satisfy" it.
> >>
> >> That is a good point, and I agree with that. Rahul, do you have access
> >> to a Coverity instance to run a test? 
> > 
> > No I don’t have access to Coverity to run a test.What I found out that from the Linux kernel mailing list Coverity understand the "__attribute__((__fallthrough__))” keyword.
> 
> Okay, thanks, looks sufficient afaic.

+1
--8323329-1286266114-1610733412=:31265--

