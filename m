Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0A99363E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812323.1225053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsUf-0005vb-JT; Mon, 07 Oct 2024 18:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812323.1225053; Mon, 07 Oct 2024 18:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsUf-0005sS-G3; Mon, 07 Oct 2024 18:30:05 +0000
Received: by outflank-mailman (input) for mailman id 812323;
 Mon, 07 Oct 2024 18:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxsUe-0005ae-0t
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:30:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2993ce68-84da-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 20:30:01 +0200 (CEST)
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 18:29:57 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::62) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 18:29:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:29:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:29:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:29:54 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 13:29:54 -0500
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
X-Inumbo-ID: 2993ce68-84da-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMQDkRpEQVEv30DThhyIDYib0H+Ylk4XC1GSbiK2dUCKNklwWNQcmpb23JCqvR5/s6Tj1N7OREKyD5iBGpiqnL8L+8u9+O7SmcDJlE2Oj79at0+sbC7wpWVhglnjw7mzJ90eFDtS/BeGZG/iI2JGFi9i4K9OVfggOBO6O+T/MXCVDF3OxBSprwy8/W+EQraG1G5f8U0LDj4rIv588yNGhA2JnV0gb23VUninDBkSgFY/WnQMV/W9AGO2JndqXSnqSmbi2JuE1pGQhMOhQMw6qRlLn/gKSeja9HE7XMQc35rUa+6kyBPAY7mzFWO2e8p0vwFmLSfIjc10jgkEpqRXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXdStPcKp5xULxtvO5K0TAiNQCsaBDp8leCzGh7ggoE=;
 b=X4L7uIJHoHB9neGPieXex6HqaWcF2qz7WxOPb3Vb+gJ5zZFdOWG06/nQ/qxrXss5Od0PsmELm7m7QSeM6lgTvPfPwL99GrO8ygfEVK+o/+snHwsq3UwoAvWbW+MWBveEfsO7eCe8uzVojmHOiCgT4bMH3iJGEeouuuA4gJvmMG+zeEorttUDc+vX9VRc8jx5EuvtY0kNCXhbfAboDuIR8Z+Ruen/3t81KXV7UIJNWgLXOAX2aa6iKaCdjWl+8Y/s3qB/d7k31LhH4hLwg2eXYUwL5O8qFQ+xcM+jkSea7VNr5OhQEEGXhjR4+fczfH1wv+hqW4+5rLYCcV8i30UH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXdStPcKp5xULxtvO5K0TAiNQCsaBDp8leCzGh7ggoE=;
 b=dpjXXMBMrnXicj6fq7HivHtK7Etm+lRaTbfcInWspTdM1I217H8iTiIJz0MqwCRsExIElIpOB6ZbUqG1YIpNreyA1ULu18oMDY5GgdMKds/+L5Bk+bPSQkl9QCnLc5kodMZNy57YE48YR7+oJLQ+4y/gIgg2P3olDBUcqyPTnBs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2fa284ee-907d-4899-aa78-82481cfbfc6a@amd.com>
