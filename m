Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C078E5A9DC5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396852.637202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTngP-0003Ar-0u; Thu, 01 Sep 2022 17:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396852.637202; Thu, 01 Sep 2022 17:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTngO-00037O-UN; Thu, 01 Sep 2022 17:08:48 +0000
Received: by outflank-mailman (input) for mailman id 396852;
 Thu, 01 Sep 2022 17:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTngN-00037F-Af
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:08:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc40969f-2a18-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 19:08:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E32CB61FD9;
 Thu,  1 Sep 2022 17:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C0EC433D6;
 Thu,  1 Sep 2022 17:08:42 +0000 (UTC)
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
X-Inumbo-ID: bc40969f-2a18-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662052123;
	bh=VpjvON3sVPsd8U1rNg088Qqso0kdxHxvxaDSoUjwo6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JPOXyE/1a34n0qCijYduvy1yyOHswBgj6+ZbJvhWZi67Scw8XpCocJkIcOWFjsd5r
	 YTnnQxsSwiGXNW6iLB88dwKibViXWklPk9pnDlV0TLEH4fJwyd48Gu3Sq74c/FaI1F
	 4uSwWkVX5pX762uj1qDQ4egLxrrHbHQRLU4OK9yOjUVzjBtWORO8tZxoskrlE5jXqP
	 6aUqWvqm+Rv2WzZx1zmRYkr2t8X2ESgV0STlyAeN+F7aPiJx9WBoYykvk5lQ+WiwQp
	 +WiuuMwRPjNsxd6ZEwZrM1mbK+cuIG9HXwAowN8nLX0GwJ8xTTgYhtCHrcIteTba3d
	 FD2C6COKiTGxQ==
