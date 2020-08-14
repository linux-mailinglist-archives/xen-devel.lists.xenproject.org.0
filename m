Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60498244554
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:13:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6TtJ-0006JW-5V; Fri, 14 Aug 2020 07:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6TtG-0006JR-Sq
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:12:38 +0000
X-Inumbo-ID: db804dc8-d0bd-476e-b6b8-a210f2210ecb
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db804dc8-d0bd-476e-b6b8-a210f2210ecb;
 Fri, 14 Aug 2020 07:12:37 +0000 (UTC)
IronPort-SDR: ojNRNCF/8zY3/UpV93oDeN57UZr1ZmUVUZeHHWPJMBs5pWXpnseY3uxQIbYvFldo6Wi6glq/Ys
 OuS0sN3RgfBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153596526"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="153596526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 00:12:36 -0700
IronPort-SDR: jeRqMlvidZ+wVcaQnLd+O4BIu5uGQc4FE0VW05bDQFi92qqwk0N/094bJTE0auTm+/2bhPolas
 y3W7s8K+D1zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="495647871"
Received: from orsmsx601-2.jf.intel.com (HELO ORSMSX601.amr.corp.intel.com)
 ([10.22.229.81])
 by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2020 00:12:36 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 00:12:35 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 00:12:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 14 Aug 2020 00:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpXQZF8YWY3Pr0Zqje1SeUdcaasBlyhd+YHgIDJShpFoZh/xQTwENqIP3R5DY+RN+akdwkJ1Mc3f/1LwzZZKY4+TY/54BtwdvVSNZTljrhd/XFITEOmpUeXSWTgFinjhviPxMs559R3b82FTVk6mNwrIvkumXTU0T2UJiESHihxLkb8gSqk4BWcqx27mbglFEGNxAKSzX5yn6RFCzVuCTXp3E4QZIkVHUsXOt3BaudEApCGvTg31cLhA9SvChgE+BcR5OAXmqGIjGEclLauUuRecL5WQGayU+5ygHRfIkBDLQ3fuuovhQsoVE3xRelX/GViKsXnn8KI8dToIdmXuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNMkuykuYJuCUg7ekjDQGthBY+qdZDAjH6ErXYv+XKo=;
 b=FW7p+VnmKRTnHi79WlVs8Lx25gxJEq5qxoaAiWjjg3mnaqVWZ64LIVnI26NAiSvZE8SCmWjskiUbZ9jBvvNinzrxM1oi4cYGBAPSipVHHkgUzNoWOYjZg1C3R6XS8/t0ttPQcZDS2onT6QlH1Cuho71brzu50hMUZXMLi8kV75ykJAgkfA4OkhcG8OT58i70yxjd/3Fe1iy74W3AzZ30LBDswWRdt4Q/kB/NFbybgF1herlTRXlx5SvVzz9GW9Su56GMO2+EmHp/N6mUBW90lnfu7GaN4BFUUTuAdAUfclTBQJO40BlwXc4S63xC0UZZpa9YkjEGMcprC7P1eZXCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNMkuykuYJuCUg7ekjDQGthBY+qdZDAjH6ErXYv+XKo=;
 b=HXFIar+XHraG5nfVpR3Wi4KeCahceP5o/ppPvbBTQR0wSmepWXtAvLwTXdYy6ylov3xV02GMQ46GElm93N237U5mo2xKnghtcvVZkaNqdrzF6s6NeAJqkb6x1zZi9DLYlNpCfD5Ka5EaxwJXaw0U2cZSglxNq0BWLMrlyxca44k=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB2014.namprd11.prod.outlook.com (2603:10b6:300:25::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 14 Aug
 2020 07:12:33 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 07:12:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v4 11/14] iommu: stop calling IOMMU page tables 'p2m
 tables'
Thread-Topic: [PATCH v4 11/14] iommu: stop calling IOMMU page tables 'p2m
 tables'
