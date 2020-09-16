Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D326C2E2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWmW-0000ol-8z; Wed, 16 Sep 2020 12:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Seh/=CZ=amazon.co.uk=prvs=5210763a1=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kIWmU-0000oF-OD
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:43:26 +0000
X-Inumbo-ID: 9cb64108-9d1c-4412-b1ab-e43beadfd82b
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cb64108-9d1c-4412-b1ab-e43beadfd82b;
 Wed, 16 Sep 2020 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600260206; x=1631796206;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jXJTF3A9Xh25UE7NgNTeWzQUPolnNpqoL6wMRpOdrwU=;
 b=iezBpBO0K7gesVbZMXiiw5LOojpV+bpHb29LKNctMSC5h8bE7iNV4zIh
 po/Pm1L6mD/W3LvkcUFYFOVXXBzOiqoWLpo1Ltift/Q2uR6Fn55FXEPiC
 AiEB+oLNXC1+1kztOiJlBoIKiSmpNR5+DCcyN1MPHKBmCuVcQMSTh4Lam 0=;
X-IronPort-AV: E=Sophos;i="5.76,432,1592870400"; d="scan'208";a="54375749"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 16 Sep 2020 12:43:18 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS
 id E00A4A28EF; Wed, 16 Sep 2020 12:43:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 16 Sep 2020 12:43:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 16 Sep 2020 12:43:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Kevin Tian <kevin.tian@intel.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v8 1/8] x86/iommu: convert VT-d code to use new page table
 allocator
Thread-Topic: [PATCH v8 1/8] x86/iommu: convert VT-d code to use new page
 table allocator
Thread-Index: AdaMJsfz93KxQJa5RlCBdw/c2d3vbw==
Date: Wed, 16 Sep 2020 12:43:15 +0000
Message-ID: <5d4931c83cdb46b687300cd52ac6f6e9@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Kevin, ping?

This patch hasn't changed since v2.

  Paul

> -----Original Message-----
> From: Paul Durrant <paul@xen.org>
> Sent: 11 September 2020 09:20
> To: xen-devel@lists.xenproject.org
> Cc: Durrant, Paul <pdurrant@amazon.co.uk>; Jan Beulich <jbeulich@suse.com=
>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: [PATCH v8 1/8] x86/iommu: convert VT-d code to use new page tabl=
e allocator
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> This patch converts the VT-d code to use the new IOMMU page table allocat=
or
> function. This allows all the free-ing code to be removed (since it is no=
w
> handled by the general x86 code) which reduces TLB and cache thrashing as=
 well
> as shortening the code.
>=20
> The scope of the mapping_lock in intel_iommu_quarantine_init() has also b=
een
> increased slightly; it should have always covered accesses to
> 'arch.vtd.pgd_maddr'.
>=20
> NOTE: The common IOMMU needs a slight modification to avoid scheduling th=
e
>       cleanup tasklet if the free_page_table() method is not present (sin=
ce
>       the tasklet will unconditionally call it).
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v2:
>  - New in v2 (split from "add common page-table allocator")
> ---
>  xen/drivers/passthrough/iommu.c     |   6 +-
>  xen/drivers/passthrough/vtd/iommu.c | 101 ++++++++++------------------
>  2 files changed, 39 insertions(+), 68 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/io=
mmu.c
> index 1d644844ab..2b1db8022c 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -225,8 +225,10 @@ static void iommu_teardown(struct domain *d)
>  {
>      struct domain_iommu *hd =3D dom_iommu(d);
>=20
> -    hd->platform_ops->teardown(d);
> -    tasklet_schedule(&iommu_pt_cleanup_tasklet);
> +    iommu_vcall(hd->platform_ops, teardown, d);
> +
> +    if ( hd->platform_ops->free_page_table )
> +        tasklet_schedule(&iommu_pt_cleanup_tasklet);
>  }
>=20
>  void iommu_domain_destroy(struct domain *d)
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthroug=
h/vtd/iommu.c
> index 94e0455a4d..607e8b5e65 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -265,10 +265,15 @@ static u64 addr_to_dma_page_maddr(struct domain *do=
main, u64 addr, int alloc)
>=20
>      addr &=3D (((u64)1) << addr_width) - 1;
>      ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> -    if ( !hd->arch.vtd.pgd_maddr &&
> -         (!alloc ||
> -          ((hd->arch.vtd.pgd_maddr =3D alloc_pgtable_maddr(1, hd->node))=
 =3D=3D 0)) )
