Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DC4100F5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 23:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189732.339597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRLqL-0001lh-3V; Fri, 17 Sep 2021 21:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189732.339597; Fri, 17 Sep 2021 21:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRLqK-0001iu-VW; Fri, 17 Sep 2021 21:56:24 +0000
Received: by outflank-mailman (input) for mailman id 189732;
 Fri, 17 Sep 2021 21:56:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRLqK-0001io-2S
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 21:56:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 079dac70-fbc7-4fc8-9b70-80c28e69822c;
 Fri, 17 Sep 2021 21:56:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE41861212;
 Fri, 17 Sep 2021 21:56:21 +0000 (UTC)
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
X-Inumbo-ID: 079dac70-fbc7-4fc8-9b70-80c28e69822c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631915782;
	bh=DXFEsf7Ah+ri2OUA8b05bEelNaJwBed7q8ydY0juMac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rrtw+guji0Ese/PQlHh+TPTc0aMxDi9Q9NLWgwL6/SIHcmXRvZx6Oc2qsfSNWPBjv
	 cA1tDMfZ8riW7fANve1OPIjMprVaxVrZO1o58jQzpo/fg55M76R4cd3/hI2f2rGivN
	 id0DyVdFGD8qSmBmkT7FlpzlcYjo5918HeHBjFeGJzyVIItKMEazakLvrmbVrTSmBB
	 RMQGWcAFXN5D0KjwOo+hYFRyYLpkOPxpYE56Go4fMvea804TXnrZP2IJwNEpnsfcBi
	 Zl0kJoWZM2OLFG1FvgcHcz1RYtxPSKNoxQ9X1YQE0VSr4V9aj0afYBs0fr/f/5QOLT
	 75yCcPqZN3zFQ==
Date: Fri, 17 Sep 2021 14:56:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
Message-ID: <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com> <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org> <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-47340259-1631915598=:21985"
Content-ID: <alpine.DEB.2.21.2109171453231.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-47340259-1631915598=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109171453232.21985@sstabellini-ThinkPad-T480s>

On Fri, 17 Sep 2021, Oleksandr wrote:
> > > +
> > > +    dt_dprintk("Find unallocated memory for extended regions\n");
> > > +
> > > +    unalloc_mem = rangeset_new(NULL, NULL, 0);
> > > +    if ( !unalloc_mem )
> > > +        return -ENOMEM;
> > > +
> > > +    /* Start with all available RAM */
> > > +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> > > +    {
> > > +        start = bootinfo.mem.bank[i].start;
> > > +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
> > > +        res = rangeset_add_range(unalloc_mem, start, end);
> > > +        if ( res )
> > > +        {
> > > +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> > > +                   start, end);
> > > +            goto out;
> > > +        }
> > > +    }
> > > +
> > > +    /* Remove RAM assigned to Dom0 */
> > > +    for ( i = 0; i < assign_mem->nr_banks; i++ )
> > > +    {
> > > +        start = assign_mem->bank[i].start;
> > > +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
> > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > +        if ( res )
> > > +        {
> > > +            printk(XENLOG_ERR "Failed to remove:
> > > %#"PRIx64"->%#"PRIx64"\n",
> > > +                   start, end);
> > > +            goto out;
> > > +        }
> > > +    }
> > > +
> > > +    /* Remove reserved-memory regions */
> > > +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> > > +    {
> > > +        start = bootinfo.reserved_mem.bank[i].start;
> > > +        end = bootinfo.reserved_mem.bank[i].start +
> > > +            bootinfo.reserved_mem.bank[i].size - 1;
> > > +        res = rangeset_remove_range(unalloc_mem, start, end);
> > > +        if ( res )
> > > +        {
> > > +            printk(XENLOG_ERR "Failed to remove:
> > > %#"PRIx64"->%#"PRIx64"\n",
> > > +                   start, end);
> > > +            goto out;
> > > +        }
> > > +    }
> > > +
> > > +    /* Remove grant table region */
> > > +    start = kinfo->gnttab_start;
> > > +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
> > > +    res = rangeset_remove_range(unalloc_mem, start, end);
> > > +    if ( res )
> > > +    {
> > > +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> > > +               start, end);
> > > +        goto out;
> > > +    }
> > > +
> > > +    start = EXT_REGION_START;
> > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > +    res = rangeset_report_ranges(unalloc_mem, start, end,
> > > +                                 add_ext_regions, ext_regions);
> > > +    if ( res )
> > > +        ext_regions->nr_banks = 0;
> > > +    else if ( !ext_regions->nr_banks )
> > > +        res = -ENOENT;
> > > +
> > > +out:
> > > +    rangeset_destroy(unalloc_mem);
> > > +
> > > +    return res;
> > > +}
> > > +
> > > +static int __init find_memory_holes(const struct kernel_info *kinfo,
> > > +                                    struct meminfo *ext_regions)
> > > +{
> > > +    struct dt_device_node *np;
> > > +    struct rangeset *mem_holes;
> > > +    paddr_t start, end;
> > > +    unsigned int i;
> > > +    int res;
> > > +
> > > +    dt_dprintk("Find memory holes for extended regions\n");
> > > +
> > > +    mem_holes = rangeset_new(NULL, NULL, 0);
> > > +    if ( !mem_holes )
> > > +        return -ENOMEM;
> > > +
> > > +    /* Start with maximum possible addressable physical memory range */
> > > +    start = EXT_REGION_START;
> > > +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> > > +    res = rangeset_add_range(mem_holes, start, end);
> > > +    if ( res )
> > > +    {
> > > +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> > > +               start, end);
> > > +        goto out;
> > > +    }
> > > +
> > > +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
> > 
> > Well... The loop below is not going to handle all the regions described in
> > the property "reg". Instead, it will cover a subset of "reg" where the
> > memory is addressable.
> 
> As I understand, we are only interested in subset of "reg" where the memory is
> addressable.
> 
> 
> > 
> > 
> > You will also need to cover "ranges" that will describe the BARs for the PCI
> > devices.
> Good point.

Yes, very good point!


> Could you please clarify how to recognize whether it is a PCI
> device as long as PCI support is not merged? Or just to find any device nodes
> with non-empty "ranges" property
> and retrieve addresses?

Normally any bus can have a ranges property with the aperture and
possible address translations, including /amba (compatible =
"simple-bus"). However, in these cases dt_device_get_address already
takes care of it, see xen/common/device_tree.c:dt_device_get_address.

The PCI bus is special for 2 reasons:
- the ranges property has a different format
- the bus is hot-pluggable

So I think the only one that we need to treat specially is PCI.

As far as I am aware PCI is the only bus (or maybe just the only bus
that we support?) where ranges means the aperture.
--8323329-47340259-1631915598=:21985--

