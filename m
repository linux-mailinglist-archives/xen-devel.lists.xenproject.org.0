Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C553A133
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340399.565427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKzI-0000Fh-HU; Wed, 01 Jun 2022 09:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340399.565427; Wed, 01 Jun 2022 09:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKzI-0000Cu-E8; Wed, 01 Jun 2022 09:50:00 +0000
Received: by outflank-mailman (input) for mailman id 340399;
 Wed, 01 Jun 2022 09:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RHfR=WI=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nwKzH-0000Co-Ii
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:49:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a10b4c-e190-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:49:58 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6218.eurprd04.prod.outlook.com (2603:10a6:10:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 09:49:56 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%9]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 09:49:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 32a10b4c-e190-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFRvpBOmiylupNcLLyn+08pJIpQIBR8naXA0+M3qcN+JbuCpLcwnREfs3zpxfM7aMYLOTFjE5B19F4fleK2Jau4t0cUIJ4LRy/dMI/1j2B9onqqLsXtRrmCc6gqv1f2I5nUK6VuPXhSBNtgpoVojYaN2dBt9sfBOqNjHIV2K2qXq9DGp2BL88bk479BWywWC4jZAWMchKMNHNAlvVTCrzK7UYxh2Kw8xrs82xTfqOhuP3+4LZkhT0CjT8XqtXafoUtwdSsq5ouehT9iCRaBDOjf+q4mN9KrSiHQbM5BR1YYBrOTclbjNN6kP5j99bSoUntgnIABaGqsTpDguP35y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teqlByfXz9Tdy7bHT128jHhdsx2OXhF/KJnnZeAvqTw=;
 b=fKu6we3NcHW0YS1t6rcwOObEbmoREHP6xAXn4X0qO3ornzdfpFGEsb2M3g62k4zVUpHvcPO/gCgYGJ/eLpCPUciaHECQlMnRFYMcujJy2wvhiYWEw6/rofExn4NGnuV28rfOBqSUe9GrYiOv9T4o4S7CI/ajH8AxF47HvMeHCz0wW9v4ksRi9FdEbCdpum0+4B0CnWo6DMUUsPZne2dcFFeFVViIMj4r2Z38U9AxRdLgMTO037bcLY7Uyl/o6lh3qjqLOU/UJnX7syKfxauO5WXmYtp2m0kDUx3D66lma56oViu17neUitZIj7BRm98ohnrEgpQCJB9B7SkzlHs/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teqlByfXz9Tdy7bHT128jHhdsx2OXhF/KJnnZeAvqTw=;
 b=P6ksZfWL3G1mi/0T1fzxSCEyPvDAXHaDCc4kT/bRz8LA78A2AvhLtlSAlVFv5TSB1UyXwwyJIaBX5y3ds3C552M7iSBcpcaJSMbuEaT+YshPbOkHh51en9n05Sf84KdABw/o1B/Xm1xXGu3aceYBVQgtJxjgRCNM97967O8BXP4=
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien@xen.org>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa03j+IAgALBIaA=
Date: Wed, 1 Jun 2022 09:49:56 +0000
Message-ID:
 <DU0PR04MB941731169B3086156FF485F588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
