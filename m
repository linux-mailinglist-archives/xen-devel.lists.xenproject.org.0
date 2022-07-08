Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640A56BE4A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363625.594286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r20-0004lK-VP; Fri, 08 Jul 2022 16:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363625.594286; Fri, 08 Jul 2022 16:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r20-0004jA-Qx; Fri, 08 Jul 2022 16:40:40 +0000
Received: by outflank-mailman (input) for mailman id 363625;
 Fri, 08 Jul 2022 16:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJCY=XN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9r1y-0004hN-Qy
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:40:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d3bad1-fedc-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 18:40:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A651BB828B5;
 Fri,  8 Jul 2022 16:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35DCC341C0;
 Fri,  8 Jul 2022 16:40:34 +0000 (UTC)
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
X-Inumbo-ID: b1d3bad1-fedc-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657298435;
	bh=UNIZH4By+8EFj8FchRhVPyjYaE0OqZ6LjzqwVHA0WuU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H6Y479DBzfHqzyrj/HnspR9IoUcI8HQ19rMUAhiepmsWwkIsIDuvm0Dff1+XT4apV
	 +EWF0ppiHMM/KDOdmIfuyG/+C32YoGTJmM93wE39TrIFYfnoVIv+4vUzpZlGWCSOPy
	 QC5G+MEnTGf6KbDF867xOEWzYmdT7IcnDLwwqCrZ+61tMnk7krOqKJm+vRG2Oo255j
	 CzusNGaRev18bcUHz4IJ1ucPuk/N8Rd40jt0YKfQvnpw3ySf2G44TFF/6RNKQoEu06
	 iOPqO6NJAPBBEUFHnzNxgYbAfemCJZlgjh9JZDJDqYQ7YHTs81PAH3Z7lGlYuol1G0
	 tOkgtuKCzmolA==
