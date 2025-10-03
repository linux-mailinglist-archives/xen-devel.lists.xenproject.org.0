Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827ABB73BF
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 16:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136615.1473124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4h4n-0006m2-8R; Fri, 03 Oct 2025 14:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136615.1473124; Fri, 03 Oct 2025 14:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4h4n-0006kY-5k; Fri, 03 Oct 2025 14:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1136615;
 Fri, 03 Oct 2025 14:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NctN=4M=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1v4h4l-0006kS-Hl
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 14:48:03 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f90b78-a067-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 16:48:01 +0200 (CEST)
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:47:52 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:47:52 +0000
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
X-Inumbo-ID: f4f90b78-a067-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJAex6hzFHaZgvbm/OE74QjeS9s/42DgvA4BnKLZaI3JlvUThHBtiBZB2x9xuh5W5TSF6BRK2RBbKbqCMJQX2o1lqBIwdW2TE1ufhWqyq+gfsUwTgBK5mM1Wse6rhAVub5PKMkhO/AfijZFbUYqEXSEDi3RKo9nOdBgEX2cMyWhBv0s2TwKjUTnjbVushiHNojBkhNDKnX4c1fjJ4eM0Gd6j1qnBGNbpmfzRS0wjYxFsDc6yDd8+OpOtTpyYIYUL0M5LGcQuqcrDWK854WOSi0pRkkloFN69O/cziU8mcywdAIk4Q519yRg48aVEkPQf+7Tiy5HAQLxRIGTTWyKSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ475V8TnBe1+YnOi0OM13gHXwCbc9iPBrWJTa0MFkQ=;
 b=Jqw56dUVoJWsrmso4GKllsEj1uNpwiMGwEa15e9zSrPaArN96laluIgd4+dAjzGuQGEXUfS9gRlsvXNkpw1A6fdL+ZJ6m0HAeI7K9nVHU9kfAD9IR5+ZnFNJk2zj4ujUikM1tR5WJ0IOjtoQqGBaQ/ScFyQ8Dxlaw/DSpo+sAzfRLDWsjxV8Z0kDreXljvumBGen0wuQf9pyNnyLrVbdtRTHggVzlkrZZhieE/MPO9PzP6tz8LKilpBeNnaHKoFWm3NMjZocAqIVjtsL0USiRM+Sv4qVqkUcEHdkSuDdByJGCkftN16WzogBHYCDmKQ4MehZiXktFlRggqkDzugvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ475V8TnBe1+YnOi0OM13gHXwCbc9iPBrWJTa0MFkQ=;
 b=CVQi0FkGYw8tlvGd5rYCASujlT3TXQh1NNuKC8PNe3ypxa0kZKqkkS31/uu7/btZpaYD6T6mZVlwVPFdvmfxehDwmXHpkOqVwVRjwJ56BEozsv+DIkaasYTmGFiNfhn2Se+jisZe2Nf3JFe4FQCxYy+RGqr7V8L3ZSyvQGmiMc1EiJ4slogpaIOf4AmA2B+gdBdPDWNQNGc7BvLwOYQG9L2eL8qqdhUHCqvRCapnib0ntNGBC43GKgv62x5e2B1037VEnO/lWOWyJy1b7IJGtcKdmYC9BrDSIBJx/um67LLXDip6HWjKwku9o3cJOZQvrsvLD8pfn5iHmGEf8pKB6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Fri, 3 Oct 2025 11:47:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 1/9] alpha: Convert mapping routine to rely on
 physical address
