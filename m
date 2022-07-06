Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D301E56969E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 01:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362660.592798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9EpD-0004m3-CO; Wed, 06 Jul 2022 23:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362660.592798; Wed, 06 Jul 2022 23:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9EpD-0004im-9T; Wed, 06 Jul 2022 23:52:55 +0000
Received: by outflank-mailman (input) for mailman id 362660;
 Wed, 06 Jul 2022 23:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9EpC-0004ig-AI
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 23:52:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf30765a-fd86-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 01:52:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DC5C61F55;
 Wed,  6 Jul 2022 23:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA65C3411C;
 Wed,  6 Jul 2022 23:52:50 +0000 (UTC)
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
X-Inumbo-ID: bf30765a-fd86-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657151570;
	bh=mtvwmybBVzuD5FEfsA/4/5Xosx/4NjyqNhBjl6lmQ1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HaFIfEUx1AgtQCCSrjHHb5p7OwOSOqmsvzeSTbG2p4iL9sv2sML2j1DE9sj9PmUQB
	 mjomJEJmSXlOytCKspjfdmD0rSQsABoykEgrmzu4HtMl1hpzlzN55SGvWorfcKF59Q
	 zaWapt5i3kchcFX0tZSKgRM4cqR121+cOOPvibcLc3o1zitEZLsuXmhho3BLPlnF6G
	 Jg5KgkYw7a2lGYVBa16FxJiWWkNJgyCsiLAJBL4FyXzzOUo5Vs5CK7Wo7kCRB4R8y1
	 AtW5zN7ULhPbcl7byxOrQTCvIhfHjBFhW1YVhM3MYSmITuW4+9quzNbStqqPCjA+D2
	 aXzpGBaA18SIg==
