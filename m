Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B6BAA31D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 19:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133078.1471252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Hp9-0000cs-2R; Mon, 29 Sep 2025 17:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133078.1471252; Mon, 29 Sep 2025 17:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Hp8-0000aR-VL; Mon, 29 Sep 2025 17:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1133078;
 Mon, 29 Sep 2025 17:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cYBO=4I=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1v3Hp8-0000aL-7Y
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 17:38:06 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ca63d9c-9d5b-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 19:38:03 +0200 (CEST)
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 17:37:59 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 17:37:57 +0000
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
X-Inumbo-ID: 0ca63d9c-9d5b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDMq2CCp47es7DyBodDVrWytMKZpwCQFk2Upq+ibY6VHKMNVJcLlZk1YiCwiWqg5Owbnn6aZe9VxpxbcdwrzEZjql2rsjgi9IOnWU3r+S7vQvsEuakSPIE2FIRsRbS/tXvUxo2vEEFfubGSToS9BX+CHrmrXY9zRQnJcrnCRdhaWeg1Hid5eCfcC/ztb0EGdVJh2hIAxbxUSLry3jPuaCHJbmI6nV/wIcCM6JLSWDzSWVMADLBvklCTeTUBT4+kmyuRQkQe6xT6cxVd+MTCTJhYxhSVEzEydIgE9zBtCDoAwPI2GoEnG24/lbeMoSL+6s0ov/hLiqYDUvHcF4KpK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF74VPPHEjE4XwB3q2M/KfcPnKwJHc3I0+qZKMETvzc=;
 b=cVPIKQtrY48PU5KyqdAtcBDW+MBO5Qrz8HtlwkwbBdcxcJnKBVxYlWfPEbuWgSJJf2LNA5Qf4eOTvblsU74xKnG6Tq0s1R9xvQcGgZylofZXwEGKj+AN3DlCb+wL1yeWYaNVxMYwKxt660yeimclFZ9aQEOim66H11/yvk8wYt35atPhLsgtL18ysIYR4Lep+RBpIHpaNviojL8A7Baxsz4G5oBrU2SR58LfzxLL1m5Gy1Wf9wjPfua4x6cbOvKK8UXGYNKa2zU0HoUK5ymiiPyKcCcrvphuPOFZetFMcoE1THwngTFTTLVbmyVdNNr9g4EQUFVF2to1w83n6ZfejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF74VPPHEjE4XwB3q2M/KfcPnKwJHc3I0+qZKMETvzc=;
 b=c0FHlgizpouPngbGDaY4VL8cFyf1plkNlhUa6xga9MsMHO1LL37bgsoOzhG9P9uGmtwUmGCYUfe5bSiWzlVFgyZujNB+SelNeb0Jmhed9XwcteD8b8dfyyRQKYFTjeNuhc46+oZaVTNKIsUdej7aymOExNM/MyoINUgeaR2n+34xu2911UpvLW/dyy01XdvpY7cGtyj3Il15wktMQYF4JFtAcOnSPXGKSDdxpGqa2CZiAVdJ6bmTMDHN1xbqup8bRODCLRA8Bx561EzCWSjzwTfcS3Bx4RiCqVCIBPg63ZEp8oymSu47a8NLry8c2cbiqVY77N3hkCLEsRuvRL3S9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Mon, 29 Sep 2025 14:37:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>, iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/6] ARM: dma-mapping: Reduce struct page exposure in
 arch_sync_dma*()
Message-ID: <20250929173755.GD2942991@nvidia.com>
References: <cover.1758203802.git.leon@kernel.org>
 <2f20069c2b616808c034ba4e75905820b94e0e22.1758203802.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f20069c2b616808c034ba4e75905820b94e0e22.1758203802.git.leon@kernel.org>