Message-ID: <20251003144750.GA3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN0PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:408:eb::28) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: b1af2300-73e6-4b41-51d4-08de028bd475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNMmRh+gl8xprZAvMDs1y5iFJRI/RpEg8XCBTsPvcxRJxqNwT8eu7ICKYqaN?=
 =?us-ascii?Q?wqO8emmbgtdKQmtvOiRhws6RBymzHZIYtzLBrVzU14kr4dNI89N+xgTxd+UH?=
 =?us-ascii?Q?gYyZ0Z5SOpCLR10fZOgRyfJ48d0pSu7aKNqkLYwufDKeoG8COqfEqHEfAp6g?=
 =?us-ascii?Q?sptLFot0qlBrFx82pWnmlRvWI/5Y2nUo5uHExW7qR2W5YTKIejNIMrUqq/CQ?=
 =?us-ascii?Q?Puiq7ew09DAjGjSryVqNqCVKEpq/VlwerHszQC7Mm9AtbPFGqMRnyCRNnezI?=
 =?us-ascii?Q?ekju+P4T+/r0MHN1HcPb6Jxy6C4Wi663GhFCNi9Sj9yw1o1S7ZT+tHAxoar4?=
 =?us-ascii?Q?v/4BhGAS0NX0CmSxd8w+o+dXetUCChr7hSHqZohu9dmlByNCWElnTKqajnh3?=
 =?us-ascii?Q?vO3/3zHgpQpyN8uC+P8+rD+9AciYjPP4vTUOGjiojgPbhVivc5PhPfmJQbVw?=
 =?us-ascii?Q?YB4WshB2JZYvgwD8LQJAGyfBuVS0b4q3zXEF0BgpwuzmGaOyxQqF35cDQB3S?=
 =?us-ascii?Q?gwGzOQePwylOPZ7po67+4fsjzQtq0FfKPZPtYmvpeP/taSy6Keh9Av6tTf36?=
 =?us-ascii?Q?SNEY0nADY2eeVjZ/6cQOBVkmwnaHx4DEgFQ4nUKf/CUhPJ3atUrj636Wo0zm?=
 =?us-ascii?Q?fJXYgAYzqmyrXnCFNnktJ8kf3v1hzmuQIgfcojLxL1EedAdvFkjk4ulOqWUh?=
 =?us-ascii?Q?LS6qpurwT5A9W0pkgrVkwgL/RrHZw+TdY2LFicYBef8N0/6CzBct6Mj9GTxb?=
 =?us-ascii?Q?p/2ZrEnYYCaNffNE+7Dwkf91BNXRmRWHa8KDfmhtzdqUDE4PaAbvdVJ5+kPN?=
 =?us-ascii?Q?3slhe+B3HaHVYTSZG2Uh/1L1RHp52DIEb22CbIFsWf3Vd/A334EKqWIWgOna?=
 =?us-ascii?Q?pUd3EUMHfd3Hwe9KHFA90XNkSBtRV/MhI6MTnbwZyTOfxQIgESWna3Nhju+k?=
 =?us-ascii?Q?JlY+ZtyGPiLBdSdigTSMiTMI0QVdDu/8ZsysrrAFS3oHA/jRaK3Q5RZ32Yfs?=
 =?us-ascii?Q?q5t8njI6sYwZ37YYw4nBFg37BZlpoDg0EixkbXRVeS29cVTc+PQ6vN+5dCE6?=
 =?us-ascii?Q?jbfivo+CdaRoWgQh/JIAsOwVZRdgZI9lksZNlGxpQBJFu2JUNeeBdUpO2wtm?=
 =?us-ascii?Q?IsdFYq46j9F0bqTh8qs/pIlRNPdAzsglbqQ2vvB5hYrBehmauo5BKoNxSi79?=
 =?us-ascii?Q?LekL+Hl0sYZWfXQTfJZL9hs2LrCeQrFOCwb1cQ4eaUp+829gs4m6BdNItBXY?=
 =?us-ascii?Q?oiDYFNK2FGjspVLB8cPqhKLTPNcJSdMC1TaWWsdMOpK4TtjeEus/zIRQCeE+?=
 =?us-ascii?Q?GbWr+SZrhE1snglet0WH5hyjBnNAedGTLYNkZSGNMr1An6sAd5PxOrCT5vu7?=
 =?us-ascii?Q?HzWs90YuVgnSAtg6HvckKJqCsECSi+kAzyxUEl2rjTrVcjdfL1IuyYKcTUZm?=
 =?us-ascii?Q?z4y/tOp5+UlfZ2HBknwtXAKtRY/nuPg6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1y+boVQQr9fg/uz3qlMpgeI+/KwvPkxPWSt5aaiS7BsXTr4WfvZqTd5iw3Ic?=
 =?us-ascii?Q?h3ao8N0dZVCVelCkzyp1ANLIkkOZuuKW27A8ioxBuobtfPrFYrqu/xv43t+7?=
 =?us-ascii?Q?WMI/IThM/jmMMYmP+3V530+gtoLtlgYZez58+CTxksvwRGeAArxadnKgM0P9?=
 =?us-ascii?Q?m+IiPsh6b8YFMPkmwgmEnutltlteJ0DXGtpiOTXd8YwOUqWJPuP9aZ5304uj?=
 =?us-ascii?Q?XsyTLdTu2w7VDhP1Z1Suh4B8KVad9lj0sAQ8k1tcu7bc8yUqpCwg75dRSlHi?=
 =?us-ascii?Q?7/JyfN7+bTcIWQp5X5gL6jbOXKuk+/BJ3VjjxAfAVkk6DC7ZwTZIoaz0rtZa?=
 =?us-ascii?Q?uG2trs8eiOB32+03v/57LhFdjZZtSn2E6PoFlHiuSB1RliXEiyLdGdWLLsOw?=
 =?us-ascii?Q?qbxdf8pfLYEbnACzykhR1UQvMw71v+RNmkvLIsammwy4J4RGPTD2atrNu3AZ?=
 =?us-ascii?Q?i9jTwpl69DLdVwex7rHcSXtT+2Ref1/+v+XODQscnVLNXhldoRhTsE4Crcig?=
 =?us-ascii?Q?GTXxikla+PFBLj6T/91qLlD6Ni+LEI4wR3cWL2OW2Z6nUabu4iD19LeUeqr9?=
 =?us-ascii?Q?QyCZb81be1WzegLG1W2JMz8mXWtpmWm3/2m3mH7Bl+/zyVOMU1fNUD8L+lfn?=
 =?us-ascii?Q?wPXaQiEZIUX1IKJzHAxwOcmCXhE8wGkAuw+e+umTWY73Acz1a0t/jgMbuMD0?=
 =?us-ascii?Q?1VqAZ4KHYVlNxAMMLPHRnmqywtLq3knqVj9Da3lmTAq18Dto7gRLyeKsXx5H?=
 =?us-ascii?Q?rlHpiwBDA07iixSYj+YYkJpEiGmS0o/ZPI6knVESOUrfgTvRFSkqkKXeEGEL?=
 =?us-ascii?Q?GYeKs89D80L3zdlezVbW3xdi/g2HmCuriAGvyl0aynb9mhLNY7bibXVyod2o?=
 =?us-ascii?Q?BJfQ8LyLb7IXpXnDW1GFABo64zEZdMmViZyyMYwj4zkFVt4qD8sVFUJtBL89?=
 =?us-ascii?Q?cxuJjhINPN/LCdjGaczap7mYEWx4tsCBg1HDNfue1TT5iCHpCgH5ora2LHZ3?=
 =?us-ascii?Q?qLTJ1ZOGZKp8kW9D1RFR7jXlkobZ7gaM/gB/lv/o9NUkjUunV1iCSqi+LveJ?=
 =?us-ascii?Q?aVNlNHY5NZxcNMzMiMqzKg5qUNzqZVWZFB8hNmtrcCEOicx6Ru9yKOlPIl37?=
 =?us-ascii?Q?hbbiCfCZ9m42mGfRSwnlXoZx3lgmxIb+YOAVYwEbBHNh1tMkyABFvipoi8um?=
 =?us-ascii?Q?NKqMqy7VIHlMrudVN90bXWrVV9IegnNW9HBsgfYwtof+nGy7LqY0JInowAZz?=
 =?us-ascii?Q?9C+SJaUHNN5d0AFQa6LuaplTEw5AP/xxGIGrUd4GacsA2UA9YL5SVPIzuKwY?=
 =?us-ascii?Q?kVAPUmtiCcY3Bbc/lNOuOnq254uVtDswoRd2HheXkdpcppo1HrvqEpLytVjj?=
 =?us-ascii?Q?GCMnohAiwKErfXxguZN+44yml3BKH4NwzzxQsdShu+cUSVEHPCl1OeWVADTV?=
 =?us-ascii?Q?AmoPbQl2JTTBpeLtBbJO/l+R9pnq0NGEFld6RZaIRXnIoJkn+SzcignPS6dC?=
 =?us-ascii?Q?WwPP2bEOy+q9+M8DLzQPwFqnxO/4aemlAKfZ/I9v5aYoV2fiG9sbsF1v/fX1?=
 =?us-ascii?Q?ObuRPHvllMTSsEWaQ18=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1af2300-73e6-4b41-51d4-08de028bd475
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:47:52.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDUjsMcvQLSUKdXsnZ14CcarxBcF2QIdX5Acy16R2ECakBykTEspVxaEQt/ihU4X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

On Sun, Sep 28, 2025 at 06:02:21PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.
> 
> As part of this change, remove useless BUG_ON() as DMA mapping layer
> ensures that right direction is provided.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/alpha/kernel/pci_iommu.c | 48 +++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

