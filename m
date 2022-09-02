Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2885AA58F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 04:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397177.637660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwI9-0002Sg-AB; Fri, 02 Sep 2022 02:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397177.637660; Fri, 02 Sep 2022 02:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwI9-0002Pi-6b; Fri, 02 Sep 2022 02:20:21 +0000
Received: by outflank-mailman (input) for mailman id 397177;
 Fri, 02 Sep 2022 02:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTwI7-0002PW-1C
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 02:20:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ac04f0-2a65-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 04:20:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B537661DFC;
 Fri,  2 Sep 2022 02:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BABEC433C1;
 Fri,  2 Sep 2022 02:20:14 +0000 (UTC)
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
X-Inumbo-ID: c8ac04f0-2a65-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662085215;
	bh=z9yztbpr6qVxevKmHFjIE7RnInv3IcjaHlxoJUNi5Ps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=laMYY4GNTAthAjVpTsf+3iYi6ORJV3gATD9EpqzwDess7yI7vmlkHSp5mWYdCOfcr
	 nXo9Hhuv+hllUr841hXWuqFjDlJVZA9FOn2HncmaR+PGMGaAWkFBQDldqDnUfMRS/r
	 0nv/BfmOAif0aktZfC3RvH3+utDViUPFFMMLMJBmHVJ9mO6RC9CQ1I36cSfk0GLOQF
	 8BrETJ11Bl/T//EcVNDzAhya6cdC59VAbT///aPTA5PNNLfuM0MWtchH8eVdzqkhgk
	 Oqs7tpLbldY3e9PFAqcMFwk8ivaNNvklwAzTEd4uHDU0JVWKM/Y3F7UBM9wimqbKRc
	 shuZdr7FE9jhQ==
