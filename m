Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93526D49C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 09:25:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIoIP-0006PT-QN; Thu, 17 Sep 2020 07:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6zL=C2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kIoIP-0006O3-0D
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 07:25:33 +0000
X-Inumbo-ID: 6b6fa5ba-c7a9-44b7-9f24-526fa7e5fb2c
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b6fa5ba-c7a9-44b7-9f24-526fa7e5fb2c;
 Thu, 17 Sep 2020 07:25:27 +0000 (UTC)
IronPort-SDR: VCCrLId/V8ecps/R7u6mBvHNvcyYdP3rX6KzpuZ411H8q7Qtq3TUwqjxZ/uc9xoOqTpzmzIul1
 KXfE9nPs8RBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="158947350"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="158947350"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 00:25:26 -0700
IronPort-SDR: R/c3iLMgiWH4wOwrBl/Yb/Sj64TS9Is6UPNpzxqBt/30GsK+dKogx+eQT+/99cVvPhuCW91TtJ
 mfgF7bLuHxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="346529931"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 17 Sep 2020 00:25:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 00:25:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Sep 2020 00:25:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 17 Sep 2020 00:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yt+rBBa8UU2oEHwIAITyCBI3nY7BSXkHEnSwCH2El5OcwoD5vc+n8358k9O0pe22cEaH24NsQDRZvz8b4jPptl0zyNXC0VvAPVmKV2/456NcQ7iH6bGrbB1t97NpXJz5UNJSDaZj6/8EV7g0OdFPHxTH20yoIQcNBgivuvph+aaoyw10vEI9HbQX9O3GXoYNUdUXBPRIJgENvNlm+d/75Gkkz7Ac8VTxkdJdSOapzfWeyU0JvOYrY8ULo4LIywYl1N/WD6v+VYzDlLm0qWN4t7gLragG9VflLuBkd6wdgdAhei9FI9OaxX0sC8scjmYq9WGMgnohMA4HftLq1ira/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygGapaNUd/0Qz+wF/JjTvhQArAoZwnuTDFDRKJTU9CU=;
 b=nsAEuowdYvMrcO8sbPmHyrMFWKLj0fcGddJjAlrvagkEXnZj9WjbM36tFNiCURQyOo346FBqs6kF8kgrqrxpZrI327ZDRBaQzggX9aMsDXoku0L24VXDuodp8302IIcbxR650qaFwrm6GiQdd8DT7DR3UJRoU9RAhxrjDKoGt81UGZfSxJCk6PJkiKcSdUW4HoH1vr7qB9gmj22cZ1DBQLO4vbEuK8tTrRA/k8ppZSwOulOYsJA1Mptnpt0KXdtpYmAFMrdzJf2LZL6XbrUbuGugDE2I3dk7MdTAGpHb5xLnMr5Bv99fub4dzlOaBxm9zpDJ2ALiXAQXLAFDfgIJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygGapaNUd/0Qz+wF/JjTvhQArAoZwnuTDFDRKJTU9CU=;
 b=OIvZkn2RhScbV2/cb5EqhJcQ2rWQBmikqOdZr+p/TLvc4CphcmNTX2GOqcouLrQyABBqPSEYoUY1lelfBbMDeR6INr5KfZx/JTKk5gzS7ChWZKbjRFPpmMW9ggBmhysoBobXYzpdMQ7nNo8UHSdD3EUWzXTgUF9/apeK26O5tgA=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 07:25:22 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 07:25:22 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v9 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