Date: Mon, 7 Oct 2024 14:29:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/44] x86/boot: introduce struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-6-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: e21e5e8e-8e21-411e-4395-08dce6fe0b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXFKQ0JWSVdSZi8xUmpla3BxcldQbDBaNTNZelJrSlhuVGJqYnJMRUtJYW5v?=
 =?utf-8?B?K1QxUnM2MjdLY29HRGVZM1o0d3Q3UUZEY0N5elZ3VEJURUR4RjJzWVgzTW5V?=
 =?utf-8?B?eUx4KzVzYTVZdUxXWFpRdFIxUmFUQmFCakdGRWF5clVXSzNkTVYxbFd6WUt2?=
 =?utf-8?B?RUxrYzZMa0FtbkZIMkt4Z2tHbCsxK2ZqKzRvN2JpcGNVeGJIZ3l1TzF1TVYw?=
 =?utf-8?B?bEJGWnBlOUJoNkIzSzJ2R3BQc2ZqWDA2dXd5OEQ2OTFqNWhTOTBKTGIyL01B?=
 =?utf-8?B?UjhCZ01vVXVqRERQbGM1SG1aRk5aQnVPSFpNVUFtVVhQMUdtaVRQVnpmWkMz?=
 =?utf-8?B?RUNJZWszTldtT2s1cVpuY2tZcWZTSXNnZnBkeko2UEI3ZmdjcEYzSTRhSkJH?=
 =?utf-8?B?RFNmWHhITWpGQTJWM2cxTm9aalFYd2tnZlRnazd1ZUVJNUhRTjlnOTZoRTdw?=
 =?utf-8?B?L1NaL1FBMDd3UU9lR2VzOGZWUnBPLzlTb0dhWEtVMnJEbE9RNEVWWmc5MEdq?=
 =?utf-8?B?dFd1T2U2Q3FHdVNURU5sd2Z0czVtMDJZdFc4TmVOeXo5UkEzbFJpMkRwOUxQ?=
 =?utf-8?B?c2hJWGpXQmtQclp4ckxmeHpmZW9LSTBRL2lkTzlCNG05WG9MajVNUEI2L1BF?=
 =?utf-8?B?NFFWOGk3TTE3WGRMWk5vK09EelFYQjhsSFhjUGxGZzBkaGx3NWgzQ25HRHRV?=
 =?utf-8?B?NUtOSEVRRlBXWTlINkI3QXJUZll6aERpYlY3M1VhOVlEZ3BoYXYzVWs1VHRp?=
 =?utf-8?B?bS9Idms5NmZQRHBpTHZ2cXBiL1UzUlJuUVBlQTRkSjE1clJuR1NCc016TTBz?=
 =?utf-8?B?MmVoMU9aZmdrQVQ0eWFLQm5xbE9DODI0RDZyTWV2YkJvV3JYR2lWc2tkYitW?=
 =?utf-8?B?NzJ3NkdLWmVOYXZBQThNN1NNOE9BcWVmVGN3dWxWSG1OaVIwWFQyWWVpd0RH?=
 =?utf-8?B?cUt2SjBvalJBOTA5MjVEd3QrODVJQmIzbm9VQmtzbWpTTk43ZjdlclFmRDlQ?=
 =?utf-8?B?QjJUVlI1WW1oVGR3L005ZkpVN3ZoejVvTnQ1TjRVZ2tNVE5XZll1a0ZucjJS?=
 =?utf-8?B?SzJCeWl6MllQaDFpTkZwYzZXSVZ2K0xOdDMzbm53dmVJd1I3UlNVSUJCSG9s?=
 =?utf-8?B?QVRKeUZ5UHVreDhCWXdQS1FCSzJrSy9MZHJXU3dUcTNTalcwL1FUSkxJblV4?=
 =?utf-8?B?cmhZOEg3UWtuNmhjUDNmVW1tYktGZU9iUzA2Q1VWSHZUZTM1YnJZazFZMDRw?=
 =?utf-8?B?UHMxb0xCL0IxdXJ5dmlMN2JMV3dxRktZS0lGMTU3YWVJczEzQjJiWXlEWENI?=
 =?utf-8?B?eHZpT1pJQkdsMVFnNTZXejNZd2kxa1VQYXdzR2dHZ1FSOUZ6NDNuZGFQb3VK?=
 =?utf-8?B?OEpaNjZta0llUGxvTE1mbllJeTdoYXAvaDdpS2lKaTExa2svVzlGczZIRHVH?=
 =?utf-8?B?ZWdCdGc3VkRiZ3ZPUlZlK1JyNHpESElvK2FxUklCNjArS2xJMmFhOSsxVHla?=
 =?utf-8?B?OUhYTlJNNFA2eWJUMWlORnRGTUcxSHdxb2F0VjVycEFKMGhXQnpVc0ZQUUtK?=
 =?utf-8?B?VmUva2lrYVR4L3NodVhmd2hnbnJTc0JHSE5OSlNoNlBFbDhzSWExeSs3dUk0?=
 =?utf-8?B?bHRSUnJJSVhsc1pabXM4VHlwVUFVd2xEZENKY01LYmoydHJTYmNGaTdhb0tO?=
 =?utf-8?B?VnB1azM5WXlwelJ0eEk2S05EOVhRblRzNlQwaFFoc25NcnVkWXN6alpzYnA2?=
 =?utf-8?B?ZzkzVlBYWkRBQ1VoNk0wRW1aekRjK3E0eWJ2aEpKUjVvRnNLbmtWejZJbllE?=
 =?utf-8?B?b1FCZEZsU094SjlaeE5iMGFHM1B3cE1wd0RTZmZQczFmanRrV0dEc0VMM0NX?=
 =?utf-8?Q?VFAWaRPvp+0eI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:29:56.7191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21e5e8e-8e21-411e-4395-08dce6fe0b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This will introduce a new struct boot_module to provide a rich state
> representation around modules provided by the boot loader. Support is for 64
> boot modules, one held in reserve for Xen, and up to 63 can be provided by the
> boot loader. The array of struct boot_modules will be accessible via a
> reference held in struct boot_info.
> 
> A temporary `mod` parameter is included in struct boot_module to ease the
> transition from using Multiboot v1 structures over to struct boot_module. Once
> the transition is complete, the parameter will be dropped from the structure.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 14 ++++++++++++--
>   xen/arch/x86/setup.c                |  9 +++++++++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 87d311ac1399..d19473d8941e 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -8,20 +8,30 @@
>   #ifndef __XEN_X86_BOOTINFO_H__
>   #define __XEN_X86_BOOTINFO_H__
>   
> +#include <xen/multiboot.h>
>   #include <xen/types.h>
>   
> +/* Max number of boot modules a bootloader can provide in addition to Xen */
> +#define MAX_NR_BOOTMODS 63
> +
> +struct boot_module {
> +    /* Transitionary only */
> +    module_t *mod;
> +};
> +
>   /*
>    * Xen internal representation of information provided by the
>    * bootloader/environment, or derived from the information.
>    */
>   struct boot_info {
> -    unsigned int nr_modules;
> -

(You should probably re-work the other patches to insert ahead of this 
and avoid the movement.)

>       const char *loader;
>       const char *cmdline;
>   
>       paddr_t memmap_addr;
>       size_t memmap_length;
> +
> +    unsigned int nr_modules;
> +    struct boot_module mods[MAX_NR_BOOTMODS + 1];
>   };

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

