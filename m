Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D4412957
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 01:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191240.341185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSSbE-000403-NI; Mon, 20 Sep 2021 23:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191240.341185; Mon, 20 Sep 2021 23:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSSbE-0003yG-Jw; Mon, 20 Sep 2021 23:21:24 +0000
Received: by outflank-mailman (input) for mailman id 191240;
 Mon, 20 Sep 2021 23:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4IA=OK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mSSbD-0003yA-6A
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 23:21:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76e843a0-1a69-11ec-b88a-12813bfff9fa;
 Mon, 20 Sep 2021 23:21:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7069E61211;
 Mon, 20 Sep 2021 23:21:20 +0000 (UTC)
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
X-Inumbo-ID: 76e843a0-1a69-11ec-b88a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632180080;
	bh=XpVW6WlJvF/Ucdqmeqd1pM/rlpsa+YufiWqxzvIWMNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k4mjxMb0FxUH3WwQOwklKO8xF/SVty+wsJncMdVPRnI48QyobxLRcniPBz8TBX/As
	 cIh0r7JXjaAXa6pgvPt6XrwqNRFbmOgnw0FDnFoa3RCFUZX0g+7Us4ArDU5Ql2+UVs
	 FVhWRSWTGXmJ9KWPsBilueOkVbqgYNFiHC8dw59PZMcG+AAQGqggFg4TBA1Lb8HjFG
	 kh9nBgFYHaNDo4SLU3t6cGXPRDQtLBOxeUiJ6DsUi3is5twRG32jGJUV8Lk/0VmOBR
	 lZGRDuujo9itkaUGNO/wIx3LXylgUNKm+qDp7h9zve69Jj9SLiwG5bE/PXT9q6MTWS
	 h76asGDuNBYRg==
