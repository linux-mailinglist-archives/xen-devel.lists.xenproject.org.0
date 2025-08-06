Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2DEB1CC1C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 20:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072137.1435447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujj88-0004uf-GP; Wed, 06 Aug 2025 18:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072137.1435447; Wed, 06 Aug 2025 18:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujj88-0004ra-Cw; Wed, 06 Aug 2025 18:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1072137;
 Wed, 06 Aug 2025 18:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Hpz=2S=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1ujj87-0004rU-96
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 18:44:51 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [2a01:111:f403:240a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd378d9-72f5-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 20:44:49 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Wed, 6 Aug 2025 18:44:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 18:44:44 +0000
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
X-Inumbo-ID: 6dd378d9-72f5-11f0-a323-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOauFcSkTIcu6PD7QaXL2Z0ekh+G12NbVdlqxqSUF329YDRGdMpJsGxQ6P4fut1tX1Ygpb2vcf9dUG0A0MElFOeAQVNP/mC5F81GfWDQgksWCKY3exzISuXthAjUdgIYtHFTj0Owe+9QXSzhnS3Y1Z0hdtVKu1b5yWNh1+UPlVGYgFopNcqoI1Uq2qcC5mCuSNmu76shE9RpAgnwh2k89srZg30ukYjhzkwSwExmvQJIQTZ8T9PTwPhjvA5QuXHLEBQ0RY1nsssiq6+hp7UYpZSSgUxBd/u4jVF4EY/YUnZ2Z4HL7m1UCCzjYywsq+gxEqMOgHHxs+CkjwjL2f0EHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsnX/855VPl+V555Ssmgek9Y1s47JtlT+wpnIJ5f4UM=;
 b=LQ6Jyo8G+G6ShACF49yYeqmyidGB0PDIIqMDs0nKLWlkVU/UmfgLc7T4MJY7TDU1yh8MXPDbtGY20MFTe09zB4nTAV65ukkxyTBPT3tcGVzajUAClpnO+YcvyqJDL7zewB/NQZ1KnCJswCw5Qj0D+5Rrg+EMO/moi7PeQkeV18W3gTe0RKU7fTud9aHwjkkKZMCK615a22skSiCkRjigdQ//IwUVPvF23/WEP+FJ5osRc5NK9c2TfOx49oXxg2vuZwwZBToXedmTA/suZVsxI3Xg2ybxN2iF0LD0baRTaDtd3vQWX/drHxUHP4kHdsnQqefLNOSiML9EABsYRRxRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsnX/855VPl+V555Ssmgek9Y1s47JtlT+wpnIJ5f4UM=;
 b=gi6vwpK5i9Jx4O9Pk6cIfi9UBlgeHFY5Hf4CRLGXdYp/1NAtrsXAhN/5hLWkN143xMrb1UAUDqxZJUdgN9ZSnTEO1d9Rokd4vDp5ZbhHTfZTyd/WEhNSqkWisD71CJuUAzkVwU9fvS8NL7ZgiZx6cqgGB8p18ccgPwUfZa72/0Vvip0apOrLU8CjtBJzPchTVgnz74mn6tB+wIO1TPha9NpyIkzXKWoZCn5+t9/Rydd308vn/NYmjJZYYyB66ZvPfBShdDHToalZKv4wz5ARxu9ZTe6wxKLN5OoXm119nzoLrxPPIC09n73TdVYV6oxW1x/KVUYVVvdVyMtUKCxqiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Wed, 6 Aug 2025 15:44:43 -0300
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
Subject: Re: [PATCH v1 05/16] iommu/dma: rename iommu_dma_*map_page to
 iommu_dma_*map_phys
Message-ID: <20250806184443.GD184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <9186ccefda5ea97b56ec006900127650f9e324b5.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9186ccefda5ea97b56ec006900127650f9e324b5.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::7) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: b540726a-1087-4405-7c29-08ddd5194fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DVKK7m2kwbrFdFZ5CLqlkp3pCfT0gAPJfkqrhOJzBqvcXtAOkkMPkBXU7sc2?=
 =?us-ascii?Q?HlPv8+ODQt8Q5OlIqzIGrgF1p47orRrCOtS8kcyGubzJCJWHSvgXFfbNgzrw?=
 =?us-ascii?Q?/hbV1f0thZ7bBK1+ra1Aq/S4ghWekXsp1lWa5ZxaEgJoM6cjrxFNxViHVCTx?=
 =?us-ascii?Q?TFLHB25mCEIL35Hl32dvuQWzbEU0GAEIVAXeJcPoCROymPkl0kkmjQDuHvBq?=
 =?us-ascii?Q?RkZnbgMNgQDJ5hVraqmr3DqGxwMzxY5CuzgTXC97OTldBsMrUA48sPfSRdID?=
 =?us-ascii?Q?tqSf1yn9ePjr7Hy3vLsEgX3F0fYDVHBJtKI9SaZ5L0p+cu7Uc8LFfr3KenOK?=
 =?us-ascii?Q?veB8r0oF8RmSDkboVZYVJ4LxD8KpGeCBlI1IJSOkSZhp4XGn7VEzxR5UaicJ?=
 =?us-ascii?Q?p+DZqdQDosr9FvrmtVsyYhFNf0Y2CCMgoyKiHR0xD9ROFjvV+cl1RfBE0BOa?=
 =?us-ascii?Q?YvmN68/7ccmDS1DD4nBhm8zR6JmvobuG2WYZkzk6+yrKS9xauJWj3D8vvJSG?=
 =?us-ascii?Q?ii403ZJLIjngZYo/rzax6f8v2jfN4Jz1HtN3ZTqbZg0NQCTu85kWr/XhusG8?=
 =?us-ascii?Q?F5hs0NGzJY4IEmIJhJmvxnvKn1HNsXTHNXCHtLh71RhGP8n9SKXQYRLtxCkv?=
 =?us-ascii?Q?8pavmU/3d5KiWUm9ny/KjITJYthuwGGpygrPizbHaBrHquUx3GGBYbggfwoa?=
 =?us-ascii?Q?LMi66WtjB3AYwHRmXlIVUPirRtnF0O2CjHopmmjRrUKzu4uclUBDvVYN8x4X?=
 =?us-ascii?Q?2ROpvPSIJNfSYsU3AAEHC3YyOxDvvBLXnyJqCcf88hehfvMBMBVH0P2drFon?=
 =?us-ascii?Q?+XfyYtM6hVF4OPxaIeAh9YPKm0WxFl2Np8kW/tUzqJewVNeQ/WUIsU4Hizuc?=
 =?us-ascii?Q?277SUZf3nJE1rAykfN8m3DpJw5Jlp7asNbwBPEsJ2BKh7AJdAs8cicqZ+vrG?=
 =?us-ascii?Q?b/jL7tNZV/kmFGInFAGBeRXEhEba3f9GEefwbC9P1BqjLhB2EO7yvQO1WTnF?=
 =?us-ascii?Q?6sddW5eTpyKv0H2raRyInjVjvpPWDDoxfKR0rUXlY9ChanIcCnXTn85sYUKR?=
 =?us-ascii?Q?DrzR2KaplMd0BKRatDtIcigFzcesXkNSQtOAzG1HsKQ7txmWKoQBE1FhduWp?=
 =?us-ascii?Q?hdFKFriNDZB38pm6yKLTLlA1be01LI3JCWrLA42f+bdGiIxnHudbioh7FR5c?=
 =?us-ascii?Q?dnZi+Yl6hOwt5XWRfEzWN9lFDY/Cv7paTTfwrzYaFmCUDkmuGl6P3lTqXmXt?=
 =?us-ascii?Q?W+d+zHryLrLJG5nW9l7UEflk6LbaYe2nqjW7GsuAMzjd7oJm60dj8MZRJM7y?=
 =?us-ascii?Q?QD7MjGm5CTHLyX0co1pLB+az+/asfUfJo2+DFm1tG8cFiM1C2Xx3v1Qr3tM9?=
 =?us-ascii?Q?qNJRj6rUu1FVWh3IOwVptrTBgkcqwQwkFY1H2p9ZJUSixRrIEJPB8s6E+XmY?=
 =?us-ascii?Q?ttj2uhMec8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H5EEEmksxB5nY2IizxojE35HXRRm8/DB/1QSzYsVyyVgI96BpLxbIuv5TDkx?=
 =?us-ascii?Q?nUGpwu2dJU6+r3X915pb8KC9O5dreCxHz158+pG2Fj6dAGBEledNoRSGoX0R?=
 =?us-ascii?Q?hbO65fGcbNBhmktBgZ2vmYBPQBsB0lY2syDGxqUeE0cUd2r9ARBLOsowZs6r?=
 =?us-ascii?Q?TGvou3G03c+uNESEZFI58JjOQ60EdRFWaha/si8J3haXH+axt49E95RcDf57?=
 =?us-ascii?Q?vbmEin9T70GxM/I6kKe9bMKickVzch2GwVucyBZhjx2WYVrYch1nj9TyCpRH?=
 =?us-ascii?Q?D3j0bTzOuFiIpRkZxysQpHON+YOkT3Jo4gWIHSNf6RlgD1bA3wE7ONa3dLnN?=
 =?us-ascii?Q?MQ27zykqOoiFAJf+LhCVKLhRVr7yMezgpp1DhO3HeIzs4+BjizAZMMzRyBE5?=
 =?us-ascii?Q?4VQ5IMsQ2ve0tfUGNIFgDJAzGSmNJBp+nmNckIuz4+Y4UeV9wxAaC6k85kEJ?=
 =?us-ascii?Q?ZyTnGNZMgxjCp2kn9yXy3d3gcYf7k25G7xfdo5+J8yTjS66m8YMMuDBZKLhd?=
 =?us-ascii?Q?+oA4Zz484q0UmlLvbDJWR2YZRO9C5wu4qCvVQyo/cV6Xf23MW47rmjSOSt4i?=
 =?us-ascii?Q?8gyIzgAUlSqrYizSHaM5cTpNNalJdBGbGHEAuZSnUZJPabrYVD8zYlVofvMA?=
 =?us-ascii?Q?5jQ2gxzhomsXJI4XpWFcLHjkPZbl3ReZV2Iv4UV816nGs7RtY9ywpvEEH3M6?=
 =?us-ascii?Q?d37UY82AQkgHJ389AJxpqATWo+7813trld15qO08wOP7wptlSKTBtLxFqyp1?=
 =?us-ascii?Q?p5K5mq4BDwrw4ErAxSXgmqHMJmwrMkBiODHeMV/7BRLuY36DMVyv844QXfcN?=
 =?us-ascii?Q?5JXYB6b0PeVylkrKNvdTrz1aNY3GOeyDWYzbbsnDYKyAO8mjTrOVj0ZCSdxd?=
 =?us-ascii?Q?V1l1olpKmeAMJEJZSxoT4NugVaKwxOfUKz8aTEG8cK7rLgBGKNzwSZvC6E+r?=
 =?us-ascii?Q?TZ60eqsirzXmat2EcjPl25ppMdHGy3IbMnQ/J9sgxmY/z9E9OuwHJWp7bA6X?=
 =?us-ascii?Q?zvjg8HBBbOwzT0WPfDsVKH7X4LiJmimUfgZZmgn0zuXLHlidtJWJeQa8fqgv?=
 =?us-ascii?Q?bqEHDo6ZVh+k/D9MdKr+ZDNQXkGO5ny9caMPWLw42d5z3DncVGuDbtgJ7wUg?=
 =?us-ascii?Q?1GLNNvORRle4a8/329sxw5VCmtaA+NcMj0xHlOg8OkHs+zBaTfknUMZ1S11e?=
 =?us-ascii?Q?Il92mJk32OizprAwz+I6hfDG+f5USQm3BrAz3Fe5DKhO3+Rq+fHW4Updrapg?=
 =?us-ascii?Q?xWKhNg7TXgqka6KKCknRW16XrkrH9wbo07ZPDyRvtjmSI0Kz8389jwNNrVOf?=
 =?us-ascii?Q?OUwZQImlpAEA11s3KKAs/HNdN9uURSwzJkCT55r6laWcFrnQtmKmNQNXh1bb?=
 =?us-ascii?Q?DWShheY2RnxJzO+KOAGR3f97vhXpXHJ+Ku9Wu0v9i+qRbybf1HLv8bXf27LJ?=
 =?us-ascii?Q?oCEXhhTsPvH0NVJ6P73+0jAj/p0R/zyWNg3RaqPhpJO1OCqeXbABd26YLLMw?=
 =?us-ascii?Q?jIP6a6G7UJYSNhOAYVZHG104pJg0qJOHmW7DkhK7vFiCR7az3SJsxBwlslee?=
 =?us-ascii?Q?9D1Cn5vtkBFmiLwdXkc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b540726a-1087-4405-7c29-08ddd5194fa3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:44:44.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L4SPqUDcaxxJuMXBA+m3YBuJJPuxs4NsJn9UIVDrRqDkc08va7Gss0v4bBIJNIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389

