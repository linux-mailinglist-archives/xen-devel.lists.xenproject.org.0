Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C71919B79
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 01:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749568.1157766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMcWs-0003iL-E8; Wed, 26 Jun 2024 23:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749568.1157766; Wed, 26 Jun 2024 23:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMcWs-0003fm-At; Wed, 26 Jun 2024 23:58:22 +0000
Received: by outflank-mailman (input) for mailman id 749568;
 Wed, 26 Jun 2024 23:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOWq=N4=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sMcWq-0003fa-7g
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 23:58:20 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn20814.outbound.protection.outlook.com
 [2a01:111:f403:2c07::814])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f496da10-3417-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 01:58:17 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by MN2PR02MB6670.namprd02.prod.outlook.com (2603:10b6:208:1d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Wed, 26 Jun
 2024 23:58:13 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%2]) with mapi id 15.20.7698.033; Wed, 26 Jun 2024
 23:58:13 +0000
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
X-Inumbo-ID: f496da10-3417-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahLkasJFAspFnCgLqc6aoGKaMIavgBQ7FdfUUTtCC30jelE1SAkDAzq6FPNjcwVEhgUqQywPswey7ZUzCL5rK+NXBz0NliRqP6q+G3dtvJe63Ip/HpOnupW+9kF6vopDa2s5ofZ2juutjU89S92tClCbRvMkDliF6b5hpdN3Fryxe40ck4mCqUurkG5igxVrPd3oxoJEcHebjfGNIulx5bHXvnN5vkecF575sADxBKRSYvdwpphC7Dnb0hr9KI/8PybDQchZmJyGp4Nc43T9I+BQvl82iJTEkbSeama/ruyrPHcnI+h1ngTpo+x90srTXn1Mft5xrxyUhUQj2dvb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM+VDqTSws8f4noYqx/nxSpJLlkj6C6J5sQyhdpS160=;
 b=QbbISkDsvG1hqxmV0W7O3AoD1xB4WucxQymJqDuvjN9ZgaoWwdDGiX3e4w1Uv/BWEgXoRWJ2xHOnaH854SQ5JuV284F85QzNh5Tjtf/4IijxI+1bmOAjPEmSBY54C6CoESgB2jZX2B873cxUdWAxRXMTpQnsfDCfYGXX+P/22aOFStY/2EK9/nRsfkSVj8dVrvQa8DatIVYRxAtM0I8S51zCbPcNWCt/XfX4/UP/Lqah8KEjARZwZUBGvSK41e/TfzubzhFBCOIQwXs8O9vGhxnC515S5mmVTFkZNXOfDRLqYzswBrqt9ZUXe/LLVEPovkorhgIc94R8BEzK/qK2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM+VDqTSws8f4noYqx/nxSpJLlkj6C6J5sQyhdpS160=;
 b=PWMWlCDh5YAHjertGAugiMHogAk+EPdWe9+Ek8643jsU3JX2AZpbncEB+bi/Jb/ZFoIh34hS3pwV1Mi8jJyMR8+wqK9Bqv4UyulONRLmNivq7hyRHXPl3CKSpygHOrE84ri0aLpHJh/tb/nivYzyvyUKemaRBdVoDC5IFArANsIazdrwD0RfzoOHdaJTAfrUGctGwhjjuHd1SGO/AjbsJxN4uVXIaxHyU9IG4QNDRK6U1E05043L5IOo8vEBfMxhU3mmUVGG96aHdRHP38+1XP+ZH1oDhTT8K5iTaIIXIGm9CNc1vYsaGkaGGpe7mKFepcCOO5SMNLgobonb+4G3tQ==
From: Michael Kelley <mhklinux@outlook.com>
To: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, "hch@lst.de"
	<hch@lst.de>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"petr@tesarici.cz" <petr@tesarici.cz>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Topic: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Index: AQHauIjoJBWSrCyO6UWzcncSceBiMLHa1Z9w
Date: Wed, 26 Jun 2024 23:58:13 +0000
Message-ID:
 <SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