> -        goto out;
> +    if ( !hd->arch.vtd.pgd_maddr )
> +    {
> +        struct page_info *pg;
> +
> +        if ( !alloc || !(pg =3D iommu_alloc_pgtable(domain)) )
> +            goto out;
> +
> +        hd->arch.vtd.pgd_maddr =3D page_to_maddr(pg);
> +    }
>=20
>      parent =3D (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_ma=
ddr);
>      while ( level > 1 )
> @@ -279,13 +284,16 @@ static u64 addr_to_dma_page_maddr(struct domain *do=
main, u64 addr, int alloc)
>          pte_maddr =3D dma_pte_addr(*pte);
>          if ( !pte_maddr )
>          {
> +            struct page_info *pg;
> +
>              if ( !alloc )
>                  break;
>=20
> -            pte_maddr =3D alloc_pgtable_maddr(1, hd->node);
> -            if ( !pte_maddr )
> +            pg =3D iommu_alloc_pgtable(domain);
> +            if ( !pg )
>                  break;
>=20
> +            pte_maddr =3D page_to_maddr(pg);
>              dma_set_pte_addr(*pte, pte_maddr);
>=20
>              /*
> @@ -675,45 +683,6 @@ static void dma_pte_clear_one(struct domain *domain,=
 uint64_t addr,
>      unmap_vtd_domain_page(page);
>  }
>=20
> -static void iommu_free_pagetable(u64 pt_maddr, int level)
> -{
> -    struct page_info *pg =3D maddr_to_page(pt_maddr);
> -
> -    if ( pt_maddr =3D=3D 0 )
> -        return;
> -
> -    PFN_ORDER(pg) =3D level;
> -    spin_lock(&iommu_pt_cleanup_lock);
> -    page_list_add_tail(pg, &iommu_pt_cleanup_list);
> -    spin_unlock(&iommu_pt_cleanup_lock);
> -}
> -
> -static void iommu_free_page_table(struct page_info *pg)
> -{
> -    unsigned int i, next_level =3D PFN_ORDER(pg) - 1;
> -    u64 pt_maddr =3D page_to_maddr(pg);
> -    struct dma_pte *pt_vaddr, *pte;
> -
> -    PFN_ORDER(pg) =3D 0;
> -    pt_vaddr =3D (struct dma_pte *)map_vtd_domain_page(pt_maddr);
> -
> -    for ( i =3D 0; i < PTE_NUM; i++ )
> -    {
> -        pte =3D &pt_vaddr[i];
> -        if ( !dma_pte_present(*pte) )
> -            continue;
> -
> -        if ( next_level >=3D 1 )
> -            iommu_free_pagetable(dma_pte_addr(*pte), next_level);
> -
> -        dma_clear_pte(*pte);
> -        iommu_sync_cache(pte, sizeof(struct dma_pte));
> -    }
> -
> -    unmap_vtd_domain_page(pt_vaddr);
> -    free_pgtable_maddr(pt_maddr);
> -}
> -
>  static int iommu_set_root_entry(struct vtd_iommu *iommu)
>  {
>      u32 sts;
> @@ -1748,16 +1717,7 @@ static void iommu_domain_teardown(struct domain *d=
)
>          xfree(mrmrr);
>      }
>=20
> -    ASSERT(is_iommu_enabled(d));
> -
> -    if ( iommu_use_hap_pt(d) )
> -        return;
> -
> -    spin_lock(&hd->arch.mapping_lock);
> -    iommu_free_pagetable(hd->arch.vtd.pgd_maddr,
> -                         agaw_to_level(hd->arch.vtd.agaw));
>      hd->arch.vtd.pgd_maddr =3D 0;
> -    spin_unlock(&hd->arch.mapping_lock);
>  }
>=20
>  static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn=
,
> @@ -2669,23 +2629,28 @@ static void vtd_dump_p2m_table(struct domain *d)
>  static int __init intel_iommu_quarantine_init(struct domain *d)
>  {
>      struct domain_iommu *hd =3D dom_iommu(d);
> +    struct page_info *pg;
>      struct dma_pte *parent;
>      unsigned int agaw =3D width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
>      unsigned int level =3D agaw_to_level(agaw);
> -    int rc;
> +    int rc =3D 0;
> +
> +    spin_lock(&hd->arch.mapping_lock);
>=20
>      if ( hd->arch.vtd.pgd_maddr )
>      {
>          ASSERT_UNREACHABLE();
> -        return 0;
> +        goto out;
>      }
>=20
> -    spin_lock(&hd->arch.mapping_lock);
> +    pg =3D iommu_alloc_pgtable(d);
>=20
> -    hd->arch.vtd.pgd_maddr =3D alloc_pgtable_maddr(1, hd->node);
> -    if ( !hd->arch.vtd.pgd_maddr )
> +    rc =3D -ENOMEM;
> +    if ( !pg )
>          goto out;
>=20
> +    hd->arch.vtd.pgd_maddr =3D page_to_maddr(pg);
> +
>      parent =3D map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
>      while ( level )
>      {
> @@ -2697,10 +2662,12 @@ static int __init intel_iommu_quarantine_init(str=
uct domain *d)
>           * page table pages, and the resulting allocations are always
>           * zeroed.
>           */
> -        maddr =3D alloc_pgtable_maddr(1, hd->node);
> -        if ( !maddr )
> -            break;
> +        pg =3D iommu_alloc_pgtable(d);
> +
> +        if ( !pg )
> +            goto out;
>=20
> +        maddr =3D page_to_maddr(pg);
>          for ( offset =3D 0; offset < PTE_NUM; offset++ )
>          {
>              struct dma_pte *pte =3D &parent[offset];
> @@ -2716,13 +2683,16 @@ static int __init intel_iommu_quarantine_init(str=
uct domain *d)
>      }
>      unmap_vtd_domain_page(parent);
>=20
> +    rc =3D 0;
> +
>   out:
>      spin_unlock(&hd->arch.mapping_lock);
>=20
> -    rc =3D iommu_flush_iotlb_all(d);
> +    if ( !rc )
> +        rc =3D iommu_flush_iotlb_all(d);
>=20
> -    /* Pages leaked in failure case */
> -    return level ? -ENOMEM : rc;
> +    /* Pages may be leaked in failure case */
> +    return rc;
>  }
>=20
>  static struct iommu_ops __initdata vtd_ops =3D {
> @@ -2737,7 +2707,6 @@ static struct iommu_ops __initdata vtd_ops =3D {
>      .map_page =3D intel_iommu_map_page,
>      .unmap_page =3D intel_iommu_unmap_page,
>      .lookup_page =3D intel_iommu_lookup_page,
> -    .free_page_table =3D iommu_free_page_table,
>      .reassign_device =3D reassign_device_ownership,
>      .get_device_group_id =3D intel_iommu_group_id,
>      .enable_x2apic =3D intel_iommu_enable_eim,
> --
> 2.20.1


