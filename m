Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4315B8BF84
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 07:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126907.1468285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzppG-0004dd-NO; Sat, 20 Sep 2025 05:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126907.1468285; Sat, 20 Sep 2025 05:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzppG-0004bX-GF; Sat, 20 Sep 2025 05:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1126907;
 Fri, 19 Sep 2025 15:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4sOI=36=nvidia.com=leonro@srs-se1.protection.inumbo.net>)
 id 1uzcst-00052K-Vp
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 15:18:52 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1920fa7-956b-11f0-9d14-b5c5bf9af7f9;
 Fri, 19 Sep 2025 17:18:50 +0200 (CEST)
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by DS5PPFEC0C6BDA1.namprd12.prod.outlook.com (2603:10b6:f:fc00::668)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 15:18:45 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::76) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 15:18:44 +0000
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 15:18:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 19 Sep
 2025 08:18:28 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 19 Sep
 2025 08:18:27 -0700
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
X-Inumbo-ID: f1920fa7-956b-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrXYES7tloy4GN7xmegmmq+QzIxvVMZuUUCrJfLLiY5FyFHXGmpCWwQK/Sir6EYKTPhoqCJ28nMmLpEPyHFw/lXu9Gv2qte/kCiiEigigaCsZuHF2xnDott96AnKEzjKt3jPvX74/Ck1v9/GRTI0a6e6+eDffdp9yRuYFHZwT7RMZh7eekW8seTvzW63oaaYQxYGP3cEl3Ymv3a/SS+yNRLtJQXs88ZjvCVK45xqkqjtxbu2VqPQukxSXWe8wo+ZMKpXMw7gKko8VI2eqAotu8EdK45FSTiuq36W+nOorSH/PdwKjy2LXhuLP3Rl0ZgEGpG/NEdxXCTOvTF2/4aY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK2nYFTHT+KpSlXE4qZHTuuO1xzq1cYHqgz67BqwHLI=;
 b=VOQxOCmyHMpqGvd50TSk8KZuY8a5dONPg0iYjGKIbAzBO16k/i/N74BZBO4mXwG7TkxOL7Es+EALZK9xvsCH926TnUmze/9RX6wnuYBet36WVAgqC71G2abEWZ3SlpmaOE7BYQheK8olW+Y20IEq/DSnLOZaGIoscWLfFzZHh527vYvUrkSymXnAIvYLXxOyxjXjQfGKtckx9rBGVfdlKt1I7JISNNq+hXG/++cpbKHJjIKjcyl+hqu5JJS2MvuKDjx3idLuTEpUzHXYAqpL1xllv2zbFlzKoNN+I3TjwNREn8PG46o59fwbJ6g9dd5z9KdJzbnaQE4AnclFa4NZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=samsung.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK2nYFTHT+KpSlXE4qZHTuuO1xzq1cYHqgz67BqwHLI=;
 b=VDi04SoHli8++kWiAWLzcEfnAVuAslj9P/bMvuOiYKK3yNHwJ7E2A8Sp0J5txKqIVoaEZkG+O81q5h+SLrVcQvMenmOBEKHfct4/jSWpdoQPLYWLYyqWR2c3ku+91lNt/+/cSLji3RctQh6HcJi4+tC6cb4jwZJmo0iIxQAqOeozlqYTpuNFVSSXR86n7zpy5aGhju+8twGtF7Uyd60rza7AP5ngM/b1NocIdHvsHpc47OQfajInsf/GG7uFWZeD9F0LYfbBE0v+HDCntt4FKFUYMjx9yglGxLunnQw+2AeF5/KfZqfmlOXIlcU81emfJh6Gi5uUl8xFSXNVD7jpGg==
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Date: Fri, 19 Sep 2025 18:17:23 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <iommu@lists.linux.dev>, Juergen Gross
	<jgross@suse.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 5/6] xen: swiotlb: Switch to physical address mapping
 callbacks
