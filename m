Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4A9954CD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813367.1226280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDMD-0005PG-0a; Tue, 08 Oct 2024 16:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813367.1226280; Tue, 08 Oct 2024 16:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDMC-0005NX-U8; Tue, 08 Oct 2024 16:46:44 +0000
Received: by outflank-mailman (input) for mailman id 813367;
 Tue, 08 Oct 2024 16:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDMB-0005NR-Gl
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:46:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4cc9323-8594-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:46:42 +0200 (CEST)
Received: from CH2PR07CA0036.namprd07.prod.outlook.com (2603:10b6:610:20::49)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Tue, 8 Oct
 2024 16:46:37 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::f7) by CH2PR07CA0036.outlook.office365.com
 (2603:10b6:610:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:46:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:46:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:46:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:46:36 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:46:35 -0500
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
X-Inumbo-ID: e4cc9323-8594-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgMbhfFPqV4htO4diNte3ToxVgU5Jl9BbGhoHRXz7zlfA54GsnTurrq2TZN8tBuNHBF/fzhUdoADzHqhN9OLO8Tynufry3trLoV1ikqALaQOQ/RkpHdP2sa0YaBtGcebYh6uNhxUd7XkxzW7ZnewoT/0UaKgyYieeAIvFISJujnUw8Ik5RGEKHxKCxeuUQBeTkcKS4Mh/wW8I/LvjQHhCJO9L+EEE9U41AZ6BBFOcU0DcEKKKYHLoygTSy8lWx8JGkTHyzhB8+gjOaRXWFDHHQQUFifN3lDNrBKIHgjq72DzmTtJUyHATDe4RjtUx0RZEOHuwIIwqqEKEjvxhyLTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ggs4u9f4wToqGfelIm34kwcDn/0okzUSJlpz+rflH78=;
 b=ygAI11rAK1mzdfJa5vYFDqbTkXN+kwh6D2ZCaKVJr3WnZKl4DNf/Och9NzPLIleybxhDMxaD8PZIwHQNlj5YYy/g5jgOpdyzklJQt931LxiNlxupAU+oDBhBcP/FV9tRIBTpllVg+SAJlOqy0yBm+BruXddw6Oejgv3gnRIkvWakrFQCDVcZq7fHwj5aDIT70pmQuNn+bAUSEtfiNzbaE6paf76VFSKneDL1Pj2vv1rBrwyZB66cwaMa1HRPNCHa+6p2N8Lo2HP7TTVcd78gBjNBNq5S4T4r4zXfYqAGRddPA3upzseYmX+yGZtW6UuBUHF2IEU4zgb6GwJIDYZ+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ggs4u9f4wToqGfelIm34kwcDn/0okzUSJlpz+rflH78=;
 b=a6ehVNn1byXqkHE0BFX2T9yjV6RdoD+Wj8jQVNPQHi7G9k7dxpZN/p0eBSw0vsBjalAsC8Z/5iiTIfwpDqluphxxhIHGLQwcB5UCEhoK4NJ/XODvtylgANpIay1LGUT7kPw1cCZqDuoBYWHGYPE9CTzVMxjKTx3DCUEGTTUED+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <06618ae2-a7fd-484e-b1d5-87c5065df21c@amd.com>
Date: Tue, 8 Oct 2024 12:46:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/44] x86/boot: remove module_map usage by ramdisk
 loading
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-25-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-25-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 669c3703-66f3-4592-ec5b-08dce7b8c68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RExnQlhJbCt5VnhEeGVBVEltUklyYjVMaGZua1FJazBIakN0blJYSmRjbUR0?=
 =?utf-8?B?NnpLZ1R5QkJmZENGcjlkRW9NeUNPTXlGeFF2Z0thTzk0TWlVeTRYRFRxT2sy?=
 =?utf-8?B?SUpUQUJCcjB6V0hVa2tGeC9CeHFhL1ltcjdGWng0QlRYWnhiU2hnTmQyWXJO?=
 =?utf-8?B?RUYwZlFOTnlVUy9SdmhkMjJUK2VHYXV3WE5aT0Z4ZzhHcEZiVWRwTDdHcTlQ?=
 =?utf-8?B?OTM3dFJJcWJYN0ZWc3lBTGxZaTFLNHg3VzNXcEFGbHdSSElXNlVXVXBITEFl?=
 =?utf-8?B?cnRqN1Ezci9PUVZ1aEl0bHFxZUs3R2tZN05rc0JUNjVLbmxIRlNYVm9HUEFw?=
 =?utf-8?B?UGZRVXJCdGtLYWJxODF0elFyMnNlVVczVFdHN0VYVklZN3NIQjVKcXNBWVFF?=
 =?utf-8?B?eUZXb2UrNTdGM0VoZm81NUFWWFRLenFRM1BCNnZHRC9WWFhqQ2dpb05vRU9Z?=
 =?utf-8?B?d0VQRXd4RGVzN1VkVEhEa2phNi9uYkNJWVU4WUZ0bGRMaTdkWG5uWFZDUE5C?=
 =?utf-8?B?THBTNjEreXlkV3paYjEzRm5qcGRyTlpOU05STEhqWUI4dTFuQ3lQSkxTTTBm?=
 =?utf-8?B?bmhJVzFmNlJONFl6Tlo3YVBLcmUvN0djNUE2UG1PQXlDb3FqR0FRYVJKNUhQ?=
 =?utf-8?B?VU5YRUlTUjNyZjJBUmQvUXI4c1cyYmRQY3hTSG9SaDNsdmp6U0Y2cnQxRnB2?=
 =?utf-8?B?WGc3ZzFjREhMK3N6T2dCYmJZeGM3ZFJ6SjloUEZ3WXc0V2Z0dGliZFhuaEZY?=
 =?utf-8?B?OWl2engyazJjSW9odlRXNWc5SUppY0g0ejV4WlBkR0JVYWdoajFEUEJvR3hw?=
 =?utf-8?B?QS9waFpoemlFeDRJOG1kV1pLc2Z2ci9CYjU2R1VRRzlqSm5Nd0xoeUkvMHZV?=
 =?utf-8?B?aVFxcXFyMVNUNXpoWkJEalRpUUlkczRqYVNEZmJ5WVdBdUZ0WitQZkI4dE1w?=
 =?utf-8?B?V2E1Sm00Mk5Ub0Vkem10QjJuWjhRYUE3WjdLMmI2YXRhOE1GMGpWdHZsUEIw?=
 =?utf-8?B?WnpiTU90Z1pUN3pqSzR6dzFUQTF4WHNPWFhiSjlZLzlpcHduS2lUWW14UFk1?=
 =?utf-8?B?cEdhRlkyTVVhTHVHZzBwTWdnMmF6YTFnQU5hWERScVVTUEMvWkUycTBPWERF?=
 =?utf-8?B?VDhFemFpcnFqRWsya0NLc2ltMHg5MzRMUWxxRVVGR1Bab0Q0Sm5tUlllbWZ0?=
 =?utf-8?B?MVV1UTk0cjhHRERXNnRmeHFVTUdNSXZGWElYbXRGOGYwZmZXUlRod3htNDVY?=
 =?utf-8?B?YnM3TzNWM0Y5dVhQMmcvMUFwYUovQUk0dUFBaHdzWWlEdU4wQjcvSlFIYkh0?=
 =?utf-8?B?bjNEdGwzOVVnUnc4MjRrSGZJcXBRV01WYzcvdEh4YXNYQ1ZxamFpU0FSTE9W?=
 =?utf-8?B?d1MxOVRoLy95L1ViTjE5b24yMVRYRHZTRTlSaktTY2sycGFXTWVNR3VlWlo4?=
 =?utf-8?B?SFQvemRPTitmYVg1bjRwL0RBaFhNcERNVTl5UGdERTBkWVY2WjJJeS9OVVNV?=
 =?utf-8?B?NWllS1hNdEtFWUtMWE9XV1dtM004Uk5STmlQODB5OVJMREdTR0JVWkpSZlpH?=
 =?utf-8?B?VFBCbGxkSkFQTjdrRjMraE5CeGtRRVlXRnJKamd4ZFQ4TzcrSENCcWIxS3Bv?=
 =?utf-8?B?Y1doclYydDh2dTVDazBHRGtPVW9FY0ZSaTZIL0dscnlCSWhvQ1RrelFUanRt?=
 =?utf-8?B?cWk3QUt5aFR4L3l3SVF6RHBrV1pUREZFU2lIV2I5RlpOR0RJblEyWWpIMFh1?=
 =?utf-8?B?SHM3ZVQybXVKM2xQYldobmNUL0FTSkkrSEhkY05ablNQSG1EcHRkWFFKTzc2?=
 =?utf-8?B?QUx1RlAwN1kvVUxvcG50RzhvVU1UWFpXRys5MjN3NWpndXE4ZzBGWkc5NFN5?=
 =?utf-8?Q?BBMjleUtGmk2c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:46:36.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 669c3703-66f3-4592-ec5b-08dce7b8c68b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The ramdisk loading is the last user of module_map, remove
