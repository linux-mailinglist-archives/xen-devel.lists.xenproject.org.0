Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C9C5249D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 13:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159906.1488161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJA9e-0004x4-G6; Wed, 12 Nov 2025 12:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159906.1488161; Wed, 12 Nov 2025 12:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJA9e-0004uN-Co; Wed, 12 Nov 2025 12:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1159906;
 Wed, 12 Nov 2025 12:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StYb=5U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vJA9c-0004uH-JE
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 12:40:52 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0e32f8c-bfc4-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 13:40:49 +0100 (CET)
Received: from CH2PR07CA0014.namprd07.prod.outlook.com (2603:10b6:610:20::27)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:40:42 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::b5) by CH2PR07CA0014.outlook.office365.com
 (2603:10b6:610:20::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 12:40:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 12:40:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 04:40:41 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 04:40:40 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 04:40:39 -0800
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
X-Inumbo-ID: d0e32f8c-bfc4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMY/R6FH/HGaJ1EukzGNRGDZW9PDTSAYN9GXLL/LXTx0W2OMWmp3OaD3ugV88IvkKZ0ydd1+o9iEzWkq6h9bRSoruyetoCOb2kWOY7VO9FiGOkK/fXnezePttwzZRTp9smygiIWbmC1/gPyDMoFKinEADXL5MPIVG0qfVDEQ4UP6SGGyOtfiiW4xyHsvPfPqiynbZ4Q6Kq+02N2rLAjW4/tqFtW/KwxtYY9EH4+Dy13tG8JvSK8KNI6VMc+U1EJnrjSNhlfSqFFAXdv+3470ej/Dt39Yfd4bFfM14mUZs+jSmrzFg2sghHggQWVeFFk+Cl2IWls1iewU0ENJ/uMy/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE3+909UHoHRw3H1PXye8HgvdIJOubT0T9Oqjuv4lo8=;
 b=nyIGO6e2/rU+0Ej9t969NoNG8i/1irrWTkHlQYafSCyzYBn+6yA0r4lmVz7ty9FINAmQ1dLFrV7DZAV1eHyx3M3PnYGlrPmsOWHSx8EY71tPNsXqOAcmLNuGQtHSAA+ZjoJycW0oL8xWbnfid+RzC9Da/vvWfVh76EcDzYNC2jniRgMS3Qdv7jKwe49CsUO7ocPpLAtYg1vO5wqQqEo3k9XQXREjwCTSRCDgV6GdpafKSA+zFWqGeJKVMRUnfyWfAJTuw+OaR+NHCO1VVhUFbkYVuG7PhrI0y3MMoPbeLmEfHfUlpCRa8t+Fdv+OcBZigdz9vbJVh05GY4C/zkkCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE3+909UHoHRw3H1PXye8HgvdIJOubT0T9Oqjuv4lo8=;
 b=0vw/X/HnLgisKUMtloHrwSSgAl/XbunPkTMNVkFbO8QDnKMAqvgrj4AXknJfrMfj81ltwoZknaGplODqQZHp/MBTFS78ZcwK1tsATM8X2HURPw0Wx61H/mhX+2Nj59i/o1CyF7C+zeSmd9NV74B/letkOTWZ9zqDcHTLZnnFby4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
Date: Wed, 12 Nov 2025 13:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251111101601.4171120-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: d21e65d9-39fe-4f81-06db-08de21e8b0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVNGOFZuTUZKMWNsd29oOTBtalpTWis0Ri9ULzZZcTQvU2ltUXI1eUxIWG8r?=
 =?utf-8?B?dVBNMDljbDhQN3VRWXRhd21Cc00zY1FVUXhWeXJvRFZqRzQwMWRSVTVGUXJD?=
 =?utf-8?B?Rjc4d2tIZUxMYmplSmF3cGZ2WmhOVkxlb1ZxODhOdFRPd1dsblBoY2VnNUw1?=
 =?utf-8?B?TThvTUJqanB2RVVxQzdMMzhONU1xaHpvYzVGTkNnbVNOL1NIVnVjRFVhTkRD?=
 =?utf-8?B?NlI1Z1dIWGJwOHd3cyt5YjROcEZRazVYeWRyQ2NGbXJoNWhuVHFYenUwR0sr?=
 =?utf-8?B?U0lNYnkrQXR3UmlPZ2R6ZUR1VDFFL0duZkxPYno5c212Y25oaDZmR0dMdThx?=
 =?utf-8?B?RW81OGxOeDUzQVYrSHYzbFR6U1dsa0JrQmVuU2paaTJVUTgrelVLcGtnYzhL?=
 =?utf-8?B?VEVwRGIrREJIQkJmVFdHaFhEb1BuaTExRll5alZRQmhEU1RWbWdVdDIwNDZ5?=
 =?utf-8?B?MnJReVdXbmJZVkJRWm9YUE5PZFBWQkxqRTVFZG1mc3R2aW96WHJqZGRLMk1h?=
 =?utf-8?B?bklqdFRCTnA1SmcvdlpBQTlBVGxINVJsbzJIRVZLa05sZ3dVUDhqTmNId09z?=
 =?utf-8?B?NmhZRHo5UTc1M0tna1VBa0c1NS9hQVhCSzJPYkVmcFJteDJxclQxZVhkSUJ3?=
 =?utf-8?B?OHlyeElZcC9DTGpCQWNlNEdoK0ljdmtPcTZEYlRDWDBwSmZtUDdUV0YxMWl6?=
 =?utf-8?B?aFJSM3FnRmQ0SitZVWtYc0ZURFR3dWNnTzBaL3ZLK0xVN1VkNGpFaVYvSEE1?=
 =?utf-8?B?M2Zldjc1R084QXUvTElhRnVOU1hkWnNCcE1VcjI0TmZtc2xWdGxORUZyQ2xX?=
 =?utf-8?B?NE5RSk52QU1YSndEdGt1SjdlZmQ0WG9nTUVLSXZVY3BmVEJ3aElicDAxL0RR?=
 =?utf-8?B?R040K1Z0d29aZUFiYVFQZExpbHdkUnhlVWNhZlRLZmlLSU0ycHkyMnlKbVFi?=
 =?utf-8?B?Yk8zTExEajFjWDZGc25ZM0RkSUIwZTV0NGRMT3VCcm16R2h3Mlg3SkwzSER2?=
 =?utf-8?B?ZkxEMEFCbEE4WDlPR0tkdFN3emlnckgyV2NOaG1hMUYwQ0YvMWEwWnM5TDJC?=
 =?utf-8?B?ZVl4Nko2MHhlbk9SdncvRTZMZkwwa01jcnJueVpCc2NaZHI2YWpNWWhGbjFv?=
 =?utf-8?B?dFhFZW5mbzlib0lmM2JrVnBLOGJwcmVYZE1QTkd2QmJZREh4cEg2eWZJRC9l?=
 =?utf-8?B?d1diZ1drSU5iSE1RUDZQdW9QK0pNQktGWVppRWIrdDlrT2FyUjRtS0F4MjFp?=
 =?utf-8?B?T2ptTDc3S01sOTZqc1QwaGdmc3ZJWGpvbGJJeCtjRmk3M0dOblFaSW84UllY?=
 =?utf-8?B?UjVxN000WmZ6VExpVEwraVdpeEh1RTJGMWtQc05ObWpza1ZoSDVKRE9WczlH?=
 =?utf-8?B?ZnZqRHozMDZSYm8yNnU5Z0ZpZ0JlR3FwUHhKUEtGeHVodlpIUDVkaXJFUlV0?=
 =?utf-8?B?NVdxN2paMWVsQnQ4MXRGVzdlendSaEdyZm9ZK2ZlZDhwWkRMSG5adElheW5H?=
 =?utf-8?B?aytmWHgwcitLOE5uYmxhd2xUcWlFaUNkcTFaNGIzbFlkQlJMZVNPMmowbWFO?=
 =?utf-8?B?ZXc1a3ZxSU53NmRjaHg3UGo5b2VzUzBNTy9mL0p5ZFM3QytGNGcwZEI0L01T?=
 =?utf-8?B?U2tGZzFNUXRyaTNLeUdsSHB6NmVOc0lvWFZvSktKNVRPLzRZNGovY1hQMGht?=
 =?utf-8?B?SU5WSmppUWZvb3U4NTdYdEpGNUd3aUpUN2pDaUZEM2daa2RUY2ZIU2JJbk5a?=
 =?utf-8?B?N0Vvd01OanVQcGU1dkZYRnNORFFqVXhwaFl2WTgxa3BqRzBFUDRmWkZVWVM1?=
 =?utf-8?B?ZzljQldpNWpEdi9IT1BBRWZnMEt3V3BzcTFzTk9RZUFrRitRWWpuUGJMUGZk?=
 =?utf-8?B?Sk9UZlFRcGFoMFZnVzJ5dzdOcUUzZFp4a0JsUWhHUVREczdVSXZveXRqNzNz?=
 =?utf-8?B?TUY1UVZyQ21QdFR5bm9TeUlRaDZmODZHeVE4bGgrV2Qxbi9PenJXZS9CL2RN?=
 =?utf-8?B?dm9DaG9HK3crZmF4TGlQZGdoSFF2ZU5sVGtEc1pHcExQbG1OSnh3Sm9RZml0?=
 =?utf-8?B?RFRGVG1xUXowbEJEUmZVTGFEZ3hDU3JyVjk4eDNNcjdkTWNKVStrdW9QOGhR?=
 =?utf-8?Q?LeaM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:40:41.6645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21e65d9-39fe-4f81-06db-08de21e8b0e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209



On 11/11/2025 11:15, Harry Ramsey wrote:
> Implement `setup_mm` for MPU systems. This variant does not require
> setting up a direct map.
> 
> To reduce code duplication the common initalisation code for both MPU
> and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
> setup steps are now handled by a new helper function `setup_mm_helper`.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> Changes in v2:
> - Improve clarity with regards to MPU setup in setup_mm
> ---
>  xen/arch/arm/arm64/mmu/mm.c   | 26 +------------------
>  xen/arch/arm/include/asm/mm.h |  2 ++
>  xen/arch/arm/mm.c             | 48 +++++++++++++++++++++++++++++++++++
>  xen/arch/arm/mpu/mm.c         | 30 ++++++++++++++++++++--
>  4 files changed, 79 insertions(+), 27 deletions(-)
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
> index 7a93dad2ed..f702f4a0d6 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -202,6 +202,8 @@ extern void remove_early_mappings(void);
>  extern int prepare_secondary_mm(int cpu);
>  /* Map a frame table to cover physical addresses ps through pe */
>  extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
> +/* Helper function to setup memory management */
> +void setup_mm_helper(void);
>  /* map a physical range in virtual memory */
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 3b05b46ee0..c1208de26c 100644
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
> @@ -24,6 +28,50 @@
> 
>  unsigned long frametable_base_pdx __read_mostly;
> 
> +#if defined(CONFIG_ARM_64) || defined(CONFIG_MPU)
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
> +    /*
> +     * On MMU systems we need some memory to allocate the page-tables used for
> +     * the directmap mappings.  But some regions may contain memory already
> +     * allocated for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * On MPU systems we need to pre-reserve regions that were allocated for
> +     * other uses (e.g. modules, reserved-memory...).
I'm not sure I understand this part of the comment with regards to
populate_boot_allocator(). Could you please explain?

~Michal


