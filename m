Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E111DCCC5
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 14:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbkE4-0003Hv-Pd; Thu, 21 May 2020 12:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6UB=7D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbkE2-0003Hq-Uj
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 12:23:02 +0000
X-Inumbo-ID: cffb0806-9b5d-11ea-aafb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cffb0806-9b5d-11ea-aafb-12813bfff9fa;
 Thu, 21 May 2020 12:23:01 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uV5mpF+hvX5MhqHVXPacy/c6Ks9JGV2IiDP3LEu+MtuwbO4aTbvXhxZPHFCVp/6zVapaQDSyPa
 prIMLS9A0PchOBkGfEvWoaemPHIXvazb7kVmt+yTgaooKDN5w00Gi+vmettwazkG4Yl8kCi2dR
 n4LlAzkIWKdDVG0F7wdKZI3W/HIXTkapRU9gdQdhj6YEyETNljHA3KELwLrahsygBIbwSJeH5B
 XD7mVbWyY0G+Ql8jGuwnOWFoO07X9naAiM9aK6n1kZ4VmHtCQkgHFs0NB5AuZuFbo4R84l5zBk
 pVE=
X-SBRS: 2.7
X-MesageID: 18358494
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18358494"
Date: Thu, 21 May 2020 14:22:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
Message-ID: <20200521111441.GS54375@Air-de-Roger>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
 <20200521102636.GR54375@Air-de-Roger>
 <91c7f537-1d0e-4a9d-16a8-c02fa30d2d80@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91c7f537-1d0e-4a9d-16a8-c02fa30d2d80@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 11:32:04AM +0100, Andrew Cooper wrote:
> On 21/05/2020 11:26, Roger Pau Monné wrote:
> > On Thu, May 21, 2020 at 10:04:28AM +0100, Andrew Cooper wrote:
> >> +static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
> >> +                                            mfn_t smfn, unsigned long off)
> >> +{
> >> +    struct page_info *sp = mfn_to_page(smfn);
> >> +
> >> +    ASSERT(mfn_valid(smfn));
> >> +    ASSERT(mfn_valid(gmfn));
> >> +
> >> +    if ( sp->u.sh.type == SH_type_l1_32_shadow ||
> >> +         sp->u.sh.type == SH_type_fl1_32_shadow )
> > Using a switch would also be nice IMO and would avoid some of the code
> > churn.
> 
> Good point.  Happy to do that if Tim agrees (but I won't bother sending
> a v2 just now).

Sure, feel free to keep my RB after that.

Roger.

