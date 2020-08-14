Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13EF2445C1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Txk-0006Xk-1M; Fri, 14 Aug 2020 07:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6Txj-0006Xb-7B
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:17:15 +0000
X-Inumbo-ID: 39b0c82f-8a15-48cf-bfe9-cfa5fc922f5e
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39b0c82f-8a15-48cf-bfe9-cfa5fc922f5e;
 Fri, 14 Aug 2020 07:17:14 +0000 (UTC)
IronPort-SDR: pbqEZN0tDXV+G88Ocnq672c1MW+jyM9DfnpOYAX0C1K1krfL2tQqB48nikztBh468qH/qVWoNd
 48pNVKj7Vz9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="155479181"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="155479181"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 00:17:13 -0700
IronPort-SDR: wvkHIo/oQ/hPtn4LzWxwhhqfoIBfFabBaK1QD4Z5d0k7p1r5nuTPKF47bLarsrFaRWxiRnGcPd
 0aL1/bHlI8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="333341296"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2020 00:17:13 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 00:17:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 00:17:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 14 Aug 2020 00:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdtK/gL2BkwbpKlEy+fZKDJb3r7L5Hz5687mjeadiD8fxEF4R3cWdXz6eYZdFCRYhRJ5TY7mKzLDDX6MTJZPKKuhFHuz1OmwzabAioKMs1aHNFXPV8xmW/54M4Z37H10ZNmgzDEBiYhRSoTKSVNQUbpCakcaSI0lS9PrkgcIYRu/tzw/jxjzv39GeQnSEEKMeS3ocPb/do50CaBu9CutT6GcPIHBeZIgNx6smXTFKFBymaXM3l6PJh7AaxarH/0Zelne1Tlzaqe2e7c7813XIbmWNY7RmueTBCepfyHqVdJueyRcyfMYtbI+9lOZ1B6sEaoLdfyEVZNpu4eTGZpEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX4rz3r1OAsoCIeRSIVgKPZcSE1LjMJinuZ6nrKYfmw=;
 b=lnISnLsETdefjpZiRXdrzXTQzhFQXCwpfnu6uiXWWb8bzz1x/VrXNJUgFOaEOxjArFXFXwYx/wlrNDWS8cXXTJ/gx0oIRvik/NScB/Qej38T3aLxdC0n2B9vu4A2bPj9M3k0OOBJmuD7gr4LIRUf6Zloru0GHPNzNouRYE2DmcZhmcSR3m1I9TzG5wPPsd+prKE5Sshl3rSKRZa+5hs8Yawae6kPIptn2ppq0nBfLervpkeshg2PgdO6zK4KRQs6wsSCX0lor2LD8bvBakRgYOA6M1ejMR8+5x40VLfwfFRrOfE8YGHkQXr5U91siz3yXNLYmRa3qfRdoQg930o1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX4rz3r1OAsoCIeRSIVgKPZcSE1LjMJinuZ6nrKYfmw=;
 b=VmrMQCBlh/UW/Q/SQOg1j4+O5yThTkJSqcrmELzmlw9/QNni7vOVI7J1vM32rpQRlPJoEDD3tD0MuDawmb3oTne/I4uRnCSPCEXfDIW5lyGL9jYCuFS8waCdbRN3gHFdBIn24e3FP7w70rVCLj7+nhJhXFvHUnCTtug/MvLjtrs=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2334.namprd11.prod.outlook.com (2603:10b6:300:72::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 07:17:07 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 07:17:07 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>
Subject: RE: [PATCH v4 12/14] vtd: use a bit field for root_entry
Thread-Topic: [PATCH v4 12/14] vtd: use a bit field for root_entry
Thread-Index: AQHWamjzhRLKlZVg5Ui+clgvToosDak3QGhw
Date: Fri, 14 Aug 2020 07:17:07 +0000
Message-ID: <MWHPR11MB1645EE41E12753088BC01AF78C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-13-paul@xen.org>
In-Reply-To: <20200804134209.8717-13-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: 5d05cf59-255e-484e-e0aa-08d840220d77
x-ms-traffictypediagnostic: MWHPR1101MB2334:
x-microsoft-antispam-prvs: <MWHPR1101MB2334A8DED7508F0623C67E178C400@MWHPR1101MB2334.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVh4OHPavR2LADaHaRoatyX2beqB8bPiwOq86f1yFL4W/l71nXp6adyiJYT98fu1GzW85qhat0o2t7e1FKRg/fvj4+M09fzcgTCrkjzgsejhg1nRFX0Lc/N5ekWKeWfRNP6T8VHOhuW8nicCf67P56+CadQmyPbXpWEn965HNmo7KmOCgy2uRCVwd8o/JJ/ffx6c+oQTzamHP71psJHNvdCFTdwFSSy9fuanehhphN8rOSGJJHgPzitBS7p/+RIbc9VM5gVgese3ViTANic9xqvC/OyBNSN+T5WuF7KDMUZJRhgrGpf6R1ckuBbNFraKYmyRgzmGe0LHLPPqBeCmjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(186003)(64756008)(2906002)(83380400001)(7696005)(26005)(6506007)(66556008)(66476007)(66446008)(86362001)(5660300002)(76116006)(66946007)(8936002)(71200400001)(33656002)(110136005)(316002)(52536014)(4326008)(478600001)(8676002)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rLdMtJNMrZa5ulyhG+PbqoYXZs9FoeB50BdKrp4MlQyIdKswhv2Lr7CwnRCClpTWoF1Soj3Tjf2BkLoBoVWUEpIHk4O6Jopalirx4NzEafk8hEEJmgcXkOuwO9Uk4m8X9IM6UF/gaaxf6Sf7956lQOo1OzsJwET1TdTTVS5lOPvZXk3JE/3akCdFM9vJkguEzVbJGxaeQV2VoCZaJ652FQfN5f5boOrdgznvghi824mBFdVwYG65uoIkr9eahvrxA/CjzcPp9velIj0SPFl3R5OKaq+ivYXCRnuhU7yTodiYZUlgQ7wqZf+CNxaF1yf+ZZTvIXGwbqzp1Jfpr3HmOlAUAPQC0NZ6H5euqnvlqJOpZcJe5YISw2QjM7f9dNm9beaPkZRWAHq160zQE1q63JLQsY6AFM81Ps8gpCI/ZwGLQM77/9W/+AOsH0pSfjgDjr1orV80Mht68xItDePDbwWRus4/aWS5y0ozLu5vljApTD1GAx7s2WZuEspr1fLNLcaFuAakRIcYyZIxOy+Pa9jz/rpC2iCGXtPKfroCKDG77Khdzv6i+KQk7dtkrFzEY6w5ItDYV3SSf5AjeJRTsEpakHv2p/tNz9EoGr1LB1u6wTUiscDwbHVC8lFQZkPb2hO4505ND0ZHepfTGDlZPg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d05cf59-255e-484e-e0aa-08d840220d77
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 07:17:07.0961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLSWU42TGZgb4fZeH9SUn3/2ESQIgYMjEQx+QMC0sBLUj6eeFz58ze1/uZTEf0RZobiHn0CI+8LQkU5p/dTA6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2334
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
> This makes the code a little easier to read and also makes it more consis=
tent
> with iremap_entry.

I feel the original readability is slightly better, as ctp is less obvious =
than
set_root_value, get_context_addr, etc.

Thanks
Kevin

>=20
> Also take the opportunity to tidy up the implementation of
> device_in_domain().
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v4:
>  - New in v4
> ---
>  xen/drivers/passthrough/vtd/iommu.c   |  4 ++--
>  xen/drivers/passthrough/vtd/iommu.h   | 33 ++++++++++++++++-----------
>  xen/drivers/passthrough/vtd/utils.c   |  4 ++--
>  xen/drivers/passthrough/vtd/x86/ats.c | 27 ++++++++++++----------
>  4 files changed, 39 insertions(+), 29 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index f8da4fe0e7..76025f6ccd 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -245,11 +245,11 @@ static u64 bus_to_context_maddr(struct
> vtd_iommu *iommu, u8 bus)
>              unmap_vtd_domain_page(root_entries);
>              return 0;
>          }
> -        set_root_value(*root, maddr);
> +        set_root_ctp(*root, maddr);
>          set_root_present(*root);
>          iommu_sync_cache(root, sizeof(struct root_entry));
>      }
> -    maddr =3D (u64) get_context_addr(*root);
> +    maddr =3D root_ctp(*root);
>      unmap_vtd_domain_page(root_entries);
>      return maddr;
>  }
> diff --git a/xen/drivers/passthrough/vtd/iommu.h
> b/xen/drivers/passthrough/vtd/iommu.h
> index 216791b3d6..031ac5f66c 100644
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -184,21 +184,28 @@
>  #define dma_frcd_source_id(c) (c & 0xffff)
>  #define dma_frcd_page_addr(d) (d & (((u64)-1) << 12)) /* low 64 bit */
>=20
> -/*
> - * 0: Present
> - * 1-11: Reserved
> - * 12-63: Context Ptr (12 - (haw-1))
> - * 64-127: Reserved
> - */
>  struct root_entry {
> -    u64    val;
> -    u64    rsvd1;
> +    union {
> +        __uint128_t val;
> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            uint64_t p:1;
> +            uint64_t reserved0:11;
> +            uint64_t ctp:52;
> +
> +            /* 64 - 127 */
> +            uint64_t reserved1;
> +        };
> +    };
>  };
> -#define root_present(root)    ((root).val & 1)
> -#define set_root_present(root) do {(root).val |=3D 1;} while(0)
> -#define get_context_addr(root) ((root).val & PAGE_MASK_4K)
> -#define set_root_value(root, value) \
> -    do {(root).val |=3D ((value) & PAGE_MASK_4K);} while(0)
> +
> +#define root_present(r) (r).p
> +#define set_root_present(r) do { (r).p =3D 1; } while (0)
> +
> +#define root_ctp(r) ((r).ctp << PAGE_SHIFT_4K)
> +#define set_root_ctp(r, val) \
> +    do { (r).ctp =3D ((val) >> PAGE_SHIFT_4K); } while (0)
>=20
>  struct context_entry {
>      u64 lo;
> diff --git a/xen/drivers/passthrough/vtd/utils.c
> b/xen/drivers/passthrough/vtd/utils.c
> index 4febcf506d..4c85242894 100644
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -112,7 +112,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int
> bus, int devfn, u64 gmfn)
>          return;
>      }
>=20
> -    printk("    root_entry[%02x] =3D %"PRIx64"\n", bus, root_entry[bus].=
val);
> +    printk("    root_entry[%02x] =3D %"PRIx64"\n", bus, root_entry[bus].=
lo);
>      if ( !root_present(root_entry[bus]) )
>      {
>          unmap_vtd_domain_page(root_entry);
> @@ -120,7 +120,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int
> bus, int devfn, u64 gmfn)
>          return;
>      }
>=20
> -    val =3D root_entry[bus].val;
> +    val =3D root_ctp(root_entry[bus]);
>      unmap_vtd_domain_page(root_entry);
>      ctxt_entry =3D map_vtd_domain_page(val);
>      if ( ctxt_entry =3D=3D NULL )
> diff --git a/xen/drivers/passthrough/vtd/x86/ats.c
> b/xen/drivers/passthrough/vtd/x86/ats.c
> index 04d702b1d6..8369415dcc 100644
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -74,8 +74,8 @@ int ats_device(const struct pci_dev *pdev, const struct
> acpi_drhd_unit *drhd)
>  static bool device_in_domain(const struct vtd_iommu *iommu,
>                               const struct pci_dev *pdev, uint16_t did)
>  {
> -    struct root_entry *root_entry;
> -    struct context_entry *ctxt_entry =3D NULL;
> +    struct root_entry *root_entry, *root_entries =3D NULL;
> +    struct context_entry *context_entry, *context_entries =3D NULL;
>      unsigned int tt;
>      bool found =3D false;
>=20
> @@ -85,25 +85,28 @@ static bool device_in_domain(const struct
> vtd_iommu *iommu,
>          return false;
>      }
>=20
> -    root_entry =3D map_vtd_domain_page(iommu->root_maddr);
> -    if ( !root_present(root_entry[pdev->bus]) )
> +    root_entries =3D (struct root_entry *)map_vtd_domain_page(iommu-
> >root_maddr);
> +    root_entry =3D &root_entries[pdev->bus];
> +    if ( !root_present(*root_entry) )
>          goto out;
>=20
> -    ctxt_entry =3D map_vtd_domain_page(root_entry[pdev->bus].val);
> -    if ( context_domain_id(ctxt_entry[pdev->devfn]) !=3D did )
> +    context_entries =3D map_vtd_domain_page(root_ctp(*root_entry));
> +    context_entry =3D &context_entries[pdev->devfn];
> +    if ( context_domain_id(*context_entry) !=3D did )
>          goto out;
>=20
> -    tt =3D context_translation_type(ctxt_entry[pdev->devfn]);
> +    tt =3D context_translation_type(*context_entry);
>      if ( tt !=3D CONTEXT_TT_DEV_IOTLB )
>          goto out;
>=20
>      found =3D true;
> -out:
> -    if ( root_entry )
> -        unmap_vtd_domain_page(root_entry);
>=20
> -    if ( ctxt_entry )
> -        unmap_vtd_domain_page(ctxt_entry);
> + out:
> +    if ( root_entries )
> +        unmap_vtd_domain_page(root_entries);
> +
> +    if ( context_entries )
> +        unmap_vtd_domain_page(context_entries);
>=20
>      return found;
>  }
> --
> 2.20.1


