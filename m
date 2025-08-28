Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356AAB39F28
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098865.1452814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcqN-0006Xb-GB; Thu, 28 Aug 2025 13:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098865.1452814; Thu, 28 Aug 2025 13:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcqN-0006V8-DX; Thu, 28 Aug 2025 13:39:11 +0000
Received: by outflank-mailman (input) for mailman id 1098865;
 Thu, 28 Aug 2025 13:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AInb=3I=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1urcqL-00060M-CU
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:39:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb54952-8414-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:39:08 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 13:38:59 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 13:38:59 +0000
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
X-Inumbo-ID: 5eb54952-8414-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev398O6wquh2AiQLxZk9PGdgprIHSlw2lsyFHLwb8nR93kzHtQZuQjIhav3rK6dmuK+bOLOqy0ukJ1OnAlJ4cy5IZGUemxjraE+fuHpFjSuNnZJ8FYrK4sASgJFkq3RNpqN2CTSlED8YXFqEg2hoSenJH2X1OrvVCkhRMF8o/0s/AehzD/K4E7ThGw9dtNdqRxYFLi7Pfo9ihRkKv87znCJ6vKKeHt7u2D3zG8bzu4MExZ8bgOQRq2+n8wAbBMauwOc/t28UazzoyB5Wn4mA7PEnDfnshvaZsCuC+t1gYX0beVcKJpCC/AzyQESl2j4H8I4u2Jkdw5gjp1tGwxbGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7AfCSXAadbxG/aew2Ojhvg4gXP7xfhklC/4unfqPHY=;
 b=trC59ke2qYBVJmiClsvssbtB4mDyban4Dp7fytHOzQbqaTwWpNik8VtUa5hGssGBz1H8pdGcjCqbf1yLkTUFE7oC3leFJYR2PUbRfG9W915s4zvgoTIG6E4nutsD0WOBhjFeyxWtkpegIgwwkqFlvI9+CAiAb70URSIpHVaAEkr50sfPu6H1l1QOJN1E4O2oOFy0VTpWGl9s4/F8Mzs0WWP9isJnzsyzUYD2Ly0YR2lfclMP0bIAa/DBU/lw+YHayHNOY/i8R0mJ/mcB6EgJeejiG8fekLB/NLiL+xerwIZRV7TA26h10kAijuibmqadbcVPhwgrdCfyY9HWhAjjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7AfCSXAadbxG/aew2Ojhvg4gXP7xfhklC/4unfqPHY=;
 b=Z70A6z/HNNeICWuf/sdzNklCgd/Cy5uQNbSeQnPp5JpQC1te/AofkwsM8juU4YC/aq6sBNNeSX5IrYYN6Adxg94dYkFurzEPmtsODMjsXIH8okOsQ/AVYfo1Di0XW8bbLJARRB/nKmSpO2XVC6OT8eiWvUeeZHUC3TB9ZBhyQasKuUu3BHLJAhsurx5Ii+gT2pNrErfzzed3JEEtiM/squA8YA7jl7gdQMA5uVPppL+xInuUmWL3xQdvzRzLm+p2anjhW4+DPWq+LTQffgLi3NUt1aVe7xtBQJH1AaTgEyM1KIq3/LcPSG9uRtfWaaHtbMlzWv07Puf5Lx6a/GW4sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Thu, 28 Aug 2025 10:38:57 -0300
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
Subject: Re: [PATCH v4 05/16] iommu/dma: rename iommu_dma_*map_page to
 iommu_dma_*map_phys
