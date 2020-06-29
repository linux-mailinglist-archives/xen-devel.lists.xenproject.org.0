Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDF20CC00
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 05:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpk1o-0001xw-DP; Mon, 29 Jun 2020 03:00:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNuP=AK=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jpk1m-0001xq-IT
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 03:00:14 +0000
X-Inumbo-ID: a5820122-b9b4-11ea-bca7-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5820122-b9b4-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 03:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL8wxT8ULA7WFH5G8xcDuoZtllx95ZG8Oou7/uyLlz7QcdOC7lbr7W7V1ZP73APB3dvcmO6hnkfAUeJGPJbyY76CYHHkmyNMaREEdofUgQeQHhP+Us1mkLiOOSwpMHfjPfDi87TWoop0lZCa5ArAhGDevbh/tYjL1QNj/4HuthNinoNXoEh4DIeaoOc6ihKT5vWdroiB5S7Fjd5rupkSv9e8xR2Sts3c4zgpfClvxTjm9ky0hbveLMNoa0+6apM4C3JUZS14nj7vmuVBxxR2YsPDbWwDIuw/bHjMRZ+xGoGaU1+Ot+csSyXlo/wcB0PWAZZbEOBs3n3Gtfe30hu8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEkYM3WrGoh9CXGo+3w9YCuBPjOjwUC6rQ5FN+BYd+Q=;
 b=aqKrKDEyOEfrZou1eB6GvbcYHaUFHQBdaRnV8JcR08eIOh4h82jzISYZ1zAsor5P7TzitKfWzZrpZz3P7buieHZM+HnsLJF4oqYm3jkT1hg7F7VpI6dtA9IS1UmLtQHs4JGeaXtfHYItRDM7LzIzMF4i1Vd2brIfGqCdg//K+V7L8eBCyQWycbIarWouMR95rNdDd2mHojsToSsUSovB4YVCtJReqW0Xa03umPbNcVbwpQRwMfghG7ck4+2m9agBVcYx5zzl9d82FB3GK6C+VggygChY6DC2NK49/Zo0f6U2Zb5WapPiLGIT2U2s15cUYqb+CFNFTygvOp7uokgtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEkYM3WrGoh9CXGo+3w9YCuBPjOjwUC6rQ5FN+BYd+Q=;
 b=qmk4pcuEisqTd4+4+dH8ia2k/C7g9J8/LFQncpSN9+AZLiY4QhGQRjB7jSW9SfDx4QOJDHH4V9Ag7Q+1Di5BK6YnWPt9PSDUiq1GY4bYLa9SksOItQAdNHUwpHnV4Y2Pdsw/5cLz2900b4ef4bDRTmRseKO2dMm/udvcOt+dCU0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Mon, 29 Jun
 2020 03:00:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 03:00:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
