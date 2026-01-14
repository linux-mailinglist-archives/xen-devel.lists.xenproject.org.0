Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4270D1EE58
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 13:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203036.1518373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg0KJ-0003Ve-6a; Wed, 14 Jan 2026 12:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203036.1518373; Wed, 14 Jan 2026 12:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg0KJ-0003TS-2Q; Wed, 14 Jan 2026 12:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1203036;
 Wed, 14 Jan 2026 12:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX2Z=7T=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vg0KH-0003TM-Ro
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 12:50:18 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb00419-f147-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 13:50:06 +0100 (CET)
Received: from BN9PR03CA0582.namprd03.prod.outlook.com (2603:10b6:408:10d::17)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 12:50:02 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:10d:cafe::da) by BN9PR03CA0582.outlook.office365.com
 (2603:10b6:408:10d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 12:49:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 12:50:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 06:50:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 06:50:01 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 06:49:59 -0600
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
X-Inumbo-ID: 8cb00419-f147-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGH4hCyb8Z7XDZog/aQ2ULMDpi08Gif9SepZR56lY3H31jDAxFyUGm1OJUrefNvlCjQZU0hCMcwATDTB7ZcuKs/hALjZQRdh0Rd8uriR+VnfIkx5VH+E7AVi1b2apcg/+foxLxJhDktJpbbqgQAc21oPjmBEjCJGvVswNubm1AiVguqpd72tcmqBQlphHUtZ12j4pbILtYKHVwAgj3RdX7ZDs9ZNaYJLIAMzr/jEN/X/+vWOuw9bYQMpizjQXhuJkF11kQoLAzknlwjODm9y7aDQRY1C67q1ubbVkh89KVqCkveno9lkX1ycwQzLxUBAdDFPPCnnfFauvG5fO8DpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zZ9bo2AxtsZsclXePPyt8sA012nTA58g7aY6KPLgbc=;
 b=IiP/T8a3DBEK7holLn0IVKZNKMODt3FiyT8vm2WOWUkCFaU6NaAhK49r1R3nkkkE/BYUOur6rrVBO2lHIJSWGs7x2P7qAh7hz4DRMROfwoO7hQJc9UOSkW9sy7kWDz/4bh8h/ZCvHeTh3QrgG9viUQIIt0v5Vf6zmYW2ujjfNaNuuE+hCefMftRaSncvfgwxOBJyz3jvT3wykd5b1hdhYfg0yXUkpX2gqOeUV6Cv5ECFANer+V4w2MfN1x+Q132mEy7NSN3nUGjb/zcYNVBRST7fYYvKgcqmryglJ4SFzkKrYLegW7OQZPVmyJEDjP6WjANltrwve1Ep1YjdBrEtmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zZ9bo2AxtsZsclXePPyt8sA012nTA58g7aY6KPLgbc=;
 b=UvlAKitZ+p40Miygwv8v1p6diHjcUFC6+GbHSX4e+pRB0QF0B8WH0RmBggDlT/Mcafe1LBKB3+qCmZJfVZ8SiEjuqX9z3jyoPSyPPplO2IVwXjaUoa1T84xFwPVNe34f1xiN4rOOKs8aLYNJ7vHM1HHIp6LORJ3Rf9VzmyFSscw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9051c577-503f-487c-b180-36a4197e9bea@amd.com>
Date: Wed, 14 Jan 2026 13:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm/mpu: Implement free_init_memory for MPU
 systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
 <20260113162309.6766-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260113162309.6766-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 044a32a6-f7a5-4527-4e69-08de536b6f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUtPNFVkMThtQTk1SUNMekJrMHloWUlnc3VlTzVxRHRNYWI2eUl4MmJQSjRr?=
 =?utf-8?B?L0hKdGFXSVdoWFJzR2lsVXNVY2s5OGZiTk5VM05JSldwTnFkKzV3TFRCeDA3?=
 =?utf-8?B?Y3Q4ZVVQaTI3ZlRLVWVXejVzS3RjcVFkNzBWL0ZUcVRJODVSQmZKVGFnSUp4?=
 =?utf-8?B?YWprMnBzQi8rczVVKzBKRmNDdytQbnNpYVhwWnRHdWJVVXNEZEpWTWhNNjNo?=
 =?utf-8?B?aFYveDBVcE1GQWtuZFUwU2tMUlBkbjFMTXhzU3RpSWV5Q1pVd3JiLzJpYkpC?=
 =?utf-8?B?WXNJZG1TNTJBd2hTcDhGKytVQkl0ZU9KcGFrcmRiY2hScHdpYWpaMUZDbHlj?=
 =?utf-8?B?aEp5NVkwcE5KU1YyNEF6ck5NMjNpYjZ2UjhHbU1QSXhxL1BjeDJxb0NmT3Nr?=
 =?utf-8?B?OVlWT1kwVy9DYWdIMEhqT0paWXo4SldOTGg1dC9OMlR6bHU2LzJJbFkrMmpX?=
 =?utf-8?B?L1kvQU1ZNlA1YUJlTjRka3JzVEdqN0JOVnVkUSt1blRhelRFZnUzUXdHQXlO?=
 =?utf-8?B?dDQwb21nRWhHZDlmeGhZNFRna1FUSGlYVGMyc1IrQm15NG9nZ0RUMk0wUWwx?=
 =?utf-8?B?L3gvd2tjeTJzNHdqeDI4TXR6cUpDMUl3NGdYeGZjekwrUmdEVmh3bzhCaG1G?=
 =?utf-8?B?eGxwcUdNS1I1dnU4VlZXQ3lWYUpGYm0wYlg4dTJpYjBtZzlmYml5VkY0NE5O?=
 =?utf-8?B?Vmhoemx5VUxubEhOOVBuaEtvcit6MlRVUi9PSWZYbjJVMlo3cUZBaUJZbWIx?=
 =?utf-8?B?THVDeWhFRkxSV012dWtISFNSUU1HS2p0N1RCRXp5cHhnbDJZMEpMSUpiRk5x?=
 =?utf-8?B?MlRPS1pQcWdsUGVERVkvWDZseDMwdkFrTi9HQjBNRDJQclBCRlpjdWJHV3pL?=
 =?utf-8?B?T2VkUWd5VXJHaE50azRwcnl0aEdtYTB0SUFMQURHOFlhb0lreUtGbzlrK0lP?=
 =?utf-8?B?czFVeFREVXJtdlhWemx4ZW5xV0tsaVlHc1Q2KzhXTUVsSUtwUHBCSzlEUlhl?=
 =?utf-8?B?N0lJMURDbmlyTFRnczA0ajhjbjFwWGt2QXIvSlR2bWxrdElpTEFPWW5jV3p6?=
 =?utf-8?B?Z2FlT2w0Qy9sek51Q2JobXhWY2FweHZNS3lzSXRDWXEzZXFmYjAzRGtzV1Fn?=
 =?utf-8?B?aWNGaHNVWGR6R0hGOXQ0MW9HYVd3WHVjSHg2d0t6ZHBiVy95NCtQdnhmZ0gy?=
 =?utf-8?B?YjZjZTQ5R3FMWGdkNTE2UGxRY2pUTVFjN3ZrUVRwWElKT2Y5WTNJUVQ0V2NJ?=
 =?utf-8?B?QWE2RkVZazJJTjN4TUxIY1pvWllkUkVJaEdQWVE2Y1JjZ3lKa25iNDhVY0k0?=
 =?utf-8?B?TUxuUWFtNDNPcFQvV3h0V3kwd3lxdExnYUxzRU4rcFdOS0ZhbmZzbEF2UWRW?=
 =?utf-8?B?ZTBjbFFEVE9WWnNCT2I2Y2hPbHROYkd2aUF5bjc2V2ZaL2kzcXo4anQ2WFZw?=
 =?utf-8?B?aU9acXBlYi91YWlpSmZaSkZqSVNCK0JKMG1nY2ZxMXV5REtzaDVwQ0d4b2dw?=
 =?utf-8?B?WXhCK21IREY1dzZKbGFobDErYnA4NUNWNUNvNWkxaWRITDJpUnJId2g0Z1VT?=
 =?utf-8?B?VkVFM0VFNXMzMFVtejFlOHBpaUFpYnEwbFNsdW5BeDRZU1hob0F6VXJWR203?=
 =?utf-8?B?eHR4Y1hmQkVJVzYvanVSUEQ2dFdlNTVGZEttclYxdTk4TGFtQ2hIN1NUbFgw?=
 =?utf-8?B?dS9QbnhSVC81aitVbnlCa3lKTmNPOHVWQUI4anAxdSsxNnVSRjUzSXdsSEF4?=
 =?utf-8?B?UkplT0wxZWJyWHNLOVJCa0RFb2hIT001WmcyZ0UvUW1aOHRkcW9SQXlQWGtK?=
 =?utf-8?B?SXl1Rmd4a1hzTXIrNXVtUkVLMGN6UnAyNXlwdm5nUE5DWEZoa3ppTGN2aHR4?=
 =?utf-8?B?SHIrOHRRb3J5a29sOFBqSkNJZlhud3l5OGFsQTNDTTcvTU5OZElMYkowdi9q?=
 =?utf-8?B?ZkZaOUU5SFJZZENHTlhXUE5nMnAwOE13Q1JhaWNnZ2lTOU1QRkhGK0FrZG03?=
 =?utf-8?B?eUlBWHQ3ZFJIcGJzUTBvQjVQNDhkZURBY1FPVG5aWmhqc0VLWDVsQmtFSks2?=
 =?utf-8?B?ajJ2ODMzeDhMMEVvdFdhYU41UFFHMHIweTJOTm5uOGVHUFpJeFNuc1JyQjhu?=
 =?utf-8?B?QXFvNW1jT3J2MlRSTWZjbkR0b0VaWUFVNmxJRjNsc0FQa1RVUkx5VTFSMkth?=
 =?utf-8?B?WUxjRC9pWXJhd3U4TlFOcEEzS2FzVjkxUk1HWFlPUG9zMDNIQ2pmQUJpMnNh?=
 =?utf-8?B?SDQ4TDNyNTlpdlU0VHI2QjJnVXBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 12:50:02.2095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 044a32a6-f7a5-4527-4e69-08de536b6f06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245



On 13/01/2026 17:23, Harry Ramsey wrote:
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
> attributes can now be updated by `xen_mpumap_update_entry`.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v3:
> - Refactor MPU_ATTR_* defines
> v2:
> - Refactor `is_mm_attr_match` to return logical values regarding the
>   attribute mismatch.
> - Improve code documentation.
> ---
>  xen/arch/arm/include/asm/setup.h |   2 +
>  xen/arch/arm/mpu/mm.c            | 119 +++++++++++++++++++++++--------
>  2 files changed, 93 insertions(+), 28 deletions(-)
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
> index 14a988ea0c..5633c1c4c5 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -15,6 +15,9 @@
>  #include <asm/setup.h>
>  #include <asm/sysregs.h>
> 
> +#define MPU_ATTR_XN_RO_MISMATCH     -1
> +#define MPU_ATTR_AI_MISMATCH        -2
> +
>  struct page_info *frame_table;
> 
>  /* Maximum number of supported MPU memory regions by the EL2 MPU. */
> @@ -171,33 +174,16 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
> 
> -static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +static int is_mm_attr_match(pr_t *region, unsigned int attributes)
>  {
> -    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> -        return false;
> -    }
> -
> -    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> -        return false;
> -    }
> +    if ( (region->prbar.reg.xn != PAGE_XN_MASK(attributes)) ||
> +         (region->prbar.reg.ro != PAGE_RO_MASK(attributes)) )
> +        return MPU_ATTR_XN_RO_MISMATCH;
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
> @@ -358,12 +344,44 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
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
Because this message is the same as the one a bit lower I would suggest to do
s/memory/AI/ here...

