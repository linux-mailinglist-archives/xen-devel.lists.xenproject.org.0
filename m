Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AADB1D89C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 15:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073045.1435982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk0M8-0006AO-GK; Thu, 07 Aug 2025 13:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073045.1435982; Thu, 07 Aug 2025 13:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk0M8-00068I-DT; Thu, 07 Aug 2025 13:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1073045;
 Thu, 07 Aug 2025 13:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=igFk=2T=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1uk0M6-000689-Cu
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 13:08:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:200a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96f0fa02-738f-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 15:08:21 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 13:08:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 13:08:13 +0000
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
X-Inumbo-ID: 96f0fa02-738f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ1+zt8SxkWpi6XQvKb/4txJLmNhj/lKE1tbbt1yHm5Mc5mfMh1id0s7n9GI5o++auSo5fgwsbyFF8RGHy/AhtAQmxzQ50KAfwY+Lk+ne7i9/mPM6kIjAisy9OVGCuJDn89lx40GkRUvA92ncv0c2r7XBOY1KlrUvG81hcJl/JCd1EKx5Qz3kZ488T0o9nNYANzl74kNcFUIhK1EKWagmcQFDl7gCFYfa/YppIhvPXVVWPvY0tosrnQ06eTFBoFUEu1y4rfvyEjIg0ev32yYzL/OxMyWvHTDYb6Vc3xTRZh/5pybM9kmC5wf/gCuvZ7fNOa3OtGQIP1Q8Pvuvl0srQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcNahN9GoGL0AP88sLUVxLsV+OiezgDlSya5Beqdmb4=;
 b=kzDGV6ClUN6JhAsCb/Tg2C17AqRbsb3oWrHgWl17B9xc8vaSbqHGdsTIoTLBp8xnm7fuotA5anPz87YJfP9LyCJ4aXVEJHepCizOuK5BZjEA6OSQ/wJlCsuslw8jZAGYQ+OVW7nHymzqFALhtmHmdtBC1jSarxIPH4iwu6ViqOWNDcXBuuGW3KqEEcm67zRTLCtxpgU50wz0Xa3B+SNZIKomGv06gR3y1AtY4jwGFe7EDNtR2A0Cu1gQr0YYJQf9F4b331gjSHFe+aMKXkuj3/CMchqVpsMKgeSg3af87PgeGXihKo06Xheu+myXJZautZ77luPaUmCww9ZssjNJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcNahN9GoGL0AP88sLUVxLsV+OiezgDlSya5Beqdmb4=;
 b=M/m2K/JOv5Yv/ToHUCusN/WyEgwTM6QbQuHVoqqc47QW+gR1ysR4Pg6h76Sl+YdllzPOb0n72NW81+RCaZjQxsxyywcvEPM5ArW+4Qa8V8qy3uXMm42Sv/2JIXJ+qMYfEs/p+4xbYG9JB5SeI+QyzFxQiWcm0FsDBoVoEYNVFORQvqGgDWZOFyUu2tVHRM4HOJ+Yo6Y9/CL2luVzoALO4GJ9ScwWm6W8ZSmHB/Je55r4hNG+nARGUVDGA8uaF9aoxwLgdp+QJRTSyuL08tlXFnGCKylCGENcMF7jfRoUjmRDnnZ16+AGtOItUsGDZUWM4k3EY7kQJ0WZQ3tWW/2NKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Thu, 7 Aug 2025 10:08:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 09/16] dma-mapping: handle MMIO flow in
 dma_map|unmap_page
