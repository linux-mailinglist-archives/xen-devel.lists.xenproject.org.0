Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4493FE25E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 20:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176616.321380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLV0j-00063L-GL; Wed, 01 Sep 2021 18:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176616.321380; Wed, 01 Sep 2021 18:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLV0j-000609-D8; Wed, 01 Sep 2021 18:30:57 +0000
Received: by outflank-mailman (input) for mailman id 176616;
 Wed, 01 Sep 2021 18:30:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLV0h-000603-Ve
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 18:30:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d05f4a3-0a22-45c4-9358-3b17bc4240e3;
 Wed, 01 Sep 2021 18:30:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DE5461090;
 Wed,  1 Sep 2021 18:30:54 +0000 (UTC)
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
X-Inumbo-ID: 1d05f4a3-0a22-45c4-9358-3b17bc4240e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630521054;
	bh=PI67GhDQWWeYIukosO0exq6kkx/XCvPBL+4kl7aUjaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j+oevX6Pi+xFWQOjT69dJfBnwrbu/z0PbpQySvHDFCre2oH+paWL4Fe7TLqvN6UuF
	 f1Od+l5IlLHWQMkRfeg/M2/Lti0gNJAMEcsjQkplFAy2kKkjhHrJj6AIAdUx1fGkLa
	 p7gCUYYALULKL0cFZH0GP2Ax/nAvtxSNsVLPTYRrQXPJj8gLHiT4IfIMMl1IZZiBz+
	 VxYqdYrmSu61YiwZajWJEE5wxt3RdAB3uVcT1Bme9O8Fp8O3RQZsp6/w9rYOT+CoDq
	 t2neVELFFfn4QgVyl64mu7W2Pbq68qFp19Z5su2+cL56cDlcovkhuJy4c3+cwK1buN
	 m7LEcmGY0mADA==
Date: Wed, 1 Sep 2021 11:30:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA
 data from device tree
In-Reply-To: <088e4b16-afea-8248-55f1-a081bba7f80c@xen.org>
Message-ID: <alpine.DEB.2.21.2109011129050.17925@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-26-wei.chen@arm.com> <alpine.DEB.2.21.2108301752501.17851@sstabellini-ThinkPad-T480s> <088e4b16-afea-8248-55f1-a081bba7f80c@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Aug 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 31/08/2021 01:54, Stefano Stabellini wrote:
> > On Wed, 11 Aug 2021, Wei Chen wrote:
> > > In this API, we scan whole device tree to parse CPU node id, memory
> > > node id and distance-map. Though early_scan_node will invoke has a
> > > handler to process memory nodes. If we want to parse memory node id
> > > in this handler, we have to embeded NUMA parse code in this handler.
> > > But we still need to scan whole device tree to find CPU NUMA id and
> > > distance-map. In this case, we include memory NUMA id parse in this
> > > API too. Another benefit is that we have a unique entry for device
> > > tree NUMA data parse.
> > > 
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > >   xen/arch/arm/numa_device_tree.c | 31 ++++++++++++++++++++++++++++---
> > >   xen/include/asm-arm/numa.h      |  1 +
> > >   2 files changed, 29 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/numa_device_tree.c
> > > b/xen/arch/arm/numa_device_tree.c
> > > index 6e0d1d3d9f..27ffb72f7b 100644
> > > --- a/xen/arch/arm/numa_device_tree.c
> > > +++ b/xen/arch/arm/numa_device_tree.c
> > > @@ -131,7 +131,8 @@ save_memblk:
> > >   }
> > >     /* Parse CPU NUMA node info */
> > > -int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
> > > +static int __init
> > > +device_tree_parse_numa_cpu_node(const void *fdt, int node)
> > >   {
> > >       uint32_t nid;
> > >   @@ -147,7 +148,7 @@ int __init device_tree_parse_numa_cpu_node(const
> > > void *fdt, int node)
> > >   }
> > >     /* Parse memory node NUMA info */
> > > -int __init
> > > +static int __init
> > >   device_tree_parse_numa_memory_node(const void *fdt, int node,
> > >       const char *name, uint32_t addr_cells, uint32_t size_cells)
> > >   {
> > > @@ -202,7 +203,7 @@ device_tree_parse_numa_memory_node(const void *fdt,
> > > int node,
> > >   }
> > >     /* Parse NUMA distance map v1 */
> > > -int __init
> > > +static int __init
> > >   device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
> > >   {
> > >       const struct fdt_property *prop;
> > > @@ -267,3 +268,27 @@ device_tree_parse_numa_distance_map_v1(const void
> > > *fdt, int node)
> > >         return 0;
> > >   }
> > > +
> > > +static int __init fdt_scan_numa_nodes(const void *fdt,
> > > +                int node, const char *uname, int depth,
> > > +                u32 address_cells, u32 size_cells, void *data)
> > > +{
> > > +    int ret = 0;
> > > +
> > > +    if ( fdt_node_check_type(fdt, node, "cpu") == 0 )
> > > +        ret = device_tree_parse_numa_cpu_node(fdt, node);
> > > +    else if ( fdt_node_check_type(fdt, node, "memory") == 0 )
> > > +        ret = device_tree_parse_numa_memory_node(fdt, node, uname,
> > > +                                address_cells, size_cells);
> > > +    else if ( fdt_node_check_compatible(fdt, node,
> > > +                                "numa-distance-map-v1") == 0 )
> > > +        ret = device_tree_parse_numa_distance_map_v1(fdt, node);
> > > +
> > > +    return ret;
> > > +}
> > 
> > Julien, do you have an opinion on whether it might be worth reusing the
> > existing early_scan_node function for this to avoiding another full FDT
> > scan (to avoid another call to device_tree_for_each_node)?
> 
> I don't like the full FDT scan and actually drafted an e-mail in reply-to [1]
> to suggest parse all the NUMA information from early_scan_node().
> 
> However, we don't know whether ACPI or DT will be used at the time
> early_scan_node() is called. So we will need to revert any change which can
> make the code a little more awkward.
> 
> So I decided to drop my e-mail because I prefer the full DT scan for now. We
> can look at optimizing later if this becomes a pain point.

Uhm, yes you are right.

We would have to move some of the logic to detect ACPI earlier to
early_scan_node (e.g. xen/arch/arm/acpi/boot.c:dt_scan_depth1_nodes).
That could actually be a good idea, but it is true that could be done
with a separate patch later.

