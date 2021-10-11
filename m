Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477134296B6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206490.362088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzsj-0001ha-AX; Mon, 11 Oct 2021 18:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206490.362088; Mon, 11 Oct 2021 18:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzsj-0001fI-7F; Mon, 11 Oct 2021 18:18:37 +0000
Received: by outflank-mailman (input) for mailman id 206490;
 Mon, 11 Oct 2021 18:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mZzsh-0001fC-Ox
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:18:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84189170-b65e-4f99-8fd2-4006f69d8b5e;
 Mon, 11 Oct 2021 18:18:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57A3060F0F;
 Mon, 11 Oct 2021 18:18:33 +0000 (UTC)
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
X-Inumbo-ID: 84189170-b65e-4f99-8fd2-4006f69d8b5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633976313;
	bh=Cjuja8k1RVECncvnL9T/xemSuheF1RChVpdZLn5/L3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f8iymEF+I/E6J0xB6st0pkkP709Z9W6GdkGQgJpxy240STVUZXEWwHvH6AejtXDzQ
	 VvCihBAAwpZgVXKztdvsXlDdz+4/3BKVXA3YV3+TPzXs/z8xclTPAdAsPSY/8UQfpn
	 W1ot/wufjkXahJUdtZBpk4btYOGFtJQzpaC7FlUcIuipi8yXzYopOFIRZ5Hz61gylI
	 +vSpbJQFgReR/XP9+Y0KGvUHgYeYKvfayM6CP5ILVCGd9jh24k8RanKQQ+2lUf4Lia
	 Ow7z5azuDAEnMNujoOJ6d6EHUelSJSnRX+szwddo+UqRPHPB2ChAw3zY8XQWk337o6
	 zkEqGwsLzMbmQ==
Date: Mon, 11 Oct 2021 11:18:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
Message-ID: <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com> <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com> <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com> <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com> <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Jan Beulich wrote:
> On 11.10.2021 15:34, Bertrand Marquis wrote:
> >> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 11.10.2021 14:41, Bertrand Marquis wrote:
> >>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 06.10.2021 19:40, Rahul Singh wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/xen/arch/arm/vpci.c
> >>>>> @@ -0,0 +1,102 @@
> >>>>> +/*
> >>>>> + * xen/arch/arm/vpci.c
> >>>>> + *
> >>>>> + * This program is free software; you can redistribute it and/or modify
> >>>>> + * it under the terms of the GNU General Public License as published by
> >>>>> + * the Free Software Foundation; either version 2 of the License, or
> >>>>> + * (at your option) any later version.
> >>>>> + *
> >>>>> + * This program is distributed in the hope that it will be useful,
> >>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>>> + * GNU General Public License for more details.
> >>>>> + */
> >>>>> +#include <xen/sched.h>
> >>>>> +
> >>>>> +#include <asm/mmio.h>
> >>>>> +
> >>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> >>>>
> >>>> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
> >>>> Also isn't this effectively part of the public interface (along with
> >>>> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?
> >>>
> >>> I will move that in the next version to xen/pci.h and rename itMMCFG_REG_OFFSET.
> >>> Would that be ok ?
> >>
> >> That would be okay and make sense when put next to MMCFG_BDF(), but
> >> it would not address my comment: That still wouldn't be the public
> >> interface. Otoh you only mimic hardware behavior, so perhaps the
> >> splitting of the address isn't as relevant to put there as would be
> >> GUEST_VPCI_ECAM_{BASE,SIZE}.
> > 
> > Ok now I get what you wanted.
> > 
> > You would actually like both MMCFG_BDF and MMCFG_REG_OFFSET to
> > be moved to arch-arm.h.
> > 
> > Then I am not quite sure to follow why.
> > Those are not macros coming out of a way we have to define this but from
> > how it works in standard PCI.
> > The base and size are needed to know where the PCI bus will be.
> > 
> > So why should those be needed in public headers ?
> 
> Well, see my "Otoh ..." in the earlier reply. Keeping the two
> address splitting macros out of there is okay.
> 
> >>>>> --- a/xen/drivers/passthrough/pci.c
> >>>>> +++ b/xen/drivers/passthrough/pci.c
> >>>>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>>>>    else
> >>>>>        iommu_enable_device(pdev);
> >>>>
> >>>> Please note the context above; ...
> >>>>
> >>>>> +#ifdef CONFIG_ARM
> >>>>> +    /*
> >>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> >>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
> >>>>> +     */
> >>>>> +    ret = vpci_add_handlers(pdev);
> >>>>> +    if ( ret )
> >>>>> +    {
> >>>>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
> >>>>> +        pci_cleanup_msi(pdev);
> >>>>> +        ret = iommu_remove_device(pdev);
> >>>>> +        if ( pdev->domain )
> >>>>> +            list_del(&pdev->domain_list);
> >>>>> +        free_pdev(pseg, pdev);
> >>>>
> >>>> ... you unconditionally undo the if() part of the earlier conditional;
> >>>> is there any guarantee that the other path can't ever be taken, now
> >>>> and forever? If it can't be taken now (which I think is the case as
> >>>> long as Dom0 wouldn't report the same device twice), then at least some
> >>>> precaution wants taking. Maybe moving your addition into that if()
> >>>> could be an option.
> >>>>
> >>>> Furthermore I continue to wonder whether this ordering is indeed
> >>>> preferable over doing software setup before hardware arrangements. This
> >>>> would address the above issue as well as long as vpci_add_handlers() is
> >>>> idempotent. And it would likely simplify error cleanup.
> >>>
> >>> I agree with you so I will move this code block before iommu part.
> >>>
> >>> But digging deeper into this, I would have 2 questions:
> >>>
> >>> - msi_cleanup was done there after a request from Stefano, but is not
> >>> done in case or iommu error, is there an issue to solve here ?
> >>
> >> Maybe, but I'm not sure. This very much depends on what a domain
> >> could in principle do with a partly set-up device. Plus let's
> >> not forget that we're talking of only Dom0 here (for now at least,
> >> i.e. not considering the dom0less case).
> >>
> >> But I'd also like to further defer to Stefano.
> > 
> > Ok, I must admit I do not really see at that stage why doing an MSI cleanup
> > could be needed so I will wait for Stefano to know if I need to keep this when
> > moving the block up (at the end it is theoretical right now as this is empty).

I know that MSIs are not supported yet on ARM (pci_cleanup_msi does
nothing). But I wanted to make sure that the pci_cleanup_msi() calls are
present anywhere necessary, especially on the error paths. So that once
we add MSI support, we don't need to search through the code to find all
the error paths missing a pci_cleanup_msi() call.

To answer your first question: you are right, we are also missing a
pci_cleanup_msi() call in the case of IOMMU error. So it might be better
to move the call to pci_cleanup_msi() under the "out" label so that we
can do it once for both cases.

To answer your second point about whether it is necessary at all: if
MSIs and MSI-Xs cannot be already setup at this point at all (not even
the enable bit), then we don't need any call to pci_cleanup_msi() in
pci_add_device.

