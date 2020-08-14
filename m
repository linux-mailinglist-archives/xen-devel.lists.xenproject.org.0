Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D592445C3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Tzl-0006gd-IG; Fri, 14 Aug 2020 07:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QP56=BY=amazon.co.uk=prvs=4884f5e05=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k6Tzk-0006gX-E8
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:19:20 +0000
X-Inumbo-ID: e5e08814-f9d0-4c37-a1ea-447411e9c518
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5e08814-f9d0-4c37-a1ea-447411e9c518;
 Fri, 14 Aug 2020 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1597389559; x=1628925559;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=SXG+pgYD47CNZ+ZYTXPrXLXIukaKp2R7DxLuNB644kI=;
 b=Ni8qrMVND99uN5HaM/1n8Hrvg7q6lDd0SoKaFg95Dv1nriD3Tzi7c3Qe
 3y+8iQ8auuqLRT51EyiZLZsMx0SMJVp5KOzXLdFmFagfXlb4UYoSF/wrj
 vld/xgKwYPOKEVNV2wcFBy1mvdmnxJqUdFIQK1O0+Xesai+dKipgtryQV I=;
X-IronPort-AV: E=Sophos;i="5.76,311,1592870400"; d="scan'208";a="67925010"
Subject: RE: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
Thread-Topic: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 14 Aug 2020 07:19:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6E65EA2518; Fri, 14 Aug 2020 07:19:16 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 14 Aug 2020 07:19:15 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 14 Aug 2020 07:19:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 14 Aug 2020 07:19:14 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Tian, Kevin" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHWamVUYpnePGqDjU6QqOHETpTIJqk3OeewgAAHLYA=
Date: Fri, 14 Aug 2020 07:19:14 +0000
Message-ID: <90778935e1334f838e3d41d4171ac8ff@EX13D32EUC003.ant.amazon.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-7-paul@xen.org>
 <MWHPR11MB16450DC48C30E2A4770B91BC8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB16450DC48C30E2A4770B91BC8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
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

> -----Original Message-----
> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: 14 August 2020 07:53
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Durrant, Paul <pdurrant@amazon.co.uk>; Jan Beulich <jbeulich@suse.com=
>
> Subject: RE: [EXTERNAL] [PATCH v4 06/14] iommu: flush I/O TLB if iommu_ma=
p() or iommu_unmap() fail
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open
> attachments unless you can confirm the sender and know the content is saf=
e.
>=20
>=20
>=20
> > From: Paul Durrant
> > Sent: Tuesday, August 4, 2020 9:42 PM
> >
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This patch adds a full I/O TLB flush to the error paths of iommu_map() =
and
> > iommu_unmap().
> >
> > Without this change callers need constructs such as:
> >
> > rc =3D iommu_map/unmap(...)
> > err =3D iommu_flush(...)
> > if ( !rc )
> >   rc =3D err;
> >
> > With this change, it can be simplified to:
> >
> > rc =3D iommu_map/unmap(...)
> > if ( !rc )
> >   rc =3D iommu_flush(...)
> >
> > because, if the map or unmap fails the flush will be unnecessary. This =
saves
>=20
> this statement is different from change in iommu_map...
>=20
> > a stack variable and generally makes the call sites tidier.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> >
> > v2:
> >  - New in v2
> > ---
> >  xen/drivers/passthrough/iommu.c | 28 ++++++++++++----------------
> >  1 file changed, 12 insertions(+), 16 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/iommu.c
> > b/xen/drivers/passthrough/iommu.c
> > index 660dc5deb2..e2c0193a09 100644
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t
> > mfn,
> >          break;
> >      }
> >
> > +    /* Something went wrong so flush everything and clear flush flags =
*/
> > +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> > +        flush_flags =3D 0;
> > +
>=20
> ... earlier you said flush is unnecessary if map fails. But here actually=
 you
> still need to flush everything so it's just sort of moving error-path flu=
sh
> within the map function?

Yes, that's actually what's happening. The language in the comment is ambig=
uous I guess. I'll modify it to say

"because, if the map or unmap fails an explicit flush will be unnecessary."

Hopefully that is clearer.

  Paul

>=20
> Thanks
> Kevin
>=20
> >      return rc;
> >  }
> >
> > @@ -283,14 +287,8 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn,
> > mfn_t mfn,
> >      unsigned int flush_flags =3D 0;
> >      int rc =3D iommu_map(d, dfn, mfn, page_order, flags, &flush_flags)=
;
> >
> > -    if ( !this_cpu(iommu_dont_flush_iotlb) )
> > -    {
> > -        int err =3D iommu_iotlb_flush(d, dfn, (1u << page_order),
> > -                                    flush_flags);
> > -
> > -        if ( !rc )
> > -            rc =3D err;
> > -    }
> > +    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
> > +        rc =3D iommu_iotlb_flush(d, dfn, (1u << page_order), flush_fla=
gs);
> >
> >      return rc;
> >  }
> > @@ -330,6 +328,10 @@ int iommu_unmap(struct domain *d, dfn_t dfn,
> > unsigned int page_order,
> >          }
> >      }
> >
> > +    /* Something went wrong so flush everything and clear flush flags =
*/
> > +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> > +        flush_flags =3D 0;
> > +
> >      return rc;
> >  }
> >
> > @@ -338,14 +340,8 @@ int iommu_legacy_unmap(struct domain *d, dfn_t
> > dfn, unsigned int page_order)
> >      unsigned int flush_flags =3D 0;
> >      int rc =3D iommu_unmap(d, dfn, page_order, &flush_flags);
> >
> > -    if ( !this_cpu(iommu_dont_flush_iotlb) )
> > -    {
> > -        int err =3D iommu_iotlb_flush(d, dfn, (1u << page_order),
> > -                                    flush_flags);
> > -
> > -        if ( !rc )
> > -            rc =3D err;
> > -    }
> > +    if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )
> > +        rc =3D iommu_iotlb_flush(d, dfn, (1u << page_order), flush_fla=
gs);
> >
> >      return rc;
> >  }
> > --
> > 2.20.1
> >