Date: Mon, 20 Sep 2021 16:21:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <1a2cd4d2-7ec3-266a-9cba-e4ab49c3aaef@gmail.com>
Message-ID: <alpine.DEB.2.21.2109201619020.17979@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com> <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org> <08294c53-109a-8544-3a23-85e034d2992d@gmail.com> <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s> <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org> <1a2cd4d2-7ec3-266a-9cba-e4ab49c3aaef@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1942625641-1632180080=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1942625641-1632180080=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 19 Sep 2021, Oleksandr wrote:
> > On 18/09/2021 03:37, Stefano Stabellini wrote:
> > > On Fri, 17 Sep 2021, Stefano Stabellini wrote:
> > > > On Fri, 17 Sep 2021, Oleksandr wrote:
> > > > > > > +
> > > > > > > +    dt_dprintk("Find unallocated memory for extended regions\n");
> > > > > > > +
> > > > > > > +    unalloc_mem = rangeset_new(NULL, NULL, 0);
> > > > > > > +    if ( !unalloc_mem )
> > > > > > > +        return -ENOMEM;
> > > > > > > +
> > > > > > > +    /* Start with all available RAM */
> > > > > > > +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> > > > > > > +    {
> > > > > > > +        start = bootinfo.mem.bank[i].start;
> > > > > > > +        end = bootinfo.mem.bank[i].start +
> > > > > > > bootinfo.mem.bank[i].size - 1;
> > > > > > > +        res = rangeset_add_range(unalloc_mem, start, end);
> > > > > > > +        if ( res )
> > > > > > > +        {
> > > > > > > +            printk(XENLOG_ERR "Failed to add:
> > > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > > +                   start, end);
> > > > > > > +            goto out;
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Remove RAM assigned to Dom0 */
> > > > > > > +    for ( i = 0; i < assign_mem->nr_banks; i++ )
> > > > > > > +    {
> > > > > > > +        start = assign_mem->bank[i].start;
> > > > > > > +        end = assign_mem->bank[i].start +
> > > > > > > assign_mem->bank[i].size - 1;
> > > > > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > > +        if ( res )
> > > > > > > +        {
> > > > > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > > +                   start, end);
> > > > > > > +            goto out;
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Remove reserved-memory regions */
> > > > > > > +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> > > > > > > +    {
> > > > > > > +        start = bootinfo.reserved_mem.bank[i].start;
> > > > > > > +        end = bootinfo.reserved_mem.bank[i].start +
> > > > > > > +            bootinfo.reserved_mem.bank[i].size - 1;
> > > > > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > > +        if ( res )
> > > > > > > +        {
> > > > > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > > +                   start, end);
> > > > > > > +            goto out;
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Remove grant table region */
> > > > > > > +    start = kinfo->gnttab_start;
> > > > > > > +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
> > > > > > > +    res = rangeset_remove_range(unalloc_mem, start, end);
> > > > > > > +    if ( res )
> > > > > > > +    {
> > > > > > > +        printk(XENLOG_ERR "Failed to remove:
> > > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > > +               start, end);
> > > > > > > +        goto out;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    start = EXT_REGION_START;
> > > > > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > > > > +    res = rangeset_report_ranges(unalloc_mem, start, end,
> > > > > > > +                                 add_ext_regions, ext_regions);
> > > > > > > +    if ( res )
> > > > > > > +        ext_regions->nr_banks = 0;
> > > > > > > +    else if ( !ext_regions->nr_banks )
> > > > > > > +        res = -ENOENT;
> > > > > > > +
> > > > > > > +out:
> > > > > > > +    rangeset_destroy(unalloc_mem);
> > > > > > > +
> > > > > > > +    return res;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int __init find_memory_holes(const struct kernel_info
> > > > > > > *kinfo,
> > > > > > > +                                    struct meminfo *ext_regions)
> > > > > > > +{
> > > > > > > +    struct dt_device_node *np;
> > > > > > > +    struct rangeset *mem_holes;
> > > > > > > +    paddr_t start, end;
> > > > > > > +    unsigned int i;
> > > > > > > +    int res;
> > > > > > > +
> > > > > > > +    dt_dprintk("Find memory holes for extended regions\n");
> > > > > > > +
> > > > > > > +    mem_holes = rangeset_new(NULL, NULL, 0);
> > > > > > > +    if ( !mem_holes )
> > > > > > > +        return -ENOMEM;
> > > > > > > +
> > > > > > > +    /* Start with maximum possible addressable physical memory
> > > > > > > range */
> > > > > > > +    start = EXT_REGION_START;
> > > > > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > > > > +    res = rangeset_add_range(mem_holes, start, end);
> > > > > > > +    if ( res )
> > > > > > > +    {
> > > > > > > +        printk(XENLOG_ERR "Failed to add:
> > > > > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > > > > +               start, end);
> > > > > > > +        goto out;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Remove all regions described by "reg" property (MMIO, RAM,
> > > > > > > etc) */
> > > > > > 
> > > > > > Well... The loop below is not going to handle all the regions
> > > > > > described in
> > > > > > the property "reg". Instead, it will cover a subset of "reg" where
> > > > > > the
> > > > > > memory is addressable.
> > > > > 
> > > > > As I understand, we are only interested in subset of "reg" where the
> > > > > memory is
> > > > > addressable.
> > > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > You will also need to cover "ranges" that will describe the BARs for
> > > > > > the PCI
> > > > > > devices.
> > > > > Good point.
> > > > 
> > > > Yes, very good point!
> > > > 
> > > > 
> > > > > Could you please clarify how to recognize whether it is a PCI
> > > > > device as long as PCI support is not merged? Or just to find any
> > > > > device nodes
> > > > > with non-empty "ranges" property
> > > > > and retrieve addresses?
> > > > 
> > > > Normally any bus can have a ranges property with the aperture and
> > > > possible address translations, including /amba (compatible =
> > > > "simple-bus"). However, in these cases dt_device_get_address already
> > > > takes care of it, see xen/common/device_tree.c:dt_device_get_address.
> > > > 
> > > > The PCI bus is special for 2 reasons:
> > > > - the ranges property has a different format
> > > > - the bus is hot-pluggable
> > > > 
> > > > So I think the only one that we need to treat specially is PCI.
> > > > 
> > > > As far as I am aware PCI is the only bus (or maybe just the only bus
> > > > that we support?) where ranges means the aperture.
> > > 
> > > Now that I think about this, there is another "hotpluggable" scenario we
> > > need to think about:
> > > 
> > > [1] https://marc.info/?l=xen-devel&m=163056546214978
> > > 
> > > Xilinx devices have FPGA regions with apertures currently not described
> > > in device tree, where things can programmed in PL at runtime making new
> > > devices appear with new MMIO regions out of thin air.
> > > 
> > > Now let me start by saying that yes, the entire programmable region
> > > aperture could probably be described in device tree, however, in
> > > reality it is not currently done in any of the device trees we use
> > > (including the upstream device trees in linux.git).
> > 
> > This is rather annoying, but not unheard. There are a couple of platforms
> > where the MMIOs are not fully described in the DT.
> > 
> > In fact, we have a callback 'specific_mappings' which create additional
> > mappings (e.g. on the omap5) for dom0.
> > 
> > > 
> > > So, we have a problem :-(
> > > 
> > > 
> > > I can work toward getting the right info on device tree, but in reality
> > > that is going to take time and for now the device tree doesn't have the
> > > FPGA aperture in it. So if we accept this series as is, it is going to
> > > stop features like [1] from working. >
> > > If we cannot come up with any better plans, I think it would be better
> > > to drop find_memory_holes, only rely on find_unallocated_memory even
> > > when the IOMMU is on. One idea is that we could add on top of the
> > > regions found by find_unallocated_memory any MMIO regions marked as
> > > xen,passthrough: they are safe because they are not going to dom0 anyway.
> > 
> > (Oleksandr, it looks like some rationale about the different approach is
> > missing in the commit message. Can you add it?)
> 
> Yes sure, but let me please clarify what is different approach in this
> context. Is it to *also* take into the account MMIO regions of the devices for
> passthrough for case when IOMMU is off (in addition to unallocated memory)? If
> yes, I wonder whether we will gain much with that according to that device's
> MMIO regions are usually not big enough and we stick to allocate extended
> regions with bigger size (> 64MB).

That's fair enough. There are a couple of counter examples where the
MMIO regions for the device to assign are quite large, for instance a
GPU, Xilinx AIEngine, or the PCIe Root Complex with the entire aperture,
but maybe they are not that common. I am not sure if it is worth
scanning the tree for xen,passthrough regions every time at boot for
this.
--8323329-1942625641-1632180080=:17979--

