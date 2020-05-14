Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535D1D36F7
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:51:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZH4t-0000nr-NV; Thu, 14 May 2020 16:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZH4s-0000nm-JA
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:51:22 +0000
X-Inumbo-ID: 23861656-9603-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23861656-9603-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589475082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Pp8JbQ9QRaQeKFHCajjGtu3O0dsndqmSPyyTnO6uZcM=;
 b=Sm8Nuuy8tsaZjklU/2xL1TWnbIJVQ+BM6rAevG3p4OkJi1+2bL1u7crn
 /W05vWopFGlIPoBu+gMjhLhhbmMn4h2mmZcTB3oN2gRMDIBsotqpC65SE
 2iyzlUK3aVwIbwdddWnld8aWZl7NkiS468953g7m07XTcBs3acY3ftKLz o=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: FxyjoXYK6n85q4eEjwyYYn3JqDvM/CftwFVJoxjN67Wex22QrFtaduzZOaRxi91vu2/29fQLKX
 QAvlxjSB/fM+B+zElyLuzixJVjZt7qeJ+IH0+UhkTQdR2AAyGxkyJVmYsKvoah99pc7e0t0yB2
 vY05jaDjOFkFACsA2R7dTsE+gxSOidJ7/y7aA8u6afRcvew8VyV2WoU6YIhlYneqMGj19X+HWh
 IqpHYTR2ZLOllCh2WeorrreQngHio+zDA2QX/cmupdkErBOt+UPjD5MbIkHyQqfVyiOfl8RQAs
 4fU=
X-SBRS: 2.7
X-MesageID: 17818899
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17818899"
Date: Thu, 14 May 2020 18:51:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
Message-ID: <20200514165112.GL54375@Air-de-Roger>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200514131021.GB54375@Air-de-Roger>
 <2e9c7c05-e42c-52d4-f48c-9ecc8b14a1a7@suse.com>
 <20200514153252.GE54375@Air-de-Roger>
 <d166968f-23da-6065-3a90-e0fb0c4f6dcf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d166968f-23da-6065-3a90-e0fb0c4f6dcf@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 05:50:29PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 14.05.2020 17:32, Roger Pau Monné wrote:
> > On Thu, May 14, 2020 at 03:38:18PM +0200, Jan Beulich wrote:
> >> On 14.05.2020 15:10, Roger Pau Monné wrote:
> >>> On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
> >>>> While from just a single Skylake system it is already clear that we
> >>>> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
> >>>> documented to be used for display purposes only anyway), logging this
> >>>> information may still give us some reference in case of problems as well
> >>>> as for future work. Additionally on the AMD side it is unclear whether
> >>>> the deviation between reported and measured frequencies is because of us
> >>>> not doing well, or because of nominal and actual frequencies being quite
> >>>> far apart.
> >>>
> >>> Can you add some reference to the AMD implementation? I've looked at
> >>> the PMs and haven't been able to find a description of some of the
> >>> MSRs, like 0xC0010064.
> >>
> >> Take a look at
> >>
> >> https://developer.amd.com/resources/developer-guides-manuals/
> >>
> >> I'm unconvinced a reference needs adding here.
> > 
> > Do you think it would be sensible to introduce some defines for at
> > least 0xC0010064? (ie: MSR_AMD_PSTATE_DEF_BASE)
> > 
> > I think it would make it easier to find on the manuals.
> 
> I did consider doing so at the time, but dropped the idea as we have
> a few more examples where we use bare MSR numbers when they're used
> just once or very rarely. What I'm not sure about is whether the
> name would help finding the doc - the doc is organized by MSR number
> after all.

I would prefer if we add names as much as possible, as I think it
makes the code easier to understand, but I can also see the point of
that being more churn as you have to end up looking at the manual to
see exactly what each MSR contains anyway.

FTR, I wasn't finding the MSR in the AMD docs because I was searching
as C0010064 when I should be instead using C001_0064.

Thanks, Roger.

