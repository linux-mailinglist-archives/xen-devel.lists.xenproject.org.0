Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8577FB2F5B3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088473.1446216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2wl-0001xN-L5; Thu, 21 Aug 2025 10:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088473.1446216; Thu, 21 Aug 2025 10:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2wl-0001vv-Gb; Thu, 21 Aug 2025 10:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1088473;
 Thu, 21 Aug 2025 10:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1up2wj-0001ve-VO
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:55:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2009::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ab92a41-7e7d-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:55:04 +0200 (CEST)
Received: from MN0P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::12)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:55:00 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::e) by MN0P223CA0026.outlook.office365.com
 (2603:10b6:208:52b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 10:55:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 10:55:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 05:54:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 05:54:59 -0500
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 05:54:58 -0500
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
X-Inumbo-ID: 4ab92a41-7e7d-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEsreqZGpMNG2sOd7OaID3wLCIGMbfQiOiGylJZf+bw2P2RyH10wejfpnvmSuiWCkNpJ6t6mbEMn5103U/K+w9RKNTXI1EsmTW6FTlpL+7mhwWOPYATRq8Y1XRm88TFfkIdNmmIRtwhAYGbS2Tf1ZNGDcWdCXRJL9LI/BAssmYUf3M2KFKObLCB4PcjzaPJVN0O2AUcClUuhL4mOkA97HQIzLftzBWdbuP5ppaH+1i9g/HsV8RT7daXTjfQ4iTCWXox3NKXn/JRI8UfZuuQT58UXGBAxCOYBbG3E16Jr1icy2KnO4Div+gfyTzAPmAZPUwoQCZPKodVO4KtoXK5VsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ1bLXXhExpFxPT5ePWApPcDNlZrRuF/q+j1MbvLydY=;
 b=d5DhQiDyx9A3dybjM08xVNFS/XUF7cdU5rlx0WFQTPOJpZOwciOg5DFVdUyF2O8oMjmnhja+tAzJfZkYdQbvoxZCJtMjrr9zd8jtRj/cJARfFuoBjQeVo/NyTJz5FFElLPvkA13z8bTMG0c9R8+uW23zA0CNZ1wJx5cKebURmAu7KLger47Y9MaDNIpIrsuYeeDcJ7e1kDo19fVBjGhU4Ak6Ld/w+JWgr537qbP69sKqxP1IOQGpKq2GSz7DbxJt68J/w/rzh1VzjA5FP1etvjCP4GVuGLr2AQLjYt+9YaYKu1fM+h8AS93aS+aj1lyp/9NosMO5kFuCT1VIL2rnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ1bLXXhExpFxPT5ePWApPcDNlZrRuF/q+j1MbvLydY=;
 b=CB9RGGg5iA45gk6dqHITwh7zoTeutro8CtyU1zcn5kWrjqcCgWTYv/1NPI6qrEfl4ECxpS7RB3LKHGQGD4yEXFIBr8hXF7evC2FV8+7ALRGauE3e9fl8A2He8AjJULqzt3SXjDEhaP15iydS1SDGRygKx0qD8OFQVSuEC637yzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <68a74142-667b-4b8e-8340-fd41ec15046c@amd.com>
Date: Thu, 21 Aug 2025 12:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 46feee6f-4a24-47cf-f8d1-08dde0a12cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2VtKzR4VUlLcnpQRFp2VWp3NTZrbWJHSWxEc3NudUt3L08xNk1hUWZMMzA5?=
 =?utf-8?B?UGx1eFJJYUJsdXhHNG5uV3hWYUhqUzFiaE0zeFlZb0FIcDd5R3RHcSs3Zkd4?=
 =?utf-8?B?NWtnYm51RUs5MnBKWTAxaVJ6djhXNGlTb3liUmRWcnV3SmZDeU1zVytjdTZM?=
 =?utf-8?B?aC9oK3NrSWJJbnRLREUvM0VZUnZCdDJGMUhzbys5VENBM2h5cW56NHFHVmdi?=
 =?utf-8?B?SFZaVjRwMkRZbXdQS2s0NEw0UUtBK0VqcVdxekdsNlkvR2VmOXJFTVAvOVZR?=
 =?utf-8?B?bVRFeVZPcWJYQTYxUm53R3NlQU5JSjFPUVY3NUduRzVJaWpERzNjYVA4VHBl?=
 =?utf-8?B?MS8ya0dXeTkxMWxTMTFnREdGaDVaanFPQk1EZncyLzIycjRNNm5OQnNEMHND?=
 =?utf-8?B?QzVrOFEwUmlrUHNJeTdkNWhxYW03bjYwZHhRNGpnNGtYeW5LcTNKQ0lvYng2?=
 =?utf-8?B?eFBjU0ZLeE16Z0lveDFIZmxxYjg5V0IrT1o0QnAzU0NoVzJUb2pYK3VhZWhT?=
 =?utf-8?B?SlNBc0U0bnBsRjgrallzNUNsZFRjeExUZU1SeTZqRW5XT2RlOTdXZkgzZ1Nx?=
 =?utf-8?B?aVR5Tlh6Yno4YzlkQUdUcklENmZua29ONEVNZzQwMEhPbmJoQmVnYWJjQ2pL?=
 =?utf-8?B?MkNocmxPaUd3KzlIVTZYQ2NZdmlxWkFWN2NFUEpZVjFIb3IrbjRqQ250NmlC?=
 =?utf-8?B?WEZFU3hzSlBuZmpZVE1qZGcraW5lNnZXQTVhS0cxNXcycDBIbnhrRDhtNTFv?=
 =?utf-8?B?QVl1dDNhOG9XUythcjRPVlV0eTZ1bitOUjZoNEhMd3ZYN0pRMVRhRnVEY2xs?=
 =?utf-8?B?YlhwU0plSTIwL1NGTjBVMHBEdW4wYllycTVyNVJaK3FVZVFGYWNndmlXTmMv?=
 =?utf-8?B?ZkpRZWxzLzE1S3p2TXVBaWQzaHo5dzNETjlnbzRLamZuZFdnRS9MTjgva0hG?=
 =?utf-8?B?ck82TzdNQ0NqNmVacXZIdkhYNHA2OERnOXJPaVVEejBBQUlaQ1dGMVIzQ0VJ?=
 =?utf-8?B?L1pwNGxkOHFJZmZ3eXI2ZWtGL1BFUlpIeFJZeUFmMjlLOXVvRmwvKzQvYXV2?=
 =?utf-8?B?WUNlb3dUZHc5Y1RlekFlWGd6ZFpFSnVaYUxYSGRqREpnY2N4RUw3NzNHNXQ0?=
 =?utf-8?B?Z2cvSnI4RWVpUHdDZnE1bmpUT0dFb21lN3pxVG9hYmloWWc4c1F4eXRFMWlw?=
 =?utf-8?B?bjg1THY5Ymk3MGpMWTk4NmovOFQzT2JKWjVYeWVSWFNTTnc1c0E4NVBSUWNB?=
 =?utf-8?B?QXFNaFRJdUg0d0c5NHpiMmZzK2VXZEIvQ1ZYc1MveDVVTXBrYWg1Q3l3YlN2?=
 =?utf-8?B?WElSR25PVW5qaU9CMXJNR0NaL1B0RW5pUnhEaFRVbmFPaXp2dUh2NDR4VGZh?=
 =?utf-8?B?WFcxQXhNdGRRejg5ZjlxUGp4SlF4UEpDRzYvOEJ2YlIxdFVhSnMzNEhoQmRW?=
 =?utf-8?B?Y1ZjMUJibVpEMDlETGpQZmV4NUN2a1JYQXNDVmU5cXQrMWhaK2czTzdvN0kv?=
 =?utf-8?B?RFcySmJNYXcraHQvNWg4ZnE4QlhGQkVYVUpXV1FCSUd1SUdSN2hSaFF6Vmk1?=
 =?utf-8?B?cnY3WU9qNFhnbmc1aUJnYU1xZytWTG16SUJXOGxPZ25zbm4wdndPcVJqUElY?=
 =?utf-8?B?OFp6UGRCMzIvbWkxVXI2OXVHaGp4VUNjaUVTY05mZFRaNHl0YWFOTW9sajB4?=
 =?utf-8?B?K1lFQkNQck1sbGgwa2hOR0pBckZ1UVh6YUdwYS9XUUZjeVcyV2tDMlZGd05Y?=
 =?utf-8?B?dUxvRFVkUW1EY2NPT3hzcEFiVUpURWpKQUlZY01TbDJpTUJGRklHSXlLdCto?=
 =?utf-8?B?aHd0TDBKZ2FEdzZVTHFKQmV2Rk1LMmhjOVo5S2Q0M0p0L2RzUk9jTzRkZE5s?=
 =?utf-8?B?NEVOelZjWTR2VHFPY29JRUtVcjkyYlYyZHhaeUgrUFA1QnBGN2V3eXJpT3A0?=
 =?utf-8?B?UjIvMG1rbE9sWXlHR1c4WEpVY3QyNGM1Z0dnMUFjMXl0NlNzdTlvOFRKV3Vq?=
 =?utf-8?B?cWp2Z2dPUXVlWHRVMGZxUDRYUkRaZGFyS2xLV2lFaWdQT1doK1dCaHVqYkhO?=
 =?utf-8?Q?YAngOL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:55:00.1200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46feee6f-4a24-47cf-f8d1-08dde0a12cbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430



On 30/07/2025 10:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement `setup_mm` for MPU systems. This variant doesn't need to set
> up the direct map.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>  xen/arch/arm/mpu/mm.c | 64 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 6a16fa348d..0b05103180 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -8,9 +8,12 @@
>  #include <xen/sizes.h>
>  #include <xen/spinlock.h>
>  #include <xen/types.h>
> +#include <xen/static-memory.h>
> +#include <xen/static-shmem.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
>  #include <asm/page.h>
> +#include <asm/setup.h>
>  #include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
> @@ -364,9 +367,68 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>      return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
>  }
>  
> +/*
> + * Heap must be statically configured in Device Tree through "xen,static-heap"
> + * on MPU systems.
> + */
> +static void __init setup_staticheap_mappings(void)
> +{
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
> +}
> +
>  void __init setup_mm(void)
>  {
> -    BUG_ON("unimplemented");
> +    const struct membanks *mem = bootinfo_get_mem();
> +    paddr_t ram_start = INVALID_PADDR, ram_end = 0, ram_size = 0;
> +
> +    if ( !mem->nr_banks )
> +        panic("No memory bank\n");
> +
> +    init_pdx();
> +
> +    populate_boot_allocator();
> +
> +    total_pages = 0;
There's no other place setting up total_pages between this and += ram_size
so I consider it not needed assignment. And actually, this could be calculated
in init_pdx() next to max_page to avoid requiring each arch (arm32, arm64, mpu)
to set it exactly the same.

> +    for ( unsigned int bank = 0 ; bank < mem->nr_banks; bank++ )
; should be added right after a field, so bank = 0; > +    {
> +        paddr_t bank_start = round_pgup(mem->bank[bank].start);
> +        paddr_t bank_size = round_pgdown(mem->bank[bank].size);
> +        paddr_t bank_end = bank_start + bank_size;
> +
> +        ram_size = ram_size + bank_size;
> +        ram_start = min(ram_start, bank_start);
> +        ram_end = max(ram_end, bank_end);
> +    }
> +
> +    setup_staticheap_mappings();
> +
> +    total_pages += ram_size >> PAGE_SHIFT;
> +    max_page = PFN_DOWN(ram_end);
This is already calculated in init_pdx() after my recent changes

> +
> +    setup_frametable_mappings(ram_start, ram_end);
> +
> +    init_staticmem_pages();
> +    init_sharedmem_pages();
>  }
>  
>  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)

~Michal


