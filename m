Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD15A55FB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 23:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394707.634209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSm7C-0007jv-Ed; Mon, 29 Aug 2022 21:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394707.634209; Mon, 29 Aug 2022 21:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSm7C-0007gt-BU; Mon, 29 Aug 2022 21:16:14 +0000
Received: by outflank-mailman (input) for mailman id 394707;
 Mon, 29 Aug 2022 21:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oSm7A-0007gn-9M
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 21:16:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd633e7f-27df-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 23:16:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 237E1B811F8;
 Mon, 29 Aug 2022 21:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01568C433D6;
 Mon, 29 Aug 2022 21:16:06 +0000 (UTC)
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
X-Inumbo-ID: cd633e7f-27df-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661807767;
	bh=NVR0qcLAXuOj3u1ZeHQxLYMFY2BrSZlvgLyc6Qq/q+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r0hkA534pNgRz3y5HJOUdNM6rSw0Kx0ioTGUuM1N5xnigqvBTaQtn6X9sg+HqeW0R
	 7aOFqO8pBZB87iAJTSdJat0vEia7XuwtUqP7cd94C+daZ5jx3NyoTVYuP1e15xTIgY
	 Ittrz8Snn1iYPh91nkmKh6trVlgu2MX+WtLFD2F/KGAGYLyzx5YW/T7CXaVvy4/pE+
	 ilh7TAPF/SHFvhUjVQYBnvtjR7v+pq04QkXQjQqNueFRNXhHVTO/AsJT3kj2WQK0hG
	 lmOfR8FX1lReuGcyuwwZpA9/yT2O0B+OqEfd31HrUmU6bpYQxHSyMbXpWUVGmshkDq
	 futGv/ri/oEtg==
Date: Mon, 29 Aug 2022 14:16:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 1/9] xen/arm: introduce static shared memory
In-Reply-To: <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208291411320.1134492@ubuntu-linux-20-04-desktop>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com> <20220721132115.3015761-2-Penny.Zheng@arm.com> <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org> <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Aug 2022, Penny Zheng wrote:
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Sent: Friday, August 26, 2022 9:17 PM
> > To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>
> > Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
> > 
> > Hi Penny,
> >
> 
> Hi Julien
>  
> > On 21/07/2022 14:21, Penny Zheng wrote:
> > > From: Penny Zheng <penny.zheng@arm.com>
> > >
> > > This patch series introduces a new feature: setting up static shared
> > > memory on a dom0less system, through device tree configuration.
> > >
> > > This commit parses shared memory node at boot-time, and reserve it in
> > > bootinfo.reserved_mem to avoid other use.
> > >
> > > This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> > > static-shm-related codes, and this option depends on static memory(
> > > CONFIG_STATIC_MEMORY). That's because that later we want to reuse a
> > > few helpers, guarded with CONFIG_STATIC_MEMORY, like
> > > acquire_staticmem_pages, etc, on static shared memory.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > ---
> > > v6 change:
> > > - when host physical address is ommited, output the error message
> > > since xen doesn't support it at the moment
> > > - add the following check: 1) The shm ID matches and the region
> > > exactly match
> > > 2) The shm ID doesn't match and the region doesn't overlap
> > > - change it to "unsigned int" to be aligned with nr_banks
> > > - check the len of the property to confirm is it big enough to contain
> > > "paddr", "size", and "gaddr"
> > > - shm_id defined before nr_shm_domain, so we could re-use the existing
> > > hole and avoid increasing the size of the structure.
> > > - change "nr_shm_domain" to "nr_shm_borrowers", to not increment if
> > > the role is owner in parsing code
> > > - make "xen,shm_id" property as arbitrary string, with a strict limit
> > > on the number of characters, MAX_SHM_ID_LENGTH
> > > ---
> > > v5 change:
> > > - no change
> > > ---
> > > v4 change:
> > > - nit fix on doc
> > > ---
> > > v3 change:
> > > - make nr_shm_domain unsigned int
> > > ---
> > > v2 change:
> > > - document refinement
> > > - remove bitmap and use the iteration to check
> > > - add a new field nr_shm_domain to keep the number of shared domain
> > > ---
> > >   docs/misc/arm/device-tree/booting.txt | 124 ++++++++++++++++++++
> > >   xen/arch/arm/Kconfig                  |   6 +
> > >   xen/arch/arm/bootfdt.c                | 157 ++++++++++++++++++++++++++
> > >   xen/arch/arm/include/asm/setup.h      |   9 ++
> > >   4 files changed, 296 insertions(+)
> > >
> > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > b/docs/misc/arm/device-tree/booting.txt
> > > index 98253414b8..8013fb98fe 100644
> > > --- a/docs/misc/arm/device-tree/booting.txt
> > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > @@ -378,3 +378,127 @@ device-tree:
> > >
> > >   This will reserve a 512MB region starting at the host physical address
> > >   0x30000000 to be exclusively used by DomU1.
> > > +
> > > +Static Shared Memory
> > > +====================
> > > +
> > > +The static shared memory device tree nodes allow users to statically
> > > +set up shared memory on dom0less system, enabling domains to do
> > > +shm-based communication.
> > > +
> > > +- compatible
> > > +
> > > +    "xen,domain-shared-memory-v1"
> > > +
> > > +- xen,shm-id
> > > +
> > > +    An arbitrary string that represents the unique identifier of the shared
> > > +    memory region, with a strict limit on the number of characters(\0
> > included),
> > > +    `MAX_SHM_ID_LENGTH(16)`. e.g. "xen,shm-id = "my-shared-mem-1"".
> > > +
> > > +- xen,shared-mem
> > > +
> > > +    An array takes a physical address, which is the base address of the
> > > +    shared memory region in host physical address space, a size, and a
> > guest
> > > +    physical address, as the target address of the mapping.
> > > +    e.g. xen,shared-mem = < [host physical address] [size] [guest
> > > + address] >
> > 
> > Your implementation below is checking for overlap and also have some
> > restriction. Can they be documented in the binding?
> > 
> > > +
> > > +    The number of cells for the host address (and size) is the same as the
> > > +    guest pseudo-physical address and they are inherited from the parent
> > node.
> > 
> > In v5, we discussed to have the host address optional. However, the binding
> > has not been updated to reflect that. Note that I am not asking to implement,
> > but instead request that the binding can be used for such setup.
> > 
> 
> How about:
> "
> Host physical address could be omitted by users, and let Xen decide where it locates.
> "
> Do you think I shall further point out that right now, this part feature is not implemented
> in codes?

