Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0804C64413
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:04:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163846.1490905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyuN-0007eQ-4R; Mon, 17 Nov 2025 13:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163846.1490905; Mon, 17 Nov 2025 13:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyuN-0007ct-0Z; Mon, 17 Nov 2025 13:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1163846;
 Mon, 17 Nov 2025 13:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/DW=5Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vKyuL-0007cl-LG
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:04:37 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6900479-c3b5-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:04:35 +0100 (CET)
Received: from SJ0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:a03:39f::16)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 13:04:29 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::df) by SJ0PR03CA0221.outlook.office365.com
 (2603:10b6:a03:39f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 13:04:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 13:04:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 05:04:28 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 05:04:27 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 17 Nov 2025 05:04:26 -0800
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
X-Inumbo-ID: f6900479-c3b5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEbcW9b5rzjU2I8zTYzcBJGcGC2QbEexcR3l2NSc9nvnLJuu7/FfRKMBDhasQnAyL4l5Oqa2mxQbvQMUmvhJs9FbrizcWE3DJL5dCx/HodnrJl8S9b17li2dY+f1+mioeR2EVNNcvH/IqkCnQbFMvQcd0TaYabhiH85LGW6vt445zdCI1PDXuDxOQK9uZdiPP5QEr28W9FubO09QNwoCxFJ/9E1m4WLNxZTP11a+kmls8vxtKj5j7uy3anYdBx7jVntFShfCjoSHoE0zTrzeY5r99XAmXb/m9jB2APhTs0UmU5ACMzgPSiEx52KJRdVxIQjn8z4Y1zPUK5ONoS+j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY3G1kN8XBp108ReZMKdPSvu5GhXOk80ilCtWFY+Pz0=;
 b=QVxY4F7pjULz9KDy1feSizJc9wZTIVf2/cUvC9tdnQ9Vucu4wJNJsG1lueJAz/CKDTK0ma6LjauA6Cfem55EndnvvmWV3oYAWMS2G08SIxYIm7naHtYjrzlv6b703W6zgNoVMKNwj5AbdCX0mi7dRVriVMxHbqmUI+a6/RugkUzgSFVnGZtieCuITozba9LmhMR4P/A+9R6XCFBqkHqh6NBtAtaYXVejf9AYyofQ0zAooOEV46RNRkpVe+ghFZwzStOC7385Y1h64DuqlL2cAmQ0qHoWSd3OXkpnKosB7abI4DaJ7r+j070tQQOnSqO0hBL+PtDLn2wCCHzS9C0Cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY3G1kN8XBp108ReZMKdPSvu5GhXOk80ilCtWFY+Pz0=;
 b=roi9bhu6/CwCgVOWOa4dg8b3NnHyw80VcIu634J5L2zXEh/cP54LbcJKXTF1F+YjZ9L5NOSC0quud6sujKYD3XGXN8SucWjbgpJCSv1f6m2MJz68ao2R6uvICOhhhSrrXZ5Vxs9JcWNax8/7dp4kPk8XPomPDxreHfE2jcINJdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <49e88ba6-b760-4f8c-a003-12d3bc893163@amd.com>
Date: Mon, 17 Nov 2025 14:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Implement reference counting for
 inclusive regions
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251111101601.4171120-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7ba6cd-2236-4362-bfc2-08de25d9d795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVRadW9uSU9QbVgzNFdJYUpidU1VbE5YUE9xUjd1cUo0QjMrblZoYWh1c0hS?=
 =?utf-8?B?Z3FCK3p6QnkrZUN2ZnpVM2xLL21RUHdReCt1K2FZcnkraVNIYWRrQUViQzZq?=
 =?utf-8?B?eWpsQTlNb3RoNHhrMVk5dzZiMkZVMXR4S241QnFPckhVK282KzBUdUN4enlq?=
 =?utf-8?B?Tkw2dHdNRjFqTTZJTVpEaUdKS2lOVkhIRU1ZV2lSdmZOYU1jUnVHQ0tnV2ZS?=
 =?utf-8?B?SkNVZmhuZnJXNE1aM1c4eFluTTZDOHV1bU42NXh5Q2xtUUROSm1haGNDazlZ?=
 =?utf-8?B?bDVhTjNRSEtJREo4TDNleVRBMVp3eGVDcitBMmhsU0IvUlp5ak00N2VqQjRw?=
 =?utf-8?B?VXU1elJ1SXFIcDRpYmlHZ25jVnp1M25NaHYxWlpHNGRiZE1qYXlKSkkyZTRv?=
 =?utf-8?B?cGtYamdxSmxOUVJuclVRdEY4R2VhcFNzejRtRTJTbXBJdGxYMWZOd1huN1BZ?=
 =?utf-8?B?bURGYmNUalg2VVAwcEVpK0dXM3VhOFhxTmE0US9jRUdrbU5pdHhpcklNeis3?=
 =?utf-8?B?TUFSaUdsbGxzMUIvR3RWVXdsWm5DeW4xNXhnNlNSZmRrWm1RdTliZVFDR3JO?=
 =?utf-8?B?VUtOWi9zNCtlcU02WThOYVh0c0R4NGMxei8zbHUyb2lETktjWGlnK2lOU1l0?=
 =?utf-8?B?RDFJdXR5ejB2MWlMTmJ0eTNsSmRVWWs0aFI2ckVoUDRkSUVYMlprZ0JFK240?=
 =?utf-8?B?eG9YRGZyaERDY3FsalZCejV0V05DVmwweXFzcERIeHlxMi94dExONy92QkRI?=
 =?utf-8?B?eXI2S3Nyb3ppY2E5OXV4ekgrSmdRVUpUVWZnbFlobWZRTnd0dTlVSWJhR01C?=
 =?utf-8?B?a2ZpMlpBZTdtRWw2cUx4RmZsaUJwWSs3QzdIUU9uczBXdFhCWXQ5TFlrM0VM?=
 =?utf-8?B?M1FPQ1NMcGlwTkFxcmdSOGpXWHVQNWRnUEtJZFcrWjZlSDBKN1Uvb0I5NmJy?=
 =?utf-8?B?UzN5ck4xdWhFb2d3MUxkMlo4NFVuaGdTM3NyMVc3QzNxSjBFSzAwbXN6S0N1?=
 =?utf-8?B?UTA2b1ZYWVVWWTA5dFVCRm50TWRtenhzazVLRHEvN24yMDVPRkYzbFdSNVF1?=
 =?utf-8?B?QmMwRHVvQ3h2eUZvYXV3Mi9PWWNiaWVXQjdxR01wLzI3eXBqV1RlUHNZRUxY?=
 =?utf-8?B?RDd3SXBZbGJXV3dHNFJxNUIwRWFBSVhBa3BiRUNWRlRic2c1L2FKd2NzNDB6?=
 =?utf-8?B?OVdRY2gzeFNjbTRMYU9ZeU0yRVUzWUlNVnRwZ1R6Z3gwMC83Vmo5OXY0VUN2?=
 =?utf-8?B?di9FcFl6VUxreVhZdjZydGJldlFyaG0wd2dwNHVIaVBKZnBvcnJZWERDNlI3?=
 =?utf-8?B?UFllVStKK2tyUXllWjhOVm1YWHRYNE9FNkFPS0Y4YWsvTFRoOWZBUW1aSE1M?=
 =?utf-8?B?TWxhY1hLYmRFNjZRZlAyN1VtUVdWcG4xV1dsSko1N2Q2WUdoNE5nd0JqSUgw?=
 =?utf-8?B?SnhOTThoYUFzRWgxZFZWRTkxTTJtVWEwTFpWb0VOYkwzMGUwOTFRbThRVjVX?=
 =?utf-8?B?aG1BN2tVZzl3QktSVS9vNUhOMFpYNGxPR0ZCWTdoQWovMWNUSEc0cFFIdHZI?=
 =?utf-8?B?YlVjUm1SRU5EeEErNGtveDVaZHJJRUN6ZndIZU4rK0ZqZ0Z6NE1ielhCMXJX?=
 =?utf-8?B?TWdqcTVTVDQ3RmwzK2tKYXh6ak9rdHdScEtYTTlqcXBwWkJWUlhTOEtTYmNR?=
 =?utf-8?B?YVlTOEltMVN1NDlicWlHQ2NBUkJLa055K3oyWHhkZU5WWWNRSDB4MlV4cTNU?=
 =?utf-8?B?eDlMZTlMeUhIYk51dEdzaUNXV0ZLdUtzQ1A3K0FheEhlS1cxdXBBZWNsZnRS?=
 =?utf-8?B?cXlJdFpIbUtjNmZUY3V0d0UrYU4vZzAzSENKQkErRHl1d2FtckxLOW1kQkxE?=
 =?utf-8?B?ai84OXE4QURIdWprVW4yZkRXenF4REFZRWRhcFIzTjNCUGRVSjRTeUJmUWtE?=
 =?utf-8?B?WDNqdElxOE54VXV2RndtYmNLeU82eXE0TTlid2drT05GMzIrQ3RwZW1DUE9N?=
 =?utf-8?B?bDNGRTl4V0JRQ3JwZnJrbWRDaFpnZStSOGpiWFJCZmFONHlSeUJOR1Zocnox?=
 =?utf-8?B?V0dBTHBLeTRDZzVNT1pyQzMwaGJVQlV4YlF4MTkvc3VZdExpNDBseHZKRkZT?=
 =?utf-8?Q?s1I0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 13:04:28.6883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7ba6cd-2236-4362-bfc2-08de25d9d795
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928



On 11/11/2025 11:16, Harry Ramsey wrote:
> Implement reference counting to enable inclusive MPU regions. An
> inclusive region is defined as a region encapsulated inside a
> previously allocated region sharing the same permissions.
> 
> References are incremented and decremented in xen_mpumap_update_entry. A
> region will be destroyed if the reference count is 0 upon calling
> destroy_xen_mappings and if the full region range is specified.
> 
> Additionally XEN_MPUMAP_ENTRY_SHIFT and XEN_MPUMAP_ENTRY_SHIFT_ZERO are
> no longer hardcoded and defined inside asm-offsets.c.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> Changes in v2:
> - Improve clarity with regards to MPU inclusive regions
> - Fix code format issues
> ---
>  xen/arch/arm/arm32/asm-offsets.c         |  2 +
>  xen/arch/arm/arm64/asm-offsets.c         |  2 +
>  xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>  xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>  xen/arch/arm/include/asm/mpu/regions.inc | 11 +++-
>  xen/arch/arm/mpu/mm.c                    | 75 +++++++++++++++++++-----
>  6 files changed, 78 insertions(+), 16 deletions(-)
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
> index b80edcf1ca..cd84f9e3c6 100644
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
> +               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
> +               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> +        ret = false;
NIT: I think it's more clear when you return false here. Otherwise after setting
ret to false, what's the point for checking additionally for below conditions?

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
> +
> +    return ret;
> +}
> +
>  /* Map a frame table to cover physical addresses ps through pe */
>  void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>  {
> @@ -284,22 +316,26 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> 
>      flags_has_page_present = flags & _PAGE_PRESENT;
> 
> -    /* Currently we don't support modifying an existing entry. */
> +    /*
> +    * Currently, we only support removing/modifying a *WHOLE* MPU memory
> +    * region. Part-region removal/modification is not supported as in the worst
> +    * case it will leave two/three fragments behind.
> +    */
>      if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
>      {
> -        printk("Modifying an existing entry is not supported\n");
> -        return -EINVAL;
> -    }
> +        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
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
> -    if ( rc == MPUMAP_REGION_INCLUSIVE )
> -    {
> -        printk("Part-region removal/modification is not supported\n");
> -        return -EINVAL;
> +        /* Check for overflow of refcount before incrementing.  */
> +        if ( xen_mpumap[idx].refcount == 0xFF )
> +        {
> +            printk("Cannot allocate region as it would cause reference overflow\n");
s/reference/reference count or refcount/

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



