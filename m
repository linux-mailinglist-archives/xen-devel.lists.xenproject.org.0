Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14641A642
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 06:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197383.350407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4IU-0006xQ-T6; Tue, 28 Sep 2021 04:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197383.350407; Tue, 28 Sep 2021 04:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4IU-0006u5-PO; Tue, 28 Sep 2021 04:00:50 +0000
Received: by outflank-mailman (input) for mailman id 197383;
 Tue, 28 Sep 2021 04:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV4IT-0006ty-Hn
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:00:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d9fb0a6-dc2d-4a63-ad1a-66968e0e20c3;
 Tue, 28 Sep 2021 04:00:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1795F611F2;
 Tue, 28 Sep 2021 04:00:46 +0000 (UTC)
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
X-Inumbo-ID: 1d9fb0a6-dc2d-4a63-ad1a-66968e0e20c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632801646;
	bh=8plRDu2QTjNKaoPcm7y+cJOGQ+Q0fXhT5TdsYLQyKyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k+WM1FKIODP9mm2A408I85xRJwDP6THtWlRcrE71hIGcHn01bGGA1fT7eGBijtbDQ
	 ev9Dt+XYZOgzsVT6qg8vkLSUTkC+dsGXle49i1Tac82SijW/R5AzkYxuo/gyN7n8rh
	 XOE/rYJGl2pnaLIMwj6ZbQkIor6rNDX0ypdcCJCEhKTvkjh9MUyvUNFZjKHX7LaMQs
	 /uf9cd/EkCNAAI3OTcgdRwjkqdAseiQIasXlueW5z68pRYoVhRsXQO7hzU2/C0GtZY
	 KdoXx+DbiZJ/5LyAP5q5wrtU0VhVbyiDUGsURz1BJMUQZwmGdv5SRHr1X/QGDYGir5
	 8bLK1JQrnmhhw==
Date: Mon, 27 Sep 2021 21:00:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2 10/11] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
In-Reply-To: <d5704571-eade-4bc8-b6c6-f4b3810b8b21@epam.com>
Message-ID: <alpine.DEB.2.21.2109272046320.5022@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-11-andr2000@gmail.com> <alpine.DEB.2.21.2109241724210.17979@sstabellini-ThinkPad-T480s> <d5704571-eade-4bc8-b6c6-f4b3810b8b21@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1264100615-1632801182=:5022"
Content-ID: <alpine.DEB.2.21.2109272053060.5022@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1264100615-1632801182=:5022
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109272053061.5022@sstabellini-ThinkPad-T480s>

