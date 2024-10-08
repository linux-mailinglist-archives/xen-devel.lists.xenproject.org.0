Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94B995AC8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 00:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813643.1226647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syIya-0000hq-8Z; Tue, 08 Oct 2024 22:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813643.1226647; Tue, 08 Oct 2024 22:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syIya-0000fC-5L; Tue, 08 Oct 2024 22:46:44 +0000
Received: by outflank-mailman (input) for mailman id 813643;
 Tue, 08 Oct 2024 22:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrDf=RE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syIyX-0000ce-Vk
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 22:46:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e04a5ec-85c7-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 00:46:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A7C48A407D9;
 Tue,  8 Oct 2024 22:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5567C4CEC7;
 Tue,  8 Oct 2024 22:46:36 +0000 (UTC)
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
X-Inumbo-ID: 2e04a5ec-85c7-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728427598;
	bh=ZQAC/brWF2U3WKnQrfKU2MOZjWd5FtOlPTxFgS0dSrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fOqGep3AA2TmdnXnuuRk2FIQOKPYvz6N33wLFLyD4XkWw+GdG16AHUuj//OpVxNhu
	 alsZkHyg+2P7MhT+2XwOhxe/QPUj9E03W0kIiwuZ3wvokZ6ZmKvEJpatNaEXf8yw5L
	 S1L33Vj21hEI4058MJbUDR2iSUQ9AX+nTY42UJBoBoHakbYpl95WvIOSdgw6qvn4le
	 6hUe69W8JDbUmgFEHzu+fGA5JtixkrqjScLIsyVWAzCXTBSPvOjCvNTJQaCN/xB961
	 7ni1zkhpCqJH/EB/e3EU90T/wE9zWAeMo51/MEdIFUoNoRcpesQdT0sEWxuT9eapJP
	 BwkjhisUjbhVA==
Date: Tue, 8 Oct 2024 15:46:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    Artem Mygaiev <artem_mygaiev@epam.com>, 
    Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
In-Reply-To: <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
References: <20241007185508.3044115-1-olekstysh@gmail.com> <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com> <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
> > > On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
> > > 
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > Add common requirements for a physical device assignment to Arm64
> > > and AMD64 PVH domains.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > Based on:
> > > [PATCH] docs: fusa: Replace VM with domain
> > > https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
> > > ---
> > > ---
> > > .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
> > > docs/fusa/reqs/index.rst                      |   1 +
> > > docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
> > > docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
> > > 4 files changed, 428 insertions(+)
> > > create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
> > > create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
> > > 
> > > diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst
> > > b/docs/fusa/reqs/design-reqs/common/passthrough.rst
> > > new file mode 100644
> > > index 0000000000..a1d6676f65
> > > --- /dev/null
> > > +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
> > > @@ -0,0 +1,365 @@
> > > +.. SPDX-License-Identifier: CC-BY-4.0
> > > +
> > > +Device Passthrough
> > > +==================
> > > +
> > > +The following are the requirements related to a physical device
> > > assignment
> > > +[1], [2] to Arm64 and AMD64 PVH domains.
> > > +
> > > +Requirements for both Arm64 and AMD64 PVH
> > > +=========================================
> > > +
> > > +Hide IOMMU from a domain
> > > +------------------------
> > > +
> > > +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
> > > +
> > > +Description:
> > > +Xen shall not expose the IOMMU device to the domain even if I/O
> > > virtualization
> > > +is disabled. The IOMMU shall be under hypervisor control only.
> > > +
> > > +Rationale:
> > 
> > I think there should be a rationale here to explain why we do not want the
> > IOMMU
> > in particular to be assigned to a domain.
> 
> 
> ok, will add. I propose the following text:
> 
> Xen having the whole picture of the host resources and device assignment
> unlike the individual domain makes use of the IOMMU to:
> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also known as
> stage-2 (or 2nd stage) address translations for DMA devices passed through to
> domains and Interrupt Remapping on AMD64 platforms.
> - provide access protection functionalities to prevent malicious or buggy DMA
> devices from accessing arbitrary memory ranges (e.g. memory allocated to other
> domains) or from generating interrupts that could affect other domains.
> 
> 
> > 
> > Added to that, I am not completely sure that there is a clear way to test
> > this one
> > as for example one could assign registers not known by Xen.
> 
> I am afraid you are right, valid point. For example, on Arm64, if there is no
> corresponding driver in use, we will end up exposing IOMMU dt node to Dom0.
> 
> 
> > 
> > Shouldn't this requirement in fact be an assumption of use ?
> 
> Assumption of use on Xen? From my PoV sounds reasonable, will do.

