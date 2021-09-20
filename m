Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CAB41299D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 01:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191246.341195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mST8a-0007f5-Fd; Mon, 20 Sep 2021 23:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191246.341195; Mon, 20 Sep 2021 23:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mST8a-0007cK-C1; Mon, 20 Sep 2021 23:55:52 +0000
Received: by outflank-mailman (input) for mailman id 191246;
 Mon, 20 Sep 2021 23:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4IA=OK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mST8Y-0007cE-5I
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 23:55:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a5b762-d36d-4b25-ba8a-cfefd9cbb46d;
 Mon, 20 Sep 2021 23:55:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8597E60F41;
 Mon, 20 Sep 2021 23:55:47 +0000 (UTC)
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
X-Inumbo-ID: 23a5b762-d36d-4b25-ba8a-cfefd9cbb46d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632182147;
	bh=rje7DP+kJuYTF0X72BmoG6z/gJaTKGY2mv9TxMd0kQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uAgWlaXg0U84+2PCvVTrahrB9Q3xdnMqamL1o7TeH4d/7RDMKtp3GDFFzVxrMNCIT
	 qoiepuEA1cekmqSsXl0IzI2xLCbKcQs0AbsE4+zYhJd4cuA2+qNGmmDUFVUqsOpVAK
	 CEIMuz9ghuM4XTyhdO8kvEfzTiZDyUEC8N30snzcvII+xVGjCMmgcyT33LGZRpscOm
	 TGxKVaD68hFvJz2Ckka7gqooBehKEqMoTMsghlrqT/8FKyH6kkZ/3C5ceqG8o/3RkE
	 MyPobiDLTrVJgIFEr+F21JPGl2zMVlHdqbyYPfxs5YK/3kq0VBIIwz6eiJQcq5ozYD
	 BH/oaKoq54fVw==
Date: Mon, 20 Sep 2021 16:55:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
Message-ID: <alpine.DEB.2.21.2109201621280.17979@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com> <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org> <08294c53-109a-8544-3a23-85e034d2992d@gmail.com> <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s> <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-930583891-1632180475=:17979"
Content-ID: <alpine.DEB.2.21.2109201628200.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-930583891-1632180475=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109201628201.17979@sstabellini-ThinkPad-T480s>

