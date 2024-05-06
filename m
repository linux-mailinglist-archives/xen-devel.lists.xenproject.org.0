Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDD18BD159
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717718.1120189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s402f-000127-6h; Mon, 06 May 2024 15:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717718.1120189; Mon, 06 May 2024 15:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s402f-0000zK-3A; Mon, 06 May 2024 15:14:13 +0000
Received: by outflank-mailman (input) for mailman id 717718;
 Mon, 06 May 2024 15:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UTOr=MJ=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1s402d-0000xq-MA
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:14:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn20801.outbound.protection.outlook.com
 [2a01:111:f403:2805::801])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44cdc2fa-0bbb-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 17:14:02 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO1PR02MB8361.namprd02.prod.outlook.com (2603:10b6:303:150::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 15:14:05 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%2]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 15:14:05 +0000
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
X-Inumbo-ID: 44cdc2fa-0bbb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaeiV0VKL/k2Yv4fKGGwEssr80vJINOXq6m1xDPFjQuWBb21gbLJrK68jx+KlY1G28AN2l5hRO5/YREmNhMnBTd1q/MwkNXoUws2pM2P7k/bwUs9gWPU6nfjvYq5HsMJK/fxckIiuS2spNPydiuQ+NWcmyqqVzidrlJpd560LQBGNF2at4JnYMvpun0zWjP7UJ1jwuE5yRwO0G5aEIaeZ6ZN8fo8IAB9nNn2YZHXS3fyBhX5iluwxH1YqocIDSXsBz5NBQNtzvuk5ygtboj6hejzbnrJT2lYaU2BRQBe+E3hgt6klNZk2Uka4AVv1JAOzdP9CaKbDqdJH7TpVolfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCIhy+mGfDg/UuUP0MtuKeUQ1yxJ3lv0/2Qdtu52IVY=;
 b=MOGjrQgFllslAOM1oy/MySBiVEegkEnPSJFBZt/lKLBra6SiwG4DYQ66Qb7p+3Yz3GcFGokf+mME1vxckhWk8TZ7q+2z0ze7hA0GDN9KMF55NYjr2DZGZY+ZQyO5CnjM1wqSNRDKLBwPgsAK9tF8AB6S77jMWreVE68LCDtomPEwrXUwHHN9xSJY5+3L1vySf2hRDHMO/Q95Ry3JPVwOQgGAkqcb52WaKle9M2LrVT0qLb0cD0byuQzLKSAGNmt8nJ9PUkG/zUC8b8PbKosvHZiFZ9LNWyUVfZ532PA0abD0LbKmmBJRE9hcKjGX4CQvRtGqSBqOUqMGdzeDrJ0wdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCIhy+mGfDg/UuUP0MtuKeUQ1yxJ3lv0/2Qdtu52IVY=;
 b=PM69548+jhjIEebdDslbKNcDze5jD6ViqihU+RTFCC+rBW3KaCGxcYaVJkVkZM9WAmjYghUI9DHm5Aqe2dhJMr6dKZaEFZjOSXXhY2SuKt15k3KFUbk+TV9K51X9bHZyZFDS7xgoBmI+OeIIv5FvfbOs2F/lUFbEaSxIOTcLLLdMOSIzxkelgf3kef3mBPagp4XTnEcLob3TX+Y3l2i5yJWR8ZvAWU1nefy0aSuiopV22hxjpWESgtTXDSfGRMLKe1tiIOabvH8/LPRWn+ZpNHCLBpHHvAPYHjO1wWvEVDxM6F/7u9+XH4jyYgGcggsNbXocCXYJdkAtou+cWWuYEw==
From: Michael Kelley <mhklinux@outlook.com>
To: Michael Kelley <mhklinux@outlook.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, "hch@lst.de"
	<hch@lst.de>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "petr@tesarici.cz" <petr@tesarici.cz>, "roberto.sassu@huaweicloud.com"
	<roberto.sassu@huaweicloud.com>
Subject: RE: [PATCH 1/2] swiotlb: Remove alloc_size argument to
 swiotlb_tbl_map_single()
Thread-Topic: [PATCH 1/2] swiotlb: Remove alloc_size argument to
 swiotlb_tbl_map_single()