In my view, this does not qualify as an Assumption of Use, as it does
not align with the definition we have used so far. If we were to
categorize this as an Assumption of Use, we would need to change the
definition.

We have defined an Assumption of Use as something Xen expects from the
rest of the system for it to function correctly, such as being loaded at
EL2. On the other hand, 'Requirements' refer to behaviors we expect Xen
to exhibit.

Our goal is for Xen to configure the IOMMU at boot using the stage 2
translation, and to ensure that Xen prevents domains from altering the
IOMMU configuration. These are specific expectations of Xen's behavior,
so I believe they fall under Requirements and should be validated in
some way.

However, we could adjust the wording. For example, we might replace the
negative phrasing with a positive requirement, such as: 'Xen shall
configure the IOMMU at boot according to the stage 2 translation
tables.' There is no need to explicitly state that the IOMMU is not
exposed to guests, as nothing is exposed unless explicitly allowed or
mentioned. We could, however, include a brief note about it for clarity.


> > > +
> > > +Comments:
> > > +
> > > +Covers:
> > > + - `XenProd~device_passthrough~1`
> > > +
> > > +Discover PCI devices from hardware domain
> > > +-----------------------------------------
> > > +
> > > +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
> > > +
> > > +Description:
> > > +The hardware domain shall enumerate and discover PCI devices and inform
> > > Xen
> > > +about their appearance and disappearance.
> > 
> > Again this is a design requirement telling what should be done by a domain.
> > This is an interface or an assumption of use but not a Xen design req.
> 
> I agree, will convert to Assumption of use on domain.

This example better aligns with our definition of Assumption of Use so
far: we expect the hardware domain to enumerate and discover PCI
devices, then notify Xen about their appearance or removal. This is an
expectation placed on the hardware domain, not on Xen itself. I agree
with Bertrand that, as written, it is more of an Assumption of Use than
a Requirement.

However, rather than converting it into an Assumption of Use, I think we
should rewrite it as a requirement focused on Xen's interfaces for
enumeration. For instance:

"Xen shall provide hypercalls to allow the hardware domain to inform Xen
about the presence of PCI devices."


> > > +
> > > +Rationale:
> > > +
> > > +Comments:
> > > +
> > > +Covers:
> > > + - `XenProd~device_passthrough~1`
> > > +
> > > +Discover PCI devices from Xen
> > > +-----------------------------
> > > +
> > > +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
> > > +
> > > +Description:
> > > +Xen shall discover PCI devices (enumerated by the firmware beforehand)
> > > during
> > > +boot if the hardware domain is not present.
> > 
> > I am a bit wondering here why we would not want Xen to always do it if we
> > have
> > the code to do it in Xen anyway.
> 
> Makes sense, will drop "if the hardware domain is not present".

+1

 
> > 
> > > +
> > > +Rationale:
> > > +
> > > +Comments:
> > > +
> > > +Covers:
> > > + - `XenProd~device_passthrough~1`
> > > +
> > > +Assign PCI device to domain (with IOMMU)
> > > +----------------------------------------
> > > +
> > > +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
> > > +
> > > +Description:
> > > +Xen shall assign a specified PCI device (always implied as DMA-capable)
> > > to
> > > +a domain during its creation using passthrough (partial) device tree on
> > > Arm64
> > > +and Hyperlaunch device tree on AMD-x86. The physical device to be
> > > assigned is
> > > +protected by the IOMMU.
> > 
> > This is a very long and complex requirement.
> > I would suggest to split it in 3:
> > - generic: Xen shall support assign PCI devices to domains.
> > - arm64 one: Xen shall assign PCI devices based on device tree (explain how
> > this is configured in dts)
> > - amd: xxxx based on hyperlaunch
> 
> I agree, will split, but ...
> 
> > - Xen shall use the IOMMU to enforce DMA operations done by a PCI device
> > assigned to a domain to be restricted to the memory of the given domain.
> 
> 
>  ... does this need to be a separate 4th requirement here (and for the similar
> requirement for the platform device down the document) or this sentence is
> meant to be added to all resulting generic/arm64/amd requirements?

This is not specific to PCI, though? The generic requirement is "Xen
shall use the IOMMU to enforce DMA operations done by a DMA-capable
device assigned to a domain to be restricted to the memory of the given
domain".

I think it is also OK to both have a PCI-specific and a
non-PCI-specific requirement for that, I just wanted to mention that it
doesn't look like something to PCI-specific.

