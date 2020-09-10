Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C3264BC2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 19:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGQfi-0006YQ-JW; Thu, 10 Sep 2020 17:47:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8cGC=CT=amazon.co.uk=prvs=5150e7a0e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kGQfh-0006YL-I2
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 17:47:45 +0000
X-Inumbo-ID: 96064da6-1d5d-4bae-aab6-7ff31096045f
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96064da6-1d5d-4bae-aab6-7ff31096045f;
 Thu, 10 Sep 2020 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1599760064; x=1631296064;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=ehZCQuEfF0c63+yDBCZOTqEFzAti2WwEu6TnhAKPGL4=;
 b=IsioCDN0FjPqqO2/m7Ew4DBu34KuGm8DRKukLVhmyqA1P9x74HfrHbHF
 BzDeS5h7dieiSi/tCteTBYsa7Uhv7yWX0e0zmlWMLPdxhpwGwQcrm896F
 xTKSLk4ISV77z6qQvV2n9m4/IPwkDuBbELZJpCcIRp21MA549tYp5zAfa U=;
X-IronPort-AV: E=Sophos;i="5.76,413,1592870400"; d="scan'208";a="73974213"
Subject: RE: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
Thread-Topic: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 10 Sep 2020 17:40:00 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65618A209F; Thu, 10 Sep 2020 17:39:57 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 10 Sep 2020 17:39:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 10 Sep 2020 17:39:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
Thread-Index: AQHWh4IX72/mBoqf+EKYBSK7g6LWxqliEpCAgAACGQCAAA7P8A==
Date: Thu, 10 Sep 2020 17:39:55 +0000
Message-ID: <88fc2079ec3f452db02fb4148b69240a@EX13D32EUC003.ant.amazon.com>
References: <20200910145007.14107-1-paul@xen.org>
 <20200910145007.14107-5-paul@xen.org>
 <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
 <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
In-Reply-To: <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="iso-8859-1"
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
> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Sent: 10 September 2020 17:46
> To: Paul Durrant <paul@xen.org>
> Cc: open list:X86 <xen-devel@lists.xenproject.org>; Durrant, Paul <pdurra=
nt@amazon.co.uk>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <=
wl@xen.org>; Roger Pau Monn=E9
> <roger.pau@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jac=
kson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabe=
llini
> <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Ti=
an <kevin.tian@intel.com>
> Subject: RE: [EXTERNAL] [PATCH v6 4/8] iommu: make map and unmap take a p=
age count, similar to flush
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open
> attachments unless you can confirm the sender and know the content is saf=
e.
>=20
>=20
>=20
> >> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> >> index 1831dc66b0..13f68dc93d 100644
> >> --- a/xen/include/xen/iommu.h
> >> +++ b/xen/include/xen/iommu.h
> >> @@ -146,23 +146,23 @@ enum
> >> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
> >>
> >> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> >> -                           unsigned int page_order, unsigned int flag=
s,
> >> +                           unsigned long page_count, unsigned int fla=
gs,
> >>                           unsigned int *flush_flags);
> >> int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
> >> -                             unsigned int page_order,
> >> +                             unsigned long page_count,
> >>                             unsigned int *flush_flags);
> >>
> >> int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t m=
fn,
> >> -                                  unsigned int page_order,
> >> +                                  unsigned long page_count,
> >>                                  unsigned int flags);
> >> int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
> >> -                                    unsigned int page_order);
> >> +                                    unsigned long page_count);
> >>
> >> int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t =
*mfn,
> >>                                   unsigned int *flags);
> >>
> >> int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
> >> -                                   unsigned int page_count,
> >> +                                   unsigned long page_count,
> >>                                   unsigned int flush_flags);
> >> int __must_check iommu_iotlb_flush_all(struct domain *d,
> >>                                       unsigned int flush_flags);
> >> @@ -281,7 +281,7 @@ struct iommu_ops {
> >>    void (*share_p2m)(struct domain *d);
> >>    void (*crash_shutdown)(void);
> >>    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
> >> -                                    unsigned int page_count,
> >> +                                    unsigned long page_count,
> >
> > This change will require to change the arm smmu code to have the right =
type for page count:
> > xen/drivers/passthrough/smmu.c:2536
> > static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t df=
n,
> >                         unsigned int page_count,
> >                         unsigned int flush_flags)
> >
> > Otherwise compilation is failing for arm.
> >
> > With that fixed i could compile and start an arm system with the comple=
te serie (but not one with an
> arm SMMU).
>=20
> I should have specified because my test system right now does not have an=
 SMMUv1.
>=20

Thanks for spotting that; I did run a cross compilation on arm a while ago =
so not sure how I managed to miss this. Will fix and send v7.

  Paul

> Bertrand


