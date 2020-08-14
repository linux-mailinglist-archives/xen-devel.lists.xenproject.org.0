Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE56244518
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 08:54:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Tag-0004EX-BM; Fri, 14 Aug 2020 06:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6Tae-0004ES-AQ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 06:53:24 +0000
X-Inumbo-ID: f493d3e5-d839-4ae1-a31c-3b62e181069a
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f493d3e5-d839-4ae1-a31c-3b62e181069a;
 Fri, 14 Aug 2020 06:53:21 +0000 (UTC)
IronPort-SDR: hlvBPD06qQysWA7KuNw2RvOt+BoKWfoHujxIHOjgpcpB2JD9rxywM7kKXJqVYDmDb0icxgzQC0
 Ny0aFg/AJvRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="141991205"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="141991205"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 23:53:20 -0700
IronPort-SDR: s58PoHpXjyri0UiTejB8O15k17+vRihYb+QQohiYI/yl7w2QRzoObJTQlkrUHlDeyCEKisdjhx
 5pa05DLeXdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="277055335"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2020 23:53:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 23:53:19 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 23:53:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 13 Aug 2020 23:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBIbrwe3f6NU8wkQ4y1FSXxm8OOPjA2RO50VR3AgmEgsghPULlyHKSu2U+2QXRgUdLmKfCIppPjzcI9AYUzAeHfByeoWtmEpQaBvPsEbHj9skIMAdUgaxtV4K2CoOE0kVCO8HQfmMOO2hL9UQChqzA1sY4tZF+zVyIInF3zAiaDjUp9m6fA7D262Db3cw3JPFwjewuynVA805gpc8D/J6nBhqgfB+K3vGQvGnvVLEcME1y2rRph71v6ri8b968ot5YUVqon6NiAuSxKvInA/M/djkXEq2ZISAJHlvQVk3HktfzsgJfujIKiuY1kcdncI3oJTfL/hiyUmHNlLqnShQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+ZcEKlkpcOMXAdDc396a0Ya/lxaK1zvCllHDme5R38=;
 b=oPHkmrI67juO8Z54ys55tsM9kV15c0uYUE9RQ1x4t6cosR/rBHIuDpVnFOTv0hMAwNbxHhqjDyuWh78qHyklSxpEQKTfGpksgPsQs57/m4dEHwJ6Lpqn1pA6Zgwi8KKjuxErdZWSFlWTHVBJzvuxiOCEZqROXt8DvSu14GW+R8+6xGtmpePjPtLzme2cNM2Wr3ko+imaSJ11tnlr2eO0OEfBH5GjrqXwmq9zhUAbq8lEqxkqFzsCHSKbzTtn6GXfkbuW4KDF+CD3cwcM7WdXTctxc5Ve9/I85tI6UB79xg0eCEhaAqAL6Y3koAOViSuJnqF5W2SlAd97qMlz9Px3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+ZcEKlkpcOMXAdDc396a0Ya/lxaK1zvCllHDme5R38=;
 b=uSG9h3AGrupvqjZXCQhDQezETD/9ZauegsQWC7yPtQx8VRp0LH/ehuFx61ppqpyVNtMeL12lwAy280Z6aVwvyLaDCQPgxCqWuKzdDXA2XCoXM51oR+GtY+Sxx6NtbkHTCZ18QGzLg+amI6vLXE6Nbp1hu/H30Nf/khwiaHu2Vgc=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2285.namprd11.prod.outlook.com (2603:10b6:301:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 06:53:17 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 06:53:17 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
Thread-Topic: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
Thread-Index: AQHWamVUYpnePGqDjU6QqOHETpTIJqk3Oeew
Date: Fri, 14 Aug 2020 06:53:17 +0000
Message-ID: <MWHPR11MB16450DC48C30E2A4770B91BC8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-7-paul@xen.org>
In-Reply-To: <20200804134209.8717-7-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: 10edbab0-feeb-4d87-bc17-08d8401eb97b
x-ms-traffictypediagnostic: MWHPR1101MB2285:
x-microsoft-antispam-prvs: <MWHPR1101MB22855979C876A4CAAB5CD8F58C400@MWHPR1101MB2285.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gk1RjfgNhhe72GXacPhPnLpH0bEJKCdZ3+/oRqOuSl2BQvA2l+WLO9atoN2Yn4458Zeoy8b8PS4k1W6FE5iLQiEsUuGmlOzGIR/DfnVXex6g+F2JZSysXYyZSxYhpl7zT7uCWCvwIWO6Q+QH2d2Uc5PHinM6SGnUQIhfsfukJPnFs8MlYRMP5RaN1iTLs2AJs4+uAWTpzKE+zurE1HsWfuCu6RAa67L/aktsqLktwS/+KI7sbickefEI+PWaOlX2dfvlxGNO3iDzEggBrgvI2OzXZVO1Jqfo+/w7KO9Te3YEeIAY2p0FceAHrl8b1PmwsAMGhnx0+XDwpmcevtzpEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(2906002)(64756008)(33656002)(71200400001)(478600001)(66446008)(83380400001)(7696005)(66946007)(26005)(86362001)(66556008)(66476007)(110136005)(55016002)(5660300002)(8676002)(4326008)(8936002)(9686003)(52536014)(186003)(316002)(76116006)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pYqC7Y2O/E97aD8mU253RvxXDakLaAepSNzkCA92v/b95AuKw+dGegftp93T6KdTeraPHA5Der9aLQdoy785PRO4QMcxRtR1VCNPLgkaLooGHrt4Bw0OuOITTEipeRR/5vYm2m6BV1jv41ANM8OTCJK8QxotS1DZfLUn3kMyT+7ZAcpEJBB+hFkf8ajqFgQ0dDXUZen7lBntt15f08rpRDtJiCkLXQJVVbq4VEAmcbgS4sqUTgRez+yF4LMuDau+MHE+pjcVx5JbXY5IxexRuYvYadZLKGt+to8VY1IyJ0oaJL4csO4rhrgQQtI52UwtKFqxXrQK6nCuogsLV10fHIBfE2icuLSi9Uwv5BVVQJIBzNzoEzapEdRqYyaqqlhVMD4X1idJPH3PyJgwlSGqMLH91vaprEs0XBzIR2jAcbISwigwkbXtYXp/pHqM4Nz4V4acPk1W9FKAjqOuBT6/5bfxEq8kUUh8qYH+Uz/JEuJ5KI1hEe9A+f5buoDnXT2sLxVDpg+IpCU5iBP9XC7/NeJw8L5puIhtC0tcicqQK+uGZ3bj/BZOoxSjgEObbVLICM0iIcMVE0fWD6AI2Tpf590GOGFQYWTqWYae4LDjGcsXIYpaL68zqGV5i8uO9bBqbRqv1xeXvCus4cwJBRp/QQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10edbab0-feeb-4d87-bc17-08d8401eb97b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 06:53:17.6746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDXAy2V93wZrIu0NI9RDO+lx1B2TZSi4rF6i6iXqD/nLJrRcr2No2ERsdfR7AzlXi7kO9cu4fhZiRwIjOq++lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2285
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

> From: Paul Durrant
> Sent: Tuesday, August 4, 2020 9:42 PM
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> This patch adds a full I/O TLB flush to the error paths of iommu_map() an=
d
> iommu_unmap().
>=20
> Without this change callers need constructs such as:
>=20
> rc =3D iommu_map/unmap(...)
> err =3D iommu_flush(...)
> if ( !rc )
>   rc =3D err;
>=20
> With this change, it can be simplified to:
>=20
> rc =3D iommu_map/unmap(...)
> if ( !rc )
>   rc =3D iommu_flush(...)
>=20
> because, if the map or unmap fails the flush will be unnecessary. This sa=
ves

this statement is different from change in iommu_map...

> a stack variable and generally makes the call sites tidier.
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
>=20
> v2:
>  - New in v2
> ---
>  xen/drivers/passthrough/iommu.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/iommu.c
> b/xen/drivers/passthrough/iommu.c
> index 660dc5deb2..e2c0193a09 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t
> mfn,
>          break;
>      }
>=20
> +    /* Something went wrong so flush everything and clear flush flags */
> +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> +        flush_flags =3D 0;
> +

