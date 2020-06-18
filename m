Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17AB1FF111
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:55:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlt8j-0003iV-WF; Thu, 18 Jun 2020 11:55:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlt8i-0003iQ-4p
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:55:28 +0000
X-Inumbo-ID: 995a614e-b15a-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 995a614e-b15a-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 11:55:27 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CveAVyGHF0CqV5F/97PfNZUCLyjpXZyf5EDwD6GISBNuzu4Q8mr9ZOushC1k0UR/HaqcEWfvL8
 9QZ7FRw47aX84jhFRkSjIg4/k3C6qiwxyFucQCteozJXjvzOY9YA58E5ujHrjob67oIN9altol
 UQjRU1byJUVa/9dpSZM2497mIE39BDW0sZBfzHz/nP1jNVfQCNv8QmSC654skFw3M8d/LS8Bgq
 1kXLHNIJ65KpBtbSy2X1jRqlF4qqkpl+fnxEx3yaaNvSGxcv8CnmMESsnLDk5u9sm8jNh2A//G
 Twc=
X-SBRS: 2.7
X-MesageID: 20706045
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20706045"
Date: Thu, 18 Jun 2020 13:55:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
Message-ID: <20200618115519.GL735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
 <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
 <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 01:01:39PM +0200, Michał Leszczyński wrote:
> ----- 18 cze 2020 o 5:20, Tamas K Lengyel tamas.k.lengyel@gmail.com napisał(a):
> 
> >> >> +
> >> >> +        a.mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
> >> >
> >> > This will not work for translated domains, ie: a PVH or HVM domain
> >> > won't be able to use this interface since it has no way to request the
> >> > mapping of a specific mfn into it's physmap. I think we need to take
> >> > this into account when deciding how the interface should be, so that
> >> > we don't corner ourselves with a PV only interface.
> >>
> >> Please be aware that this is only going to be used by Dom0. Is is well-supported
> >> case that somebody is using PVH/HVM Dom0?
> >>
> >> I think that all Virtual Machine Introspection stuff currently requires to have
> >> Dom0 PV. Our main goal is to have this working well in combo with VMI.
> > 
> > FYI the VMI interface doesn't require a PV domain. It works fine from
> > PVH dom0 or even from a secondary privileged HVM DomU as well,
> > provided you have the right XSM policy to allow that.
> > 
> > Tamas
> 
> 
> It was previously stated that:
> 
> > PVH or HVM domain
> > won't be able to use this interface since it has no way to request the
> > mapping of a specific mfn into it's physmap.
> 
> but however, taking LibVMI as an example:
> 
> https://github.com/libvmi/libvmi/blob/c461e20ae88bc62c08c27f50fcead23c27a30f9e/libvmi/driver/xen/xen.c#L51
> 
> An essential abstraction xen_get_memory() relies on xc_map_foreign_range(). Doesn't this mean that it's not usable from PVH or HVM domains, or did I got it all wrong?

That was my fault, so the buffer mfns are assigned to Xen, and then
the Xen domain ID is used to map those, which should work on both PV
and HVM (or PVH).

I still think using XENMEM_acquire_resource might be better, but I
would let others comment.

Roger.

