Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C034B445CF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 20:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110655.1459734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuF5S-0005Jx-Nq; Thu, 04 Sep 2025 18:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110655.1459734; Thu, 04 Sep 2025 18:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuF5S-0005HZ-Kj; Thu, 04 Sep 2025 18:53:34 +0000
Received: by outflank-mailman (input) for mailman id 1110655;
 Thu, 04 Sep 2025 18:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehPD=3P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uuF5R-0005HT-L2
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 18:53:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 722e545b-89c0-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 20:53:30 +0200 (CEST)
Received: from MW4PR03CA0020.namprd03.prod.outlook.com (2603:10b6:303:8f::25)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 18:53:24 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::2c) by MW4PR03CA0020.outlook.office365.com
 (2603:10b6:303:8f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 18:53:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 18:53:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 13:53:20 -0500
Received: from [172.31.134.167] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 13:53:20 -0500
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
X-Inumbo-ID: 722e545b-89c0-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvmEpstWeWWTEMU4kmeEnAHwPX/z52tM3aAMz08CLKU0sMmKNuaPSbMB/R4N7RMVVmh6pJLkUy1QeMjQ4vXUDSsIAKe7c2t0UwLdgug89Z1bMTTyRAoKwXrEQGPVwW+j5FKUWX/B4y2UHAuaFZJSN8jbDQZzkYbM852OajkmpWSjXks/FVzuMXlrIjSPu0eCMZgQqnt+0oWKap9H9uolQiYuG1BUWT9Eo4KD44G11avyqsn6WOl3lSC2aoKgoSQ+sqdz8YJ8K7o3dXHkGVnQJbpa8jYACWfWsnR7VTx8Zp/nMrVPDL8EN4LvtWlr6CNP296pKHAvCOHQQR3JmjVvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa33LKobugZJ2n1Alem9MeMOFTIqWpw0pDgYkKTy/KM=;
 b=VCrobMp+SXEkrvcYVHsN4HQ+f7OCavK0I2BEgkRqiKQupoZOxAIb6lZjhabJcwLN7qA5+wdap+H1NhOlTYvdL3JBTbqPJcjLVos87WEDLaj4RWVhHNpA4mrhdEXcMmVjCccl45URPEUONZ8sLwU53nRPu6OsxPZDCoxV85F7DhmdkziV4lybznszldyMUlPWmZUJ7h355hFW4Av05M3bb4P73GRI76eB9AUVi1wQmzwCVCXiXYrilEjEfQo2KElF1gaKyIWc2x2F/YJIGcDnDXUskf3hzymZKVHN/d6Vs9Nv4kNUsRbwr3f1u84/3Wg2HdVug3gLLqSpseXJv19QHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa33LKobugZJ2n1Alem9MeMOFTIqWpw0pDgYkKTy/KM=;
 b=dULTV4z9H16Qq1Fsn3UjCwnv0HtnsJ3p+kLQpkU4gdf8fq/aM7fTaCyWZ0BFKNqj4LAO5b6ymZ0YpGdUthQ1QmUjP2+UDaXC5QrLkYemE7JXv8bCId82va7uNas6rGpg7y+taubcpwbuS9as6ni94jNxqKOkDP2p1OoMDCbkPkE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ea021d1d-1e53-48cb-8957-f83313c2f8f3@amd.com>
Date: Thu, 4 Sep 2025 14:53:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
 <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: b313d7f2-d0e0-4d2f-be96-08ddebe452de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejRrSzM2Ulg4cDZRVFVqTmNjRzh0SDNtSGM1L2JrSFJqaS9NVmlzL1RHQm00?=
 =?utf-8?B?aC9LV2ZzdnEzRnBMNllFQytzS25BZmpSQWVYd0NFVDlRVUdPZFpPSzBCTG5x?=
 =?utf-8?B?VHN1d2lVWk9GRjkwZ3FOc1NmM2tyeHlnOFpsMWt3eHl4cjdKbUxaeXlOQ09a?=
 =?utf-8?B?aU5NaGpiS09WRmZsVFNybFV3S1ZqNEgyeVRoVzRBQjVZTjc5VkNSeXM0MVo4?=
 =?utf-8?B?NHUvM2N4ZHhnaEJPNDJBZUtkRXgxWk9LUlRBVDRmMjdrei83S1lKUVdkays2?=
 =?utf-8?B?NUJnRWdPYlBKbWVxdzJQeEJDeFFtZ1lRZlhZN1ZtamVINkZBQzZGWnhPNVB1?=
 =?utf-8?B?eU5JQjU3UVN5WFFXbEJDSkpVTGZGdE11SW9scEt0QzlEMGx3NXhIS3V0R3R5?=
 =?utf-8?B?SndVRTgvVVBCZG9sRExyOFBQSEZXRUVYTW1rcXlDZ3FMbzNEUlFicTVSeDc2?=
 =?utf-8?B?K3Fqd0hnNFZkRHhlclZtRzFRR1pUSVdIelJBaDNsSkJIa3N1cGhOMHNIQ05X?=
 =?utf-8?B?TDdwSVlDd1lMaUs0NzBsTGRYS2xYRXVqWHRrMjRid0NBWkg5SFR2a2p1T3BJ?=
 =?utf-8?B?NTBvM0U2dGVkaVU4b25YVnFhVlFHQjFmd1pJL25VajBueGNDQ25FcFB2L1Bh?=
 =?utf-8?B?WTZpNk9BMFpOc2hTMXdsTDV4Ujljdzg1YjdrWGpzTWVodjBQWmhIRFFCbWdt?=
 =?utf-8?B?eEhBdmRQMUs5b1FLNWtaU1EzcUNiNk5SM2Vrc0JJVGhkMGluSkkxTnYxTTRX?=
 =?utf-8?B?M3A0TytXcHdLRXN5RmtDeG1zN3pOYmtyQ2FrbjdvS28zVlBFRXFvQWNVb3U2?=
 =?utf-8?B?VUg2S3M3Y0NpWVN5UkltMEhBY1o1bEhHV3dLN21HdFZLRzRLWUxOWHJyWXVF?=
 =?utf-8?B?UnFBMHV1bFBCRWJZdThtZWIvbWMwN0tJTnJjN3VRWE5sVTI1cnByZjBKQjBh?=
 =?utf-8?B?R2R5YzdiWFZCZmJZRVQwS1NKSjd5YzV1Y2oxaEpMQXpuWlRxcWs1dU9aVldK?=
 =?utf-8?B?WmphM2c2ZkFMZWx0UXBaTFVwWThpSlZEOUs1cjd6OWtzdjBXS2JFVXU2U1Za?=
 =?utf-8?B?TlFFQldNWHllU1hFWUgrSzlXQmNyamFYUkRPc3RWMFpVbDRVajZkdEFEVldv?=
 =?utf-8?B?KzNQM2dCdklSOXVHbTVLMVVna1RTYnIwbSt2a2lKdWkraXNZbDFDajhIN0RT?=
 =?utf-8?B?Z0JBTXFhVXpBWnhIZTliTE0vREYxeVVwc295TXkraWpuQlhrbHVHc3JXbU92?=
 =?utf-8?B?ZWs4NERUcmQvU2xoTGI0RVBBalJYUzhBMnUwQm9VVk9VZWZwek1LWmNVdjBB?=
 =?utf-8?B?ZWJkaitpMmt2ZUN0cTRIU2VqaTBCcDJYaUg5MVRJRkgwTmY2ZVJVbXQvemxX?=
 =?utf-8?B?K2w4ZEF4VktjVmx6UmQwUTFVL2pBTkJTeGlzcmJFSENodS9tZGlCWEF5TnpQ?=
 =?utf-8?B?ZzNMY1p1aHp3TzU4dkxvVkF6TzNqTzIyTDN1THpGTGpuOXd6YUNkdnBHbTNo?=
 =?utf-8?B?bkxGK1ZOTXhNOWZNVDh4amU2MUFLVFkwK2YxRGIyNzRBRGp4ZzdQdXhkQzNx?=
 =?utf-8?B?YUlnT1R4bTR2aDV4blQzdjgxd2FURGYzRzdiRGxUMVpqR2xpVitxaTFlYUxp?=
 =?utf-8?B?eFI1OGhMMGl4bTlCNk9sUmtrSkhFdnBzUUJna292MG5EWXMvRHVCSlBHUDhY?=
 =?utf-8?B?aHU0VmVpUXlkeFdYcU9pR3BnbEt2eUNTTFFHejY3bHZBVytyVFRaUHhKTU9j?=
 =?utf-8?B?OVcwZzVTMVdBTC9PSWpCS1R0Mjg0d01zSGdFajJmaVpxK2VQV2RkYzFxWDV3?=
 =?utf-8?B?TVVvcHQ4bUxnQnVycmQ2RUcxZjhLUHdSdTNQVDFMcDNKU203K0tySmk4MkxU?=
 =?utf-8?B?QnljN1VOVC9DcUtVblRSVEdISnVKU2JMUkEreHFqQmlQY1NyV1BvclZSbEYw?=
 =?utf-8?B?MVN3cHpzWk5ra1RtUjZvbDREKzJVOVg2Z0RiNGFtUDBsOGZZdHE4OU5WdEs5?=
 =?utf-8?B?M21pRnNGc21odHE2TDMrV2pUV1d2NDdmc3A1aDMyTE80TjlySitkSEx3MGZR?=
 =?utf-8?Q?NQPKc1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 18:53:23.1191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b313d7f2-d0e0-4d2f-be96-08ddebe452de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

On 2025-09-04 07:50, Jan Beulich wrote:
> On 04.09.2025 08:35, Penny Zheng wrote:
>> For cpus sharing one cpufreq domain, cpufreq_driver.init() is
>> only invoked on the firstcpu, so current per-CPU hwp driver data
>> struct hwp_drv_data{} actually fails to be allocated for cpus other than the
>> first one.
 >> There is no need to make it per-CPU.>> We embed struct 
hwp_drv_data{} into struct cpufreq_policy{}, then cpus could
>> share the hwp driver data allocated for the firstcpu, like the way they share
>> struct cpufreq_policy{}. We also make it a union, with "hwp", and later
>> "amd-cppc" as a sub-struct.
> 
> And ACPI, as per my patch (which then will need re-basing).
> 
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> 
> Not quite, this really is Reported-by: as it's a bug you fix, and in turn it
> also wants to gain a Fixes: tag. This also will need backporting.
> 
> It would also have been nice if you had Cc-ed Jason right away, seeing that
> this code was all written by him.
> 
>> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
>>                                          unsigned int relation)
>>   {
>>       unsigned int cpu = policy->cpu;
>> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>> +    struct hwp_drv_data *data = policy->u.hwp;
>>       /* Zero everything to ensure reserved bits are zero... */
>>       union hwp_request hwp_req = { .raw = 0 };
> 
> Further down in this same function we have
> 
>      on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
> 
> That's similarly problematic when the CPU denoted by policy->cpu isn't
> online anymore. (It's not quite clear whether all related issues would
> want fixing together, or in multiple patches.)
> 
>> @@ -350,7 +349,7 @@ static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
>>   static void cf_check hwp_init_msrs(void *info)
>>   {
>>       struct cpufreq_policy *policy = info;
>> -    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
>> +    struct hwp_drv_data *data = policy->u.hwp;
>>       uint64_t val;
>>   
>>       /*
>> @@ -426,15 +425,14 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>>   
>>       policy->governor = &cpufreq_gov_hwp;
>>   
>> -    per_cpu(hwp_drv_data, cpu) = data;
>> +    policy->u.hwp = data;
>>   
>>       on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> 
> If multiple CPUs are in a domain, not all of them will make it here. By
> implication the MSRs accessed by hwp_init_msrs() would need to have wider
> than thread scope. The SDM, afaics, says nothing either way in this regard
> in the Architectural MSRs section. Later model-specific tables have some
> data.

When I wrote the HWP driver, I expected there to be per-cpu 
hwp_drv_data.  policy->cpu looked like the correct way to identify each 
CPU.  I was unaware of the idea of cpufreq_domains, and didn't intend 
there to be any sharing.

> Which gets me back to my original question: Is "sharing" actually possible
> for HWP? Note further how there are both HWP_REQUEST and HWP_REQUEST_PKG
> MSRs, for example. Which one is (to be) used looks to be controlled by
> HWP_CTL.PKG_CTL_POLARITY.

I was aware of the Package Level MSRs, but chose not to support them. 
Topology information didn't seem readily available to the driver, and 
using non-Package Level MSRs is needed for backwards compatibility anyway.

I don't have access to an HWP system, so I cannot check if processors 
share a domain.  I'd feel a little silly if I only ever wrote to CPU 0 :/

I have no proof, but I want to say that at some point I had debug 
statements and saw hwp_cpufreq_target() called for each CPU.

Maybe forcing hw_all=1 in cpufreq_add_cpu()/cpufreq_del_cpu() would 
ensure per-cpu policies?

Regards,
Jason

