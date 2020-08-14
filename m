Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463D244596
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Twm-0006St-Mj; Fri, 14 Aug 2020 07:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QP56=BY=amazon.co.uk=prvs=4884f5e05=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k6Twm-0006So-1V
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:16:16 +0000
X-Inumbo-ID: ea522c24-4e4c-4e05-a2e4-25ebb388b03a
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea522c24-4e4c-4e05-a2e4-25ebb388b03a;
 Fri, 14 Aug 2020 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1597389375; x=1628925375;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=j4llBa6Lpz/atsVhqJvcCUSnyjX22/m1Iv/zQvusq3c=;
 b=mOQC7TbCKWXXKuzjc60GkgFC0RLEcqdRTK2CKjWZOYUQsCKfm31f55vj
 eVEHAO0ERGBpBiHfrvztI5F+QehEhNffJYilG+desxJ5HMCHS5q/Os1gX
 r9PJe16P90QK6T9+FZBbzBIYS1ZBq0v5xDN+MKqRAKrRGtvVOYPMuVyZQ g=;
X-IronPort-AV: E=Sophos;i="5.76,311,1592870400"; d="scan'208";a="49239214"
Subject: RE: [PATCH v4 03/14] x86/iommu: convert VT-d code to use new page
 table allocator
Thread-Topic: [PATCH v4 03/14] x86/iommu: convert VT-d code to use new page
 table allocator
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 14 Aug 2020 07:16:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8FFCAC05F6; Fri, 14 Aug 2020 07:16:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 14 Aug 2020 07:16:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 14 Aug 2020 07:16:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 14 Aug 2020 07:16:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Tian, Kevin" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHWamUacjhbO8W3fkGXDLamh0t/Jqk3NaCQgAAKexA=
Date: Fri, 14 Aug 2020 07:16:12 +0000
Message-ID: <f760be12b92b4f7c9c728a9d956c8fe9@EX13D32EUC003.ant.amazon.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-4-paul@xen.org>
 <MWHPR11MB164570CF853F0E873BFDBB6C8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB164570CF853F0E873BFDBB6C8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
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
[snip]
> > -static void iommu_free_page_table(struct page_info *pg)
> > -{
> > -    unsigned int i, next_level =3D PFN_ORDER(pg) - 1;
> > -    u64 pt_maddr =3D page_to_maddr(pg);
> > -    struct dma_pte *pt_vaddr, *pte;
> > -
> > -    PFN_ORDER(pg) =3D 0;
> > -    pt_vaddr =3D (struct dma_pte *)map_vtd_domain_page(pt_maddr);
> > -
> > -    for ( i =3D 0; i < PTE_NUM; i++ )
> > -    {
> > -        pte =3D &pt_vaddr[i];
> > -        if ( !dma_pte_present(*pte) )
> > -            continue;
> > -
> > -        if ( next_level >=3D 1 )
> > -            iommu_free_pagetable(dma_pte_addr(*pte), next_level);
> > -
> > -        dma_clear_pte(*pte);
> > -        iommu_sync_cache(pte, sizeof(struct dma_pte));
>=20
> I didn't see sync_cache in the new iommu_free_pgtables. Is it intended
> (i.e. original flush is meaningless) or overlooked?
>=20

The original v1 combined patch had the comment:

NOTE: There is no need to clear and sync PTEs during teardown since the per=
-
      device root entries will have already been cleared (when devices were
      de-assigned) so the page tables can no longer be accessed by the IOMM=
U.

I should have included that note in this one. I'll fix in v5.

  Paul

> Thanks
> Kevin

