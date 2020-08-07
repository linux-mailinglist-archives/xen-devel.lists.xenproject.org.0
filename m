Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1F23F49B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AH7-0004wJ-Sj; Fri, 07 Aug 2020 21:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AH6-0004vg-Ak
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:51:40 +0000
X-Inumbo-ID: feecf013-7a49-4498-a040-f30b92ad38a0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id feecf013-7a49-4498-a040-f30b92ad38a0;
 Fri, 07 Aug 2020 21:51:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BE232224D;
 Fri,  7 Aug 2020 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837098;
 bh=omEu2n5h0G8ePh6GhttUk/F2l7a9JCfDphcbEaPW80M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=c08Dr5Myy0DMhAqbumcuIiViBd3yj5u1OgvWS2RTXsI9/9djra425bTgbZ5pd1veX
 r2e5rgq5/IXklacjFxCMyF4iSKkLm+6ekEnMeg+snG6gaJ0tNqVvB1YjyUAizZW8kS
 AVaaCFYu8sdPW2x31cQeK9eTA1kJ5fgcpowJQ5lg=
Date: Fri, 7 Aug 2020 14:51:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 08/14] kernel-doc: public/memory.h
In-Reply-To: <5567ef5a-35c4-6dd8-38f5-348c7c3713b1@suse.com>
Message-ID: <alpine.DEB.2.21.2008071217590.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-8-sstabellini@kernel.org>
 <5567ef5a-35c4-6dd8-38f5-348c7c3713b1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 7 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 01:49, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Convert in-code comments to kernel-doc format wherever possible.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >  xen/include/public/memory.h | 232 ++++++++++++++++++++++++------------
