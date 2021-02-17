Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5B31E347
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 00:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86458.162342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWeV-0003aP-5o; Wed, 17 Feb 2021 23:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86458.162342; Wed, 17 Feb 2021 23:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWeV-0003a0-2h; Wed, 17 Feb 2021 23:54:39 +0000
Received: by outflank-mailman (input) for mailman id 86458;
 Wed, 17 Feb 2021 23:54:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lCWeU-0003Zv-43
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 23:54:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c3c9570-9cd0-46e1-b5d1-ea5a50a7affb;
 Wed, 17 Feb 2021 23:54:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 731A664E63;
 Wed, 17 Feb 2021 23:54:36 +0000 (UTC)
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
X-Inumbo-ID: 5c3c9570-9cd0-46e1-b5d1-ea5a50a7affb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613606076;
	bh=/+lRb1DonEWYzxPO9qdel/N7h5iRPfdgS0uSyL+o2Pw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XrsYBdVT8dMW9tJlvyNt/5SNotM86J9fb5UZsaT5/3U4yFk5bDsq7AqKFxiGwRu7V
	 GBGMd4Q01h21IEgp3XbIQ6zL3Ip+JmHQajB7FaRBIaKvweF0ieQJbXE7+Ryu1tj3EQ
	 Wftxtuc4mOoJapEFvO2D7bInj+ftFhdFh5QWHeb0gJ+xmuTmBffOrZPgtABETV57O+
	 YTLvcO1udntTTPFusnWuBa5uLAuH+rtY15pc2w5bgNfLTCzr8aq2U4PVs8KMW/C3+C
	 tv9bvnNUUMWtvx/BkN22CbhScTQrXmM0RjRwzxNgT9Tv0kaW4JaRdgoivpsD+QW/IN
	 Zz6h5YqiJXyVg==
Date: Wed, 17 Feb 2021 15:54:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
In-Reply-To: <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
Message-ID: <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s> <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Feb 2021, Julien Grall wrote:
> On 17/02/2021 02:00, Stefano Stabellini wrote:
> > Hi all,
> > 
> > Today Linux uses the swiotlb-xen driver (drivers/xen/swiotlb-xen.c) to
> > translate addresses for DMA operations in Dom0. Specifically,
> > swiotlb-xen is used to translate the address of a foreign page (a page
> > belonging to a domU) mapped into Dom0 before using it for DMA.
> > 
> > This is important because although Dom0 is 1:1 mapped, DomUs are not. On
> > systems without an IOMMU swiotlb-xen enables PV drivers to work as long
> > as the backends are in Dom0. Thanks to swiotlb-xen, the DMA operation
> > ends up using the MFN, rather than the GFN.
> > 
> > 
> > On systems with an IOMMU, this is not necessary: when a foreign page is
> > mapped in Dom0, it is added to the Dom0 p2m. A new GFN->MFN translation
> > is enstablished for both MMU and SMMU. Dom0 could safely use the GFN
> > address (instead of the MFN) for DMA operations and they would work. It
> > would be more efficient than using swiotlb-xen.
> > 
> > If you recall my presentation from Xen Summit 2020, Xilinx is working on
> > cache coloring. With cache coloring, no domain is 1:1 mapped, not even
> > Dom0. In a scenario where Dom0 is not 1:1 mapped, swiotlb-xen does not
> > work as intended.
> > 
> > 
> > The suggested solution for both these issues is to add a new feature
> > flag "XENFEAT_ARM_dom0_iommu" that tells Dom0 that it is safe not to use
> > swiotlb-xen because IOMMU translations are available for Dom0. If
> > XENFEAT_ARM_dom0_iommu is set, Linux should skip the swiotlb-xen
> > initialization. I have tested this scheme with and without cache
> > coloring (hence with and without 1:1 mapping of Dom0) on ZCU102 and it
> > works as expected: DMA operations succeed.
> > 
> > 
> > What about systems where an IOMMU is present but not all devices are
> > protected?
> > 
> > There is no way for Xen to know which devices are protected and which
> > ones are not: devices that do not have the "iommus" property could or
> > could not be DMA masters.
> > 
> > Perhaps Xen could populate a whitelist of devices protected by the IOMMU
> > based on the "iommus" property. It would require some added complexity
> > in Xen and especially in the swiotlb-xen driver in Linux to use it,
> > which is not ideal.
> 
> You are trading a bit more complexity in Xen and Linux with a user will may
> not be able to use the hypervisor on his/her platform without a quirk in Xen
> (see more below).
> 
> > However, this approach would not work for cache
> > coloring where dom0 is not 1:1 mapped so the swiotlb-xen should not be
> > used either way
> 
> Not all the Dom0 Linux kernel will be able to work with cache colouring. So
> you will need a way for the kernel to say "Hey I am can avoid using swiotlb".

A dom0 Linux kernel unmodified can work with Xen cache coloring enabled.
The swiotlb-xen is unneeded and also all the pfn_valid() checks to detect
if a page is local or foreign don't work as intended. However, it still
works on systems where the IOMMU can be relied upon. That's because the
IOMMU does the GFN->MFN translations, and also because both swiotlb-xen
code paths (cache flush local and cache flush via hypercall) work.

Also considering that somebody that enables cache coloring has to know
the entire system well, I don't think we need a runtime flag from Linux
to say "Hey I can avoid using swiotlb".

That said, I think it is important to fix Linux because the code might
work today, but it is more by accident than by design.