Thread-Index: AQHWamkCpBJen0EbnUuYFkPkvFd3f6k3P57g
Date: Fri, 14 Aug 2020 07:12:33 +0000
Message-ID: <MWHPR11MB1645BA92A83C3FF41FF98F098C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-12-paul@xen.org>
In-Reply-To: <20200804134209.8717-12-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: 443c978a-8c59-4c50-67cf-08d840216a98
x-ms-traffictypediagnostic: MWHPR11MB2014:
x-microsoft-antispam-prvs: <MWHPR11MB2014970C890BD9A28C5A53908C400@MWHPR11MB2014.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uRhsR5Cu5XSOiWTp2H8ikBORR2cmBsC8tBCJnPJFENSRRODpZmngsma7wP6IycWmoZjMc8WyWuEKtN3zZK0tyE0v+oDzRnZgAqIRzO0AJeFXdyLZ3s3rh/vYi+6uFBbHLS8KPk7x70MIt3dUV0uqoagbBHQpQnnUQwmeOtBPG1sdVjMlyTU8KBNg67YfJxNDnihxR2crCZYpEiNgrZsMnITQoXTmLj63qZIw6w0BA7m0lt1NgUi6Wl+25vvVokHqThHUqXNw7Sy0e6Q7jTs2w2uNfWT3BxCrJYZkS0hpdW+zWrvoTC1S7um+VdkwkwsMR3bcGCLUu5FfjrSqONe6vA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(76116006)(9686003)(186003)(83380400001)(52536014)(26005)(71200400001)(5660300002)(33656002)(478600001)(4326008)(66556008)(66446008)(64756008)(66946007)(86362001)(66476007)(316002)(8676002)(54906003)(7696005)(6506007)(8936002)(2906002)(55016002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zoQlEKgS/MrTnCkHPK3oN3vIrFaw4Ja0bSsp6OfeU06BGyjizCGWLaFvfzqMG2O4CiLo1xZoF+N2pz6uvsyzdNsVod5Lz7UJPwowgdJ4MUGgBRbYvyqTWnrWBwMB+IgW8zjV7nY46W6/h+S1Pg7IjLnct9ArUaE2Mm2v4RQsPtOr2NPbrjXXW420V9P1AZlPo5E7ecQbbuSJbqq7zBYFZymNbZXFgcbY1utrs9US8WG7DSa7zP9E911axL+cdqbzTUbOKboZi+FDPU/pgD2OFsboMyfodPehcFAIJ1QdPn0QqAWzegaQJLTyUpeIYMtKi4109skz3MuwpSFljpGwl3UnlJrBwzCN74GhgPIgPtb7Ww4oZIEdlvqZ2rLzGb211Wh3ia9q6cbxllXmoBmnmsBcPT7j2+920DidrfYq9dQV9IFlWWNw/BbAuDg+9puuwniYvt5qM9fahNlrRM7207GalzMROlBNyOdO1m/6akmAvisNg5/bciR8zEO0EdL4JC0A2ilVmQtPM84NXmTBrOdbWBsbr7UzAIcLn2ean/8zR2iwrBHovySotlB5XAeRYI9tmCP8K9bxiFVsbT00JsTfqq7tQqtfX/2n7GnKyqab7N47WZ89tTDip+e6V0bmeLwK3eDfKMvukP0mioQZcg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443c978a-8c59-4c50-67cf-08d840216a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 07:12:33.8556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75QXstZXnR/kkHtcrbBu21Y2coXWTuD3W+5ycVkLyXdu2oNDk3i4rfqk4cDrdSL3445Wl1OdeWrYQGWdsmRslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2014
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
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

with Jan's comments addressed:
	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v2:
>  - Moved all output into implementation specific code
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 16 ++++++-------
>  xen/drivers/passthrough/iommu.c             | 21 ++++-------------
>  xen/drivers/passthrough/vtd/iommu.c         | 26 +++++++++++----------
>  xen/include/xen/iommu.h                     |  2 +-
>  4 files changed, 28 insertions(+), 37 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 3390c22cf3..be578607b1 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8
> devfn)
>=20
>  #include <asm/io_apic.h>
>=20
> -static void amd_dump_p2m_table_level(struct page_info* pg, int level,
> -                                     paddr_t gpa, int indent)
> +static void amd_dump_page_table_level(struct page_info* pg, int level,
> +                                      paddr_t gpa, int indent)
>  {
>      paddr_t address;
>      struct amd_iommu_pte *table_vaddr;
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
> +    printk("AMD IOMMU table has %u levels\n", hd-
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
> index 7464f10d1c..0f468379e1 100644
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
> @@ -533,16 +533,12 @@ bool_t iommu_has_feature(struct domain *d,
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
> @@ -553,14 +549,7 @@ static void iommu_dump_p2m_table(unsigned char
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
> index a532d9e88c..f8da4fe0e7 100644
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
> @@ -2612,8 +2612,8 @@ static void vtd_dump_p2m_table_level(paddr_t
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
> @@ -2624,17 +2624,19 @@ static void vtd_dump_p2m_table_level(paddr_t
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
> +        printk("VT-D sharing EPT table\n");
>          return;
> +    }
>=20
> -    hd =3D dom_iommu(d);
> -    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw)=
);
> -    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
> -                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
> +    printk("VT-D table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw=
));
> +    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
> +                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
>  }
>=20
>  static int __init intel_iommu_quarantine_init(struct domain *d)
> @@ -2734,7 +2736,7 @@ static struct iommu_ops __initdata vtd_ops =3D {
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
> index 1f25d2082f..23e884f54b 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -277,7 +277,7 @@ struct iommu_ops {
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


