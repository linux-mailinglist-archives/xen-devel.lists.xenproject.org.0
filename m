Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5E2A5040
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 20:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18669.43666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka27O-0003sm-Fv; Tue, 03 Nov 2020 19:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18669.43666; Tue, 03 Nov 2020 19:37:22 +0000
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
	id 1ka27O-0003sN-Cv; Tue, 03 Nov 2020 19:37:22 +0000
Received: by outflank-mailman (input) for mailman id 18669;
 Tue, 03 Nov 2020 19:37:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ka27M-0003sI-Ry
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 19:37:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76890bc7-c84f-4ff4-b1b7-5cada1c02668;
 Tue, 03 Nov 2020 19:37:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 907AC2080D;
 Tue,  3 Nov 2020 19:37:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ka27M-0003sI-Ry
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 19:37:21 +0000
X-Inumbo-ID: 76890bc7-c84f-4ff4-b1b7-5cada1c02668
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 76890bc7-c84f-4ff4-b1b7-5cada1c02668;
	Tue, 03 Nov 2020 19:37:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 907AC2080D;
	Tue,  3 Nov 2020 19:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604432238;
	bh=Q+UfnbaKn7KBr0VkNX3ie1Z4rV2/72ppmieFGq2RzvA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZKCBCORsIr7Xsxo9zAN1VXTaZ7kPRlk8BbTAM7O1Zh59PIRRW6eawQh6AQVuj0fAR
	 Eoe8cngYPz7fWLsKrsV0oCBcoeF97N2NILURLa5bJPWUhUsBo3+nscrLvyahyBS1nr
	 4KlGGMPbFwagIL79ISIL4qnazBALQ/fQV1Ubqqhw=
Date: Tue, 3 Nov 2020 11:37:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
In-Reply-To: <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com>
Message-ID: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
References: <20201031002405.4545-1-sstabellini@kernel.org> <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com> <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s> <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Nov 2020, Jan Beulich wrote:
> On 02.11.2020 22:41, Stefano Stabellini wrote:
> > On Mon, 2 Nov 2020, Jan Beulich wrote:
> >> On 31.10.2020 01:24, Stefano Stabellini wrote:
> >>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
> >>>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>  
> >>>  config ARM_SSBD
> >>> -	bool "Speculative Store Bypass Disable" if EXPERT
> >>> -	depends on HAS_ALTERNATIVE
> >>> +	bool "Speculative Store Bypass Disable"
> >>> +	depends on HAS_ALTERNATIVE && EXPERT
> >>>  	default y
> >>
> >> At the example of this, I'm afraid when the default isn't "n"
> >> (or there's no default directive at all, as ought to be
> >> equivalent to and preferred over "default n"), such a
> >> transformation is not functionally identical: Before your
> >> change, with !EXPERT this option defaults to y. After your
> >> change this option is unavailable (which resolves to it being
> >> off for all consuming purposes).
> >>
> >> IOW there are reasons to have "if ..." attached to the prompts
> >> (for this construct indeed only making the prompt conditional,
> >> not the entire option), but there are also cases where the
> >> cleanup you do is indeed desirable / helpful.
> > 
> > Yeah, thanks for catching it, it is obviously a problem.
> > 
> > My intention was just to "tag" somehow the options to EXPERT so that it
> > would show on the menu. Maybe a better, simpler, way to do it is
> > to add the word "EXPERT" to the one line prompt:
> > 
> >  config ARM_SSBD
> > -	bool "Speculative Store Bypass Disable" if EXPERT
> > +	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
> >  	depends on HAS_ALTERNATIVE
> >  	default y
> >  	help
> > 
> > 
> > What do you think?
> 
> While on the surface this may look like an improvement, I don't
> see how it would actually help: If you read the Kconfig file
> itself, the dependency is seen anyway. And on the menu I don't
> see the point of telling someone who has enabled EXPERT that a
> certain option is (or is not) an expert one. If they think
> they're experts, so should they be treated. (It was, after all,
> a deliberate decision to make enabling expert mode easier, and
> hence easier to use for what one might consider not-really-
> experts. I realize saying so may be considered tendentious; I
> mean it in a purely technical sense, and I'd like to apologize
> in advance to anyone not sharing this as a possible perspective
> to take.)
> 
> Plus, of course, the addition of such (EXPERT) markers to
> future options' prompts is liable to get forgotten now and then,
> so sooner or later we'd likely end up with an inconsistent
> mixture anyway.

I tend to agree with you on everything you wrote. The fundamental issue
is that we are (mis)using EXPERT to tag features that are experimental,
as defined by SUPPORT.md.

It is important to be able to distinguish clearly at the kconfig level
options that are (security) supported from options that are
unsupported/experimental. Today the only way to do it is with EXPERT
which is not great because:

- it doesn't convey the idea that it is for unsupported/experimental
  features
- if you want to enable one unsupported feature, it is not clear what
  you have to do

So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
the Kconfig menu?

It would make it clearer that by enabling UNSUPPORTED you are going to
get a configuration that is not security supported. And ideally we would
also tag features like ACPI as UNSUPPORTED as I suggested above.

