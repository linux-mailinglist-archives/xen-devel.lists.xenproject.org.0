Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE592965C
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 04:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754824.1163129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQHNe-0003Ca-AL; Sun, 07 Jul 2024 02:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754824.1163129; Sun, 07 Jul 2024 02:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQHNe-0003B9-6s; Sun, 07 Jul 2024 02:11:58 +0000
Received: by outflank-mailman (input) for mailman id 754824;
 Sun, 07 Jul 2024 02:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiCv=OH=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sQHNc-0003B3-K4
 for xen-devel@lists.xenproject.org; Sun, 07 Jul 2024 02:11:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20808.outbound.protection.outlook.com
 [2a01:111:f403:2c18::808])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46cddaeb-3c06-11ef-bbfb-fd08da9f4363;
 Sun, 07 Jul 2024 04:11:54 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH3PR02MB10381.namprd02.prod.outlook.com (2603:10b6:610:20b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 02:11:50 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 02:11:50 +0000
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
X-Inumbo-ID: 46cddaeb-3c06-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEuPTdm92pl1AfYDhNvuUxV5FFuL1D021EzNRGtu5P+pGE0wSJqeI+7ZHpn+w+E2hk72s/oqCGomvdATIn24xqCflY62uvpo3cC1u+ZjUYd9xZ07HyvhSeagFlYZVwA22eBYkqKpRwFQhqVNWqVZbO69mQh0B6A4xyte0YpgZaHgWz93HGzVHdYO0gnwAxoF6rBbEHXjSAo+oGwDcCe/e79qnYPSdoByIRgM44/6UPiwWBa2yzf7uFmfvgsuR9WJCrzoM+RMysEY560O1QEllIeAOamfSlL/oaq4jQ9SiConwQE67X6uiKt7J2NjQXP9WasukSLIa6RTNIQQEj13aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jvd0bTA13j1zceTCtWv/2Yv9SQbo4O06fs4qCS8zQ0=;
 b=M++2ifZoyiUht0TVSbFV3lMJiFFIqUxTcs+FaySV9EQEizbSAqOvJQHSUK+XsgfGFTNV0lCUjoz0YSM2NaX1MGVTxtXjm1yDwaibXtn7dycwsNjoz1WXmMiUC6DBYPbZrDc5ZasTTO7rDrcbkuW1906IOkQsdDtvrBZaejx+Zf9uneTmEAt65cw60ihzyYooT63dL/V9NzkFK60OX737XKPCfqh/boH5asvuTtkZb8R05Et1Pc3C3tzl1ZDHzxwW1W5R5Xzc39v4qIOFDUeyu9NMUoWJn6ULlc9N3FGknTB/fqJwC+6V2yDt/EE+6Z+2BZz/9JEsE0KSwECqzUgc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Jvd0bTA13j1zceTCtWv/2Yv9SQbo4O06fs4qCS8zQ0=;
 b=giw6caZgMcDBDZoeEtxTNZMu2Cwr3StkohQsZhm2quBEoP2BrTil0XRCN+elraFOcHubMin7bF8yAHkHjBbGuk/bFU1sB+rADXpPxeI1iYsUJwgveJUGJTPjlByvtRFjvHTch/58M0ABlTTYwjVuUHaSswFWeSATj54tYo12032pFN4qvO3aWK2Yfu3p3Juf7gnqq+cUXtN2XnGRwjSHedC+03ctLHMs04U5tLJs4fgB19z/h+PUkCrr72FQbbWT4uvTMsoi48kNzFJmgoKbJhMhVvRKJ27Klo24TfyhGD8sW4uTCfCsDd9Xv6H18t8XehxpoX8WQXQv8B67J07lRQ==
From: Michael Kelley <mhklinux@outlook.com>
To: Christoph Hellwig <hch@lst.de>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "petr@tesarici.cz"
	<petr@tesarici.cz>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Topic: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Index: AQHay9fgMpKn4lnf90SYtF8Z1AfgLLHpORSAgAErN7A=
Date: Sun, 7 Jul 2024 02:11:48 +0000
Message-ID:
 <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240701165746.1358-1-mhklinux@outlook.com>
 <20240706055019.GA13280@lst.de>
In-Reply-To: <20240706055019.GA13280@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [DZV6E/3NlpnHAc91A498CCzQ/Jkeeipi]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH3PR02MB10381:EE_
x-ms-office365-filtering-correlation-id: 64cf174e-87b4-46bf-a60b-08dc9e2a2893
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799003|8060799006|102099032|4302099013|3412199025|440099028|56899033|1602099012;
x-microsoft-antispam-message-info:
 MFaHtVYRplTq2A2QuYz1gL9hpvSogb7so0QAm3ObMEpqHzFuzAucvgOjdgCqYZ2JSphYPYBStL7ttMG2Trv8riMNP0nI9dfr+xFhjkb2KzEFJaMZMPcojAqzneJBghwbSgAI419/rBRJ/IyQ5D4BJu+HzmD4ccwTU2xZQpA7FTD70eESJE8W6coV24pMhxUVoS00GKbP/FXwnDWZ0z61gqZCZNIKqsmiSZ7GE/05KbyUwgBtxTuiJMDEcoKsW75oYDnIqrgOY4UOJ5r294dQJgiYZ8DYWgqPu38IIa7zgfqbGFLFE2yNG+A7KW4kObWwtHzSbXyimLKhusIC5Ygh0/T5ctHcKk5Wtwlk/wOWBN8oTuSBKfOY9c6w2zl72QturB+g10/t3TJs53S6eIN00AuXcs4ysEcsRsDxNuPgLqU/yMq+og6udrxUoP6XLZVJph5TXDCVj19uE1uYZ9ntSrgiNgGmOwy2U24hUJD/c6x0cv+cK4cJT22J9sR4r2xP0umgfZE+cpVnWMrHZUBeCpMIWYDvIzTib37YTW9qeG3WcJq5zGVXAHSD2un55Y3Tw6K2usIRYypitc3ELFhOF0GRCRxSpjAGnPdVYBhn7VZTB+1qkNTjYe90i5QyYO23KXV52dVe98CtP28bQQESnSTMhh+r6jG9NiP3lYXASB//YF4ss4wT92FxXAS2Rj9mv0FZIrDbaOKXGBiim5zMjEjwRWAweR+1PchD2GgWRCw67W1TCsh6NWh6j8yaTcqE
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?yI30LpH8L/942PKTdAwTPIuFKyjW9tw+POrJuO0ODmv61j/OaMyJm+lX5Y?=
 =?iso-8859-2?Q?/2OUJbi5Je5m3tsM3/pYRz2/534oj9Mz1sOBOKn374vwHxzkCVe0WEEC+W?=
 =?iso-8859-2?Q?W+Y4wTl/dKUyTFs/1yMbKltrgyNav45ne8GN02OeF3zhcTmXujJYSQ7NCB?=
 =?iso-8859-2?Q?kuU5rDIf1D9WiryT4Ds7PIJ9zU+g6ZZMn18xeTZl79RYmLUdF9tP8+foQ5?=
 =?iso-8859-2?Q?PyTzufe0fXB2Rq04+6xUpA5Vam3IjipbiIb/VJ6HoaTcKa8RQel8ByryNW?=
 =?iso-8859-2?Q?DL7TzPGyNYp207qe8VIsIzNL//yhEywzmbs6X9gv/FqZFrMWPdKRcDlSK4?=
 =?iso-8859-2?Q?3HQqADs6efuKOmwGtEJdOpG5uro7WFnmW3BJtInKQmq8/cOTD3s/gpSpGq?=
 =?iso-8859-2?Q?rA8p8uPo3kQHKtTy/SbCG9Bj2DTQMfuRU7Wy/F3c1HA8q7afOTXHdE8Nh5?=
 =?iso-8859-2?Q?Wh7HfTjhqV4x6b1FKa9xg2RIjDQ3vSE5/x9d97Yi5yC9oHT5r9SFJMDgBu?=
 =?iso-8859-2?Q?kMczY/QOXs7svrQmxD5vlDzn+kci8HzoCyt2JnRt1zioWpLe7h7hxJ0n6i?=
 =?iso-8859-2?Q?YtPaL3f90IOjIAjkt/ZmNYX3BOq6cEw4GP9s6ggVJdDr5MdMIl+oTI8dHU?=
 =?iso-8859-2?Q?gTsDGXUYtCw5ucr3E7OlIuKwjLGI+Yrfx4RVvwIdVJiqt74MwBcG82WB8X?=
 =?iso-8859-2?Q?M085WTUW7dmXa8uSDfwwOm8KyxyAkL/tdK8n2VGvP2aH/4x321qJLo/PAZ?=
 =?iso-8859-2?Q?UZW9LACHQTF0DtK7L8A1DTIgH+91XtmS5W5BdTi8kErU/UjkPu6ZuX4tCU?=
 =?iso-8859-2?Q?LFfz2oxqfX0pntsv+TvMXIDeFPZXHkHwG/nP6mo9HREzwT7JQQFuZOJzyg?=
 =?iso-8859-2?Q?7e48c6ObgOW6UAk4q21gFpgL8w/84BzqT/93U7nQbFXtdz8zNEzZBNOI6f?=
 =?iso-8859-2?Q?c80LKvEdJqse07phPV14BIwR9FK+Kkok56VZIPEbFeG9elZ/uBc0qavmj7?=
 =?iso-8859-2?Q?Slcwo2ee86+x1iGPy+/KYmliuHx+hzKfbZxe5EnKtsb6waLh7bfKpk4Llj?=
 =?iso-8859-2?Q?7PJgi0Qhu4j1JU0zX9fEtFJo8HKxw6Ut7fwt6cpt2SW8skZsPOwmd4HCAQ?=
 =?iso-8859-2?Q?87RgkZJHqgxRwYbHG1PYKOQWho1+xpxCwB9o4vaDOHLndoZ4djOPyTj/Mq?=
 =?iso-8859-2?Q?8E/3CGTs7eI9iFCIov/TSwheXy0RDq+90f4Sad86VMO85FQCQiXKCD0vzw?=
 =?iso-8859-2?Q?DjWUF1FknFbDvrRAGESS6Zs8YlG6vmcxR4hH2i0IU=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cf174e-87b4-46bf-a60b-08dc9e2a2893
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2024 02:11:48.5826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB10381

From: Christoph Hellwig <hch@lst.de> Sent: Friday, July 5, 2024 10:50 PM
>=20
> Hi Michael,
>=20
> I like the idea behind this, but can you respin it to avoid some of
> the added code duplication.  We have a lot of this pattern:
>=20
> 	pool =3D swiotlb_find_pool(dev, paddr);
> 	if (pool)
> 		swiotlb_foo(dev, ...
>=20
> duplicated in all three swiotlb users.  If we rename the original
> swiotlb_foo to __swiotlb_foo and add a little inline wrapper this is
> de-duplicated and also avoids exposing swiotlb_find_pool to the
> callers.

This works pretty well. It certainly avoids the messiness of declaring
a "pool" local variable and needing a separate assignment before the
"if" statement, in each of the 9 call sites. The small downside is that
it looks like a swiotlb function is called every time, even though
there's usually an inline bailout. But that pattern occurs throughout
the kernel, so not a big deal.

I initially coded this change as a separate patch that goes first. But
the second patch ends up changing about 20 lines that are changed
by the first patch. It's hard to cleanly tease them apart. So I've gone
back to a single unified patch. But let me know if you think it's worth
the extra churn to break them apart.

>=20
> If we then stub out swiotlb_find_pool to return NULL for !CONFIG_SWIOTLB,
> we also don't need extra stubs for all the __swiotlb_ helpers as the
> compiler will eliminate the calls as dead code.

Yes, this works as long as the declarations for the __swiotlb_foo
functions are *not* under CONFIG_SWIOTLB. But when compiling with
!CONFIG_SWIOTLB on arm64 with gcc-8.5.0, two tangentially related
compile errors occur. iommu_dma_map_page() references
swiotlb_tlb_map_single(). The declaration for the latter is under
CONFIG_SWIOTLB. A similar problem occurs with dma_direct_map_page()
and swiotlb_map(). Do later versions of gcc not complain when the
reference is in dead code? Or are these just bugs that occurred because
!CONFIG_SWIOTLB is rare? If the latter, I can submit a separate patch to
move the declarations out from under CONFIG_SWIOTLB.

>=20
> I might be missing something, but what is the reason for using the
> lower-level __swiotlb_find_pool in swiotlb_map and xen_swiotlb_map_page?
> I can't see a reason why the simple checks in swiotlb_find_pool itself
> are either wrong or a performance problem there. =20

Yes, swiotlb_find_pool() could be used instead of __swiotlb_find_pool().

> Because if we don't
> need these separate calls we can do away with __swiotlb_find_pool
> for !CONFIG_SWIOTLB_DYNAMIC and simplify swiotlb_find_pool quite
> a bit like this:
>=20
> 	...
>=20
> 	if (!mem)
> 		return NULL;
>=20
> 	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) {

The "IS_ENABLED" doesn't work because the dma_uses_io_tlb
field in struct dev is under CONFIG_SWIOTLB_DYNAMIC. I guess
it could be moved out, but that's going further afield. So I'm back
to using #ifdef.

> 		smp_rmb();
> 		if (!READ_ONCE(dev->dma_uses_io_tlb))
> 			return NULL;
> 		return __swiotlb_find_pool(dev, paddr);
> 	}
>=20
> 	if (paddr < mem->defpool.start || paddr >=3D mem->defpool.end)
> 		return NULL;
> 	return &dev->dma_io_tlb_mem->defpool;

Petr Tesa=F8=EDk had commented [1] on my original RFC suggesting that
__swiotlb_find_pool() be used here instead of open coding it. With
the changes you suggest, __swiotlb_find_pool() is needed only in
the CONFIG_SWIOTLB_DYNAMIC case, and I would be fine with just
open coding the address of defpool here. Petr -- are you OK with
removing __swiotlb_find_pool when !CONFIG_SWIOTLB_DYNAMIC,
since this is the only place it would be used?

>=20
>=20
> While you're at it please fix the > 80 character lines as this patch
> is adding plenty.

Many cases already go away with your first suggestion above,
but I'll fix the others.

Michael

[1] https://lore.kernel.org/linux-iommu/20240627092049.1dbec746@meshulam.te=
sarici.cz/

