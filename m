Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D11D931B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayLf-0000mu-73; Tue, 19 May 2020 09:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jayLd-0000mp-9M
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:15:41 +0000
X-Inumbo-ID: 4e94195e-99b1-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e94195e-99b1-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 09:15:40 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1pHIIbnBroH8nZ2gt+9TtsMV9EOC+f3vEDrBZtmNBwMGudcB61qlUdykhrhUF/Hyjs3uHVPhP0
 PX0w7F5JGS4Cf4NKcciJcQUxsWeD64nJKc3VqxaGgueRej84m2FgMExDLGNfp7KD6uEkjCkeeN
 HJUh5NBi1P0Vj7Jd+L/deMcHLlyakpy9TnTSc5oiJsPiTPKTIKT1BXxfGLEHf1uM1hCCPGSl+i
 9YFWO8YL6FjxM8mRQVlkxppDjON7dfY+V6S47xIp4yTnlUZiOZOiaU1B7tncrkPumy25uGmXl7
 VQs=
X-SBRS: 2.7
X-MesageID: 17892331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="17892331"
Date: Tue, 19 May 2020 11:15:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
Message-ID: <20200519091532.GB54375@Air-de-Roger>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
 <20200518170904.GY54375@Air-de-Roger>
 <748e3d53-779b-1529-73e8-37f3c2da6e57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <748e3d53-779b-1529-73e8-37f3c2da6e57@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 09:55:38AM +0200, Jan Beulich wrote:
> On 18.05.2020 19:09, Roger Pau Monné wrote:
> > On Wed, Sep 25, 2019 at 05:23:11PM +0200, Jan Beulich wrote:
> >> @@ -310,7 +313,16 @@ int pv_domain_initialise(struct domain *
> >>      /* 64-bit PV guest by default. */
> >>      d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
> >>  
> >> -    d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
> >> +    if ( is_hardware_domain(d) && opt_xpti_hwdom )
> >> +    {
> >> +        d->arch.pv.xpti = true;
> >> +        ++opt_xpti_hwdom;
> >> +    }
> >> +    if ( !is_hardware_domain(d) && opt_xpti_domu )
> >> +    {
> >> +        d->arch.pv.xpti = true;
> >> +        opt_xpti_domu = 2;
> > 
> > I wonder whether a store fence is needed here in order to guarantee
> > that opt_xpti_domu is visible to flush_area_local before proceeding
> > any further with domain creation.
> 
> The changed behavior of flush_area_local() becomes relevant only
> once the new domain runs. This being x86 code, the write can't
> remain invisible for longer than the very latest when the function
> returns, as the store can't be deferred past that (in reality it
> can't be deferred even until after the next [real] function call
> or the next barrier()). And due to x86'es cache coherent nature
> (for WB memory) the moment the store insn completes the new value
> is visible to all other CPUs.

Yes, I think it's fine because this is x86 specific code. A comment
in that regard might be nice, but I'm not going to make this a strong
request.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I also think that turning opt_xpti_domu into a proper atomic and
increasing/decreasing (maybe a cmpxg would be needed) upon PV domain
creation/destruction should be able to accurately keep track of PV
domUs and hence could be used to further reduce the flushes when no PV
domains are running?

Thanks, Roger.

