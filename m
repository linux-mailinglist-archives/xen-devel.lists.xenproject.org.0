Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C855A406
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 23:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355916.583885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4rIV-0008Qy-9n; Fri, 24 Jun 2022 21:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355916.583885; Fri, 24 Jun 2022 21:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4rIV-0008O1-5Q; Fri, 24 Jun 2022 21:57:03 +0000
Received: by outflank-mailman (input) for mailman id 355916;
 Fri, 24 Jun 2022 21:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+8T=W7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4rIT-0008Nv-JU
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 21:57:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92c0caad-f408-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 23:57:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A809B82B63;
 Fri, 24 Jun 2022 21:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13E6C34114;
 Fri, 24 Jun 2022 21:56:57 +0000 (UTC)
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
X-Inumbo-ID: 92c0caad-f408-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656107818;
	bh=nW//reqxFHN8IpxxmzQEx9kqa7PnsGTgPmjdUQkcd0U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QyI1xn1C5PQDAF2lIeVYl4zH4HmqJHM4qVZbjNzBqfl68uLqnn2KSXXOuG87z2nOs
	 CktYgC3FDXwlJFoTbC1PwEFATgW5LkcpcYCQwZ4upp1/qkLI4suDXTMqkYbxxGb4Ho
	 CeVlBdL5g2Voi/UnQpm4F7X8oGVo+HwGmld7JE7NCJ6RMDnCNeJorz12kqXLHW/Lll
	 O8BlT9PCGeLGelrlIiw3JkVA8SOk8tGlyyWaQylhHUfGG/3ZwfUxIQ/UTrG8s5eyPT
	 m49gBBawv1Jfnrp9c9a934J5/5r7voyw/0dKcdfc/Nrv0GqgpZaiaEdydbp//4/lfL
	 628+HRXrjmukQ==
Date: Fri, 24 Jun 2022 14:56:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
References: <20220620051114.210118-1-Penny.Zheng@arm.com> <20220620051114.210118-8-Penny.Zheng@arm.com> <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jun 2022, Julien Grall wrote:
> On 20/06/2022 06:11, Penny Zheng wrote:
> > We expose the shared memory to the domU using the "xen,shared-memory-v1"
> > reserved-memory binding. See
> > Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> > in Linux for the corresponding device tree binding.
> > 
> > To save the cost of re-parsing shared memory device tree configuration when
> > creating shared memory nodes in guest device tree, this commit adds new
> > field
> > "shm_mem" to store shm-info per domain.
> > 
> > For each shared memory region, a range is exposed under
> > the /reserved-memory node as a child node. Each range sub-node is
> > named xen-shmem@<address> and has the following properties:
> > - compatible:
> >          compatible = "xen,shared-memory-v1"
> > - reg:
> >          the base guest physical address and size of the shared memory
> > region
> > - xen,id:
> >          a string that identifies the shared memory region.
> > 
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > v5 change:
> > - no change
> > ---
> > v4 change:
> > - no change
> > ---
> > v3 change:
> > - move field "shm_mem" to kernel_info
> > ---
> > v2 change:
> > - using xzalloc
> > - shm_id should be uint8_t
> > - make reg a local variable
> > - add #address-cells and #size-cells properties
> > - fix alignment
> > ---
> >   xen/arch/arm/domain_build.c       | 143 +++++++++++++++++++++++++++++-
> >   xen/arch/arm/include/asm/kernel.h |   1 +
> >   xen/arch/arm/include/asm/setup.h  |   1 +
> >   3 files changed, 143 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 1584e6c2ce..4d62440a0e 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -900,7 +900,22 @@ static int __init allocate_shared_memory(struct domain
> > *d,
> >       return ret;
> >   }
> >   -static int __init process_shm(struct domain *d,
> > +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> > +                                            paddr_t start, paddr_t size,
> > +                                            u32 shm_id)
> > +{
> > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > +        return -ENOMEM;
> > +
> > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id = shm_id;
> > +    kinfo->shm_mem.nr_banks++;
> > +
> > +    return 0;
> > +}
> > +
> > +static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
> >                                 const struct dt_device_node *node)
> >   {
> >       struct dt_device_node *shm_node;
> > @@ -971,6 +986,14 @@ static int __init process_shm(struct domain *d,
> >               if ( ret )
> >                   return ret;
> >           }
> > +
> > +        /*
> > +         * Record static shared memory region info for later setting
> > +         * up shm-node in guest device tree.
> > +         */
> > +        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
> > +        if ( ret )
> > +            return ret;
> >       }
> >         return 0;
> > @@ -1301,6 +1324,117 @@ static int __init make_memory_node(const struct
> > domain *d,
> >       return res;
> >   }
> >   +#ifdef CONFIG_STATIC_SHM
> > +static int __init make_shm_memory_node(const struct domain *d,
> > +                                       void *fdt,
> > +                                       int addrcells, int sizecells,
> > +                                       struct meminfo *mem)
> 
> NIT: AFAICT mem is not changed, so it should be const.
> 
> > +{
> > +    unsigned long i = 0;
> 
> NIT: This should be "unsigned int" to match the type of nr_banks.
> 
> > +    int res = 0;
> > +
> > +    if ( mem->nr_banks == 0 )
> > +        return -ENOENT;
> > +
> > +    /*
> > +     * For each shared memory region, a range is exposed under
> > +     * the /reserved-memory node as a child node. Each range sub-node is
> > +     * named xen-shmem@<address>.
> > +     */
> > +    dt_dprintk("Create xen-shmem node\n");
> > +
> > +    for ( ; i < mem->nr_banks; i++ )
> > +    {
> > +        uint64_t start = mem->bank[i].start;
> > +        uint64_t size = mem->bank[i].size;
> > +        uint8_t shm_id = mem->bank[i].shm_id;
> > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> > +        char buf[27];
> > +        const char compat[] = "xen,shared-memory-v1";
> > +        __be32 reg[4];
> > +        __be32 *cells;
> > +        unsigned int len = (addrcells + sizecells) * sizeof(__be32);
> > +
> > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > mem->bank[i].start);
> > +        res = fdt_begin_node(fdt, buf);
> > +        if ( res )
> > +            return res;
> > +
> > +        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> > +        if ( res )
> > +            return res;
> > +
> > +        cells = reg;
> > +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> > +
> > +        res = fdt_property(fdt, "reg", reg, len);
> > +        if ( res )
> > +            return res;
> > +
> > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
> > +                   i, start, start + size);
> > +
> > +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> 
> Looking at the Linux binding, "xen,id" is meant to be a string. But here you
> are writing it as an integer.

Good catch!


> Given that the Linux binding is already merged, I think the Xen binding should
> be changed.

We would be compliant with both bindings (xen and linux) just by writing
shm_id as string here, but if it is not too difficult we might as well
harmonize the two bindings and also define xen,shm-id as a string.

On the Xen side, I would suggest to put a clear size limit so that the
string is easier to handle.