Date: Thu, 1 Sep 2022 10:08:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org> <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Henry Wang wrote:
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and
> > heap allocator
> > 
> > Hi Henry,
> > 
> > On 24/08/2022 08:31, Henry Wang wrote:
> > > This commit firstly adds a global variable `reserved_heap`.
> > > This newly introduced global variable is set at the device tree
> > > parsing time if the reserved heap ranges are defined in the device
> > > tree chosen node.
> > >
> > > For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
> > > the reserved heap region for both domheap and xenheap allocation.
> > >
> > > For Arm64, In `setup_mm`, if the reserved heap is enabled and used,
> > > we make sure that only these reserved heap pages are added to the
> > > boot allocator. These reserved heap pages in the boot allocator are
> > > added to the heap allocator at `end_boot_allocator()`.
> > >
> > > If the reserved heap is disabled, we stick to current page allocation
> > > strategy at boot time.
> > >
> > > Also, take the chance to correct a "double not" print in Arm32
> > > `setup_mm()`.
> > >
> > > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > > ---
> > > With reserved heap enabled, for Arm64, naming of global variables such
> > > as `xenheap_mfn_start` and `xenheap_mfn_end` seems to be ambiguous,
> > > wondering if we should rename these variables.
> > > ---
> > > Changes from RFC to v1:
> > > - Rebase on top of latest `setup_mm()` changes.
> > > - Added Arm32 logic in `setup_mm()`.
> > > ---
> > >   xen/arch/arm/bootfdt.c           |  2 +
> > >   xen/arch/arm/include/asm/setup.h |  2 +
> > >   xen/arch/arm/setup.c             | 79 +++++++++++++++++++++++++-------
> > >   3 files changed, 67 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > index 33704ca487..ab73b6e212 100644
> > > --- a/xen/arch/arm/bootfdt.c
> > > +++ b/xen/arch/arm/bootfdt.c
> > > @@ -325,6 +325,8 @@ static int __init process_chosen_node(const void
> > *fdt, int node,
> > >                                        true);
> > >           if ( rc )
> > >               return rc;
> > > +
> > > +        reserved_heap = true;
> > >       }
> > >
> > >       printk("Checking for initrd in /chosen\n");
> > > diff --git a/xen/arch/arm/include/asm/setup.h
> > b/xen/arch/arm/include/asm/setup.h
> > > index e80f3d6201..00536a6d55 100644
> > > --- a/xen/arch/arm/include/asm/setup.h
> > > +++ b/xen/arch/arm/include/asm/setup.h
> > > @@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
> > >
> > >   extern domid_t max_init_domid;
> > >
> > > +extern bool reserved_heap;
> > > +
> > >   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> > >
> > >   size_t estimate_efi_size(unsigned int mem_nr_banks);
> > > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > > index 500307edc0..fe76cf6325 100644
> > > --- a/xen/arch/arm/setup.c
> > > +++ b/xen/arch/arm/setup.c
> > > @@ -73,6 +73,8 @@ integer_param("xenheap_megabytes",
> > opt_xenheap_megabytes);
> > >
> > >   domid_t __read_mostly max_init_domid;
> > >
> > > +bool __read_mostly reserved_heap;
> > > +
> > >   static __used void init_done(void)
> > >   {
> > >       /* Must be done past setting system_state. */
> > > @@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
> > >   #ifdef CONFIG_ARM_32
> > >   static void __init setup_mm(void)
> > >   {
> > > -    paddr_t ram_start, ram_end, ram_size, e;
> > > -    unsigned long ram_pages;
> > > +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end,
> > bank_size;
> > > +    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,
> > > +            reserved_heap_size = 0;
> > > +    unsigned long ram_pages, reserved_heap_pages = 0;
> > >       unsigned long heap_pages, xenheap_pages, domheap_pages;
> > >       unsigned int i;
> > >       const uint32_t ctr = READ_CP32(CTR);
> > > @@ -720,9 +724,9 @@ static void __init setup_mm(void)
> > >
> > >       for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
> > >       {
> > > -        paddr_t bank_start = bootinfo.mem.bank[i].start;
> > > -        paddr_t bank_size = bootinfo.mem.bank[i].size;
> > > -        paddr_t bank_end = bank_start + bank_size;
> > > +        bank_start = bootinfo.mem.bank[i].start;
> > > +        bank_size = bootinfo.mem.bank[i].size;
> > > +        bank_end = bank_start + bank_size;
> > >
> > >           ram_size  = ram_size + bank_size;
> > >           ram_start = min(ram_start,bank_start);
> > > @@ -731,6 +735,25 @@ static void __init setup_mm(void)
> > >
> > >       total_pages = ram_pages = ram_size >> PAGE_SHIFT;
> > >
> > > +    if ( reserved_heap )
> > > +    {
> > > +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> > > +        {
> > > +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
> > > +            {
> > > +                bank_start = bootinfo.reserved_mem.bank[i].start;
> > > +                bank_size = bootinfo.reserved_mem.bank[i].size;
> > > +                bank_end = bank_start + bank_size;
> > > +
> > > +                reserved_heap_size += bank_size;
> > > +                reserved_heap_start = min(reserved_heap_start, bank_start);
> > > +                reserved_heap_end = max(reserved_heap_end, bank_end);
> > > +            }
> > > +        }
> > > +
> > > +        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
> > > +    }
> > > +
> > >       /*
> > >        * If the user has not requested otherwise via the command line
> > >        * then locate the xenheap using these constraints:
> > > @@ -743,7 +766,8 @@ static void __init setup_mm(void)
> > >        * We try to allocate the largest xenheap possible within these
> > >        * constraints.
> > >        */
> > > -    heap_pages = ram_pages;
> > > +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
> > > +
> > >       if ( opt_xenheap_megabytes )
> > >           xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
> > >       else
> > > @@ -755,17 +779,21 @@ static void __init setup_mm(void)
> > >
> > >       do
> > >       {
> > > -        e = consider_modules(ram_start, ram_end,
> > > +        e = !reserved_heap ?
> > > +            consider_modules(ram_start, ram_end,
> > >                                pfn_to_paddr(xenheap_pages),
> > > -                             32<<20, 0);
> > > +                             32<<20, 0) :
> > > +            reserved_heap_end;
> > 
> > Not entirely related to this series. Now the assumption is the admin
> > will make sure that none of the reserved regions will overlap.
> > 
> > Do we have any tool to help the admin to verify it? If yes, can we have
> > a pointer in the documentation? If not, should this be done in Xen?
> 
> In the RFC we had the same discussion of this issue [1] and I think a
> follow-up series might needed to do the overlap check if we want to
> do that in Xen. For the existing tool, I am thinking of ImageBuilder, but
> I am curious about Stefano's opinion.

Yes, ImageBuilder is a good option and we moved ImageBuilder under Xen
Project to make it easier for people to contribute to it:

https://gitlab.com/xen-project/imagebuilder


> > Also, what happen with UEFI? Is it easy to guarantee the region will not
> > be used?
> 
> For now I think it is not easy to guarantee that, do you have some ideas
> in mind? I think I can follow this in above follow-up series to improve things. 

For clarity, are we worried that the region is used by the bootloader
for other things? For instance U-Boot or Tianocore placing some
firmware tables inside the range specified for xenheap?

