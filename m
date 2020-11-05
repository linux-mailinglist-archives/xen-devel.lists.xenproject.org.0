Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60A2A74C8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 02:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19600.44814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaTrf-0001EA-32; Thu, 05 Nov 2020 01:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19600.44814; Thu, 05 Nov 2020 01:14:59 +0000
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
	id 1kaTre-0001Dl-Vr; Thu, 05 Nov 2020 01:14:58 +0000
Received: by outflank-mailman (input) for mailman id 19600;
 Thu, 05 Nov 2020 01:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kaTrc-0001Dg-Qp
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 01:14:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1701196-d525-4472-b75a-22e28faf4194;
 Thu, 05 Nov 2020 01:14:55 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28C59206E3;
 Thu,  5 Nov 2020 01:14:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kaTrc-0001Dg-Qp
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 01:14:56 +0000
X-Inumbo-ID: c1701196-d525-4472-b75a-22e28faf4194
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c1701196-d525-4472-b75a-22e28faf4194;
	Thu, 05 Nov 2020 01:14:55 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 28C59206E3;
	Thu,  5 Nov 2020 01:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604538894;
	bh=lEDWjSBGCb0lmhyv1pb5gunX7ZUyctdlOYsQpCdP/bg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Njo35RmDiqFbh1qRBewP9nhOPDQYBLV2+DzdJ3butUXz30US5DddgPha5sw56OSPS
	 nAmX4KiP2+nEDr4eiAF75wssPc5UeFE2kXtNRuZYf09S85NEVzvburZqBmbJUpOV0c
	 KEbNT8OPYYdnCs6RX+G3KGsb7SA1gFqfqrAYiZY8=
Date: Wed, 4 Nov 2020 17:14:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
In-Reply-To: <FD3CD0C4-6055-443B-B7D9-EAAC4935D2A9@arm.com>
Message-ID: <alpine.DEB.2.21.2011041704100.3264@sstabellini-ThinkPad-T480s>
References: <20201031002405.4545-1-sstabellini@kernel.org> <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com> <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s> <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com> <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
 <e0842284-a894-1e0b-ffbe-484013acefa5@suse.com> <FD3CD0C4-6055-443B-B7D9-EAAC4935D2A9@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2020, Bertrand Marquis wrote:
> > On 4 Nov 2020, at 07:34, Jan Beulich <jbeulich@suse.com> wrote:
> > On 03.11.2020 20:37, Stefano Stabellini wrote:
> >> On Tue, 3 Nov 2020, Jan Beulich wrote:
> >>> On 02.11.2020 22:41, Stefano Stabellini wrote:
> >>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
> >>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
> >>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
> >>>>>> 	  SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>>>> 
> >>>>>> config ARM_SSBD
> >>>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
> >>>>>> -	depends on HAS_ALTERNATIVE
> >>>>>> +	bool "Speculative Store Bypass Disable"
> >>>>>> +	depends on HAS_ALTERNATIVE && EXPERT
> >>>>>> 	default y
> >>>>> 
> >>>>> At the example of this, I'm afraid when the default isn't "n"
> >>>>> (or there's no default directive at all, as ought to be
> >>>>> equivalent to and preferred over "default n"), such a
> >>>>> transformation is not functionally identical: Before your
> >>>>> change, with !EXPERT this option defaults to y. After your
> >>>>> change this option is unavailable (which resolves to it being
> >>>>> off for all consuming purposes).
> >>>>> 
> >>>>> IOW there are reasons to have "if ..." attached to the prompts
> >>>>> (for this construct indeed only making the prompt conditional,
> >>>>> not the entire option), but there are also cases where the
> >>>>> cleanup you do is indeed desirable / helpful.
> >>>> 
> >>>> Yeah, thanks for catching it, it is obviously a problem.
> >>>> 
> >>>> My intention was just to "tag" somehow the options to EXPERT so that it
> >>>> would show on the menu. Maybe a better, simpler, way to do it is
> >>>> to add the word "EXPERT" to the one line prompt:
> >>>> 
> >>>> config ARM_SSBD
> >>>> -	bool "Speculative Store Bypass Disable" if EXPERT
> >>>> +	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
> >>>> 	depends on HAS_ALTERNATIVE
> >>>> 	default y
> >>>> 	help
> >>>> 
> >>>> 
> >>>> What do you think?
> >>> 
> >>> While on the surface this may look like an improvement, I don't
> >>> see how it would actually help: If you read the Kconfig file
> >>> itself, the dependency is seen anyway. And on the menu I don't
> >>> see the point of telling someone who has enabled EXPERT that a
> >>> certain option is (or is not) an expert one. If they think
> >>> they're experts, so should they be treated. (It was, after all,
> >>> a deliberate decision to make enabling expert mode easier, and
> >>> hence easier to use for what one might consider not-really-
> >>> experts. I realize saying so may be considered tendentious; I
> >>> mean it in a purely technical sense, and I'd like to apologize
> >>> in advance to anyone not sharing this as a possible perspective
> >>> to take.)
> >>> 
> >>> Plus, of course, the addition of such (EXPERT) markers to
> >>> future options' prompts is liable to get forgotten now and then,
> >>> so sooner or later we'd likely end up with an inconsistent
> >>> mixture anyway.
> >> 
> >> I tend to agree with you on everything you wrote. The fundamental issue
> >> is that we are (mis)using EXPERT to tag features that are experimental,
> >> as defined by SUPPORT.md.
> >> 
> >> It is important to be able to distinguish clearly at the kconfig level
> >> options that are (security) supported from options that are
> >> unsupported/experimental. Today the only way to do it is with EXPERT
> >> which is not great because:
> >> 
> >> - it doesn't convey the idea that it is for unsupported/experimental
> >>  features
> >> - if you want to enable one unsupported feature, it is not clear what
> >>  you have to do
> >> 
> >> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
> >> the Kconfig menu?
> > 
> > If you mean this to be added to prompt texts, then yes, I'd view
> > this as helpful. However, ...
> 
> +1
> 
> > 
> >> It would make it clearer that by enabling UNSUPPORTED you are going to
> >> get a configuration that is not security supported. And ideally we would
> >> also tag features like ACPI as UNSUPPORTED as I suggested above.
> > 
> > ... things will get uglier when (just a simple example) something
> > is supported on x86, but not on Arm.
> 
> This is true that this could happen but we could easily workaround this
> by having arch specific entries selecting the generic one:
> 
> CONFIG_PCI
> 	bool
> 	default n
> 
> CONFIG_X86_PCI
> 	bool if x86
> 	select CONFIG_PCI
> 
> CONFIG_ARM_PCI
> 	bool if arm
> 	depends on UNSUPPORTED
> 	select CONFIG_PCI
> 
> This is not the full syntax or right variables but you get the idea :-)
> 
> This is making Kconfig more complex but improves the user configuration experience
> so i think this is a win.

It is good that we have a potential clean solution for this. However,
today this problem is only theoretical because none of the EXPERT
options under xen/commons have a different support status on ARM vs x86.
So that's not an issue.

However, there a few options in xen/common/Kconfig that are honestly
more in the original meaning of EXPERT rather than UNSUPPORTED, such as:
- CMDLINE
- TRACEBUFFER

I don't think we want to change CMDLINE from EXPERT to UNSUPPORTED,
right? Jan, are there any other options, either under xen/common/Kconfig
or xen/arch/x86/Kconfig that you think they should remain EXPERT?


So, I think the plan should be to:

- introduce a new UNSUPPORTED option, alongside EXPERT
- change EXPERT options under xen/arch/arm/Kconfig to UNSUPPORTED
    - ACPI
    - HAS_ITS
    - ARM_SSBD
    - HARDEN_BRANCH_PREDICTOR
    - TEE
- change other EXPERT options to UNSUPPORTED where it makes sense
    - e.g. ARGO
    - EFI_SET_VIRTUAL_ADDRESS_MAP
    - MEM_SHARING
    - TBOOT
    - XEN_SHSTK
    - Jan, anything else?
- add "(UNSUPPORTED)" to the oneline text of every UNSUPPORTED option


Do you guys agree?