>              return -EINVAL;
>          }
> 
> +        /*
> +         * Attributes RO and XN can be changed only by the full region.
> +         * Attributes that match can continue and just increment refcount.
> +         */
> +        if ( MPU_ATTR_XN_RO_MISMATCH == attr_match )
> +        {
> +            if ( rc == MPUMAP_REGION_INCLUSIVE )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify partial region attributes\n");
> +                return -EINVAL;
> +            }
> +
> +            if ( xen_mpumap[idx].refcount != 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify memory attributes for a region mapped multiple times\n");
and s/memory/RO,XN/ here.

> +                return -EINVAL;
> +            }
> +
> +            /* Set new attributes */
> +            xen_mpumap[idx].prbar.reg.ro = PAGE_RO_MASK(flags);
> +            xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
> +
> +            write_protection_region(&xen_mpumap[idx], idx);
> +            return 0;
> +        }
> +
>          /* Check for overflow of refcount before incrementing.  */
>          if ( xen_mpumap[idx].refcount == 0xFF )
>          {
> @@ -514,8 +532,7 @@ void __init setup_mm_helper(void)
> 
>  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>  {
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> +    return xen_mpumap_update(s, e, nf);
>  }
> 
>  void dump_hyp_walk(vaddr_t addr)
> @@ -526,7 +543,53 @@ void dump_hyp_walk(vaddr_t addr)
>  /* Release all __init and __initdata ranges to be reused */
>  void free_init_memory(void)
>  {
> -    BUG_ON("unimplemented");
> +    unsigned long inittext_end = (unsigned long)__init_data_begin;
> +    unsigned long len = __init_end - __init_begin;
> +    uint8_t idx;
> +    int rc;
> +
> +    /* Modify inittext region to be read/write instead of read/execute. */
> +    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
> +                             PAGE_HYPERVISOR_RW);
> +    if ( rc )
> +        panic("Unable to map RW the init text section (rc = %d)\n", rc);
> +
> +    /*
> +     * From now on, init will not be used for execution anymore,
> +     * so nuke the instruction cache to remove entries related to init.
> +     */
> +    invalidate_icache_local();
> +
> +    /*
> +     * The initdata region already has read/write attributes so it can just be
> +     * zeroed out.
> +     */
> +    memset(__init_begin, 0, len);
> +
> +    rc = destroy_xen_mappings((unsigned long)__init_begin, inittext_end);
> +    if ( rc )
> +        panic("Unable to remove init text section (rc = %d)\n", rc);
> +
> +    /*
> +     * The initdata and bss sections are mapped using a single MPU region, so
> +     * modify the start of this region to remove the initdata section.
> +     */
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
> +                                (unsigned long)__init_data_begin,
> +                                (unsigned long)__bss_end,
NIT: I'm thinking if it would not make sense to add some sanity checks in the
future to make sure the layout is as expected. For example, what if a new
section appeared between __init_end and __bss_start in the future?

For this patch with the printk adjustments:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


