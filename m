Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C5A9D3C4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 23:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968593.1358120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8QBv-0003Rw-71; Fri, 25 Apr 2025 21:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968593.1358120; Fri, 25 Apr 2025 21:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8QBv-0003QU-3v; Fri, 25 Apr 2025 21:02:35 +0000
Received: by outflank-mailman (input) for mailman id 968593;
 Fri, 25 Apr 2025 21:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzCY=XL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u8QBt-0003QO-Pp
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 21:02:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a0a86f6-2218-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 23:02:31 +0200 (CEST)
Received: from SN6PR08CA0001.namprd08.prod.outlook.com (2603:10b6:805:66::14)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Fri, 25 Apr
 2025 21:02:26 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::79) by SN6PR08CA0001.outlook.office365.com
 (2603:10b6:805:66::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Fri,
 25 Apr 2025 21:02:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 21:02:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 16:02:26 -0500
Received: from [192.168.223.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 16:02:25 -0500
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
X-Inumbo-ID: 9a0a86f6-2218-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBTjknYY0lLhc1gBswX1LKuNG0XEjcqqMQXaqoxx/TSPkGhjp10upV4NcmImp2sMJtmL+RUa8zYRi0j4anBSn/wLESU4sT7WriF/FNvQZbzjNshUs+4ektDOdgjzoOYg39FwbF7AVukB5FRY2Sv0gANh/rGj3CElCw2SNhD2vTTkcXWJFGhvdJg2xDcnijPmAnKlqSPQsNBemOBv5Jhxybp2pyk6vr77YgCePaQV0gTiFZ3bfWK010bfO6iKNM9SRjgbzymFoHJlkMQaMKC5iXPQQuNow5CpCdanB2EeV3Drglvv5LJe+c1j63DcHLaLfQ+doOVPUAyHga0uBwhvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGTN0utfgBIv/9NwYwZcICS+oitqUJmGyjrqMmu3XxM=;
 b=FLT3rFxPLXGLhDNvFuydzmna9UZsK1caEg5aHYQtRYLAG2dLZ4TSkGZm1Ek3Vnu6e7/uVwXuTjJuDgJaoSy/so2ZouPuBs6mVFS4+Be/e7VQtYxjYyP9KL5i8udzae+XhqzAmtbPeTE8u63rOUxVa0uGTSy0Gx5eGASRTWoH/iu3yW45xdW8NUrxojAUBQgHMCSRcPiBw5hcgvd5yrXha86pT/TAIyODJDAVSKuZRQKvD362SjMlwmhzzj7m5y/v30keU6ezlvWMnpks+7EMiiUeiHHFpm19sUW2fillZOw4PbyV1YBcqh+IXVRwSilQTbPWFxwkklgIaii+GxX2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ariadne.space smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGTN0utfgBIv/9NwYwZcICS+oitqUJmGyjrqMmu3XxM=;
 b=0t7bavylRmRFjAQPmOFCks8K5RJ+gc0B4b3ePXwjvwPUZYdI4PK+36mMA9e/EJRD1ZPdmteQzEb+JL3yMBf7sZYURSq+Qqe5S9dujTDdpmxAlXk3Y3NcnbtsywhUdqh8IjY6PLmWpkO168+qvw4TZ0a9Rfc+FqxEYPpV+l9L9w8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9f7ffd79-7439-40f3-9349-4f9f4d2ee1dd@amd.com>
Date: Fri, 25 Apr 2025 17:02:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hyperv: use dynamically allocated page for hypercalls
To: Ariadne Conill <ariadne@ariadne.space>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <agarciav@amd.com>, "Alexander M .
 Merritt" <alexander@edera.dev>
References: <20250425165148.60408-1-ariadne@ariadne.space>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250425165148.60408-1-ariadne@ariadne.space>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8353f28c-2cdb-4025-bd30-08dd843c7bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDExdzBsYXlVS1MwYXJGeXZQUVliM2cxZ3Q3QmpPcHd6SzNONUVDUzBpRUZq?=
 =?utf-8?B?TnNTZmhnR3FaRGFRdXdsV2ZBQmtEZ0lZZE5VU1RpbkFqNmtIRW5aUVU4NTVv?=
 =?utf-8?B?dis2WEI2NlNtbHRnS0JjMWlHN3g4bStZOS83K0pwVVRlcDlMNmJQcHd5djB4?=
 =?utf-8?B?bkZSK2lZREk0WlVNMjdyRWNLeEJqRnVIOEhzeE9rVFhVajN4VUtMZ2REZjR2?=
 =?utf-8?B?MUptNHk3eVp0VCs0bjY5R3Z0ZzBqb3phRkxWeHp6SUw2VVRhZUN0L2VRNi9J?=
 =?utf-8?B?eXQ2UzROOEZMRCtpWk9mVFV6WDcyNTBpVEQ3WEowaDBrZXB1L1JSaFhmL2Ry?=
 =?utf-8?B?RU5OWXh4RzYyTzZVdHV2TEhVdlB6WVFhWUVOaUVFU2xpYmV1UjFWdm5uRTFG?=
 =?utf-8?B?eDk1eG5mWkJHa09XL3BDT2J1bC94MGRabWV6dFlraGlCMUd6RnV0WWNlRWNl?=
 =?utf-8?B?bnF0cFF1M3hmNDBEak04MVROVDlkREdrL1F4dmFwTTB3dHl4a3ZyK2dpVzhQ?=
 =?utf-8?B?NVVhWFBJZWFMaWFYRWwzR0xKUDJVK01mQU1FU0VTZXJ6d2grVVZxZVhXL011?=
 =?utf-8?B?cG9YY1NtYkkrY1dYU0x1T25HWGptcldXWXJ3Wk15Ujh6cWlnQ0tqMjJRUVht?=
 =?utf-8?B?aVM3QXpjTjN1czF5UDJvNjJMdGptZDBvNzFVZ29RamZUMVl1dHlPRFVpQ2Fp?=
 =?utf-8?B?YnA1bE5jcFlHTHNDUWlyS1NjV3AwaHp6NE8wbndhdzVweSt3dDFIMEVTTkhm?=
 =?utf-8?B?a0R1TmpxY1Yrdk1ZR2t5RnEvSFBoQ1hSZUlaWWdVdDkrSWVzalZDUEwwYjRF?=
 =?utf-8?B?YTcvSm9DbVc5VVZqRWZUSjNkTHkxYzROWWZvRE8wWm5MRzI3Q2RyV0ZCb3dP?=
 =?utf-8?B?b2E3ZFBPM0xyRHB4OU0wdGVGUks5eC9rclJlSWhnclgvMnNqN1JETUlIUDJ4?=
 =?utf-8?B?V0hvL3pIZkoyanV4bVg5dmx1RFRzS2NhWE90dzRzVThnSmNieFNjVDlsSU1n?=
 =?utf-8?B?d3p2ZFV3V3BIbzNPWUkzMmNyZWFScTgzYkkrSDRNWEluZUdFSzZKQys0WUw5?=
 =?utf-8?B?YnA0MmYvQ2lidklrZDF6bjB3Q3hsM1RCQ0taSWYzemZkTjVnYXp5TDdjNVBO?=
 =?utf-8?B?QnZRYkI0ekxYNVIzZlFsT29qajc5SFV1SzZZNkpxU3FuUUp3SXBhK3pZSkow?=
 =?utf-8?B?UW5RR3FGMThaWlUvQVA2dVZIaUZEL1JGVzJOMitXU2Y0aEVaRkxYQ1ZQZzEr?=
 =?utf-8?B?WnJEbzVwKzJXQytzYXVEYlZxcWFoMFBueVd6NzlwUXl4M1RFNTZkNzd3RjBJ?=
 =?utf-8?B?QkdMUm1adGQ5ZHAvdHpib2dHUHRBaHh3Y2ZjT21vVHFoa0hJOTlkbCs1Wjk4?=
 =?utf-8?B?UXpCc2UydHQrem9wdVMwdVZHQXFCR2JOeTVZaGRIWmY0VE5aVTJRbHN2RDVq?=
 =?utf-8?B?QnluSFg4SHpQVUVPOVJVRTdaVUkzYU0xdjFnWS9xbFk3ZWJMbklNdU85OE4z?=
 =?utf-8?B?UDhGWmtHM1lEeXpSamU4a1d5NXNWY0ovVFBjQUlpWkR0MkhjL0hkL0JneGlD?=
 =?utf-8?B?Z3IzOEdwdUpXQkwyUm54UE9ESlpqNE8wcmx2QXUxREtLSnRPdWxwemczMlFa?=
 =?utf-8?B?SXlMTXJNQkxJQzZKWWlYQlpWbWhBekQyWGJLd0dWdzcxWjUzd0s5NWZYRjlq?=
 =?utf-8?B?V0lSd1JJSmtIcVhCaU0zazRncWVNb3BXVnJXK0dPVEt0VDhKd09nR00wY2Q5?=
 =?utf-8?B?QjZwVjBNMmNWcmVZTHRrMGRudlhxN003eDd2SUFobHdnU2UwYjNGMFRpTTBX?=
 =?utf-8?B?OHZPVjhhLzc3WTh5bmk1TGpQd1k5UDRsNXlyWGJMUW5tSjNrcVpsbmJIaStK?=
 =?utf-8?B?Ukx1eHVDQ2VNUUhqeWRUc0RlRkRTeGo4dEQ0MDF5c2t2bHJYREFvRjliVHhS?=
 =?utf-8?B?TmRKdzRwS0o5Vk15ams1aUZMa0sydEJHSXduT1k5dlVkbE1SR0VMd0l1S2Fi?=
 =?utf-8?B?cEd0eWNVUDFKTU03TTBRV3AybkswTkhDd1hWcnhIbWJvK1B0M2xTc253L2R5?=
 =?utf-8?Q?vOseSz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 21:02:26.6821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8353f28c-2cdb-4025-bd30-08dd843c7bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350

On 2025-04-25 12:51, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
> 
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.
> 
> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> ---
>   xen/arch/x86/guest/hyperv/hyperv.c            | 39 ++++++++++---------
>   xen/arch/x86/include/asm/fixmap.h             |  3 --
>   xen/arch/x86/include/asm/guest/hyperv-hcall.h | 12 +++---
>   xen/arch/x86/include/asm/guest/hyperv-tlfs.h  |  2 +
>   xen/arch/x86/include/asm/guest/hyperv.h       |  3 --
>   xen/arch/x86/xen.lds.S                        |  4 --
>   6 files changed, 28 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 6989af38f1..637b4bf335 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c

> @@ -98,10 +97,22 @@ static void __init setup_hypercall_page(void)
>       rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>       if ( !hypercall_msr.enable )
>       {
> -        mfn = HV_HCALL_MFN;
> +        hv_hcall_page = alloc_xenheap_page();
> +        if ( !hv_hcall_page )
> +        {
> +            printk("Hyper-V: Failed to allocate hypercall trampoline page\n");

Minor, but maybe panic() here and avoid changing the return type?

> +            return -ENOMEM;
> +        }
> +
> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hv_hcall_page);
> +
> +        mfn = virt_to_mfn(hv_hcall_page);
>           hypercall_msr.enable = 1;
>           hypercall_msr.guest_physical_address = mfn;
>           wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +
> +        start = (unsigned long) hv_hcall_page;
> +        modify_xen_mappings(start, start + PAGE_SIZE, PAGE_HYPERVISOR_RX);
>       }
>       else
>           mfn = hypercall_msr.guest_physical_address;

> diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> index b76dbf9ccc..b73edca7c6 100644
> --- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> @@ -20,13 +20,13 @@ static inline uint64_t hv_do_hypercall(uint64_t control, paddr_t input_addr,
>                                          paddr_t output_addr)
>   {
>       uint64_t status;
> -    register unsigned long r8 asm ( "r8" ) = output_addr;
>   
>       /* See TLFS for volatile registers */
> -    asm volatile ( "call hv_hcall_page"
> +    asm volatile ( "mov %[output_addr], %%r8\n"

Don't you need to list r8 as clobbered?  Or maybe just retain the r8 
handling above and below to avoid this mov.

> +                   "call *%[target_addr]"

It might be preferable to retain a direct call which can still be 
installed with __set_fixmap_x.  Otherwise, __set_fixmap_x can be removed

Generally looks good.

Thanks,
Jason

>                      : "=a" (status), "+c" (control),
>                        "+d" (input_addr) ASM_CALL_CONSTRAINT
> -                   : "r" (r8)
> +                   : [output_addr] "r" (output_addr), [target_addr] "r" (hv_hcall_page)
>                      : "memory" );
>   
>       return status;