Message-ID: <20250807130811.GI184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <152745932ce4200e4baaedcc59ef45c230e47896.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152745932ce4200e4baaedcc59ef45c230e47896.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT3PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 08950cc1-2de1-4780-484f-08ddd5b376d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nq/4a2aPxe/mtkoI+QV41hdJKUg3cdlvSoOR/muTmjH0jenhZt1pRK5w3IzH?=
 =?us-ascii?Q?p/QFHExc/MgAgAc9aZQDcNnoHwi28teNBmt1OWbiyYcoTOc5Cb2wtWDPulgK?=
 =?us-ascii?Q?lRbbS7eEZagenmxQTEc+UUnF8s1mRoMLRy32fpksYmbw5v8mYjrbqJAKM1u7?=
 =?us-ascii?Q?KOTKhGVh777MbtRutO4zJRcrF1kRDXeKNnthTkAOSt/dKpif4LMWsvTKEha4?=
 =?us-ascii?Q?Q1VF2VW8cL2wutuXlsjVj8hGa8LVjTreJD7E3Z1xkfakk9+ka0SyNAseQpcG?=
 =?us-ascii?Q?gsLbMjQCzBddVDXCW1kuNJvSGpoI7lnQiSfA7pZ8ADRalwfE+Wd03wgQR3C2?=
 =?us-ascii?Q?kLpHy3kjaXHOmiEXvOv++7pxX5zMW7IRAtLjqcjoQHoev6H3/qXbKik5wHXc?=
 =?us-ascii?Q?RRyt/ae8W9ZVP6FekBsEETq2wOTaO9MlqpMCLFsWmX8vKQVuI+iYUOTaTd04?=
 =?us-ascii?Q?HUBwHFwWjIpnrD3cFb3qcNkg4yi+bm8/GC/Et6ucLgPJXJbUKe2YkwKSZqSs?=
 =?us-ascii?Q?CDXXbkHaVZwJbeU0WnrPRZbrfPcUDbVI5eA10870B0FyKaIHyMRI0x7/zCCP?=
 =?us-ascii?Q?AQ3jJ9Op0mto7K0skfRbtGmvyreJY3Nh4Leuq440dmD3GbRTxpMmUJeTrSFB?=
 =?us-ascii?Q?sFdvVDqzXfYUTFxKXAmkp+H3L5XiaIg5fTDbsHh3T31qSBy+4Ggfd0FDv0wB?=
 =?us-ascii?Q?QGRI2WkOXf2Kln/xZiyDkCqR6+CtYgA9c23F0/9VpyPCk5ZIYjUdKhKWc/l6?=
 =?us-ascii?Q?TM16Zonii3uyIvOX+gBnQbtIVf8om4ZEYnCLTSajZ5xI3/rcs+rp549OwAaH?=
 =?us-ascii?Q?v4pwvGo9mvAy3l8n82aOYSmGg7xY25BQIvsalU3qzA9AWBQgz7SMLMNJpPSD?=
 =?us-ascii?Q?g8W0JjY7HjdwX5em71q4xpApzR95Q6pUwlfnbKpMtaz1BMNHNYXpfaiQmK4T?=
 =?us-ascii?Q?U30RbT4w7xqdhd7GCtAugnvLNCa0ZYjBubYnmojSsQNfh8blXE5jjBIyEvyl?=
 =?us-ascii?Q?N1ML8UBAaT/6M4w8S9RWSQ1HXCw3gyVhmA5qVYz6kRnwYAuH4jttPqqU21ts?=
 =?us-ascii?Q?mc6+jLwdCTRLxaqX0cAjTWTnOURE0pG7WC78sDc2oRS+nazzJoxhLoQR3j8R?=
 =?us-ascii?Q?ovpm0N+kaQoi6TiloWW4BZ8JiuhTZ9orE5xiKzRfsva9gFbF67IV1C1iLGHE?=
 =?us-ascii?Q?3Izs9IQYnVOP0aFr/uYb9NX1NcfuEY5HPyY1iQw5B6mk5As1LaYlHuIYnodk?=
 =?us-ascii?Q?mF32bjbDXsSDkQIxF/0LhDcdp9IuwTqAbTgUeSi9SOrVI3x8sat/XVh1s/GM?=
 =?us-ascii?Q?bmQc+MvkzYeqQSqXEvWk/4BPL43BorkZoPfZfxAAlzy9x+MlHnog1mzE/DD5?=
 =?us-ascii?Q?bl0OWTpu948qX9qOmmcDYGR17MxIM/C5TBPx+yLLOQF062Nxw7t4KN9UiIOI?=
 =?us-ascii?Q?P1tH+x/69d0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rj4qcstFxUNxsRt471nCdJj82wmdEq5/Kx7zvkQBLfZLQRl+ga88yJlYaCsf?=
 =?us-ascii?Q?CbdR5MQ2vuVy3EpcYdVVFFFuGDV6c/18dGgVy+aIQX4Xz3Taj0QWItN6MfAp?=
 =?us-ascii?Q?fdK3eG9vIwBOxPgwq3r8hbXL8FUymx7Ury4B1K21cfVGfAHu0/T8/7mSvooq?=
 =?us-ascii?Q?jJIMjROfGb2SglfRzuidjznIqdf3HNmIvDb9Vf0G8LS1A52miIu11TW9wBUe?=
 =?us-ascii?Q?1BGs6bBOxq8N9mz/FIwxof2vawn/poPbtXLbRIpUYk8UgzUBrBv1v4c1JtYn?=
 =?us-ascii?Q?otlxohDx2mxKpVCgHnOqkg5xVBuF0zgfBgBf0AlwsLRpwd4Q8G3xdiwPTnR4?=
 =?us-ascii?Q?Sspl65u0J6IPBVkwiQgyZatvFlT3rrhAQ+tuJO2UQ0mG239MR9IeOUJg9kSE?=
 =?us-ascii?Q?gW82aHqUFkerfU8AD3AFAWXH+Jfs6lzIna8/opyIEIDZIE73ZPXwj4CB5c8P?=
 =?us-ascii?Q?ioeE2zfcTc3PdvivMeeXMulub5u5IHBdiy2g5fVp/PRSrplWN1lgGq5TaOoW?=
 =?us-ascii?Q?EmfRJ957EM/oJ/1LU6bjRlXSt5CGu7B55SDYzKgMVCUNqIxc1mmDGOAArrwe?=
 =?us-ascii?Q?UihpLdOIVq2JzAecSr1X2GDfb3wYgiwSAORwRdpg4e4LyyimuAnso83lo+b1?=
 =?us-ascii?Q?ta0eoJPuf3AAa0xtEh+F1Rk89sYQF5ye5EZ9yOBx3VC1VC1NiMA5E2rIr7P4?=
 =?us-ascii?Q?uoSqNodY+GPN5iARUia8nXINxqfJBJNu3xlleOAE/SRO0smabmoLTY1a1FO1?=
 =?us-ascii?Q?piaXqyKi7ywfW73iD0HP7uZx2/0i/hfqglw01epL/KqZYbC60xX7iT5hW49Z?=
 =?us-ascii?Q?9cfUqCcxOAmwSFJR0PO/GKRiqarvC+1sD6fP7GS4kcFZ8jPtpItFsF9aWYX7?=
 =?us-ascii?Q?0FQVBSuV5d7s2mCE5WH8vNkQagG4ongmjy9XtQwwxlu/RH+LpeVH0NxyluGu?=
 =?us-ascii?Q?CULKE00Q+0mZc984ezCco3ZtV14RqVSsiCyR+XWoGXeCFv8hg9rD0s5tQGGd?=
 =?us-ascii?Q?YbKb24R9elV2YHlqk4oYH0kER3H2kQqdSdVXkIN7LeuWGVVN2E0boCQAWVrW?=
 =?us-ascii?Q?V3Vn6ZdR+qj3JARf/nEiTsP17PDBHDFKU6+Mfs0psjZXvdgFKHAl0TQqnLDZ?=
 =?us-ascii?Q?hWedoX7mADffbzxiSX2BhY2PCTciTJbseJX7GwyG6+FcZP+B3w3iakMH/pPZ?=
 =?us-ascii?Q?KcCtjslOcZ5QaDx6+zFxoEVghkCAbFOVxC7jA715eh+7ppgYr6nlG50Qimnc?=
 =?us-ascii?Q?Ge89r+xdDkrN+ZcjOqiXojuASnecl3FGDce7S6+ovPgNRbvtjNei5tn2J6Zt?=
 =?us-ascii?Q?CUVkOheZnHigLiuTQ/sJQ0//HdwQ9VAAgv+dMPZjKsNgbkF7N1cC5CZXI0uc?=
 =?us-ascii?Q?K9ct3Peu/gXnCYvZMLdFnl5mP/9x3jzXxseDC2Xq0GURAfeZAaZxCTjReqh5?=
 =?us-ascii?Q?CZ4WSzmbS5FGb4DPjk7IkC2gHvwHSDkiFBy0bOmm4ars19OIebfBS8MDl3C9?=
 =?us-ascii?Q?aoQdrCQAc1YMTs90T867gbeVLXS3snMjDLJlzsIbMvkkksphpbdW5Jz4pryX?=
 =?us-ascii?Q?Ma1w0FcmuWectGjgXy4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08950cc1-2de1-4780-484f-08ddd5b376d7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:08:12.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOq4jHUsSKGMaJyXZYTLbMWHzFOPikNkJkIkpgwbuFDcTt8ZteeQkm001BjRjw4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558

