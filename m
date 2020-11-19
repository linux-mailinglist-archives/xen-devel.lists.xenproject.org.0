Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B596F2B9D01
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 22:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31441.61815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfrfF-0006zr-2O; Thu, 19 Nov 2020 21:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31441.61815; Thu, 19 Nov 2020 21:40:25 +0000
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
	id 1kfrfE-0006zS-V4; Thu, 19 Nov 2020 21:40:24 +0000
Received: by outflank-mailman (input) for mailman id 31441;
 Thu, 19 Nov 2020 21:40:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfrfD-0006zN-B6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 21:40:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6eaef4dc-e5a2-4f96-bc69-e8f29f5da8fc;
 Thu, 19 Nov 2020 21:40:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDCE922202;
 Thu, 19 Nov 2020 21:40:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfrfD-0006zN-B6
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 21:40:23 +0000
X-Inumbo-ID: 6eaef4dc-e5a2-4f96-bc69-e8f29f5da8fc
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6eaef4dc-e5a2-4f96-bc69-e8f29f5da8fc;
	Thu, 19 Nov 2020 21:40:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DDCE922202;
	Thu, 19 Nov 2020 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605822021;
	bh=ySPCWCvo4acFab/emnE2bP+R+/dODfYOq9N2H0YZbyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=obbm0LO7cdAnHU5hUEqexR/EQr/evxMNP+jXlMf++TUvgWQxGs+xi2RIdnfZKtfwI
	 NYkYONRAL8VjuBFiKOtlXfGgJFNJBk/1GULO1OmuMK+chmbt2DuV0Y+W62wD3/nWjp
	 MKULJbrEYjYsgScGk6ivCJnczuj3agar9xtYW5vo=
Date: Thu, 19 Nov 2020 13:40:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <3e8c03eb-ee3f-4439-90c2-acf340c7d8e7@suse.com>
Message-ID: <alpine.DEB.2.21.2011191310210.11739@sstabellini-ThinkPad-T480s>
References: <20201118005051.26115-1-sstabellini@kernel.org> <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com> <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s> <3e8c03eb-ee3f-4439-90c2-acf340c7d8e7@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Jan Beulich wrote:
> On 18.11.2020 22:00, Stefano Stabellini wrote:
> > On Wed, 18 Nov 2020, Jan Beulich wrote:
> >> On 18.11.2020 01:50, Stefano Stabellini wrote:
> >>> 1) It is not obvious that "Configure standard Xen features (expert
> >>> users)" is actually the famous EXPERT we keep talking about on xen-devel
> >>
> >> Which can be addressed by simply changing the one prompt line.
> >>
> >>> 2) It is not obvious when we need to enable EXPERT to get a specific
> >>> feature
> >>>
> >>> In particular if you want to enable ACPI support so that you can boot
> >>> Xen on an ACPI platform, you have to enable EXPERT first. But searching
> >>> through the kconfig menu it is really not clear (type '/' and "ACPI"):
> >>> nothing in the description tells you that you need to enable EXPERT to
> >>> get the option.
> >>
> >> And what causes this to be different once you switch to UNSUPPORTED?
> > 
> > Two things: firstly, it doesn't and shouldn't take an expert to enable
> > ACPI support, even if ACPI support is experimental. So calling it
> > UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconfig
> > options changed by this patch. Secondly, this patch is adding
> > "(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
> > it with the option you need to enable.
> 
> There's redundancy here then, which I think is in almost all cases
> better to avoid. That's first and foremost because the two places
> can go out of sync. Therefore, if the primary thing is to help
> "make menuconfig" (which I admit I don't normally use, as it's
> nothing that gets invoked implicitly by the build process afaict,
> i.e. one has to actively invoke it), perhaps we should enhance
> kconfig to attach at least a pre-determined subset of labels to
> the prompts automatically?
> 
> And second, also in reply to what you've been saying further down,
> perhaps we would better go with a hierarchy of controls here, e.g.
> EXPERT -> EXPERIMENTAL -> UNSUPPORTED?

Both these are good ideas worth discussing; somebody else made a similar
suggestion some time back. I was already thinking this could be a great
candidate for one of the first "working groups" as defined by George
during the last community call because the topic is not purely
technical: a working group could help getting alignment and make
progress faster. We can propose it to George when he is back.