Thread-Topic: [PATCH] xen: introduce xen_vring_use_dma
Thread-Index: AQHWSgTusARd8c8cRkWwDit233DtZajneYoAgACU6oCAAC7QAIAAEpoAgAAGSwCAAUK2gIAFVRgQ
Date: Mon, 29 Jun 2020 03:00:08 +0000
Message-ID: <DB6PR0402MB2760B02A5EA92A24D5703344886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 13ba3640-e9ad-4e19-0273-08d81bd88847
x-ms-traffictypediagnostic: DB6PR0402MB2933:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB29339084D7549C71A0F58503886E0@DB6PR0402MB2933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q15QAvPQSN0Timky4oDpoQS5EjdrqXyUR1t7gIHO5/lII+2gdPQVQdSXSXhZlqnIolxDskOU3zxxiut6WJYFzfMoEOWmyXxCCkrmkJUDu4RPemXo/DT+xmilbdL2bDtr1mK4zk0D+ZBfixO0e+3oi3FEGBWy6wIJdve3no6VbjcKt3xeaNgMSMcObV3TcVbe34A9rMQTAwW13OGg+pSU3bcOhcaP618ZDtTdibEE/WKv1LdNtyKkrxUQUHUIsQfbq/lap48+BOfN27XzbUlcDnoJtTg0OROcVqPHqy+KtiYaAlSAN578MUzdINBTKV/2DX/+wnQyYNL/yAU/SX7fAV1ESIK6Jd+4o+cK8hCyWeLJDGotGeePClJRbt7UXruSXxt+pRzoLXiKAhVsVNm+qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(316002)(76116006)(966005)(52536014)(66476007)(54906003)(66946007)(6506007)(66446008)(64756008)(66556008)(7416002)(4326008)(186003)(26005)(7696005)(2906002)(33656002)(86362001)(110136005)(45080400002)(8676002)(83080400001)(8936002)(71200400001)(83380400001)(9686003)(478600001)(44832011)(55016002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: rIh4hpyZRlq1oXv0Jp5uXtz/ZBRmR5fCy7P/DPCVKSUc/ZUSfpco3e197h5zPE5YrX0mUvrKaBvhrFyzRq+9kYsTkXIrfhrFiaxdUUMTeNk1AxnwEzDWrTwrDVUsqYfeb39VGV2HX6MlChnzz1Sfssl23UkXqLY4EpkUHniCtEbQqB+PbqHtC0h3po7KQdmlp8juiiCFoWhyEjahToeZhOejGxGZaMbO3PjO7gkzxgj2Vuv77kLSNTKpk8qtWRSdhboted7dHYzWMtS8oQEnkQM9QJn6kKvKlXDsVyn3kzuPDJnY/wQoNuT7r9jgj2GdeH6z+JZTztjeIrjiupnElYwagCedNMcPOXx2mTRYyv+coPNroPMnopkCFQwRGSIYdYz6BuuHHzVrl03FUD2loYS1doMczk0yWXrj+QCtwHItMAxJFbBQcPHSIS0IiLZDLGkEPYO8W9aGAfCSigmp+B+Ts5tbl3mtHZFDIytzrMb6UyVZ+IpG9Pt+WLI5COp6
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ba3640-e9ad-4e19-0273-08d81bd88847
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 03:00:08.4686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFb8Yle0owm/sFCkI7lJMnCMp8RzUFPNAIHnY7sAQRRBmHrab9Fa7cCfi1CtCu1BSYp+Oj2wBJAQ58CduENUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
>=20
> On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > >
> > > > > > > Use xen_swiotlb to determine when vring should use dma APIs
> > > > > > > to map the
> > > > > > > ring: when xen_swiotlb is enabled the dma API is required.
> > > > > > > When it is disabled, it is not required.
> > > > > > >
> > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > > > Xen was there first, but everyone else is using that now.
> > > > >
> > > > > Unfortunately it is complicated and it is not related to
> > > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > >
> > > > >
> > > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to
> > > > > translate foreign mappings (memory coming from other VMs) to
> physical addresses.
> > > > > On x86, it also uses dma_ops to translate Linux's idea of a
> > > > > physical address into a real physical address (this is unneeded
> > > > > on ARM.)
> > > > >
> > > > >
> > > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be
> used
> > > > > on Xen/x86 always and on Xen/ARM if Linux is Dom0 (because it
> > > > > has foreign
> > > > > mappings.) That is why we have the if (xen_domain) return true;
> > > > > in vring_use_dma_api.
> > > >
> > > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > >
> > > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also* forces
> DMA
> > > > ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > > >
> > > > Unfortunately as a result Xen never got around to properly setting
> > > > VIRTIO_F_IOMMU_PLATFORM.
> > >
> > > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this
> > > because the usage of swiotlb_xen is not a property of virtio,
> >
> >
> > Basically any device without VIRTIO_F_ACCESS_PLATFORM (that is it's
> > name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is what linux
> > calls it) is declared as "special, don't follow normal rules for
> > access".
> >
> > So yes swiotlb_xen is not a property of virtio, but what *is* a
> > property of virtio is that it's not special, just a regular device from=
 DMA POV.
>=20
> I am trying to understand what you meant but I think I am missing somethi=
ng.
>=20
> Are you saying that modern virtio should always have
> VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other
> devices?
>=20
> If that is the case, how is it possible that virtio breaks on ARM using t=
he
> default dma_ops? The breakage is not Xen related (except that Xen turns
> dma_ops on). The original message from Peng was:
>=20
>   vring_map_one_sg -> vring_use_dma_api
>                    -> dma_map_page
>   		       -> __swiotlb_map_page
>   		                ->swiotlb_map_page
>   				->__dma_map_area(phys_to_virt(dma_to_phys(dev,
> dev_addr)), size, dir);
>   However we are using per device dma area for rpmsg, phys_to_virt
>   could not return a correct virtual address for virtual address in
>   vmalloc area. Then kernel panic.
>=20
> I must be missing something. Maybe it is because it has to do with RPMesg=
?

I am not going to fix the rpmsg issue with this patch. It is when ARM DomU
Android os communicate with secure world trusty os using virtio, the
vring_use_dma_api will return true for xen domu, but I no need it return
true and fall into swiotlb.

Thanks,
Peng.

>=20
>=20
> > > > > You might have noticed that I missed one possible case above:
> > > > > Xen/ARM DomU :-)
> > > > >
> > > > > Xen/ARM domUs don't need swiotlb_xen, it is not even
> > > > > initialized. So if
> > > > > (xen_domain) return true; would give the wrong answer in that cas=
e.
> > > > > Linux would end up calling the "normal" dma_ops, not
> > > > > swiotlb-xen, and the "normal" dma_ops fail.
> > > > >
> > > > >
> > > > > The solution I suggested was to make the check in
> > > > > vring_use_dma_api more flexible by returning true if the
> > > > > swiotlb_xen is supposed to be used, not in general for all Xen
> > > > > domains, because that is what the check was really meant to do.
> > > >
> > > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is
> wrong with that?
> > >
> > > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> > > ones that are used. So you are saying, why don't we fix the default
> > > dma_ops to work with virtio?
> > >
> > > It is bad that the default dma_ops crash with virtio, so yes I think
> > > it would be good to fix that. However, even if we fixed that, the if
> > > (xen_domain()) check in vring_use_dma_api is still a problem.
> >
> > Why is it a problem? It just makes virtio use DMA API.
> > If that in turn works, problem solved.
>=20
> You are correct in the sense that it would work. However I do think it is=
 wrong
> for vring_use_dma_api to enable dma_ops/swiotlb-xen for Xen/ARM DomUs
> that don't need it. There are many different types of Xen guests, Xen x86=
 is
> drastically different from Xen ARM, it seems wrong to treat them the same
> way.
>=20
>=20
>=20
> Anyway, re-reading the last messages of the original thread [1], it looks=
 like
> Peng had a clear idea on how to fix the general issue. Peng, what happene=
d
> with that?
>=20
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ke
> rnel.org%2Fpatchwork%2Fpatch%2F1033801%2F%231222404&amp;data=3D02
> %7C01%7Cpeng.fan%40nxp.com%7C27edb29c11da49a2249008d8192d98cc
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637287030912707
> 092&amp;sdata=3DMsF%2FLmBmJ1V%2BoOQ%2FmdhEJ3PFzH55DaSNvorRUU
> QvBvQ%3D&amp;reserved=3D0