On Mon, Aug 04, 2025 at 03:42:43PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Extend base DMA page API to handle MMIO flow.

I would mention here this follows the long ago agreement that we don't
need to enable P2P in the legacy dma_ops area. Simply failing when
getting an ATTR_MMIO is OK.

> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -158,6 +158,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  	phys_addr_t phys = page_to_phys(page) + offset;
> +	bool is_mmio = attrs & DMA_ATTR_MMIO;
>  	dma_addr_t addr;
>  
>  	BUG_ON(!valid_dma_direction(dir));
> @@ -166,12 +167,23 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>  		return DMA_MAPPING_ERROR;
>  
>  	if (dma_map_direct(dev, ops) ||
> -	    arch_dma_map_phys_direct(dev, phys + size))
> +	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
>  		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);

I don't know this area, maybe explain a bit in the commit message how
you see ATTR_MMIO interacts with arch_dma_map_phys_direct ?

>  	else if (use_dma_iommu(dev))
>  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
> -	else
> +	else if (is_mmio) {
> +		if (!ops->map_resource)
> +			return DMA_MAPPING_ERROR;
> +
> +		addr = ops->map_resource(dev, phys, size, dir, attrs);
> +	} else {
> +		/*
> +		 * All platforms which implement .map_page() don't support
> +		 * non-struct page backed addresses.
> +		 */
>  		addr = ops->map_page(dev, page, offset, size, dir, attrs);

Comment could be clearer maybe just:

 The dma_ops API contract for ops->map_page() requires kmappable memory, while
 ops->map_resource() does not.

But this approach looks good to me, it prevents non-kmappable phys
from going down to the legacy dma_ops map_page where it cannot work.

From here you could do what Marek and Christoph asked to flush the
struct page out of the ops->map_page() and replace it with
kmap_local_phys().

Jason