On Mon, 27 Sep 2021, Oleksandr Andrushchenko wrote:
> On 25.09.21 03:44, Stefano Stabellini wrote:
> > On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> PCI host bridges are special devices in terms of implementing PCI
> >> passthrough. According to [1] the current implementation depends on
> >> Domain-0 to perform the initialization of the relevant PCI host
> >> bridge hardware and perform PCI device enumeration. In order to
> >> achieve that one of the required changes is to not map all the memory
> >> ranges in map_range_to_domain as we traverse the device tree on startup
> >> and perform some additional checks if the range needs to be mapped to
> >> Domain-0.
> >>
> >> The generic PCI host controller device tree binding says [2]:
> >> - ranges: As described in IEEE Std 1275-1994, but must provide
> >>            at least a definition of non-prefetchable memory. One
> >>            or both of prefetchable Memory and IO Space may also
> >>            be provided.
> >>
> >> - reg   : The Configuration Space base address and size, as accessed
> >>            from the parent bus.  The base address corresponds to
> >>            the first bus in the "bus-range" property.  If no
> >>            "bus-range" is specified, this will be bus 0 (the default).
> >>
> >> >From the above none of the memory ranges from the "ranges" property
> >> needs to be mapped to Domain-0 at startup as MMIO mapping is going to
> >> be handled dynamically by vPCI as we assign PCI devices, e.g. each
> >> device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
> >> as needed by Xen.
> >>
> >> The "reg" property covers not only ECAM space, but may also have other
> >> then the configuration memory ranges described, for example [3]:
> >> - reg: Should contain rc_dbi, config registers location and length.
> >> - reg-names: Must include the following entries:
> >>     "rc_dbi": controller configuration registers;
> >>     "config": PCIe configuration space registers.
> >>
> >> This patch makes it possible to not map all the ranges from the
> >> "ranges" property and also ECAM from the "reg". All the rest from the
> >> "reg" property still needs to be mapped to Domain-0, so the PCI
> >> host bridge remains functional in Domain-0.
> >>
> >> [1] https://urldefense.com/v3/__https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html__;!!GF_29dbcQIUBPA!lrCuNRzUVkRf4FLgp3hW-4uOldgKr4qNpZb_ufI0jW-O0eRH11VFDeGcs5pPdtKZT1_ou4InSg$ [lists[.]xenproject[.]org]
> >> [2] https://urldefense.com/v3/__https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt__;!!GF_29dbcQIUBPA!lrCuNRzUVkRf4FLgp3hW-4uOldgKr4qNpZb_ufI0jW-O0eRH11VFDeGcs5pPdtKZT1_T5yn7GA$ [kernel[.]org]
> >> [3] https://urldefense.com/v3/__https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt__;!!GF_29dbcQIUBPA!lrCuNRzUVkRf4FLgp3hW-4uOldgKr4qNpZb_ufI0jW-O0eRH11VFDeGcs5pPdtKZT18im_Y2tw$ [kernel[.]org]
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> ---
> >> Since v1:
> >>   - Added better description of why and what needs to be mapped into
> >>     Domain-0's p2m and what doesn't
> >>   - Do not do any mappings for PCI devices while traversing the DT
> >>   - Walk all the bridges and make required mappings in one go
> >> ---
> >>   xen/arch/arm/domain_build.c        | 38 +++++++++++++++--------
> >>   xen/arch/arm/pci/ecam.c            | 14 +++++++++
> >>   xen/arch/arm/pci/pci-host-common.c | 48 ++++++++++++++++++++++++++++++
> >>   xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
> >>   xen/include/asm-arm/pci.h          |  9 ++++++
> >>   xen/include/asm-arm/setup.h        | 13 ++++++++
> >>   6 files changed, 111 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >> index 83ab0d52cce9..e72c1b881cae 100644
> >> --- a/xen/arch/arm/domain_build.c
> >> +++ b/xen/arch/arm/domain_build.c
> >> @@ -10,7 +10,6 @@
> >>   #include <asm/regs.h>
> >>   #include <xen/errno.h>
> >>   #include <xen/err.h>
> >> -#include <xen/device_tree.h>
> >>   #include <xen/libfdt/libfdt.h>
> >>   #include <xen/guest_access.h>
> >>   #include <xen/iocap.h>
> >> @@ -47,12 +46,6 @@ static int __init parse_dom0_mem(const char *s)
> >>   }
> >>   custom_param("dom0_mem", parse_dom0_mem);
> >>   
> >> -struct map_range_data
> >> -{
> >> -    struct domain *d;
> >> -    p2m_type_t p2mt;
> >> -};
> >> -
> >>   /* Override macros from asm/page.h to make them work with mfn_t */
> >>   #undef virt_to_mfn
> >>   #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >> @@ -1388,9 +1381,8 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
> >>       return 0;
> >>   }
> >>   
> >> -static int __init map_range_to_domain(const struct dt_device_node *dev,
> >> -                                      u64 addr, u64 len,
> >> -                                      void *data)
> >> +int __init map_range_to_domain(const struct dt_device_node *dev,
> >> +                               u64 addr, u64 len, void *data)
> >>   {
> >>       struct map_range_data *mr_data = data;
> >>       struct domain *d = mr_data->d;
> >> @@ -1417,6 +1409,13 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
> >>           }
> >>       }
> >>   
> >> +#ifdef CONFIG_HAS_PCI
> >> +    if ( is_pci_passthrough_enabled() &&
> >> +         (device_get_class(dev) == DEVICE_PCI) &&
> >> +         !mr_data->map_pci_bridge )
> >> +        need_mapping = false;
> >> +#endif
> > With the change I suggested below turning map_pci_bridge into
> > skip_mapping, then this check could go away if we just set need_mapping
> > as follows:
> >
> > bool need_mapping = !dt_device_for_passthrough(dev) &&
> >                      !mr_data->skip_mapping;
> 
> Not exactly. This check, e.g.
> 
> "is_pci_passthrough_enabled() && (device_get_class(dev) == DEVICE_PCI)"
> 
> really protects us from mapping any of the ranges belonging to a PCI device:
> 
> we scan the device tree and for each node we call map_range_to_domain
> 
> with skip_mapping == false (it is called from map_device_children).
> 
> So, if there is no check then the mapping is performed even for PCI devices
> 
> which we do not want.
> 
> But, yes we can simplify the logic to:
> 
> bool need_mapping = !dt_device_for_passthrough(dev) &&
>                      !mr_data->skip_mapping;
> 
> #ifdef CONFIG_HAS_PCI
>      if ( need_mapping && is_pci_passthrough_enabled() &&
>           (device_get_class(dev) == DEVICE_PCI) )
>          need_mapping = false;
> #endif
> 
> but I see no big profit from it.

