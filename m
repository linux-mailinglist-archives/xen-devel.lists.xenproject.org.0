Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C030C9957E4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813477.1226433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGGz-0005oN-C5; Tue, 08 Oct 2024 19:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813477.1226433; Tue, 08 Oct 2024 19:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGGz-0005lx-85; Tue, 08 Oct 2024 19:53:33 +0000
Received: by outflank-mailman (input) for mailman id 813477;
 Tue, 08 Oct 2024 19:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGGx-0005lr-5w
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:53:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1fea98-85ae-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 21:53:28 +0200 (CEST)
Received: from CH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:610:32::17)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 19:53:23 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::58) by CH0PR07CA0012.outlook.office365.com
 (2603:10b6:610:32::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 19:53:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 19:53:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:53:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:53:22 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 14:53:21 -0500
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
X-Inumbo-ID: fc1fea98-85ae-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QukfxgqRlSt3kxnTqa2WWp/E9akBP+X3Z58br+8KUncJc7yPGtPgbNZyKJE5+ziolGFlr3kt5lPrLtwthb42YafpcZuvmaULcFpugKML5fw7eawdfn8Bn32U6N4trL0kilyGe1+B7SDT/pxKlxxbcXaNchzawA/E9QTDyCKYng6cAEi0VAYV/1TCWriUwjRK5yufMMdYidtrThwuVgBkgyOas90DFx1WFDlPUPr8xqx9I1zq/egVxPubZAgIhWWp7Hd/qx4TXSFocLWDU+tMsymGmJdhixfPkaf15IcXXbRZ8QEJa0paxgkh1+6CHAWOlntzqTyUxBK9cJqo/XUUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=US0Sv60N6TXMrrj6TOMAAQ3NEaVsmCgdayuC+a1mQ1U=;
 b=IrhQD/7wqEiFkpdmUoNOCAJpQlk8Dg0t/a4Pm+rCSmfJLAJg8O7GBD8u5ZcxIw3Gz9HBRchfEi9HyrSRVi1NICetoyTwb7jkoDUblum1cmHJp65nfQKrCMjjPQ6ABPvgjP2eGFG8twEZOflVxgNaViDZxj9qg6RX9hZ61m0ZJiYQmd/6xH/TnlqzzKtC//rw3tyXyUDRWylc6m/M5bSg519DOvkwFju5gg3V09dF2KEnpXHBR3yaVswpHJnDo/yRBXzP7k8fEMngA41mgFwi+Bh1jsjQX6L6kocgHPCWmIhIKdmWEjL5xNusx7odDNZQXxgm2577ObxA8c1eDCOVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US0Sv60N6TXMrrj6TOMAAQ3NEaVsmCgdayuC+a1mQ1U=;
 b=MroJDzqaChf4MOY8Q8JZD1HGPCkgZTMd65VIM3NNDicGw/iDUVnidEQgd1vLB0bvo+gWGojZ8ZbsTS3dZ6/exD9qnsl5Ud61JHgyS8K6sha/cgIH1KzBtMXpfa8kcADGK/45NyGg/8WPOXu07J4T67uw4TXhPULSiJUNlsid6Oc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <45f6d47b-0b17-4451-8956-c42260d9aaa5@amd.com>
Date: Tue, 8 Oct 2024 14:52:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 33/44] x86/boot: convert initial_images to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-34-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-34-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 42aa4c94-184d-4002-ecba-08dce7d2ddf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHlUOHNDOGh1SnoxSEwrUUVSMVhUVGtMSzdhMDlMcENsZkxFSEsxbm53d1Vj?=
 =?utf-8?B?b1ZWaWQyWlpKYklZZHRuUHYzTVFFN1lMNUpsR280bU9SOUV3M2I0NXVwN0ZN?=
 =?utf-8?B?VUFTK0lET3pHVzBtcmpOVUNOWHg1b3EyNEJubSs3SStEdEd1WGVoUlNZZmV6?=
 =?utf-8?B?TWxhb25XeTBBbzdvbEMwelVYRUVka0F3NWh4QzAvY0J1SnJiL2dPbXFHU0RB?=
 =?utf-8?B?aERSR2pBSXcrVDZsYlIvby83UzZMZVl5ekpYTmJiSGl0a21lK1l4a2tmSU5T?=
 =?utf-8?B?RTVITEt2d1BoTGV1b1J3djFHQVVqQ3VIanRlaHdkU2RXNWhJUXFLb0tad08v?=
 =?utf-8?B?T3BvOFdZdGQ1ODRxQ1lodU40V3ZoVzlqcFlSTWZ6azB1L3BiWXNaSG9IaU12?=
 =?utf-8?B?V2xPYzk0ZkVRbm5pclhlY0lQbHJEWm82Z2ZCUjVDYU52RjNSSVdkVmJXM2pE?=
 =?utf-8?B?enVSUDNxaUlGaDRGSWFTNU4vZnlHOFFHV2hOWDhzRGJUZ1UxV0I3bXZ2dE1S?=
 =?utf-8?B?VUI0N0Q4TTRHblJJcDlRdTZSdU1MQWRpbkhSd1Q1UFEzclI1VUNBMHIxcnlN?=
 =?utf-8?B?S1RRNGhXRkVId2JSc21jWE9CQi8wRWtMY1hrQWpZK1RLTEFxdnk2L3hyaUxw?=
 =?utf-8?B?WTBtMTVRZ2pWUDgrUW5nZVZhNWFFWk5DbUo2elBIRTVmQmtZT1hMam1wQWdY?=
 =?utf-8?B?QllGRmdnSTFQODRVSy9WV2U0cWhOeGlwMWpKR0IwM3VFVktOZjhHcjRWTWxG?=
 =?utf-8?B?bGh6Q0JuWDJjbjExVlVZbzA4djNLWG5hWCtIWVV6aG1sd0JaTVo5RjZPa3B0?=
 =?utf-8?B?VDE3TjlJVmJiQyt4UDdZMmJaZHRSaHBYSjd2OUVnOWgwRm9nblVQV1M1UVlu?=
 =?utf-8?B?QWIxUm9CTnZ1M3Q2M1ozV1VGamdSb3Y3L3BGTGdjcllQdVBFVVgyNTI0MnZO?=
 =?utf-8?B?V1UyenU4Sm16M1RXVkI0bjRGeXU0ZXZhek5kanhTSENubC9JZ2V6cUdOeCs4?=
 =?utf-8?B?UzdiUmtBeE1nZmtjWmNKV3VwR3UzekRLUEx1Qkg0Y2J6RFl1SUdqS0VpSjdl?=
 =?utf-8?B?ejkvc2lkV0NaL1hwcjJMUmloSE9JV1R6d1Jra0xRWmxQcExwQ0hFNlFxU3Ey?=
 =?utf-8?B?OWlvNlp3bVJjcFlKWWFjM3Z1eXo2UENuYXVESHR4b3hlQ2U2MU93Ni9zbkk5?=
 =?utf-8?B?WFpWVW1OSDNET1lQMFV5SUJIN1lwUWU1Y2VtSTU5bVphSThVb1owWG1KMS8r?=
 =?utf-8?B?dUxybHpYaG1jTEdMMVJXWkVWWW5ZWGkxN0dUM1lRbm8yQ0tKS2xRbCtLYmMv?=
 =?utf-8?B?Slp6MmVmU0RhWXBEK1BEZ2M4OVRQNkQ2WFdnbG0raTArb3kxY1lPNDBCbWVv?=
 =?utf-8?B?SnlodTUyRVFFenUzUzBYVnNYZVdXb1phKzZhNlRybU0zVFc0K0F6MVA3bkVj?=
 =?utf-8?B?S2MrTCtHT3lWNkpSMXdmNG5YRW1YNnNDMFdqem45eHU0ZWtFVEU0OHJwVldC?=
 =?utf-8?B?My85bitlbWxNZ3pJcUF3WDV3bGRaOTdVM0pRV0RvY2VhSHZJVUF0KzRIeno1?=
 =?utf-8?B?WTBIN01YZnBSVW1UU2RNUDJhbm1VczVRQnJFTXJ2TTY1WXJ6Z0tGNXJsTndx?=
 =?utf-8?B?ZjNKVVlNK05nYVp6aGluKzNaOUlrZVhtRlNTOXRXb2o3MUV6MUQ4Y0UzcWxT?=
 =?utf-8?B?TXRtRlAvYytRWmZSbkRmZ2h1dTl3ZklMRDhoTmRGMFM1aUdEQS91UFZ6OGFX?=
 =?utf-8?B?aTV3bnlVbURaZXJETmtiamR5c2VPbEZJZWhvZlVGVnl3T0R4Ujd6VTdmQ1k0?=
 =?utf-8?B?MG5wYUo3b1ZQZ1NLV3J4RnE1LzNWaFRPMFluTXg1em9nYzlVb0s5U2lJaVFo?=
 =?utf-8?Q?oqV4bFABXuHjx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:53:23.2147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42aa4c94-184d-4002-ecba-08dce7d2ddf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The variable initial_images is used for tracking the boot modules passed in by
> the boot loader. Convert to a struct boot_module and adjust the code that uses
> it accordingly.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d5916e85f68e..30a139074833 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -336,8 +336,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>   
>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>       {
> -        unsigned long start = initial_images[i].mod_start;
> -        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
> +        unsigned long start = initial_images[i].mod->mod_start;
> +        unsigned long end = start +
> +                            PFN_UP(initial_images[i].mod->mod_end);

This can fit on a single line.

>   
>           if ( end > node_start && node_end > start )
>               nr += min(node_end, end) - max(node_start, start);
> @@ -353,10 +354,12 @@ void __init discard_initial_images(void)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
> +        uint64_t start =
> +            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
>   
>           init_domheap_pages(start,
> -                           start + PAGE_ALIGN(initial_images[i].mod_end));
> +                           start +
> +                           PAGE_ALIGN(initial_images[i].mod->mod_end));

This can fit on a single line.

>       }
>   
>       bi->nr_modules = 0;

With those fixed:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

