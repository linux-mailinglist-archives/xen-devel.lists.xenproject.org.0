Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703F2B8637
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 22:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30251.60108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfUZK-0005Uc-Ak; Wed, 18 Nov 2020 21:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30251.60108; Wed, 18 Nov 2020 21:00:46 +0000
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
	id 1kfUZK-0005UD-6j; Wed, 18 Nov 2020 21:00:46 +0000
Received: by outflank-mailman (input) for mailman id 30251;
 Wed, 18 Nov 2020 21:00:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfUZI-0005U8-S4
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:00:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d645aca-18b7-44cf-be0e-f2afaa826add;
 Wed, 18 Nov 2020 21:00:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B35FE2075B;
 Wed, 18 Nov 2020 21:00:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hmm/=EY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfUZI-0005U8-S4
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:00:44 +0000
X-Inumbo-ID: 0d645aca-18b7-44cf-be0e-f2afaa826add
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0d645aca-18b7-44cf-be0e-f2afaa826add;
	Wed, 18 Nov 2020 21:00:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B35FE2075B;
	Wed, 18 Nov 2020 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605733243;
	bh=egciVJeNpgcLiVvye+pnZUkuZpAFnD3PDDiETXG6wHA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eOb8/U1A5BGWtv8oNrTzjJsDIe+lbfwXT2idH70Xp6swVsRMUZ1dPvptGT3uxoISO
	 SDcgWWVrT+F5Vu60BevSUUPBiozWthJT9NTkkXeeyWpAdg16X/h0iKKlICUm9v94dl
	 Cm8irhFOUTM2H9OKOKL6977zMHSmYewtSeOFIMJA=
Date: Wed, 18 Nov 2020 13:00:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com>
Message-ID: <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s>
References: <20201118005051.26115-1-sstabellini@kernel.org> <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Nov 2020, Jan Beulich wrote:
> On 18.11.2020 01:50, Stefano Stabellini wrote:
> > 1) It is not obvious that "Configure standard Xen features (expert
> > users)" is actually the famous EXPERT we keep talking about on xen-devel
> 
> Which can be addressed by simply changing the one prompt line.
> 
> > 2) It is not obvious when we need to enable EXPERT to get a specific
> > feature
> > 
> > In particular if you want to enable ACPI support so that you can boot
> > Xen on an ACPI platform, you have to enable EXPERT first. But searching
> > through the kconfig menu it is really not clear (type '/' and "ACPI"):
> > nothing in the description tells you that you need to enable EXPERT to
> > get the option.
> 
> And what causes this to be different once you switch to UNSUPPORTED?

Two things: firstly, it doesn't and shouldn't take an expert to enable
ACPI support, even if ACPI support is experimental. So calling it
UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconfig
options changed by this patch. Secondly, this patch is adding
"(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
it with the option you need to enable.


> > So this patch makes things easier by doing two things:
> > 
> > - introduce a new kconfig option UNSUPPORTED which is clearly to enable
> >   UNSUPPORTED features as defined by SUPPORT.md
> > 
> > - change EXPERT options to UNSUPPORTED where it makes sense: keep
> >   depending on EXPERT for features made for experts
> > 
> > - tag unsupported features by adding (UNSUPPORTED) to the one-line
> >   description
> 
> I am, btw, not fully convinced of the need for this redundancy. Wouldn't
> it be enough to have just EXPERT as a setting, but varying (<reason>)
> tokens in the prompt text?

I don't think so, for the same reasons written above: EXPERT should not
be gating things like ACPI. Moreover, the advantage of the tag in the
oneline prompt is that you can search for an option and figure out that
you need to enable UNSUPPORTED. It doesn't work if we use a different
tag. Just to get the idea, try to do "make menuconfig" and search for
"ARGO" with '/': you'll see "(UNSUPPORTED)". Then, if you search for
"UNSUPPORTED" you can find what you need to enable.


> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -34,8 +34,17 @@ config DEFCONFIG_LIST
> >  	option defconfig_list
> >  	default ARCH_DEFCONFIG
> >  
> > +config UNSUPPORTED
> > +	bool "Configure UNSUPPORTED features"
> > +	help
> > +	  This option allows unsupported Xen options to be enabled, which
> 
> I'd recommend against "enabled" - a control may also be there to allow
> disabling something.

I can change that.


