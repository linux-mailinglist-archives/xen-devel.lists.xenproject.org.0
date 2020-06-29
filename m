Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91C20CCC1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 08:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpnEi-0001zP-06; Mon, 29 Jun 2020 06:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNuP=AK=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jpnEf-0001zK-NY
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 06:25:45 +0000
X-Inumbo-ID: 5bf9e8e0-b9d1-11ea-852e-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bf9e8e0-b9d1-11ea-852e-12813bfff9fa;
 Mon, 29 Jun 2020 06:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ffb0tryf3+WMusuxriFspTuyCD0jR5nujp/rzdzc6JR92rJsWlAVE8I313MSQBTprU4nobwvSXgu8vR4rC/9MeFgvPh//pXnseXz3XbJJeHjIQvsLIahqtiVa8KEaN9fHGnvZSy0Qr2bIC0t8RsRIlKBpkSTaXkMpmqT4lBXcrwyiy3yRA56Fu5tl5PlYR3gujgCm468frMy1aWF1CvKp2yVN54FRB03txEI8SJjwDXXSKDDSXjfCX+wrBVk/Q/ZEKZ4SrwGQolzsfMcR1OnB2Har2Lpfb/Ija4WBx086MLPPMNYBJ7IIQGt86NYaNEcT872f7hEX+HmJhFpUXIotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVinsJJnviT21i7XI0KnA6+56MrUkVoRCxqh0lP/y9s=;
 b=hhaBE5XukKYUuZPClQoZo29++2XadgB3N0uZbP+RCVP7EAwcu+hbgCHnj3aXOesCe+pkNU7XRSV8Ou/voG/N+htBPj3/yP+oH2Yaopp9jCu5sfSbGNirApS0dBqcGjopmO6lqSmhxcAPk4la3xmEWlDpfcoKaVM1sIcSBLhitZ8EooVWcd8K5aJ2K7WUjGESlCyvEBgwabFwCl32r9iD+JQ8DLt6kQGyiRPbQcvFmL+M9zrsuF4/j0tG2aVNLogbhNBb8oQA1iD08zMf505DtilMBXEcq6hEj/dCBKYAiRfxkVVUkn/3qlyRE8tn5V0wigeEriicm7ltAw0eBkVfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVinsJJnviT21i7XI0KnA6+56MrUkVoRCxqh0lP/y9s=;
 b=L1zcjV0CGehZeD7cB6ZqeDkIn8Wkfl30zMXdjW2xafn6zwlvwrzgTksmnOEBJzLvcWyZ6S5jRwc2qF+4dQcok7dMBsqvuQZeQcu1Nq4ClyFRoPBTAzyYPCluwfjmtoQeVQDqjbDH5VaFL36TLFhMmuaD6uecdAr6PLacwaycXQs=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6715.eurprd04.prod.outlook.com (2603:10a6:10:10d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Mon, 29 Jun
 2020 06:25:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 06:25:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
Thread-Topic: [PATCH] xen: introduce xen_vring_use_dma
Thread-Index: AQHWSgTusARd8c8cRkWwDit233DtZajneYoAgACU6oCAAC7QAIAAEpoAgAAGSwCAAUK2gIABcSaAgAPk6cCAADgrAIAAAH5w
Date: Mon, 29 Jun 2020 06:25:41 +0000
Message-ID: <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200629022124-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200629022124-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5e1c4cb-0c5f-447d-9984-08d81bf53f1b
x-ms-traffictypediagnostic: DB8PR04MB6715:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB67159207B33C95FEA00FE33F886E0@DB8PR04MB6715.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZcomgzT8z0TV8AdfcgQXBFI1wdcxYJJGw2fCPEYYV2HF5Asq2udSyAxCqG2x424rMSoSB19NYDH2/cltuOnvwJewUKeUap9q6OxMr5rpTs8qTvM0LWCCHaMxslX2x5Kw4P7LsAUS1MV7Kq4NCH8IeoHXVqZKXLZibUu8OQX77pe7RD8Uehe92lYOxg0IIjmPTpaHPU0xUSv/747T7V1t3n1n48YZVipEAlJ36w5LfLqcdQ+tM+iQSH4ToueQp8TeBuAY6VX0Q58g6J0FYF2UT9WNDIgd/mcTxuqk9BIhCZLzlEi3VhJVXiwxs91dLexhPfI0y1+TDhStDySFnLh6ldmQZIVSnILpem5NP3bMP+iYGcSEJHYXGraspfUuTcmgpiGqfDQUzCt4h/o1602WSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6916009)(186003)(86362001)(9686003)(76116006)(66446008)(45080400002)(7696005)(55016002)(5660300002)(66946007)(26005)(83380400001)(71200400001)(66476007)(66556008)(64756008)(33656002)(7416002)(52536014)(4326008)(6506007)(54906003)(478600001)(44832011)(8676002)(316002)(966005)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yAnM0ejSbejlrSnR31b9U9qBdkL0+lYs1XiRprTYLdv0aTF4h/fK7BMlL9j5/Efdh2jIQq3P9IpIsXCvMJ2nZp+QjeRsYQm1Vi/g0bWtsGrlC3mbi/7RplbNGBRgqLxfttNrsnazacGBy45PpLP3jDu0ITIVyZpFgmxR9zw17h9ODKv0sZaBHTyCbDQFt089cdMTCluY+rur3KLU5ty7nI5NdQGto4tY2Dm2oF8USaJ6t4OF7YAV14XQTV+CudulV3zH9eqWt3wcc/hymm1fdv8dvk37aNah9MbPftxJ3VGKSXDRLYm9jStQZqeUX2riVQHl8UGnTJ7DGJf7NAr7RPRjlBJvG7/F8Ty57bgrPoIR6Ll9jJIp+nvIt8VTBbHf0wF8y6qy/ahygmI8ZyXSTe1b1nScNRKRQcKU08ce8oglUa3Zte1r/wHFyA33zb/H9JbBjaOotRYHXU476nK0MAbxPyhdWD/HfkU3sQuzjtH5XhTNtJJYQGeDjUZzm5OK
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e1c4cb-0c5f-447d-9984-08d81bf53f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 06:25:41.1516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jlca2JAB/hh8X/P93HXsVW0tsA8+sgSQYIkgLQ2VlEVRDYpq8IaCerlyTe74kscdoLfBrQC2fq3z4lL2GPh/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6715
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
 Stefano Stabellini <sstabellini@kernel.org>,
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
> On Mon, Jun 29, 2020 at 03:05:19AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
> > >
> > > On Thu, Jun 25, 2020 at 10:31:27AM -0700, Stefano Stabellini wrote:
> > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrot=
e:
> > > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini
> wrote:
> > > > > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > > > > >
> > > > > > > > > > Use xen_swiotlb to determine when vring should use dma
> > > > > > > > > > APIs to map the
> > > > > > > > > > ring: when xen_swiotlb is enabled the dma API is requir=
ed.
> > > > > > > > > > When it is disabled, it is not required.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > > >
> > > > > > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for
> > > this?
> > > > > > > > > Xen was there first, but everyone else is using that now.
> > > > > > > >
> > > > > > > > Unfortunately it is complicated and it is not related to
> > > > > > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > > > > >
> > > > > > > >
> > > > > > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to
> > > > > > > > translate foreign mappings (memory coming from other VMs)
> > > > > > > > to
> > > physical addresses.
> > > > > > > > On x86, it also uses dma_ops to translate Linux's idea of
> > > > > > > > a physical address into a real physical address (this is
> > > > > > > > unneeded on ARM.)
> > > > > > > >
> > > > > > > >
> > > > > > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should
> > > > > > > > be used on Xen/x86 always and on Xen/ARM if Linux is Dom0
> > > > > > > > (because it has foreign
> > > > > > > > mappings.) That is why we have the if (xen_domain) return
> > > > > > > > true; in vring_use_dma_api.
> > > > > > >
> > > > > > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > > > > >
> > > > > > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > > > > > > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > > > > > >
> > > > > > > Unfortunately as a result Xen never got around to properly
> > > > > > > setting VIRTIO_F_IOMMU_PLATFORM.
> > > > > >
> > > > > > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for
> > > > > > this because the usage of swiotlb_xen is not a property of
> > > > > > virtio,
> > > > >
> > > > >
> > > > > Basically any device without VIRTIO_F_ACCESS_PLATFORM (that is
> > > > > it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is what
> > > > > linux calls it) is declared as "special, don't follow normal
> > > > > rules for access".
> > > > >
> > > > > So yes swiotlb_xen is not a property of virtio, but what *is* a
> > > > > property of virtio is that it's not special, just a regular
> > > > > device from DMA
> > > POV.
> > > >
> > > > I am trying to understand what you meant but I think I am missing
> > > > something.
> > > >
> > > > Are you saying that modern virtio should always have
> > > > VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other
> > > devices?
> > >
> > > I am saying it's a safe default. Clear VIRTIO_F_ACCESS_PLATFORM if
> > > you have some special needs e.g. you are very sure it's ok to bypass
> > > DMA ops, or you need to support a legacy guest (produced in the
> > > window between virtio 1 support in 2014 and support for
> VIRTIO_F_ACCESS_PLATFORM in 2016).
> > >
> > >
> > > > If that is the case, how is it possible that virtio breaks on ARM
> > > > using the default dma_ops? The breakage is not Xen related (except
> > > > that Xen turns dma_ops on). The original message from Peng was:
> > > >
> > > >   vring_map_one_sg -> vring_use_dma_api
> > > >                    -> dma_map_page
> > > >   		       -> __swiotlb_map_page
> > > >   		                ->swiotlb_map_page
> > > >   				->__dma_map_area(phys_to_virt(dma_to_phys(dev,
> > > dev_addr)), size, dir);
> > > >   However we are using per device dma area for rpmsg, phys_to_virt
> > > >   could not return a correct virtual address for virtual address in
> > > >   vmalloc area. Then kernel panic.
> > > >
> > > > I must be missing something. Maybe it is because it has to do with
> RPMesg?
> > >
> > > I think it's an RPMesg bug, yes
> >
> > rpmsg bug is another issue, it should not use dma_alloc_coherent for
> > reserved area, and use vmalloc_to_page.
> >
> > Anyway here using dma api will also trigger issue.
> >
> > >
> > > >
> > > > > > > > You might have noticed that I missed one possible case abov=
e:
> > > > > > > > Xen/ARM DomU :-)
> > > > > > > >
> > > > > > > > Xen/ARM domUs don't need swiotlb_xen, it is not even
> > > > > > > > initialized. So if
> > > > > > > > (xen_domain) return true; would give the wrong answer in th=
at
> case.
> > > > > > > > Linux would end up calling the "normal" dma_ops, not
> > > > > > > > swiotlb-xen, and the "normal" dma_ops fail.
> > > > > > > >
> > > > > > > >
> > > > > > > > The solution I suggested was to make the check in
> > > > > > > > vring_use_dma_api more flexible by returning true if the
> > > > > > > > swiotlb_xen is supposed to be used, not in general for all
> > > > > > > > Xen domains, because that is what the check was really mean=
t to
> do.
> > > > > > >
> > > > > > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU?
> What
> > > > > > > is
> > > wrong with that?
> > > > > >
> > > > > > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops
> > > > > > are the ones that are used. So you are saying, why don't we
> > > > > > fix the default dma_ops to work with virtio?
> > > > > >
> > > > > > It is bad that the default dma_ops crash with virtio, so yes I
> > > > > > think it would be good to fix that. However, even if we fixed
> > > > > > that, the if
> > > > > > (xen_domain()) check in vring_use_dma_api is still a problem.
> > > > >
> > > > > Why is it a problem? It just makes virtio use DMA API.
> > > > > If that in turn works, problem solved.
> > > >
> > > > You are correct in the sense that it would work. However I do
> > > > think it is wrong for vring_use_dma_api to enable
> > > > dma_ops/swiotlb-xen for Xen/ARM DomUs that don't need it. There
> > > > are many different types of Xen guests, Xen x86 is drastically
> > > > different from Xen ARM, it seems wrong to treat them the same way.
> > >
> > > I could imagine some future Xen hosts setting a flag somewhere in
> > > the platform capability saying "no xen specific flag, rely on
> > > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > > How about that?
> > >
> >
> > Michael, Stefano,
> >
> > So what's your suggestion here, that we could avoid similar issue for
> > virtio drivers in ARM DomU?
> >
> > Thanks,
> > Peng.
> >
> > >
> > > >
> > > >
> > > > Anyway, re-reading the last messages of the original thread [1],
> > > > it looks like Peng had a clear idea on how to fix the general issue=
.
> > > > Peng, what happened with that?
> >
> > We shrinked the rpmsg reserved area to workaround the issue.
> > So still use the dma apis in rpmsg.
> >
> > But here I am going to address domu android trusty issue using virtio.
>=20
> My suggestion is to first of all fix DMA API so it works properly.

Could you please elaborate more details?

You mean the DMA API usage of rpmsg? Or xen domu dma_ops?

Thanks,
Peng.=20

>=20
> > > >
> > > >
> > > > [1]
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> > > > lore
> > > > .kernel.org%2Fpatchwork%2Fpatch%2F1033801%2F%231222404&amp;
> dat
> > > a=3D02%7C0
> > > >
> > >
> 1%7Cpeng.fan%40nxp.com%7C08ba48d3b3d54e775a8108d819e62fd0%7C68
> > > 6ea1d3bc
> > > >
> > >
> 2b4c6fa92cd99c5c301635%7C0%7C0%7C637287823721994475&amp;sdata
> > > =3DCw4FHWrH
> > > > uVKBCn3%2BKS2VM7cWuGoTI6R7SHJrJSLY5Io%3D&amp;reserved=3D0