On Mon, Aug 04, 2025 at 03:42:39PM +0300, Leon Romanovsky wrote:
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 399838c17b705..11c5d5f8c0981 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1190,11 +1190,9 @@ static inline size_t iova_unaligned(struct iova_domain *iovad, phys_addr_t phys,
>  	return iova_offset(iovad, phys | size);
>  }
>  
> -dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
> -	      unsigned long offset, size_t size, enum dma_data_direction dir,
> -	      unsigned long attrs)
> +dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> +		enum dma_data_direction dir, unsigned long attrs)
>  {
> -	phys_addr_t phys = page_to_phys(page) + offset;
>  	bool coherent = dev_is_dma_coherent(dev);
>  	int prot = dma_info_to_prot(dir, coherent, attrs);
>  	struct iommu_domain *domain = iommu_get_dma_domain(dev);

No issue with pushing the page_to_phys to the looks like two callers..

It is worth pointing though that today if the page * was a
MEMORY_DEVICE_PCI_P2PDMA page then it is illegal to call the swiotlb
functions a few lines below this:

                phys = iommu_dma_map_swiotlb(dev, phys, size, dir, attrs);

ie struct page alone as a type is not sufficient to make this function
safe for a long time now.

So I would add some explanation in the commit message how this will be
situated in the final call chains, and maybe leave behind a comment
that attrs may not have ATTR_MMIO in this function.

I think the answer is iommu_dma_map_phys() is only called for
!ATTR_MMIO addresses, and that iommu_dma_map_resource() will be called
for ATTR_MMIO?

Jason

