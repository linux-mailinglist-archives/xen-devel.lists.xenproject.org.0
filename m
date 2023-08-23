Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F64784DAE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 02:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588806.920414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbRw-0003sS-As; Wed, 23 Aug 2023 00:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588806.920414; Wed, 23 Aug 2023 00:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbRw-0003qS-7l; Wed, 23 Aug 2023 00:10:16 +0000
Received: by outflank-mailman (input) for mailman id 588806;
 Wed, 23 Aug 2023 00:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYbRu-0003qM-4z
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 00:10:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbb22ca-4149-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 02:10:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B22A963E32;
 Wed, 23 Aug 2023 00:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0F6C433C9;
 Wed, 23 Aug 2023 00:10:06 +0000 (UTC)
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
X-Inumbo-ID: 6bbb22ca-4149-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692749408;
	bh=uk1Hl9USxu4up6h5O9g0vTC317SzaqVg7tVlFDrcRYc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rv2QR2TXbulwJXgAHhAXhRgiRQLuTJomvkmUTxbOmjsXLnnXZv2UmSf6V5bwDTBHi
	 CU0NqoZVith9nkBvaOShRsjEn5jwO36RNWC/SoDWEV5eDJwW8AIMDYJ1CRM6F4tWkI
	 yKExIlg/EeuM+uAwbIuMWa5zn4JLmd0Ym6PetiJBc/JtphlFPAk7hKA/b7yK0EBkyB
	 VMyG5+LHffQldmvR7KDui5xmUW7sOmfnV5kcGlau/s/h6iOdVgXGpsKYoIqBN466SJ
	 53zu/CHCqwI2UPMijJPSVrxO+Dyc6ySScf9slHjK4OCtR7Aq55VHst0rImsjgoeNkf
	 iPoRj2pci+rkg==
Date: Tue, 22 Aug 2023 17:10:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <Henry.Wang@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
In-Reply-To: <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308221656400.6458@ubuntu-linux-20-04-desktop>
References: <20230814042536.878720-1-Henry.Wang@arm.com> <20230814042536.878720-13-Henry.Wang@arm.com> <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org> <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com> <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-416300-1692748692=:6458"
Content-ID: <alpine.DEB.2.22.394.2308221658280.6458@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-416300-1692748692=:6458
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308221658281.6458@ubuntu-linux-20-04-desktop>

