Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C256405DCB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 21:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183526.331751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOQ7I-0002kn-5x; Thu, 09 Sep 2021 19:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183526.331751; Thu, 09 Sep 2021 19:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOQ7I-0002ig-2e; Thu, 09 Sep 2021 19:53:48 +0000
Received: by outflank-mailman (input) for mailman id 183526;
 Thu, 09 Sep 2021 19:53:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOQ7G-0002ia-1C
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 19:53:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 958e9087-1d69-43f8-8d51-8d40c6756bae;
 Thu, 09 Sep 2021 19:53:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC7EF610A3;
 Thu,  9 Sep 2021 19:53:43 +0000 (UTC)
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
X-Inumbo-ID: 958e9087-1d69-43f8-8d51-8d40c6756bae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631217224;
	bh=iiysE0Z9f0QioDhx3Nak9Gu1u/jJsXfut2cpl96zhto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QtGumlrpMDEsD6CmW948+MWJIbKUOVpd3l8CyaKYosA91NwdFjtYvelg1AXAmhLD2
	 lFrfATKiF1die7ZJmOyfLHQe/Rx6GyXo2xoHGhAgyNf5GEK7CtCo3HCgobQ5kGKQ+Y
	 FvaUfc6UMbjv+5MKn9CI5giHGg4M0IJMfTi3YN3Nog5vCHt5RPTJuDQvvVbn39d5Jy
	 ELVYmjxpcWP+51lQHasiiavC4P/i0pn1cwNE1S1ZN3rQgqPuoGvDKRooMobFwB9JNh
	 vm6HVQ2lF9TvEHjAs3yRwiAllTp6t9xrRt3NvsA0DCuJ2deoU2kGEGeKMRrVRwHvOj
	 ucTAQKSx3wVHg==
Date: Thu, 9 Sep 2021 12:53:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Skakun <Roman_Skakun@epam.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrii Anisov <Andrii_Anisov@epam.com>, Roman Skakun <rm.skakun@gmail.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Disable IOMMU in Dom0
In-Reply-To: <AM7PR03MB6593E7F0C691F98E07B8141C85D59@AM7PR03MB6593.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109091232100.10523@sstabellini-ThinkPad-T480s>
References: <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com> <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s> <AM7PR03MB659358C0EBA9D71AEEF7A60885CD9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <179e4b7f-38d9-991d-3f99-64a74559986d@xen.org> <AM7PR03MB6593E7F0C691F98E07B8141C85D59@AM7PR03MB6593.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1048009336-1631216039=:10523"
Content-ID: <alpine.DEB.2.21.2109091234050.10523@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1048009336-1631216039=:10523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109091234051.10523@sstabellini-ThinkPad-T480s>

I am fine with adding this functionality only to device tree initially.


It is certainly true that if a DMA-capable device is behind an IOMMU,
then we can skip swiotlb-xen for foreign pages address transactions.
Those addresses will be translated just fine thanks to the IOMMU.
Skipping swiotlb-xen could provide a non-negligible performance
improvement, which is good.

However, you should be aware that your proposal should not be needed for
correctness or to make devices with a 4GB DMA mask work.

Thanks to commit 04085ec1a "xen/arm: fix gnttab_need_iommu_mapping"
foreign pages are added to the Dom0 p2m when mapped to Dom0. swiotlb-xen
translates foreign pages gfn to mfn then uses the mfn to program the
device DMA. The DMA transaction will be accepted by the IOMMU thanks to
the 1:1 GFN<->MFN entry added to Dom0 at the time of mapping.

If the mfn is >4GB and the device requires an address <4GB, then the
dma_capable check at the beginning of xen_swiotlb_map_page fails and the
DMA transaction gets bounced on a swiotlb-xen buffer lower than 4GB.

Am I missing anything?


On Thu, 9 Sep 2021, Roman Skakun wrote:
> Hi Julien,
> Thanks for the clarification!
> 
> I aim towards to prepare implementation for upstream to disable SWIOTLB for IOMMU-protected devices in Dom0.
> To provide this functionality need to add additional binding for each protected device in device-tree.
> After this step, I will also prepare the patch to make ensure that ballooning code prepares all allocations below 4GB.
> 
> We are going to prepare this functionality only for device-tree based system configurations.
> We don't have resources to support ACPI configuration.
> 
> Would you be ok with upstreaming only device-tree configuration?
> 
> Cheers,
> Roman
> 
> ___________________________________________________________________________________________________________________________________________
> From: Julien Grall <julien@xen.org>
> Sent: Wednesday, September 1, 2021 1:22 PM
> To: Roman Skakun <Roman_Skakun@epam.com>; Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Bertrand Marquis <bertrand.marquis@arm.com>; Andrii Anisov
> <Andrii_Anisov@epam.com>; Roman Skakun <rm.skakun@gmail.com>; Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
> Subject: Re: Disable IOMMU in Dom0  
> Hi Roman
> 
> On 01/09/2021 10:59, Roman Skakun wrote:
> >> If you have a setup  where Dom0 is not 1:1 mapped (which is not currently
> >> possible with upstream  Xen but it is possible with cache coloring) and
> >> uses the IOMMU to make  device DMA work like regular DomUs, then passing
> >> XENFEAT_not_direct_mapped  to Linux would make it work. Without
> >> XENFEAT_not_direct_mapped,  Linux would try to use swiotlb-xen which has
> >> code that relies on  Linux being 1:1 mapped to work properly.
> >
> > I'm using 1:1 Dom0.
> > According to your patch series, xen-swiotlb fops will be applied for all
> > devices
> > because XENFEAT_direct_mapped is active, as shown here:
> >https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4i
> bLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$ [elixir[.]bootlin[.]com]
> ><https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4
> ibLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$ [elixir[.]bootlin[.]com]>
> >
> > I agreed, that xen-swiotlb should work correctly, but in my case, I
> > retrieved MFN here:
> >https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ib
> LDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$ [elixir[.]bootlin[.]com]
> ><https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4i
> bLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$ [elixir[.]bootlin[.]com]>
> > which is greater than 32bit and xen-swiotlb tries to use bounce buffer
> > as expected.
> > It can lead to decrease a performance because I have a long buffer ~4MB.
> >
> > I thought, that we can disable swiotlb fops for devices which are
> > controlled by IOMMU.
> 
> Yes you can disable swiotlb for devices which are controlled by the
> IOMMU. But this will not make your problem disappear, it simply hides
> until it bites you in a more subttle way.
> 
>  From what you wrote, you have a 32-bit DMA capable. So you always need
> to have an address below 4GB. For foreign mapping, there is no guarantee
> the Guest Physical Address will actually be below 4GB.
> 
> Today, the ballooning code only ask Linux to steal *a* RAM page for
> mapping the foreign page. This may or may not be below 4GB depending on
> how you assigned the RAM to dom0 (IIRC you had some RAM above 4GB).
> 
> But that's the current behavior. One of your work colleague is looking
> at avoid to steal RAM page to avoid exhausting the memory. So foreign
> mapping may end up to be a lot higher in memory.
> 
> IOW, you will need to be able to bounce the DMA buffer for your device.
> If you want to avoid bouncing, the proper way would be to rework the
> ballonning code so pages are allocated below 4GB.
> 
> Cheers,
> 
> --
> Julien Grall
> 
> 
--8323329-1048009336-1631216039=:10523--

