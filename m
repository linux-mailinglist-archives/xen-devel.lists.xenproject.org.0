Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D66C305BC
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 10:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155587.1485042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGDjZ-0006vm-4p; Tue, 04 Nov 2025 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155587.1485042; Tue, 04 Nov 2025 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGDjY-0006t3-TB; Tue, 04 Nov 2025 09:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1155587;
 Tue, 04 Nov 2025 09:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=au44=5M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vGDjX-0006sx-1H
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 09:53:47 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f65d71-b964-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 10:53:45 +0100 (CET)
Received: from PH8P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::13)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Tue, 4 Nov
 2025 09:53:40 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::cb) by PH8P222CA0018.outlook.office365.com
 (2603:10b6:510:2d7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Tue, 4
 Nov 2025 09:53:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:53:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Nov
 2025 01:53:39 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 4 Nov 2025 01:53:37 -0800
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
X-Inumbo-ID: 26f65d71-b964-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlA1mn7qHoQEExOvOGp8FMubTPeDJB3Z/WNH96BX7pEdWL/U95tC5US2UHxfkKE0620TXjgWyRyowaXShH9r2XRmz0dXySw7CRlCsQN6rbBaDT1tp2VZ4ja+xPg+TxZ4T1MZAuRxTduKgTNs/jXlXs0Gtahd8BftMBIJhcqu8w0PG2dWjsd8rqEJhb2z1LaM5cArR4N9yjhucEfEKgLfrZRAwCte2qM0LpnxvYSULc+rJmu/CKhi8ivtGEKPlH85tPImUnTJY4qpp0Fawm5Wg/rcgVTA4Ge9O7WUG6okUj07F1GyEjCJ2fzenHoWT7ITGka2paRMrWYHoLUAT2eHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlwXJ/+nft5CPvYCLciFDs2CX9rZFvBKrO8pzoGX55U=;
 b=yo2tdmEE+HKEb/X8sZSUthcMV3EXVbzx6QNCaSdYoSsAWHQxoHDHjNNM3OUMvAGAUMTFvr4YeMgcB33ionL+KNKfb5I8FlmKKdKTMy1vZMauncHbo6CBUfgKlyVU2TGnM2ay9cGRH29KB3NiCQUrdA1qaD6TpItAsOf/be901rbJwAQIWzUdY7KJePR/Ry/sPvQAiAyQ8IRF35HNSOT6HU+H3PLVEF92vrnGO8CUfY+fESjYYmu6zv5z+yG13vUU8135TCZj9hvaYgksOb7Gs8IZCKxK6nGgq98KmgwWDhr98KMGeLswj1M3MRAyQ2z4ovOz5FtQvllCLWMPt0kwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlwXJ/+nft5CPvYCLciFDs2CX9rZFvBKrO8pzoGX55U=;
 b=uWDw9gp2kx8VI7/xmWlQIsixZpa3svS7q3uUBobb4TAA6OYn0aOso7gC1ttcvYAdJQpDRpb6bXfGS4YLtTNuxJgfZVw35zB2bm/F8hS36PftiTrhl5VIXTCiSArp4ZPhl+C+fbV0Ri836mY76StWupG39e4f184AVD5+W5rATHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <079ac98e-b44c-48d3-b3fc-6bd92461827c@amd.com>
Date: Tue, 4 Nov 2025 10:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm: Implement setup_mm for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Harry Ramsey <yourmail@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
 <20251024153719.408806-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251024153719.408806-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ba9ada-a6e5-4526-ebc7-08de1b880819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkw2NjhvNWVneTV0djFJS3VoUVZKNVZ0YWpqbkdwZk0vbTZnMU9UWDh1bGR5?=
 =?utf-8?B?akRkMHJrVC82WXhWQTFpN0FnZVp5TWlCUHlEc1RuVlF2bTNDM0lYekVXQXFI?=
 =?utf-8?B?Yk85aDJEa0h3SGNzT25FWkIzbUxrbEJjRTJQZ2Z2ejJHMGRiK0pGMm0rZEs1?=
 =?utf-8?B?eVBjYTY4ZWJEMzRtT0ZVd2plL3daR1hDQ2FWU2hYZFlYbjlWTko3N2pKZ21z?=
 =?utf-8?B?eEd6MHlUeHExY2VIRWlTYmpZNWZKZzBwRm5CMHE4R2E2eWhXR3V3MVpPNFdP?=
 =?utf-8?B?a2RjR2hza21wSFQvYkxiTHJNR2N6L2hDenR5T1JoZlRGekZTWTFhUHp4STI1?=
 =?utf-8?B?N3MrM0xXdzY0aVY4eHE1L2lzQmpSdUJsNysycytvVkVSVEk3RUorbzBqQnVa?=
 =?utf-8?B?VlVyd3NUK1ZiRDh5V25uRTJtOHM1OGsvQWh3VTlCMjJ2UGlkUC85K1I2VVI0?=
 =?utf-8?B?R3ZqbHd0NnRWbExqVG1MNGxvWmdRc1VYZFE0WGdXNXJvZWdqSVdCSFQ4SzVv?=
 =?utf-8?B?N3g3S2R2ODE0b3cxZEppVnFCVlFkMkVwTHZ3T200ZXpEMGN3c3BTUXNZZXV3?=
 =?utf-8?B?SUxkMlI3a2xwMDEzQzg5bE5QZmxaYVJ4QlZqcHZHNE42ZHh2UHpFTkNqVUtv?=
 =?utf-8?B?UGVHVU5jN3ZxbTRWL0N5U0dDa3ZGVm9vVGUxL1hRbXdIVE1SUFZWWjlrYVVU?=
 =?utf-8?B?Q0VkMytZc1BEemJXNmJJZGFUS0J1WkxZZnNvenMyU1hua1IvdWxuUHlnZ3NE?=
 =?utf-8?B?MHV4bHUveU5KOUQ2Z1QvV2tjdVBFczlFc0xBMUhDR2swellVbkp5NHBQNlM1?=
 =?utf-8?B?SDQyYUFISHJFejdGTy8wbGdKY2dGQlRTZzVwNEhZL0VPWStFekJLOFc2Y0tD?=
 =?utf-8?B?UnYxMGdoQW8zTU5kaGJUdHVHWWVDZEt3YS9KT1plcndLalJpYkxGUWhnNHBD?=
 =?utf-8?B?bFZsdnJqb21pdWVjSk00T2V1SUVPd0dEaUZ5MWJwemYxVWhXRkV5eWtuSGYv?=
 =?utf-8?B?TDhxUDBCVnRtWWtuelJ5d001M05qVVBETXY2UWM1TjFnWTJ3bUMyTWE4VVpX?=
 =?utf-8?B?N1lJRlZCazJQYVJVUTA1ZCtYbkRLQ3BsTStEU0VSSFpTdmhFbHYzOWU0bEh5?=
 =?utf-8?B?SHVlMy93a3Mwck9aSUhLVTR6ZCtuUG55TUthQ2o0ZlFiMnZNb2QrdjhkQVVt?=
 =?utf-8?B?Qy90TzhVYndmQ3VkVkxQdmFhWU9hUlBOS0JYdTR1dmR1WEVZTnU3NVBvV0VC?=
 =?utf-8?B?dXRublBVV0ZHRXZxMzYvampQc3dXRWEyMHNJSUtZMUt4V3JVdWpNYVFsaThl?=
 =?utf-8?B?d01xWjhndnFMeEJvK0lxNnl1NVJ2WDc0c3VhUnQ2VjcrZVdJTUcrdEU4cEFF?=
 =?utf-8?B?eTFrdC93a3NuWXVtam1WYitISkRqa0s5UjU1R3pUamVaM1M4ZzJiRVh5bG9v?=
 =?utf-8?B?V1g0QXhTUGJaM09ocUUvclJnaXZaWk9KRkV5U3lYZmt0R2p2ZmMyODZtSWZC?=
 =?utf-8?B?eEVtTHRPWXFUMHdlR282Z3MrT21IWjltZVNLVTVCdDA2cW5RUks2c29TZmJk?=
 =?utf-8?B?bWRBazlxYUhPckZPNUtUMVlzQzByRXZVZllicVpVbFZ4QVErMlhrYWFod0FQ?=
 =?utf-8?B?RlVBSXNwRE1neHpvSlMzNEpnVm5xVXR3SWdCRVVHZVJNTDI1Mlp3cUxpQTVh?=
 =?utf-8?B?RElCS0syYjBRSDhUM3IwNG13QUp5ZyttZUE0TGc0eWM2MDRvc3FDazlIQXVU?=
 =?utf-8?B?THU3RlQ3dHJHckR5Rm9xclIzSHhqRzdyV2RrYzl5THNRWjFEb2N1MjR1KzJr?=
 =?utf-8?B?aHNaSkg2T044U2xaanFhMlFHZmRhUW5ZRU54bjV1OEwrVDNuV0VwdEZMS3hL?=
 =?utf-8?B?c3lsMjhtREwvQjBKUzd1RU1EUnhXQjRhUVNSNW9WMVVXQmVGaXJCUTZrdnVR?=
 =?utf-8?B?S013Ync3cDBJYzd5dzNsRWpIOGdFY1h5K0NrN3FkbXRNWG0yaFBFeHdNWTVQ?=
 =?utf-8?B?Q3dVTktuRUtVVGFuMzU2eHVNOG5pbFIvdkxyb0ZWeTFEYjhlRlRmbi9ybjFt?=
 =?utf-8?B?Q2dxMWtpZ2dZNC9sZWE2UC9LQ0hSZkFuRlRnYlZjNm94TlR1cUpyL2ZxaGZB?=
 =?utf-8?Q?ZfX0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:53:39.7953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ba9ada-a6e5-4526-ebc7-08de1b880819
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655



On 24/10/2025 17:37, Harry Ramsey wrote:
> From: Harry Ramsey <your mail@arm.com>
> 
> Implement `setup_mm` for MPU systems. This variant does not require
> setting up a direct map.
> 
> To reduce code duplication the common initalisation code for both MPU
> and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
> setup steps are now handled by a new helper function `setup_mm_helper`.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/arm64/mmu/mm.c   | 26 +-------------------
>  xen/arch/arm/include/asm/mm.h |  2 ++
>  xen/arch/arm/mm.c             | 45 +++++++++++++++++++++++++++++++++++
>  xen/arch/arm/mpu/mm.c         | 30 +++++++++++++++++++++--
>  4 files changed, 76 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 3e64be6ae6..70b53be032 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -4,8 +4,6 @@
>  #include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/pfn.h>
> -#include <xen/static-memory.h>
> -#include <xen/static-shmem.h>
>  
>  #include <asm/setup.h>
>  
> @@ -240,33 +238,18 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>          panic("Unable to setup the directmap mappings.\n");
>  }
>  
> -void __init setup_mm(void)
> +void __init setup_mm_helper(void)
>  {
>      const struct membanks *banks = bootinfo_get_mem();
>      paddr_t ram_start = INVALID_PADDR;
>      paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
>      unsigned int i;
>  
> -    init_pdx();
> -
> -    /*
> -     * We need some memory to allocate the page-tables used for the directmap
> -     * mappings. But some regions may contain memory already allocated
> -     * for other uses (e.g. modules, reserved-memory...).
> -     *
> -     * For simplicity, add all the free regions in the boot allocator.
> -     */
> -    populate_boot_allocator();
> -
> -    total_pages = 0;
> -
>      for ( i = 0; i < banks->nr_banks; i++ )
>      {
>          const struct membank *bank = &banks->bank[i];
>          paddr_t bank_end = bank->start + bank->size;
>  
> -        ram_size = ram_size + bank->size;
>          ram_start = min(ram_start, bank->start);
>          ram_end = max(ram_end, bank_end);
>  
> @@ -274,16 +257,9 @@ void __init setup_mm(void)
>                                   PFN_DOWN(bank->size));
>      }
>  
> -    total_pages += ram_size >> PAGE_SHIFT;
> -
>      directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
>      directmap_mfn_start = maddr_to_mfn(ram_start);
>      directmap_mfn_end = maddr_to_mfn(ram_end);
> -
> -    setup_frametable_mappings(ram_start, ram_end);
> -
> -    init_staticmem_pages();
> -    init_sharedmem_pages();
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 7a93dad2ed..1f5b41e602 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -202,6 +202,8 @@ extern void remove_early_mappings(void);
>  extern int prepare_secondary_mm(int cpu);
>  /* Map a frame table to cover physical addresses ps through pe */
>  extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
> +/* Helper function to setup memory management */
> +extern void setup_mm_helper(void);
No extern for prototypes, please.

