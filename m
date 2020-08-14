Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F3244510
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 08:42:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6TPW-0003KH-80; Fri, 14 Aug 2020 06:41:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6TPU-0003KC-U9
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 06:41:52 +0000
X-Inumbo-ID: 9cb04b10-136e-45c4-8b39-ad6a678493bb
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cb04b10-136e-45c4-8b39-ad6a678493bb;
 Fri, 14 Aug 2020 06:41:50 +0000 (UTC)
IronPort-SDR: SP0mOtqMko3KAwGcbL65q6VLckWWE+KIfxine0a0N3giYKXhwA12RW1gX4xje4x398lBiuKFQA
 RiC2+dfvb18A==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239196206"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="239196206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 23:41:48 -0700
IronPort-SDR: o8FjgIenACIX+Hr4C5SAQWYOtEuEjQcJpHEd6m5odePtlEhts8MG+cPwXbd5u9gEIVmcSJp0Tm
 mtzsl2WXXYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="325634667"
Received: from unknown (HELO fmsmsx604.amr.corp.intel.com) ([10.18.84.214])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 23:41:48 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 23:41:47 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 23:41:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Aug 2020 23:41:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 13 Aug 2020 23:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEGyjRwy+VXLNE7rUlaPJEQyLSZgbQJYDqNj2fbX4Ta7FdyArHxV0Ay+FG9T5jhIKbRwDn9EGBFcls//s+nzkF+f6Mzn2fShgp8PuAq9TyZmVR9cdD5EnRA/Gxx3dP6oEHMZuQHRpGkD37xVSVhfOWHuikXLd66RBphXbkpTCJtJQw7UqHj0DeRgxgaReJ+vXKzJf53LlXXnOfBBTo0gtnSvralQZk2Y9/yGcohBNuVnQzEl+tfjwWC7JOTl9nKvp2V69aU+hXQcD/D4dZqFgcH7X7SxFLzYp8vqGHJkyibwb+PGovsNoZ116moYEbnX7u2JsnSNSzEYWJAHbgz0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgSnu0/dylO4EoEKJWALXEUC6XZorYbEzd6UN+xkTvc=;
 b=DMXx3bktamX7seoj29/jZeQZRYBA537skwsJQg4XMupf3quhRgyK2SHLIgGZVrgSSec3ilFhShd97ncgdiS82p4FSoKHLVmUF27mikB936FrcDYAM+K0h4xE7Q2tj/KcMwUkOVTguHTKP6Rh9/5/O+urTYcW3ck049rxf0KrkZnk8G9ZBSkVXXlcROmrQDS41pVN9/MZjFt8UO2tS6FX8bf4Kfr3eqvVqN2+fNWlqFkzQnByZxVZL363wKOp1oa7cAjOGavDII1SSW4nEGR++AwVEXJs3Itj4uNqBlC860pWA2ifWVc+fwFc2hpJW4dx3I/gPV12tCEf8QAyoaTX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgSnu0/dylO4EoEKJWALXEUC6XZorYbEzd6UN+xkTvc=;
 b=UDn8o8HRs8sMzzntMtSY/18QipjcD/Ykr0BQfV6aB7HGRAQXoJUymPuj+xV8BUoKmUrhLWEUMuXs+ZM37ewD7ZSmIAdEexcezbCLNKZf/7RRkMsSdTjXT8hneY8Fppvzxf7bUldlmvdhJ8isTJIgcibCXBbSBaMRGj/5QDplcxw=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1758.namprd11.prod.outlook.com (2603:10b6:300:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 06:41:45 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 06:41:45 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v4 03/14] x86/iommu: convert VT-d code to use new page
 table allocator
Thread-Topic: [PATCH v4 03/14] x86/iommu: convert VT-d code to use new page
 table allocator
