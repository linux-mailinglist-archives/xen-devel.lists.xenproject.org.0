Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D096B098B6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 02:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047657.1418052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYap-0002RS-1g; Fri, 18 Jul 2025 00:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047657.1418052; Fri, 18 Jul 2025 00:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYao-0002P5-UU; Fri, 18 Jul 2025 00:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1047657;
 Fri, 18 Jul 2025 00:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucYan-0002Oz-4K
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 00:04:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d073c8b6-636a-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 02:04:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E18D5A54130;
 Fri, 18 Jul 2025 00:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D049C4CEE3;
 Fri, 18 Jul 2025 00:04:44 +0000 (UTC)
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
X-Inumbo-ID: d073c8b6-636a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752797085;
	bh=WgwoG/hrjXfA/r9tf0pWHw9+dHUE73jYeB6n7S781z8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IPg2lJqLJhnCWZ+aot8/Y9UFW4y3EjWlwtM0rahjDZWLCi9ArtOhUzk25mMtzvzmv
	 DUr8g9eg5nTIF2NsGoe0IUL5zLtxM9Nx1OWlkbv+AEwWSa7kMVJiZCcm05eQOl09DI
	 bBcGMgRfOAEyGOR/CMW3wgIYcLQX/3TBbhVsuYFUjL/ArZDKa3mihRhellcMG3CC3T
	 KFw1PdPK4Fp2kVO6Wog9M8TvcFZY6PimsCxZAMCe+l3eTgSXWBacq5F6UXb6I55qCm
	 I2L3sx/iPH6enaKNMjhPzp6J/qqJB5EIXv6zee2K3iaHx7gdF6KpojnJLgyp2luzX8
	 ZaKMd2luMqpqA==
Date: Thu, 17 Jul 2025 17:04:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
In-Reply-To: <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171657180.15546@ubuntu-linux-20-04-desktop>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com> <20250717175128.462996-3-alejandro.garciavallejo@amd.com> <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jul 2025, Jason Andryuk wrote:
> On 2025-07-17 13:51, Alejandro Vallejo wrote:
> > Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
> > behaviour on any hwdom/ctldom identical to that dom0 used to have, and
> > make non-dom0 have auto node affinity.
> > 
> > Rename the function to alloc_dom_vcpu0() to reflect this change in
> > scope, and move the prototype to asm/domain.h from xen/domain.h as it's
> > only used in x86.
> > 
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > ---
> >   xen/arch/x86/dom0_build.c             | 12 ++++++++----
> >   xen/arch/x86/include/asm/dom0_build.h |  5 +++++
> >   xen/arch/x86/setup.c                  |  6 ++++--
> >   xen/include/xen/domain.h              |  1 -
> >   4 files changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 0b467fd4a4..dfae7f888f 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
> >       return max_vcpus;
> >   }
> >   -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
> > +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
> >   {
> > -    dom0->node_affinity = dom0_nodes;
> > -    dom0->auto_node_affinity = !dom0_nr_pxms;
> > +    d->auto_node_affinity = true;
> > +    if ( is_hardware_domain(d) || is_control_domain(d) )
> 
> Do we want dom0 options to apply to:
> hardware or control
> just hardware
> just dom0 (hardware && control && xenstore)
> 
> ?
> 
> I think "just dom0" may make the most sense.  My next preference is just
> hardware.  Control I think should be mostly a domU except for having
> is_privileged = true;

Great question. Certainly dom0 options, such as dom0_mem, should not
apply to Control, and certainly they should apply to regular Dom0.

The interesting question is whether they should apply to the Hardware
Domain. Some of the Dom0 options make sense for the Hardware Domain and
there isn't an equivalent config option available via Dom0less bindings.
I am not thinking about the dom0_* options but things like nmi=dom0. For
simplicity and ease of use I would say they should apply to the Hardware
Domain.

In any case, I think the strategy should apply to all architectures.

