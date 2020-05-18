Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D221D7D37
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahxR-0005fz-Fw; Mon, 18 May 2020 15:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGN6=7A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jahxQ-0005fu-EH
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:45:36 +0000
X-Inumbo-ID: 9cdf7ec0-991e-11ea-a876-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cdf7ec0-991e-11ea-a876-12813bfff9fa;
 Mon, 18 May 2020 15:45:35 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BZjX5jd/1oAlfihWH2kFAnCKLcmxMsfDuQ/Ug/4xxaT+ZR72b5g3Kbi6IW6RvNv/BrvFW+Di8Y
 2ebxCkEg93EX/saXzY2cJUas5US0GmJTD4M9/8HE1TeiMbnDR8WjScR+f1I9Jp7/tWjKIp4ivr
 CSb0rmg7fc4qn7vurx/sv6falyz8PaXgkylpFOkAvjuB/VUwIRi/xDYcGwbPXXimtMJBo6B419
 JP+kkJ4MzvC9ljJ/V9RsJl6/pNiU11WJgd/1TksWwcjGe3dEsKZ5i80xENI+IH0EP1ps78MiO+
 RGY=
X-SBRS: 2.7
X-MesageID: 18080382
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18080382"
Date: Mon, 18 May 2020 17:45:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Message-ID: <20200518154527.GW54375@Air-de-Roger>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
 <e9e337ae-295e-5577-3c6d-a42721190b07@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e9e337ae-295e-5577-3c6d-a42721190b07@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 05:05:12PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 15.05.2020 15:58, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -652,6 +652,15 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
> >  additionally a trace buffer of the specified size is allocated per cpu.
> >  The debug trace feature is only enabled in debugging builds of Xen.
> >  
> > +### disable-c6-errata
> 
> Hmm, yes please - a disable for errata! ;-)
> 
> How about "avoid-c6-errata", and then perhaps as a sub-option to
> "cpuidle="? (If we really want a control for this in the first
> place.)

Right, I see I'm very bad at naming. Not sure it's even worth it
maybe?

I can remove it completely from the patch if that is OK.

Thanks, Roger.

