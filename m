Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD454995816
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813486.1226443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGS4-00029l-Av; Tue, 08 Oct 2024 20:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813486.1226443; Tue, 08 Oct 2024 20:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGS4-00028I-7s; Tue, 08 Oct 2024 20:05:00 +0000
Received: by outflank-mailman (input) for mailman id 813486;
 Tue, 08 Oct 2024 20:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGS2-00028A-NO
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:04:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 953a5014-85b0-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 22:04:54 +0200 (CEST)
Received: from CH0PR03CA0074.namprd03.prod.outlook.com (2603:10b6:610:cc::19)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 20:04:50 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::6c) by CH0PR03CA0074.outlook.office365.com
 (2603:10b6:610:cc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 20:04:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:04:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:04:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:04:49 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:04:48 -0500
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
X-Inumbo-ID: 953a5014-85b0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkzy1NxOaHKPrKbsp+c1k6QXyYG7gH3djtbvZck2wfm2y+7gs4a7xEIjUK+Tnx7SReVF59EWAsIRvF1evA5d3dQL9wKs4fgPp82UYueezE38u6hjc1LCxovMFBRhOL+K4hGjQ92mhZItXag8XipNKrky+iACzVqesbhbNXm/OYD7ek8u094fqQiYNSYl+/5iyfbKNzyE8kf09g843cRxdrrkuTSZTsK8IwMKPBMuaNcdBJhzKgPfY1FFrybrhITCK3BhzuYP8iJe1+1NVOtRt8se2+dKl8jMh5pwWxKkA7itRMXDu34HJPQg6flfzeSB4ExefgHfsF5Iwn7bCYylUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/zwxJmTDvd+Sb0ZsZpXiiC6o797eVDbhEu5vYueHsU=;
 b=ccl67xwwlV3/tK+dYY3fzbhzSLTOnWqoCqqTywZneKpVaRHKmRqT8bOlTetYJCX21zFEyhKp0omoluxyebDTzGtSudxCvArfmxrRjkJ4LsziGmZ8ii3Rti773zHbdjrP3/WhCNB20HymWVKgJzonKUMXvtBXqisola6vGGMcm+f/fx7hOXqBIa3dhaXqXDhQxd3l71i12cp/sSdSQ0wqn0Zgcw9mu5/L/qE7Y7ir32L3wInAFcE8WEONMPIv+fAWqEmUdlcFLJ63yTmWODUUP8oKh4xAHREXsxld0OMmYszok60I8ZnZxelMK0ofxL4JhY9cJRHH3HsujmWL7m5oAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/zwxJmTDvd+Sb0ZsZpXiiC6o797eVDbhEu5vYueHsU=;
 b=jkAfD2NQ0Ti5jWs+E3HB3LyZ0NFQVapJItdCDx9HKWvlRVQc9pbpbmqJi2e1MIb2f7Qi1BSZSZA4iX552eeH5pqtGj7vOcWd2ZCGdOn3BnrCfS2i9YveDYN3xHuZhHQKbvndkwvcRQFW6k/+DxoxcAy/IbHzDDu/iDpIhlUGIlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bdec9cdf-08f8-4fbd-a626-703f58fa0938@amd.com>
Date: Tue, 8 Oct 2024 15:04:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 34/44] x86/boot: drop the use of initial_images unit
 global
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-35-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-35-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: f5730df8-8c5d-4e1d-626a-08dce7d47774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWFHdlBUQ0FNakFsZ3JEaHhneXI0Ym5Hd2IzQkIxdWJOaWUvc0NQWllVdEdD?=
 =?utf-8?B?U0VHK0ZvUkd5RkkrSVE4d2Y5c24xMjZlbjhzN1l5TEZuN0NEeWhQR2E0dW5V?=
 =?utf-8?B?Q2ZrZzRwQ1pjUnJvYXdLTE5xZDlDbUFldHpzajBzRGw2clkwalB0NngzUHNG?=
 =?utf-8?B?R0k3KzFBcXNva2ZiSmlJZUVNOE1oOXREK0JsUFRweUE4eDBwemlPdVQ4T1JG?=
 =?utf-8?B?SzhTcjR6VlN0amltd2FvWWR4MFlvUXB2Y2hydHVGYjJaR3VaVU9qZW44MlFB?=
 =?utf-8?B?OUhkQzYwdVFvbnRaNmlwQTJFNWRPVnFhZkZEVEJCaGhmYmpDZkJkSFhOVW1G?=
 =?utf-8?B?czNSbGdTYW5BTHhwT3FtNFVFQnUxeXRSYmp4Y3hNUXJoZ2pXYmhJTzM1ejVS?=
 =?utf-8?B?NGJTSjU3bXlEbVcrSU54cWs5K20rUWJsZkJMQnphd1lnOVZ6UDVaZHl3QUlh?=
 =?utf-8?B?MHYzcWZwa1hmc1JCc3l2V0JYZUtQSnE5RGpCM0NGK0Y5dHVRc1YyNUprdXZB?=
 =?utf-8?B?Z3VuUGt4cEZSNTNBcUtVdjViWHJaL1EvemNHbHFuNDdBZWtCemlpNG5VRHkr?=
 =?utf-8?B?UXkwWkJkdFduUFUvNTBOR3hhZUd0ZGVTTEhtUmhSM1o1UUh3aUJrWFRXMzRs?=
 =?utf-8?B?YmYwb0dackF0STZxM1U2UlVpVXRjcTBLL0VuZ0hPdkphTDdWYXJJVFFQMk5s?=
 =?utf-8?B?bGEvU1RYMXoxTlpGbXhscExhVW5TOEdUTWlSR1V3dEdmd2VhRm1UL2VLMjRC?=
 =?utf-8?B?SXFKU28zTkI3ek93Z3dudEc3dzdKQ1ZTTUROZG1OVXNja0NSbWJSUDgvWUxB?=
 =?utf-8?B?RWlGZjE2SHZhRDAwb0NPdG0yY3U0Qmd0TEl6NjdZajhZbFZiS3FCQkVLTlM3?=
 =?utf-8?B?OVZFcHpqWFo3NmozZ2VEU0RVUk5aVWpwRE01ZzdQMy9xUnhPOXlWU2Z1QkFl?=
 =?utf-8?B?V09ueFZSTDJSVm0wZHJVdnZoekh0d2pUUzZTUDhHak9FdEhtcXpaR2hyRHFq?=
 =?utf-8?B?dzEwV1FUVlMvbjdxM0sxb0oycEZKOEJURmZIQ1pmVFNpNmlKWjZZclZRVVl3?=
 =?utf-8?B?clVZREo3NGVIT3hDWktqS2s2eUo4WXZZZ1k3eGpMZzIzajhDc1J1NHdnajFi?=
 =?utf-8?B?azBSaytrVmZTWVFGRHRKaDRuNUFzaWMvUjZhWHhIejlmWUtSTmMwYk85Q0Nx?=
 =?utf-8?B?OEVyZ1hOTWM3SWxHeW1xUkRvZ0RkTU9JTjlOSE9QeEo2RXNPVXhzUFFuaFhW?=
 =?utf-8?B?QVlYbk1hYkF5cjNrK1FVSy8rdEVieXJuNTNBNFZieE9yTm1MbFBhajhEeWdh?=
 =?utf-8?B?WGhmMEZtU0N5S0RROGpRUXlSYVEra2FWK1VvYitUQWdmVFIvNjNOQS94Tm9F?=
 =?utf-8?B?dnhGbmtoczZtaWpEeW5wWENDamdhZ1MvYVp4Wlc5MlFpRWVOa3R2TzRTU2J3?=
 =?utf-8?B?Vml0Tm51MEhoM1BaZlU5YVEzdDI3Nm9oN3dHK282d0ppMWliTU8yUm9Ucmdv?=
 =?utf-8?B?ZzEwUmZnU0xvTWx3RDFybjlndmU5VXNwUGxvbGY0MUE0TFo0MXFkWlJVbmJQ?=
 =?utf-8?B?NmVDaUptMWNYYWxaeGJJem9zbzMrYm9RQTJZejVpRENlNjFFSzN6ME9YTUNa?=
 =?utf-8?B?OGJranVWb0dRa0hqWjYydko2YWxDSUh6dEVMa3dGeDhTVzEyVVNONkNsMmRF?=
 =?utf-8?B?bDJxVEpmMXFLVVRPdWFsN3M1RmJXMk93OFd1TGF4cThRNXhyZ3Q0NUp0U2s3?=
 =?utf-8?B?ZWhSWUQvb3dVSEliM3BWai9CQnVndXdxMWlsK05wQ1V2dldoajUwVGlPN1dC?=
 =?utf-8?B?OEdOVDZZeEJTWXJFQjNWMlRFSkh1Smc0Zmpyazgxc3EvVk1ScURLNk5FTnQ0?=
 =?utf-8?Q?MmxwTTRWgdFkh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:04:50.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5730df8-8c5d-4e1d-626a-08dce7d47774
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 30a139074833..b3b6e6f38622 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
>   
>   static const char *cmdline_cook(const char *p, const char *loader_name);
>   
> -static const struct boot_module *__initdata initial_images;
> -
>   struct boot_info __initdata xen_boot_info;
>   
>   static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
> @@ -336,9 +334,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>   
>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>       {
> -        unsigned long start = initial_images[i].mod->mod_start;
> +        unsigned long start = bi->mods[i].mod->mod_start;
>           unsigned long end = start +
> -                            PFN_UP(initial_images[i].mod->mod_end);
> +                            PFN_UP(bi->mods[i].mod->mod_end);

Fits on a single line.

>   
>           if ( end > node_start && node_end > start )
>               nr += min(node_end, end) - max(node_start, start);
> @@ -355,15 +353,14 @@ void __init discard_initial_images(void)
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
>           uint64_t start =
> -            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
> +            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;

Fits on one line.  Can also be pfn_to_paddr(), which applies to earlier 
patches.  Having said that, maybe it's okay to skip pfn_to_paddr as at 
the end of the series mods[i].start is used without a shift.  i.e. fewer 
transformations in these "mechanical" changes make review easier. 
Unless someone else wants pfn_to_addr(), I am okay without that conversion.

>   
>           init_domheap_pages(start,
>                              start +
> -                           PAGE_ALIGN(initial_images[i].mod->mod_end));
> +                           PAGE_ALIGN(bi->mods[i].mod->mod_end));

One line.

>       }
>   
>       bi->nr_modules = 0;
> -    initial_images = NULL;
>   }
>   
>   static void __init init_idle_domain(void)

With the line fixups:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

