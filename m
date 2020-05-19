Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9E1D93DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:54:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayx5-0004ie-0b; Tue, 19 May 2020 09:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jayx3-0004iZ-Ga
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:54:21 +0000
X-Inumbo-ID: b3c9da2a-99b6-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3c9da2a-99b6-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 09:54:17 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: acHlKOzi/GU3AFK/PYajOqurCDz9Ig7JzGYMxy7rbLqbk+GrUT3jOq3vvki/7qQoLmgjBRtc9+
 tsRZ+g6Pr/tzPcoqg5zNWv+ujs4KkQl/9HFNgYl2VqMAGfAYJIaqpYUYDkBTXdJq+cm4BkmBYo
 R36hlH83AdSFmwbrI4VV6oMjBHPQvQsEADDYLLRL/5+YP8Sc9LHgyx72ZWtEPq6KhqEe+r6uoW
 kld8cmjTgwy2bMnGJohhn/Q4dW6pSqnk9N0mm8F9Y/ryonevu07ORtXsf/lZyOSN3no6IFPnym
 hGo=
X-SBRS: 2.7
X-MesageID: 18142236
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="18142236"
Date: Tue, 19 May 2020 11:54:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200519095407.GE54375@Air-de-Roger>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
 <20200517173259.GA7285@antioche.eu.org>
 <20200517175607.GA8793@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200517175607.GA8793@antioche.eu.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, May 17, 2020 at 07:56:07PM +0200, Manuel Bouyer wrote:
> On Sun, May 17, 2020 at 07:32:59PM +0200, Manuel Bouyer wrote:
> > I've been looking a bit deeper in the Xen kernel.
> > The mapping is failed in ./arch/x86/mm/p2m.c:p2m_get_page_from_gfn(),
> >         /* Error path: not a suitable GFN at all */
> > 	if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) ) {
> > 	    gdprintk(XENLOG_ERR, "p2m_get_page_from_gfn2: %d is_ram %ld is_paging %ld is_pod %ld\n", *t, p2m_is_ram(*t), p2m_is_paging(*t), p2m_is_pod(*t) );
> > 	    return NULL;
> > 	}
> > 
> > *t is 4, which translates to p2m_mmio_dm
> > 
> > it looks like p2m_get_page_from_gfn() is not ready to handle this case
> > for dom0.
> 
> And so it looks like I need to implement osdep_xenforeignmemory_map_resource()
> for NetBSD

FWIW, FreeBSD doesn't have osdep_xenforeignmemory_map_resource
implemented and still works fine with 4.13.0 (is able to create HVM
guests), but that's a PVH dom0, not a PV one.

Regards, Roger.

