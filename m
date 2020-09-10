Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974D264779
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMzF-0000L1-Qn; Thu, 10 Sep 2020 13:51:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGMzD-0000Kv-Sr
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:51:39 +0000
X-Inumbo-ID: 833f5647-8ce1-4046-8421-a2491391c23b
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 833f5647-8ce1-4046-8421-a2491391c23b;
 Thu, 10 Sep 2020 13:51:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m6so6834856wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=iPlZeVlyy8lfsuoVkqBzwjN1QNc6bT84XEESOm7FvHo=;
 b=qDKpu57BCCN2hDvfnxZ6MwkU+2JyhfACDfd2JEEJQUqbiebRHuzYrxSjKMqiGBcdf6
 goO6RS0l7BbJkuJnJp9WrWimP8pTtU03eyBMG6fKQOQHn4wWsIjJp06Ke7q8O7loCds0
 g5HmpsE2jZJRq1xTvkKJQDE6aybVDchDC/8PVGk65hFx724caxbV03g4ad8xVHw8rWhq
 Mvzfj9+yYciK254Dvd2wrFUYng5Cs+bg+MoHvSpknV4P9nUmv+Z7DaLM6HqB0j5IU/S5
 zWiAdd5GWmAzJECd0OdJ0Cn0X6RFRYQAiKVxaeAMGXFDoJ7Um/oa/mIkoa01a8kt/U5+
 1hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=iPlZeVlyy8lfsuoVkqBzwjN1QNc6bT84XEESOm7FvHo=;
 b=ZweA/dSq/0Arib5wEfOpBLDHyew+a5KhmFH8pqhmOuSHyYtSVxTQX5nE565p3ucIvX
 DxO9GPY4WGYeGr4ZSbcpEGMffhiSqN2OoqmoQWEkb6fL0TqG8jTY4jSdNmiRV2x3phXl
 n+UEhq6DRwAn5U9lysv4UglctxEVUOx5/sa9pk9g7hdHmmQ575UBRd9Q0Xycq2k6jHSf
 54LsIIHnuLnaW2ERwDgyTL1WyAzI8/I0RPo5s1Ohfzf7QE33YsMjTO1R3T2WORAQ4yTy
 5sDRFUxkX8MBOXpqpanEvNI1BDWKG2L3bSd5T3i4TkqgFwRp0leWjTbCGe+pQKQOGs1o
 7jyA==
X-Gm-Message-State: AOAM533MV+9dxsAC5NnMuwib5HCvC+7z8SYUWpqpKhsAEDKukv5wErJp
 NQCAaglR1Ml659Aluem1Uu0=
X-Google-Smtp-Source: ABdhPJy4EAbDoQSMdY0CcZHhUlDxUZjbTFTAzkN7TW1srzaPgdI1hqAeq1QqN+5sDmhAZo4tCXATng==
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr8744089wra.383.1599745897946; 
 Thu, 10 Sep 2020 06:51:37 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id s17sm9489301wrr.40.2020.09.10.06.51.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 06:51:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-5-paul@xen.org>
 <369c4c5d-b8e4-77b6-45aa-572d531d1699@suse.com>
In-Reply-To: <369c4c5d-b8e4-77b6-45aa-572d531d1699@suse.com>
Subject: RE: [PATCH v5 4/8] iommu: make map and unmap take a page count,
 similar to flush
Date: Thu, 10 Sep 2020 14:51:36 +0100
Message-ID: <002e01d68779$80bef880$823ce980$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhwG7ATr0KfpJW6ur2MqQg9p50hwHpuLeWAYZoIEmpL+3WUA==
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 10 September 2020 13:48
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun =
Nakajima <jun.nakajima@intel.com>;
> Kevin Tian <kevin.tian@intel.com>
> Subject: Re: [PATCH v5 4/8] iommu: make map and unmap take a page =
count, similar to flush
>=20
> On 07.09.2020 09:40, Paul Durrant wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -2966,9 +2966,11 @@ static int _get_page_type(struct page_info =
*page, unsigned long type,
> >              mfn_t mfn =3D page_to_mfn(page);
> >
> >              if ( (x & PGT_type_mask) =3D=3D PGT_writable_page )
> > -                rc =3D iommu_legacy_unmap(d, _dfn(mfn_x(mfn)), =
PAGE_ORDER_4K);
> > +                rc =3D iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
> > +                                        1ul << PAGE_ORDER_4K);
> >              else
> > -                rc =3D iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn, =
PAGE_ORDER_4K,
> > +                rc =3D iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
> > +                                      1ul << PAGE_ORDER_4K,
> >                                        IOMMUF_readable | =
IOMMUF_writable);
> >
> >              if ( unlikely(rc) )
>=20
> A few hundred lines up from here there is
>=20
>             int rc2 =3D iommu_legacy_unmap(d, _dfn(mfn), =
PAGE_ORDER_4K);
>=20
> in cleanup_page_mappings().

Oh yes. Fixed.

>=20
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -1225,7 +1225,7 @@ map_grant_ref(
> >              kind =3D IOMMUF_readable;
> >          else
> >              kind =3D 0;
> > -        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, =
kind) )
> > +        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, =
1ul, kind) )
> >          {
> >              double_gt_unlock(lgt, rgt);
> >              rc =3D GNTST_general_error;
> > @@ -1479,9 +1479,9 @@ unmap_common(
> >
> >          kind =3D mapkind(lgt, rd, op->mfn);
> >          if ( !kind )
> > -            err =3D iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), =
0);
> > +            err =3D iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), =
1ul);
> >          else if ( !(kind & MAPKIND_WRITE) )
> > -            err =3D iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), =
op->mfn, 0,
> > +            err =3D iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), =
op->mfn, 1ul,
>=20
> For all three of these, I guess either 1ul << PAGE_ORDER_4K or simply =
1?
> (Given that the code didn't use PAGE_ORDER_4K so far, I'd slightly
> prefer the latter. I'd be fine making the change while committing, but
> it looks like v6 is going to be needed anyway.)

Ok. Changed.

>=20
> > --- a/xen/drivers/passthrough/amd/iommu_map.c
> > +++ b/xen/drivers/passthrough/amd/iommu_map.c
> > @@ -362,7 +362,7 @@ static unsigned long flush_count(unsigned long =
dfn, unsigned int page_count,
> >  }
> >
> >  int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
> > -                                unsigned int page_count,
> > +                                unsigned long page_count,
>=20
> This ought to be accompanied by a similar change to its flush_count()
> helper.
>=20
> > @@ -632,7 +632,7 @@ static int __must_check iommu_flush_iotlb(struct =
domain *d, dfn_t dfn,
>
> >  static int __must_check iommu_flush_iotlb_pages(struct domain *d,
> >                                                  dfn_t dfn,
> > -                                                unsigned int =
page_count,
> > +                                                unsigned long =
page_count,
> >                                                  unsigned int =
flush_flags)
> >  {
> >      ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
>=20
> This similarly ought to be accompanied by a change to its
> iommu_flush_iotlb() helper.
>=20

It is... in the previous hunk.

  Paul

> Jan