In-Reply-To: <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8fde13d-d58a-42ca-2b0e-08da43b415d5
x-ms-traffictypediagnostic: DBBPR04MB6218:EE_
x-microsoft-antispam-prvs:
 <DBBPR04MB62184DDB9517F387B039932788DF9@DBBPR04MB6218.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CvKA0l0cvf0Pdq0/Zif/84haQE5aAt55fyAM4/6oKywqwQ/F+h5fjiAJpX30brKw9xuFrayK+efkbbAGU6BnNXMo+vvmUpAuu7C2QpIA5sW5+PFvu/8UKV/X9FQ8YXTSsjldADLzE9aFM5/9uEKrX5Dgl5CQS+KqZaau6E2bEzsRQq+ELhMCHfz94l1wQIEq0AmIInzxns1Da4b4JA55YvtyKkc824CJWKvUlakwBxTazgMVLVajIH3B2XiWTmz1YtpZkcLSG0IAZwUb3HIbpsARQ/F1OJ1g13JoV3h1KzNO09r+SyQV4QMQyYD/VAqrYzovd+kWIAh4QkeOhSPHoVGmgl9I3YsDSvsoDyyn921sqqPLfx1bCsHBAH6+Mtwlwn+kgk1ZSIyrdVHEDKXn3RTFfBocaIm+a7hR/8oHl24zdH9+qIo31lTay9hheDtqY5X3ubsycx/jvUGoYgB+ubuEvWR8jNuUcSgttPsXfjVYvyFFRzG2lMReTc9qpPMsjJKGcvFE494OSuwwAHSo2EX9JGiOwWZHekD6Uz7wUAap6W9YO3Or+2yoGwKeaHeD0Fg2ZL8twP8DbkiGzOgZ5Hydpj1K06UFkIgKgbAzK4Mq/q2P/dOVOAkstQ7vfGwLjsnG5E+aNYpgnDIfQKLDdy6RocL8/C/97MNy3HXtrXVT5CK004u8G8rpteTOMSguDFNspbIhwrwOqnkra1ywBEJJTRGx01SzFfFjSPoaCW3oiKiqw0jm8OGlxdjjBzceo+hsngECaoGuUX/IynRBkpQMQn6IZf1opXGm1HS96VQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(86362001)(7696005)(6506007)(508600001)(122000001)(53546011)(9686003)(45080400002)(38070700005)(38100700002)(26005)(2906002)(44832011)(83380400001)(33656002)(66946007)(66556008)(66446008)(76116006)(66476007)(64756008)(4326008)(5660300002)(71200400001)(54906003)(110136005)(8676002)(8936002)(316002)(52536014)(55016003)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4s6goWdkIpDjp4bqUH36s7rDUw//E9bTor/Hr7L8FYnVM4bgIVuV9gs1STDr?=
 =?us-ascii?Q?Pdi4P/PYEeh891DpW+gvPBrYjgqLmB2+vihyt4io0udfxnZ6ossptkKOfQyX?=
 =?us-ascii?Q?+iBOlimCB3krOwcoLiApkAuMJb198GmwWe6MPGeYDdC6udHg7hN/8X5c5FWz?=
 =?us-ascii?Q?OG05ygFxZNJ6aUqIDUVPa+9GGadA6D77PE4tOc2wbbvk3XKGzRq7AOFCJEas?=
 =?us-ascii?Q?/U6fUC/yiQ7+gwY/0Hz2RzxbC5KA4l9JHEdD/pE5VAAcIe2F8WVWaPlQa+hu?=
 =?us-ascii?Q?ynu3qgEwqszJCswYIeIJ2DmqguK0UzF+8WMn7DqWZwpIMArGwbZgnnURgAzh?=
 =?us-ascii?Q?UKy6ndaG3+FfOx0XZbG+x5170oc/eibuaTtEZjppKEtC84lCHNjZeh56ls+u?=
 =?us-ascii?Q?GnQ4RLEMGYoo3UblvxxIJicpXxjChuRSTGYumGLwn0xCTqKXw/4P03e+4t60?=
 =?us-ascii?Q?23T8QEYwofnMZYB2Tn3oaVO6BTclmO18cY5YUDlLr+tCBHxntDo9gbgvwjvm?=
 =?us-ascii?Q?HtxttBO6ezkncaSrfoZQBVacUM1s3gccciPbFC78L0TFov+A4a+L0zQBF/n8?=
 =?us-ascii?Q?YZT/Hr5GKdr+S6AOZBQ9pBt0cY6Ai767LXFx1oCHaHvcy3J6nmC2DnrZv0vW?=
 =?us-ascii?Q?k8iFSjtIT2UT0tdG3wRkPTEYoJwiSAB41aEEOEpAXK43Lk4hSJ8EknWaba60?=
 =?us-ascii?Q?YgYQy1ge9eUUpUBtlVA8Dg9c+mIDnkEltFOpkWasf8ME1BvNeFn4AwRfkv74?=
 =?us-ascii?Q?tvOZPQbJ9em4bQXgIvzb4cFamWo1CCJ4WA6HNn4yTYSSKcJ/3WPnIw/Au7+3?=
 =?us-ascii?Q?7/vLsb8+JJoTjE6J7AZPRB1ryaJWCX+ZN3UY/NVFPoXwY7WfU0zlB1WnpvPa?=
 =?us-ascii?Q?3dhW18g746o3RIDFrOTt0I8d6Bjxmzjd2Tvgp/dXdryNBLRs6IkVqOr9SJmg?=
 =?us-ascii?Q?aAoGmShUKplGFvYXOwumcf/1cxw+QqHdQeMoL6CW9EwEughlOgxnLSX3dsZW?=
 =?us-ascii?Q?Vw6vssy/V0caAHBpXCirTTci/ZA7gN8jWeRXr5pUevs4mYC9yJzunx17q75E?=
 =?us-ascii?Q?nCERqHa68ZdCDzpVIw5DhEUesSZV7raDwitI2YxeYNaE9Pm+hY4tJ35tDNaX?=
 =?us-ascii?Q?Cw3fQKS9K3ZNgG+3DoFmy76kMJRgnZgYb32HaSHy92eBcCrQkSbm1OyGBVMA?=
 =?us-ascii?Q?o3+yyyvKdMn1v5IF7GcHFv1QT9RTCFjqFrA7fnxsuumk9YLiq7vhquXhB2Mt?=
 =?us-ascii?Q?E79vJ3Byg1OcoN0u34FArBamN0T2L6kY9VWdS45VPzLjpWjW3RjrWaCi2qDk?=
 =?us-ascii?Q?e5XlDE726jgtlYTbOr3m0kv2M3rfaE+WBdGDdu0ZFczF8UoONDT8YdLcQ61a?=
 =?us-ascii?Q?D2avVvEdlDPolnrwwR/XfXk6ZsodNyTWQrQvYaiJMVt0GEipOs46MlX5HcR3?=
 =?us-ascii?Q?B8+vX0Xm5m6zOgrcwY1mzdUXQ4k/CQTzNZnjRsat+RRaO+oTzEu5TkL+Xbzu?=
 =?us-ascii?Q?co0pMST0HXZ0IoUnVjux3bc39HlTc9o971nFG2k1D4kyT024kTuip/9Wy9+h?=
 =?us-ascii?Q?jrII8Ctve1xqlDZGbB02VErcbfzKf72S/4aqHU38y92iNDowVXcVUT7q3CYl?=
 =?us-ascii?Q?RfdkMtPFu4r8DM0JkqTpspBI1bgjvysQR0bYXqNl0fPb679C3fGLVsoSLnzo?=
 =?us-ascii?Q?QD2JG/qtVdsAXkker2FVcmqEHdzAuFFRuGz914hupEIXNlB3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fde13d-d58a-42ca-2b0e-08da43b415d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:49:56.5343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqV3AEOA65GHCUwZWCJpe6wtT26pnil+7hWQbylv/XcVW4/V2zArt2WSxMHZmqM+O/MrZxQn5t7/NEy7NxBfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6218

> Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init
> vpu_decoder
>=20
> (+ Stefano)
>=20
> On 30/05/2022 16:21, Oleksii Moisieiev wrote:
> > Hello,
>=20
> Hi Oleksii,
>=20
> > I'm getting permission fault from SMMU when trying to init
> > VPU_Encoder/Decoder in Dom0 on IMX8QM board:
> > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408,
> > iova=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0 This error appears when
> > vpu_encoder/decoder tries to memcpy firmware image to
> > 0x86000000 address, which is defined in reserved-memory node in xen
> > device-tree as encoder_boot/decoder_boot region.
>=20
> It is not clear to me who is executing the memcpy(). Is it the device or =
your
> domain? If the former, where was the instruction fetch from?
>=20
> The reason I am asking that is, from what you wrote, mempcy() will write =
to
> 0x86000000. So the write should not result to a instruction abort.
> Only an instruction fetch would lead to such abort.
>=20
> >
> > I'm using xen from branch xen-project/staging-4.16 + imx related
> > patches, which were taken from
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourc=
e.c
> odeaurora.org%2Fexternal%2Fimx%2Fimx-xen&amp;data=3D05%7C01%7Cpeng.f
> an%40nxp.com%7C726bfc45b45747a655bc08da425351d4%7C686ea1d3bc2b
> 4c6fa92cd99c5c301635%7C0%7C0%7C637895222868692087%7CUnknown%
> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DKcbEjN80VJS5yq4KMp2g
> NjQuVtx95jKHH5T32ZCj3Do%3D&amp;reserved=3D0.
> >
> > After some investigation I found that this issue was fixed by Peng Fan
> > in
> > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from
> > codeaurora), but only for the Guest domains.
> > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved memory
> > region in map_mmio_regions function.
> >
> > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type
> > for the reserved memory in map_regions_p2mt, which is used to map
> memory during Dom0 creation.
> > Patch can be found below.
> >
> > Based on initial discussions on IRC channel - XN bit did the trick
> > because looks like vpu decoder is executing some code from this memory.
>=20
> This was a surprise to me that device could also execute memory. From the
> SMMU spec, this looks a legit things. Before relaxing the type, I would l=
ike to
> confirm this is what's happenning in your case.

It is not device, VPU could execute code, it has firmware. Just like use
SMMU to isolate M4-core, M4 could execute code.

Regards,
Peng.

>=20
> [...]
>=20
> > ---
> > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory regions
> >
> > This is the enhancement of the
> 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.
> >
> > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> > same way it does in map_mmio_regions. This change is for the case when
> > vpu encoder/decoder works in DomO and not passed-through to the Guest
> > Domains.
> >
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   xen/arch/arm/p2m.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c index
> > e9568dab88..bb1f681b71 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> >                        mfn_t mfn,
> >                        p2m_type_t p2mt)
> >   {
> > +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > +        (((long)gfn_x(gfn) + nr) <=3D
> > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
>=20
> I am afraid I don't understand what this check is for. In a normal setup,=
 we don't
> know where the reserved regions are mapped. Only the caller may know that=
.
>=20
> For dom0, this decision could be taken in map_range_to_domain(). For the
> domU, we would need to let the toolstack to chose the memory attribute.
> Stefano attempted to do that a few years ago (see [1]). Maybe we should r=
evive
> it?
>=20
> > +    {
> > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > +        return p2m_insert_mapping(d, gfn, nr, mfn,
> p2m_mmio_direct_nc_x);
> > +    }
> >       return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
> >   }
> >
>=20
> Cheers,
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ker
> nel.org%2Fxen-devel%2Falpine.DEB.2.10.1902261501020.20689%40sstabellini
> -ThinkPad-X260%2F&amp;data=3D05%7C01%7Cpeng.fan%40nxp.com%7C726bfc
> 45b45747a655bc08da425351d4%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0%7C637895222868692087%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> %7C%7C%7C&amp;sdata=3DY%2B%2Fxslm6wc38jM6zZWshRnTM4tx%2BMpyXaI
> r5BLV1R9Q%3D&amp;reserved=3D0
>=20
> --
> Julien Gral