Thread-Topic: [PATCH v9 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
Thread-Index: AQHWizptM8oxqRPnl0GKwkemBzGBRqlsY/zQ
Date: Thu, 17 Sep 2020 07:25:22 +0000
Message-ID: <MWHPR11MB164546C6382641D229D873FE8C3E0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-9-paul@xen.org>
In-Reply-To: <20200915082936.23663-9-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: 27b2b2df-07a5-444b-ddc0-08d85adad6b9
x-ms-traffictypediagnostic: MWHPR11MB2047:
x-microsoft-antispam-prvs: <MWHPR11MB20477CD82EAC265A1C65BAA28C3E0@MWHPR11MB2047.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opAJfqYbo48ztvs5NzPeWYaxLa8tT2S9gSUnjmj7Du7GRCHmed3mECvBli5MycRb2BHOnxnQqJU4nXVBO0yRAyKra4JhjyIS8xYBDRr7iQ/ulaW1lUypiU18p1eYfVJzPcJpP3HgGUkMkLjtyjRGtAoKC5LFiKZ4O3o451xd2ogIBxb7zu0tA7YR2mDQQfD+LJa7c3vMcQF0X7Ifl08gPDHwUbJCCN3jHow8EnVIQwSVFOLZPYkKDF96mxBBUEWf+UJy6Is3qFRnWWRjGpYoe6/JAk3DEIVE9u2snHiI1A7M42yb0+/wspjux4rHezLuhA8Y42X+4gsmJs3x9UE66A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(83380400001)(54906003)(33656002)(110136005)(8936002)(7696005)(316002)(4326008)(26005)(71200400001)(186003)(76116006)(66946007)(6506007)(478600001)(8676002)(55016002)(2906002)(52536014)(9686003)(5660300002)(66556008)(66446008)(66476007)(86362001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: GPU4HudBQuXPJ9wg2fA00d9qI+H+JlQSMJZyALyZoukRkimYXz4P+ll+MtPpHmd8b45zV9JfXQ4tJ9JG1phIN42PpZLnfVAfp/LyLUpCclAypo4dBmgKWmcL4XaW1YXmni0lcZzzXfHw8DTwbuRu28LasTCjjtxjGbzBk4+dHdDDiaZrVExFkqz+e1YOumrAvGJ1/lxMtMDkpa1yhIkxc/M8SQUOariKh9nd0h4bP3y3USXYJ+YxXGhaySeVe/LcnRnpj2c3iSh0jFa3CedOuhi5/6alRFz+ZRhy9SwdWEiq1vKlXutQTKP7xxgUl7ZRdjd7KKZl9cAEWtQLSytx2WqZ+B83lAl1vM70ThKdU4YAnjsHb7tBA/HiqJWQm8FAUr22AQ5bU5trV+MPyzhe5RhIjIWkYy1ZME1lz2RO6IxZKXA6htRJ983weUd0c56ImlT+1AbSAe9FBHmvAUbn5qNT5CkJlGZ2BfgEM/O0WYN5exAss+HVtH5mkNclQL45HzyTFfL3Dv8/8h4OVIfhRwSBWtYmvT4ZLY6NxIW7OdDVqbU+lDSG3jNLcU4VfotPuUJtmCGWIe94s43BK48CKC8USwcPtci88fA2KYbbL0BI7/3/cCwRQdMzw3Ow57Zqc5Dqz4pL8lu4UW+4wTZ3Kg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b2b2df-07a5-444b-ddc0-08d85adad6b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 07:25:22.3491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcl9yzRxbP/hgvsfzW1Q15Q4hE8A1uIzJkByeWGeFr2lWG8ka6Nyvx3Qs+yjTe8H9cpFC1WK/vlvaMS2Y1bysQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2047
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
> Sent: Tuesday, September 15, 2020 4:30 PM
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> It's confusing and not consistent with the terminology introduced with 'd=
fn_t'.
> Just call them IOMMU page tables.
>=20
> Also remove a pointless check of the 'acpi_drhd_units' list in
> vtd_dump_page_table_level(). If the list is empty then IOMMU mappings
> would
> not have been enabled for the domain in the first place.
>=20
> NOTE: All calls to printk() have also been removed from
>       iommu_dump_page_tables(); the implementation specific code is now
>       responsible for all output.
>       The check for the global 'iommu_enabled' has also been replaced by =
an
>       ASSERT since iommu_dump_page_tables() is not registered as a key
> handler
>       unless IOMMU mappings are enabled.
>       Error messages are now prefixed with the name of the function.
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v6:
>  - Cosmetic adjustment
>  - Drop use of __func__
>=20
> v5:
>  - Make sure domain id is in the output
>  - Use VTDPREFIX in output for consistency
>=20
> v2:
>  - Moved all output into implementation specific code
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 +++++++-------
>  xen/drivers/passthrough/iommu.c             | 21 ++++-----------
>  xen/drivers/passthrough/vtd/iommu.c         | 30 ++++++++++++---------
>  xen/include/xen/iommu.h                     |  2 +-
>  4 files changed, 33 insertions(+), 40 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 3390c22cf3..5fe9dc849d 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8
> devfn)
>=20
>  #include <asm/io_apic.h>
>=20
> -static void amd_dump_p2m_table_level(struct page_info* pg, int level,
> -                                     paddr_t gpa, int indent)
> +static void amd_dump_page_table_level(struct page_info *pg, int level,
> +                                      paddr_t gpa, int indent)
>  {
>      paddr_t address;
>      struct amd_iommu_pte *table_vaddr;
> @@ -504,7 +504,7 @@ static void amd_dump_p2m_table_level(struct
> page_info* pg, int level,
>      table_vaddr =3D __map_domain_page(pg);
>      if ( table_vaddr =3D=3D NULL )
>      {
> -        printk("Failed to map IOMMU domain page %"PRIpaddr"\n",
> +        printk("AMD IOMMU failed to map domain page %"PRIpaddr"\n",
>                  page_to_maddr(pg));
>          return;
>      }
> @@ -521,7 +521,7 @@ static void amd_dump_p2m_table_level(struct
> page_info* pg, int level,
>=20
>          if ( pde->next_level && (pde->next_level !=3D (level - 1)) )
>          {
> -            printk("IOMMU p2m table error. next_level =3D %d, expected %=
d\n",
> +            printk("AMD IOMMU table error. next_level =3D %d, expected %=
d\n",
>                     pde->next_level, level - 1);
>=20
>              continue;
> @@ -529,7 +529,7 @@ static void amd_dump_p2m_table_level(struct
> page_info* pg, int level,
>=20
>          address =3D gpa + amd_offset_level_address(index, level);
>          if ( pde->next_level >=3D 1 )
> -            amd_dump_p2m_table_level(
> +            amd_dump_page_table_level(
>                  mfn_to_page(_mfn(pde->mfn)), pde->next_level,
>                  address, indent + 1);
>          else
> @@ -542,16 +542,16 @@ static void amd_dump_p2m_table_level(struct
> page_info* pg, int level,
>      unmap_domain_page(table_vaddr);
>  }
>=20
> -static void amd_dump_p2m_table(struct domain *d)
> +static void amd_dump_page_tables(struct domain *d)
>  {
>      const struct domain_iommu *hd =3D dom_iommu(d);
>=20
>      if ( !hd->arch.amd.root_table )
>          return;
>=20
> -    printk("p2m table has %u levels\n", hd->arch.amd.paging_mode);
> -    amd_dump_p2m_table_level(hd->arch.amd.root_table,
> -                             hd->arch.amd.paging_mode, 0, 0);
> +    printk("AMD IOMMU %pd table has %u levels\n", d, hd-
> >arch.amd.paging_mode);
> +    amd_dump_page_table_level(hd->arch.amd.root_table,
> +                              hd->arch.amd.paging_mode, 0, 0);
>  }
>=20
>  static const struct iommu_ops __initconstrel _iommu_ops =3D {
> @@ -578,7 +578,7 @@ static const struct iommu_ops __initconstrel
> _iommu_ops =3D {
>      .suspend =3D amd_iommu_suspend,
>      .resume =3D amd_iommu_resume,
>      .crash_shutdown =3D amd_iommu_crash_shutdown,
> -    .dump_p2m_table =3D amd_dump_p2m_table,
> +    .dump_page_tables =3D amd_dump_page_tables,
>  };
>=20
>  static const struct iommu_init_ops __initconstrel _iommu_init_ops =3D {
> diff --git a/xen/drivers/passthrough/iommu.c
> b/xen/drivers/passthrough/iommu.c
> index 90748062e5..8fae77b593 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -22,7 +22,7 @@
>  #include <xen/keyhandler.h>
>  #include <xsm/xsm.h>
>=20
> -static void iommu_dump_p2m_table(unsigned char key);
> +static void iommu_dump_page_tables(unsigned char key);
>=20
>  unsigned int __read_mostly iommu_dev_iotlb_timeout =3D 1000;
>  integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
> @@ -212,7 +212,7 @@ void __hwdom_init iommu_hwdom_init(struct
> domain *d)
>      if ( !is_iommu_enabled(d) )
>          return;
>=20
> -    register_keyhandler('o', &iommu_dump_p2m_table, "dump iommu p2m
> table", 0);
> +    register_keyhandler('o', &iommu_dump_page_tables, "dump iommu
> page tables", 0);
>=20
>      hd->platform_ops->hwdom_init(d);
>  }
> @@ -535,16 +535,12 @@ bool_t iommu_has_feature(struct domain *d,
> enum iommu_feature feature)
>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)-
> >features);
>  }
>=20
> -static void iommu_dump_p2m_table(unsigned char key)
> +static void iommu_dump_page_tables(unsigned char key)
>  {
>      struct domain *d;
>      const struct iommu_ops *ops;
>=20
> -    if ( !iommu_enabled )
> -    {
> -        printk("IOMMU not enabled!\n");
> -        return;
> -    }
> +    ASSERT(iommu_enabled);
>=20
>      ops =3D iommu_get_ops();
>=20
> @@ -555,14 +551,7 @@ static void iommu_dump_p2m_table(unsigned char
> key)
>          if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
>              continue;
>=20
> -        if ( iommu_use_hap_pt(d) )
> -        {
> -            printk("\ndomain%d IOMMU p2m table shared with MMU: \n", d-
> >domain_id);
> -            continue;
> -        }
> -
> -        printk("\ndomain%d IOMMU p2m table: \n", d->domain_id);
> -        ops->dump_p2m_table(d);
> +        ops->dump_page_tables(d);
>      }
>=20
>      rcu_read_unlock(&domlist_read_lock);
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index 58d4550a4c..faf258e699 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2582,8 +2582,8 @@ static void vtd_resume(void)
>      }
>  }
>=20
> -static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_=
t
> gpa,
> -                                     int indent)
> +static void vtd_dump_page_table_level(paddr_t pt_maddr, int level,
> paddr_t gpa,
> +                                      int indent)
>  {
>      paddr_t address;
>      int i;
> @@ -2596,7 +2596,8 @@ static void vtd_dump_p2m_table_level(paddr_t
> pt_maddr, int level, paddr_t gpa,
>      pt_vaddr =3D map_vtd_domain_page(pt_maddr);
>      if ( pt_vaddr =3D=3D NULL )
>      {
> -        printk("Failed to map VT-D domain page %"PRIpaddr"\n", pt_maddr)=
;
> +        printk(VTDPREFIX " failed to map domain page %"PRIpaddr"\n",
> +               pt_maddr);
>          return;
>      }
>=20
> @@ -2612,8 +2613,8 @@ static void vtd_dump_p2m_table_level(paddr_t
> pt_maddr, int level, paddr_t gpa,
>=20
>          address =3D gpa + offset_level_address(i, level);
>          if ( next_level >=3D 1 )
> -            vtd_dump_p2m_table_level(dma_pte_addr(*pte), next_level,
> -                                     address, indent + 1);
> +            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
> +                                      address, indent + 1);
>          else
>              printk("%*sdfn: %08lx mfn: %08lx\n",
>                     indent, "",
> @@ -2624,17 +2625,20 @@ static void vtd_dump_p2m_table_level(paddr_t
> pt_maddr, int level, paddr_t gpa,
>      unmap_vtd_domain_page(pt_vaddr);
>  }
>=20
> -static void vtd_dump_p2m_table(struct domain *d)
> +static void vtd_dump_page_tables(struct domain *d)
>  {
> -    const struct domain_iommu *hd;
> +    const struct domain_iommu *hd =3D dom_iommu(d);
>=20
> -    if ( list_empty(&acpi_drhd_units) )
> +    if ( iommu_use_hap_pt(d) )
> +    {
> +        printk(VTDPREFIX " %pd sharing EPT table\n", d);
>          return;
> +    }
>=20
> -    hd =3D dom_iommu(d);
> -    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw)=
);
> -    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
> -                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
> +    printk(VTDPREFIX" %pd table has %d levels\n", d,
> +           agaw_to_level(hd->arch.vtd.agaw));
> +    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
> +                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
>  }
>=20
>  static int __init intel_iommu_quarantine_init(struct domain *d)
> @@ -2734,7 +2738,7 @@ static struct iommu_ops __initdata vtd_ops =3D {
>      .iotlb_flush =3D iommu_flush_iotlb_pages,
>      .iotlb_flush_all =3D iommu_flush_iotlb_all,
>      .get_reserved_device_memory =3D
> intel_iommu_get_reserved_device_memory,
> -    .dump_p2m_table =3D vtd_dump_p2m_table,
> +    .dump_page_tables =3D vtd_dump_page_tables,
>  };
>=20
>  const struct iommu_init_ops __initconstrel intel_iommu_init_ops =3D {
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 373145266f..7a539522b1 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -276,7 +276,7 @@ struct iommu_ops {
>                                      unsigned int flush_flags);
>      int __must_check (*iotlb_flush_all)(struct domain *d);
>      int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
> -    void (*dump_p2m_table)(struct domain *d);
> +    void (*dump_page_tables)(struct domain *d);
>=20
>  #ifdef CONFIG_HAS_DEVICE_TREE
>      /*
> --
> 2.20.1


