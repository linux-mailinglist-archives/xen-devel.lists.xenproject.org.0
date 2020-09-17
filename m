Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B626D3BB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 08:34:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kInTs-0001Xp-Fl; Thu, 17 Sep 2020 06:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6zL=C2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kInTr-0001Xk-97
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 06:33:19 +0000
X-Inumbo-ID: 00724bde-de68-4228-bee2-95e32c514162
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00724bde-de68-4228-bee2-95e32c514162;
 Thu, 17 Sep 2020 06:33:17 +0000 (UTC)
IronPort-SDR: VIa1jrsavSpBC8+YIYOME7UFBTre5fyIPjzBcndCSHNno36H2kt7i7o8skb2kAZTP86hcH31Pu
 h2qjWqIrvHVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160565228"
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="160565228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 23:33:15 -0700
IronPort-SDR: WEzSrpz2FKoKYdXPMXJWHn1bkmodqlGLPSvPUSdlt7oB34Grsrb/JO09jvW6cWijSohpWWwnNv
 ns6O6r6rbaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="346513831"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 16 Sep 2020 23:33:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 23:33:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 23:33:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 16 Sep 2020 23:33:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 16 Sep 2020 23:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xfi6I9QVyt4RbtdG/gW/h3Onwu7RR59ySdhKvjajJivq346wU4Rgl7UiequnDNe7XMmjNYIOBNR1CrZ0RFe+kwX+D2WCU9vDvirr1wKgPhIcvFStspu8bRA+gn+LjAQG8t3hjDFdfayp7WLZIaYel6fnjiiy/D5EGv4kY2oDGm77unKc2QcHU/WvwCTVy+T0YZsPkctbk3QNhdgSX3UDfFHS0TndmKw4NyuL/mSNAbowQ/NHFaPD9/ErdoOhzQsg02HJ2hrb1G27SkOAsc4LOr6aNEEt2vT8QiDo8vRGW6uH4m9KDq28mXsHzkysim0iPx0F+IT+pDd7g/VvCxfMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP214uWSdViFaTDZh1LndGfywPhvZ5RCX2OfxRKe2y0=;
 b=G32kTjzw8Bb1xIZe6GRvL2CNzindhUy/JwMhDabL0NKti5ivQJgvKn3WN8iKKJOISJ2Lzf44OoU2zcvHVi2jvhdlaewHZ379Qa+I2BDD5gKZGzdvc7mWvVDZMYDP2VKTiWJkc1nI5yvNghA6+xDBT8Ry3YZkHHuNl4RsWGvdxQb5dWqA3ZklXWbyLUc34Npbfx8tWlSPuNRje2vLH+epVdwSMyJCwEHQZBLbr1f68I7kmni7/+H5qL7MMBMi4yHfgTPVcj3N3vPDOaUC/kXvQoz2MMuO2ZwNF34zLVZg0Kdn0WIYgUrmtLFlAi+w+irFRIk+gJf5pomHP2WYxJgAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP214uWSdViFaTDZh1LndGfywPhvZ5RCX2OfxRKe2y0=;
 b=ZyIDO1mYdgam/HfzRMN2rDeblP+glf9/KGsjQDfJIoR88POeVRtK/lswkgv+B9fHKj+ZU62AInnWd723+WDjWHKnMoXRHiC8Dfehhl0RwhUQk8MWeAXvvxcLMPzt2+yIGDjSpXF4ac5Klf/kvkrndpezrGqDluB4Pq+a+k2YZ8c=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1965.namprd11.prod.outlook.com (2603:10b6:300:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 06:33:13 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 06:33:13 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v9 1/8] x86/iommu: convert VT-d code to use new page table
 allocator
Thread-Topic: [PATCH v9 1/8] x86/iommu: convert VT-d code to use new page
 table allocator
Thread-Index: AQHWizpkrlf3Z+ypyE+ZK5ifkc0CBqlsYg1w
Date: Thu, 17 Sep 2020 06:33:13 +0000
Message-ID: <MWHPR11MB164598FB624400212800CAAA8C3E0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-2-paul@xen.org>
In-Reply-To: <20200915082936.23663-2-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d57ba1b3-044a-46e1-8233-08d85ad38dab
x-ms-traffictypediagnostic: MWHPR11MB1965:
x-microsoft-antispam-prvs: <MWHPR11MB1965D2CEE2D00964862A4E518C3E0@MWHPR11MB1965.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqhCvuslsFcEf5wqY95xm9xrRTL4Gg/MPJpP/mDEcsUFvC7zYiHC8ZaxmNRsIJtX5Uif+hFOSDURKYrD/8efG6qk6RWFotZTAmIRA2ty43vrAj/aKrTHDIJLgP4HHPVrgPAGC1xSl5ovdN7an7JuKt9Yo05hOBR5R42pE0XLqMGsiwGwXSTeEqxG6v0LOUmC3iRGwjKvwh7r1XVvcXKOX4+WmpoT5VNX6TSvf03uHF+ioM0ACuHXMAyTRfZHUrBRYnUAxOjyQXRHR5jN0pAD6/qBVcGETOaXgFgRrlYHwah96ZefKFfLtvLsoAiLDnn6fGd7gOw4itAyoKtJ2VjIH7mDJDJHbHDDgCVzaaJxXRfVYPyl4uXwske3B3Cms04c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(55016002)(86362001)(478600001)(71200400001)(26005)(9686003)(52536014)(110136005)(316002)(4326008)(33656002)(5660300002)(186003)(66446008)(83380400001)(54906003)(8676002)(6506007)(2906002)(64756008)(76116006)(66476007)(8936002)(7696005)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LsteoopHJs46jn+mSUcJk6XK0JJUARDKeaB4X4aUmy1AVqKlERhV33PGdzf8lzrN/VvAxBG88Vcb+9QeHjvlIoCsG9vhAsXmT/gKRvXrFbQOCeXnIuD/QkqnWhPZL09Dp7GJBSXk1YnheBgb2D8W5v3/4GEHkdw/3KKHXWBqAPXU0FUou4v8WEEI6OmqbSTwPSUTnDeOXrUzpCMyT/zshifTJE0IRKhVtrhX0FyNNOVkxnee95N0+F+8nGwYxKwtiyC33XQyjwZrBYAkpw4c6p6Kf39uzcEcqMqgKKCg5B+2hGTPypHAUn5kGvaI1f3tVQ4UBTiYYuaoyFbidEITUJIJBD6AVdWgj9Yo6ENPTWRu4M156z9ZSjcAand7l9/MD1kNjrsqpE1XX+pBZcdnapz+cZoY+QvcE4Icia7tnOjuKuq6HzhYar5xENrTZCoh2oXauvrmfHAT+322CVB6pael0b5YGJ6AR/ddM+GUsDlxdQYGVADGF6T27X4Ru9cNEwHt319usuaA4+XzVW09x3aF/KItFwh7J47BnjMWAvp7OZkT9tWanMdY2i40TA5bFNkJBzs8S/z6+vdbRkIfGAMWhGLxFlshAu5jrxivaqvGUe4tM/skp3yoEIV1PCR+R/mJz5UnQO+IpgbgDCVDdw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57ba1b3-044a-46e1-8233-08d85ad38dab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 06:33:13.2652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TatlBJJPQJXaSNwqd1jpmMMwm4o04XBukWaP1HWWicUcd7dVnPxjOo0VouRXDLp0HZSlMKL3WAt8XEU28skdpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1965
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
> Sent: Tuesday, September 15, 2020 4:29 PM
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

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

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


