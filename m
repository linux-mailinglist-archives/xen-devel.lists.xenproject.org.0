Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CC9938BF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812472.1225234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuw8-0006EJ-FM; Mon, 07 Oct 2024 21:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812472.1225234; Mon, 07 Oct 2024 21:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuw8-0006C7-BH; Mon, 07 Oct 2024 21:06:36 +0000
Received: by outflank-mailman (input) for mailman id 812472;
 Mon, 07 Oct 2024 21:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxuw7-0006C1-EF
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:06:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e8430a-84f0-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 23:06:34 +0200 (CEST)
Received: from BL1PR13CA0182.namprd13.prod.outlook.com (2603:10b6:208:2be::7)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 21:06:29 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::8f) by BL1PR13CA0182.outlook.office365.com
 (2603:10b6:208:2be::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Mon, 7 Oct 2024 21:06:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 21:06:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 16:06:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 16:06:28 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 16:06:27 -0500
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
X-Inumbo-ID: 07e8430a-84f0-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4dU5kKLDEhQaq6NYdB1hqPGA4NcAt6XaqDXZeIXzg0+bSkJt5mTOj6xQYrOiQrBYBv9Ev2/bVsDIU3cl+Kvr5rEviDEIZbA+RPq9g4NJFrcVjXCjsiNybPZNaXrz654z4tediY6n45wzvNyznBEMeHKM6ZeyNmzEt4I7CFnz4NioSnkuTeBtW+A2zo6dKQqjXsH9ITzDrUOD/pgWjGJaOGQj0ziQ4RxJPfWIfS82YZWuliCWMyqrSOtg28GF98VBePmh9baebWiZ9isBs0JqVIa7i8iKS9f3XehrU01/udkPThzStOBu/vDb6Eg7gcNcd26hikAr+KltPmHaRl7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/jLrYv6sruhQhCvgUJhLINQZL/WmccbcXi5xSDIPKI=;
 b=GKrBLfHbpBCYZCauMdquTAmb84o0pHEu06JN6PqQ9r0BQcGFDNdpDY5FIMx7m61gCFAud5l9AwlUB2E0AYDfDM5uPCwdoKtwvt+rG1AtjyYyXSjbRrTTsQtDPvvf2wHePtr679PTn1vf8n1TS+CNwyE4dAhdez9GQisse74wmZoDcjfB9T2eF5aWz0JsOAQbElaXtqydvwRGN+CLFS33iJQfDFJa7QCY6L8xICna4IQNJ9H4JUzGBpP5ySv5wXmafMaiI5qys6uvz0/iMNAZ17ZYxMF8qg8V177EVKAo+peXuVflc0WAWGWoq4qa8t1UpKE4HmtdhsSNFWHKPF8gcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/jLrYv6sruhQhCvgUJhLINQZL/WmccbcXi5xSDIPKI=;
 b=IohJXxrS1gzPwzRYo4phR7w476+e1CvWX/vemQ9U+uByEQ2llmsBVrC635gdi7F3+Dh0bJwHSjFY5uAdIgXvPJ/yk7IoqfC2VS9MyyXmhS/iJziQqKzqbc+HUwCglA/vvsu7ZPlj+x2z6DZogBVGx7FpBIvvZ7RhhIKPISTPBTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2b939d07-23ed-4945-83a4-d615c32bf69c@amd.com>
Date: Mon, 7 Oct 2024 17:06:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/44] x86/boot: introduce consumed flag for struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-17-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-17-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SJ0PR12MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: e397b0ba-f8b4-4dbe-edda-08dce713e9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkRrRlR0cWFhQ052eWxwZXNEMGpDSWlzcnlYTU9TRGN0UDFjeS9tNFRIa0w2?=
 =?utf-8?B?My9LUDVnVkRQVEJONlRaTDhjcVNDZnNLWDJQdktRUlRqNG0vbnNWWlE3YUFV?=
 =?utf-8?B?Wm02akNtd1ZzOXBKWTNERU8xaGdaUTJSMDJ4WE44cWpSV1ludDhGWEE1MDQv?=
 =?utf-8?B?YkdFVityMTZzL2ovd2lxanJRSG5tc3huMXJSWDB4cjRMNmpwZE9XaEx0ajhM?=
 =?utf-8?B?WC9iK3ZwbFZQcDdQRkxuM0M0d3VPZzdYMEg3djVPU1Y4NnFwclpBdHBNSWZq?=
 =?utf-8?B?WFZOY2UvWWhMTiswNnYyaEFYcVNSSDVpVk1CZ3ppRHNpTzFDSTNwUHlxdEpN?=
 =?utf-8?B?bnhHRXhhQ09Zb1d2K2ZOeHdDL044cW1ic1JwdHRTWFdTbldSQUZMdHljVDZJ?=
 =?utf-8?B?bi9DcXR4QnFKd1RKdzc5QndLdWNkTXdkZEswRDRiOEx3bkFGSWJLd2dMUzl0?=
 =?utf-8?B?NE96UjIwQmhlQzlIeTBVYzVBZnBIWExpZ0NHMWdwa2J1aWdZclRFS0JZNFZO?=
 =?utf-8?B?alp5Mi9XR0VuNVRBRkZSMFNnbDY3U2dZWjk2YU15YmZHMnc4Z0JjTk42bDRx?=
 =?utf-8?B?RGFQQnk0M0tURTQ3dUNXOUY4ZkNpMmNiQWwraU9ndmFaQmFLWW96TkxacHMr?=
 =?utf-8?B?MG93YWI2ZVlNcnRDV3BXM2xpNm5MNTkzclhzdWZFQXh5QnUvbnRRRFNPUG12?=
 =?utf-8?B?K2c4UysvSUxTZVhPZXFhaWk1K0pvUkppcEhrWGNHTDdDK3N6emJ3cHFGRU1N?=
 =?utf-8?B?Uk1BczBxa3BRaXZ1YUlJaFEyMHpBUDh3WlAxOHlRekx0YkJ0QXkvYmFwRi9v?=
 =?utf-8?B?TTUwWi91cXM4RllxM0J0R0ZadFVZSTg1ZW1KNXUwWU9vZjlLbXhBWTBnVVFw?=
 =?utf-8?B?eTNqOWJCenJHclVPUkxmVEk3dzJDeDBiMmhVT1BkNDRKVnlnUmhVK1JUWExs?=
 =?utf-8?B?NFF4MlM0d240K3RsemgzUU4xZnpNQ2FzV2FWSGc0eXNHRWlNclh3WktUWFZi?=
 =?utf-8?B?TTFaWlI3dHJlQnhlNzJIMGNlMy9xYTBJbmQxeEFxL2tLY3VMdWVMdEhOVlN1?=
 =?utf-8?B?T3gwaFZoYUVxcHljdEJBWE1aS2U4MGJzVU5xcldkY0tnbnJiY2JwZGVJRmpm?=
 =?utf-8?B?NUQ2TXlwZkxjd0Q4S2tGQlhxcGM2UXR0ZmRCZFp2d2lGRkJ4aFMvckZ1WHRP?=
 =?utf-8?B?WnlQTFRULzlZQmV4Y2JWcFFPVllkUDVHYUEvNW1kbTR2ZHdKZWhlNmxnMmxk?=
 =?utf-8?B?QWNlc29vRHBwcDBPdEZCQ3ljenlnT1ZMWUlXMHE4SHFGczlCRWs4R3Jwbk1h?=
 =?utf-8?B?MjRXeHkvbW1JMFVNWXRFa1NCYlFIWEx2dkJSWW9vREFiS3M1dS9DUTdvaEg0?=
 =?utf-8?B?ZE9hU0lDalpzNHpCZ21nL3Z0M0NwT0YvZWo0VDc4cWs1ZlRlaWZCRFM0QTZO?=
 =?utf-8?B?K2ZHVm1LT1UvMTNOUWlHWHpIVjV2SFJqVGN5dFBQWlFubnBidUQ1RjdNcGRk?=
 =?utf-8?B?ZG53bUg5NGk0NEhmdis1ZHo4N0xXVElHOWI3QUxveXVZTWhscDU3R2V1VUd4?=
 =?utf-8?B?cHB3bzRjNXZIT2pRbFd1UTUycDRqb0UwVWkzejdsNG12SkRRYXhpbG5ZRHhn?=
 =?utf-8?B?cEsyMlhITmNpNGpVYUdsZ2F5NjBYZE41eFBoNWk0TjdVb21Rc2hWRUhuVVZa?=
 =?utf-8?B?aGNpaEtGVElWTS9MbE9OOXJIN2JrMFFaQ2NBQkZTQmFUQ3QzMlRsN0trNUFX?=
 =?utf-8?B?Y0d2Y3pzUkkzN2ZrQWJLWW5TWHA2NVpZYzJXd2VNM01IU09wMWZ6UTgzcTZ2?=
 =?utf-8?Q?xPy+XMxvXixsji3Fd1WxRlMog+Jh1JKmN0QME=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 21:06:29.2296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e397b0ba-f8b4-4dbe-edda-08dce713e9d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Allow the tracking of when a boot module has been consumed by a handler in the
