Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70516429790
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 21:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206516.362111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma0xu-0000c6-OX; Mon, 11 Oct 2021 19:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206516.362111; Mon, 11 Oct 2021 19:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma0xu-0000Yy-Kf; Mon, 11 Oct 2021 19:28:02 +0000
Received: by outflank-mailman (input) for mailman id 206516;
 Mon, 11 Oct 2021 19:28:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma0xt-0000Ys-6c
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 19:28:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a777ce03-fb62-44c7-8d60-4ecab70e03ff;
 Mon, 11 Oct 2021 19:27:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95F7E60555;
 Mon, 11 Oct 2021 19:27:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a777ce03-fb62-44c7-8d60-4ecab70e03ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633980479;
	bh=d02FKdswlvpJ3+XHcAlVdRCv/88Vs0zDcQacreicA/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qcpb7unluM5R+OqOVECf85826qSXF1ZVjL1K73+6QP7288NL6wWr9pRAVLygGszBA
	 6u7hO0/ypqnJD0SO48umFEoKvpo24cEdxCa3/hUR/AKCHlP0YdV1ERt39urNL/ohpJ
	 bhvzoOT+GbtnsvgW6jbXGFNB/DmEhIcSaLARwg7pyOvSgNTeUxtt1aymfkF/3gjVuL
	 2JgM6Co2+XksASPw8463vTPx3xkQd1/JLdpxkcqju8ZctdB14twV9JtMrKest+ni9h
	 RT638vOE+fjiLgUvl0389/2w674MlxajgvEKno2cBWJrV8IAPfCuujrp1JsWHR88rI
	 X6M0Hd9sNfY2Q==
Date: Mon, 11 Oct 2021 12:27:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <611b61a4-9635-f1e6-a078-e40d4cbd49fd@epam.com>
Message-ID: <alpine.DEB.2.21.2110111226220.25528@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com> <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local> <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com> <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
 <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local> <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com> <611b61a4-9635-f1e6-a078-e40d4cbd49fd@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1433164912-1633980479=:25528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1433164912-1633980479=:25528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Oct 2021, Oleksandr Andrushchenko wrote:
> On 11.10.21 20:15, Bertrand Marquis wrote:
> > Hi Roger,
> >
> >> On 11 Oct 2021, at 17:43, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>
> >> On Mon, Oct 11, 2021 at 04:20:14PM +0000, Oleksandr Andrushchenko wrote:
> >>>
> >>> On 11.10.21 19:12, Bertrand Marquis wrote:
> >>>> Hi Roger,
> >>>>
> >>>>> On 11 Oct 2021, at 11:51, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>>
> >>>>> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> >>>>>> The existing VPCI support available for X86 is adapted for Arm.
> >>>>>> When the device is added to XEN via the hyper call
> >>>>>> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> >>>>>> access is added to the Xen to emulate the PCI devices config space.
> >>>>>>
> >>>>>> A MMIO trap handler for the PCI ECAM space is registered in XEN
> >>>>>> so that when guest is trying to access the PCI config space,XEN
> >>>>>> will trap the access and emulate read/write using the VPCI and
> >>>>>> not the real PCI hardware.
> >>>>>>
> >>>>>> For Dom0less systems scan_pci_devices() would be used to discover the
> >>>>>> PCI device in XEN and VPCI handler will be added during XEN boots.
> >>>>>>
> >>>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>>>> ---
> >>>>>> Change in v5:
> >>>>>> - Add pci_cleanup_msi(pdev) in cleanup part.
> >>>>>> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>>>> Change in v4:
> >>>>>> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> >>>>>> Change in v3:
> >>>>>> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> >>>>>> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> >>>>>> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> >>>>>> Change in v2:
> >>>>>> - Add new XEN_DOMCTL_CDF_vpci flag
> >>>>>> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> >>>>>> - enable vpci support when pci-passthough option is enabled.
> >>>>>> ---
> >>>>>> ---
> >>>>>> xen/arch/arm/Makefile         |   1 +
> >>>>>> xen/arch/arm/domain.c         |   4 ++
> >>>>>> xen/arch/arm/domain_build.c   |   3 +
> >>>>>> xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
> >>>>>> xen/arch/arm/vpci.h           |  36 ++++++++++++
> >>>>>> xen/drivers/passthrough/pci.c |  18 ++++++
> >>>>>> xen/include/asm-arm/domain.h  |   7 ++-
> >>>>>> xen/include/asm-x86/pci.h     |   2 -
> >>>>>> xen/include/public/arch-arm.h |   7 +++
> >>>>>> xen/include/xen/pci.h         |   2 +
> >>>>>> 10 files changed, 179 insertions(+), 3 deletions(-)
> >>>>>> create mode 100644 xen/arch/arm/vpci.c
> >>>>>> create mode 100644 xen/arch/arm/vpci.h
> >>>>>>
> >>>>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> >>>>>> index 44d7cc81fa..fb9c976ea2 100644
> >>>>>> --- a/xen/arch/arm/Makefile
> >>>>>> +++ b/xen/arch/arm/Makefile
> >>>>>> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
> >>>>>> obj-y += platforms/
> >>>>>> endif
> >>>>>> obj-$(CONFIG_TEE) += tee/
> >>>>>> +obj-$(CONFIG_HAS_VPCI) += vpci.o
> >>>>>>
> >>>>>> obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> >>>>>> obj-y += bootfdt.init.o
> >>>>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >>>>>> index 36138c1b2e..fbb52f78f1 100644
> >>>>>> --- a/xen/arch/arm/domain.c
> >>>>>> +++ b/xen/arch/arm/domain.c
> >>>>>> @@ -39,6 +39,7 @@
> >>>>>> #include <asm/vgic.h>
> >>>>>> #include <asm/vtimer.h>
> >>>>>>
> >>>>>> +#include "vpci.h"
> >>>>>> #include "vuart.h"
> >>>>>>
> >>>>>> DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> >>>>>> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
> >>>>>>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
> >>>>>>          goto fail;
> >>>>>>
> >>>>>> +    if ( (rc = domain_vpci_init(d)) != 0 )
> >>>>>> +        goto fail;
> >>>>>> +
> >>>>>>      return 0;
> >>>>>>
> >>>>>> fail:
> >>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >>>>>> index c5afbe2e05..f4c89bde8c 100644
> >>>>>> --- a/xen/arch/arm/domain_build.c
> >>>>>> +++ b/xen/arch/arm/domain_build.c
> >>>>>> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
> >>>>>>      if ( iommu_enabled )
> >>>>>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> >>>>>>
> >>>>>> +    if ( is_pci_passthrough_enabled() )
> >>>>>> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
> >>>>> I think I'm confused with this. You seem to enable vPCI for dom0, but
> >>>>> then domain_vpci_init will setup traps for the guest virtual ECAM
> >>>>> layout, not the native one that dom0 will be using.
> >>>> I think after the last discussions, it was decided to also installed the vpci
> >>>> handler for dom0. I will have to look into this and come back to you.
> >>>> @Oleksandr: Could you comment on this.
> >>> Yes, we do trap Dom0 as well. The Dom0 traps are not in this series, but
> >>> are in mine as it needs more preparatory work for that. Please see [1]
> >> Then I don't think we should set XEN_DOMCTL_CDF_vpci for dom0 here, it
> >> should instead be done in the patch where dom0 support is introduced.
> > Ok I will check to remove this and include the change in v6.
> Just to make it clear: do we want to remove this piece from this patch
> and instead have a dedicated patch on top of my series, so it is enabled
> right after we have the code that sets up the trap handlers for Dom0?
> If so, then do we want that patch to be chained in my series or sent as
> a follow up right after it separately?

I think we want to remove the XEN_DOMCTL_CDF_vpci chunk from this patch.

Where exactly it should be introduced, I am not sure. I think it would
be OK as a separate single patch at the end. I doesn't have to be part
of the outstanding series, considering that we are also missing the
patch to add "select HAS_PCI" for ARM.
--8323329-1433164912-1633980479=:25528--