However, I don't think we need the working group to make progress on
this limited patch that only addresses the lowest hanging fruit.

I'd like to suggest to make progress on this patch in its current form,
and in parallel start a longer term discussion on how to do something
like you suggested above.


> >>> So this patch makes things easier by doing two things:
> >>>
> >>> - introduce a new kconfig option UNSUPPORTED which is clearly to enable
> >>>   UNSUPPORTED features as defined by SUPPORT.md
> >>>
> >>> - change EXPERT options to UNSUPPORTED where it makes sense: keep
> >>>   depending on EXPERT for features made for experts
> >>>
> >>> - tag unsupported features by adding (UNSUPPORTED) to the one-line
> >>>   description
> >>
> >> I am, btw, not fully convinced of the need for this redundancy. Wouldn't
> >> it be enough to have just EXPERT as a setting, but varying (<reason>)
> >> tokens in the prompt text?
> > 
> > I don't think so, for the same reasons written above: EXPERT should not
> > be gating things like ACPI.
> 
> Different views are possible here, I suppose. Turning on anything
> that's unsupported requires people to know what they're doing (and
> be ready to pick up the pieces themselves). I'd consider this to
> fall under "expert".

For some features it is as you wrote, but it is not true in all cases.
Let's take ACPI as an example: it doesn't take an expert to enable it
and if it breaks you are in no worse situation than if you didn't,
because if you don't enable it you can't boot at all on the platform.

Also, that's not how EXPERT is commonly used in other projects.
Typically EXPERT is to enable advanced debugging features, and I have
been told recently that it is confusing the way we use it in Xen.

These are the two things that I would like to fix as soon as possible.


> > Moreover, the advantage of the tag in the
> > oneline prompt is that you can search for an option and figure out that
> > you need to enable UNSUPPORTED. It doesn't work if we use a different
> > tag. Just to get the idea, try to do "make menuconfig" and search for
> > "ARGO" with '/': you'll see "(UNSUPPORTED)". Then, if you search for
> > "UNSUPPORTED" you can find what you need to enable.
> 
> Implying that textual representation and Kconfig option name match,
> see above. Even a simple spelling mistake would break this model.

True, a spelling mistake would cause problems, but we do reviews, and
we can make sure there are no spelling mistakes in this patch.

 
> >>> --- a/xen/Kconfig
> >>> +++ b/xen/Kconfig
> >>> @@ -34,8 +34,17 @@ config DEFCONFIG_LIST
> >>>  	option defconfig_list
> >>>  	default ARCH_DEFCONFIG
> >>>  
> >>> +config UNSUPPORTED
> >>> +	bool "Configure UNSUPPORTED features"
> >>> +	help
> >>> +	  This option allows unsupported Xen options to be enabled, which
> >>
> >> I'd recommend against "enabled" - a control may also be there to allow
> >> disabling something.
> > 
> > I can change that.
> > 
> > 
> >>> +	  includes non-security-supported, experimental, and tech preview
> >>> +	  features as defined by SUPPORT.md. Xen binaries built with this
> >>> +	  option enabled are not security supported.
> >>
> >> Overall I'm a little afraid of possible inverse implications: Anything
> >> _not_ dependent upon this option (and in particular anything not
> >> dependent upon any Kconfig control) may be considered supported then.
> >>
> >> Also the last sentence is already present for EXPERT, 
> > 
> > I am happy to rephrase it. What about:
> > 
> > "This option allows certain unsupported Xen options to be changed, which
> > includes non-security-supported, experimental, and tech preview features
> > as defined by SUPPORT.md."
> 
> Sounds better to me.

I'll use it


> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -151,7 +151,7 @@ config KEXEC
> >>>  	  If unsure, say Y.
> >>>  
> >>>  config EFI_SET_VIRTUAL_ADDRESS_MAP
> >>> -    bool "EFI: call SetVirtualAddressMap()" if EXPERT
> >>> +    bool "EFI: call SetVirtualAddressMap() (UNSUPPORTED)" if UNSUPPORTED
> >>
> >> I have to admit I'm pretty unsure about what to do with this one.
> > 
> > Yeah, similarly to XEN_SHSTK, I don't have an opinion here either.  I am
> > happy to change it or leave it as.
> 
> I guess at least for the first cut I'd like to ask to just leave it
> alone.

OK