Date: Wed, 6 Jul 2022 16:52:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2207061647160.2354836@ubuntu-linux-20-04-desktop>
References: <20220620051114.210118-1-Penny.Zheng@arm.com> <20220620051114.210118-8-Penny.Zheng@arm.com> <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org> <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Jul 2022, Penny Zheng wrote:
> Hi Stefano and Julien
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: Saturday, June 25, 2022 5:57 AM
> > To: Julien Grall <julien@xen.org>
> > Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> > Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
> > <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> > Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
> > device tree
> > 
> > On Fri, 24 Jun 2022, Julien Grall wrote:
> > > On 20/06/2022 06:11, Penny Zheng wrote:
> > > > We expose the shared memory to the domU using the "xen,shared-
> > memory-v1"
> > > > reserved-memory binding. See
> > > > Documentation/devicetree/bindings/reserved-memory/xen,shared-
> > memory.
> > > > txt in Linux for the corresponding device tree binding.
> > > >
> > > > To save the cost of re-parsing shared memory device tree
> > > > configuration when creating shared memory nodes in guest device
> > > > tree, this commit adds new field "shm_mem" to store shm-info per
> > > > domain.
> > > >
> > > > For each shared memory region, a range is exposed under the
> > > > /reserved-memory node as a child node. Each range sub-node is named
> > > > xen-shmem@<address> and has the following properties:
> > > > - compatible:
> > > >          compatible = "xen,shared-memory-v1"
> > > > - reg:
> > > >          the base guest physical address and size of the shared
> > > > memory region
> > > > - xen,id:
> > > >          a string that identifies the shared memory region.
> > > >
> > > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > ---
> > > > v5 change:
> > > > - no change
> > > > ---
> > > > v4 change:
> > > > - no change
> > > > ---
> > > > v3 change:
> > > > - move field "shm_mem" to kernel_info
> > > > ---
> > > > v2 change:
> > > > - using xzalloc
> > > > - shm_id should be uint8_t
> > > > - make reg a local variable
> > > > - add #address-cells and #size-cells properties
> > > > - fix alignment
> > > > ---
> > > >   xen/arch/arm/domain_build.c       | 143
> > +++++++++++++++++++++++++++++-
> > > >   xen/arch/arm/include/asm/kernel.h |   1 +
> > > >   xen/arch/arm/include/asm/setup.h  |   1 +
> > > >   3 files changed, 143 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/xen/arch/arm/domain_build.c
> > > > b/xen/arch/arm/domain_build.c index 1584e6c2ce..4d62440a0e 100644
> > > > --- a/xen/arch/arm/domain_build.c
> > > > +++ b/xen/arch/arm/domain_build.c
> > > > @@ -900,7 +900,22 @@ static int __init allocate_shared_memory(struct
> > > > domain *d,
> > > >       return ret;
> > > >   }
> > > >   -static int __init process_shm(struct domain *d,
> > > > +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> > > > +                                            paddr_t start, paddr_t size,
> > > > +                                            u32 shm_id) {
> > > > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > > > +        return -ENOMEM;
> > > > +
> > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id = shm_id;
> > > > +    kinfo->shm_mem.nr_banks++;
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int __init process_shm(struct domain *d, struct kernel_info
> > > > +*kinfo,
> > > >                                 const struct dt_device_node *node)
> > > >   {
> > > >       struct dt_device_node *shm_node; @@ -971,6 +986,14 @@ static
> > > > int __init process_shm(struct domain *d,
> > > >               if ( ret )
> > > >                   return ret;
> > > >           }
> > > > +
> > > > +        /*
> > > > +         * Record static shared memory region info for later setting
> > > > +         * up shm-node in guest device tree.
> > > > +         */
> > > > +        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
> > > > +        if ( ret )
> > > > +            return ret;
> > > >       }
> > > >         return 0;
> > > > @@ -1301,6 +1324,117 @@ static int __init make_memory_node(const
> > > > struct domain *d,
> > > >       return res;
> > > >   }
> > > >   +#ifdef CONFIG_STATIC_SHM
> > > > +static int __init make_shm_memory_node(const struct domain *d,
> > > > +                                       void *fdt,
> > > > +                                       int addrcells, int sizecells,
> > > > +                                       struct meminfo *mem)
> > >
> > > NIT: AFAICT mem is not changed, so it should be const.
> > >
> > > > +{
> > > > +    unsigned long i = 0;
> > >
> > > NIT: This should be "unsigned int" to match the type of nr_banks.
> > >
> > > > +    int res = 0;
> > > > +
> > > > +    if ( mem->nr_banks == 0 )
> > > > +        return -ENOENT;
> > > > +
> > > > +    /*
> > > > +     * For each shared memory region, a range is exposed under
> > > > +     * the /reserved-memory node as a child node. Each range sub-node
> > is
> > > > +     * named xen-shmem@<address>.
> > > > +     */
> > > > +    dt_dprintk("Create xen-shmem node\n");
> > > > +
> > > > +    for ( ; i < mem->nr_banks; i++ )
> > > > +    {
> > > > +        uint64_t start = mem->bank[i].start;
> > > > +        uint64_t size = mem->bank[i].size;
> > > > +        uint8_t shm_id = mem->bank[i].shm_id;
> > > > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> > > > +        char buf[27];
> > > > +        const char compat[] = "xen,shared-memory-v1";
> > > > +        __be32 reg[4];
> > > > +        __be32 *cells;
> > > > +        unsigned int len = (addrcells + sizecells) *
> > > > + sizeof(__be32);
> > > > +
> > > > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > > > mem->bank[i].start);
> > > > +        res = fdt_begin_node(fdt, buf);
> > > > +        if ( res )
> > > > +            return res;
> > > > +
> > > > +        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> > > > +        if ( res )
> > > > +            return res;
> > > > +
> > > > +        cells = reg;
> > > > +        dt_child_set_range(&cells, addrcells, sizecells, start,
> > > > + size);
> > > > +
> > > > +        res = fdt_property(fdt, "reg", reg, len);
> > > > +        if ( res )
> > > > +            return res;
> > > > +
> > > > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
> > > > +                   i, start, start + size);
> > > > +
> > > > +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> > >
> > > Looking at the Linux binding, "xen,id" is meant to be a string. But
> > > here you are writing it as an integer.
> > 
> > Good catch!
> > 
> > 
> > > Given that the Linux binding is already merged, I think the Xen
> > > binding should be changed.
> > 
> > We would be compliant with both bindings (xen and linux) just by writing
> > shm_id as string here, but if it is not too difficult we might as well harmonize
> > the two bindings and also define xen,shm-id as a string.
> > 
> > On the Xen side, I would suggest to put a clear size limit so that the string is
> > easier to handle.
> 
> I've already made the xen,shm-id parsed as a string too, seeing the below code:
> "
>     prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
>     if ( !prop_id )
>         return -ENOENT;
>     shm_id = simple_strtoul(prop_id->data, NULL, 10);
>     if ( shm_id >= NR_MEM_BANKS )
>     {
>         printk("fdt: invalid `xen,shm-id` %lu for static shared memory node.\n",
>                shm_id);
>         return -EINVAL;
>     }
> "
> The size limit is smaller than 256, just as stated in doc:
> "
> - xen,shm-id
> 
>     A string that represents the unique identifier of the shared memory
>     region. The maximum identifier shall be "xen,shm-id = 255".
> "
> Hope this fits what both of you suggested~~~

Yes. I think supporting arbitrary strings like "my-shared-mem-1" would
be nice-to-have but I wouldn't make it a hard requirement.

"255" as a string would match Linux's requirements for xen,id.