Thread-Index: AQHaiWsCp8JQSGA74EyasRMxVkBb5LGKee/Q
Date: Mon, 6 May 2024 15:14:05 +0000
Message-ID:
 <SN6PR02MB4157FD86DFB5E305836EF209D41C2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240408041142.665563-1-mhklinux@outlook.com>
In-Reply-To: <20240408041142.665563-1-mhklinux@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [NnHOC9kgMwi4lxQfxWVHoFjvRL7exwSt]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO1PR02MB8361:EE_
x-ms-office365-filtering-correlation-id: ebe81af2-bb5c-48a2-3bc8-08dc6ddf2b51
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199019|102099023|440099019|3412199016|1710799017;
x-microsoft-antispam-message-info:
 hxLYDpDNf6DkpgAyLj88sO2Uif6D89H6852hmwQREl/4/4C8U8Nf0dfWEN5iw9uVUZfLkTTZKSFcswAsZxrdQvMyXEqaGmWBiIjjsoBubwYfb4lWjknf7GAOGoPPJKUwvBPImwcin9PTh3NQgovGp513X1aZFKsWK4qP0BzO2E2TfbHH3xP6nC83+bvPBjKyGF1sFdYHRoGJEFIfmSC7M1XvP5lj6qbFCA9B3m1uefMmDbinCL69wCq4ORYXNmZCdk4mthZGWlr9lKg9bCH74SBjKPLCoiIwtIR4J6UCkQiTa8HnXphlB06Xd2sn7J5bg0UtU5QBq8uc+p/BNqdkLakLftgNw8Nmh/m6AbZ87C4yNXdbJI+OMa/4R/uNhmobJOblcvCOVDAgD32ftqns7eoC39fLAAM87iSPfhDopnSOCInO4c5kRynxRHJR0Nl8/vCTC7ng5FuRGy3ISQUbOXCDRYj4HLARCQd4m0wTbbuaMqTKS8xgoHmdG2VHt4/ZkGAjCewlDukdzbt75Fx8IuQeUKabAV2AvtWWpqnXiyvxVKsJigedLLs64y3Vs/HV4NSwS+VLlYa7dXh9Xfu9YdIpIHXHw4+H/+4taNLQhq1IJ+lMrgWgu1Qsl9e9MERu
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rTnYaO5e7xysz7/CacTatmtlLBdAHCIx5lBVZ07nPCd0Rfj6TcHCWbCN4ziI?=
 =?us-ascii?Q?eZONax+0FQ3TrUvo5unKQzEWtdaP+GF6YmjgkfBnEsd2SnbY403eo8kp+f7E?=
 =?us-ascii?Q?nNxZbria8mTxDmHI/BZSialLhgYJIa5oGk8rvgJQsLEbiLgyA8uKW5aPlsgp?=
 =?us-ascii?Q?sjSEn5KlOr/xyC3Xw/HjrD9nEo2obrlnLmkuklDlnl9kwn5TM7UHooX4QDUo?=
 =?us-ascii?Q?WcinPJcixXTMI4wzwAkyT64PATsPeiXOQ0qXGkHcA7sCUzk7H7CMw34pR5xn?=
 =?us-ascii?Q?KQ8OGJ2iRffQqEkuzhcnZ2gqL4WqGNenJee0WfVs1OI0xq/wYLjtUAG37p79?=
 =?us-ascii?Q?iMDC3yDLk+evZibuZKveictDYXldVHA7rv1Zx8yvhIT4tr+tC+fifmLrowWh?=
 =?us-ascii?Q?qTP1eOMopyl4nm1KgNUU3sgL529XEu/KoFFsKU+T4xc6fkfJT/U3XvJzqaLM?=
 =?us-ascii?Q?wLTg1xxYZL8GGMmvpyicJIWUgyN4QNIaH7Rt7XNygcHhdAowDGmA4C3eTuVC?=
 =?us-ascii?Q?gft5+ezqLCEIhj10DeyXTD3paSwUj3Yq1aao6Runz0PTZzvPFQMRrmVLWfcd?=
 =?us-ascii?Q?TbdD2BlX8cDthFcUasNhA4LG0uDtuH/c57CIqPFbdVylbB47EBu2yS8lvckF?=
 =?us-ascii?Q?E8pYo8SiO1xqKRqcfT8gWXIrKQ2MRAq1DWTdcOt7Sz16GbTImd2rvHaq5SSI?=
 =?us-ascii?Q?Gajr+7E8NyIfgyPx39fow7ervaFfItyo2+L4R25LE8XosZEV7Yl6nUyNXV5p?=
 =?us-ascii?Q?ld+Wwf9WFmAwbQJTp59dTQ+Ux0OH2cBOB3pVffS5NpJcKZXeoYGI9c0vUj6k?=
 =?us-ascii?Q?5kItralhH52MHlUTp+B8N8VYs9N+ddsj/ZoPv3ox5HPYd/eYadEgYLROiYRA?=
 =?us-ascii?Q?ZaV8FO7HsYNKhZVcAOpC3InvTtsiF9c9E8/nHel3/MN2f/A2+XpGW/4ZsI7Z?=
 =?us-ascii?Q?Azj7+BuM7gtfAmSwZLwQz+rOGiVymOO2DdsEVvF7i7bliaZHgkrLteQVSXWK?=
 =?us-ascii?Q?nLUaXWh4L1TTH9cmd5OuWliUH83fEqljVRNhLHcxSU2l32opuPdBSfYBH2xc?=
 =?us-ascii?Q?keQOvE7tPT+Dd+Cy1viG+szptD4Esd0x0tqUyVsI+zjY8nc+iXbu0sHBEQaw?=
 =?us-ascii?Q?+zv3U2xHJMcGd64m0Ll+WRXQfk/u1cNUtbFfO74YDfauyfREOQ+4Icbpwafn?=
 =?us-ascii?Q?+tws7ciKSwtJU+bj4+7dRoLHLfFjdD/bDDh8JrDHyYJVVDEjYbXMvmzODrQ?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe81af2-bb5c-48a2-3bc8-08dc6ddf2b51
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 15:14:05.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8361