Thread-Index: AQHWamUacjhbO8W3fkGXDLamh0t/Jqk3NaCQ
Date: Fri, 14 Aug 2020 06:41:44 +0000
Message-ID: <MWHPR11MB164570CF853F0E873BFDBB6C8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-4-paul@xen.org>
In-Reply-To: <20200804134209.8717-4-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b098198-e6b9-4630-0818-08d8401d1c90
x-ms-traffictypediagnostic: MWHPR11MB1758:
x-microsoft-antispam-prvs: <MWHPR11MB1758203852EE8E2A17C4C5FB8C400@MWHPR11MB1758.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(186003)(52536014)(7696005)(26005)(8676002)(6506007)(8936002)(2906002)(55016002)(9686003)(5660300002)(86362001)(478600001)(66946007)(83380400001)(4326008)(76116006)(316002)(110136005)(66476007)(54906003)(71200400001)(33656002)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b098198-e6b9-4630-0818-08d8401d1c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 06:41:44.9066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KCj1bSNA8KYX+MjIUxHpNTSSvWW2vq5o46YhuesbuBSpcvRVegC4jgiMDxglMkXqFlaEI2HaGok/3AwmFok/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1758
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> From: Paul Durrant <paul@xen.org>
> Sent: Tuesday, August 4, 2020 9:42 PM
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> This patch converts the VT-d code to use the new IOMMU page table
> allocator
> function. This allows all the free-ing code to be removed (since it is no=
w
> handled by the general x86 code) which reduces TLB and cache thrashing as
> well
> as shortening the code.
>=20
> The scope of the mapping_lock in intel_iommu_quarantine_init() has also
> been
> increased slightly; it should have always covered accesses to
> 'arch.vtd.pgd_maddr'.
>=20
> NOTE: The common IOMMU needs a slight modification to avoid scheduling
> the
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
> diff --git a/xen/drivers/passthrough/iommu.c
> b/xen/drivers/passthrough/iommu.c
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
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index 94e0455a4d..607e8b5e65 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -265,10 +265,15 @@ static u64 addr_to_dma_page_maddr(struct
> domain *domain, u64 addr, int alloc)
>=20
>      addr &=3D (((u64)1) << addr_width) - 1;
>      ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> -    if ( !hd->arch.vtd.pgd_maddr &&
> -         (!alloc ||
> -          ((hd->arch.vtd.pgd_maddr =3D alloc_pgtable_maddr(1, hd->node))=
 =3D=3D
> 0)) )
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
>      parent =3D (struct dma_pte *)map_vtd_domain_page(hd-
> >arch.vtd.pgd_maddr);
>      while ( level > 1 )
> @@ -279,13 +284,16 @@ static u64 addr_to_dma_page_maddr(struct
> domain *domain, u64 addr, int alloc)
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
> @@ -675,45 +683,6 @@ static void dma_pte_clear_one(struct domain
> *domain, uint64_t addr,
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

I didn't see sync_cache in the new iommu_free_pgtables. Is it intended
(i.e. original flush is meaningless) or overlooked?

Thanks
Kevin

> -    }
> -
> -    unmap_vtd_domain_page(pt_vaddr);
> -    free_pgtable_maddr(pt_maddr);
> -}
> -
>  static int iommu_set_root_entry(struct vtd_iommu *iommu)
>  {
>      u32 sts;
> @@ -1748,16 +1717,7 @@ static void iommu_domain_teardown(struct
> domain *d)
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
> @@ -2669,23 +2629,28 @@ static void vtd_dump_p2m_table(struct domain
> *d)
>  static int __init intel_iommu_quarantine_init(struct domain *d)
>  {
>      struct domain_iommu *hd =3D dom_iommu(d);
> +    struct page_info *pg;
>      struct dma_pte *parent;
>      unsigned int agaw =3D
> width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
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
> @@ -2697,10 +2662,12 @@ static int __init
> intel_iommu_quarantine_init(struct domain *d)
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
> @@ -2716,13 +2683,16 @@ static int __init
> intel_iommu_quarantine_init(struct domain *d)
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