Date: Thu, 1 Sep 2022 19:20:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: introduce xen-evtchn dom0less property
In-Reply-To: <2142aa46-24a0-e0cb-16c0-95e8f6302ce6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209011916190.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662023183.git.rahul.singh@arm.com> <3899ada4cc8217b45eab4f8d85492b0d5a6a9580.1662023183.git.rahul.singh@arm.com> <2142aa46-24a0-e0cb-16c0-95e8f6302ce6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Julien Grall wrote:
> On 01/09/2022 10:13, Rahul Singh wrote:
> > Introduce a new sub-node under /chosen node to establish static event
> > channel communication between domains on dom0less systems.
> > 
> > An event channel will be created beforehand to allow the domains to
> > send notifications to each other.
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> > Changes in v3:
> >   - use device-tree used_by to find the domain id of the evtchn node.
> >   - add new static_evtchn_create variable in struct dt_device_node to
> >     hold the information if evtchn is already created.
> >   - fix minor comments
> > Changes in v2:
> >   - no change
> > ---
> >   docs/misc/arm/device-tree/booting.txt |  64 ++++++++++++-
> >   xen/arch/arm/domain_build.c           | 128 ++++++++++++++++++++++++++
> >   xen/arch/arm/include/asm/setup.h      |   1 +
> >   xen/arch/arm/setup.c                  |   2 +
> >   xen/include/xen/device_tree.h         |  13 +++
> >   5 files changed, 207 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt
> > b/docs/misc/arm/device-tree/booting.txt
> > index 98253414b8..edef98e6d1 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -212,7 +212,7 @@ with the following properties:
> >       enable only selected interfaces.
> >     Under the "xen,domain" compatible node, one or more sub-nodes are
> > present
> > -for the DomU kernel and ramdisk.
> > +for the DomU kernel, ramdisk and static event channel.
> >     The kernel sub-node has the following properties:
> >   @@ -254,11 +254,44 @@ The ramdisk sub-node has the following properties:
> >       property because it will be created by the UEFI stub on boot.
> >       This option is needed only when UEFI boot is used.
> >   +The static event channel sub-node has the following properties:
> > +
> > +- compatible
> > +
> > +    "xen,evtchn"
> > +
> > +- xen,evtchn
> > +
> > +    The property is tuples of two numbers
> > +    (local-evtchn link-to-foreign-evtchn) where:
> > +
> > +    local-evtchn is an integer value that will be used to allocate local
> > port
> > +    for a domain to send and receive event notifications to/from the remote
> > +    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2L
> > ABI.
> > +    It is recommended to use low event channel IDs.
> > +
> > +    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
> > +    local-evtchn will be connected.
> >     Example
> >   =======
> >     chosen {
> > +
> > +    module@0 {
> > +        compatible = "multiboot,kernel", "multiboot,module";
> > +        xen,uefi-binary = "...";
> > +        bootargs = "...";
> > +
> > +    };
> 
> NIT: Describing this node in the example seems unnecessary.
> 
> > +
> > +    /* one sub-node per local event channel */
> > +    ec1: evtchn@1 {
> > +         compatible = "xen,evtchn-v1";
> > +         /* local-evtchn link-to-foreign-evtchn */
> > +         xen,evtchn = <0xa &ec2>;
> > +    };
> > +
> 
> Here you provide an example for dom0. But the position where you describe the
> binding suggests this binding only exists for domUs.
> 
> Either we duplicate the binding or we re-order the documentation to have
> common binding in a single place. My preference would be the latter.
> 
> >       domU1 {
> >           compatible = "xen,domain";
> >           #address-cells = <0x2>;
> > @@ -277,6 +310,23 @@ chosen {
> >               compatible = "multiboot,ramdisk", "multiboot,module";
> >               reg = <0x0 0x4b000000 0xffffff>;
> >           };
> > +
> > +        /* one sub-node per local event channel */
> > +        ec2: evtchn@2 {
> > +            compatible = "xen,evtchn-v1";
> > +            /* local-evtchn link-to-foreign-evtchn */
> > +            xen,evtchn = <0xa &ec1>;
> > +        };
> > +
> > +        ec3: evtchn@3 {
> > +            compatible = "xen,evtchn-v1";
> > +            xen,evtchn = <0xb &ec5>;
> > +        };
> > +
> > +        ec4: evtchn@4 {
> > +            compatible = "xen,evtchn-v1";
> > +            xen,evtchn = <0xc &ec6>;
> > +        };
> >       };
> >         domU2 {
> > @@ -296,6 +346,18 @@ chosen {
> >               compatible = "multiboot,ramdisk", "multiboot,module";
> >               reg = <0x0 0x4d000000 0xffffff>;
> >           };
> > +
> > +        /* one sub-node per local event channel */
> > +        ec5: evtchn@5 {
> > +            compatible = "xen,evtchn-v1";
> > +            /* local-evtchn link-to-foreign-evtchn */
> > +            xen,evtchn = <0xb &ec3>;
> > +        };
> > +
> > +        ec6: evtchn@6 {
> > +            compatible = "xen,evtchn-v1";
> > +            xen,evtchn = <0xd &ec4>;
> > +        };
> >       };
> >   };
> >   diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 707e247f6a..4b24261825 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -33,6 +33,8 @@
> >   #include <xen/grant_table.h>
> >   #include <xen/serial.h>
> >   +#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
> > +
> >   static unsigned int __initdata opt_dom0_max_vcpus;
> >   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> >   @@ -3052,6 +3054,131 @@ void __init evtchn_allocate(struct domain *d)
> >       d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
> >   }
> >   +static int __init get_evtchn_dt_property(const struct dt_device_node *np,
> > +                                         uint32_t *port, uint32_t *phandle)
> > +{
> > +    const __be32 *prop = NULL;
> > +    uint32_t len;
> > +
> > +    prop = dt_get_property(np, "xen,evtchn", &len);
> > +    if ( !prop )
> > +    {
> > +        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
> > +    {
> > +        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    *port = dt_next_cell(1, &prop);
> > +    *phandle = dt_next_cell(1, &prop);
> > +
> > +    return 0;
> > +}
> > +
> > +static int __init alloc_domain_evtchn(struct dt_device_node *node)
> > +{
> > +    int rc;
> > +    uint32_t domU1_port, domU2_port, remote_phandle;
> > +    struct dt_device_node *remote_node;
> > +    struct evtchn_alloc_unbound alloc_unbound;
> > +    struct evtchn_bind_interdomain bind_interdomain;
> > +    struct domain *d1 = NULL, *d2 = NULL;
> > +
> > +    if ( dt_device_static_evtchn_created(node) )
> 
> I think this deserve a comment explain why the node would be created. I.e it
> would happen if the other side was created first. I will comment about
> dt_device_static_evtchn_created() futher down.
> 
> > +        return 0;
> > +
> > +    rc = get_evtchn_dt_property(node, &domU1_port, &remote_phandle);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    remote_node = dt_find_node_by_phandle(remote_phandle);
> > +    if ( !remote_node )
> > +    {
> > +        printk(XENLOG_ERR
> > +                "evtchn: could not find remote evtchn phandle\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    rc = get_evtchn_dt_property(remote_node, &domU2_port, &remote_phandle);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( node->phandle != remote_phandle )
> > +    {
> > +        printk(XENLOG_ERR "xen,evtchn property is not setup correctly.\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    d1 = get_domain_by_id(dt_get_parent(node)->used_by);
> > +    d2 = get_domain_by_id(dt_get_parent(remote_node)->used_by);
> 
> I think dt_get_parent() could return NULL (i.e. for the root). So I think you
> want to check that at least remote_node() has a parent. For convenience, this
> check could be done in
> 
> > +
> > +    if ( !d1 || !d2 )
> > +    {
> > +        printk(XENLOG_ERR "evtchn: could not find domains\n" );
> > +        return -EINVAL;
> > +    }
> > +
> > +    alloc_unbound.dom = d1->domain_id;
> > +    alloc_unbound.remote_dom = d2->domain_id;
> > +
> > +    rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
> > +    if ( rc < 0 )
> > +    {
> > +        printk(XENLOG_ERR
> > +                "evtchn_alloc_unbound() failure (Error %d) \n", rc);
> > +        return rc;
> > +    }
> > +
> > +    bind_interdomain.remote_dom  = d1->domain_id;
> > +    bind_interdomain.remote_port = domU1_port;
> > +
> > +    rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
> > +    if ( rc < 0 )
> > +    {
> > +        printk(XENLOG_ERR
> > +                "evtchn_bind_interdomain() failure (Error %d) \n", rc);
> > +        return rc;
> > +    }
> > +
> > +    dt_device_set_static_evtchn_created(node);
> > +    dt_device_set_static_evtchn_created(remote_node);
> > +
> > +    return 0;
> > +}
> > +
> > +void __init process_static_evtchn_node(struct dt_device_node *node)
> 
> This is missing a prototype. So I guess this wants to be static?
> 
> That said, I think it would make more sense to fold
> process_static_evtchn_node() in alloc_domain_evtchn() or
> alloc_static-evtchn().
> 
> > +{
> > +    if ( dt_device_is_compatible(node, "xen,evtchn-v1") )
> > +    {
> > +        if ( alloc_domain_evtchn(node) != 0 )
> > +            panic("Could not set up domains evtchn\n");
> > +    }
> > +}
> > +
> > +void __init alloc_static_evtchn(void)
> > +{
> > +    struct dt_device_node *node, *evtchn_node;
> > +    struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
> > +
> > +    BUG_ON(chosen == NULL);
> > +
> > +    if ( hardware_domain )
> > +        dt_device_set_used_by(chosen, hardware_domain->domain_id);
> > +
> > +    dt_for_each_child_node(chosen, node)
> > +    {
> > +        if ( hardware_domain )
> > +            process_static_evtchn_node(node);
> > +
> > +        dt_for_each_child_node(node, evtchn_node)
> > +            process_static_evtchn_node(evtchn_node);
> > +    }
> > +}
> > +
> >   static void __init find_gnttab_region(struct domain *d,
> >                                         struct kernel_info *kinfo)
> >   {
> > @@ -3364,6 +3491,7 @@ void __init create_domUs(void)
> >               panic("Error creating domain %s\n", dt_node_name(node));
> >             d->is_console = true;
> > +        dt_device_set_used_by(node, d->domain_id);
> >             if ( construct_domU(d, node) != 0 )
> >               panic("Could not set up domain %s\n", dt_node_name(node));
> > diff --git a/xen/arch/arm/include/asm/setup.h
> > b/xen/arch/arm/include/asm/setup.h
> > index 5815ccf8c5..5ee28b270f 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -106,6 +106,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank
> > tbl_add[]);
> >     void create_domUs(void);
> >   void create_dom0(void);
> > +void alloc_static_evtchn(void);
> >     void discard_initial_modules(void);
> >   void fw_unreserved_regions(paddr_t s, paddr_t e,
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 6e0398f3f6..cf15d359d2 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -1077,6 +1077,8 @@ void __init start_xen(unsigned long boot_phys_offset,
> >       if ( acpi_disabled )
> >           create_domUs();
> >   +    alloc_static_evtchn();
> > +
> >       /*
> >        * This needs to be called **before** heap_init_late() so modules
> >        * will be scrubbed (unless suppressed).
> > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > index 430a1ef445..5579c875d2 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -82,6 +82,7 @@ struct dt_device_node {
> >       dt_phandle phandle;
> >       char *full_name;
> >       domid_t used_by; /* By default it's used by dom0 */
> > +    bool_t static_evtchn_created;
> 
> I can see why you want to add the boolean in dt_device_node. However, I
> dislike this approach because this feels an abuse of dt_device_node and the
> field is only used at boot.
> 
> So this seems to be a bit of a waste to include it in the structure (even if
> we are re-using padding today).
> 
> I don't have a solution that is has trivial as this approach. However, at
> minimum we should document this is a HACK and should be remove if we need
> space in the structure.

I would move static_evtchn_created just above (or below) "bool
is_protected". It would still re-use the padding and it would be
closer to another more similar field of the struct.

The only other option that I can think of would be to use port_is_valid,
instead of static_evtchn_created, to check that the port has already
been allocated, but we wouldn't be able to tell if it is a static evtchn
or simply unavailable for other reasons and it would require more device
tree parsing.