From: mhkelley58@gmail.com <mhkelley58@gmail.com>
>=20

Gentle ping ...

Anyone interested in reviewing this series of two patches?  It fixes
an edge case bug in the size of the swiotlb request coming from
dma-iommu, and plugs a hole that allows untrusted devices to see
kernel data unrelated to the intended DMA transfer.  I think these are
the last "known bugs" that came out of the extensive swiotlb discussion
and patches for 6.9.

Michael

> Currently swiotlb_tbl_map_single() takes alloc_align_mask and
> alloc_size arguments to specify an swiotlb allocation that is
> larger than mapping_size. This larger allocation is used solely
> by iommu_dma_map_single() to handle untrusted devices that should
> not have DMA visibility to memory pages that are partially used
> for unrelated kernel data.
>=20
> Having two arguments to specify the allocation is redundant. While
> alloc_align_mask naturally specifies the alignment of the starting
> address of the allocation, it can also implicitly specify the size
> by rounding up the mapping_size to that alignment.
>=20
> Additionally, the current approach has an edge case bug.
> iommu_dma_map_page() already does the rounding up to compute the
> alloc_size argument. But swiotlb_tbl_map_single() then calculates
> the alignment offset based on the DMA min_align_mask, and adds
> that offset to alloc_size. If the offset is non-zero, the addition
> may result in a value that is larger than the max the swiotlb can
> allocate. If the rounding up is done _after_ the alignment offset is
> added to the mapping_size (and the original mapping_size conforms to
> the value returned by swiotlb_max_mapping_size), then the max that the
> swiotlb can allocate will not be exceeded.
>=20
> In view of these issues, simplify the swiotlb_tbl_map_single() interface
> by removing the alloc_size argument. Most call sites pass the same
> value for mapping_size and alloc_size, and they pass alloc_align_mask
> as zero. Just remove the redundant argument from these callers, as they
> will see no functional change. For iommu_dma_map_page() also remove
> the alloc_size argument, and have swiotlb_tbl_map_single() compute
> the alloc_size by rounding up mapping_size after adding the offset
> based on min_align_mask. This has the side effect of fixing the
> edge case bug but with no other functional change.
>=20
> Also add a sanity test on the alloc_align_mask. While IOMMU code
> currently ensures the granule is not larger than PAGE_SIZE, if
> that guarantee were to be removed in the future, the downstream
> effect on the swiotlb might go unnoticed until strange allocation
> failures occurred.
>=20
> Tested on an ARM64 system with 16K page size and some kernel
> test-only hackery to allow modifying the DMA min_align_mask and
> the granule size that becomes the alloc_align_mask. Tested these
> combinations with a variety of original memory addresses and
> sizes, including those that reproduce the edge case bug:
>=20
> * 4K granule and 0 min_align_mask
> * 4K granule and 0xFFF min_align_mask (4K - 1)
> * 16K granule and 0xFFF min_align_mask
> * 64K granule and 0xFFF min_align_mask
> * 64K granule and 0x3FFF min_align_mask (16K - 1)
>=20
> With the changes, all combinations pass.
>=20
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> I've haven't used any "Fixes:" tags. This patch really should be
> backported only if all the other recent swiotlb fixes get backported,
> and I'm unclear on whether that will happen.
>=20
> I saw the brief discussion about removing the "dir" parameter from
> swiotlb_tbl_map_single(). That removal could easily be done as part
> of this patch, since it's already changing the swiotlb_tbl_map_single()
> parameters. But I think the conclusion of the discussion was to leave
> the "dir" parameter for symmetry with the swiotlb_sync_*() functions.
> Please correct me if that's wrong, and I'll respin this patch to do
> the removal.
>=20
>  drivers/iommu/dma-iommu.c |  2 +-
>  drivers/xen/swiotlb-xen.c |  2 +-
>  include/linux/swiotlb.h   |  2 +-
>  kernel/dma/swiotlb.c      | 56 +++++++++++++++++++++++++++++----------
>  4 files changed, 45 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 07d087eecc17..c21ef1388499 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1165,7 +1165,7 @@ static dma_addr_t iommu_dma_map_page(struct device =
*dev, struct page *page,
>  		trace_swiotlb_bounced(dev, phys, size);
>=20
>  		aligned_size =3D iova_align(iovad, size);
> -		phys =3D swiotlb_tbl_map_single(dev, phys, size, aligned_size,
> +		phys =3D swiotlb_tbl_map_single(dev, phys, size,
>  					      iova_mask(iovad), dir, attrs);
>=20
>  		if (phys =3D=3D DMA_MAPPING_ERROR)
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 1c4ef5111651..6579ae3f6dac 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -216,7 +216,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device =
*dev, struct page *page,
>  	 */
>  	trace_swiotlb_bounced(dev, dev_addr, size);
>=20
> -	map =3D swiotlb_tbl_map_single(dev, phys, size, size, 0, dir, attrs);
> +	map =3D swiotlb_tbl_map_single(dev, phys, size, 0, dir, attrs);
>  	if (map =3D=3D (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>=20
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index ea23097e351f..14bc10c1bb23 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -43,7 +43,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  extern void __init swiotlb_update_mem_attributes(void);
>=20
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phy=
s,
> -		size_t mapping_size, size_t alloc_size,
> +		size_t mapping_size,
>  		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
>  		unsigned long attrs);
>=20
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index a5e0dfc44d24..046da973a7e2 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1340,15 +1340,40 @@ static unsigned long mem_used(struct io_tlb_mem
> *mem)
>=20
>  #endif /* CONFIG_DEBUG_FS */
>=20
> +/**
> + * swiotlb_tbl_map_single() - bounce buffer map a single contiguous phys=
ical area
> + * @dev:		Device which maps the buffer.
> + * @orig_addr:		Original (non-bounced) physical IO buffer address
> + * @mapping_size:	Requested size of the actual bounce buffer, excluding
> + *			any pre- or post-padding for alignment
> + * @alloc_align_mask:	Required start and end alignment of the allocated =
buffer
> + * @dir:		DMA direction
> + * @attrs:		Optional DMA attributes for the map operation
> + *
> + * Find and allocate a suitable sequence of IO TLB slots for the request=
.
> + * The allocated space starts at an alignment specified by alloc_align_m=
ask,
> + * and the size of the allocated space is rounded up so that the total a=
mount
> + * of allocated space is a multiple of (alloc_align_mask + 1). If
> + * alloc_align_mask is zero, the allocated space may be at any alignment=
 and
> + * the size is not rounded up.
> + *
> + * The returned address is within the allocated space and matches the bi=
ts
> + * of orig_addr that are specified in the DMA min_align_mask for the dev=
ice. As
> + * such, this returned address may be offset from the beginning of the a=
llocated
> + * space. The bounce buffer space starting at the returned address for
> + * mapping_size bytes is initialized to the contents of the original IO =
buffer
> + * area. Any pre-padding (due to an offset) and any post-padding (due to
> + * rounding-up the size) is not initialized.
> + */
>  phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_=
addr,
> -		size_t mapping_size, size_t alloc_size,
> -		unsigned int alloc_align_mask, enum dma_data_direction dir,
> -		unsigned long attrs)
> +		size_t mapping_size, unsigned int alloc_align_mask,
> +		enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct io_tlb_mem *mem =3D dev->dma_io_tlb_mem;
>  	unsigned int offset;
>  	struct io_tlb_pool *pool;
>  	unsigned int i;
> +	size_t size;
>  	int index;
>  	phys_addr_t tlb_addr;
>  	unsigned short pad_slots;
> @@ -1362,20 +1387,24 @@ phys_addr_t swiotlb_tbl_map_single(struct device =
*dev, phys_addr_t orig_addr,
>  	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>  		pr_warn_once("Memory encryption is active and system is using DMA boun=
ce buffers\n");
>=20
> -	if (mapping_size > alloc_size) {
> -		dev_warn_once(dev, "Invalid sizes (mapping: %zd bytes, alloc: %zd byte=
s)",
> -			      mapping_size, alloc_size);
> -		return (phys_addr_t)DMA_MAPPING_ERROR;
> -	}
> +	/*
> +	 * The default swiotlb memory pool is allocated with PAGE_SIZE
> +	 * alignment. If a mapping is requested with larger alignment,
> +	 * the mapping may be unable to use the initial slot(s) in all
> +	 * sets of IO_TLB_SEGSIZE slots. In such case, a mapping request
> +	 * of or near the maximum mapping size would always fail.
> +	 */
> +	dev_WARN_ONCE(dev, alloc_align_mask > ~PAGE_MASK,
> +		"Alloc alignment may prevent fulfilling requests with max mapping_size=
\n");
>=20
>  	offset =3D swiotlb_align_offset(dev, alloc_align_mask, orig_addr);
> -	index =3D swiotlb_find_slots(dev, orig_addr,
> -				   alloc_size + offset, alloc_align_mask, &pool);
> +	size =3D ALIGN(mapping_size + offset, alloc_align_mask + 1);
> +	index =3D swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &p=
ool);
>  	if (index =3D=3D -1) {
>  		if (!(attrs & DMA_ATTR_NO_WARN))
>  			dev_warn_ratelimited(dev,
>  	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (s=
lots)\n",
> -				 alloc_size, mem->nslabs, mem_used(mem));
> +				 size, mem->nslabs, mem_used(mem));
>  		return (phys_addr_t)DMA_MAPPING_ERROR;
>  	}
>=20
> @@ -1388,7 +1417,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *d=
ev, phys_addr_t orig_addr,
>  	offset &=3D (IO_TLB_SIZE - 1);
>  	index +=3D pad_slots;
>  	pool->slots[index].pad_slots =3D pad_slots;
> -	for (i =3D 0; i < nr_slots(alloc_size + offset); i++)
> +	for (i =3D 0; i < (nr_slots(size) - pad_slots); i++)
>  		pool->slots[index + i].orig_addr =3D slot_addr(orig_addr, i);
>  	tlb_addr =3D slot_addr(pool->start, index) + offset;
>  	/*
> @@ -1543,8 +1572,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_add=
r_t paddr, size_t size,
>=20
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>=20
> -	swiotlb_addr =3D swiotlb_tbl_map_single(dev, paddr, size, size, 0, dir,
> -			attrs);
> +	swiotlb_addr =3D swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs=
);
>  	if (swiotlb_addr =3D=3D (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>=20
> --
> 2.25.1
>=20