> hypervisor independent of when it is claimed. The instances where the
> hypervisor does nothing beyond claiming, the dom0 kernel, dom0 ramdisk, and a
> placeholder for itself, are updated as being consumed at the time of being
> claimed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 1 +
>   xen/arch/x86/setup.c                | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index c79678840d31..7833b065eff1 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -34,6 +34,7 @@ struct boot_module {
>   
>       uint32_t flags;
>   #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
> +#define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
>   
>       paddr_t start;
>       size_t size;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4f540c461b26..235b4e41f653 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -318,6 +318,7 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>   
>       /* map the last mb module for xen entry */
>       bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
> +    bi->mods[bi->nr_modules].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>       bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
>   
>       return bi;
> @@ -1196,6 +1197,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       bitmap_fill(module_map, bi->nr_modules);
>       __clear_bit(0, module_map); /* Dom0 kernel is always first */
>       bi->mods[0].type = BOOTMOD_KERNEL;
> +    bi->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;

I think these first two can be straight assignments since they occur 
before relocation.

>       if ( pvh_boot )
>       {
> @@ -2085,6 +2087,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>       initrdidx = find_first_bit(module_map, bi->nr_modules);
>       bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> +    bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>       if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
>           printk(XENLOG_WARNING
>                  "Multiple initrd candidates, picking module #%u\n",

This one is after relocation, so |= is necessary.

Regards,
Jason