> >  1 file changed, 155 insertions(+), 77 deletions(-)
> > 
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index 21057ed78e..4c57ed213c 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -30,7 +30,9 @@
> >  #include "xen.h"
> >  #include "physdev.h"
> >  
> > -/*
> > +/**
> > + * DOC: XENMEM_increase_reservation and XENMEM_decrease_reservation
> > + *
> >   * Increase or decrease the specified domain's memory reservation. Returns the
> >   * number of extents successfully allocated or freed.
> >   * arg == addr of struct xen_memory_reservation.
> > @@ -40,29 +42,37 @@
> >  #define XENMEM_populate_physmap     6
> >  
> >  #if __XEN_INTERFACE_VERSION__ >= 0x00030209
> > -/*
> > - * Maximum # bits addressable by the user of the allocated region (e.g., I/O
> > - * devices often have a 32-bit limitation even in 64-bit systems). If zero
> > - * then the user has no addressing restriction. This field is not used by
> > - * XENMEM_decrease_reservation.
> > +/**
> > + * DOC: XENMEMF_*
> > + *
> > + * - XENMEMF_address_bits, XENMEMF_get_address_bits:
> > + *       Maximum # bits addressable by the user of the allocated region
> > + *       (e.g., I/O devices often have a 32-bit limitation even in 64-bit
> > + *       systems). If zero then the user has no addressing restriction. This
> > + *       field is not used by XENMEM_decrease_reservation.
> > + * - XENMEMF_node, XENMEMF_get_node: NUMA node to allocate from
> > + * - XENMEMF_populate_on_demand: Flag to populate physmap with populate-on-demand entries
> > + * - XENMEMF_exact_node_request, XENMEMF_exact_node: Flag to request allocation only from the node specified
> 
> Nit: overly long line

I'll fix


> > + * - XENMEMF_vnode: Flag to indicate the node specified is virtual node
> >   */
> >  #define XENMEMF_address_bits(x)     (x)
> >  #define XENMEMF_get_address_bits(x) ((x) & 0xffu)
> > -/* NUMA node to allocate from. */
> >  #define XENMEMF_node(x)     (((x) + 1) << 8)
> >  #define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
> > -/* Flag to populate physmap with populate-on-demand entries */
> >  #define XENMEMF_populate_on_demand (1<<16)
> > -/* Flag to request allocation only from the node specified */
> >  #define XENMEMF_exact_node_request  (1<<17)
> >  #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
> > -/* Flag to indicate the node specified is virtual node */
> >  #define XENMEMF_vnode  (1<<18)
> >  #endif
> >  
> > +/**
> > + * struct xen_memory_reservation
> > + */
> >  struct xen_memory_reservation {
> >  
> > -    /*
> > +    /**
> > +     * @extent_start:
> > +     *
> 
> Take the opportunity and drop the stray blank line?
 
Sure


> > @@ -200,90 +236,115 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
> >   */
> >  #define XENMEM_machphys_compat_mfn_list     25
> >  
> > -/*
> > +#define XENMEM_machphys_mapping     12
> > +/**
> > + * struct xen_machphys_mapping - XENMEM_machphys_mapping
> > + *
> >   * Returns the location in virtual address space of the machine_to_phys
> >   * mapping table. Architectures which do not have a m2p table, or which do not
> >   * map it by default into guest address space, do not implement this command.
> >   * arg == addr of xen_machphys_mapping_t.
> >   */
> > -#define XENMEM_machphys_mapping     12
> >  struct xen_machphys_mapping {
> > +    /** @v_start: Start virtual address */
> >      xen_ulong_t v_start, v_end; /* Start and end virtual addresses.   */
> > -    xen_ulong_t max_mfn;        /* Maximum MFN that can be looked up. */
> > +    /** @v_end: End virtual addresses */
> > +    xen_ulong_t v_end;
> > +    /** @max_mfn: Maximum MFN that can be looked up */
> > +    xen_ulong_t max_mfn;
> >  };
> >  typedef struct xen_machphys_mapping xen_machphys_mapping_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
> >  
> > -/* Source mapping space. */
> > +/**
> > + * DOC: Source mapping space.
> > + *
> > + * - XENMAPSPACE_shared_info:  shared info page
> > + * - XENMAPSPACE_grant_table:  grant table page
> > + * - XENMAPSPACE_gmfn:         GMFN
> > + * - XENMAPSPACE_gmfn_range:   GMFN range, XENMEM_add_to_physmap only.
> > + * - XENMAPSPACE_gmfn_foreign: GMFN from another dom,
> > + *                             XENMEM_add_to_physmap_batch only.
> > + * - XENMAPSPACE_dev_mmio:     device mmio region ARM only; the region is mapped
> > + *                             in Stage-2 using the Normal MemoryInner/Outer
> > + *                             Write-Back Cacheable memory attribute.
> > + */
> >  /* ` enum phys_map_space { */
> 
> Isn't this and ...
> 
> > -#define XENMAPSPACE_shared_info  0 /* shared info page */
> > -#define XENMAPSPACE_grant_table  1 /* grant table page */
> > -#define XENMAPSPACE_gmfn         2 /* GMFN */
> > -#define XENMAPSPACE_gmfn_range   3 /* GMFN range, XENMEM_add_to_physmap only. */
> > -#define XENMAPSPACE_gmfn_foreign 4 /* GMFN from another dom,
> > -                                    * XENMEM_add_to_physmap_batch only. */
> > -#define XENMAPSPACE_dev_mmio     5 /* device mmio region
> > -                                      ARM only; the region is mapped in
> > -                                      Stage-2 using the Normal Memory
> > -                                      Inner/Outer Write-Back Cacheable
> > -                                      memory attribute. */
> > +#define XENMAPSPACE_shared_info  0
> > +#define XENMAPSPACE_grant_table  1
> > +#define XENMAPSPACE_gmfn         2
> > +#define XENMAPSPACE_gmfn_range   3
> > +#define XENMAPSPACE_gmfn_foreign 4
> > +#define XENMAPSPACE_dev_mmio     5
> >  /* ` } */
> 
> ... this also something that wants converting?

For clarity, I take you are talking about these two enum-related
comments:

/* ` enum phys_map_space { */
[... various #defines ... ]
/* ` } */

Is this something we want to convert to kernel-doc? I don't know. I
couldn't see an obvious value in doing it, in the sense that it doesn't
necessarely make things clearer.

I took a second look at the header and the following would work:

/**
 * DOC: Source mapping space.
 *
 * enum phys_map_space {
 *
 * - XENMAPSPACE_shared_info:  shared info page
 * - XENMAPSPACE_grant_table:  grant table page
 * - XENMAPSPACE_gmfn:         GMFN
 * - XENMAPSPACE_gmfn_range:   GMFN range, XENMEM_add_to_physmap only.
 * - XENMAPSPACE_gmfn_foreign: GMFN from another dom,
 *                             XENMEM_add_to_physmap_batch only.
 * - XENMAPSPACE_dev_mmio:     device mmio region ARM only; the region is mapped
 *                             in Stage-2 using the Normal MemoryInner/Outer
 *                             Write-Back Cacheable memory attribute.
 * }
 */

Note the blank line after "enum phys_map_space {" is required.


All in all I am in favor of *not* converting the enum comment to
kernel-doc, but I'd be OK with it anyway.