Message-ID: <20250828133857.GD9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <66e7cc6854e4e40278b598b38e0c4d49d7fcec91.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66e7cc6854e4e40278b598b38e0c4d49d7fcec91.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0354.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 327bde10-38f8-4ed1-1028-08dde6383df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qyX7RmTJFt/trf+nELkaslku7hVi97mGwRrTyOzTuAD7y7pUkhh0J2DdclFx?=
 =?us-ascii?Q?UoI6wLfE+X/fHqopVxXxaRGcrv5lq8PB2XN6qW+u6bZR3qopEDG+in5UY7+m?=
 =?us-ascii?Q?2E0NT4a01/viv0z/nVT8CLjWigxAA6NQj4LXaHRUFlxSiTVveWX+pb2TCW/n?=
 =?us-ascii?Q?IiVC5E47ShiLZKE7oY/GKFJqGUl7d1cTKxWgTgrwnltQClVlH1OvB0zV6/sd?=
 =?us-ascii?Q?jVrdQzdMQH52Ex+g7HiAVYckVQZMICHWGcWzK27Ijp53lW3SMNgwwidibE+z?=
 =?us-ascii?Q?M5ua2KznnyItj+1wsPHLmcU4J8Uk8nxhPY3RhiBd3fRMJvqaEDmUeQs4yi1n?=
 =?us-ascii?Q?QT07c8qV7ZMKCNKFdI72Iw43pjlKLG7TRaOutiQxJBeEvvZRMvZlhhNGksdN?=
 =?us-ascii?Q?Fp+fqB+TuqMtiuJL6mZFqHc0DkMK69v4fd5TBqmDUpUfm0kid2bEcc+uxkK+?=
 =?us-ascii?Q?YMYpmXFbi8BNMlJnegsCg/IxZS6sty/ZD+3IatIJ1S9UVajVFjOnE01/7mKV?=
 =?us-ascii?Q?fXKLoLRXQXDYSVmw/nk2SK7qMEnxSP8AUL0We8VexlzxcL3B0o1GmdSX5jcE?=
 =?us-ascii?Q?xgjuYc/hUoqhAtPxwsbTVnEpHie3BjoHkrcC2jP/BbzVsJKO8mcdmiNZGu3l?=
 =?us-ascii?Q?QnU99623FTBrw06pwvp+mQ2EruBFFo4P1ezXaGTBaD5sNK2mA3ue/7LC2mtf?=
 =?us-ascii?Q?dVj24FtAyFL6Y1O7aDrnk0ysOBrv0EUyCsWqsAXMkEG8XH700yZdYb7DZxvQ?=
 =?us-ascii?Q?7xBc75xC/L2jTMgqqpdhWyAjaWj4NPOZQ6EGDNA55k7nrDhIZrNAMqzMns5P?=
 =?us-ascii?Q?qwgGq29xja6R2S4+chFRryNp7vjVqnslN4f3pH/u6HMPdwmyFcr5x8Nlk/nb?=
 =?us-ascii?Q?ObYf+b9ZOjnCdRgxt5ANktUKu+3YCBqb0tXoOxtBnSUi/k30noh+8MSl2Jul?=
 =?us-ascii?Q?usSlhPZ+OmO5UoAeyub9zTorkc2I7mBamYicF09Xp0WqRs468KIr7xUjFgka?=
 =?us-ascii?Q?vFHU3b6BMo6PaGIjQsbh/432X7SAg2phxLvrey0SJ0H5LcOok3+Mnn6KWLcS?=
 =?us-ascii?Q?kfFEL/Ydfhr5jiSJU5n46DXZFcmESGPzCTVgGDkXvhX0eYDToPiYUci0+mWv?=
 =?us-ascii?Q?6Cr1nEGpyl4P0hgoZc/rV43Ge5oft7nbE1hj1BjHyn7dH+q9WdpjlHQlNjVK?=
 =?us-ascii?Q?Rg+F8OUQPFeagcs3UrRdSNj2aLvBR51AItvE7eAI4Iz6WzmeEbw0I5n7uN8o?=
 =?us-ascii?Q?wf5HUjZHS4GK9BuOikUkeCtk8iHKPeulp2eOJfGeW6OvRXuEzeM4UhURpYyr?=
 =?us-ascii?Q?hG1V7RiF0T0Q9NNsGkHrRAyKd4zRJfdsNBz7tEfHJe6vzEpg7mJTKJei54Ad?=
 =?us-ascii?Q?R2GB4jrsjdiszV6HvqUhOFWCrZdPKmj9xcCU4ua+lMWMDLEVQ/luBBjST6Wq?=
 =?us-ascii?Q?TW5gUJl5o3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?itLD+5DwcFtLqSk9sUyLawPtsxRiLXpuZEl99bkg/2+zesenK4WOIS5Uxp2S?=
 =?us-ascii?Q?9uskNBEKQ9g0Lcp9B/aD06akTvgAZLXkWoYZPMH295aoMV90TBaA8/qx5y5D?=
 =?us-ascii?Q?hbdsmHkfCaHoz/MiPyuWIbQKcwoRtF1aZJXKNEf5D08pastXzJ8kkEWo5hR1?=
 =?us-ascii?Q?JGTDlXYOhtuzgs+92Yph4ILubenz+ooIjdNsEhUQUp6NNxGTkxqq0Y39LtN+?=
 =?us-ascii?Q?bfmkdODMGTqo/PkPSZmaKe8rzH5USK/uVFXCRHYog1g48EVDAa8ETrp+vTVk?=
 =?us-ascii?Q?hPo+sfHsZ+2936Ra8tI3RHwdjP8wseThBVcFKDf+jJNN7X0zHsSzJwW+RCs9?=
 =?us-ascii?Q?rI5MXK/NxTdiA35QZPuCFlD0XvEi2RyO6JcW2oPvrsrI11x+nZCzvU1PMmYQ?=
 =?us-ascii?Q?VyoLmCQ/F2Ft5elp8i00RUPKOfxOyKFr8u/BXU7pw22Q63HqtpuV/6EViE//?=
 =?us-ascii?Q?FvxGKBVOvAG/8MuIcFcguLp3yl4lNoh5RU+TmKqwWx0nYFcqJ4wZC5j3asS3?=
 =?us-ascii?Q?Q5Px0T2aVAXmslrKAhwf4D5z2u+xExEL9XywmiohQ7h2C6aMLkRwPHvsUAg3?=
 =?us-ascii?Q?OYoX53IUo/DFls1qILwmuNJL0YQ0QYP1ghLzDq63WLbzC9qKTQDVAFOkq70M?=
 =?us-ascii?Q?Q8S7OzHKaEDNN7jfkzTgFBzZrM2EaTWGR6Cp6+R2CuCUcasfTvYGGEbD30CW?=
 =?us-ascii?Q?Gz6RxH0WX5H46pdV3qklBnL5esy1TGmhV/4Nr9vm1mCKZ+Ixyufo4grqve0Y?=
 =?us-ascii?Q?b+NUxqHtwl23Nl5usDMqM5JcTb2k/vpEiLjYwsUHvC57RP+ZTIRNqTF1VIaa?=
 =?us-ascii?Q?BBSfiN0tFOhQYn+gFVlw6nweL7LL/vDiQtYh/0vP9oTDzbnfW2gr+VRwEb7J?=
 =?us-ascii?Q?A8nedaqu30CcPzdfVQUlDQngfviV4PeWpjEbZOpK6PJaelTznhGIOWtvkrLS?=
 =?us-ascii?Q?2huLl4duSSDA+qZi5zM/mxo5/79aCI+aNCmimBgMFoK3lVr7WdSthv1gCvo+?=
 =?us-ascii?Q?Lsu0zqg9TuhoI31XtNsyAyutnPxMLpS0aU0nrOLFFl4S0XDS4rNsF6UqHmPL?=
 =?us-ascii?Q?DjLF7tESM8Hkc6uG0HnlGyFquu3mFiixMNfzaqK8Cnh0OCei7nxWCVLV9UKY?=
 =?us-ascii?Q?/UcVOhS4ZheTXWw1KVOPh+J5DGEAjGI3EFcUaRXPSifY1WUffLwxwVeFPblr?=
 =?us-ascii?Q?0ET3zvpDHsKI1qNq/mjDa3gC3zjHwXPyg+QUMRJqb3unk6EpeO4pYBaXmMs9?=
 =?us-ascii?Q?dRaN0qVLxlKmPgtaewwdKrLpHqNCSl5l9Huy6hXjzGOyrP+5Pif3GW4O2Ld3?=
 =?us-ascii?Q?J4pBGtD0KilojbWY7JEPPoaGzxtLMeHuxmejp4qO9IU16R8pRnbOnfWCgc1z?=
 =?us-ascii?Q?RpqatsPHmGIUt+oGcVcAFZOWRhpOlFzW/j6RtsYVyctbrnPTwXUoNiWhu+re?=
 =?us-ascii?Q?HOskqN7Bkrh7+4/JKGx730gAqPEfi47jTP3f82HrK2kXkJ2p5L6iMhBB+VqR?=
 =?us-ascii?Q?KYcnQiw2/6oYH/j2w66+5EioqdBwK/KBn8kurncSJUoxV79oDfhYzvmp5ZF7?=
 =?us-ascii?Q?KuKeTvSfTtAk/fU8j+I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327bde10-38f8-4ed1-1028-08dde6383df7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:38:59.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rfKa8rVYKwrh5cW7XkPc0kzZEP71J5rSBMbqytNTa/OLLKC3oOSgUlFk8Cj7ZoO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327

