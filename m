Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C4A69B0F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 22:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921181.1325148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv1AL-0007HL-FE; Wed, 19 Mar 2025 21:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921181.1325148; Wed, 19 Mar 2025 21:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv1AL-0007FJ-C4; Wed, 19 Mar 2025 21:41:33 +0000
Received: by outflank-mailman (input) for mailman id 921181;
 Wed, 19 Mar 2025 21:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lUq=WG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tv1AK-0007FD-EJ
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 21:41:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2418::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eab6066d-050a-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 22:41:30 +0100 (CET)
Received: from MN2PR20CA0014.namprd20.prod.outlook.com (2603:10b6:208:e8::27)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 21:41:27 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::2c) by MN2PR20CA0014.outlook.office365.com
 (2603:10b6:208:e8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 19 Mar 2025 21:41:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 19 Mar 2025 21:41:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 16:41:26 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Mar 2025 16:41:26 -0500
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
X-Inumbo-ID: eab6066d-050a-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcMVDAWgsLmTjs/8OqKX4lqXdQmhLUl785SgQqNYjHImeWNeuvrCEXMA3H+gbeZar0mJoAQaWdKU2ZvvgJ5sN6k8kcUBrT4df1HlI7Bbj6JiFWxY4zJK6+mJwnKlzKI3tAp3s4ucxSdeW/fLbeWiP0q6jlVxO6DdqSb+P89dZXtO/1GnxAq47zhZqsOl8S+fQbtJIBG53NL6IWgtk/61PBuejeVZfaeWeCVU1PRgbsjlZRDQ6lYksQAVZXWI8MwuO9qs7GOqnk/MjQudS4QfzyRD1UGexy5dq2eLSauF7fM15HvqmOo22R2rl5IxD9ARTAmPq307Uw3uiLBUHPuNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUHmAtpELtLd8qSdLVwGxkUYu+FMJDUKVdU+jA1yMqE=;
 b=g4dRV0hlS8DW3bO/FPH3KloViR/sjjFmQo2pP/d/NeTo9U6BlVJXwPhZfQEdHTwCt4twcGw6VO3vtwpTZHKGmzBFL2FaNRxbzo5jioaw7020AfuiopVh95NCe2nTvsWx5KrmAxj4EQ5jW/q2HEbIFMqmGyOAfmUfoWcrC6bq3YQp34owW64+18zq2zMGyhn2KzkB6Uf7XLel9/vbpkaQCZ4qca1/WO9ReH/metw4nTAE4emJDh43y3DHhYLcpjLE2O0iOi3bQCYC/O/I8umaC0JQjI2LdYQx6K2xIfIh49CULnfPRqIwvKy/FrDzSRQR6c2mKdGFoZJH/OPO2f/UjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUHmAtpELtLd8qSdLVwGxkUYu+FMJDUKVdU+jA1yMqE=;
 b=yq8ZVqNgF+iWkfULEXIJkXR67iV9+ZfK6q1ohD5jKHLFHcvktHMukYERrcokW6FSY8jLaKSID+YAXYP+LEf31psz6pGx2uOT//JQyRuGzPEhgucyy0DRGf/yxyOq9BXMbYcImqLwl8GpSsN1rieahjBolHQ0R2efS/yy6ul2F/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c56988e5-bfaa-4b2b-8182-8e0f42963448@amd.com>
Date: Wed, 19 Mar 2025 17:41:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Simplify the expression for extra allocation
 space
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250319171346.19478-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250319171346.19478-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba509e5-2d3a-4c13-098b-08dd672ecd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzEydDR0Y3FtYzlhcEwya1NnamhzaDJQNStyMEYvYkhwa3EwV3lnTTNuZjBk?=
 =?utf-8?B?YWxuUm40UGZGK00xV01WK0RMOWdzUWFmQi8xVnlCSy9jc0w2K2x1QnF4dy9I?=
 =?utf-8?B?Skl3c0c5eUFmbmtkQmtLL3B2MjJTVzNzczBuYjFJUUVBbUtlZENITEdHanFQ?=
 =?utf-8?B?b0xFQjNlUDVqbU1EaFpiczRKTHE5VEhRSFR4QkcyWUdrNkZaSWY0QkRKTHZ2?=
 =?utf-8?B?VUhNSEt1c1RZVHU1VnNHb2hjVkgyRXdnQXJrRDR2SDF2M2V6bmVpMDJBWnBB?=
 =?utf-8?B?RnRDYlkyaHhTeGVaNVMrVFdUUHdPK3FGSCttQmViZWZSZDcwZ3FBcmRwSnhy?=
 =?utf-8?B?dTdNRmJLM1dNYWNqeFN5K3RWeGNXUU9FcGpCa25lY0RCTHZ1MEY4SmNndDhp?=
 =?utf-8?B?VnlRKzU4U1pnOURJMmlKZlhaQnRkNGlUcmN4K2pCVVhFVUVqRjUwendOZmcx?=
 =?utf-8?B?RnN2TTh1dkYrckNFdTdnYXdqZkd6emd6UG9NL3FzVVo2SUdNc0VvWmJUM25W?=
 =?utf-8?B?dEdoOGRXSjM2U2k1Qm10Y2daSjdCWHpnOHBLZlZyWmVIRW4zVkVlRnBtc2FP?=
 =?utf-8?B?ay8zdlpYUzhZRG9UYlBVWU5IVlZDRTBzOEh5WFZQRm9KWXlEa1J1T1J4VEVN?=
 =?utf-8?B?QnBpck84SURTZUovOXhvWEVHSHBCL3U1a3pmY1Nyd2FBWGw2TWpuWnBEUXZo?=
 =?utf-8?B?QnBwQ2FvbnlzNE0yOElMZUxBd24yRHMwTUUyWkNrS2FzTHo5dU1Xbk1XRkky?=
 =?utf-8?B?WWk1Vm5KTzlzSFNoTk11OGNNeGlWc1JrNmtMTFhKM2EvM0hmU3hlb1M0a2s1?=
 =?utf-8?B?Znlnc2o5V1o1SVhGNFg3QW1rb1BVZ21QUkIyVkpvZnpGVmJpQjNyV29Lb0xi?=
 =?utf-8?B?VUlIMFQxM20zbmFoVGdBVnIzM0kxendVbjJCOFd4eTd4bW5xVi9kcUFaWURx?=
 =?utf-8?B?ckdpd3Z5OEFqY2ZCQ1REN0hCWjdYdDl4MW0zaG1vRDRyRnl1NHRLbElKd2Nn?=
 =?utf-8?B?a1dpRHQ3Z0djMWdsMnNqejJXaE1ZU0VCZDQzNENEeVJwdDdNMDBBekFnVWJL?=
 =?utf-8?B?ZW9HUmFrbFZZQUtES2JudVNwaFd5aWU2cU5xMnhNL2NBV0lDWlgwSFBBaWxn?=
 =?utf-8?B?NlVkQ2tyM3gyalhMS0hjZnhXUmlGQ1BCbFpwa2VyY1FXblJRT2xDRnZIU3Rh?=
 =?utf-8?B?R3J0eDM5Yy91d1FCS1ZsYUdMMjFDM0Iybml2alRnd3lBRGtSbXpIRjUvNzB3?=
 =?utf-8?B?Mit4S0FMWWV6ZGhZcWZMbG9za1BBSk8zUy81YnRQUU0zdTVaU3UyYzFxQ2Yr?=
 =?utf-8?B?V0tCR1JzUmtZK0QrYURRcVNDZGp0Q0kwdGNlRVdaV1N3ZWttNTFtdXdMNmw1?=
 =?utf-8?B?bzFLSUJ3bEllZ0F4NFV4aDV3WFd2djVrVGVGSFJkM1NnMWh5ZDl5RFVINFhh?=
 =?utf-8?B?NWpHVTZZL0Jldk1FN1pRUnlsNE5ETkgrNE9xc3NjWE5UUzV0eGhsbXdwS1d5?=
 =?utf-8?B?MFp2WFJob0NmRGhTUHArc2dtM3NiZ1hPMkhWcFYydzVwOHNJeW42TjVOV2ZB?=
 =?utf-8?B?WnJFbWtjSmhCd2hpMUNPektVU0RpN0VqUmxNeGhXTWpzajgxSldLdWhpMXVS?=
 =?utf-8?B?disrb3RyS3ZKa3o0Uzk5VHhmcFlHSkZEc2UzVjlUMjlucHl1SE9xZlAySWl6?=
 =?utf-8?B?M1pWU2JmLzI1ZmpQMFNxOVJkbHBKVFZ0SmY5aWF1N0lwU3kxcEhNZnJqeG5L?=
 =?utf-8?B?Z3FYT0RyanVIZFJFWW8rOURSSkFLZ1lPeitxY0tKNHlvUlJ3KzBJRUtQQ0dP?=
 =?utf-8?B?L1orcVhzMC9wdVE1anAzVm1oU0ZsejVoeE1CNGFVam9HQnFGWDZncWlUT1Rm?=
 =?utf-8?B?NDBCaFBSTno4cXNNa2tJRFZqV2pvL1poa3ZsZk5PWXBwY0ZacVdzdXJjbWVT?=
 =?utf-8?B?OGZJMFk0L1MyelNuLzRTQXh1TzNkdXhCeFdQY1M2Q2xxSUkybWtkYm55dmFD?=
 =?utf-8?Q?sGTyp99YsgaCTvWWR6skexJJJhMyCM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 21:41:26.8601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba509e5-2d3a-4c13-098b-08dd672ecd6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

On 2025-03-19 13:13, Andrew Cooper wrote:
> The expression for one parameter of find_memory() is already complicated and
> about to become moreso.  Break it out into a new variable, and express it in
> an easier-to-follow way.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

One thought...

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/x86/hvm/dom0_build.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 6a4453103a9a..6591949984b8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
>       const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
>       struct elf_binary elf;
>       struct elf_dom_parms parms;
> +    size_t extra_space;
>       paddr_t last_addr;
>       struct hvm_start_info start_info = { 0 };
>       struct hvm_modlist_entry mod = { 0 };
> @@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
>        * split into smaller allocations, done as a single region in order to
>        * simplify it.
>        */
> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
> -                                      sizeof(mod)
> -                                    : 0) +
> -                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> -                                               elf_64bit(&elf) ? 8 : 4)
> -                                     : 0));
> +    extra_space = sizeof(start_info);
> +
> +    if ( initrd )
> +        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
> +
> +    if ( cmdline )
> +        extra_space += ROUNDUP(strlen(cmdline) + 1,
> +                               elf_64bit(&elf) ? 8 : 4);

These component values are re-calculated below.  With additional 
variables, they could be calculated once and used for find_memory() and 
later last_addr adjustments.

Regards,
Jason

> +
> +    last_addr = find_memory(d, &elf, extra_space);
>       if ( last_addr == INVALID_PADDR )
>       {
>           printk("Unable to find a memory region to load initrd and metadata\n");
> 
> base-commit: aa78a7d10c6c2ef877b34d119a6db934c201ddfd