Message-ID: <20250919151723.GG10800@unreal>
References: <cover.1758203802.git.leon@kernel.org>
 <997c0122a24c355b4d7ee353902041a7617f4c9e.1758203802.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <997c0122a24c355b4d7ee353902041a7617f4c9e.1758203802.git.leon@kernel.org>
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS5PPFEC0C6BDA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be5ae2f-3e5c-48be-c707-08ddf78fd25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sInZGPm7TkDBijFXUj2OsW4w9zTsuWTb6mfZCqdO5HNrehIqFMYV81+AXn+z?=
 =?us-ascii?Q?y8uybBsu3zJgsvgnuurYQOfebcdO2D6+KY1IgHS4ivDI0tcyUZxMWGiuXXIV?=
 =?us-ascii?Q?kNGTQttFBPcSWZJRV902mPxTpxbSE5UnBaoLOczKHJJY4pzjTOMhZ/yf83G6?=
 =?us-ascii?Q?ieBHDqepP4A2ZnHC9ioU3HsD1zHkZ8c9rjAwt+O1J5mabZk+nEokWYJhPLUn?=
 =?us-ascii?Q?N0Y06rakyApRoCrYZQn8cncYHj7dIoyw3XDzeZkeiHMlSd7T9N14HQjRlCca?=
 =?us-ascii?Q?6pLWBY21zrmZDbqKb0DhxY58f+kvRE9mzQXdYNjw3+pw55GuWBDM9l80mta9?=
 =?us-ascii?Q?ILw8+MEXGRZAvJ2jZCfH/xevVGb7RNv14o/Cgpja3dekRBKHegXtKMvV6Qdj?=
 =?us-ascii?Q?LHXrfYJKC11cNTAAh1CAnheArarPh5oSh+vmlaKw7ziJlJEin2AeHaK91aoI?=
 =?us-ascii?Q?k1o9mw7aGiUotNfo3ruVRNTba/Kn26FGzQV69wuxBII53YNW4Ivagj/CfT6G?=
 =?us-ascii?Q?+9Cn1L+6bHjf70o6vUKaDGrXIKJZGSjrKWmlcWSGQ4F43dnyvIROAre2SsEF?=
 =?us-ascii?Q?Y3TU2Bc0Xig1ZyWIOt+snEDlHpx5F7pvXobgzbVcwTdisjUeybKp5fge4lg2?=
 =?us-ascii?Q?0Apd8uF3qlcL93pJoO2upollt/dW4xYBA4koRjQOu4ghWjWBbyCi8UXVUiLr?=
 =?us-ascii?Q?D6OT54DYq1CY37h2KM0xBsGg1zGisazBwO9Cn6nP+xecad2w7ClDLdqUUsx+?=
 =?us-ascii?Q?6V8CYlIQulM1mqsdmPfcCnfZekGOlQigtPjU4qWmV1wD1UKqPAHx4Kjc59+i?=
 =?us-ascii?Q?4k6AJSxCO+9g21RVMhOhpOfwyuBwLjx7dPtKnAYxOb0wtqXcsaTwKcRJ4chf?=
 =?us-ascii?Q?Q3LQaUqM33ES6dbmO4rUW4ScLVX/X+QaZGOyJ9nOjj9RkVriM3luRSR8n8Rf?=
 =?us-ascii?Q?1Ps2RIiqeNrXJsXL0C200CIwyM+BbC31VffDD8p8WrQk4LQhuXjxKBs5mYoS?=
 =?us-ascii?Q?kpWfxANkbAiA2mgRzEe7ieMwT2KnrZ+tLK6dImAxdnhTbxJbskclhyZp8zYg?=
 =?us-ascii?Q?ce4bI7QLKlp2KARFGcAd5P++K3e8/wCa+liDhI4lWIRn8frWLBPaQhlkq2qs?=
 =?us-ascii?Q?9O9qryFwG3TwqorycZSsuYKC+dFkIjE/UYNqvdolOPT9TRtvJD1ibrZBKA0Z?=
 =?us-ascii?Q?jqfuyIyMSAea672qiJj8nB0SK5z3mVkOSQevF74xlSSl+L31MDNMaHS25wtf?=
 =?us-ascii?Q?iSt9wNYXBSwETv0iOWCNasyrti5Ff30JpWaMHnQOweu5ro5PcEt5Q1Ei+LGA?=
 =?us-ascii?Q?RA6v1sH8IdXNEAVMRd+x2lY1foTNiBwV0kS9Mp/ZyB9MlOzZ0LLDO28Zdh4H?=
 =?us-ascii?Q?OgxBtUyNYQan8697egRF7oxDTtmWdDfXdAhLzgNMbPXrOwgVZZu8Bys6YkJe?=
 =?us-ascii?Q?FG14qkwjuy82E9+bjbAodLKfSt5C4mmvA4BSpKP8QtsXOAgJgIGGL7iBTPEQ?=
 =?us-ascii?Q?dGxMnMjNTz4tI6XYAnYCSW6fe43JkmrC3GqU?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:18:43.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be5ae2f-3e5c-48be-c707-08ddf78fd25e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEC0C6BDA1

On Thu, Sep 18, 2025 at 05:09:28PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Combine resource and page mappings routines to one function
> and remove .map_resource/.unmap_resource callbacks completely.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/xen/swiotlb-xen.c | 63 ++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 34 deletions(-)

<...>

> +	if (attrs & DMA_ATTR_MMIO) {
> +		if (unlikely(!dma_capable(dev, phys, size, false))) {
> +			dev_err_once(
> +				dev,
> +				"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> +				&dma_addr, size, *dev->dma_mask,
> +				dev->bus_dma_limit);
> +			WARN_ON_ONCE(1);
> +			return DMA_MAPPING_ERROR;
> +		}
> +		return phys;
> +	}

This need to be fixed by the following change (dma_addr->phys):

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 48936179c940b..ccf25027bec19 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -215,8 +215,8 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
                if (unlikely(!dma_capable(dev, phys, size, false))) {
                        dev_err_once(
                                dev,
-                               "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-                               &dma_addr, size, *dev->dma_mask,
+                               "DMA addr %pa+%zu overflow (mask %llx, bus limit %llx).\n",
+                               &phys, size, *dev->dma_mask,
                                dev->bus_dma_limit);
                        WARN_ON_ONCE(1);
                        return DMA_MAPPING_ERROR;

Thanks

