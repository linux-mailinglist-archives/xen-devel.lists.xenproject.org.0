Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACBA22EAD7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 13:07:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k00yB-0006Le-9D; Mon, 27 Jul 2020 11:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k00y9-0006LZ-SV
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 11:06:57 +0000
X-Inumbo-ID: 48782d66-cff9-11ea-8a94-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48782d66-cff9-11ea-8a94-bc764e2007e4;
 Mon, 27 Jul 2020 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595848015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RTz+nVHoLnPbUmm2hTSMnM8sFKDVo+OtCBZA0WSy5vY=;
 b=J+1w66Xzj5tgun+ibOvlHDKaLK2SAwr5faNhAGFfhamc4lH1cnicUdsz
 KOxhcBrw3TZjFEi1kUH/Gn1TGYTssbyJeWTo4plUtTa4r+Q3nQtX7wkt1
 S3r7Xa05+WZlDjnjgfwnECcPW7ngrRel7lUmk3gDMDfmATy4kpj148R9F w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XmJ2jXUvBWAReMg+BECCyeFQZXofy6EVvsx0zrqlH4bdjSp6cTPNOOrc4P45LI0niJwO2BqQP2
 uhg2cbgnktw54MTjFoh6m+ebwPPQazKX/EYkqF1IcY76NAWrgeErrSG/6XC4CsO8brmbTVkk0+
 fEQFYmPgsJhJEpOGkv9DVK2OzSSJMjNzQ6Q1RELvb/VZM79tJpmBNfPAYaXhbigDogmI+/npNh
 19p9fBlJyy0AjnQn8FOxCamUiVOs6+FTQBm9tCHiZ425YXouZimZ95ZCMeU94DHdZuhc/HUUoU
 z0g=
X-SBRS: 2.7
X-MesageID: 23571136
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23571136"
Date: Mon, 27 Jul 2020 13:06:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200727110648.GQ7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
 <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3dXSnEBvhkHkZzV9URAGqSfdtJ1Lc838h_ViAWG3ZO4g@mail.gmail.com>
 <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1RWXq3EN5DC=_279yzdsq3M0nw6+CZtKD00yBzKomcaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAJ=z9a1RWXq3EN5DC=_279yzdsq3M0nw6+CZtKD00yBzKomcaw@mail.gmail.com>
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
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 25, 2020 at 10:59:50AM +0100, Julien Grall wrote:
> On Sat, 25 Jul 2020 at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Fri, 24 Jul 2020, Julien Grall wrote:
> > > On Fri, 24 Jul 2020 at 19:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > > > If they are not equal, then I fail to see why it would be useful to have this
> > > > > value in Xen.
> > > >
> > > > I think that's because the domain is actually more convenient to use
> > > > because a segment can span multiple PCI host bridges. So my
> > > > understanding is that a segment alone is not sufficient to identify a
> > > > host bridge. From a software implementation point of view it would be
> > > > better to use domains.
> > >
> > > AFAICT, this would be a matter of one check vs two checks in Xen :).
> > > But... looking at Linux, they will also use domain == segment for ACPI
> > > (see [1]). So, I think, they still have to use (domain, bus) to do the lookup.

You have to use the (segment, bus) tuple when doing a lookup because
MMCFG regions on ACPI are defined for a segment and a bus range, you
can have a MMCFG region that covers segment 0 bus [0, 20) and another
MMCFG region that covers segment 0 bus [20, 255], and those will use
different addresses in the MMIO space.

> > > > > In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
> > > > > Dom0 and Xen can synchronize on the segment number.
> > > >
> > > > I was hoping we could write down the assumption somewhere that for the
> > > > cases we care about domain == segment, and error out if it is not the
> > > > case.
> > >
> > > Given that we have only the domain in hand, how would you enforce that?
> > >
> > > >From this discussion, it also looks like there is a mismatch between the
> > > implementation and the understanding on QEMU devel. So I am a bit
> > > concerned that this is not stable and may change in future Linux version.
> > >
> > > IOW, we are know tying Xen to Linux. So could we implement
> > > PHYSDEVOP_pci_mmcfg_reserved *or* introduce a new property that
> > > really represent the segment?
> >
> > I don't think we are tying Xen to Linux. Rob has already said that
> > linux,pci-domain is basically a generic device tree property.
> 
> My concern is not so much the name of the property, but the definition of it.
> 
> AFAICT, from this thread there can be two interpretation:
>       - domain == segment
>       - domain == (segment, bus)

I think domain is just an alias for segment, the difference seems to
be that when using DT all bridges get a different segment (or domain)
number, and thus you will always end up starting numbering at bus 0
for each bridge?

Ideally you would need a way to specify the segment and start/end bus
numbers of each bridge, if not you cannot match what ACPI does. Albeit
it might be fine as long as the OS and Xen agree on the segments and
bus numbers that belong to each bridge (and thus each ECAM region).

Roger.