> > +	  includes non-security-supported, experimental, and tech preview
> > +	  features as defined by SUPPORT.md. Xen binaries built with this
> > +	  option enabled are not security supported.
> 
> Overall I'm a little afraid of possible inverse implications: Anything
> _not_ dependent upon this option (and in particular anything not
> dependent upon any Kconfig control) may be considered supported then.
> 
> Also the last sentence is already present for EXPERT, 

I am happy to rephrase it. What about:

"This option allows certain unsupported Xen options to be changed, which
includes non-security-supported, experimental, and tech preview features
as defined by SUPPORT.md."


> > +	default n
> 
> I realize you likely merely copied what EXPERT has, but this "default n"
> is pretty pointless and hence would better be omitted imo.

OK


> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -102,8 +102,8 @@ config HVM
> >  	  If unsure, say Y.
> >  
> >  config XEN_SHSTK
> > -	bool "Supervisor Shadow Stacks"
> > -	depends on HAS_AS_CET_SS && EXPERT
> > +	bool "Supervisor Shadow Stacks (UNSUPPORTED)"
> > +	depends on HAS_AS_CET_SS && UNSUPPORTED
> >  	default y
> 
> Andrew, I think I did ask on v1 already: Do we need to continue to
> consider this unsupported? While perhaps not a change to make right in
> this patch, it should perhaps be a pre-patch then to avoid the need to
> touch it here.

Of course I have no opinion on this. I am happy to do as instructed.


> > @@ -165,7 +165,7 @@ config HVM_FEP
> 
> Seeing just the patch context here, I think HVM_FEP may also want
> converting.

OK


> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -151,7 +151,7 @@ config KEXEC
> >  	  If unsure, say Y.
> >  
> >  config EFI_SET_VIRTUAL_ADDRESS_MAP
> > -    bool "EFI: call SetVirtualAddressMap()" if EXPERT
> > +    bool "EFI: call SetVirtualAddressMap() (UNSUPPORTED)" if UNSUPPORTED
> 
> I have to admit I'm pretty unsure about what to do with this one.

Yeah, similarly to XEN_SHSTK, I don't have an opinion here either.  I am
happy to change it or leave it as.


> > @@ -272,7 +272,7 @@ config LATE_HWDOM
> >  	  If unsure, say N.
> >  
> >  config ARGO
> > -	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
> > +	bool "Argo: hypervisor-mediated interdomain communication (UNSUPPORTED)" if UNSUPPORTED
> 
> Perhaps better (EXPERIMENTAL)?

For this and also the schedulers options below, although it is true that
(EXPERIMENTAL) is a more accurate description, then the problem is that
it is not easy to match against UNSUPPORTED. In other words, if you
search for "ARGO" in make menuconfig and it is marked with
(EXPERIMENTAL), it is not obvious that you need to enable UNSUPPORTED to
get it as an option. For this reason, I think it is better to use
(UNSUPPORTED) both here and below for SCHED_ARINC653 and SCHED_NULL.


> > --- a/xen/common/sched/Kconfig
> > +++ b/xen/common/sched/Kconfig
> > @@ -15,7 +15,7 @@ config SCHED_CREDIT2
> >  	  optimized for lower latency and higher VM density.
> >  
> >  config SCHED_RTDS
> > -	bool "RTDS scheduler support (EXPERIMENTAL)"
> > +	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
> >  	default y
> >  	---help---
> >  	  The RTDS scheduler is a soft and firm real-time scheduler for
> > @@ -23,14 +23,14 @@ config SCHED_RTDS
> >  	  in the cloud, and general low-latency workloads.
> >  
> >  config SCHED_ARINC653
> > -	bool "ARINC653 scheduler support (EXPERIMENTAL)"
> > +	bool "ARINC653 scheduler support (UNSUPPORTED)" if UNSUPPORTED
> >  	default DEBUG
> >  	---help---
> >  	  The ARINC653 scheduler is a hard real-time scheduler for single
> >  	  cores, targeted for avionics, drones, and medical devices.
> >  
> >  config SCHED_NULL
> > -	bool "Null scheduler support (EXPERIMENTAL)"
> > +	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
> >  	default y
> >  	---help---
> >  	  The null scheduler is a static, zero overhead scheduler,
> 
> I'd like to see (EXPERIMENTAL) stay everywhere here.


