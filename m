Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50265333F8
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 01:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336784.561196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte9P-0003JK-3R; Tue, 24 May 2022 23:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336784.561196; Tue, 24 May 2022 23:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte9P-0003H5-0B; Tue, 24 May 2022 23:41:19 +0000
Received: by outflank-mailman (input) for mailman id 336784;
 Tue, 24 May 2022 23:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nte9O-0003Gz-0S
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 23:41:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c2014e-dbbb-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 01:41:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2ABF4B81A50;
 Tue, 24 May 2022 23:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2EEC34100;
 Tue, 24 May 2022 23:41:13 +0000 (UTC)
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
X-Inumbo-ID: 00c2014e-dbbb-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653435673;
	bh=+XlkY9Fk1WHUNFVByRCydMFytj1Rt3Snpl9APTbb2sM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gtq/0YAIgsev6AEjR0XWT29sDwuf/6xvkMQoZNXv1U7NWqHsV8Qm59nRPn8x7khnP
	 2dzTZgG3ItyzV9S50+j6rPW5kM31/FtIoLLwcS0gLxJnlPpBfNURYzWO81C+wPWfR6
	 G07oFW+tSlHnfR04yWG820PvVbI+oEnzzjvEheOwLWnRLDvoK5dv2ZYkrYcyO3Bm57
	 ox4evRC9Q46QO7d/YN1Y/BdPFZMx2htTkclhEcbYQKE6r00n7F4TpbvHwzojGpdis5
	 AIksxkRvzmOtZjWEseM5B7WFqgod66hMoxr+ZkK6PAF0Z0eOnKQdNkzgdat0hvvfdd
	 M7jFKV13FM12g==
