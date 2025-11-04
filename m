Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467C0C30793
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155600.1485052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEAF-00030d-5o; Tue, 04 Nov 2025 10:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155600.1485052; Tue, 04 Nov 2025 10:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEAF-0002yK-34; Tue, 04 Nov 2025 10:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1155600;
 Tue, 04 Nov 2025 10:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=au44=5M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vGEAD-0002yE-FF
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:21:21 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa28603-b967-11f0-980a-7dc792cee155;
 Tue, 04 Nov 2025 11:21:18 +0100 (CET)
Received: from SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) by LV8PR12MB9135.namprd12.prod.outlook.com
 (2603:10b6:408:18c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:21:13 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::40) by SN6PR2101CA0007.outlook.office365.com
 (2603:10b6:805:106::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.3 via Frontend Transport; Tue, 4
 Nov 2025 10:21:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 10:21:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Nov
 2025 02:21:12 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Nov
 2025 02:21:12 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 4 Nov 2025 02:21:11 -0800
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
X-Inumbo-ID: ffa28603-b967-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN1V6ruZNwLaNV6OZh3RL9BIeS+xyArRC5hhRGtqBBhZ+m38gZLFlFv5GMgLOWI93PWslIanSITO2cz+nHue7C4+49QIkfy8KYhX696eyR632pSPGrw0ScfE0Ly0qLbO8bp+ILYafscCVcsDruWJRGxWwh7j6q01YnoUGUnZpMLZK+qdmIjvLj8W3e+/IkFzBS+jHF1vaO4rHHpf7j7b2ztWM7eyDZ9J+uUz/i6D7TKvWQF8nUOHltbhdOz0yH3OSWt7mxLGBTu2e+GVwvMZNEV+av2SZEIjWTmvscpkIeXwX7Yk1dJ04LSHhISS1shBSA9o6oQ6nkRa3ncolVHCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpewHANC1hUXg8TygSfwRMguB/Rp6vSMk0yR6sLpd7Q=;
 b=ckw8aMQX6c4RjXTsqsJToqvElGJr63Uy9TIPE/gN9E632pjIhOM2y3B7R3fplkN1+LNHk8GbceffvGA9yUxkIVWTRyyjIv4djHB5hbTynJP+1NbqDkmaKI7/hqONQGJe7e1UubJwEExDUI/QniKX917+u8464x91KddTV0Aip69G7Yamc7msJqF29omZ1heOYhXG/YMhnrJdn1NrJdJlJmt7hXxU3LygcaAAwyce9ZWEuOQjLj3wPpEGfXiWTO4JuNqYJ1CxalUKxwQhGAZ0ErJdko3DiIhwr3uOIJptcGzfB1TsD5jnIvIhqQpz6kw7YsvBh9/mlS7cD+6CMAGNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpewHANC1hUXg8TygSfwRMguB/Rp6vSMk0yR6sLpd7Q=;
 b=jgRrp9YfUnTHRrBmlSswakt1bBKHBKSwe8zmbLQWji1UCMcxuMIC78pBlCYCliyH8nf/00uy3ELJGu5oQEDM5RxPAPd342nEIXWL3ZQFJFJkNHrmQNztXxMHoMeFU/u7RfPnTcW8CXgSeyPuX6lD69UKQ8I8jBbkaeweX9purIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0e681f9f-a563-4ace-8f58-e80a050608ba@amd.com>
Date: Tue, 4 Nov 2025 11:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm: Implement reference counting for overlapping
 regions
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
 <20251024153719.408806-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251024153719.408806-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV8PR12MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 04565515-6be6-4e3a-0f4d-08de1b8be152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWhYY2EwNmJqeFhrR0FGb3lyWlJzSzczcXNiRFRlNFp5MkVVZkZsc1lsOHVI?=
 =?utf-8?B?S3Joc1NkQjBFY2FXWkRabU1SNVVhbGhvOElOVjMzdWErQ3Z6VWlrK1VlV1o0?=
 =?utf-8?B?ZXdrbnBwQTdwYVZBWFRvRWlHd1ZENmRja0JGYTVWeERFamFENUxoRUVtRWtW?=
 =?utf-8?B?amlaTHUwR055cUpnb2dZT0cvS3pWam1sNlpsQjNCTHJHMnczTVZ0OWpxTjR3?=
 =?utf-8?B?VWE4dlVTQ0UxNDFNbUlEcE5qUENqZVNBd3FJdTBhcnFQSkpGTStmS3pXMXBZ?=
 =?utf-8?B?T0RpMVdURGVYNElyd1dseXN1VGM4SHlyYXovWWZwTlB2cDA4MkpQTUhYS2tW?=
 =?utf-8?B?a2xhb1hVYkc2WE5RdzMwMXE3RW8wK1lVMUE0Tmo2Z05zTjJTNzhMV2hlVFNn?=
 =?utf-8?B?TGxvUUQxeWVaSUdabzdaVk1RQjNBMjhhdEkvYWJsRGs5czZqQ0RNT1FsNkg3?=
 =?utf-8?B?ZE9LQmV5SDFSYnZGN2ZKYXd1NmhQUDBHM1VWbXdKMGdkSkZiZXBwb2dzdTVO?=
 =?utf-8?B?czJyVDBWSU9kK3V0RjRWR2QxQW1DTE92cHRTNFpDb2ZONlVmSHlzNERhemlD?=
 =?utf-8?B?UVRGQkgreVlSeWF6YisvK1c1SHBNU2IzbnRFaHFwbkVBbjk4bzZXcFA3SER2?=
 =?utf-8?B?Rllzc3hxbTVVdlRldUp1bnNFSVlYYXY2ejBSd0w0M2t3N3JWWW5DTTExY3hY?=
 =?utf-8?B?d1FwRWlBT2Q3ZlozWTNReFRjQXlZVWd1VnlyN0F1V2dPV3V4aFU3S1J1VEMy?=
 =?utf-8?B?amdTTHhTM0tyaFVEODI2WStqR2NBRlVpNlFZOWQvMnorM05oeXR0RllTVjFn?=
 =?utf-8?B?OEFVMnFiVExBTmloRXhXMlh5UFZKeFNzTk1KOHdGSW5jVTlOZmdOejJEZmww?=
 =?utf-8?B?TjZMaUlleHUxU1p2U0hOUEdmQ1lrVWFWRDNsNjI5NlY4MDFHNjFVOG5RUFpZ?=
 =?utf-8?B?bktveCtXcDFmeGE1bFFGVlVaSWM3K0VQQit4WDZMa2N6VkxDQUJUS3NLc0pR?=
 =?utf-8?B?V3h3VnV5QjBLb1FZMTBadVIrbFFhak5KbG1EeUIxaHhlaUQ0ZTE4RG9Hb0hQ?=
 =?utf-8?B?d0RQMGtrWml5c3MwN1Z0ZzUraTRLS0d4RlN0NksrWHlTd2o4bmI2RkE2WWh4?=
 =?utf-8?B?SUM1MVh3S2N3SGJScVB1R1JhdjJGVEpVQTBuWElBV3pqZUV0M0Rpd2FVWkVa?=
 =?utf-8?B?OVozRENCRDZXWTdVdWR0cDIzR1ZKUnRRa2J3QWpWVS8wVU8rSFRmeTVHaHJV?=
 =?utf-8?B?bEdhSzdVOHd5VlB4alJqQmJLcGFXQy9zMStyaCthMncrcExISlZjbXdlSzVj?=
 =?utf-8?B?Vm12cVRPVUE3cEptZjhaK2xMd1BBRzYrK2gyNGZ0NDN0R0ZucS8zeER3cHJE?=
 =?utf-8?B?YnhIUW9tMDJXd1NoVkJBUjhLN2htWEs0WmhRd2J2ZWRTUG1VUE5mNjZNT3Q5?=
 =?utf-8?B?UHhSbWxWU2tvcFpTVHVZTWQzMEoxNEc2TmtZQlJ0eXFNcDNQZHRnTm1CMW51?=
 =?utf-8?B?YldTbUYvdWtabGxPSjh6Y3pzK2FpRW43OW1QQzR4aGo0VDBJbExFMXhnVU0v?=
 =?utf-8?B?M2VzN1kxcWMrQzNFam1wdWFlZFNFK3ZEUzEwY1lnZE8wbWZkNnNJL0RnL1lS?=
 =?utf-8?B?aCtwb0s0dllmMWwzRVVtUWNVNGQ2Vmx1SmZtYm5WSDZqblNuT2NrOEtZVHhI?=
 =?utf-8?B?aDQ3bWdsSHh2WWNiakxMTkdWRHpqS3dDZE1xQkFXU3VLamZaUE5PZXkvRTVJ?=
 =?utf-8?B?YWZjcXFNaUIzWHloWUZOcVkxN1hUQ1hVZWtKdWZpRlB3NWhZN0dYZ0xqYVJr?=
 =?utf-8?B?ZDR5b1FEZnJPb1pRdFowc0VPd2pTZFJsWG9GRW15bFBDM3g0S0hXTjQ5R2p6?=
 =?utf-8?B?R3ZTRG1BQ1dKNXNoZ1JqazVtUzBoUHNXcHN0QUlrSmZLK1VyMlVTTTlkMXZw?=
 =?utf-8?B?RE5nUUdFWnJMYm84TkVkYmJyTFZiTjA5OTMzYlBKY2pPeDIzM1kzUGhaeW5Y?=
 =?utf-8?B?OFZxZWVlRm5iWnRxanQyanpqM1doSUk0WkdyZEwyMWZ6UjJ3STFkMmZDNlpX?=
 =?utf-8?B?K2ptTkthTkFqb25hTjJCcno3QTJ3dXJMNWVtWGpoc0gxZW5lZU9mVDVWQnMv?=
 =?utf-8?Q?y/1M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:21:12.7203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04565515-6be6-4e3a-0f4d-08de1b8be152
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9135



On 24/10/2025 17:37, Harry Ramsey wrote:
> Implement reference counting to enable overlapping MPU regions.
> References are incremented and decremented in xen_mpumap_update_entry.
AFAICT, looking at the code, you would return -EINVAL early on overlap (i.e.
mpumap_contains_region() returning MPUMAP_REGION_OVERLAP). If so, can you
clearly explain what this change intend to do and why we need refcounting?

> 
> A region will be destoryed if the reference count is 0 upon calling
s/destoryed/destroyed/

> destroy_xen_mappings and if the full region range is specified.
> 
> Additionally XEN_MPUMAP_ENTRY_SHIFT and XEN_MPUMAP_ENTRY_SHIFT_ZERO are
> no longer hardcoded and defined inside asm-offsets.c.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/arm32/asm-offsets.c         |  2 +
>  xen/arch/arm/arm64/asm-offsets.c         |  2 +
>  xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>  xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>  xen/arch/arm/include/asm/mpu/regions.inc | 11 +++-
>  xen/arch/arm/mpu/mm.c                    | 73 +++++++++++++++++++-----
>  6 files changed, 77 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
> index c203ce269d..951f8d03f3 100644
> --- a/xen/arch/arm/arm32/asm-offsets.c
> +++ b/xen/arch/arm/arm32/asm-offsets.c
> @@ -79,6 +79,8 @@ void __dummy__(void)
>  #ifdef CONFIG_MPU
>     DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>     DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>     BLANK();
>  #endif
>  }
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
> index 320289b281..38a3894a3b 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -73,6 +73,8 @@ void __dummy__(void)
>  #ifdef CONFIG_MPU
>     DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>     DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>     BLANK();
>  #endif
>  }
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index 0a6930b3a0..137022d922 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -39,6 +39,8 @@ typedef union {
>  typedef struct {
>      prbar_t prbar;
>      prlar_t prlar;
> +    uint8_t refcount;
> +    uint8_t pad[7];     /* Pad structure to 16 Bytes */
>  } pr_t;
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index f0ce344e78..17f62ccaf6 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -38,6 +38,8 @@ typedef union {
>  typedef struct {
>      prbar_t prbar;
>      prlar_t prlar;
> +    uint8_t refcount;
> +    uint8_t pad[15];    /* Pad structure to 32 Bytes */
>  } pr_t;
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 23fead3b21..0cdbb17bc3 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -14,14 +14,12 @@
>  #define PRLAR_ELx_EN            0x1
>  
>  #ifdef CONFIG_ARM_64
> -#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
>  
>  .macro store_pair reg1, reg2, dst
>      stp \reg1, \reg2, [\dst]
>  .endm
>  
>  #else
> -#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>  
>  .macro store_pair reg1, reg2, dst
>      strd  \reg1, \reg2, [\dst]
> @@ -97,6 +95,15 @@
>  
>  3:
>  
> +    /* Clear the rest of the xen_mpumap entry. */
> +#ifdef CONFIG_ARM_64
> +    stp xzr, xzr, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
> +#else
> +    mov \prbar, #0
> +    mov \prlar, #0
> +    strd \prbar, \prlar, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
> +#endif
> +
>      add   \sel, \sel, #1
>  
>  1:
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index a058db19ef..c5128244b7 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -106,6 +106,7 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>      region = (pr_t) {
>          .prbar = prbar,
>          .prlar = prlar,
> +        .refcount = 0,
>      };
>  
>      /* Set base address and limit address. */
> @@ -170,6 +171,37 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
>  
> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +{
> +    bool ret = true;
> +
> +    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Access Permission attributes (%#x0 instead of %#x0)\n",
Why %#x0 and not %#x?

> +               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
> +        ret = false;
> +    }
What about shareability?
> +
> +    return ret;
> +}
> +
>  /* Map a frame table to cover physical addresses ps through pe */
>  void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>  {
> @@ -287,19 +319,19 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>      /* Currently we don't support modifying an existing entry. */
>      if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
>      {
> -        printk("Modifying an existing entry is not supported\n");
> -        return -EINVAL;
> -    }
> +        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
Do I understand correctly that this change (not mentioned in commit msg) is here
so that when we call xen_mpumap_update_entry() with existing matching or
inclusive region we will increment refcount only if the attributes match?

> +        {
> +            printk("Modifying an existing entry is not supported\n");
> +            return -EINVAL;
> +        }
>  
> -    /*
> -     * Currently, we only support removing/modifying a *WHOLE* MPU memory
> -     * region. Part-region removal/modification is not supported as in the worst
> -     * case it will leave two/three fragments behind.
> -     */
Hmm, I think that we still don't support removing/modifying regions partially.
Why is this comment removed?

> -    if ( rc == MPUMAP_REGION_INCLUSIVE )
> -    {
> -        printk("Part-region removal/modification is not supported\n");
> -        return -EINVAL;
> +        /* Check for overflow of refcount before incrementing.  */
> +        if ( xen_mpumap[idx].refcount == 0xFF )
> +        {
> +            printk("Cannot allocate region as it would cause reference overflow\n");
> +            return -ENOENT;
> +        }
> +        xen_mpumap[idx].refcount += 1;
>      }
>  
>      /* We are inserting a mapping => Create new region. */
> @@ -323,7 +355,22 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>              return -EINVAL;
>          }
>  
> -        disable_mpu_region_from_index(idx);
> +        if ( xen_mpumap[idx].refcount == 0 )
> +        {
> +            if (MPUMAP_REGION_FOUND == rc)
Missing spaces around ().

> +            {
No need for brackets for single instruction

> +                disable_mpu_region_from_index(idx);
> +            }
> +            else
> +            {
> +                printk("Cannot remove a partial region\n");
> +                return -EINVAL;
> +            }
> +        }
> +        else
> +        {
Same here.

~Michal


