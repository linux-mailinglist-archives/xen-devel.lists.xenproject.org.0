Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AD225A4A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRQB-0008VJ-AO; Mon, 20 Jul 2020 08:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxRQA-0008VD-B2
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 08:45:14 +0000
X-Inumbo-ID: 532b2388-ca65-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 532b2388-ca65-11ea-8496-bc764e2007e4;
 Mon, 20 Jul 2020 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595234712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PbeuKBiVc1w7ssIV3A/JAuBmHVDgu/hAvFTol+2DZ/k=;
 b=ewNm4LQLtUE+xEVKWn3Hn4/tNr02k2DFTntOmq/JqpIgGB5dn+rZGOSk
 fIUXB+1LORtWu/DRw8alclNIWzBLlEovlBTrl4xZjqQJ/Az718D36UgCu
 C1gENvlUdQAqtnaBBeoB7fPbrz8myfL3lj9syGwUmDPHt/Xxo5kfHn3VZ g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mT/1Pu38k6EbUUh1OWyaUzNO0NSdqkEjarumAdty/HboMThPar3UlfVr6nGqT8BimzAU0/E80n
 RkJRoinWm3+toV2QAecv5r54uBfjm42/1udGIPI2zDdOqN55vBA0AGPxpQSSKYGLGRC+h3/QAE
 u9KNzerX1jGtWX73FiaoY6Kdeeebher7QPA45oP7SpV4lRYbZaMOz81gmphXTIuFKyd6ML7tMd
 jh5WR4H8QFO46Mp6OjDjEEEgEGXOudRZTAf+55qZu8AoZQUFR/5adNxAfg2X17cPaxuNEXwagM
 Us0=
X-SBRS: 2.7
X-MesageID: 23062239
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23062239"
Date: Mon, 20 Jul 2020 10:45:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200720084505.GD7191@Air-de-Roger>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <20200717143120.GT7191@Air-de-Roger>
 <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
 <20200717155525.GY7191@Air-de-Roger>
 <C150EBE5-5687-4C7D-9EDB-5E4B52782A45@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C150EBE5-5687-4C7D-9EDB-5E4B52782A45@arm.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 18, 2020 at 09:49:43AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 17 Jul 2020, at 17:55, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Jul 17, 2020 at 03:21:57PM +0000, Bertrand Marquis wrote:
> >>> On 17 Jul 2020, at 16:31, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> On Fri, Jul 17, 2020 at 01:22:19PM +0000, Bertrand Marquis wrote:
> >>>>> On 17 Jul 2020, at 13:16, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>>> # Emulated PCI device tree node in libxl:
> >>>>>> 
> >>>>>> Libxl is creating a virtual PCI device tree node in the device tree
> >>>>>> to enable the guest OS to discover the virtual PCI during guest
> >>>>>> boot. We introduced the new config option [vpci="pci_ecam"] for
> >>>>>> guests. When this config option is enabled in a guest configuration,
> >>>>>> a PCI device tree node will be created in the guest device tree.
> >>>>>> 
> >>>>>> A new area has been reserved in the arm guest physical map at which
> >>>>>> the VPCI bus is declared in the device tree (reg and ranges
> >>>>>> parameters of the node). A trap handler for the PCI ECAM access from
> >>>>>> guest has been registered at the defined address and redirects
> >>>>>> requests to the VPCI driver in Xen.
> >>>>> 
> >>>>> Can't you deduce the requirement of such DT node based on the presence
> >>>>> of a 'pci=' option in the same config file?
> >>>>> 
> >>>>> Also I wouldn't discard that in the future you might want to use
> >>>>> different emulators for different devices, so it might be helpful to
> >>>>> introduce something like:
> >>>>> 
> >>>>> pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]
> >>>>> 
> >>>>> For the time being Arm will require backend=vpci for all the passed
> >>>>> through devices, but I wouldn't rule out this changing in the future.
> >>>> 
> >>>> We need it for the case where no device is declared in the config file and the user
> >>>> wants to add devices using xl later. In this case we must have the DT node for it
> >>>> to work. 
> >>> 
> >>> There's a passthrough xl.cfg option for that already, so that if you
> >>> don't want to add any PCI passthrough devices at creation time but
> >>> rather hotplug them you can set:
> >>> 
> >>> passthrough=enabled
> >>> 
> >>> And it should setup the domain to be prepared to support hot
> >>> passthrough, including the IOMMU [0].
> >> 
> >> Isn’t this option covering more then PCI passthrough ?
> >> 
> >> Lots of Arm platform do not have a PCI bus at all, so for those
> >> creating a VPCI bus would be pointless. But you might need to
> >> activate this to pass devices which are not on the PCI bus.
> > 
> > Well, you can check whether the host has PCI support and decide
> > whether to attach a virtual PCI bus to the guest or not?
> > 
> > Setting passthrough=enabled should prepare the guest to handle
> > passthrough, in whatever form is supported by the host IMO.
> 
> True, we could just say that we create a PCI bus if the host has one and
> passthrough is activated.
> But with virtual device point, we might even need one on guest without
> PCI support on the hardware :-)