X-ClientProxiedBy: BLAPR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:208:329::20) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: e67072d2-7f07-4cfb-5634-08ddff7eedbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tpSBc9tfMjdSjmNhAiZRDTRAak5b7gvEIu1hS5TSV2mXP926e8a/UVjVn4D3?=
 =?us-ascii?Q?nPHjK08pgo3G0wFlCvw0IepJMcXZoLnaqcQZ/V+QozWBJjvH1mVq4gQt8qDs?=
 =?us-ascii?Q?9Sh0HYUJfEc7t4j8oexxXqI5XAH5npPvnl8N2HszXQh9tdY1aDBXtgDuWc5i?=
 =?us-ascii?Q?/uDOLASgMpQiGslQ0Ev2d1xOPgImuysmnO6hk4uYlT58xrFaDrn94vRMlBN+?=
 =?us-ascii?Q?GqcISxIuRNqHFdh15HGFPvsFVHAM1kqlGusRU416xEaFMFtUKLP0eAy/k+Ah?=
 =?us-ascii?Q?bQg2r+bXGt9QsTpNAoj0jtdUXeQeJvtnBV9QrrVdtZuhaazxd/XTVVOx2O0s?=
 =?us-ascii?Q?qMhGOPLPwJkMrfeJH+r8A1uyhxGc9dFwchah5yAFkl3XZWiy1yCvC8JqHhNW?=
 =?us-ascii?Q?JpdsGna+V+HcROgFJLyszqiSt8C1R26LpbldSdULISBFu8/yj3T3kR0KLDd5?=
 =?us-ascii?Q?HhnWv9QADIQ/mAJ+jtzBYDu2YUakz6iJXut4klcCya6dltAT/X9TmQt7NdWl?=
 =?us-ascii?Q?PaO9oLFb9EcmebxftlM6FNUG2xx3KNMmdtRshcfx9UuzrUo1EWbKPgAeLqct?=
 =?us-ascii?Q?3LZOtfMQgv5EoqkdKfZUkaNBdN9f48FPa9XvT3p8zzxAKNg+0qbRMi+r+iRB?=
 =?us-ascii?Q?04kD8rJ7H6i37hHhC1rLRZ/2t4GvHaDgrk58AHCzLSV2NY8OavN9HIGerjyr?=
 =?us-ascii?Q?6aU4SyaXQijxifse6LB/n29PIFovBr8vF2GizomdHoR16Y4GkdMtXYb4EcRl?=
 =?us-ascii?Q?i4vn3DdqMkYkKAcm8Q3wa3mWvVDRRMUFvEISKwfXmr1FsPh2+LbqtBCzevjZ?=
 =?us-ascii?Q?bgYRpJgBJ2/1gGVcF2e5MqAkuzn9VZSd/x0JYlJ2AJ7gn98zun/kwK6MouvJ?=
 =?us-ascii?Q?ZwAD2AyJ9cnK8hLUU+C1XNB77S8r2/vFYP6NdxwhyxsxaWJ4JcL2ZzzCmn3b?=
 =?us-ascii?Q?pfAfbZiLKPdipuVF0JdDtLeot38E9ZlRtm77d9zTQC6UwX1RcIBVaDY2EXab?=
 =?us-ascii?Q?ZO/y7tVUTZOiikK/CbQsvKQfU2RDJKH2TBscK2I4rjVvdc1qFCKsdb50jIvO?=
 =?us-ascii?Q?8aQIuViiYTBaW/XWvGrgv8Fgikp82zbBlUsmR3j7nENgYf3v8Qy5oP8CRiJ2?=
 =?us-ascii?Q?GPUGxSTBheHNMV7wmHEor9Zi/eahIbS2eGr9gHELyjgx+hRWK+/kHh5QwimC?=
 =?us-ascii?Q?OMvL5xsZJX0Xh3rluae9q4iKZCUFrV4S97Giz5/uaJK3NRjoGw6ujQvlVwVW?=
 =?us-ascii?Q?B9G55mXZcAKCwGhK9frdkUJuXGxWE1cQ1TC55aedr6uqCcQ0PFViLN90016N?=
 =?us-ascii?Q?X/+sdCUTh7AuK/19OtwtJWKDl0jVAs9eo/wk/ViKT1bImD205CdsxkQ7pFG0?=
 =?us-ascii?Q?RiqZkc/chsIyjWO0v2kZKJpRlUWr/zTJjBHLEsiTGOpJl1wkDMffyQgeTkfi?=
 =?us-ascii?Q?z2vv6FB19hwj9M/Pzr4P8Joc+WeoKwzA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXqqvf5Wg1hkvjCceFkQsx3qwL0XN8hegrU1q2jK3v3N5wyqGihj3CXVnGpz?=
 =?us-ascii?Q?ZlA59uFHqhDEsrYVOYWGly+BhdVxpJoK5vsxCIPRwWtMr1wgG8vHpBBTwBFn?=
 =?us-ascii?Q?SUE5kCXkgwh4YUJTC7RmgBZUsr2dBr1a3ltjAVws4HchX3WwfCRsFtHtXge/?=
 =?us-ascii?Q?ALRlCU8VHfIrk9WZjaUDdq/ZWq4sB3XZKznAlObtHz5XJzcEBum+kymcblds?=
 =?us-ascii?Q?QOZjlZFiiSYDtdgws668HDXNOrjdwIWjot2M/aVqy9hT1q9cfFN8K1DmJ9wV?=
 =?us-ascii?Q?r0iDVvwqa8kPyZFl/RqgIvgCaxPgT0DL9tyzPiNt6+dJCB9almdMwpMy8zVN?=
 =?us-ascii?Q?bj524rT6MBSYK8H/SeqP2HlhWjjRlwe8uO57jsUXey1XvS8ofhP5S9N25vOJ?=
 =?us-ascii?Q?0VyyZHbCU0X9udZh1wsztzQEsfLwfXkyxZ9c/ge8h49op0Vy6IqpepJ3GBaW?=
 =?us-ascii?Q?IYueIvAMZUoOsrPOiYhQzTpb73OpCAacZoQUnidquFyHTlrR3L164l2wLoUF?=
 =?us-ascii?Q?qqhuEKe0UbJvRU1dy1tU48TYtldPZlORl8LFcnXSG7eKzJJOe5lsAM//SyZI?=
 =?us-ascii?Q?YM/yZKgz14CC9LPPitWsdms7S1R9FebupyUNU3BCYSLoVNSgLUfc+a2GJWAo?=
 =?us-ascii?Q?IxwtIXkOlPWMCk3ZlU6A7e/uroE5aditPmHlRILY/u6Aum/Z6p0qPeU+J/Fn?=
 =?us-ascii?Q?Oae6YCXfCy788MkZjCrYJkNfnAbd8QZdSlOyKckZJRmfCeOTPQsZWlwk7HsV?=
 =?us-ascii?Q?BsUJ63NFEtTJ/IX1RsmNWfM4Rp3L+9dhYF6qGl2kRYobv6V2kj7Si4Zfh1hW?=
 =?us-ascii?Q?FW13bKpNtl3QxYl5hj63hsAGoTpco+WyypWG91mPODjwzhzEMWefS9d4sQ+O?=
 =?us-ascii?Q?+TUkFGoLpnZeeXC7LnEIG53kjA8FvZzTFEQbKhtRFdQKtnU0Rvc7BJhdE1A9?=
 =?us-ascii?Q?OziqaZvQpMP9D36OdcXQ4rAaglS7BZtRGrS3dUcfZQthiQ/1a43yiQ7P0vKK?=
 =?us-ascii?Q?iqZsLwH3XTtl2BQMxrYH6FLZhC27XgUpaT7NeLhI6Lhzu0/PcEi83JU5rMTk?=
 =?us-ascii?Q?W+vfnHd9BbxrVF8ITJuckFJl8JIrxsZkTosC0et6VjgHAjHYSoI0+sEe3rTX?=
 =?us-ascii?Q?cDAxOV3sWJnu40a6Pqc/0q7eg7mvRkkgRcrPSiW1tUB680PNpKE2gl1Mk/7J?=
 =?us-ascii?Q?ibq8kkL7GV4eL9EQ6D2Pm0YxG0QvKGSQ383iSiwSXc06UUQQrS+o8w59B3N2?=
 =?us-ascii?Q?XLYIwLYhL9eKkjms5YC2USlVVWdWTwW6pGNwRwJ+2qAuYFDjZXB82sHZCrGD?=
 =?us-ascii?Q?ADBOHDc477IlQuNPgV7Ogd+XOG3+yfGE30Kry2ojr51SZc1iy9K/IMOK+SJd?=
 =?us-ascii?Q?1U+esNcQ1BmzwOKZUXUOJp+Lm812wtduGxfHFK7EWeddQYO9ljGDQLAw8OPQ?=
 =?us-ascii?Q?PPihGidCyLhXiK6ytg9nbkofrePm+4z7kLPv6a9Qu/Vjw4zO3Vi9eHAmdDul?=
 =?us-ascii?Q?ZjieX1PhWvQeNvnkzrU7L/IMrry1+ct8hEJZOumBrmT6uTuMogLcTQyGgrRh?=
 =?us-ascii?Q?MerEJkZGzY5zr4QGB5XTN0B33/sD5ao+a1Giqtzr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67072d2-7f07-4cfb-5634-08ddff7eedbb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:37:57.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjbfPMXm/K6Pv13Dx14ay3arFUwSi+Hnt6H763AyJRqGyJ4SyYrg7WPr9UdQ3XP8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907

On Thu, Sep 18, 2025 at 05:09:26PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> As a preparation to changing from .map_page to use .map_phys DMA
> callbacks, convert arch_sync_dma*() functions to use physical addresses
> instead of struct page.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/arm/mm/dma-mapping.c | 82 +++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 51 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

