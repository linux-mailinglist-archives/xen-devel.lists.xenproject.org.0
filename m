Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CAB1152A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056685.1424708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6A6-0002Rv-DN; Fri, 25 Jul 2025 00:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056685.1424708; Fri, 25 Jul 2025 00:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6A6-0002PK-AD; Fri, 25 Jul 2025 00:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1056685;
 Fri, 25 Jul 2025 00:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6A4-0002PE-HZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:19:44 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [2a01:111:f403:2408::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f6a6024-68ed-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 02:19:43 +0200 (CEST)
Received: from CH0PR03CA0260.namprd03.prod.outlook.com (2603:10b6:610:e5::25)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 00:19:38 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::99) by CH0PR03CA0260.outlook.office365.com
 (2603:10b6:610:e5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 00:19:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:19:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:19:12 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:18:53 -0500
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
X-Inumbo-ID: 0f6a6024-68ed-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpol2Psy5ZV+k5eZJBqca3kdtLaz/CssYVwG6PwrodqQEgGxGPSeBScaetWw8ScWGlxdIM1urPoIbwvam43ud+/YILnf5SW1L9WuaW72BLnjtBms91pCy1XEgB+35cpdTyU/W3Bm+OC/QsvzHBGz0U3zvkXksiQRttsDlKBd24A49c+VpWKdfaj19PyHyopC2V+2xuoEqgsyi5q6YnNTeGXdm7R0TU60CkzcvXygmABQq7p5GGBOYtwQkdYu68jyB9ohV8t3ZpXyCSb9DrCw84CpBord7YXOm/wr6uck5h2IlXqU4JWhaaxF9uWwvjMQygJblrL2xghMfc66hFmqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow3+k6oDixko6EciNj0nOsVReK131xnYJn/jXMYNvvQ=;
 b=lICtOyHTmhQEttMbALNAoYNSXdFHRSXoBNPH+lY8N5oRqaYQXe7+ZNLXd5CKoXSc3ll4QBDRANvcC9r+ayj4HgTD+ZOaoC5KF4+pl5s0h6d9+cNBMj+FaY5fe8F3RUjg4phvykQjzFqUpI+2CC8FfR2z89imxvRpH8qnouiPpWt82GcKfNQ/XilEUqWX2bsVsF3SnExTHa9SGTOn9LOnbdmy1Otto83+Hr2a14Riv1SZH8LjDofbeQKsTWGcLOVbqijyMzsnym0qOMQWyJ1M/awfGp+mP5PK0K5x4a3gnM0p4zpMFxhTZmPejwVt4cRoCyetmYox7j41dxDpcwMsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow3+k6oDixko6EciNj0nOsVReK131xnYJn/jXMYNvvQ=;
 b=qyrxa7g672IBmxH02hgL+46D4WDs5T/gB5NjqGmYGikxxD5CBrxaGNn7ctPJxO8F/V1NP/DEXktzXTUazKkjZkJnHiTbACBtEAvBiiQWR2hUfg3BXGJ+3yedphxY4P480/WcjuDyaOwtqsYs2O8vGreVxRZBqDedysezgGWpY+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <06cf10bb-a52b-4756-b710-899e29fd7518@amd.com>
Date: Thu, 24 Jul 2025 18:36:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-19-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250711035106.2540522-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b98a41-5e63-4371-aaae-08ddcb10f0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckpHdjJyNGJSdHlSK2dSblA0TjdEaWRHMlJYVU5FRmRuVC9QLzhid1pNRU1u?=
 =?utf-8?B?dTV2c2d2T040ckxhVEF4VFBKZzFwZ2pNZEhYeExnL3lWNXoxK3hhWHlYZ2lG?=
 =?utf-8?B?dUdKVEhOUjJTUWZGVEV6eHBpNlVITzZUOXV3OGRBREhnNzI2S01vRGhBbU5m?=
 =?utf-8?B?d1ZVcHNYdEtWTTBYMTFhT2lTclJVd3dzVEpnSGYyKzl3UmVpSDRZV3RGYStQ?=
 =?utf-8?B?Q3F1TS9RRjdaTVhhSE5NRm81cWRNSksxZG02ZWxwcjJuRStlWmhuTmxZWHly?=
 =?utf-8?B?Q1lWVldwQ1lSSDFJQzBBRE1nc0g4UkczYXdXcGc5dnU3Tmxka3Z2cDF3L0NW?=
 =?utf-8?B?dDdxM2lpVWtSNThtTlhPYm1uVm51a0xjY2ttb2k2QVl5azhaWUUxd3AvNkx3?=
 =?utf-8?B?SzhObllMV0FESXdTK0pvMjdERVpyZlY1bDJDT2FzditvUWRQVFBjOU9KVnBP?=
 =?utf-8?B?WEJpODdQOEI2NVNDdDJMU2hrQWhIL1hRcmFKbi8wNmpsMG92ZDR4a1I1aFJU?=
 =?utf-8?B?eDExMnh1clc4YVpJdGZsNHRxL3R4SU9zUzZQZ1Z4VHJJcm1HQ3FJblRFWG9B?=
 =?utf-8?B?VHVRT01LdUxGU2lBaXRCOHJHTzVGUDlybTErODV4NURvV1pSdTVwWTdCWHNR?=
 =?utf-8?B?QU9FREh5YkNKT3pmbldrSjdOZERuQ3F5bDdrSWFtZmFBM29GZTZ4ck9meDkx?=
 =?utf-8?B?cDVucFF1akxQYTc3WkYxcnIxLzhEc1o3cU10S2o2aytGRXM2NU44NjV5Qks5?=
 =?utf-8?B?T3g3VXcrNThzSTByNzFERno5VjVnb0w4dHV6K0daeTlvV3AyNTIvV2V6N1Mx?=
 =?utf-8?B?OVZHTnE2SnhCRXFuZWsxaFRxbnRoWTVVNEFUa2lDWjYvRlU0c0pOMzZkQUJW?=
 =?utf-8?B?bUtPVlhMd1B3KzZVVWxwa0xzZG9JYkIxRkt4UzBveGNXUkEvNFQzSVdWNjRR?=
 =?utf-8?B?RHZGOGVZM3FQZ1Bva3gwWFRxYW5sVTJMRTdwWTZQWFdXTnFuZXNMTFg2SEhW?=
 =?utf-8?B?Y0x3QnJ0R2VWSG9IOStKNVlhTVRzZ2hzVHpDc01OY05VWWZWdjNmQnVMb09m?=
 =?utf-8?B?T2Z1UllvVWs2SEU0ZUhLdWQ3ZHJCREZiM2twRHBQMVhXbkphTmYwODcwK1Rw?=
 =?utf-8?B?R2I4WEZpZU9kN1YyWkNNMWJieHdXSDJ2WkFqa0gxZlVQcXR2azU3Z0ZrOXo0?=
 =?utf-8?B?OGZPQjdaNFBKVGFzc0lYN2x5THVxQVNKSXhmT2ZIZncyTmdKQjlzNTBwUFIz?=
 =?utf-8?B?Q1ZZQ2ZSTGRpZEk2QWVuamZ5eVd2TVlUMDRVTHIrRUl3L0E3ZFlBVWtUdjN3?=
 =?utf-8?B?bzZvZnV0WDdIZ0dVUW9laU14Y3g4TFZOcm9jWlhvd2xqUWlWcTV2MUNqYnMy?=
 =?utf-8?B?SVBmejBESVUzQlVLSEU5U3gvLzVSbFlpcHNEYWMzWFA3aGpmSldWZVV4ZlAv?=
 =?utf-8?B?Vlo1YjRmd1ZUMWM0QkdsTWZ1WkJmcGhtTko2ZURSaC82dmM2Y0tna2dGQTR2?=
 =?utf-8?B?K3ZtYXdjSitVOWxPREVWUUNBbDRoYnFnR3BjMDNzeWxmR2hhd05hUEwrRFdv?=
 =?utf-8?B?MzNub3g0NStTa3VXS1JNSU4yNTFYaEh2dFVNbTVzSld1SSszUkZGTTl3bmJG?=
 =?utf-8?B?MjBFQ0p5ZmJMOGFwS2FIUGtHb1NjRjNGOFd1SmdqSEkzU3NmWWs4VnRobDhl?=
 =?utf-8?B?VlFRS1lsQ2x2aUJWVVAvd3hZM2NkM2ZPb2lQQWZ1bi9jR3ZEbWp2bytXOTZB?=
 =?utf-8?B?aUdMNW1ldVZyTkxQeUJrcXVGajZBS1l4d2hrOEMzdU9Eay85aTFITXBxMHhY?=
 =?utf-8?B?R2Y4TGlNSDVYMWdKNzZOeE5VQUtmSnh2cWpBU1NuZFBHZkhYZ3JKMHJFaE5V?=
 =?utf-8?B?dHNDTVluTlZhc09XUW9pWTNQbjJGR0s0RzBYRVk4Z2tFRnR0VUc4dEhaanAv?=
 =?utf-8?B?Q0l3V0Q5aDNRSkwxM0dCb0FDSE8ySVJBYnNibEdNbTZCaDZ1SWlEdlpWYWpQ?=
 =?utf-8?B?NVRSOG1LbG1VbTZjUmpROVR3cEphZXJSTkdnQnBZZDZDNDZQTjkwU0FoRm1M?=
 =?utf-8?Q?/dXvHW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:19:37.9010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b98a41-5e63-4371-aaae-08ddcb10f0fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255

On 2025-07-10 23:51, Penny Zheng wrote:
> HWP and amd-cppc-epp are both governor-less driver, so we introduce "hw_auto"
> flag to together bypass governor-related print in print_cpufreq_para().
> 
> In set_cpufreq_para(), a new helper is introduced to help error out when
> cpufreq core intialized in governor-less mode.
> ---
> v3 -> v4:
> - Include validation check fix here
> ---
> v4 -> v5:
> - validation check has beem moved to where XEN_PROCESSOR_PM_CPPC and
> XEN_CPPC_INIT have been firstly introduced
> - adding "cpufreq_driver.setpolicy == NULL" check to exclude governor-related
> para for amd-cppc-epp driver in get/set_cpufreq_para()
> ---
> v5 -> v6:
> - add helper cpufreq_is_governorless() to tell whether cpufreq driver is
> governor-less
> ---

> diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
> index 077efdfc5c..54815c444b 100644
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -244,8 +244,8 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
>       if ( !policy || !policy->governor )
>           return -EINVAL;
>   
> -    if ( hwp_active() )
> -        return -EOPNOTSUPP;
> +    if ( cpufreq_is_governorless(op->cpuid) )
> +         return -EOPNOTSUPP;

NIT: return indent off by 1.

Regards,
Jason

>   
>       switch( op->u.set_para.ctrl_type )
>       {

