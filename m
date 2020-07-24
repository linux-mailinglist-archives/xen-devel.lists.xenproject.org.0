Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62022C942
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 17:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyzdL-0000op-Du; Fri, 24 Jul 2020 15:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyzdK-0000of-7f
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 15:29:14 +0000
X-Inumbo-ID: 6ccacbd0-cdc2-11ea-883a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ccacbd0-cdc2-11ea-883a-bc764e2007e4;
 Fri, 24 Jul 2020 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595604552;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mOKcmmxpsrXCrY+JiEtPT3ajvKxHswL3c+g4nrs4kFQ=;
 b=NZrhV9IGnZYqOrMertRPK/Ppt28gXzWynZWaxey21ohuxdCnaMPeO9+8
 FXYXcmmlPOC0z+WwujQmUNcBxD5OPWqjaIs1VLuVrcmy53SqtUitnV8gz
 oIGukE27+GEfqIcX0gf1zSHXUVq4GNfAeHVDqTUBmtPBoMwTAiTv6YxnT A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: a6NR0R5HA19khLegae+/VhED3/JNuA+FuS7znJ7LtzUAiIOal32pm2NM05SCYP2TgkgUCewOYg
 o5HX1bnSdZDx3lLRiO5JAtgWhz1q5NHOIiZdM7o+PJ2Z8tjRftfmysF4m2GZOZQEuxgrCxZjY5
 Evu4X87WTWdKoucOSzsqBG9/l0qhmK4RbkqoznodYds2jz1dtZTgt6Ug3+JuTKMVE/2Wdl3VM4
 3bR8APEjZzxlmpwEbiLnNW2ClpNMrlO17qIIR76O/Cu+jRFgCjORhVR8zMbz18P3rfzp+7pq9I
 /Ss=
X-SBRS: 2.7
X-MesageID: 23464643
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23464643"
Date: Fri, 24 Jul 2020 17:29:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200724152905.GM7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
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
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 24, 2020 at 04:15:47PM +0100, Julien Grall wrote:
> 
> 
> On 24/07/2020 15:44, Roger Pau Monné wrote:
> > > diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> > > new file mode 100644
> > > index 0000000000..358508b787
> > > --- /dev/null
> > > +++ b/xen/arch/arm/pci/Makefile
> > > @@ -0,0 +1,4 @@
> > > +obj-y += pci.o
> > > +obj-y += pci-host-generic.o
> > > +obj-y += pci-host-common.o
> > > +obj-y += pci-access.o
> > 
> > The Kconfig option mentions the support being explicitly for ARM64,
> > would it be better to place the code in arch/arm/arm64 then?
> I don't believe any of the code in this series is very arm64 specific. I
> guess it was just only tested on arm64. So I would rather keep that under
> arm/pci.

Ack. Could the Kconfg be adjusted to not depend on ARM_64? Just
stating it's only been tested on Arm64 would be enough IMO.

> > > +
> > > +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> > > +
> > > +    if ( unlikely(!bridge) )
> > > +    {
> > > +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> > > +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> > 
> > I had a patch to add a custom modifier to out printf format in
> > order to handle pci_sbdf_t natively:
> > 
> > https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
> > 
> > It missed maintainers Acks and was never committed. Since you are
> > doing a bunch of work here, and likely adding a lot of SBDF related
> > prints, feel free to import the modifier (%pp) and use in your code
> > (do not attempt to switch existing users, or it's likely to get
> > stuck again).
> 
> I forgot about this patch :/. It would be good to revive it. Which acks are
> you missing?

I only had an Ack from Jan, so I was missing Intel and AMD Acks, which
would now only be Intel since AMD has been absorbed by the x86
maintainers.

> [...]
> 
> > > +static bool __init dt_pci_parse_bus_range(struct dt_device_node *dev,
> > > +        struct pci_config_window *cfg)
> > > +{
> > > +    const __be32 *cells;
> > 
> > It's my impression that while based on Linux this is not a verbatim
> > copy of a Linux file, and tries to adhere with the Xen coding style.
> > If so please use uint32_t here.
> 
> uint32_t would be incorrect because this is a 32-bit value always in big
> endian. I don't think we have other typedef to show it is a 32-bit BE value,
> so __be32 is the best choice.

Oh, OK, so this is done to explicitly denote the endianness of a value
on the type itself.

> [...]
> 
> > > +
> > > +    if ( acpi_disabled )
> > > +        dt_pci_init();
> > > +    else
> > > +        acpi_pci_init();
> > 
> > Isn't there an enum or something that tells you whether the system
> > description is coming from ACPI or from DT?
> > 
> > This if .. else seems fragile.
> > 
> 
> This is the common way we do it on Arm.... I would welcome any improvement,
> but I don't think this should be part of this work.

Ack. In any case I think for ACPI PCI init will get called by
acpi_mmcfg_init as part of acpi_boot_init, so I'm not sure there's
much point in having something about ACPI added here, as it seems this
will be DT only?

Roger.