Date: Tue, 24 May 2022 16:41:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: setup: nr_banks should be unsigned int
In-Reply-To: <PAXPR08MB7420B675C676268501048D1B9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2205241641010.1905099@ubuntu-linux-20-04-desktop>
References: <20220523194631.66262-1-julien@xen.org> <PAXPR08MB7420B675C676268501048D1B9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-796825587-1653435673=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-796825587-1653435673=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 24 May 2022, Wei Chen wrote:
> Hi Julien,
> 
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > Julien Grall
> > Sent: 2022年5月24日 3:47
> > To: xen-devel@lists.xenproject.org
> > Cc: Michal Orzel <Michal.Orzel@arm.com>; Julien Grall <jgrall@amazon.com>;
> > Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>
> > Subject: [PATCH] xen/arm: setup: nr_banks should be unsigned int
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > It is not possible to have a negative number of banks. So switch
> > to unsigned int.
> > 
> > The type change is also propagated to any users of nr_banks that
> > were using "int" (there are not that many).
> > 
> > Note that fdt_num_mem_rsv() can actually returns a negative value
> > in case of an error. So the return should be checked before assigning
> > the result to an unsigned variable.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > ---
> >  xen/arch/arm/domain_build.c      |  9 +++++----
> >  xen/arch/arm/efi/efi-dom0.c      |  4 ++--
> >  xen/arch/arm/include/asm/setup.h |  6 +++---
> >  xen/arch/arm/setup.c             | 17 +++++++++++++----
> >  4 files changed, 23 insertions(+), 13 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index aa777741bdd0..6ecb6673a3cd 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -111,7 +111,8 @@ static bool __init insert_11_bank(struct domain *d,
> >                                    struct page_info *pg,
> >                                    unsigned int order)
> >  {
> > -    int res, i;
> > +    unsigned int i;
> > +    int res;
> >      mfn_t smfn;
> >      paddr_t start, size;
> > 
> > @@ -264,7 +265,7 @@ static void __init allocate_memory_11(struct domain *d,
> >      const unsigned int min_order = get_order_from_bytes(MB(4));
> >      struct page_info *pg;
> >      unsigned int order = get_allocation_size(kinfo->unassigned_mem);
> > -    int i;
> > +    unsigned int i;
> > 
> >      bool lowmem = true;
> >      unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
> > @@ -1022,8 +1023,8 @@ static int __init make_memory_node(const struct
> > domain *d,
> >                                     int addrcells, int sizecells,
> >                                     struct meminfo *mem)
> >  {
> > -    int res, i;
> > -    int reg_size = addrcells + sizecells;
> > +    unsigned int i;
> > +    int res, reg_size = addrcells + sizecells;
> >      int nr_cells = 0;
> >      /* Placeholder for memory@ + a 64-bit number + \0 */
> >      char buf[24];
> > diff --git a/xen/arch/arm/efi/efi-dom0.c b/xen/arch/arm/efi/efi-dom0.c
> > index 494420eaa23e..aae0f979112a 100644
> > --- a/xen/arch/arm/efi/efi-dom0.c
> > +++ b/xen/arch/arm/efi/efi-dom0.c
> > @@ -34,14 +34,14 @@
> >  /* Constant to indicate "Xen" in unicode u16 format */
> >  static const CHAR16 xen_efi_fw_vendor[] = {0x0058, 0x0065, 0x006E,
> > 0x0000};
> > 
> > -size_t __init estimate_efi_size(int mem_nr_banks)
> > +size_t __init estimate_efi_size(unsigned int mem_nr_banks)
> >  {
> >      size_t size;
> >      size_t est_size = sizeof(EFI_SYSTEM_TABLE);
> >      size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE);
> >      size_t emd_size = sizeof(EFI_MEMORY_DESCRIPTOR);
> >      size_t fw_vendor_size = sizeof(xen_efi_fw_vendor);
> > -    int acpi_mem_nr_banks = 0;
> > +    unsigned int acpi_mem_nr_banks = 0;
> > 
> >      if ( !acpi_disabled )
> >          acpi_mem_nr_banks = bootinfo.acpi.nr_banks;
> > diff --git a/xen/arch/arm/include/asm/setup.h
> > b/xen/arch/arm/include/asm/setup.h
> > index 7a1e1d67989c..2bb01ecfa88f 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -30,7 +30,7 @@ struct membank {
> >  };
> > 
> >  struct meminfo {
> > -    int nr_banks;
> > +    unsigned int nr_banks;
> >      struct membank bank[NR_MEM_BANKS];
> >  };
> > 
> > @@ -93,7 +93,7 @@ extern domid_t max_init_domid;
> > 
> >  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> > 
> > -size_t estimate_efi_size(int mem_nr_banks);
> > +size_t estimate_efi_size(unsigned int mem_nr_banks);
> > 
> >  void acpi_create_efi_system_table(struct domain *d,
> >                                    struct membank tbl_add[]);
> > @@ -109,7 +109,7 @@ void create_dom0(void);
> > 
> >  void discard_initial_modules(void);
> >  void fw_unreserved_regions(paddr_t s, paddr_t e,
> > -                           void (*cb)(paddr_t, paddr_t), int first);
> > +                           void (*cb)(paddr_t, paddr_t), unsigned int
> > first);
> > 
> >  size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> >  const char *boot_fdt_cmdline(const void *fdt);
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index db1768c03f03..b30bccbaa7df 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -201,9 +201,17 @@ static void __init processor_id(void)
> > 
> >  static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> >                                           void (*cb)(paddr_t, paddr_t),
> > -                                         int first)
> > +                                         unsigned int first)
> >  {
> > -    int i, nr = fdt_num_mem_rsv(device_tree_flattened);
> > +    unsigned int i, nr;
> > +    int rc;
> > +
> > +    rc = fdt_num_mem_rsv(device_tree_flattened);
> > +    if ( rc < 0 )
> > +        panic("Unable to retrieve the number of reserved regions
> > (rc=%d)\n",
> > +              rc);
> > +
> > +    nr = rc;
> > 
> >      for ( i = first; i < nr ; i++ )
> >      {
> > @@ -249,7 +257,8 @@ static void __init dt_unreserved_regions(paddr_t s,
> > paddr_t e,
> >  }
> > 
> >  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
> > -                                  void (*cb)(paddr_t, paddr_t), int first)
> > +                                  void (*cb)(paddr_t, paddr_t),
> > +                                  unsigned int first)
> >  {
> >      if ( acpi_disabled )
> >          dt_unreserved_regions(s, e, cb, first);
> > @@ -693,7 +702,7 @@ static void __init setup_mm(void)
> >      paddr_t ram_start, ram_end, ram_size, e;
> >      unsigned long ram_pages;
> >      unsigned long heap_pages, xenheap_pages, domheap_pages;
> > -    int i;
> > +    unsigned int i;
> >      const uint32_t ctr = READ_CP32(CTR);
> > 
> >      if ( !bootinfo.mem.nr_banks )
> 
> Reviewed-by: Wei Chen <Wei.Chen@arm.com>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

and committed
--8323329-796825587-1653435673=:1905099--

