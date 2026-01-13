Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0AD17F9C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201358.1517022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbXl-00068U-TP; Tue, 13 Jan 2026 10:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201358.1517022; Tue, 13 Jan 2026 10:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbXl-00066Y-Qb; Tue, 13 Jan 2026 10:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1201358;
 Tue, 13 Jan 2026 10:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfbXk-00065s-DY
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:22:32 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47f5511-f069-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 11:22:30 +0100 (CET)
Received: from BL1PR13CA0277.namprd13.prod.outlook.com (2603:10b6:208:2bc::12)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:22:27 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::56) by BL1PR13CA0277.outlook.office365.com
 (2603:10b6:208:2bc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 10:22:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:22:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:22:24 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 02:22:24 -0800
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 02:22:22 -0800
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
X-Inumbo-ID: c47f5511-f069-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUluQbvx4VOPpnm3k7ZdEXOq0lCeHcPk0ndsSV2m4gxR2M4KJBXH0Y5q0HjcLJshpv8FV+ZR2kSZXea4Vri7lQMOzmnWjjK1/8Xv0RbFM7wfCInNWpVrxjbP7y4S3iCRQPeO89Ny2aZG8RqnxWnwz5B5Wbjdv1q4WDVoUBYwWNBd0yMWGUsjcX+BJ69OeefZArEWDGOXZAUmRpPLxOqmaDZzAmkiFnWXi/cl/2ciBanIJaaotAp9GFVTvOjj5+8KMfz5HaJMU8JqAcnc75//vuYyu2FN+eHv2yfLBvhafEouB8l5GiAZ6jUVhYYXPkRICsv4fUfvtmM/E2gWkvu8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw/MD7tweZ5roVeaoCfXZCAAEFyqM4QLZKYRT14mSzI=;
 b=UHt64SSXWg8NUMOIMem3dGGm6pza3dQCP2pMEqQ7UM8N5WugJDGSZ//AwGvf4Hl/KTJhjs60uLXGf7y50DtDbsi/IfHVqOUbasfxh87TT/LI2GuK2SaO+BZVRVXq9f4FfRK9kvBPCttOz0rE6hSyUuXzf9+ly1gAuy8hlXUWvjiwo8mQVB753XmZHezWbNHBilOCSkR9/sa37VNGJhqivFpKZAMXfC5eg1H2QOljEgAw7LbqecvjuEAlTLyNdQ7f0ygR9/UNJGiT0QG9QQgRsENX25NGIETzslHIQFjMk17NskFYObEgjS1Sl6JXje1Mj6dbGeD8Vsb9C9AnSh7I4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw/MD7tweZ5roVeaoCfXZCAAEFyqM4QLZKYRT14mSzI=;
 b=2OX11Qmp22KKvCH8z82ElgncleRbJl5oR13RifAh/m3Tb/OrcNN292ilBDQxMTXbl5qNBVNP8x8k8pZBGL9QBIfWtVg3Bw2UNblL1OMykKRjjMOtHZolNWqb9LmVvh3aQPv5PcKAUxJft2MKb6ybkkxULCIJp6ExyuMhRxd5jjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d6fc338b-60ee-4d30-a69b-9da90059bbd5@amd.com>
Date: Tue, 13 Jan 2026 11:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm/mpu: Implement free_init_memory for MPU
 systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 4063010c-18e2-4d1b-f130-08de528da664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGtnZGtDRldseHhESVFvSjJrbEcrVWllNnVjUThjOUwxQ0k2cFFMdlZJUlQv?=
 =?utf-8?B?dkQ5MHpyZUhpOFRBSkF5ajlSNGs1NVZ3bjZKTlRrNlFpeDRmV2xPdm0vSkIx?=
 =?utf-8?B?ZjZKTXpManJrQjVmQmoxcnI5TlRzYUZSQUpTaGIvQ3ovZmF3bUNFa1pnQXcw?=
 =?utf-8?B?STNrbWhpS2d0bkRVeE5jQWNZazhCZWljMXdVdDZZSG83VHprZGlBeHZuZDJF?=
 =?utf-8?B?YWFTb1VySW81NTR1N2RBZUFzM0xnQlQ2UG1xSHBQL1EwRU4wMXhIZEJFaVhr?=
 =?utf-8?B?cjQ0b1JYdFhRVXhLN2Q0UjM2a1pDRnNNeHY4TUQweTJZSWdOY2dnQmJjQVlt?=
 =?utf-8?B?YWlxQkdrUkxoZG1PckFieEhYTHBUVUFmMFZSQ1g3NzU5SG50WnN1b2l3UDFq?=
 =?utf-8?B?QzlXS0xCd2Fxc01zUWdGcWpZeHJMMTV2MjVkYVgxcVMwcEdmTm0xd2trSWtq?=
 =?utf-8?B?M1ZhTnhQcExSMExrOEdPdHRzSDd3VkJJSXVndURIaGRTT2RPenNWbE5PbW5K?=
 =?utf-8?B?WEk5NXFGUy91Q3hmQUFvOEhHVk1PaXdMUEo0SlRiMkRCMHdLUExGVDhIeHNq?=
 =?utf-8?B?akpnNmNDQTNEQVVnQU9jWjBPMlJscStWUjVCdkZxR0tQWitnRTNvdXNBWjJm?=
 =?utf-8?B?VlA1QmpocHJDS0xIQ1IwTlVoWkRVK24reDZLS0VzNFFlclcyZVNNM1FLRXJ3?=
 =?utf-8?B?SmJmSWsrK3NsNjhRaEJLQ25MbmVFYk9SciswMC9NT3dzd2RnbnUxcFlVcTVJ?=
 =?utf-8?B?UzZiZGRwOXY2b1B5bGRKVCtPVWlLUTNQRW1HVUtQT3V0bUZLR2g4V1huV0tW?=
 =?utf-8?B?SzRXVkRzL3RIYzdvWndHQ05GakVjMTJ5VVd6Yk1YTWx1NXRvWmswNG5qak43?=
 =?utf-8?B?NUp5T3ZrMGxvUVdRbUsyWUZNeVlESks1RXZzeHRTcEJEVUlrU0FwOEFPZk1E?=
 =?utf-8?B?OHczbk9EbjdxR1JjdjNiNzdteWFFdFdxSFBVeXZlWCtDazRPdytoOFdOdENX?=
 =?utf-8?B?TElaQTk0R0NmNGFpcmtVdndXUGh6aXYybzBQYVNFUzNYZzBRMGRNVVJDU0lZ?=
 =?utf-8?B?TnpLZjFyc3dVOFVWbG1Lclk4RDJUbWk1Z1BQVi9adjQ5Tm54Y2tscVROcXFw?=
 =?utf-8?B?cmM2UW55UWpVVFYrdzNGMGwvNEFXNDVleG5UeWlFeVBkcThscS9DdnR6M2x5?=
 =?utf-8?B?bll6bEZpV2FuVzhyQXc4QkpneVAxMUFBckY5R3J6d0pQYUVKZlBOK25ETW14?=
 =?utf-8?B?V0RRWHJ0eVFSQ2hWYnhwdU9OeEpJQTFuSEk5QXhsR1MvUmdyam1kRitFZTFh?=
 =?utf-8?B?Z1E5eHRFaDVjSE1pNnhweDlvcjdrU1Vta0hoZUljdE9kVmhtUVVnWitKQWZi?=
 =?utf-8?B?UkFUSGJrNko2RWttMDBQd09Rc00wQ2pZRk54ZVBKRW9nTkZ5bmdiVzBzSW00?=
 =?utf-8?B?S3BXb0pkWSt0V2piMnZYMkcwaEFnckp4WkNCRmJsYmxWdU02dVVBaWhqMDI3?=
 =?utf-8?B?aGVNSFhyWG1RWTdyaGsyOGd2ZkFnZ2RLZEROL1duUk9WcTIwQW1pTkE4TFFE?=
 =?utf-8?B?NW1Xd2lqNzZQY1NkUzU2eFd3ek1MWmV1NVhRL1h4UDJpU1ljUzVXaTFYK1Vh?=
 =?utf-8?B?c09vOG1SN01iTWl3TmQ2WEs0bWNLOGNuRWUwVEc1UEZkaEI5KzdpSms5K0E3?=
 =?utf-8?B?b3hIYTBlaStSRVlyRmFJRG82TGpmTGM5cDVFY3g4YTR5UHhrWmZnT2lWSEZF?=
 =?utf-8?B?RFdrMitpTlA5WWFvZTJrVmVUVHRrSDdNNGpyWVdCZHVtcXJ5YXllZ2l2MmFV?=
 =?utf-8?B?bXhVQWNUR3p4NkVWTzVwUWZDVVh6cHlxbTNDNVg2bG9qWnUxdFV0K3JwaXhw?=
 =?utf-8?B?VUlVOGs0S2RnVFZVRlZmaWRvam1rcjYwMms0MVhHOW0yRHZHMVJoZzI2WGJh?=
 =?utf-8?B?L01qak5OSTh0a1RUYXUwemJZM25QMWE3ajFxWVIvY0hINWVrRjAxVVNCM09u?=
 =?utf-8?B?TktvYjRrbzA3U29mR1U3ajdkeTk5d0J3cng1SDR3QkhsRHo0Y0JjcXAxUGF2?=
 =?utf-8?B?M0l3L04yK09iKzBrbGNUaG45aXNqc1lxTk1LaW5vSXBHSHVtU2NJKyt1STFI?=
 =?utf-8?Q?tCTw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:22:26.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4063010c-18e2-4d1b-f130-08de528da664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143



On 05/01/2026 12:35, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Implement the function `free_init_memory` for MPU systems. In order to
> support this, the function `modify_xen_mappings` is implemented.
> 
> On MPU systems, we map the init text and init data sections using
> separate MPU memory regions. Therefore these are removed separately in
> `free_init_memory`.
> 
> Additionally remove warning messages from `is_mm_attr_match` as some
> permissions can now be updated by `xen_mpumap_update_entry`.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v2:
> - Refactor `is_mm_attr_match` to return logical values regarding the
>   permission mismatch.
> - Improve code documentation.
> ---
>  xen/arch/arm/include/asm/mpu/mm.h |   6 +-
>  xen/arch/arm/include/asm/setup.h  |   2 +
>  xen/arch/arm/mpu/mm.c             | 113 +++++++++++++++++++++++-------
>  3 files changed, 95 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 1b5ffa5b64..f0941de295 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -15,7 +15,11 @@
>  #define MPUMAP_REGION_FOUND         1
>  #define MPUMAP_REGION_INCLUSIVE     2
>  
> -#define INVALID_REGION_IDX     0xFFU
> +#define MPU_ATTR_RO_MISMATCH     -1
> +#define MPU_ATTR_XN_MISMATCH     -2
> +#define MPU_ATTR_AI_MISMATCH     -3
You don't seem to use these outside of mm.c, so I would suggest to move them there.

> +
> +#define INVALID_REGION_IDX    0xFFU
>  
>  extern struct page_info *frame_table;
>  
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 1eaf13bd66..005cf7be59 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -65,6 +65,8 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
>  int map_range_to_domain(const struct dt_device_node *dev,
>                          uint64_t addr, uint64_t len, void *data);
>  
> +extern const char __init_data_begin[], __bss_start[], __bss_end[];
> +
>  struct init_info
>  {
>      /* Pointer to the stack, used by head.S when entering in C */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 207e8d2d91..4194d4fefd 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -171,33 +171,18 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
>  
> -static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +static int is_mm_attr_match(pr_t *region, unsigned int attributes)
>  {
>      if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> -        return false;
> -    }
> +        return MPU_ATTR_RO_MISMATCH;
>  
>      if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> -        return false;
> -    }
> +        return MPU_ATTR_XN_MISMATCH;
Later below you don't seem to differentiate between MPU_ATTR_RO_MISMATCH and
MPU_ATTR_XN_MISMATCH. Therefore I would suggest to keep them as one to simplify
the code.

>  
>      if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
> -               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
> -        return false;
> -    }
> +        return MPU_ATTR_AI_MISMATCH;
>  
> -    return true;
> +    return 0;
>  }
>  
>  /* Map a frame table to cover physical addresses ps through pe */
> @@ -357,12 +342,45 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>      */
>      if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
>      {
> -        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
> +        int attr_match = is_mm_attr_match(&xen_mpumap[idx], flags);
> +
> +        /* We do not support modifying AI attribute. */
> +        if ( MPU_ATTR_AI_MISMATCH == attr_match )
>          {
> -            printk("Modifying an existing entry is not supported\n");
> +            printk(XENLOG_ERR
> +                   "Modifying memory attribute is not supported\n");
>              return -EINVAL;
>          }
>  
> +        /*
> +         * Permissions RO and XN can be changed only by the full region.
> +         * Permissions that match can continue and just increment refcount.
> +         */
> +        if ( MPU_ATTR_RO_MISMATCH == attr_match ||
Enlcose in brackets () || ()

> +             MPU_ATTR_XN_MISMATCH == attr_match )
> +        {
> +            if ( rc == MPUMAP_REGION_INCLUSIVE )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify partial region permissions\n");
> +                return -EINVAL;
> +            }
> +
> +            if ( xen_mpumap[idx].refcount != 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify memory permissions for a region mapped multiple times\n");
Memory permission? Here you are checking for XN/RO.

> +                return -EINVAL;
> +            }
> +
> +            /* Set new permission */
> +            xen_mpumap[idx].prbar.reg.ro = PAGE_RO_MASK(flags);
> +            xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
Here you always change both, that's why there is no need to provide two separate
macros as I mentioned above.

~Michal