... earlier you said flush is unnecessary if map fails. But here actually y=
ou
still need to flush everything so it's just sort of moving error-path flush
within the map function?

Thanks
Kevin

>      return rc;
>  }
>=20
> @@ -283,14 +287,8 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn,
> mfn_t mfn,
>      unsigned int flush_flags =3D 0;
>      int rc =3D iommu_map(d, dfn, mfn, page_order, flags, &flush_flags);
>=20
> -    if ( !this_cpu(iommu_dont_flush_iotlb) )
> -    {
> -        int err =3D iommu_iotlb_flush(d, dfn, (1u << page_order),
> -                                    flush_flags);
> -
> -        if ( !rc )
> -            rc =3D err;
> -    }
> +    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
> +        rc =3D iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags=
);
>=20
>      return rc;
>  }
> @@ -330,6 +328,10 @@ int iommu_unmap(struct domain *d, dfn_t dfn,
> unsigned int page_order,
>          }
>      }
>=20
> +    /* Something went wrong so flush everything and clear flush flags */
> +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> +        flush_flags =3D 0;
> +
>      return rc;
>  }
>=20
> @@ -338,14 +340,8 @@ int iommu_legacy_unmap(struct domain *d, dfn_t
> dfn, unsigned int page_order)
>      unsigned int flush_flags =3D 0;
>      int rc =3D iommu_unmap(d, dfn, page_order, &flush_flags);
>=20
> -    if ( !this_cpu(iommu_dont_flush_iotlb) )
> -    {
> -        int err =3D iommu_iotlb_flush(d, dfn, (1u << page_order),
> -                                    flush_flags);
> -
> -        if ( !rc )
> -            rc =3D err;
> -    }
> +    if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )
> +        rc =3D iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags=
);
>=20
>      return rc;
>  }
> --
> 2.20.1
>=20