In-Reply-To: <20240607031421.182589-1-mhklinux@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [l5ljiyiz4abjBC6x5j2Rf1wSkbLh+Pxz]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|MN2PR02MB6670:EE_
x-ms-office365-filtering-correlation-id: d26794d7-9b34-4ffe-0305-08dc963bd706
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 rVxtpu++W8LdWkbNJ0ETUhp3izfK+XCHyizf93lu/SvamZKTN5FBL8+81bKlpJcWhJwAD71GPwA2MKM4VARMZ1FENNhEsJUCsCRD80+SWn7/TuEXDFAVapw7Velyq2p1dOXILXcTWSdcHAcmCGzOUJ40F45d/DEjVy+mbBPR8C9Y2a6cYX8CobRsQcn5svMZ7InXflEH599xEA1MvUW3+ToTptXY0ACujLLGDWqVeQEQh3+96TZ+0wRcq7Tz6cNfb3MUwEaQHncOdLTtE3qK1olkAZ3qrn66BbaWLB8L1xHYQND3UZKnAvUSm+JpnQRDlGDd8zRHI0sfkKsvfQTZLRPMNU1+YLd1gWYW+ssyWF4MKzuM9AkMDLcChumRUvhuokjAdtfhoqKlT514rllQWJKmDaiaiqRNSHtxLwfhuOH7+M7iztUzxB53QSFkxrTI/4OYc4YxJHFiQzhrmdc0wPBWcj2/+mty7Xd1CFu6RBSNQzHZ5WhhrBLzcUbcnZpnun8lSoyqVfZauTUnvVyyK1Yp7YlS1f/J3xsMjWByrz8W07c7Reqks7MROKLoolxU
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sBD0/CPHkvX1N8CQ+E52jfnUl7Wgz4/yPzG/lhm88g7ZssEmSxbRfxA1HAoe?=
 =?us-ascii?Q?nMpX3ttzWWOhklilzDrjgpHdNSjdxF63DzKGlCLpBkqbK35JjjLpp5ByKv4i?=
 =?us-ascii?Q?TT0NhVehQZGWAJorC682EW6I9FA/9jYDdsXENirsnb6awDl6SS/cFTmAoOM/?=
 =?us-ascii?Q?GwrzuNevENvRs+UwS2G4A7PF+LYa6E44fyQ2N4gZkw1MfGuqBN9PrgRaiwMN?=
 =?us-ascii?Q?g3OIKtWr9MiywAA856jg7pJRG5KZ9VfMynV5o3k+4sA4C8AnpFpfm+KoOvb9?=
 =?us-ascii?Q?JH3EwP8xJ9KxI165tRSxSXw1Gkytwg58qG1yXBIox0Mk5tQdlGJJmR5jSW4x?=
 =?us-ascii?Q?qdhHDiGHCQw0m3NZgexcqCC45s3/6RK+K81yok1FDqX7mFqltpiT2TPe5SO1?=
 =?us-ascii?Q?gZnAnEJB3YkhRiKWlqoE4+4mYd/YFje/BVZ9Mj7vFjOdri/mS1eR3Ts6qvAj?=
 =?us-ascii?Q?w1M2Zj5BZt6tkWq9LyU594obIjn5BXOAG18biLBzN5rfccyTciyZVq0FgG17?=
 =?us-ascii?Q?6oPAZzpskKmy+l231TcZASU6NSyNMMMcIhliDkWo2ZoOX3nPHqqqEQk8g4O6?=
 =?us-ascii?Q?FHisXmOGbYwzple/A5QrsN8rxqCIpZseC6haIKCVQEe+oJWADxIC/Uwii8Ql?=
 =?us-ascii?Q?STmDgZfeVL0hKpmy0q2aIk74ASXleOhF/seUFrf4JuNuMyb74f7YrW/LXDnP?=
 =?us-ascii?Q?dfqH9ds9uKe9vwKlK4/sIR3/ak2r9JbUL5yJcAWFkUzDXIgK+GEkjx8w/JNr?=
 =?us-ascii?Q?8XfUqOA5FUzGpIpmRi6PBLneysuQ4covvO8LNnf5z6IW2CujiQ4EWjLv3vyH?=
 =?us-ascii?Q?cpMZ4SCH715G++tlNyyMX45lrhrp0p4NOVpNlD50VyE1M645RUyXyj/B7vWK?=
 =?us-ascii?Q?1z/xDFWhjVA1dve3Eb1IOqXLRyWhEs+P/Flvo594IppAqbKKfw/LHdtoadrr?=
 =?us-ascii?Q?WHQ4+roCTfKidc50B3UF/ksyfpXQYOm/kkOBKxaOwnk4mz63tnZzTBgA28oR?=
 =?us-ascii?Q?udrmbXNQo5NML4kEeK34ZzUEbIhAd8My49u88+gStmdNb7Od5Qolr85LEZA0?=
 =?us-ascii?Q?xu7zTvo3XZ6JianA/shOBaSkxBysUapYAXSTDDnorObXpzWbMbmcAAnppkPq?=
 =?us-ascii?Q?mBqv/Tp500QlUxwC6puknFcEiZpMsyqx1qy9hAyUOO975Wa9ftltabsAAzYY?=
 =?us-ascii?Q?zDHJYviU9I97P0ECYVGcRbLhGiXL+lfGzbmq8pYybZUQTWzUob+VCli8Qx0?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d26794d7-9b34-4ffe-0305-08dc963bd706
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 23:58:13.3871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6670

