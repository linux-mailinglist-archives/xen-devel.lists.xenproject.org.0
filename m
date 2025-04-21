Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E081A959CF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 01:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961545.1352936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u70hx-0007fi-Os; Mon, 21 Apr 2025 23:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961545.1352936; Mon, 21 Apr 2025 23:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u70hx-0007eF-L7; Mon, 21 Apr 2025 23:37:49 +0000
Received: by outflank-mailman (input) for mailman id 961545;
 Mon, 21 Apr 2025 23:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u70hw-0007e9-9O
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 23:37:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ef409f-1f09-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 01:37:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A31C46116A;
 Mon, 21 Apr 2025 23:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464DC4CEE4;
 Mon, 21 Apr 2025 23:37:27 +0000 (UTC)
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
X-Inumbo-ID: 96ef409f-1f09-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745278648;
	bh=mjx1knEyHSYCiIbgHgNGGgZ3brDQ+LAuRUGuCgGeYYw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sr6QTKz3vbSkkfuRdQVMGRxK82DstU49ObsYXjzjKVJKqk3T9iNk32+H2+0sovECF
	 6X3jd2rhjCvB7/nSepj2OVk1JN2oHweVh7QjnxBe83j/djhf4K48rU/vqFcmOJj7/I
	 TdTx/FMhyuS2GahfZQCWEY0THa9G/N3Lyjd8+gEEYbcX9vvR8ph4yxuLK4gubcQDfO
	 7qneXUAMY9exdh3WRTiAJJHPSOw6mTwnWDHEtqMZGq7f8vp0MiQpQPVZ1MTk8XpL2L
	 7n4X7W+Yx+Q1R8BuPR4PF4309PQcFf5DjEVMLjbBFOW8iBI6X/TXl9jBNIddBY9FRA
	 3o7SSfTy5JeDA==
Date: Mon, 21 Apr 2025 16:37:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
In-Reply-To: <634cecb8-1452-4cbe-9b3d-98554a5e4df8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504211637180.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com> <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com> <710bfddb-6ce3-4b11-bcd8-91f17d4f5be2@epam.com>
 <9a0ac3c1-e448-4acd-a471-d8d8e14fbc44@suse.com> <8df846ba-2ec7-467a-a097-0b9c2e4f51dc@epam.com> <634cecb8-1452-4cbe-9b3d-98554a5e4df8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Mar 2025, Jan Beulich wrote:
> On 20.03.2025 11:47, Mykyta Poturai wrote:
> > On 19.03.25 17:28, Jan Beulich wrote:
> >> On 19.03.2025 16:21, Mykyta Poturai wrote:
> >>> On 17.03.25 16:56, Jan Beulich wrote:
> >>>> On 14.03.2025 14:34, Mykyta Poturai wrote:
> >>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>>
> >>>>> The main purpose of this patch is to add a way to register PCI device
> >>>>> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> >>>>> before assigning that device to a domain.
> >>>>>
> >>>>> This behaves similarly to the existing iommu_add_dt_device API, except it
> >>>>> handles PCI devices, and it is to be invoked from the add_device hook in the
> >>>>> SMMU driver.
> >>>>>
> >>>>> The function dt_map_id to translate an ID through a downstream mapping
> >>>>> (which is also suitable for mapping Requester ID) was borrowed from Linux
> >>>>> (v5.10-rc6) and updated according to the Xen code base.
> >>>>>
> >>>>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> >>>>>
> >>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >>>>> ---
> >>>>> Regarding pci_for_each_dma_alias question: getting host bridge node
> >>>>> directly seems like a simpler solution with the same result. AFAIU
> >>>>> with pci_for_each_dma_alias in linux we would arrive to the host brige
> >>>>> node anyway, but also try to call dt_map_id for each device along the
> >>>>> way. I am not sure why exactly it is done this way in linux, as
> >>>>> according to the pci-iommu.txt, iommu-map node can only be present in
> >>>>> the PCI root.
> >>>>>
> >>>>> v8->v9:
> >>>>> * replace DT_NO_IOMMU with 1
> >>>>> * guard iommu_add_pci_sideband_ids with CONFIG_ARM
> >>>>
> >>>> I fear I'm confused: Isn't this contradicting ...
> >>>>
> >>>>> v7->v8:
> >>>>> * ENOSYS->EOPNOTSUPP
> >>>>> * move iommu_add_pci_sideband_ids to iommu.c to fix x86 build
> >>>>
> >>>> ... this earlier change? Really, with there being no caller, I can't see
> >>>> why there could be any build issue here affecting only x86. Except for
> >>>> Misra complaining about unreachable code being introduced, which I'm sure
> >>>> I said before should be avoided.
> >>>
> >>> The original reason for moving this function was the conflicting ACPI
> >>> and EFI headers, I described it in V8 comments here[1].
> >>>
> >>>>
> >>>>> --- a/xen/drivers/passthrough/iommu.c
> >>>>> +++ b/xen/drivers/passthrough/iommu.c
> >>>>> @@ -20,6 +20,7 @@
> >>>>>    #include <xen/param.h>
> >>>>>    #include <xen/softirq.h>
> >>>>>    #include <xen/keyhandler.h>
> >>>>> +#include <xen/acpi.h>
> >>>>>    #include <xsm/xsm.h>
> >>>>>
> >>>>>    #ifdef CONFIG_X86
> >>>>> @@ -744,6 +745,20 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
> >>>>>        return 0;
> >>>>>    }
> >>>>>
> >>>>> +#ifdef CONFIG_ARM
> >>>>
> >>>> I realize we have CONFIG_X86 here as well (visible even in context of the
> >>>> earlier hunk. Yet then the goal ought to be to reduce these anomalies, not
> >>>> add new ones. Since I don't have a clear picture of what's wanted, I'm also
> >>>> in trouble suggesting any alternative, I'm afraid.
> >>>
> >>> Here is a short summary:
> >>>
> >>> The main problem is that we need this function somewhere, but there is
> >>> no good place for it. It is only called on ARM for now but it's not
> >>> ARM-specific by nature and can be eventually used on other platforms as
> >>> well. It can't be just dropped because of the effort to support the
> >>> co-existence of DT and ACPI. It also can't be declared as a static
> >>> function because it requires the inclusion of <xen/acpi.h> for
> >>> acpi_disabled define, which leads to build errors[1]. And without ifdef
> >>> guards it would be a MISRA violation.
> >>
> >> An abridged version of this ought to go in the patch description, I think.
> >> This is special, so it needs calling out.
> >>
> >> As to the placement - would making an entirely new .c file possibly help?
> >> (Then, instead of in the patch description, maybe the special aspect could
> >> be put in a code comment at the top of the file.)
> > 
> > It seems to me creating a new file would be overkill for one small 
> > function. I considered moving it to xen/drivers/passthrough/arm/iommu.c 
> > to reduce ifdefs but I feared it would suggest that it is arch-specific 
> > a bit too strongly. So maybe move it there after all if you think it 
> > would be better?
> 
> Well - with "#ifdef CONFIG_ARM" around it's Arm-specific too, isn't it?
> IOW - either have a proper (even if simple) abstraction, or perhaps indeed
> put it there (if that's also okay with the Arm maintainers).

I am OK with that