Sorry I didn't follow your explanation.

My suggestion is to remove the #ifdef CONFIG_HAS_PCI completely from
map_range_to_domain. At the beginning of map_range_to_domain, there is
already this line:

bool need_mapping = !dt_device_for_passthrough(dev);

We can change it into:

bool need_mapping = !dt_device_for_passthrough(dev) &&
                    !mr_data->skip_mapping;


Then, in map_device_children we can set mr_data->skip_mapping to true
for PCI devices. There is already a pci check there:

 if ( dt_device_type_is_equal(dev, "pci") )

so it should be easy to do. What am I missing?



> >>       if ( need_mapping )
> >>       {
> >>           res = map_regions_p2mt(d,
> >> @@ -1450,7 +1449,11 @@ static int __init map_device_children(struct domain *d,
> >>                                         const struct dt_device_node *dev,
> >>                                         p2m_type_t p2mt)
> >>   {
> >> -    struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> >> +    struct map_range_data mr_data = {
> >> +        .d = d,
> >> +        .p2mt = p2mt,
> >> +        .map_pci_bridge = false
> >> +    };
> >>       int ret;
> >>   
> >>       if ( dt_device_type_is_equal(dev, "pci") )
> >> @@ -1582,7 +1585,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
> >>       /* Give permission and map MMIOs */
> >>       for ( i = 0; i < naddr; i++ )
> >>       {
> >> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> >> +        struct map_range_data mr_data = {
> >> +            .d = d,
> >> +            .p2mt = p2mt,
> >> +            .map_pci_bridge = false
> >> +        };
> >>           res = dt_device_get_address(dev, i, &addr, &size);
> >>           if ( res )
> >>           {
> >> @@ -2754,7 +2761,14 @@ static int __init construct_dom0(struct domain *d)
> >>           return rc;
> >>   
> >>       if ( acpi_disabled )
> >> +    {
> >>           rc = prepare_dtb_hwdom(d, &kinfo);
> >> +#ifdef CONFIG_HAS_PCI
> >> +        if ( rc < 0 )
> >> +            return rc;
> > This doesn't look great :-)
> >
> > I would move the call to pci_host_bridge_mappings() below just before
> > construct_domain.
> 
> I put it there for purpose: currently we only support device-tree and
> 
> ACPI is not covered, e.g. pci_host_bridge_mappings is implemented
> 
> with device-tree in mind. So, I decided to tie it to prepare_dtb_hwdom
> 
> which is called when acpi_disabled is true.

That's OK, I don't mind. My comment was purely "code aesthetic". I think
this would look better:

    if ( acpi_disabled )
        rc = prepare_dtb_hwdom(d, &kinfo);
    else
        rc = prepare_acpi(d, &kinfo);

    if ( rc < 0 )
        return rc;

#ifdef CONFIG_HAS_PCI
    if ( acpi_disabled )
        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
    if ( rc < 0 )
        return rc;
#endif


Or even this would look better:

    if ( acpi_disabled )
    {
        rc = prepare_dtb_hwdom(d, &kinfo);
        if ( rc < 0 )
            return rc;
#ifdef CONFIG_HAS_PCI
        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
#endif
    } else
        rc = prepare_acpi(d, &kinfo);

    if ( rc < 0 )
        return rc;


Given that this comment is not about functionality but only about how
the code looks like I won't insist.



> >> +        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
> >> +#endif
> >> +    }
> >>       else
> >>           rc = prepare_acpi(d, &kinfo);
> >>   
> >> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> >> index 9b88b1cedaa2..eae177f2cbc2 100644
> >> --- a/xen/arch/arm/pci/ecam.c
> >> +++ b/xen/arch/arm/pci/ecam.c
> >> @@ -39,6 +39,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> >>       return base + (PCI_DEVFN2(sbdf) << devfn_shift) + where;
> >>   }
> >>   
> >> +bool pci_ecam_need_p2m_mapping(struct domain *d,
> >> +                               struct pci_host_bridge *bridge,
> >> +                               uint64_t addr)
> >> +{
> >> +    struct pci_config_window *cfg = bridge->cfg;
> >> +
> >> +    /*
> >> +     * We do not want ECAM address space to be mapped in Domain-0's p2m,
> >> +     * so we can trap access to it.
> >> +     */
> >> +    return cfg->phys_addr != addr;
> >> +}
> >> +
> >>   /* ECAM ops */
> >>   const struct pci_ecam_ops pci_generic_ecam_ops = {
> >>       .bus_shift  = 20,
> >> @@ -46,6 +59,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
> >>           .map_bus                = pci_ecam_map_bus,
> >>           .read                   = pci_generic_config_read,
> >>           .write                  = pci_generic_config_write,
> >> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
> >>       }
> >>   };
> >>   
> >> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> >> index 155f2a2743af..f350826ea26b 100644
> >> --- a/xen/arch/arm/pci/pci-host-common.c
> >> +++ b/xen/arch/arm/pci/pci-host-common.c
> >> @@ -18,6 +18,7 @@
> >>   
> >>   #include <xen/init.h>
> >>   #include <xen/pci.h>
> >> +#include <asm/setup.h>
> >>   #include <xen/rwlock.h>
> >>   #include <xen/sched.h>
> >>   #include <xen/vmap.h>
> >> @@ -328,6 +329,53 @@ int pci_host_get_num_bridges(void)
> >>       return count;
> >>   }
> >>   
> >> +int __init pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt)
> >> +{
> >> +    struct pci_host_bridge *bridge;
> >> +    struct map_range_data mr_data = {
> >> +        .d = d,
> >> +        .p2mt = p2mt,
> >> +        .map_pci_bridge = true
> >> +    };
> >> +
> >> +    /*
> >> +     * For each PCI host bridge we need to only map those ranges
> >> +     * which are used by Domain-0 to properly initialize the bridge,
> >> +     * e.g. we do not want to map ECAM configuration space which lives in
> >> +     * "reg" or "assigned-addresses" device tree property.
> >> +     * Neither we want to map any of the MMIO ranges found in the "ranges"
> >> +     * device tree property.
> >> +     */
> >> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> >> +    {
> >> +        const struct dt_device_node *dev = bridge->dt_node;
> >> +        int i;
> > i should be unsigned int
> Ok
> >
> >
> >> +        for ( i = 0; i < dt_number_of_address(dev); i++ )
> >> +        {
> >> +            uint64_t addr, size;
> >> +            int err;
> >> +
> >> +            err = dt_device_get_address(dev, i, &addr, &size);
> >> +            if ( err )
> >> +            {
> >> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> > Maybe rephrase it to:
> >
> >      Unable to retrieve address range index=%u for %s
> This is a copy-paste from the original code, but ok
> >
> >
> >> +                       i, dt_node_full_name(dev));
> >> +                return err;
> >> +            }
> >> +
> >> +            if ( bridge->ops->need_p2m_mapping(d, bridge, addr) )
> > The current implementation of need_p2m_mapping filters out ECAM and
> > nothing else. Just double-checking here: is there anything else we
> > should filter out? Looking at the device tree pci node for ZynqMP:
> >
> > 			reg = <0x0 0xfd0e0000 0x0 0x1000 0x0 0xfd480000 0x0 0x1000 0x80 0x0 0x0 0x1000000>;
> > 			reg-names = "breg", "pcireg", "cfg";
> >
> > We are filtering out cfg, but do we need both "breg" and "pcireg" here?
> 
> It is vice versa: we are filtering out cfg only and all the rest are "unknown regions we do not
> 
> want to alter".

Ah, OK. Can you please add a note about this to the in-code comment?
Maybe as follows:

For each PCI host bridge we need to only map those ranges which are used
by Domain-0 to properly initialize the bridge, e.g. we do not want to
map ECAM configuration space which lives in "reg" or
"assigned-addresses" device tree property, but we want to map other
regions of the host bridge. The PCI aperture defined by the "ranges"
device tree property should also be skipped.


> >
> > If not, do we need another function like .cfg_reg_index to know what we
> > actually need to map?
> 
> I was thinking to use .cfg_reg_index fir that, but it means I'll need to traverse
> 
> the device-tree to get the value for .cfg_reg_index which is already known
> 
> to the bridge. So, it is cheaper to have a callback and just check that
> 
> cfg->phys_addr != addr, e.g. what we want to map is not cfg.

Yeah that makes sense


> >> +            {
> >> +                err = map_range_to_domain(dev, addr, size, &mr_data);
> >> +                if ( err )
> >> +                    return err;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /*
> >>    * Local variables:
> >>    * mode: C
> >> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> >> index c27b4ea9f02f..adbe3627871f 100644
> >> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> >> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> >> @@ -33,6 +33,7 @@ const struct pci_ecam_ops nwl_pcie_ops = {
> >>           .map_bus                = pci_ecam_map_bus,
> >>           .read                   = pci_generic_config_read,
> >>           .write                  = pci_generic_config_write,
> >> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
> >>       }
> >>   };
> >>   
> >> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> >> index 7618f0b6725b..b81f66e813ef 100644
> >> --- a/xen/include/asm-arm/pci.h
> >> +++ b/xen/include/asm-arm/pci.h
> >> @@ -19,6 +19,8 @@
> >>   
> >>   #ifdef CONFIG_HAS_PCI
> >>   
> >> +#include <asm/p2m.h>
> >> +
> >>   #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> >>   #define PRI_pci "%04x:%02x:%02x.%u"
> >>   
> >> @@ -79,6 +81,9 @@ struct pci_ops {
> >>                   uint32_t reg, uint32_t len, uint32_t *value);
> >>       int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
> >>                    uint32_t reg, uint32_t len, uint32_t value);
> >> +    bool (*need_p2m_mapping)(struct domain *d,
> >> +                             struct pci_host_bridge *bridge,
> >> +                             uint64_t addr);
> > I would call this function: need_p2m_hwdom_mapping
> Ok
> >
> >
> >>   };
> >>   
> >>   /*
> >> @@ -102,6 +107,9 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> >>                               uint32_t reg, uint32_t len, uint32_t value);
> >>   void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> >>                                  uint32_t sbdf, uint32_t where);
> >> +bool pci_ecam_need_p2m_mapping(struct domain *d,
> >> +                               struct pci_host_bridge *bridge,
> >> +                               uint64_t addr);
> >>   struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> >>   int pci_get_host_bridge_segment(const struct dt_device_node *node,
> >>                                   uint16_t *segment);
> >> @@ -116,6 +124,7 @@ int pci_host_iterate_bridges(struct domain *d,
> >>                                int (*clb)(struct domain *d,
> >>                                           struct pci_host_bridge *bridge));
> >>   int pci_host_get_num_bridges(void);
> >> +int pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt);
> >>   #else   /*!CONFIG_HAS_PCI*/
> >>   
> >>   #define pci_passthrough_enabled (false)
> >> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> >> index 95da0b7ab9cd..21863dd2bc58 100644
> >> --- a/xen/include/asm-arm/setup.h
> >> +++ b/xen/include/asm-arm/setup.h
> >> @@ -2,6 +2,8 @@
> >>   #define __ARM_SETUP_H_
> >>   
> >>   #include <public/version.h>
> >> +#include <asm/p2m.h>
> >> +#include <xen/device_tree.h>
> >>   
> >>   #define MIN_FDT_ALIGN 8
> >>   #define MAX_FDT_SIZE SZ_2M
> >> @@ -77,6 +79,14 @@ struct bootinfo {
> >>   #endif
> >>   };
> >>   
> >> +struct map_range_data
> >> +{
> >> +    struct domain *d;
> >> +    p2m_type_t p2mt;
> >> +    /* Set if mappings for PCI host bridges must not be skipped. */
> >> +    bool map_pci_bridge;
> > To make this more generally applicable, I would call the new property:
> >
> >    bool skip_mapping;
> Sounds good
> >
> > and it could apply to any class of devices. All current users would set
> > it to false except for pci_host_bridge_mappings.
> Please see PCI special case above
> >
> >
> >> +};
> >>
> >>   extern struct bootinfo bootinfo;
> >>   
> >>   extern domid_t max_init_domid;
> >> @@ -124,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> >>   u32 device_tree_get_u32(const void *fdt, int node,
> >>                           const char *prop_name, u32 dflt);
> >>   
> >> +int map_range_to_domain(const struct dt_device_node *dev,
> >> +                        u64 addr, u64 len, void *data);
> >> +
> >>   #endif
> >>   /*
> >>    * Local variables:
> >> -- 
> >> 2.25.1
> >>
--8323329-1264100615-1632801182=:5022--