From: mhkelley58@gmail.com <mhkelley58@gmail.com> Sent: Thursday, June 6, 2=
024 8:14 PM
>=20
> With CONFIG_SWIOTLB_DYNAMIC enabled, each round-trip map/unmap pair
> in the swiotlb results in 6 calls to swiotlb_find_pool(). In multiple
> places, the pool is found and used in one function, and then must
> found again in the next function that is called because only the
> tlb_addr is passed as an argument. These are the six call sites:
>=20
> dma_direct_map_page:
> 1. swiotlb_map->swiotlb_tbl_map_single->swiotlb_bounce
>=20
> dma_direct_unmap_page:
> 2. dma_direct_sync_single_for_cpu->is_swiotlb_buffer
> 3. dma_direct_sync_single_for_cpu->swiotlb_sync_single_for_cpu->
> 	swiotlb_bounce
> 4. is_swiotlb_buffer
> 5. swiotlb_tbl_unmap_single->swiotlb_del_transient
> 6. swiotlb_tbl_unmap_single->swiotlb_release_slots
>=20
> Reduce the number of calls by finding the pool at a higher level, and
> passing it as an argument instead of searching again. A key change is
> for is_swiotlb_buffer() to return a pool pointer instead of a boolean,
> and then pass this pool pointer to subsequent swiotlb functions.
> With these changes, a round-trip map/unmap pair requires only 2 calls
> to swiotlb_find_pool():
>=20
> dma_direct_unmap_page:
> 1. dma_direct_sync_single_for_cpu->is_swiotlb_buffer
> 2. is_swiotlb_buffer
>=20
> These changes come from noticing the inefficiencies in a code review,
> not from performance measurements. With CONFIG_SWIOTLB_DYNAMIC,
> swiotlb_find_pool() is not trivial, and it uses an RCU read lock,
> so avoiding the redundant calls helps performance in a hot path.
> When CONFIG_SWIOTLB_DYNAMIC is *not* set, the code size reduction
> is minimal and the perf benefits are likely negligible, but no
> harm is done.
>=20
> No functional change is intended.
>=20
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> This patch trades off making many of the core swiotlb APIs take
> an additional argument in order to avoid duplicating calls to
> swiotlb_find_pool(). The current code seems rather wasteful in
> making 6 calls per round-trip, but I'm happy to accept others'
> judgment as to whether getting rid of the waste is worth the
> additional code complexity.

Quick ping on this RFC.  Is there any interest in moving forward?
Quite a few lines of code are affected because of adding the
additional "pool" argument to several functions, but the change
is conceptually pretty simple.

Michael

