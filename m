Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BB410165
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 00:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189747.339619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRMUC-0007RR-LR; Fri, 17 Sep 2021 22:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189747.339619; Fri, 17 Sep 2021 22:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRMUC-0007Oe-I3; Fri, 17 Sep 2021 22:37:36 +0000
Received: by outflank-mailman (input) for mailman id 189747;
 Fri, 17 Sep 2021 22:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRMUB-0007OY-Cp
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 22:37:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d984e266-1807-11ec-b73c-12813bfff9fa;
 Fri, 17 Sep 2021 22:37:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0C5E6113A;
 Fri, 17 Sep 2021 22:37:32 +0000 (UTC)
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
X-Inumbo-ID: d984e266-1807-11ec-b73c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631918253;
	bh=CUjCHVm6pyMaK2hZ3SXWr+2ugHPouhVVfUKVTVrvP5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q7yJwAwKUf2+L13Pr3Vkl2hCyGavmc2nMDs9Am/eMhZdIf7g+FhlPwMao9PNnagWh
	 jWYLNc9F/0jMJfnVzj5KrlR812Wf5YBr/9b3CO9mwjsY2U3QZL/NVGJHudC8VgIRmY
	 JQHNaDZQnyvuYVgR/UpfJshJvUORRkvTiQgi5g1QQKQoW9udKdXI8YaS6OtiKbSYnT
	 AKtP45ZsdwX2vImqZu17P6qYCz/pN71YMHNueBHf4iayTafC9omFoFderbkCBhvWjD
	 o5OLBgTr2OnUmePn2baXjJJtlO3X2kS+MqwRryUcIvGJ2ZRDPIJD2xkIO1Pu/ndFQs
	 aTQpdI89dJLwA==
Date: Fri, 17 Sep 2021 15:37:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Oleksandr <olekstysh@gmail.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com> <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org> <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1207203985-1631916030=:21985"
Content-ID: <alpine.DEB.2.21.2109171500460.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1207203985-1631916030=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109171500461.21985@sstabellini-ThinkPad-T480s>

On Fri, 17 Sep 2021, Stefano Stabellini wrote:
> On Fri, 17 Sep 2021, Oleksandr wrote:
> > > > +
> > > > +    dt_dprintk("Find unallocated memory for extended regions\n");
> > > > +
> > > > +    unalloc_mem = rangeset_new(NULL, NULL, 0);
> > > > +    if ( !unalloc_mem )
> > > > +        return -ENOMEM;
> > > > +
> > > > +    /* Start with all available RAM */
> > > > +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> > > > +    {
> > > > +        start = bootinfo.mem.bank[i].start;
> > > > +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
> > > > +        res = rangeset_add_range(unalloc_mem, start, end);
> > > > +        if ( res )
> > > > +        {
> > > > +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> > > > +                   start, end);
> > > > +            goto out;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    /* Remove RAM assigned to Dom0 */
> > > > +    for ( i = 0; i < assign_mem->nr_banks; i++ )
> > > > +    {
> > > > +        start = assign_mem->bank[i].start;
> > > > +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
> > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > +        if ( res )
> > > > +        {
> > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > +                   start, end);
> > > > +            goto out;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    /* Remove reserved-memory regions */
> > > > +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> > > > +    {
> > > > +        start = bootinfo.reserved_mem.bank[i].start;
> > > > +        end = bootinfo.reserved_mem.bank[i].start +
> > > > +            bootinfo.reserved_mem.bank[i].size - 1;
> > > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > > +        if ( res )
> > > > +        {
> > > > +            printk(XENLOG_ERR "Failed to remove:
> > > > %#"PRIx64"->%#"PRIx64"\n",
> > > > +                   start, end);
> > > > +            goto out;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    /* Remove grant table region */
> > > > +    start = kinfo->gnttab_start;
> > > > +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
> > > > +    res = rangeset_remove_range(unalloc_mem, start, end);
> > > > +    if ( res )
> > > > +    {
> > > > +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> > > > +               start, end);
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    start = EXT_REGION_START;
> > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > +    res = rangeset_report_ranges(unalloc_mem, start, end,
> > > > +                                 add_ext_regions, ext_regions);
> > > > +    if ( res )
> > > > +        ext_regions->nr_banks = 0;
> > > > +    else if ( !ext_regions->nr_banks )
> > > > +        res = -ENOENT;
> > > > +
> > > > +out:
> > > > +    rangeset_destroy(unalloc_mem);
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static int __init find_memory_holes(const struct kernel_info *kinfo,
> > > > +                                    struct meminfo *ext_regions)
> > > > +{
> > > > +    struct dt_device_node *np;
> > > > +    struct rangeset *mem_holes;
> > > > +    paddr_t start, end;
> > > > +    unsigned int i;
> > > > +    int res;
> > > > +
> > > > +    dt_dprintk("Find memory holes for extended regions\n");
> > > > +
> > > > +    mem_holes = rangeset_new(NULL, NULL, 0);
> > > > +    if ( !mem_holes )
> > > > +        return -ENOMEM;
> > > > +
> > > > +    /* Start with maximum possible addressable physical memory range */
> > > > +    start = EXT_REGION_START;
> > > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > > +    res = rangeset_add_range(mem_holes, start, end);
> > > > +    if ( res )
> > > > +    {
> > > > +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> > > > +               start, end);
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
> > > 
> > > Well... The loop below is not going to handle all the regions described in
> > > the property "reg". Instead, it will cover a subset of "reg" where the
> > > memory is addressable.
> > 
> > As I understand, we are only interested in subset of "reg" where the memory is
> > addressable.
> > 
> > 
> > > 
> > > 
> > > You will also need to cover "ranges" that will describe the BARs for the PCI
> > > devices.
> > Good point.
> 
> Yes, very good point!
> 
> 
> > Could you please clarify how to recognize whether it is a PCI
> > device as long as PCI support is not merged? Or just to find any device nodes
> > with non-empty "ranges" property
> > and retrieve addresses?
> 
> Normally any bus can have a ranges property with the aperture and
> possible address translations, including /amba (compatible =
> "simple-bus"). However, in these cases dt_device_get_address already
> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
> 
> The PCI bus is special for 2 reasons:
> - the ranges property has a different format
> - the bus is hot-pluggable
> 
> So I think the only one that we need to treat specially is PCI.
> 
> As far as I am aware PCI is the only bus (or maybe just the only bus
> that we support?) where ranges means the aperture.

Now that I think about this, there is another "hotpluggable" scenario we
need to think about:

[1] https://marc.info/?l=xen-devel&m=163056546214978

Xilinx devices have FPGA regions with apertures currently not described
in device tree, where things can programmed in PL at runtime making new
devices appear with new MMIO regions out of thin air.

Now let me start by saying that yes, the entire programmable region
aperture could probably be described in device tree, however, in
reality it is not currently done in any of the device trees we use
(including the upstream device trees in linux.git).

So, we have a problem :-(


I can work toward getting the right info on device tree, but in reality
that is going to take time and for now the device tree doesn't have the
FPGA aperture in it. So if we accept this series as is, it is going to
stop features like [1] from working.

If we cannot come up with any better plans, I think it would be better
to drop find_memory_holes, only rely on find_unallocated_memory even
when the IOMMU is on. One idea is that we could add on top of the
regions found by find_unallocated_memory any MMIO regions marked as
xen,passthrough: they are safe because they are not going to dom0 anyway.

The only alternative I can think of is to have a per-board
enable/disable toggle for the extend region but it would be very ugly.
--8323329-1207203985-1631916030=:21985--