On Sun, 19 Sep 2021, Julien Grall wrote:
> On 18/09/2021 03:37, Stefano Stabellini wrote:
> > On Fri, 17 Sep 2021, Stefano Stabellini wrote:
> > > On Fri, 17 Sep 2021, Oleksandr wrote:
> > > > > > +
> > > > > > +    dt_dprintk("Find unallocated memory for extended regions\n");
> > > > > > +
> > > > > > +    unalloc_mem = rangeset_new(NULL, NULL, 0);
> > > > > > +    if ( !unalloc_mem )
> > > > > > +        return -ENOMEM;
> > > > > > +
> > > > > > +    /* Start with all available RAM */
> > > > > > +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> > > > > > +    {
> > > > > > +        start = bootinfo.mem.bank[i].start;
> > > > > > +        end = bootinfo.mem.bank[i].start +
> > > > > > bootinfo.mem.bank[i].size - 1;
> > > > > > +        res = rangeset_add_range(unalloc_mem, start, end);
> > > > > > +        if ( res )
> > > > > > +        {
> > > > > > +            printk(XENLOG_ERR "Failed to add:
> > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > +                   start, end);
> > > > > > +            goto out;
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Remove RAM assigned to Dom0 */
> > > > > > +    for ( i = 0; i < assign_mem->nr_banks; i++ )
> > > > > > +    {
> > > > > > +        start = assign_mem->bank[i].start;
> > > > > > +        end = assign_mem->bank[i].start + assign_mem->bank[i].size
> > > > > > - 1;
> > > > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > +        if ( res )
> > > > > > +        {
> > > > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > +                   start, end);
> > > > > > +            goto out;
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Remove reserved-memory regions */
> > > > > > +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> > > > > > +    {
> > > > > > +        start = bootinfo.reserved_mem.bank[i].start;
> > > > > > +        end = bootinfo.reserved_mem.bank[i].start +
> > > > > > +            bootinfo.reserved_mem.bank[i].size - 1;
> > > > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > +        if ( res )
> > > > > > +        {
> > > > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > +                   start, end);
> > > > > > +            goto out;
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Remove grant table region */
> > > > > > +    start = kinfo->gnttab_start;
> > > > > > +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
> > > > > > +    res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > +    if ( res )
> > > > > > +    {
> > > > > > +        printk(XENLOG_ERR "Failed to remove:
> > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > +               start, end);
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    start = EXT_REGION_START;
> > > > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > > > +    res = rangeset_report_ranges(unalloc_mem, start, end,
> > > > > > +                                 add_ext_regions, ext_regions);
> > > > > > +    if ( res )
> > > > > > +        ext_regions->nr_banks = 0;
> > > > > > +    else if ( !ext_regions->nr_banks )
> > > > > > +        res = -ENOENT;
> > > > > > +
> > > > > > +out:
> > > > > > +    rangeset_destroy(unalloc_mem);
> > > > > > +
> > > > > > +    return res;
> > > > > > +}
> > > > > > +
> > > > > > +static int __init find_memory_holes(const struct kernel_info
> > > > > > *kinfo,
> > > > > > +                                    struct meminfo *ext_regions)
> > > > > > +{
> > > > > > +    struct dt_device_node *np;
> > > > > > +    struct rangeset *mem_holes;
> > > > > > +    paddr_t start, end;
> > > > > > +    unsigned int i;
> > > > > > +    int res;
> > > > > > +
> > > > > > +    dt_dprintk("Find memory holes for extended regions\n");
> > > > > > +
> > > > > > +    mem_holes = rangeset_new(NULL, NULL, 0);
> > > > > > +    if ( !mem_holes )
> > > > > > +        return -ENOMEM;
> > > > > > +
> > > > > > +    /* Start with maximum possible addressable physical memory
> > > > > > range */
> > > > > > +    start = EXT_REGION_START;
> > > > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > > > +    res = rangeset_add_range(mem_holes, start, end);
> > > > > > +    if ( res )
> > > > > > +    {
> > > > > > +        printk(XENLOG_ERR "Failed to add:
> > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > +               start, end);
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Remove all regions described by "reg" property (MMIO, RAM,
> > > > > > etc) */
> > > > > 
> > > > > Well... The loop below is not going to handle all the regions
> > > > > described in
> > > > > the property "reg". Instead, it will cover a subset of "reg" where the
> > > > > memory is addressable.
> > > > 
> > > > As I understand, we are only interested in subset of "reg" where the
> > > > memory is
> > > > addressable.
> > > > 
> > > > 
> > > > > 
> > > > > 
> > > > > You will also need to cover "ranges" that will describe the BARs for
> > > > > the PCI
> > > > > devices.
> > > > Good point.
> > > 
> > > Yes, very good point!
> > > 
> > > 
> > > > Could you please clarify how to recognize whether it is a PCI
> > > > device as long as PCI support is not merged? Or just to find any device
> > > > nodes
> > > > with non-empty "ranges" property
> > > > and retrieve addresses?
> > > 
> > > Normally any bus can have a ranges property with the aperture and
> > > possible address translations, including /amba (compatible =
> > > "simple-bus"). However, in these cases dt_device_get_address already
> > > takes care of it, see xen/common/device_tree.c:dt_device_get_address.
> > > 
> > > The PCI bus is special for 2 reasons:
> > > - the ranges property has a different format
> > > - the bus is hot-pluggable
> > > 
> > > So I think the only one that we need to treat specially is PCI.
> > > 
> > > As far as I am aware PCI is the only bus (or maybe just the only bus
> > > that we support?) where ranges means the aperture.
> > 
> > Now that I think about this, there is another "hotpluggable" scenario we
> > need to think about:
> > 
> > [1] https://marc.info/?l=xen-devel&m=163056546214978
> > 
> > Xilinx devices have FPGA regions with apertures currently not described
> > in device tree, where things can programmed in PL at runtime making new
> > devices appear with new MMIO regions out of thin air.
> > 
> > Now let me start by saying that yes, the entire programmable region
> > aperture could probably be described in device tree, however, in
> > reality it is not currently done in any of the device trees we use
> > (including the upstream device trees in linux.git).
> 
> This is rather annoying, but not unheard. There are a couple of platforms
> where the MMIOs are not fully described in the DT.
> 
> In fact, we have a callback 'specific_mappings' which create additional
> mappings (e.g. on the omap5) for dom0.

Just for clarity this is a bit different because it is not an
MMIO-region yet. It is only a *potential* MMIO region. Basically it is
nothing until the Programmable Logic gets programmed. But the
Programmable Logic only uses addresses within a given range, thankfully,
and we know the range beforehand.

 
> > So, we have a problem :-(
> > 
> > 
> > I can work toward getting the right info on device tree, but in reality
> > that is going to take time and for now the device tree doesn't have the
> > FPGA aperture in it. So if we accept this series as is, it is going to
> > stop features like [1] from working. >
> > If we cannot come up with any better plans, I think it would be better
> > to drop find_memory_holes, only rely on find_unallocated_memory even
> > when the IOMMU is on. One idea is that we could add on top of the
> > regions found by find_unallocated_memory any MMIO regions marked as
> > xen,passthrough: they are safe because they are not going to dom0 anyway.
> 
> (Oleksandr, it looks like some rationale about the different approach is
> missing in the commit message. Can you add it?)
> 
> When the IOMMU is on, Xen will do an extra mapping with GFN == MFN for every
> grant mapping in dom0. This is because Linux will always program the device
> with the MFN as it doesn't know whether the device has been protected by the
> hypervisor.
> 
> Therefore we can't use find_unallocated_memory() with the IOMMU on as it
> stands.
> 
> > The only alternative I can think of is to have a per-board
> > enable/disable toggle for the extend region but it would be very ugly.
> At least, for your board, you seem to know the list of regions that are
> reserved for future use.
>
> So how about adding a per-board list of regions that
> should not be allocated?
> 
> This will also include anything mentioned in 'specific_mappings'.

I am OK with that. I should be able to find the potential address ranges
for Xilinx boards. However, the ranges might be different for different
boards (for different family of boards, not for every little different
revision). Hopefully, Xilinx is the worst case as the hardware is
actually programmable.
--8323329-930583891-1632180475=:17979--

