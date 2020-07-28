Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD2230576
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 10:33:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0L32-0006DA-H3; Tue, 28 Jul 2020 08:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0L30-0006D5-Pq
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 08:33:18 +0000
X-Inumbo-ID: fbbd6f91-d0ac-11ea-a87c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbbd6f91-d0ac-11ea-a87c-12813bfff9fa;
 Tue, 28 Jul 2020 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595925197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lNz5oGkBC9VwfOlKxTcc5WvkTjpWiXUIUwt5aAYRs28=;
 b=P5xn5s/VrtgFjimmSL9q93AbLNZDDJHy/n/AQhF0wICD1cTiY6lzXvet
 KGVhFyjCX/3ojPXU9JmgAScokM6x+9jvzRIumsDeNRbgAviYHEidndZdN
 jK3hiXIJw/EskyHchhu/l3YmGTOpVNJpA4k3FxBbDD5ql4qB1Z2cHERh2 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H/Ozf1HpDxwGYEK6VLwK1rYT9cV4P5QSSC8TJ8thbt/zQI8veXbRPFickjKgsu7s6/VdN2PcLX
 wW7oVzwolAAYeUSXXrwfaaYMuMC9EX0GiBNMPkzuPXCbUbaO+Ochmw3dxC9k2x86emMhncxVbh
 gxPOIojptryf3hC+5jAgFvGSKubx34hDJAGLu4twjN2kGG6pypJsTFRw9KtJl9uolyK0A5aGSC
 0gsi4FfMabmnZcm/mR1Jc04MHoPw7+jjaJ4Ua9YXJXFwXXTQs6ZHkpK+fkhLe1k2s+bAC+ILP0
 XVQ=
X-SBRS: 2.7
X-MesageID: 23655971
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="23655971"
Date: Tue, 28 Jul 2020 10:33:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200728083310.GW7191@Air-de-Roger>
References: <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
 <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3dXSnEBvhkHkZzV9URAGqSfdtJ1Lc838h_ViAWG3ZO4g@mail.gmail.com>
 <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1RWXq3EN5DC=_279yzdsq3M0nw6+CZtKD00yBzKomcaw@mail.gmail.com>
 <20200727110648.GQ7191@Air-de-Roger>
 <alpine.DEB.2.21.2007271411000.27071@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2007271411000.27071@sstabellini-ThinkPad-T480s>
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
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 05:06:25PM -0700, Stefano Stabellini wrote:
> On Mon, 27 Jul 2020, Roger Pau Monné wrote:
> > On Sat, Jul 25, 2020 at 10:59:50AM +0100, Julien Grall wrote:
> > > On Sat, 25 Jul 2020 at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > >
> > > > On Fri, 24 Jul 2020, Julien Grall wrote:
> > > > > On Fri, 24 Jul 2020 at 19:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > > > > > If they are not equal, then I fail to see why it would be useful to have this
> > > > > > > value in Xen.
> > > > > >
> > > > > > I think that's because the domain is actually more convenient to use
> > > > > > because a segment can span multiple PCI host bridges. So my
> > > > > > understanding is that a segment alone is not sufficient to identify a
> > > > > > host bridge. From a software implementation point of view it would be
> > > > > > better to use domains.
> > > > >
> > > > > AFAICT, this would be a matter of one check vs two checks in Xen :).
> > > > > But... looking at Linux, they will also use domain == segment for ACPI
> > > > > (see [1]). So, I think, they still have to use (domain, bus) to do the lookup.
> > 
> > You have to use the (segment, bus) tuple when doing a lookup because
> > MMCFG regions on ACPI are defined for a segment and a bus range, you
> > can have a MMCFG region that covers segment 0 bus [0, 20) and another
> > MMCFG region that covers segment 0 bus [20, 255], and those will use
> > different addresses in the MMIO space.
> 
> Thanks for the clarification!
> 
> 
> > > > > > > In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
> > > > > > > Dom0 and Xen can synchronize on the segment number.
> > > > > >
> > > > > > I was hoping we could write down the assumption somewhere that for the
> > > > > > cases we care about domain == segment, and error out if it is not the
> > > > > > case.
> > > > >
> > > > > Given that we have only the domain in hand, how would you enforce that?
> > > > >
> > > > > >From this discussion, it also looks like there is a mismatch between the
> > > > > implementation and the understanding on QEMU devel. So I am a bit
> > > > > concerned that this is not stable and may change in future Linux version.
> > > > >
> > > > > IOW, we are know tying Xen to Linux. So could we implement
> > > > > PHYSDEVOP_pci_mmcfg_reserved *or* introduce a new property that
> > > > > really represent the segment?
> > > >
> > > > I don't think we are tying Xen to Linux. Rob has already said that
> > > > linux,pci-domain is basically a generic device tree property.
> > > 
> > > My concern is not so much the name of the property, but the definition of it.
> > > 
> > > AFAICT, from this thread there can be two interpretation:
> > >       - domain == segment
> > >       - domain == (segment, bus)
> > 
> > I think domain is just an alias for segment, the difference seems to
> > be that when using DT all bridges get a different segment (or domain)
> > number, and thus you will always end up starting numbering at bus 0
> > for each bridge?
> >
> > Ideally you would need a way to specify the segment and start/end bus
> > numbers of each bridge, if not you cannot match what ACPI does. Albeit
> > it might be fine as long as the OS and Xen agree on the segments and
> > bus numbers that belong to each bridge (and thus each ECAM region).
> 
> That is what I thought and it is why I was asking to clarify the naming
> and/or writing a document to explain the assumptions, if any.
> 
> Then after Julien's email I followed up in the Linux codebase and
> clearly there is a different assumption baked in the Linux kernel for
> architectures that have CONFIG_PCI_DOMAINS enabled (including ARM64).
> 
> The assumption is that segment == domain == unique host bridge. It
> looks like it is coming from IEEE Std 1275-1994 but I am not certain.
> In fact, it seems that ACPI MCFG and IEEE Std 1275-1994 don't exactly
> match. So I am starting to think that domain == segment for IEEE Std
> 1275-1994 compliant device tree based systems.

I don't think the ACPI MCFG spec contains the notion of bridges, it
just describes ECAM (or MMCFG) regions, but those could be made up by
concatenating different bridge ECAM regions by the firmware itself, so
you could AFAICT end up with multiple bridges being aggregated into a
single ECAM region, and thus using the same segment number, which
seems not possible with the DT spec, where each bridge must get a
different segment number?

If you could assign both a segment number and a bus start and end
values to a bridge then I think it would be kind of equivalent to ACPI
MCFG.

I assume we would never support a system where Xen is getting the
hardware description from a DT and the hardware domain is using ACPI
(or the other way around)?

If so, I don't think we care that enumeration when using DT is
different than when using ACPI, as we can only guarantee consistency
when both Xen and the hardware domain use the same source for the
hardware description.

If when using DT each bridge has a unique segment number that's fine
as long as Xen and the OS agree to not change such values.

Roger.

