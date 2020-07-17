Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2CE223F9C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 17:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwSK5-0005Y2-LT; Fri, 17 Jul 2020 15:30:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwSK4-0005Xx-10
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 15:30:52 +0000
X-Inumbo-ID: 7e89ef2a-c842-11ea-962a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e89ef2a-c842-11ea-962a-12813bfff9fa;
 Fri, 17 Jul 2020 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594999850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E/Y6vhon7fxPLpdTCqwMAVUthBgguDDqdVTF4CfEbdI=;
 b=S8jclhuL2jWxEC95IJs1vcw4NXve097iemzOlpzl9HkYhV1VGbAqcpZm
 2VkBeF2tKQViTskMp9pkHfdKw0j7ZO2bwKgS0XOt2ii98OlpfE9UZa+iJ
 6BptTO42VDUhwydtNGJK0ODt8Uxm/Sar8cBETg0+nC9Czs+2adfVeishr M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7tOY4hBzORPTe8f9Xu7d2hmhQ5C36c+sGod4QaRCBE9Cxmz1DA2eknVe/f4VRa7mbMPhkSH8ZB
 VrHIxk1W/PFkPXfsQ8u9jDAQmVIxqLnvX3E2DwTAm9xOju1o7W6kOVFIFqvlz2ZfhpSk42BXBm
 5R/hzJpCpADBSXuGUH7Ip+NWhyZXpNc2+Ggu1Jtd0HgGgboT4/OinimqimQRarceunp6Hd08rG
 tjnZbWFBH85QeO/Yo/F/MJGw/3Sy6OfRdhOPKaRLh9S6sO5zR1wwIInw/h+Zo5gy30MBpr0NPR
 H/s=
X-SBRS: 2.7
X-MesageID: 22956834
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22956834"
Date: Fri, 17 Jul 2020 17:30:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200717153043.GX7191@Air-de-Roger>
References: <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 03:23:57PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 17 Jul 2020, at 17:05, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Jul 17, 2020 at 02:49:20PM +0000, Bertrand Marquis wrote:
> >> 
> >> 
> >>> On 17 Jul 2020, at 16:41, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Fri, Jul 17, 2020 at 02:34:55PM +0000, Bertrand Marquis wrote:
> >>>> 
> >>>> 
> >>>>> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> 
> >>>>> On 17.07.2020 15:59, Bertrand Marquis wrote:
> >>>>>> 
> >>>>>> 
> >>>>>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>> 
> >>>>>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
> >>>>>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
> >>>>>>>>>> # Emulated PCI device tree node in libxl:
> >>>>>>>>>> 
> >>>>>>>>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> >>>>>>>>> 
> >>>>>>>>> I support Stefano's suggestion for this to be an optional thing, i.e.
> >>>>>>>>> there to be no need for it when there are PCI devices assigned to the
> >>>>>>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
> >>>>>>>>> vpci="ecam" as unambiguous?
> >>>>>>>> 
> >>>>>>>> This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl. 
> >>>>>>> 
> >>>>>>> I'm afraid I don't understand: When there are no PCI device that get
> >>>>>>> handed to a guest when it gets created, but it is supposed to be able
> >>>>>>> to have some assigned while already running, then we agree the option
> >>>>>>> is needed (afaict). When PCI devices get handed to the guest while it
> >>>>>>> gets constructed, where's the problem to infer this option from the
> >>>>>>> presence of PCI devices in the guest configuration?
> >>>>>> 
> >>>>>> If the user wants to use xl pci-attach to attach in runtime a device to a guest, this guest must have a VPCI bus (even with no devices).
> >>>>>> If we do not have the vpci parameter in the configuration this use case will not work anymore.
> >>>>> 
> >>>>> That's what everyone looks to agree with. Yet why is the parameter needed
> >>>>> when there _are_ PCI devices anyway? That's the "optional" that Stefano
> >>>>> was suggesting, aiui.
> >>>> 
> >>>> I agree in this case the parameter could be optional and only required if not PCI device is assigned directly in the guest configuration.
> >>> 
> >>> Where will the ECAM region(s) appear on the guest physmap?
> >>> 
> >>> Are you going to re-use the same locations as on the physical
> >>> hardware, or will they appear somewhere else?
> >> 
> >> We will add some new definitions for the ECAM regions in the guest physmap declared in xen (include/asm-arm/config.h)
> > 
> > I think I'm confused, but that file doesn't contain anything related
> > to the guest physmap, that's the Xen virtual memory layout on Arm
> > AFAICT?
> > 
> > Does this somehow relate to the physical memory map exposed to guests
> > on Arm?
> 
> Yes it does.
> We will add new definitions there related to VPCI to reserve some areas for the VPCI ECAM and the IOMEM areas.

Yes, that's completely fine and is what's done on x86, but again I
feel like I'm lost here, this is the Xen virtual memory map, how does
this relate to the guest physical memory map?

Roger.