Date: Fri, 8 Jul 2022 09:40:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "julien@xen.org" <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <DU2PR08MB7325C9A6011B877DDF09524FF7839@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2207080938280.2354836@ubuntu-linux-20-04-desktop>
References: <20220620051114.210118-1-Penny.Zheng@arm.com> <20220620051114.210118-8-Penny.Zheng@arm.com> <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org> <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2207061647160.2354836@ubuntu-linux-20-04-desktop> <DU2PR08MB7325C9A6011B877DDF09524FF7839@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Jul 2022, Penny Zheng wrote:
> Hi Stefano and julien
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: Thursday, July 7, 2022 7:53 AM
> > To: Penny Zheng <Penny.Zheng@arm.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>;
> > xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; Bertrand
> > Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>
> > Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
> > device tree
> > 
> > On Mon, 4 Jul 2022, Penny Zheng wrote:
> > > Hi Stefano and Julien
> > >
> > > > -----Original Message-----
> > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > Sent: Saturday, June 25, 2022 5:57 AM
> > > > To: Julien Grall <julien@xen.org>
> > > > Cc: Penny Zheng <Penny.Zheng@arm.com>;
> > > > xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
> > Stefano
> > > > Stabellini <sstabellini@kernel.org>; Bertrand Marquis
> > > > <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > > > <Volodymyr_Babchuk@epam.com>
> > > > Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in
> > > > guest device tree
> > > >
> > > > On Fri, 24 Jun 2022, Julien Grall wrote:
> > > > > On 20/06/2022 06:11, Penny Zheng wrote:
> > > > > > We expose the shared memory to the domU using the "xen,shared-
> > > > memory-v1"
> > > > > > reserved-memory binding. See
> > > > > > Documentation/devicetree/bindings/reserved-memory/xen,shared-
> > > > memory.
> > > > > > txt in Linux for the corresponding device tree binding.
> > > > > >
> > > > > > To save the cost of re-parsing shared memory device tree
> > > > > > configuration when creating shared memory nodes in guest device
> > > > > > tree, this commit adds new field "shm_mem" to store shm-info per
> > > > > > domain.
> > > > > >
> > > > > > For each shared memory region, a range is exposed under the
> > > > > > /reserved-memory node as a child node. Each range sub-node is
> > > > > > named xen-shmem@<address> and has the following properties:
> > > > > > - compatible:
> > > > > >          compatible = "xen,shared-memory-v1"
> > > > > > - reg:
> > > > > >          the base guest physical address and size of the shared
> > > > > > memory region
> > > > > > - xen,id:
> > > > > >          a string that identifies the shared memory region.
> > > > > >
> > > > > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > ---
> > > > > > v5 change:
> > > > > > - no change
> > > > > > ---
> > > > > > v4 change:
> > > > > > - no change
> > > > > > ---
> > > > > > v3 change:
> > > > > > - move field "shm_mem" to kernel_info
> > > > > > ---
> > > > > > v2 change:
> > > > > > - using xzalloc
> > > > > > - shm_id should be uint8_t
> > > > > > - make reg a local variable
> > > > > > - add #address-cells and #size-cells properties
> > > > > > - fix alignment
> > > > > > ---
> > > > > >   xen/arch/arm/domain_build.c       | 143
> > > > +++++++++++++++++++++++++++++-
> > > > > >   xen/arch/arm/include/asm/kernel.h |   1 +
> > > > > >   xen/arch/arm/include/asm/setup.h  |   1 +
> > > > > >   3 files changed, 143 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > > b/xen/arch/arm/domain_build.c index 1584e6c2ce..4d62440a0e
> > > > > > 100644
> > > > > > --- a/xen/arch/arm/domain_build.c
> > > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > > @@ -900,7 +900,22 @@ static int __init
> > > > > > allocate_shared_memory(struct domain *d,
> > > > > >       return ret;
> > > > > >   }
> > > > > >   -static int __init process_shm(struct domain *d,
> > > > > > +static int __init append_shm_bank_to_domain(struct kernel_info
> > *kinfo,
> > > > > > +                                            paddr_t start, paddr_t size,
> > > > > > +                                            u32 shm_id) {
> > > > > > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > > > > > +        return -ENOMEM;
> > > > > > +
> > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id =
> > shm_id;
> > > > > > +    kinfo->shm_mem.nr_banks++;
> > > > > > +
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __init process_shm(struct domain *d, struct
> > > > > > +kernel_info *kinfo,
> > > > > >                                 const struct dt_device_node *node)
> > > > > >   {
> > > > > >       struct dt_device_node *shm_node; @@ -971,6 +986,14 @@
> > > > > > static int __init process_shm(struct domain *d,
> > > > > >               if ( ret )
> > > > > >                   return ret;
> > > > > >           }
> > > > > > +
> > > > > > +        /*
> > > > > > +         * Record static shared memory region info for later setting
> > > > > > +         * up shm-node in guest device tree.
> > > > > > +         */
> > > > > > +        ret = append_shm_bank_to_domain(kinfo, gbase, psize,
> > shm_id);
> > > > > > +        if ( ret )
> > > > > > +            return ret;
> > > > > >       }
> > > > > >         return 0;
> > > > > > @@ -1301,6 +1324,117 @@ static int __init
> > make_memory_node(const
> > > > > > struct domain *d,
> > > > > >       return res;
> > > > > >   }
> > > > > >   +#ifdef CONFIG_STATIC_SHM
> > > > > > +static int __init make_shm_memory_node(const struct domain *d,
> > > > > > +                                       void *fdt,
> > > > > > +                                       int addrcells, int sizecells,
> > > > > > +                                       struct meminfo *mem)
> > > > >
> > > > > NIT: AFAICT mem is not changed, so it should be const.
> > > > >
> > > > > > +{
> > > > > > +    unsigned long i = 0;
> > > > >
> > > > > NIT: This should be "unsigned int" to match the type of nr_banks.
> > > > >
> > > > > > +    int res = 0;
> > > > > > +
> > > > > > +    if ( mem->nr_banks == 0 )
> > > > > > +        return -ENOENT;
> > > > > > +
> > > > > > +    /*
> > > > > > +     * For each shared memory region, a range is exposed under
> > > > > > +     * the /reserved-memory node as a child node. Each range
> > > > > > + sub-node
> > > > is
> > > > > > +     * named xen-shmem@<address>.
> > > > > > +     */
> > > > > > +    dt_dprintk("Create xen-shmem node\n");
> > > > > > +
> > > > > > +    for ( ; i < mem->nr_banks; i++ )
> > > > > > +    {
> > > > > > +        uint64_t start = mem->bank[i].start;
> > > > > > +        uint64_t size = mem->bank[i].size;
> > > > > > +        uint8_t shm_id = mem->bank[i].shm_id;
> > > > > > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> > > > > > +        char buf[27];
> > > > > > +        const char compat[] = "xen,shared-memory-v1";
> > > > > > +        __be32 reg[4];
> > > > > > +        __be32 *cells;
> > > > > > +        unsigned int len = (addrcells + sizecells) *
> > > > > > + sizeof(__be32);
> > > > > > +
> > > > > > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > > > > > mem->bank[i].start);
> > > > > > +        res = fdt_begin_node(fdt, buf);
> > > > > > +        if ( res )
> > > > > > +            return res;
> > > > > > +
> > > > > > +        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> > > > > > +        if ( res )
> > > > > > +            return res;
> > > > > > +
> > > > > > +        cells = reg;
> > > > > > +        dt_child_set_range(&cells, addrcells, sizecells, start,
> > > > > > + size);
> > > > > > +
> > > > > > +        res = fdt_property(fdt, "reg", reg, len);
> > > > > > +        if ( res )
> > > > > > +            return res;
> > > > > > +
> > > > > > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"-
> > >%#"PRIx64"\n",
> > > > > > +                   i, start, start + size);
> > > > > > +
> > > > > > +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> > > > >
> > > > > Looking at the Linux binding, "xen,id" is meant to be a string.
> > > > > But here you are writing it as an integer.
> > > >
> > > > Good catch!
> > > >
> > > >
> > > > > Given that the Linux binding is already merged, I think the Xen
> > > > > binding should be changed.
> > > >
> > > > We would be compliant with both bindings (xen and linux) just by
> > > > writing shm_id as string here, but if it is not too difficult we
> > > > might as well harmonize the two bindings and also define xen,shm-id as a
> > string.
> > > >
> > > > On the Xen side, I would suggest to put a clear size limit so that
> > > > the string is easier to handle.
> > >
> > > I've already made the xen,shm-id parsed as a string too, seeing the below
> > code:
> > > "
> > >     prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
> > >     if ( !prop_id )
> > >         return -ENOENT;
> > >     shm_id = simple_strtoul(prop_id->data, NULL, 10);
> > >     if ( shm_id >= NR_MEM_BANKS )
> > >     {
> > >         printk("fdt: invalid `xen,shm-id` %lu for static shared memory node.\n",
> > >                shm_id);
> > >         return -EINVAL;
> > >     }
> > > "
> > > The size limit is smaller than 256, just as stated in doc:
> > > "
> > > - xen,shm-id
> > >
> > >     A string that represents the unique identifier of the shared memory
> > >     region. The maximum identifier shall be "xen,shm-id = 255".
> > > "
> > > Hope this fits what both of you suggested~~~
> > 
> > Yes. I think supporting arbitrary strings like "my-shared-mem-1" would be
> > nice-to-have but I wouldn't make it a hard requirement.
> > 
> 
> Oh, the example "my-shared-mem-1" really expands my mind, I think I understand
> what you and Julien referred as free form string, which shall not be limited to only
> numeric number... thanks!!!
> 
> You were suggesting a strict limit on the number of characters, TBH, I have no clue
> What the standard is here. Any suggestions?
> 
> If considering padding, maybe 19?
> "
> struct membank {
>     paddr_t start;
>     paddr_t size;
>     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> #ifdef CONFIG_STATIC_SHM
>     char shm_id[19];
>     unsigned int nr_shm_borrowers;
> #endif
> };
> "

Yeah I suggested a strict limit on the number of chars so that we could
embed the string in struct membank. I would pick 16 characters which is
equivalent to two uint64_t in terms of memory usage.


> > "255" as a string would match Linux's requirements for xen,id.
> 
> I will use your example "my-shm-mem-1", I think its better for users
> to understand, at least for me...

+1