On Tue, 22 Aug 2023, Julien Grall wrote:
> > > I also don't like the idea of having again a massive mm.c files. So maybe
> > > we need a split like:
> > >   * File 1: Boot CPU0 MM bringup (mmu/setup.c)
> > >   * File 2: Secondary CPUs MM bringup (mmu/smpboot.c)
> > >   * File 3: Page tables update. (mmu/pt.c)
> > > 
> > > Ideally file 1 should contain only init code/data so it can be marked as
> > > .init. So the static pagetables may want to be defined in mmu/pt.c.
> > 
> > So based on Julien’s suggestion, Penny and I worked a bit on the current
> > functions in “arch/arm/mm.c” and we would like to propose below split
> > scheme, would you please comment on if below makes sense to you,
> > thanks!
> > 
> > """
> > static void __init __maybe_unused build_assertions()      -> arch/arm/mm.c
> 
> All the existing build assertions seems to be MMU specific. So shouldn't they
> be moved to mmu/mm.c.
> 
> > static lpae_t *xen_map_table()                            -> mmu/pt.c
> > static void xen_unmap_table()                             -> mmu/pt.c
> > void dump_pt_walk()                                       -> mmu/pt.c
> > void dump_hyp_walk()                                      -> mmu/pt.c
> > lpae_t mfn_to_xen_entry()                                 -> mmu/pt.c
> > void set_fixmap()                                         -> mmu/pt.c
> > void clear_fixmap()                                       -> mmu/pt.c
> > void flush_page_to_ram()                                  -> arch/arm/mm.c?
> 
> I think it should stay in arch/arm/mm.c because you will probably need to
> clean a page even on MPU systems.

I take you are referring to flush_page_to_ram() only, and not the other
functions above


> > lpae_t pte_of_xenaddr()                                   -> mmu/pt.c
> > void * __init early_fdt_map()                             -> mmu/setup.c
> > void __init remove_early_mappings()                       -> mmu/setup.c
> > static void xen_pt_enforce_wnx()                          -> mmu/pt.c,
> > export it
> 
> AFAIU, it would be called from smpboot.c and setup.c. For the former, the
> caller is mmu_init_secondary_cpu() which I think can be folded in head.S.
> 
> If we do that, then xen_pt_enforce_wnx() can be moved in setup.c and doesn't
> need to be exported.
> 
> > static void clear_table()                                 -> mmu/smpboot.c
> > void __init setup_pagetables()                            -> mmu/setup.c
> > static void clear_boot_pagetables()                       -> mmu/smpboot.c

Why clear_table() and clear_boot_pagetables() in mmu/smpboot.c rather
than mmu/setup.c ? It is OK either way as it does seem to make much of a
difference but I am curious.


> > int init_secondary_pagetables()                           -> mmu/smpboot.c
> > void mmu_init_secondary_cpu()                             -> mmu/smpboot.c
> > void __init setup_directmap_mappings()                    -> mmu/setup.c
> > void __init setup_frametable_mappings()                   -> mmu/setup.c
> > void *__init arch_vmap_virt_end()                         -> arch/arm/mm.c
> > or mmu/setup.c?
> 
> AFAIU, the VMAP will not be used for MPU systems. So this would want to go in
> mmu/. I am ok with setup.c.
> 
> > void *ioremap_attr()                                      -> mmu/pt.c
> > void *ioremap()                                           -> mmu/pt.c
> > static int create_xen_table()                             -> mmu/pt.c
> > static int xen_pt_next_level()                            -> mmu/pt.c
> > static bool xen_pt_check_entry()                          -> mmu/pt.c
> > static int xen_pt_update_entry()                          -> mmu/pt.c
> > static int xen_pt_mapping_level()                         -> mmu/pt.c
> > static unsigned int xen_pt_check_contig()                 -> mmu/pt.c
> > static int xen_pt_update()                                -> mmu/pt.c
> > int map_pages_to_xen()                                    -> mmu/pt.c
> > int __init populate_pt_range()                            -> mmu/pt.c
> > int destroy_xen_mappings()                                -> mmu/pt.c
> > int modify_xen_mappings()                                 -> mmu/pt.c
> > void free_init_memory()                                   -> mmu/setup.c
> > void arch_dump_shared_mem_info()                          -> arch/arm/mm.c
> > int steal_page()                                          -> arch/arm/mm.c
> > int page_is_ram_type()                                    -> arch/arm/mm.c
> > unsigned long domain_get_maximum_gpfn()                   -> arch/arm/mm.c
> > void share_xen_page_with_guest()                          -> arch/arm/mm.c
> > int xenmem_add_to_physmap_one()                           -> arch/arm/mm.c
> > long arch_memory_op()                                     -> arch/arm/mm.c
> > static struct domain *page_get_owner_and_nr_reference()   -> arch/arm/mm.c
> > struct domain *page_get_owner_and_reference()             -> arch/arm/mm.c
> > void put_page_nr()                                        -> arch/arm/mm.c
> > void put_page()                                           -> arch/arm/mm.c
> > bool get_page_nr()                                        -> arch/arm/mm.c
> > bool get_page()                                           -> arch/arm/mm.c
> > int get_page_type()                                       -> arch/arm/mm.c
> > void put_page_type()                                      -> arch/arm/mm.c
> > int create_grant_host_mapping()                           -> arch/arm/mm.c
> > int replace_grant_host_mapping()                          -> arch/arm/mm.c
> > bool is_iomem_page()                                      -> arch/arm/mm.c
> > void clear_and_clean_page()                               -> arch/arm/mm.c
> > unsigned long get_upper_mfn_bound()                       -> arch/arm/mm.c
> > """
> 
> The placement of all the ones I didn't comment on look fine to me. It would be
> good to have a second opinion from either Bertrand or Stefano before you start
> moving the functions.

It looks good in principle and it also looks like a great clean up. It
is not always super clear to me the distinction between mmu/pt.c,
mmu/smpboot.c and mmu/setup.c but it doesn't seem important. The
distinction between mmu/* and arch/arm/mm.c is clear and looks fine to
me.

I am looking forward to this!

--8323329-416300-1692748692=:6458--

