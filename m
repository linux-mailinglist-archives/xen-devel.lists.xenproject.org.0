Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56416225A4D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRSZ-0000BW-P3; Mon, 20 Jul 2020 08:47:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxRSY-0000BQ-Il
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 08:47:42 +0000
X-Inumbo-ID: abd99078-ca65-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abd99078-ca65-11ea-b7bb-bc764e2007e4;
 Mon, 20 Jul 2020 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595234861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mreCaNd/mlst++G9ORStuno43ieESymaTilNMLMFBSs=;
 b=eYY3wf/0lgXPCSa26G+ionIYKI5JQzWrmWwGCBOGk9qeVQ7Mlvt8kNoJ
 jd4O39LV8XLGvRcDgPcUCi9HYQxiJ4ga1D0rHIbM8i3zyg9OwpKbNd2iC
 pAsC0o5TLJj8rwLrkjnXMfCmUOR/0lQ64m9WJdJy9ptVQ8R5I76ZYjATb Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +V+DLRZwkdZX79jGfBPxCUZdjWECpdtsTqMOnq2pFShQUZreEcmERWipS5ef6teRiAIj69d968
 stYzf50x+Br2a9nhK4QYNqLfbQHQroWabOC+WqIqHrJB/EU52+AizGzCsfRi8tLpOTBP3210xq
 etuOFWeyYYRvCF9anUV1tnNsdw0hFOe6UvaBmLD1LxhVAklMX4gOJwXBpRYwY/bbQHGY8fEnck
 jOpieMw33hoUnytawMAjkjb06Pxn4YaGtzIpIctJunFLCxwTV240+8sgY6N7iyIAUgMge3VtMY
 3VY=
X-SBRS: 2.7
X-MesageID: 23583603
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23583603"
Date: Mon, 20 Jul 2020 10:47:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200720084734.GE7191@Air-de-Roger>
References: <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
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
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 05:18:46PM +0100, Julien Grall wrote:
> 
> 
> On 17/07/2020 17:08, Roger Pau Monné wrote:
> > On Fri, Jul 17, 2020 at 03:51:47PM +0000, Bertrand Marquis wrote:
> > > 
> > > 
> > > > On 17 Jul 2020, at 17:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > 
> > > > On Fri, Jul 17, 2020 at 03:23:57PM +0000, Bertrand Marquis wrote:
> > > > > 
> > > > > 
> > > > > > On 17 Jul 2020, at 17:05, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > > > 
> > > > > > On Fri, Jul 17, 2020 at 02:49:20PM +0000, Bertrand Marquis wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > > On 17 Jul 2020, at 16:41, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > > > > > 
> > > > > > > > On Fri, Jul 17, 2020 at 02:34:55PM +0000, Bertrand Marquis wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
> > > > > > > > > > 
> > > > > > > > > > On 17.07.2020 15:59, Bertrand Marquis wrote:
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > > On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > On 17.07.2020 15:14, Bertrand Marquis wrote:
> > > > > > > > > > > > > > On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
> > > > > > > > > > > > > > On 16.07.2020 19:10, Rahul Singh wrote:
> > > > > > > > > > > > > > > # Emulated PCI device tree node in libxl:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I support Stefano's suggestion for this to be an optional thing, i.e.
> > > > > > > > > > > > > > there to be no need for it when there are PCI devices assigned to the
> > > > > > > > > > > > > > guest anyway. I also wonder about the pci_ prefix here - isn't
> > > > > > > > > > > > > > vpci="ecam" as unambiguous?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl.
> > > > > > > > > > > > 
> > > > > > > > > > > > I'm afraid I don't understand: When there are no PCI device that get
> > > > > > > > > > > > handed to a guest when it gets created, but it is supposed to be able
> > > > > > > > > > > > to have some assigned while already running, then we agree the option
> > > > > > > > > > > > is needed (afaict). When PCI devices get handed to the guest while it
> > > > > > > > > > > > gets constructed, where's the problem to infer this option from the
> > > > > > > > > > > > presence of PCI devices in the guest configuration?
> > > > > > > > > > > 
> > > > > > > > > > > If the user wants to use xl pci-attach to attach in runtime a device to a guest, this guest must have a VPCI bus (even with no devices).
> > > > > > > > > > > If we do not have the vpci parameter in the configuration this use case will not work anymore.
> > > > > > > > > > 
> > > > > > > > > > That's what everyone looks to agree with. Yet why is the parameter needed
> > > > > > > > > > when there _are_ PCI devices anyway? That's the "optional" that Stefano
> > > > > > > > > > was suggesting, aiui.
> > > > > > > > > 
> > > > > > > > > I agree in this case the parameter could be optional and only required if not PCI device is assigned directly in the guest configuration.
> > > > > > > > 
> > > > > > > > Where will the ECAM region(s) appear on the guest physmap?
> > > > > > > > 
> > > > > > > > Are you going to re-use the same locations as on the physical
> > > > > > > > hardware, or will they appear somewhere else?
> > > > > > > 
> > > > > > > We will add some new definitions for the ECAM regions in the guest physmap declared in xen (include/asm-arm/config.h)
> > > > > > 
> > > > > > I think I'm confused, but that file doesn't contain anything related
> > > > > > to the guest physmap, that's the Xen virtual memory layout on Arm
> > > > > > AFAICT?
> > > > > > 
> > > > > > Does this somehow relate to the physical memory map exposed to guests
> > > > > > on Arm?
> > > > > 
> > > > > Yes it does.
> > > > > We will add new definitions there related to VPCI to reserve some areas for the VPCI ECAM and the IOMEM areas.
> > > > 
> > > > Yes, that's completely fine and is what's done on x86, but again I
> > > > feel like I'm lost here, this is the Xen virtual memory map, how does
> > > > this relate to the guest physical memory map?
> > > 
> > > Sorry my bad, we will add values in include/public/arch-arm.h, wrong header :-)
> > 
> > Oh right, now I see it :).
> > 
> > Do you really need to specify the ECAM and MMIO regions there?
> 
> You need to define those values somewhere :). The layout is only shared
> between the tools and the hypervisor. I think it would be better if they are
> defined at the same place as the rest of the layout, so it is easier to
> rework the layout.

OK, that's certainly a different approach from what x86 uses, where
the guest memory layout is not defined in the public headers.

On x86 my plan would be to add an hypercall that would set the
position of the ECAM region in the guest physmap, and that would be
called by the toolstack during domain construction.

Roger.