>  /* map a physical range in virtual memory */
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>  
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 3b05b46ee0..f26c28aaf5 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -12,8 +12,12 @@
>  #include <xen/grant_table.h>
>  #include <xen/guest_access.h>
>  #include <xen/mm.h>
> +#include <xen/static-memory.h>
> +#include <xen/static-shmem.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/setup.h>
> +
>  #include <xsm/xsm.h>
>  
>  #include <public/memory.h>
> @@ -24,6 +28,47 @@
>  
>  unsigned long frametable_base_pdx __read_mostly;
>  
> +#if !defined(CONFIG_ARM_32) || defined(CONFIG_MPU)
NIT: Why negation instead of CONFIG_ARM_64?

> +void __init setup_mm(void)
> +{
> +    const struct membanks *banks = bootinfo_get_mem();
> +    paddr_t ram_start = INVALID_PADDR;
> +    paddr_t ram_end = 0;
> +    paddr_t ram_size = 0;
> +    unsigned int i;
> +
> +    init_pdx();
> +
> +    /*
> +     * We need some memory to allocate the page-tables used for the directmap
Isn't this comment here now a bit misleading in MPU case?

> +     * mappings. But some regions may contain memory already allocated
> +     * for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * For simplicity, add all the free regions in the boot allocator.
> +     */
> +    populate_boot_allocator();
NIT: I would suggest to move this right before setup_mm_helper() with a comment
tweaked.

> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
> +
> +        ram_size = ram_size + bank->size;
> +        ram_start = min(ram_start, bank->start);
> +        ram_end = max(ram_end, bank_end);
> +    }
> +
> +    total_pages = ram_size >> PAGE_SHIFT;
> +
> +    setup_mm_helper();
> +
> +    setup_frametable_mappings(ram_start, ram_end);
> +
> +    init_staticmem_pages();
> +    init_sharedmem_pages();
> +}
> +#endif
> +
>  bool flags_has_rwx(unsigned int flags)
>  {
>      /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 3f155b7db2..a058db19ef 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -8,9 +8,11 @@
>  #include <xen/sizes.h>
>  #include <xen/spinlock.h>
>  #include <xen/types.h>
> +#include <xen/pfn.h>
Alphabetic sorting, please.

>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
>  #include <asm/page.h>
> +#include <asm/setup.h>
>  #include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
> @@ -378,9 +380,33 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>      return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
>  }
>  
> -void __init setup_mm(void)
> +/*
> + * Heap must be statically configured in Device Tree through "xen,static-heap"
> + * on MPU systems, use setup_mm_helper() for that.
> + */
> +void __init setup_mm_helper(void)
>  {
> -    BUG_ON("unimplemented");
> +    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +    unsigned int bank = 0;
> +
> +    for ( ; bank < reserved_mem->nr_banks; bank++ )
> +    {
> +        if ( reserved_mem->bank[bank].type == MEMBANK_STATIC_HEAP )
> +        {
> +            paddr_t bank_start = round_pgup(reserved_mem->bank[bank].start);
> +            paddr_t bank_size = round_pgdown(reserved_mem->bank[bank].size);
> +            paddr_t bank_end = bank_start + bank_size;
> +
> +            /* Map static heap with one MPU protection region */
> +            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
> +                panic("Failed to map static heap\n");
> +
> +            break;
> +        }
> +    }
> +
> +    if ( bank == reserved_mem->nr_banks )
> +        panic("No static heap memory bank found\n");
>  }
>  
>  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
Apart from that, the changes LGTM.

~Michal


