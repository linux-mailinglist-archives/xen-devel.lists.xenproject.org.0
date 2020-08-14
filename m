Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963F52445C6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6U0Q-0006qd-SO; Fri, 14 Aug 2020 07:20:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6U0P-0006jx-53
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:20:01 +0000
X-Inumbo-ID: 03518491-b7c6-4432-a40f-55c72576b86e
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03518491-b7c6-4432-a40f-55c72576b86e;
 Fri, 14 Aug 2020 07:20:00 +0000 (UTC)
IronPort-SDR: K1hKtVVKu5tuUKU5HeVYXZcm9Tg13lqejpORlRwe1mUsYZtbhSVLANT0889x69nD+fi84OxHUl
 /i37bY+bW5oA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="133890242"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="133890242"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 00:19:59 -0700
IronPort-SDR: XnP9OMQdw4H2ev1hn4Ie//yAtpxKSM/4AUP1YGZfq7mMqnIsdV/gheYL68iLVznYTjeY+XUYVS
 fIS6yE5RtVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="496108080"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2020 00:19:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 00:19:59 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 00:19:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 14 Aug 2020 00:19:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRSOFj6F9QAC9isRdT3rzWq+wrHFjFINK13uhHx3tAJBfsP7yH9WPJZOV0nnFgD475eak+w6OmSNl0fvhLod+GiSOO3eN5LM1IgebtgYB37BMe/L5qyARhtLQ4+hooDSmTONKx9iPEL8SEv1saycgh/I6oZRcYXt2vV2BpGCZVdl6K23u0KddZXdbd3idlwDck6e4QR/SQqNSKGrfpxsXueCP4+y4AgUXGXK+Fokt5hOgyOlLfrGoLzOdrQJo5V5hI4g0DvFuFX5lZ2kiZF60OGVVQPwNjU/dszjTfOCqrsmNkEG8CTw9ShXTnGptWAoBt3ky83xIc+ddZX4fuSSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TFie8T6maWM/8Ntf+B1fa+kkt0j/wSJ9nEYxScUraE=;
 b=mItKm7vyzDCs/JK0XWxTEsl+p3OEywq7BBSOmRG9Oe6AtgDcaZHhAxyqUG/J3H3PmLDdjOUCHtcwCrI3xclOI2Cj8iRMWtXMWOpPNlNmezdChqtmzW3uv8NoziKYovtFGLXiKAlosnX7LAHJixTf0hN17baRlPSQ2Z7MFBDXZAnoZKU9f2xuIlXaHI0YjIBh2UxTZcTOEx+TDkQIkhEAE8mkC7akqVdGPHJVdEDg/s51u46JQiYiIJtZA3lgfIuFBYJEKibBtoQtw5vi2RxaXL9529P/clgCVR29Wy2cZhbQKDLlUreiAoGldlQa56tMlZ4ekAgnqVph7PszWCCIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TFie8T6maWM/8Ntf+B1fa+kkt0j/wSJ9nEYxScUraE=;
 b=lO06kzWxzlETdAWz5V3wd7AEdUiUFX2/0Zl/K0ojUDlZBbRAAHE0YGNs94Iy7pRYNZh3QJVC76ZJ2Tm6tDh+3OYbAPEvpQTd4KkNmYeEpQSTJwnViba1ZuZWOv/jaIhS7eN8pF1aFmmWvfsjo5O40bByaJ9fsOBMG9lTUESuqO8=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2334.namprd11.prod.outlook.com (2603:10b6:300:72::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 07:19:57 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 07:19:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>
Subject: RE: [PATCH v4 13/14] vtd: use a bit field for context_entry
Thread-Topic: [PATCH v4 13/14] vtd: use a bit field for context_entry
Thread-Index: AQHWamj3a5K+FUdPGEGRatZ9HRDFF6k3QYnQ
Date: Fri, 14 Aug 2020 07:19:57 +0000
Message-ID: <MWHPR11MB1645B9B5CAE80D39E416CDBA8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-14-paul@xen.org>
In-Reply-To: <20200804134209.8717-14-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: fa2f227a-9fd2-4e7d-b8b5-08d8402272f9
x-ms-traffictypediagnostic: MWHPR1101MB2334:
x-microsoft-antispam-prvs: <MWHPR1101MB23345A848406D47CD0268DA58C400@MWHPR1101MB2334.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5XjNMH9QkZqwvMPk2xKoBftVCjxKpAgIY/F+2NInw/x2h9W7xm6UZCrgt/saEOnnka0ayscCTCv7M3deluXHU7Aaej7LzaAQfzL/5oWZ9fdIUfsJoZ0W8YpOhSUyfKs1U57GuW4wQnLtz/RZAjoPl7Int8HFVo4OqSHOIlksvtJFy1Wji+NqDt96PsMikKkXi/Fcx9x0wfFwC0R2/AeSZ1uWLyGtfzFZ2Ibszs99xjYnVrGgCKVtmantD5+wtS7vT++wnCGOGlSEEXkUKyMYjKFazKL4oTBra5zl7irEJTsYtMzz5PqSyhJ72GBkpWtfDo9ZudWIOhLmzYKzrHRHOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(186003)(64756008)(2906002)(83380400001)(7696005)(26005)(6506007)(66556008)(66476007)(66446008)(86362001)(5660300002)(76116006)(66946007)(8936002)(71200400001)(33656002)(110136005)(316002)(52536014)(4326008)(478600001)(8676002)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8M6NayudIRn8Em1G0rzwwZpxEtLfeJijJUAgDwwiWBSay6qTpXcgQzPhj42vmHr06yMvWcT7Ut/0dpaVIQTt0aX8ubQbTpwA+eP+5RAraS2keyq6O/++QQKmPg1IeGQYCEQJrM05/yyLZnq5hz1+at67jlcgYKW/stk6Rjd0LNrHZBMp4UWiSps7z0/bxBIR4z9PrQ+8clH3AE7CSh6PGXFU41PbCJ241AD22SHSBGO57j/neKzoUyvwXpk+dcaU2KoPALRoI26zEKK3lUg2+CVreRGNvN7E01ZZiwRTJtMaSmEtLd6c4Wj2v4FJT9TLa8BsZblXgEaAW2REXQbOuKYzuncaA/O3ey1hvCd7Xn4eiX3+r/MvYhLoR+2u0wBp2nUnVdULlJWP2mSUga8ysPKgbevgzH0PZJTGFHjQwPUHQLoMJEPOMfYTfRhUCOh5sLmAB3QBXBPeKrnWWpXo/SHDVdNllOSCRI0HiinanlMxmWcLM0QE2qm7ldi4/Wxcb/zMAAUNl5gSN6pwcul2lCZ4XCt3a+oA6z7O2hX/zRS3dLR/CIPQJ8F1P+5hSyQT3lJSG7pRanzSDWae8wzsRHjPN3rZOKNHTlv8zYQz4p3JYG2BG+NIkhc0/bsockfrg58T68IW7TXXr48ucjQbuQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2f227a-9fd2-4e7d-b8b5-08d8402272f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 07:19:57.4359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfHf64WCRQgiBbfsRcnC3Xi9p3FQlvjw+3FMcRiR4EMiPUHxZB/2j1lU08dEFwCZrpXb5xlMxp2XgpCsrAexZA==
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
> This removes the need for much shifting, masking and several magic
> numbers.
> On the whole it makes the code quite a bit more readable.

similarly, I feel the readability is worse such as slptp. We may use bitfel=
d
to define the structure, but the function name may be kept with current
way...

Thanks
kevin

>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v4:
>  - New in v4
> ---
>  xen/drivers/passthrough/vtd/iommu.c   |  8 ++--
>  xen/drivers/passthrough/vtd/iommu.h   | 65 +++++++++++++++++----------
>  xen/drivers/passthrough/vtd/utils.c   |  6 +--
>  xen/drivers/passthrough/vtd/x86/ats.c |  2 +-
>  4 files changed, 49 insertions(+), 32 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index 76025f6ccd..766d33058e 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -86,8 +86,6 @@ static int domain_iommu_domid(struct domain *d,
>      return -1;
>  }
>=20
> -#define DID_FIELD_WIDTH 16
> -#define DID_HIGH_OFFSET 8
>  static int context_set_domain_id(struct context_entry *context,
>                                   struct domain *d,
>                                   struct vtd_iommu *iommu)
> @@ -121,7 +119,7 @@ static int context_set_domain_id(struct
> context_entry *context,
>      }
>=20
>      set_bit(i, iommu->domid_bitmap);
> -    context->hi |=3D (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFS=
ET;
> +    context_set_did(*context, i);
>      return 0;
>  }
>=20
> @@ -135,7 +133,7 @@ static int context_get_domain_id(struct
> context_entry *context,
>      {
>          nr_dom =3D cap_ndoms(iommu->cap);
>=20
> -        dom_index =3D context_domain_id(*context);
> +        dom_index =3D context_did(*context);
>=20
>          if ( dom_index < nr_dom && iommu->domid_map )
>              domid =3D iommu->domid_map[dom_index];
> @@ -1396,7 +1394,7 @@ int domain_context_mapping_one(
>              return -ENOMEM;
>          }
>=20
> -        context_set_address_root(*context, pgd_maddr);
> +        context_set_slptp(*context, pgd_maddr);
>          if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
>              context_set_translation_type(*context, CONTEXT_TT_DEV_IOTLB)=
;
>          else
> diff --git a/xen/drivers/passthrough/vtd/iommu.h
> b/xen/drivers/passthrough/vtd/iommu.h
> index 031ac5f66c..509d13918a 100644
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -199,6 +199,7 @@ struct root_entry {
>          };
>      };
>  };
> +#define ROOT_ENTRY_NR (PAGE_SIZE_4K / sizeof(struct root_entry))
>=20
>  #define root_present(r) (r).p
>  #define set_root_present(r) do { (r).p =3D 1; } while (0)
> @@ -208,35 +209,53 @@ struct root_entry {
>      do { (r).ctp =3D ((val) >> PAGE_SHIFT_4K); } while (0)
>=20
>  struct context_entry {
> -    u64 lo;
> -    u64 hi;
> +    union {
> +        __uint128_t val;
> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            uint64_t p:1;
> +            uint64_t fpd:1;
> +            uint64_t tt:2;
> +            uint64_t reserved0:8;
> +            uint64_t slptp:52;
> +
> +            /* 64 - 127 */
> +            uint64_t aw:3;
> +            uint64_t ignored:4;
> +            uint64_t reserved1:1;
> +            uint64_t did:16;
> +            uint64_t reserved2:40;
> +        };
> +    };
>  };
> -#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
> -#define context_present(c) ((c).lo & 1)
> -#define context_fault_disable(c) (((c).lo >> 1) & 1)
> -#define context_translation_type(c) (((c).lo >> 2) & 3)
> -#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
> -#define context_address_width(c) ((c).hi &  7)
> -#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
> -
> -#define context_set_present(c) do {(c).lo |=3D 1;} while(0)
> -#define context_clear_present(c) do {(c).lo &=3D ~1;} while(0)
> -#define context_set_fault_enable(c) \
> -    do {(c).lo &=3D (((u64)-1) << 2) | 1;} while(0)
> -
> -#define context_set_translation_type(c, val) do { \
> -        (c).lo &=3D (((u64)-1) << 4) | 3; \
> -        (c).lo |=3D (val & 3) << 2; \
> -    } while(0)
> +
> +#define context_present(c) (c).p
> +#define context_set_present(c) do { (c).p =3D 1; } while (0)
> +#define context_clear_present(c) do { (c).p =3D 0; } while (0)
> +
> +#define context_fault_disable(c) (c).fpd
> +#define context_set_fault_enable(c) do { (c).fpd =3D 1; } while (0)
> +
> +#define context_translation_type(c) (c).tt
> +#define context_set_translation_type(c, val) do { (c).tt =3D val; } whil=
e (0)
>  #define CONTEXT_TT_MULTI_LEVEL 0
>  #define CONTEXT_TT_DEV_IOTLB   1
>  #define CONTEXT_TT_PASS_THRU   2
>=20
> -#define context_set_address_root(c, val) \
> -    do {(c).lo &=3D 0xfff; (c).lo |=3D (val) & PAGE_MASK_4K ;} while(0)
> +#define context_slptp(c) ((c).slptp << PAGE_SHIFT_4K)
> +#define context_set_slptp(c, val) \
> +    do { (c).slptp =3D (val) >> PAGE_SHIFT_4K; } while (0)
> +
> +#define context_address_width(c) (c).aw
>  #define context_set_address_width(c, val) \
> -    do {(c).hi &=3D 0xfffffff8; (c).hi |=3D (val) & 7;} while(0)
> -#define context_clear_entry(c) do {(c).lo =3D 0; (c).hi =3D 0;} while(0)
> +    do { (c).aw =3D (val); } while (0)
> +
> +#define context_did(c) (c).did
> +#define context_set_did(c, val) \
> +    do { (c).did =3D (val); } while (0)
> +
> +#define context_clear_entry(c) do { (c).val =3D 0; } while (0)
>=20
>  /* page table handling */
>  #define LEVEL_STRIDE       (9)
> diff --git a/xen/drivers/passthrough/vtd/utils.c
> b/xen/drivers/passthrough/vtd/utils.c
> index 4c85242894..eae0c43269 100644
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -129,9 +129,8 @@ void print_vtd_entries(struct vtd_iommu *iommu, int
> bus, int devfn, u64 gmfn)
>          return;
>      }
>=20
> -    val =3D ctxt_entry[devfn].lo;
> -    printk("    context[%02x] =3D %"PRIx64"_%"PRIx64"\n",
> -           devfn, ctxt_entry[devfn].hi, val);
> +    printk("    context[%02x] =3D %"PRIx64"_%"PRIx64"\n", devfn,
> +           ctxt_entry[devfn].hi, ctxt_entry[devfn].lo);
>      if ( !context_present(ctxt_entry[devfn]) )
>      {
>          unmap_vtd_domain_page(ctxt_entry);
> @@ -140,6 +139,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int
> bus, int devfn, u64 gmfn)
>      }
>=20
>      level =3D agaw_to_level(context_address_width(ctxt_entry[devfn]));
> +    val =3D context_slptp(ctxt_entry[devfn]);
>      unmap_vtd_domain_page(ctxt_entry);
>      if ( level !=3D VTD_PAGE_TABLE_LEVEL_3 &&
>           level !=3D VTD_PAGE_TABLE_LEVEL_4)
> diff --git a/xen/drivers/passthrough/vtd/x86/ats.c
> b/xen/drivers/passthrough/vtd/x86/ats.c
> index 8369415dcc..a7bbd3198a 100644
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -92,7 +92,7 @@ static bool device_in_domain(const struct vtd_iommu
> *iommu,
>=20
>      context_entries =3D map_vtd_domain_page(root_ctp(*root_entry));
>      context_entry =3D &context_entries[pdev->devfn];
> -    if ( context_domain_id(*context_entry) !=3D did )
> +    if ( context_did(*context_entry) !=3D did )
>          goto out;
>=20
>      tt =3D context_translation_type(*context_entry);
> --
> 2.20.1