> > For these reasons, I would like to propose a single flag
> > XENFEAT_ARM_dom0_iommu which says that the IOMMU can be relied upon for
> > DMA translations. In situations where a DMA master is not SMMU
> > protected, XENFEAT_ARM_dom0_iommu should not be set. For example, on a
> > platform where an IOMMU is present and protects most DMA masters but it
> > is leaving out the MMC controller, then XENFEAT_ARM_dom0_iommu should
> > not be set (because PV block is not going to work without swiotlb-xen.)
> > This also means that cache coloring won't be usable on such a system (at
> > least not usable with the MMC controller so the system integrator should
> > pay special care to setup the system).
> > 
> > It is worth noting that if we wanted to extend the interface to add a
> > list of protected devices in the future, it would still be possible. It
> > would be compatible with XENFEAT_ARM_dom0_iommu.
> 
> I imagine by compatible, you mean XENFEAT_ARM_dom0_iommu would be cleared and
> instead the device-tree list would be used. Is that correct?

If XENFEAT_ARM_dom0_iommu is set, the device list is redundant.
If XENFEAT_ARM_dom0_iommu is not set, the device list is useful.

The device list and XENFEAT_ARM_dom0_iommu serve different purposes. The
device list is meant to skip the swiotlb-xen for some devices.

XENFEAT_ARM_dom0_iommu is meant to skip the swiotlb-xen for all devices,
which is especially useful when dom0 is not 1:1 mapped, because in that
case swiotlb-xen is useless and wrong.

Thinking more about this, it is clear that swiotlb-xen should not be
considered when cache coloring is enabled. It can't help by design. The
device list and the flag are really for different use-cases. And the
cache coloring use-case is better served by a XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped flags. More on this below.


> > How to set XENFEAT_ARM_dom0_iommu?
> > 
> > We could set XENFEAT_ARM_dom0_iommu automatically when
> > is_iommu_enabled(d) for Dom0. We could also have a platform specific
> > (xen/arch/arm/platforms/) override so that a specific platform can
> > disable XENFEAT_ARM_dom0_iommu. For debugging purposes and advanced
> > users, it would also be useful to be able to override it via a Xen
> > command line parameter.
> Platform quirks should be are limited to a small set of platforms.
> 
> In this case, this would not be only per-platform but also per-firmware table
> as a developer can decide to remove/add IOMMU nodes in the DT at any time.
> 
> In addition to that, it means we are introducing a regression for those users
> as Xen 4.14 would have worked on there platform but not anymore. They would
> need to go through all the nodes and find out which one is not protected.
> 
> This is a bit of a daunting task and we are going to end up having a lot of
> per-platform quirk in Xen.
> 
> So this approach selecting the flag is a no-go for me. FAOD, the inverted idea
> (i.e. only setting XENFEAT_ARM_dom0_iommu per-platform) is a no go as well.
>
> I don't have a good idea how to set the flag automatically. My
> requirement is newer Xen should continue to work on all supported
> platforms without any additional per-platform effort.

Absolutely agreed.


One option would be to rename the flag to XENFEAT_ARM_cache_coloring and
only set it when cache coloring is enabled.  Obviously you need to know
what you are doing if you are enabling cache coloring. If we go down
that route, we don't risk breaking compatibility with any platforms.
Given that cache coloring is not upstream yet (upstreaming should start
very soon), maybe the only thing to do now would be to reserve a XENFEAT
number.

But actually it was always wrong for Linux to enable swiotlb-xen without
checking whether it is 1:1 mapped or not. Today we enable swiotlb-xen in
dom0 and disable it in domU, while we should have enabled swiotlb-xen if
1:1 mapped no matter dom0/domU. (swiotlb-xen could be useful in a 1:1
mapped domU driver domain.)


There is an argument (Andy was making on IRC) that being 1:1 mapped or
not is an important information that Xen should provide to the domain
regardless of anything else.

So maybe we should add two flags:

- XENFEAT_direct_mapped
- XENFEAT_not_direct_mapped

To all domains. This is not even ARM specific. Today dom0 would get
XENFEAT_direct_mapped and domUs XENFEAT_not_direct_mapped. With cache
coloring all domains will get XENFEAT_not_direct_mapped. With Bertrand's
team work on 1:1 mapping domUs, some domUs might start to get
XENFEAT_direct_mapped also one day soon.

Now I think this is the best option because it is descriptive, doesn't
imply anything about what Linux should or should not do, and doesn't
depend on unreliable IOMMU information.



Instead, if we follow my original proposal of using
XENFEAT_ARM_dom0_iommu and set it automatically when Dom0 is protected
by IOMMU, we risk breaking PV drivers for platforms where that protection
is incomplete. I have no idea how many there are out there today. I have
the feeling that there aren't that many but I am not sure. So yes, it
could be that we start passing XENFEAT_ARM_dom0_iommu for a given
platform, Linux skips the swiotlb-xen initialization, actually it is
needed for a network/block device, and a PV driver breaks. I can see why
you say this is a no-go.


Third option. We still use XENFEAT_ARM_dom0_iommu but we never set
XENFEAT_ARM_dom0_iommu automatically. It needs a platform specific flag
to be set. We add the flag to xen/arch/arm/platforms/xilinx-zynqmp.c and
any other platforms that qualify. Basically it is "opt in" instead of
"opt out". We don't risk breaking anything because platforms would have
XENFEAT_ARM_dom0_iommu disabled by default. Still, I think the
XENFEAT_not/direct_mapped route is much cleaner and simpler.



I saw that the topic has generated quite a bit of discussion. I suggest
we keep gathering data and do brainstorming on the thread for a few days
and in the meantime schedule a call for late next week to figure out a
way forward?