> its usage and any remaining remnants of module_map.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index b0946216ea3f..0d2ee19998aa 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1037,7 +1037,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       struct boot_info *bi;
>       multiboot_info_t *mbi;
>       module_t *mod;
> -    unsigned long nr_pages, raw_max_page, module_map[1];
> +    unsigned long nr_pages, raw_max_page;
>       int i, j, e820_warn = 0, bytes = 0;
>       unsigned long eb_start, eb_end;
>       bool acpi_boot_table_init_done = false, relocated = false;
> @@ -1187,15 +1187,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>           panic("dom0 kernel not specified. Check bootloader configuration\n");
>   
>       /* Check that we don't have a silly number of modules. */
> -    if ( bi->nr_modules > sizeof(module_map) * 8 )
> +    if ( bi->nr_modules > MAX_NR_BOOTMODS + 1 )

Don't you want to check MAX_NR_BOOTMODS, to keep the last module for Xen 
itself?

Regards,
Jason

>       {
> -        bi->nr_modules = sizeof(module_map) * 8;
> -        printk("Excessive boot modules - using the first %u only\n",
> +        bi->nr_modules = MAX_NR_BOOTMODS + 1;
> +        printk("Excessive multiboot modules - using the first %u only\n",
>                  bi->nr_modules);
>       }
>   
> -    bitmap_fill(module_map, bi->nr_modules);
> -    __clear_bit(0, module_map); /* Dom0 kernel is always first */
> +    /* Dom0 kernel is always first */
>       bi->mods[0].type = BOOTMOD_KERNEL;
>       bi->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>   

