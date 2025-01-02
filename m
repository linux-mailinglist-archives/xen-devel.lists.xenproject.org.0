Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ACE9FFE77
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 19:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864390.1275597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQ1A-0002s6-7f; Thu, 02 Jan 2025 18:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864390.1275597; Thu, 02 Jan 2025 18:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQ1A-0002pv-4u; Thu, 02 Jan 2025 18:34:00 +0000
Received: by outflank-mailman (input) for mailman id 864390;
 Thu, 02 Jan 2025 18:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTQ19-0002pl-7O
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 18:33:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f066569-c938-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 19:33:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEDB25C5DD0;
 Thu,  2 Jan 2025 18:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7A7C4CED0;
 Thu,  2 Jan 2025 18:33:51 +0000 (UTC)
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
X-Inumbo-ID: 1f066569-c938-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842833;
	bh=aNNAO+e1hIDqXmbnqnM3cUCzuV82ejnk910HtDQjsLs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q2uUrM0uyGH/nC1oJao/VZFjU4VJjHnoHkEF3bKiqGzCnw1A229eGMYlso+Yc4Spg
	 tn/oM1ZV86vpsE7LCz5fwVMAXjiG/GAi67GOjzjaQ/q3Y6V6hDZG1/uu5hx4+M1Tz2
	 mKhKRl84w3SUpBJIu7mO0QHIfzQhl4xFXZdkp7ms5pNDTwRJqbwbnxn++jvXwUO5Ye
	 g6QTM4EoXpj+b901MrVfkqFA5ARVY0xfclOQwpd3X82Fnbdd1d/qu79zlWWpc/zmmO
	 FWnh53KqP9ssMQjavedqFPc0Y+MnqD5HqOaPDuj7DijyL2WtLNrcHJzR1bu0IwV9av
	 VkQTge48BcTBA==
Date: Thu, 2 Jan 2025 10:33:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] xen: introduce kconfig options to disable
 hypercalls
In-Reply-To: <735f8d30-5f42-4fa6-acb0-f82b5b759183@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501021033440.16425@ubuntu-linux-20-04-desktop>
References: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com> <735f8d30-5f42-4fa6-acb0-f82b5b759183@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Dec 2024, Jan Beulich wrote:
> On 19.12.2024 10:29, Sergiy Kibrik wrote:
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -74,12 +74,12 @@ obj-y += hpet.o
> >  obj-y += vm_event.o
> >  obj-y += xstate.o
> >  
> > -ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> > -obj-y += domctl.o
> > +obj-$(CONFIG_DOMCTL) += domctl.o
> > +ifeq ($(CONFIG_PLATFORM_OP),y)
> >  obj-y += platform_hypercall.o
> >  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> > -obj-y += sysctl.o
> >  endif
> 
> Personally I'd prefer if we avoided ifeq here:
> 
> obj-$(CONFIG_PLATFORM_OP) += platform_hypercall.o
> obj-$(filter $(CONFIG_COMPAT),$(CONFIG_PLATFORM_OP)) += x86_64/platform_hypercall.o
> 
> Yet I realize this (once again) may be contentious.
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -516,4 +516,33 @@ config TRACEBUFFER
> >  	  to be collected at run time for debugging or performance analysis.
> >  	  Memory and execution overhead when not active is minimal.
> >  
> > +menu "Supported hypercall interfaces"
> > +	visible if DOM0LESS_BOOT && EXPERT
> > +
> > +config SYSCTL
> > +	bool "Enable sysctl hypercall"
> > +	depends on !PV_SHIM_EXCLUSIVE
> > +	default y
> > +
> > +config DOMCTL
> > +	bool "Enable domctl hypercalls"
> > +	depends on !PV_SHIM_EXCLUSIVE
> > +	default y
> > +
> > +config HVM_OP
> > +	bool "Enable HVM hypercalls"
> > +	depends on HVM
> > +	default y
> > +
> > +config PLATFORM_OP
> > +	bool "Enable platform hypercalls"
> > +	depends on !PV_SHIM_EXCLUSIVE
> > +	default y
> 
> Just to re-iterate an earlier comment: Andrew (imo validly) raised concern of
> such negative dependencies. As said before, imo we'd better resolve that before
> extending the issue (whether by the patch I once sent or something else is then
> secondary).

How would you express the !PV_SHIM_EXCLUSIVE dependency without using
negative dependencies?


> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -66,10 +66,10 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
> >  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
> >  
> >  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> > -obj-y += domctl.o
> >  obj-y += monitor.o
> > -obj-y += sysctl.o
> >  endif
> > +obj-$(CONFIG_DOMCTL) += domctl.o
> > +obj-$(CONFIG_SYSCTL) += sysctl.o
> 
> These two then want to move back up into their normal slots.
> 
> Jan
> 