Yeah. I would use:

Host physical address is optional, when missing Xen decides the
location (currently unimplemented).


> > > a/xen/arch/arm/include/asm/setup.h
> > b/xen/arch/arm/include/asm/setup.h
> > > index 2bb01ecfa8..39d4e93b8b 100644
> > > --- a/xen/arch/arm/include/asm/setup.h
> > > +++ b/xen/arch/arm/include/asm/setup.h
> > > @@ -23,10 +23,19 @@ typedef enum {
> > >   }  bootmodule_kind;
> > >
> > >
> > > +#ifdef CONFIG_STATIC_SHM
> > > +/* Indicates the maximum number of characters(\0 included) for shm_id
> > > +*/ #define MAX_SHM_ID_LENGTH 16 #endif
> > 
> > Is the #ifdef really needed?
> > 
> > > +
> > >   struct membank {
> > >       paddr_t start;
> > >       paddr_t size;
> > >       bool xen_domain; /* whether the memory bank is bound to a Xen
> > > domain. */
> > > +#ifdef CONFIG_STATIC_SHM
> > > +    char shm_id[MAX_SHM_ID_LENGTH];
> > > +    unsigned int nr_shm_borrowers;
> > > +#endif
> > >   };
> > 
> > If I calculated right, the structure will grow from 24 to 40 bytes. At the
> > moment, this is protected with CONFIG_STATIC_SHM which is unsupported.
> > However, I think we will need to do something as we can't continue to grow
> > 'membank' like that.
> > 
> > I don't have a quick suggestion for 4.17 (the feature freeze is in a week). Long
> > term, I think we will want to consider to move the shm ID in a separate array
> > that could be referenced here.
> > 
> > The other solution would be to have the shared memory regions in a
> > separate array. They would have their own structure which would either
> > embedded "membank" or contain a pointer/index to the bank.
> > 
> 
> Ok, so other than this fixing, others will be addressed in the next serie. And this
> part fixing will be introduced in a new follow-up patch serie after 4.17 release.

Yeah, exactly


> I'm in favor of introducing a new structure to contain shm-related data and let
> 'membank' contains a pointer to it, like
> ```
>  +struct shm_membank {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +}
> +
>  struct membank {
>      paddr_t start;
>      paddr_t size;
>      bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +    struct shm_membank *shm;
>  };
> ```
> Then every time we introduce a new feature here, following this strategy, 'membank' will
> at most grow 8 bytes for the reference.
> 
> I'm open to the discussion and will let it decide what it finally will be. ;)

Yeah something like that would work. I'll let Julien comments on the
specifics, but that's not for this week.