>=20
>  drivers/iommu/dma-iommu.c | 27 ++++++++++++++------
>  drivers/xen/swiotlb-xen.c | 25 +++++++++++-------
>  include/linux/swiotlb.h   | 54 +++++++++++++++++++++------------------
>  kernel/dma/direct.c       | 12 ++++++---
>  kernel/dma/direct.h       | 18 ++++++++-----
>  kernel/dma/swiotlb.c      | 43 ++++++++++++++++---------------
>  6 files changed, 106 insertions(+), 73 deletions(-)
>=20
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index f731e4b2a417..ab6bc37ecf90 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1073,6 +1073,7 @@ static void iommu_dma_sync_single_for_cpu(struct de=
vice *dev,
>  		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t phys;
> +	struct io_tlb_pool *pool;
>=20
>  	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
>  		return;
> @@ -1081,21 +1082,25 @@ static void iommu_dma_sync_single_for_cpu(struct =
device *dev,
>  	if (!dev_is_dma_coherent(dev))
>  		arch_sync_dma_for_cpu(phys, size, dir);
>=20
> -	if (is_swiotlb_buffer(dev, phys))
> -		swiotlb_sync_single_for_cpu(dev, phys, size, dir);
> +	pool =3D is_swiotlb_buffer(dev, phys);
> +	if (pool)
> +		swiotlb_sync_single_for_cpu(dev, phys, size, dir, pool);
>  }
>=20
>  static void iommu_dma_sync_single_for_device(struct device *dev,
>  		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t phys;
> +	struct io_tlb_pool *pool;
>=20
>  	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
>  		return;
>=20
>  	phys =3D iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
> -	if (is_swiotlb_buffer(dev, phys))
> -		swiotlb_sync_single_for_device(dev, phys, size, dir);
> +
> +	pool =3D is_swiotlb_buffer(dev, phys);
> +	if (pool)
> +		swiotlb_sync_single_for_device(dev, phys, size, dir, pool);
>=20
>  	if (!dev_is_dma_coherent(dev))
>  		arch_sync_dma_for_device(phys, size, dir);
> @@ -1189,8 +1194,12 @@ static dma_addr_t iommu_dma_map_page(struct device=
 *dev, struct page *page,
>  		arch_sync_dma_for_device(phys, size, dir);
>=20
>  	iova =3D __iommu_dma_map(dev, phys, size, prot, dma_mask);
> -	if (iova =3D=3D DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
> -		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
> +	if (iova =3D=3D DMA_MAPPING_ERROR) {
> +		struct io_tlb_pool *pool =3D is_swiotlb_buffer(dev, phys);
> +
> +		if (pool)
> +			swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs, pool);
> +	}
>  	return iova;
>  }
>=20
> @@ -1199,6 +1208,7 @@ static void iommu_dma_unmap_page(struct device *dev=
, dma_addr_t dma_handle,
>  {
>  	struct iommu_domain *domain =3D iommu_get_dma_domain(dev);
>  	phys_addr_t phys;
> +	struct io_tlb_pool *pool;
>=20
>  	phys =3D iommu_iova_to_phys(domain, dma_handle);
>  	if (WARN_ON(!phys))
> @@ -1209,8 +1219,9 @@ static void iommu_dma_unmap_page(struct device *dev=
, dma_addr_t dma_handle,
>=20
>  	__iommu_dma_unmap(dev, dma_handle, size);
>=20
> -	if (unlikely(is_swiotlb_buffer(dev, phys)))
> -		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
> +	pool =3D is_swiotlb_buffer(dev, phys);
> +	if (unlikely(pool))
> +		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs, pool);
>  }
>=20
>  /*
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 6579ae3f6dac..7af8c8466e1d 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -88,7 +88,7 @@ static inline int range_straddles_page_boundary(phys_ad=
dr_t p, size_t size)
>  	return 0;
>  }
>=20
> -static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr=
)
> +static struct io_tlb_pool *is_xen_swiotlb_buffer(struct device *dev, dma=
_addr_t dma_addr)
>  {
>  	unsigned long bfn =3D XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
>  	unsigned long xen_pfn =3D bfn_to_local_pfn(bfn);
> @@ -100,7 +100,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, =
dma_addr_t dma_addr)
>  	 */
>  	if (pfn_valid(PFN_DOWN(paddr)))
>  		return is_swiotlb_buffer(dev, paddr);
> -	return 0;
> +	return NULL;
>  }
>=20
>  #ifdef CONFIG_X86
> @@ -228,7 +228,8 @@ static dma_addr_t xen_swiotlb_map_page(struct device =
*dev, struct page *page,
>  	 */
>  	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
>  		swiotlb_tbl_unmap_single(dev, map, size, dir,
> -				attrs | DMA_ATTR_SKIP_CPU_SYNC);
> +				attrs | DMA_ATTR_SKIP_CPU_SYNC,
> +				swiotlb_find_pool(dev, map));
>  		return DMA_MAPPING_ERROR;
>  	}
>=20
> @@ -254,6 +255,7 @@ static void xen_swiotlb_unmap_page(struct device *hwd=
ev, dma_addr_t dev_addr,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	phys_addr_t paddr =3D xen_dma_to_phys(hwdev, dev_addr);
> +	struct io_tlb_pool *pool;
>=20
>  	BUG_ON(dir =3D=3D DMA_NONE);
>=20
> @@ -265,8 +267,9 @@ static void xen_swiotlb_unmap_page(struct device *hwd=
ev, dma_addr_t dev_addr,
>  	}
>=20
>  	/* NOTE: We use dev_addr here, not paddr! */
> -	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
> -		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs);
> +	pool =3D is_xen_swiotlb_buffer(hwdev, dev_addr);
> +	if (pool)
> +		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs, pool);
>  }
>=20
>  static void
> @@ -274,6 +277,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, d=
ma_addr_t dma_addr,
>  		size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t paddr =3D xen_dma_to_phys(dev, dma_addr);
> +	struct io_tlb_pool *pool;
>=20
>  	if (!dev_is_dma_coherent(dev)) {
>  		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
> @@ -282,8 +286,9 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, d=
ma_addr_t dma_addr,
>  			xen_dma_sync_for_cpu(dev, dma_addr, size, dir);
>  	}
>=20
> -	if (is_xen_swiotlb_buffer(dev, dma_addr))
> -		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
> +	pool =3D is_xen_swiotlb_buffer(dev, dma_addr);
> +	if (pool)
> +		swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
>  }
>=20
>  static void
> @@ -291,9 +296,11 @@ xen_swiotlb_sync_single_for_device(struct device *de=
v, dma_addr_t dma_addr,
>  		size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t paddr =3D xen_dma_to_phys(dev, dma_addr);
> +	struct io_tlb_pool *pool;
>=20
> -	if (is_xen_swiotlb_buffer(dev, dma_addr))
> -		swiotlb_sync_single_for_device(dev, paddr, size, dir);
> +	pool =3D is_xen_swiotlb_buffer(dev, dma_addr);
> +	if (pool)
> +		swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
>=20
>  	if (!dev_is_dma_coherent(dev)) {
>  		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 14bc10c1bb23..ce8651949123 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -42,24 +42,6 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	int (*remap)(void *tlb, unsigned long nslabs));
>  extern void __init swiotlb_update_mem_attributes(void);
>=20
> -phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phy=
s,
> -		size_t mapping_size,
> -		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
> -		unsigned long attrs);
> -
> -extern void swiotlb_tbl_unmap_single(struct device *hwdev,
> -				     phys_addr_t tlb_addr,
> -				     size_t mapping_size,
> -				     enum dma_data_direction dir,
> -				     unsigned long attrs);
> -
> -void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_=
addr,
> -		size_t size, enum dma_data_direction dir);
> -void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_add=
r,
> -		size_t size, enum dma_data_direction dir);
> -dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
> -		size_t size, enum dma_data_direction dir, unsigned long attrs);
> -
>  #ifdef CONFIG_SWIOTLB
>=20
>  /**
> @@ -168,12 +150,12 @@ static inline struct io_tlb_pool *swiotlb_find_pool=
(struct device *dev,
>   * * %true if @paddr points into a bounce buffer
>   * * %false otherwise
>   */
> -static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t pad=
dr)
> +static inline struct io_tlb_pool *is_swiotlb_buffer(struct device *dev, =
phys_addr_t paddr)
>  {
>  	struct io_tlb_mem *mem =3D dev->dma_io_tlb_mem;
>=20
>  	if (!mem)
> -		return false;
> +		return NULL;
>=20
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>  	/*
> @@ -187,10 +169,13 @@ static inline bool is_swiotlb_buffer(struct device =
*dev, phys_addr_t paddr)
>  	 * This barrier pairs with smp_mb() in swiotlb_find_slots().
>  	 */
>  	smp_rmb();
> -	return READ_ONCE(dev->dma_uses_io_tlb) &&
> -		swiotlb_find_pool(dev, paddr);
> +	if (READ_ONCE(dev->dma_uses_io_tlb))
> +		return swiotlb_find_pool(dev, paddr);
> +	return NULL;
>  #else
> -	return paddr >=3D mem->defpool.start && paddr < mem->defpool.end;
> +	if (paddr >=3D mem->defpool.start && paddr < mem->defpool.end)
> +		return &mem->defpool;
> +	return NULL;
>  #endif
>  }
>=20
> @@ -201,6 +186,25 @@ static inline bool is_swiotlb_force_bounce(struct de=
vice *dev)
>  	return mem && mem->force_bounce;
>  }
>=20
> +phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phy=
s,
> +		size_t mapping_size,
> +		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
> +		unsigned long attrs);
> +
> +extern void swiotlb_tbl_unmap_single(struct device *hwdev,
> +				     phys_addr_t tlb_addr,
> +				     size_t mapping_size,
> +				     enum dma_data_direction dir,
> +				     unsigned long attrs,
> +				     struct io_tlb_pool *pool);
> +
> +void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_=
addr,
> +		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool);
> +void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_add=
r,
> +		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool);
> +dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs);
> +
>  void swiotlb_init(bool addressing_limited, unsigned int flags);
>  void __init swiotlb_exit(void);
>  void swiotlb_dev_init(struct device *dev);
> @@ -219,9 +223,9 @@ static inline void swiotlb_dev_init(struct device *de=
v)
>  {
>  }
>=20
> -static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t pad=
dr)
> +static inline struct io_tlb_pool *is_swiotlb_buffer(struct device *dev, =
phys_addr_t paddr)
>  {
> -	return false;
> +	return NULL;
>  }
>  static inline bool is_swiotlb_force_bounce(struct device *dev)
>  {
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4d543b1e9d57..50689afb0ffd 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -399,14 +399,16 @@ void dma_direct_sync_sg_for_device(struct device *d=
ev,
>  		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
>  {
>  	struct scatterlist *sg;
> +	struct io_tlb_pool *pool;
>  	int i;
>=20
>  	for_each_sg(sgl, sg, nents, i) {
>  		phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));
>=20
> -		if (unlikely(is_swiotlb_buffer(dev, paddr)))
> +		pool =3D is_swiotlb_buffer(dev, paddr);
> +		if (unlikely(pool))
>  			swiotlb_sync_single_for_device(dev, paddr, sg->length,
> -						       dir);
> +						       dir, pool);
>=20
>  		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_device(paddr, sg->length,
> @@ -422,6 +424,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>  		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
>  {
>  	struct scatterlist *sg;
> +	struct io_tlb_pool *pool;
>  	int i;
>=20
>  	for_each_sg(sgl, sg, nents, i) {
> @@ -430,9 +433,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>  		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_cpu(paddr, sg->length, dir);
>=20
> -		if (unlikely(is_swiotlb_buffer(dev, paddr)))
> +		pool =3D is_swiotlb_buffer(dev, paddr);
> +		if (unlikely(pool))
>  			swiotlb_sync_single_for_cpu(dev, paddr, sg->length,
> -						    dir);
> +						    dir, pool);
>=20
>  		if (dir =3D=3D DMA_FROM_DEVICE)
>  			arch_dma_mark_clean(paddr, sg->length);
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 18d346118fe8..72aa65558e07 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -57,9 +57,11 @@ static inline void dma_direct_sync_single_for_device(s=
truct device *dev,
>  		dma_addr_t addr, size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t paddr =3D dma_to_phys(dev, addr);
> +	struct io_tlb_pool *pool;
>=20
> -	if (unlikely(is_swiotlb_buffer(dev, paddr)))
> -		swiotlb_sync_single_for_device(dev, paddr, size, dir);
> +	pool =3D is_swiotlb_buffer(dev, paddr);
> +	if (unlikely(pool))
> +		swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
>=20
>  	if (!dev_is_dma_coherent(dev))
>  		arch_sync_dma_for_device(paddr, size, dir);
> @@ -69,14 +71,16 @@ static inline void dma_direct_sync_single_for_cpu(str=
uct device *dev,
>  		dma_addr_t addr, size_t size, enum dma_data_direction dir)
>  {
>  	phys_addr_t paddr =3D dma_to_phys(dev, addr);
> +	struct io_tlb_pool *pool;
>=20
>  	if (!dev_is_dma_coherent(dev)) {
>  		arch_sync_dma_for_cpu(paddr, size, dir);
>  		arch_sync_dma_for_cpu_all();
>  	}
>=20
> -	if (unlikely(is_swiotlb_buffer(dev, paddr)))
> -		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
> +	pool =3D is_swiotlb_buffer(dev, paddr);
> +	if (unlikely(pool))
> +		swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
>=20
>  	if (dir =3D=3D DMA_FROM_DEVICE)
>  		arch_dma_mark_clean(paddr, size);
> @@ -117,12 +121,14 @@ static inline void dma_direct_unmap_page(struct dev=
ice *dev, dma_addr_t addr,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	phys_addr_t phys =3D dma_to_phys(dev, addr);
> +	struct io_tlb_pool *pool;
>=20
>  	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
>  		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
>=20
> -	if (unlikely(is_swiotlb_buffer(dev, phys)))
> +	pool =3D is_swiotlb_buffer(dev, phys);
> +	if (unlikely(pool))
>  		swiotlb_tbl_unmap_single(dev, phys, size, dir,
> -					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
> +					 attrs | DMA_ATTR_SKIP_CPU_SYNC, pool);
>  }
>  #endif /* _KERNEL_DMA_DIRECT_H */
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index fe1ccb53596f..59b3e333651d 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -855,9 +855,8 @@ static unsigned int swiotlb_align_offset(struct devic=
e *dev,
>   * Bounce: copy the swiotlb buffer from or back to the original dma loca=
tion
>   */
>  static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, siz=
e_t size,
> -			   enum dma_data_direction dir)
> +			   enum dma_data_direction dir, struct io_tlb_pool *mem)
>  {
> -	struct io_tlb_pool *mem =3D swiotlb_find_pool(dev, tlb_addr);
>  	int index =3D (tlb_addr - mem->start) >> IO_TLB_SHIFT;
>  	phys_addr_t orig_addr =3D mem->slots[index].orig_addr;
>  	size_t alloc_size =3D mem->slots[index].alloc_size;
> @@ -1435,13 +1434,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device =
*dev, phys_addr_t orig_addr,
>  	 * hardware behavior.  Use of swiotlb is supposed to be transparent,
>  	 * i.e. swiotlb must not corrupt memory by clobbering unwritten bytes.
>  	 */
> -	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
> +	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE, pool);
>  	return tlb_addr;
>  }
>=20
> -static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_ad=
dr)
> +static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_ad=
dr,
> +				  struct io_tlb_pool *mem)
>  {
> -	struct io_tlb_pool *mem =3D swiotlb_find_pool(dev, tlb_addr);
>  	unsigned long flags;
>  	unsigned int offset =3D swiotlb_align_offset(dev, 0, tlb_addr);
>  	int index, nslots, aindex;
> @@ -1505,11 +1504,9 @@ static void swiotlb_release_slots(struct device *d=
ev, phys_addr_t tlb_addr)
>   *
>   * Return: %true if @tlb_addr belonged to a transient pool that was rele=
ased.
>   */
> -static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_ad=
dr)
> +static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_ad=
dr,
> +				  struct io_tlb_pool *pool)
>  {
> -	struct io_tlb_pool *pool;
> -
> -	pool =3D swiotlb_find_pool(dev, tlb_addr);
>  	if (!pool->transient)
>  		return false;
>=20
> @@ -1522,7 +1519,8 @@ static bool swiotlb_del_transient(struct device *de=
v, phys_addr_t tlb_addr)
>  #else  /* !CONFIG_SWIOTLB_DYNAMIC */
>=20
>  static inline bool swiotlb_del_transient(struct device *dev,
> -					 phys_addr_t tlb_addr)
> +					 phys_addr_t tlb_addr,
> +					 struct io_tlb_pool *pool)
>  {
>  	return false;
>  }
> @@ -1534,34 +1532,34 @@ static inline bool swiotlb_del_transient(struct d=
evice *dev,
>   */
>  void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
>  			      size_t mapping_size, enum dma_data_direction dir,
> -			      unsigned long attrs)
> +			      unsigned long attrs, struct io_tlb_pool *pool)
>  {
>  	/*
>  	 * First, sync the memory before unmapping the entry
>  	 */
>  	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
>  	    (dir =3D=3D DMA_FROM_DEVICE || dir =3D=3D DMA_BIDIRECTIONAL))
> -		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
> +		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE, pool);
>=20
> -	if (swiotlb_del_transient(dev, tlb_addr))
> +	if (swiotlb_del_transient(dev, tlb_addr, pool))
>  		return;
> -	swiotlb_release_slots(dev, tlb_addr);
> +	swiotlb_release_slots(dev, tlb_addr, pool);
>  }
>=20
>  void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_=
addr,
> -		size_t size, enum dma_data_direction dir)
> +		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool)
>  {
>  	if (dir =3D=3D DMA_TO_DEVICE || dir =3D=3D DMA_BIDIRECTIONAL)
> -		swiotlb_bounce(dev, tlb_addr, size, DMA_TO_DEVICE);
> +		swiotlb_bounce(dev, tlb_addr, size, DMA_TO_DEVICE, pool);
>  	else
>  		BUG_ON(dir !=3D DMA_FROM_DEVICE);
>  }
>=20
>  void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_add=
r,
> -		size_t size, enum dma_data_direction dir)
> +		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool)
>  {
>  	if (dir =3D=3D DMA_FROM_DEVICE || dir =3D=3D DMA_BIDIRECTIONAL)
> -		swiotlb_bounce(dev, tlb_addr, size, DMA_FROM_DEVICE);
> +		swiotlb_bounce(dev, tlb_addr, size, DMA_FROM_DEVICE, pool);
>  	else
>  		BUG_ON(dir !=3D DMA_TO_DEVICE);
>  }
> @@ -1586,7 +1584,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_add=
r_t paddr, size_t size,
>  	dma_addr =3D phys_to_dma_unencrypted(dev, swiotlb_addr);
>  	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
>  		swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
> -			attrs | DMA_ATTR_SKIP_CPU_SYNC);
> +			attrs | DMA_ATTR_SKIP_CPU_SYNC,
> +			swiotlb_find_pool(dev, swiotlb_addr));
>  		dev_WARN_ONCE(dev, 1,
>  			"swiotlb addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
>  			&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> @@ -1774,11 +1773,13 @@ struct page *swiotlb_alloc(struct device *dev, si=
ze_t size)
>  bool swiotlb_free(struct device *dev, struct page *page, size_t size)
>  {
>  	phys_addr_t tlb_addr =3D page_to_phys(page);
> +	struct io_tlb_pool *pool;
>=20
> -	if (!is_swiotlb_buffer(dev, tlb_addr))
> +	pool =3D is_swiotlb_buffer(dev, tlb_addr);
> +	if (!pool)
>  		return false;
>=20
> -	swiotlb_release_slots(dev, tlb_addr);
> +	swiotlb_release_slots(dev, tlb_addr, pool);
>=20
>  	return true;
>  }
> --
> 2.25.1
>=20


