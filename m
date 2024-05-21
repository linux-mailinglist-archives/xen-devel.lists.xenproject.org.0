Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832328CA94F
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 09:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726629.1130965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KDj-00007n-6o; Tue, 21 May 2024 07:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726629.1130965; Tue, 21 May 2024 07:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KDj-000054-3j; Tue, 21 May 2024 07:47:39 +0000
Received: by outflank-mailman (input) for mailman id 726629;
 Tue, 21 May 2024 07:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbJz=MY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s9KDh-00004w-MB
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 07:47:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 630f97de-1746-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 09:47:35 +0200 (CEST)
Received: from MN2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:208:a8::15)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 07:47:32 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::75) by MN2PR12CA0002.outlook.office365.com
 (2603:10b6:208:a8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Tue, 21 May 2024 07:47:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 07:47:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 02:47:31 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 02:47:30 -0500
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
X-Inumbo-ID: 630f97de-1746-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLkCHtDzi7q3Fg/04gX0NJR3rM0mVDa17etC8rugbRLtgwRIwDYKm7QRsp1Nqb3ic7tDF//+vvqjT9m54suYoJMshqAOJ7HTVE84C5urfoTgboWb7UY4bESnMjds9nFQw3ITUM7Z+Hh+jOWDx81QwOUyH8Fu8DnXNDaNuBrYjYVgAJScOwI/lTrYuKviktsHOEqMsZSnivlou1KcidJOLO2HEN3tufkoscUnqZ4rkGAquubxuFQ2+VsX2NyqXpsdyfKLl6TTeHUuNW0P13zCO7SsjKMfI12DdAQ+76xex0HDP2oY7O1N1bJEXkvRWg7cw9JRv0F4gYe6NUsDMg5oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjoqvSVRSR9NDC874BgKN3oOL36ifj5ne8qhLOku9b0=;
 b=WDmamD3eGbTsunOWAUY50qky5mj6LkScyEnE1NeHKeVkenJf6teF/GhlapztPkY5PusghhGhMu4KmBbG/6+LB3IwPJhpsNiLIjZjhXBAzSsJuYpJcQ8UPx9+8udlTN1K11+aHw9yXhF6aa3hV1zlpwaPIXd0n+l+qJxGF5A4BQ1oq5mLZXUwAlsIQvvK29FQtw5lB43ijmc8wW/btOexGBxC3nHppZew+ljyCOWbWR3cFpy2N/FIqPVuaEuDBXgGGgZoPYLSmgDpYOts1ZV3FZxXmKhOliQGXuRXwoNTA/d4gDWpNik4CKjPLZmEIGtWvxrcU3dGNv3yxVDoK2IBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjoqvSVRSR9NDC874BgKN3oOL36ifj5ne8qhLOku9b0=;
 b=cDniG10Xnn2uEoch2o5uGDXtJIto8byDK6SLs/iyIcjQoXZwrGRlbGmwLh0kQrnLM01TxRDCUxdITWwkX0MFpCsFKjk4ZW9QTsoFwLpnWNSqXfuppqpAxDdelAuspSwsEgn4cb1iRSN+5bDImOQ1sJYqkxE2NhrxBtMvHKnXIR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e724dd97-03fc-4136-9a53-94bbddce160f@amd.com>
Date: Tue, 21 May 2024 09:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
References: <20240321035706.165253-1-xin.wang2@amd.com>
 <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: ce45eb0e-7af5-4dd7-76fe-08dc796a4599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bE53c0Z4bWQrblNrdUhETm9EUXBCTzYrbnVubWdlWGdHSmpudUlsMzFBVXl1?=
 =?utf-8?B?bTl4RDByYXUvMUM3NnFUNWZhaDRjMDRVWEw2eUdsL1VkM3lWenhzY3pWNGtK?=
 =?utf-8?B?OThpQU53THZGK1ZtMUM5cm55S1YwOG1sQnBleDBQUXVxNTNFNHNtVkZpTVdL?=
 =?utf-8?B?eFpMc0ZJR0p5R3NVUXNGbkpsV1hHOExUTVlVeE5kVnRVbThYS0tJeVpkVFNC?=
 =?utf-8?B?YzgwWTBTbGszUmRpTmNMZ3Zjc1Q2U3JJY3VaODYxeHM5ZDVHZlYvaWsxY3Bm?=
 =?utf-8?B?WHpma2RIZXo3NmlsNEo1YWtHT29FMmYxQWdRU0Yxb09rYkJaWUtvaEI2SnA1?=
 =?utf-8?B?cm8wVHNaTXpRb09nKzgwYVZVOXZvL05aTWc4UFh2bVVSdVBpTmVFRm13cG5C?=
 =?utf-8?B?bFNjbjRmL0l1M0hySGJnVHRDeklBNzZkWW9wSVRIM0FVbi9xVFVuckY5RFda?=
 =?utf-8?B?ZENSMEp5S2QyZXBRTXREWjdhTjM3eWl4SlhtbFJxYzRicHJJYUlGQzE3TmRK?=
 =?utf-8?B?WWVHNHEwRUZ4ZmZCc2ZacDJaZ2Q0dmROS0NkOGRVenZXQUQwRkVlRnVUTFdQ?=
 =?utf-8?B?OFRsR3hReGJDMGNvQmdZWCtIWjlYdzVoQ0tEMTUvZDdkSHNONVA5UVh5VzRl?=
 =?utf-8?B?ZlhvcDFaeHVjTms3MGtpT2M2U0VDQmtmR05jNGIwemlmdzQ0Y2dEVktvYXE2?=
 =?utf-8?B?QVRaQWNDSWdoYktvYzZYTFYrUiswN3I5c2hDNUttOEc2elJLQk5Pd1VscGRp?=
 =?utf-8?B?b2ZFcE5tRXR5QWtJSVVmV00xekdkZlBGRkhCQTVTVE5QVTd3a2owMzRkdFRi?=
 =?utf-8?B?c1hWcXREdXNicFpXZkg4SWpCQTRIRVoyMHN4SjJabWQvU0xDbDFySEV4SVE5?=
 =?utf-8?B?YjZic0pqbzQ5cklTQk5Ma201ZFV0YlhjdHZZWElTZVBtRjZFWi9vOUYvRCsv?=
 =?utf-8?B?TkxYRkZkQmpBeWt4QkxCVk13WUpEU3VKSDVWZU1McnFCZW1KZEZPejZ2enh0?=
 =?utf-8?B?SEhxVDF3elZUT2dIS2pZL1pVbkMraSs5L0RISTJMTUVXbStLUi9aalprd3Bn?=
 =?utf-8?B?ZWdPTzlHNVhpaGo1L2N2NXI3RXdTMzZPRHg0bE9vSWoxMkp1a0dkU2owZkVh?=
 =?utf-8?B?dHVUaGJxS0tuSVpTMUFXTUJnUHY4SDVEa0VNaHREaFhsZlZ2aGFLTkFwVHZy?=
 =?utf-8?B?YTdubEFWWkh5RXd1YUgrS2JWMkxJdnF1OFVKb3dTNkZNTGE2ck5qTmF6WXZ1?=
 =?utf-8?B?Q2tFZnBzSjlsWTBlTURta2lTOFBHYytiM21qUFJRZGhnTWVsV05xZkdkTmxh?=
 =?utf-8?B?N0w5TGo3Zzl0TkczTnZKdnBZeUIybklTUkd2NWN5cW1CNHV4UCtjRmZvcHoy?=
 =?utf-8?B?N1cvZG9uVTArZzluNlFnZ21kdXZOak1pUitWOGNYNjNaakZDYjYwcWtGNG15?=
 =?utf-8?B?YndEa25JdlpuRzVodzQ3Vm1rVUplWmowL2ZnWXArSHhySUxQVEwrMVRrbGlB?=
 =?utf-8?B?MU9iSjV2UjZZL0R1Uy8vUnBDQ0V1Y1VLbDE5anhqanp2enJqVGRxbXFVWlli?=
 =?utf-8?B?a3Z6NHZidElYK0k5SG1OcFZLSzhmRWJ4enlLK1lQaVh6ZEhwSEcybUVVNlhO?=
 =?utf-8?B?WGRTZXJ5K3lmaWNwYTZubFJQdWYzcEZydUtTK0RyeU55L1FxeU5jVnpjTFVq?=
 =?utf-8?B?V1BsTGlTazdZTmd5VnIvQ21NVnRkOFBSNkRTMy8yZnRob1RHRk1YckNxaFYv?=
 =?utf-8?B?SGZhbUNGYWJMQW9IZVdoSW1xRjk2a3E0bkczYVNwRWU0dU1CT2lKZGNyK2x3?=
 =?utf-8?B?QTVVcVVYYnhXWXl5S2NnYU1pdkxMM3hXOFlSSFdlQ3dOK0pyN0NtSEcwdmxI?=
 =?utf-8?Q?MjyXhqbBmVyk0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 07:47:32.0478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce45eb0e-7af5-4dd7-76fe-08dc796a4599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

Hi Henry.

On 20/05/2024 04:57, Henry Wang wrote:
> Hi All,
> 
> Gentle ping since it has been a couple of months, any comments on this 
> updated patch? Thanks!
Sorry for the late reply.

> 
> Kind regards,
> Henry
> 
> On 3/21/2024 11:57 AM, Henry Wang wrote:
>> In the common sysctl command XEN_SYSCTL_physinfo, the value of
>> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
>> Currently on Arm this is a fixed value 1 (can be checked via xl info),
>> which is not correct. This is because during the Arm CPU online
>> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
>> cpu_core_mask for itself.
>>
>> cores_per_socket refers to the number of cores that belong to the same
>> socket (NUMA node). Currently Xen on Arm does not support physical
>> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
>> cores_per_socket means all possible CPUs detected from the device
>> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
>> accordingly. Modify the in-code comment which seems to be outdated. Add
>> a warning to users if Xen is running on processors with multithread
>> support.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

>> ---
>> v3:
>> - Use cpumask_copy() to set cpu_core_mask and drop the unnecessary
>>    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu)).
>> - In-code comment adjustments.
>> - Add a warning for multithread.
>> v2:
>> - Do not do the multithread check.
>> ---
>>   xen/arch/arm/smpboot.c | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index a84e706d77..b6268be27a 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -66,7 +66,11 @@ static bool cpu_is_dead;
>>   
>>   /* ID of the PCPU we're running on */
>>   DEFINE_PER_CPU(unsigned int, cpu_id);
>> -/* XXX these seem awfully x86ish... */
>> +/*
>> + * Although multithread is part of the Arm spec, there are not many
>> + * processors support multithread and current Xen on Arm assumes there
NIT: s/support/supporting

>> + * is no multithread.
>> + */
>>   /* representing HT siblings of each logical CPU */
>>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>>   /* representing HT and core siblings of each logical CPU */
>> @@ -85,9 +89,13 @@ static int setup_cpu_sibling_map(int cpu)
>>            !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>>           return -ENOMEM;
>>   
>> -    /* A CPU is a sibling with itself and is always on its own core. */
>> +    /*
>> +     * Currently we assume there is no multithread and NUMA, so
>> +     * a CPU is a sibling with itself, and the all possible CPUs
>> +     * are supposed to belong to the same socket (NUMA node).
>> +     */
>>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>> -    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>> +    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
>>   
>>       return 0;
>>   }
>> @@ -277,6 +285,10 @@ void __init smp_init_cpus(void)
>>           warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
>>                       "It has implications on the security and stability of the system,\n"
>>                       "unless the cpu affinity of all domains is specified.\n");
>> +
>> +    if ( system_cpuinfo.mpidr.mt == 1 )
>> +        warning_add("WARNING: MULTITHREADING HAS BEEN DETECTED ON THE PROCESSOR.\n"
>> +                    "It might impact the security of the system.\n");
>>   }
>>   
>>   unsigned int __init smp_get_max_cpus(void)
> 

~Michal