On Tue, Aug 19, 2025 at 08:36:49PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Rename the IOMMU DMA mapping functions to better reflect their actual
> calling convention. The functions iommu_dma_map_page() and
> iommu_dma_unmap_page() are renamed to iommu_dma_map_phys() and
> iommu_dma_unmap_phys() respectively, as they already operate on physical
> addresses rather than page structures.
> 
> The calling convention changes from accepting (struct page *page,
> unsigned long offset) to (phys_addr_t phys), which eliminates the need
> for page-to-physical address conversion within the functions. This
> renaming prepares for the broader DMA API conversion from page-based
> to physical address-based mapping throughout the kernel.
> 
> All callers are updated to pass physical addresses directly, including
> dma_map_page_attrs(), scatterlist mapping functions, and DMA page
> allocation helpers. The change simplifies the code by removing the
> page_to_phys() + offset calculation that was previously done inside
> the IOMMU functions.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/iommu/dma-iommu.c | 14 ++++++--------
>  include/linux/iommu-dma.h |  7 +++----
>  kernel/dma/mapping.c      |  4 ++--
>  kernel/dma/ops_helpers.c  |  6 +++---
>  4 files changed, 14 insertions(+), 17 deletions(-)

This looks fine

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

But related to other patches..

iommu_dma_map_phys() ends up like this:

	if (dev_use_swiotlb(dev, size, dir) &&
	    iova_unaligned(iovad, phys, size)) {
		if (attrs & DMA_ATTR_MMIO)
			return DMA_MAPPING_ERROR;

		phys = iommu_dma_map_swiotlb(dev, phys, size, dir, attrs);

But attrs is passed all the way down to swiotlb_tbl_map_single(),
maybe the DMA_ATTR_MMIO check should be moved there?

There are a few call chains with this redundancy:

dma_iova_link()
 -> iommu_dma_iova_link_swiotlb
  -> iommu_dma_iova_bounce_and_link
   -> iommu_dma_map_swiotlb
    -> swiotlb_tbl_map_single()

iommu_dma_map_phys() 
   -> iommu_dma_map_swiotlb
    -> swiotlb_tbl_map_single()

dma_direct_map_phys()
 -> swiotlb_map()
  -> swiotlb_tbl_map_single()

It makes alot of sense to put the check for MMIO when
slots[].orig_addr is stored because that is the point where we start
to require a pfn_to_page().

Jason