Sure, but at that point you might want to consider unconditionally
adding an emulated PCI bus to guests anyway.

You will always have time to add new options to xl, but I would start
by trying to make use of the existing ones.

Are you planning to add the logic in Xen to enable hot-plug of devices
right away?

If the implementation hasn't been considered yet I wouldn't mind
leaving all this for later and just focusing on non-hotplug
passthrough using pci = [ ... ] for the time being.

> > 
> >>>>>> Limitation:
> >>>>>> * Need to avoid the “iomem” and “irq” guest config
> >>>>>> options and map the IOMEM region and IRQ at the same time when
> >>>>>> device is assigned to the guest using the “pci” guest config options
> >>>>>> when xl creates the domain.
> >>>>>> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped
> >>>>>> address.
> >>>>> 
> >>>>> It was my understanding that you would identity map the BAR into the
> >>>>> domU stage-2 translation, and that changes by the guest won't be
> >>>>> allowed.
> >>>> 
> >>>> In fact this is not possible to do and we have to remap at a different address
> >>>> because the guest physical mapping is fixed by Xen on Arm so we must follow
> >>>> the same design otherwise this would only work if the BARs are pointing to an
> >>>> address unused and on Juno this is for example conflicting with the guest
> >>>> RAM address.
> >>> 
> >>> This was not clear from my reading of the document, could you please
> >>> clarify on the next version that the guest physical memory map is
> >>> always the same, and that BARs from PCI devices cannot be identity
> >>> mapped to the stage-2 translation and instead are relocated somewhere
> >>> else?
> >> 
> >> We will.
> >> 
> >>> 
> >>> I'm then confused about what you do with bridge windows, do you also
> >>> trap and adjust them to report a different IOMEM region?
> >> 
> >> Yes this is what we will have to do so that the regions reflect the VPCI mappings
> >> and not the hardware one.
> >> 
> >>> 
> >>> Above you mentioned that read-only access was given to bridge
> >>> registers, but I guess some are also emulated in order to report
> >>> matching IOMEM regions?
> >> 
> >> yes that’s exact. We will clear this in the next version.
> > 
> > If you have to go this route for domUs, it might be easier to just
> > fake a PCI host bridge and place all the devices there even with
> > different SBDF addresses. Having to replicate all the bridges on the
> > physical PCI bus and fixing up it's MMIO windows seems much more
> > complicated than just faking/emulating a single bridge?
> 
> That’s definitely something we have to dig more on. The whole problematic
> of PCI enumeration and BAR value assignation in Xen might be pushed to
> either Dom0 or the firmware but we might in fact find ourself with exactly the
> same problem on the VPCI bus.

Not really, in order for Xen to do passthrough to a guest it must know
the SBDF of a device, the resources it's using and the memory map of
the guest, or else passthrough can't be done.

At that point Xen has the whole picture and can decide where the
resources of the device should appear on the stage-2 translation, and
hence the IOMEM windows required on the bridge(s).

What I'm trying to say is that I'm not convinced that exposing all the
host PCI bridges with adjusted IOMEM windows is easier than just
completely faking (and emulating) a PCI bridge inside of Xen.

Roger.

