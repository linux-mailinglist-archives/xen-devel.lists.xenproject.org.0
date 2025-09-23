Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19147B96DFD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 18:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128585.1468896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v16Aj-0001EU-0p; Tue, 23 Sep 2025 16:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128585.1468896; Tue, 23 Sep 2025 16:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v16Ai-0001CX-UU; Tue, 23 Sep 2025 16:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1128585;
 Tue, 23 Sep 2025 16:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKVX=4C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v16Ah-0001CR-7S
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 16:47:19 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f595345e-989c-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 18:47:17 +0200 (CEST)
Received: from BYAPR06CA0058.namprd06.prod.outlook.com (2603:10b6:a03:14b::35)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 16:47:08 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::ab) by BYAPR06CA0058.outlook.office365.com
 (2603:10b6:a03:14b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 16:47:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 16:47:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 09:47:02 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 09:47:02 -0700
Received: from [172.20.229.150] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 23 Sep 2025 09:47:00 -0700
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
X-Inumbo-ID: f595345e-989c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwsrvIxavi2kwdodbPVo1N2iGMqK3f8+sRw1Gu6KyGFs2MMZRE1TOIhxk20HZ6w+owOQYJ7RyCgZc4K70odLXBWY4LyJLSBz2UR197XOON6zFOXzpA9/3OrJJ/Qkiw3F1E4CsbXfgumQiD00Md46Y7DrzmnsH55TaZfc/9ivUumbEueVxyXC6jgr5TTJVoqabNgdEH5xBms2qJE3CFgL5uuVgtHua2CUC1TBqJ3w6Rm8ZOMSZeOSGyBgUDFrKwiKRimoD0bEVNfdZ3rV6ZoIU5W5AGCKH0eoZ6WKBs4Or/xxLaKANDA1m2yFOJGQ2gnRQiD3fDH8FPHu7WiDdZ0nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etSRuqcxug86BJLSlFeargc1Q+LCaWnLDyhcA0MdyGg=;
 b=KdEEYzGe4ysoIGrprFPW981icbzWsOl+mo4lWcetunztIvgw0R3h/ioGeJFokhnsNRSulYaEMbbQMXQqGDw+3LjC1jwEpJdNai8Ssjhx7RTM2AHLAieMHCrKJrcsq6cGRC8eKKR+S7SWzKZQjD5chv81cIsTtXP7LiBqkSYr1Dk131ZPuCugo5iyM3cxWUbcNhvfVDLC6g7mYMwdjf0uepwWGHlWVq1ddHGdIjKTL7gXwcYVMw0lfF63SD5wfL22ZWlPASjnR7uTUaADsYFlBUBlDCQJvYDuxjf2N127zP/csuXAJwEffbY/hFUGEr3m57S288R1EtRCEqFn6sSUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etSRuqcxug86BJLSlFeargc1Q+LCaWnLDyhcA0MdyGg=;
 b=rbnN7jXY2NGKW+BAAgn9ilAvneBym3CZUl42joyM9AR7P76WYVCvH/3RO7MASh6oCGmGq1QcdFWlvNdR2yNNBwMTn9ywd6N4f0qSrJZ/nabKv8bAYPTcvu7gsqaxIyuK6Fmh5wcMADKHUMbpJMtORiLj1jsHiOl2o9jl263lhyw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1106c080-508b-4328-a636-900ca8377d2d@amd.com>
Date: Tue, 23 Sep 2025 12:47:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: <ray.huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-8-Penny.Zheng@amd.com>
 <5a2e887f-d6da-42e2-aff0-efe55b041749@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5a2e887f-d6da-42e2-aff0-efe55b041749@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 385f10d3-4dde-494d-33d4-08ddfac0d606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SklZMGFrUTdJbmp3STBTclYrMnNnajVQbFg3L1JvcW9FWXM0aCtjVmNmWGlR?=
 =?utf-8?B?MFVJakU5M3Q3dkZMY1dPZTBtVG8vQmlBSTBUUHlUT05xSHVLZDJ4SlNRNGpC?=
 =?utf-8?B?SFlmNzBPbU9ramNDLzFYTWh1TnFwSzV5ZDR6R3pDbGUwTStXYjJNcis5K1RJ?=
 =?utf-8?B?clMyNjJCLzBDaUVyeWFQM2t0TUJSZlFhZzg1dW5lUW10M3NBdTNEdmRzL0ZL?=
 =?utf-8?B?SnZpaDZXQU4vb3YvVTRQSDE3YUdQNC9BTVJVTmNkc3RzWnhJNjRTWUgyOU9t?=
 =?utf-8?B?WEdnVjg2eTRJWlh0bnpiV2JwZmVDNFgyZyt6eDRLZGN6c01sTVc2aFJ2dENF?=
 =?utf-8?B?LzNLVmZENjVTM1NpbHA2RU1lTlpPb1J1UnNHZ3hnT2RiczdBR1dLNEdMQTUv?=
 =?utf-8?B?UCs1Um1tRHhQOUlJUkRiVFV0cEl1VTljSWwyZU5tTzVxV2M4Rkp6L2VEcHFX?=
 =?utf-8?B?bXBNb3NtK2k5YXovbmdDdThLRmhORTRNNWFjdWpuR1Z1S3UrNXVOTXp5M0NW?=
 =?utf-8?B?UnVXcDBYbTFGTWpEMGRFZFhxWk9FRnh3SjNBMFFmVFNtSHJ3U1hrdmwvamM3?=
 =?utf-8?B?MStqZ0F3RlBFRlpyL0tYTjNQMXNsWmU2K2lBQTNacFNBTG5WOFl1K2ZCQmVG?=
 =?utf-8?B?TGtVZ2lON0VHRjVaVldSWnVzMTJ4MFdOdVBaQ3UvQy8wR3laOVB1REEvZXNO?=
 =?utf-8?B?Sm5aYWJNeXpBNUxmbXhDb1BaWGxMMDYzWWR4VkFpN1p0T05GbUhrQi9JZ3J5?=
 =?utf-8?B?UWlHMWNJcUc4NFVqSjJpTm1zb01tQWhOUjJMT2l6aEZxWkl1N1RkdU1BcElV?=
 =?utf-8?B?UFo4eDZoSlpWcENPaXUzZXNLWk00U2prNkcrVHRUSW0zUDhsZUxobXU0aENT?=
 =?utf-8?B?RUl4REZLb20vT2Z0R2NTK0JLditRVm9lZFd5Z3lhTTFneGNDTmZtd2NkUnBS?=
 =?utf-8?B?WStKMHMvNnFGMnBLeE9DR2xGNGxVVW85TU03WUhIUWhqSFBVakk4bm1ob2hX?=
 =?utf-8?B?aEVrdFB2T3JZbWMrV2VwWUhrd3JOVWdvMEp2aGgybDV2Z2Y4eUk4bHhrdDlF?=
 =?utf-8?B?ZTA1c2NORDJpUyttb1RzTmtCTjVaZ0JZV0t0YjlEcTdvdjRtQjVYWXdSMU9U?=
 =?utf-8?B?bjhBSEVJbU9jZGhUTjhwZW92cGFFd2FoMmFpQnlVZ0d3S004ZkdBNktaVXpY?=
 =?utf-8?B?OVdyQ2t5K2pzOEoxcU9HY21MTXFmcTdmQlRHaUk5VkVITEpXeHpXa1kxaDVZ?=
 =?utf-8?B?RHpQc2NLN2dwcTFMcFZUYmRWSS85L3lrWUI2RUw3bHZwOGpZOXAxTWFNc2N5?=
 =?utf-8?B?bUhhbS9wWStPZzYrbGRTR0U0alRwZjNrR3JRemcxVzNGYnUvYkJVZ3gxV0th?=
 =?utf-8?B?OVpjODRSZzJPbkZZR1pwWHRzZU1NWEtTSjJ1WGY5UHhxSTNRNnVTUmdQT3FE?=
 =?utf-8?B?WHdpMWQyVytXb2w1MU1QTjVoWm9iSzRLQ0c1WEZiSkpnOVZHSVRJV0ZXZ2pz?=
 =?utf-8?B?OWFZaTdiOStWdmlwelNuazNkOVprZzg3WDRhNGl2TmtjNVpUbXlLcHZ1WGFW?=
 =?utf-8?B?MnltN2IzbVVTb3pSMFVCUlBwN3liRmt0QktBTkVUZ0xCdGMxc2xWZmt4VmxB?=
 =?utf-8?B?US94Y0s3cGFLZ084WCtwNGJuYjdjdHphZlBkT3BSdVFyQ05OSVdMZ0IzM0x2?=
 =?utf-8?B?NmxTTEZTMjBPcHFHdmdzaE5veWs2TEVNZFA1ZlBGbTZIb1VzVU9zbXBZT2Fl?=
 =?utf-8?B?SThSTkR6bEwzckJJcFZUdzUwYm1OSG45VmZqejBkMllHSTJHUVdZTGZCSWNX?=
 =?utf-8?B?M0RkZUlhMU1MUGxWZ1Y5Qm1mb1hqNUNEVHJVQkdkQU1WK0czSGlPNXZjSUth?=
 =?utf-8?B?WUhuQkNJdnMxMHNsN2lkdXQxU3o5YS9nSXYxNUNtaWxyZUl1Nkx4MVdidEJ0?=
 =?utf-8?B?SFdGT1BkbnVSTXNKckZZZlU4aFRkRFcyU1puQ1p4NXBvbmliN3gzZ1ZoN283?=
 =?utf-8?B?MDR6Mzc3ZWIraXVaWXFTRmh1R0ovRThaOUxsb0ZQVGRGMVZoV2ZORTJROWFL?=
 =?utf-8?Q?grxVQF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:47:08.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385f10d3-4dde-494d-33d4-08ddfac0d606
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099

On 2025-09-23 11:38, Jan Beulich wrote:
> On 23.09.2025 06:38, Penny Zheng wrote:
>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>       else
>>           strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>>   
>> +    /*
>> +     * In CPPC active mode, we are borrowing governor field to indicate
>> +     * policy info.
>> +     */
>> +    if ( policy->governor->name[0] )
> 
> amd_cppc_prepare_policy() may leave ->governor set to NULL afaics, so I
> think you need to add a NULL check here alongside with pulling this out
> of ...
> 
>> +        strlcpy(op->u.get_para.s.scaling_governor,
>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>> +    else
>> +        strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
>> +                CPUFREQ_NAME_LEN);
>> +
>>       if ( !cpufreq_is_governorless(op->cpuid) )
>>       {
> 
> ... this conditional.
> 
> The description also continues to not mention the effect for HWP. I'm
> actually somewhat confused, I suppose (Jason, question mainly to you):
> HWP falls in the governor-less category, iirc. Yet it doesn't supply
> a .setpolicy hook, hence __cpufreq_set_policy() goes through the normal
> governor setting logic. What's the deal here? The answer may affect
> whether I'd deem the pulling out of the conditional correct (or at least
> benign) here as to HWP.

Hi,

When I wrote HWP, I didn't realize using .setpolicy would bypass the 
governor code.  Instead, I implemented the no-op HWP governor, since I 
thought I needed something as a governor.

set_hwp_para() actually changes the configuration.  HWP only implements 
the equivalent of amd-cppc-epp autonomous (active) mode.

So I think HWP could switch to .setpolicy and drop its governor.

But looking at this hunk:

 > @@ -321,10 +327,12 @@ static int set_cpufreq_cppc(struct
 > xen_sysctl_pm_op *op)
 >      if ( !policy || !policy->governor )

Doesn't this !policy->governor prevent amd-cppc-epp from setting 
parameters?

 >          return -ENOENT;
 >
 > -    if ( !hwp_active() )
 > -        return -EOPNOTSUPP;
 > +    if ( hwp_active() )
 > +        return set_hwp_para(policy, &op->u.set_cppc);
 > +    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
 > +        return amd_cppc_set_para(policy, &op->u.set_cppc);
 >
 > -    return set_hwp_para(policy, &op->u.set_cppc);
 > +    return -EOPNOTSUPP;
 >  }

So there may be other checks that would need dropping or adjusting to 
support HWP without a governor.

Thanks,
Jason

