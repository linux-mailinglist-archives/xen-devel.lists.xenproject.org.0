Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2DB3AF9F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 02:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100365.1453890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urn53-0004NI-Au; Fri, 29 Aug 2025 00:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100365.1453890; Fri, 29 Aug 2025 00:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urn53-0004L9-6j; Fri, 29 Aug 2025 00:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1100365;
 Fri, 29 Aug 2025 00:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvxM=3J=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urn51-0004KA-CF
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 00:34:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc4ebcef-846f-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 02:34:56 +0200 (CEST)
Received: from CH2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:59::26)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 29 Aug
 2025 00:34:45 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::72) by CH2PR03CA0016.outlook.office365.com
 (2603:10b6:610:59::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Fri,
 29 Aug 2025 00:34:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 29 Aug 2025 00:34:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 19:34:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 17:34:43 -0700
Received: from [172.20.7.230] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 19:34:43 -0500
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
X-Inumbo-ID: fc4ebcef-846f-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/UsiVScbqBwMZ3UV94LWfFfkJw2tS87u0RpxVvAZruGm6F1WjmB5aQY/Mzy0DAIls3PN8FDYNx0J0j/bk030EI1lUfHTEnyU3O4UOw9IZJNNvWEju00u1DilqHFtfp6GkI7U/KWUhydX5IKGRg1t3yn9ICBjo4UhBKEccxKU9YhHmob6iYrfKqNa+oYQ58BZpNzgAs5qgIypDJSmUzM76yk3npw5l0kUVE3cIDUmVMPDqem+HCxVZ6ROMC72KFfpepM5WBSqEt20YWeGmcU9nOrc0PXieyPcWTg1DjS9cnz8dJz8maLSZ7td3GdAQ3zVk9iBY1xzmjSBLXIa7jXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5P/OIV1Mu2m8i8MotRwtiup+diwZBukIvCwWF6rsjM=;
 b=uMdMJVTB+ZCwqW5tu4v7hwDnbHkyaKm1+NasDfjkEJ0Cn09UKF8t5S5gq53t4ACi9ZW+l1dijnOnRaFo9U3wP19aMo4LZmBbjTB7+Qp9aAv2jnw+M3VI0y+H1bKK1x+6UXEmenzub4w16pnQLUKfmU9bPRjbTc4ur/4v3jrT6iYBZUMLhALruneBAKId1/ifqhpzpMvlbDnyiMpaHvld7BMaxv8XiCnmPXrC8H/zpCzHgueMgX6EKkLvbhtlHLqFzyO2Wv8lkz1P//ec3OfksNziB5sGZFwgeCNsibJGfK2n7z36faTR9giodaT3s7kcp+vE8Y1g8OljCr5QQWkXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5P/OIV1Mu2m8i8MotRwtiup+diwZBukIvCwWF6rsjM=;
 b=hOEdv1BfnG8JGf2uzkEHDnnFef1oVqAZJauwwcTvj8frf4BNREOyNEZJYC3fLYtU1BGAvOwHJnYt+Btw6xJyqTdaEo+tgfwyGyIcIQrBbecEV4aWQ2fATA8bjU2WT7QJBkSs8E+Cl8AaERGAraZ8HrkcuJ7E/ONvHTPhoCxcMuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <24474024-0542-48e5-a1b8-bb534c7eeb4b@amd.com>
Date: Thu, 28 Aug 2025 20:16:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
 <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 058e924a-a394-4609-36e6-08dde693d9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXJScFhzSVFPSEZGN01VVEVrczFCQlc0d1ZVenhtTHl0dyt0dm1UclcwTXlG?=
 =?utf-8?B?aWJnL1Z3cHNieVhtckJWVEE0dnJTaFhtbzRLbXhxOTVBdFc1amhOUjArVXFI?=
 =?utf-8?B?dVJ0RVk1RVhBcEwxOWZxM0hIa1k5bXlIeGNkODhSbVJTdjdWaEdCZ3FhQXVy?=
 =?utf-8?B?OW1lbDF2RnBTKzVzOTI1RGpMaDFNcEtEZ21ZUUVNa2F3OS9wcXZMcHp5N1JU?=
 =?utf-8?B?YWgvdnRpV0VzaHFqc2hoVTdpSE45QnpuVkIrS1BuMmlNZDM2VWpqUHA0eUJO?=
 =?utf-8?B?TkFMcUhPZk5NV2pwRWpObzBxcFcwNTNSamNVUm55OUtnQ1ROK3hyUkgySGZ2?=
 =?utf-8?B?VEx3bHJxa3NuQ0c3NzEzelBOOFlmVDZLeHJibTNzdEhnY1NzZThLdnBLcUtZ?=
 =?utf-8?B?c0NhSFNKa3dGK0VJb2gwYmVtTmFMN01rb3I3NmVMT2IyN3RDcHV2MERzNTEz?=
 =?utf-8?B?UTU1ZzJzaVI3RllGeHowenJHWDZseWVHOWovZUN1L1o1VVgwM0k3eElzbldM?=
 =?utf-8?B?R3hKcWRZa2Z2UmluRDVoaHlGbWZVWUZzZGwxU25GNXI5aHRSVVVOcG9BZlNQ?=
 =?utf-8?B?eHhMWlZVWU1ITFVOazFNNnVqMjIrRkF2dHdTdU50ZWNuTzBxK1VNbWdDZzc1?=
 =?utf-8?B?RkgwVEk5eXp1Qk9LcDR1d21iMjlrQlhrUTRrRHhnTU5KTCtMSEwvVTVPS3o3?=
 =?utf-8?B?ZTBORjlCdjZGRGk3NFZnOTBKczJsN0hHSFY4UE1ZNTJVcVUwclBIYVU5Q3VL?=
 =?utf-8?B?L0Y3amJoTDBjVzJtV0ErUFcycVdhZFgyQldkZjZSS1k2dUNBcytnRkYwRFZm?=
 =?utf-8?B?UWlGSnVKWElsbnpWdTNoSVl4MVkzRVFhdWRiaGhMaDhQVHF2MjRWbzlxTEtt?=
 =?utf-8?B?RFVKK0E0SDdNc0VQUENEQWxVUWVHd1hLeUNtRVR5WldJMkxjL2d5bnlDelpn?=
 =?utf-8?B?bkdhYzBGWFBQZWMvTmgyVFhSeVNlS1c5YlhsNkZGclpuLzkzVXVHL1Z1elIx?=
 =?utf-8?B?SFc5WktIVFJjZ25KMHVXUjFMMC9QUlk4dlhydUZ4aEVmVC84MlNEb3RDVEMv?=
 =?utf-8?B?N3V1bk9mWC9VakNwU1haRDZMK0N0VTkzVEhJRzdFbE9WaGZmMGgzc1RSMDcv?=
 =?utf-8?B?OEMra0NUK05rNFhmR2dESWdwUGR1dmtxeWVFUVMyOWtjZitNRkVJVlc1b0F2?=
 =?utf-8?B?OXRJQjUrN0NaK0NNMVRLdW9hbUNoNVBXRW9GMHh2Z0MwbDkvL3dlQ0ZBTzZa?=
 =?utf-8?B?bmF2cCsxUmEyUGdBTU95OEdaRDNzdmlUTWIwUXpIdGlmUWVwYkorNXNQeGxr?=
 =?utf-8?B?RXpObXFCQjhGNmwvRWEyMFBRbWVEQTlmR25ONHBuMXZPTHpJdEZUWDhOYURj?=
 =?utf-8?B?WFo4UmJOV2Fpc2hMTlltcDl6a3Z6VkI2Slh6UnYwV1p4NGxpaGh0WHh5Q05w?=
 =?utf-8?B?UkZSL3VaaTJ4UytLRjhkclRkeHJuckk3cENIanYveDJjbW1VMDhnUm8ybHBX?=
 =?utf-8?B?cUs0SkdMQm5yRUtTMkw3Uk43TDdYMnBBZng0RzA1R2pHQnp2UkxrOHZQeEFJ?=
 =?utf-8?B?N0ZjcHNZSFRlNDF5bVQzemRDTzI0SU1iaUZyQ3BNL040bCtVL08zNlEwZ1JM?=
 =?utf-8?B?b1JpYXRvNnAzOGlnTTYvc1pOZlRRckxNYXdaYXd0empMalI3UnhqN3ZrMlNV?=
 =?utf-8?B?QkF3dUhTYnAvYnJlY0R4NzduSTJaUDl1VGI5NE5yYk5sSE4rS1k2UWVTT2xX?=
 =?utf-8?B?NGlpSW9xZVR4VnE3K1JORUc3V2wzWlBhcHZIMVI3OHc1bHY5a1dmRHpPcTFu?=
 =?utf-8?B?emdtTmNzTEcrZmFSeGpXaUYyei96eGhrQ1dHV2tVTGF1aE5rMUNzYm9IOGhG?=
 =?utf-8?B?OGt6QTRDa1A3c2dnSDlsSG9JODYxUjFCZ2xQeWo3cmtQWlJCWXNNK2N0ZmtV?=
 =?utf-8?B?NURsdkc2RFZRZkVuMlBBSWw2eGp3dDkrTFRJWkVJUHNUNlNpeGtTS3FtTXBs?=
 =?utf-8?B?b3BKUEt1eWI5UG1JTmI4RDZ2VWVNdTRPZ0c2NU1IMWpReDUrVTlHL1IwWWwy?=
 =?utf-8?Q?FIE3hZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:34:44.6586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 058e924a-a394-4609-36e6-08dde693d9ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

On 2025-08-28 07:22, Jan Beulich wrote:
> On 28.08.2025 12:03, Penny Zheng wrote:
>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>> +                                            unsigned int target_freq,
>> +                                            unsigned int relation)
>> +{
>> +    unsigned int cpu = policy->cpu;
>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> 
> I fear there's a problem here that I so far overlooked. As it happens, just
> yesterday I made a patch to eliminate cpufreq_drv_data[] global. In the
> course of doing so it became clear that in principle the CPU denoted by
> policy->cpu can be offline. Hence its per-CPU data is also unavailable. See
> cpufreq_add_cpu()'s invocation of .init() and cpufreq_del_cpu()'s invocation
> of .exit(). Is there anything well-hidden (and likely lacking some suitable
> comment) which guarantees that no two CPUs (threads) will be in the same
> domain? If not, I fear you simply can't use per-CPU data here.

Sorry, I'm confused by your use of "domain" here.  Do you mean a 
per_cpu(..., policy->cpu) access racing with a cpu offline?  I'm not 
away of anything preventing that, though I'm not particularly familiar 
with it.

do_pm_op() has:
     if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];

and do_get_pm_info() has:
     if ( !op || (op->cpuid >= nr_cpu_ids) || !cpu_online(op->cpuid) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];

But those are only at entry.

Regards,
Jason

> Since initially I was thinking of using per-CPU data also in my patch, I'm
> reproducing this in raw form below, for your reference. It's generally only
> 4.22 material now, of course. Yet in turn for your driver the new drv_data
> field may want to become a union, with an "acpi" and a "cppc" sub-struct.
> And possibly a "hwp" one: Jason, looks like the HWP driver has a similar
> issue (unless again something guarantees that no two CPUs / threads will
> be in the same domain).
> 
> Jan
> 
> cpufreq: eliminate cpufreq_drv_data[]
> 
> Possibly many slots of it may be unused (all of them when the HWP or CPPC
> drivers are in use), as it's always strictly associated with the CPU
> recorded in a policy (irrespective of that CPU intermediately being taken
> offline). It is shared by all CPUs sharing a policy. We could therefore
> put the respective pointers in struct cpufreq_policy, but even that level
> of indirection is pointless. Embed the driver data structure directly in
> the policy one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/acpi/cpufreq/acpi.c
> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
> @@ -174,17 +174,18 @@ static u32 get_cur_val(const cpumask_t *
>           return 0;
>   
>       policy = per_cpu(cpufreq_cpu_policy, cpu);
> -    if (!policy || !cpufreq_drv_data[policy->cpu])
> +    if ( !policy )
>           return 0;
>   
> -    switch (cpufreq_drv_data[policy->cpu]->arch_cpu_flags) {
> +    switch ( policy->drv_data.arch_cpu_flags )
> +    {
>       case SYSTEM_INTEL_MSR_CAPABLE:
>           cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
>           cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
>           break;
>       case SYSTEM_IO_CAPABLE:
>           cmd.type = SYSTEM_IO_CAPABLE;
> -        perf = cpufreq_drv_data[policy->cpu]->acpi_data;
> +        perf = policy->drv_data.acpi_data;
>           cmd.addr.io.port = perf->control_register.address;
>           cmd.addr.io.bit_width = perf->control_register.bit_width;
>           break;
> @@ -210,9 +211,8 @@ static unsigned int cf_check get_cur_fre
>       if (!policy)
>           return 0;
>   
> -    data = cpufreq_drv_data[policy->cpu];
> -    if (unlikely(data == NULL ||
> -        data->acpi_data == NULL || data->freq_table == NULL))
> +    data = &policy->drv_data;
> +    if ( !data->acpi_data || !data->freq_table )
>           return 0;
>   
>       return extract_freq(get_cur_val(cpumask_of(cpu)), data);
> @@ -255,7 +255,7 @@ static int cf_check acpi_cpufreq_target(
>       struct cpufreq_policy *policy,
>       unsigned int target_freq, unsigned int relation)
>   {
> -    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
> +    struct acpi_cpufreq_data *data = &policy->drv_data;
>       struct processor_performance *perf;
>       struct cpufreq_freqs freqs;
>       cpumask_t online_policy_cpus;
> @@ -265,10 +265,8 @@ static int cf_check acpi_cpufreq_target(
>       unsigned int j;
>       int result = 0;
>   
> -    if (unlikely(data == NULL ||
> -        data->acpi_data == NULL || data->freq_table == NULL)) {
> +    if ( !data->acpi_data || !data->freq_table )
>           return -ENODEV;
> -    }
>   
>       if (policy->turbo == CPUFREQ_TURBO_DISABLED)
>           if (target_freq > policy->cpuinfo.second_max_freq)
> @@ -334,11 +332,9 @@ static int cf_check acpi_cpufreq_target(
>   
>   static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
>   {
> -    struct acpi_cpufreq_data *data;
>       struct processor_performance *perf;
>   
> -    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
> -        !processor_pminfo[policy->cpu])
> +    if ( !policy || !processor_pminfo[policy->cpu] )
>           return -EINVAL;
>   
>       perf = &processor_pminfo[policy->cpu]->perf;
> @@ -346,7 +342,7 @@ static int cf_check acpi_cpufreq_verify(
>       cpufreq_verify_within_limits(policy, 0,
>           perf->states[perf->platform_limit].core_frequency * 1000);
>   
> -    return cpufreq_frequency_table_verify(policy, data->freq_table);
> +    return cpufreq_frequency_table_verify(policy, policy->drv_data.freq_table);
>   }
>   
>   static unsigned long
> @@ -382,17 +378,11 @@ static int cf_check acpi_cpufreq_cpu_ini
>       unsigned int i;
>       unsigned int valid_states = 0;
>       unsigned int cpu = policy->cpu;
> -    struct acpi_cpufreq_data *data;
> +    struct acpi_cpufreq_data *data = &policy->drv_data;
>       unsigned int result = 0;
>       struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
>       struct processor_performance *perf;
>   
> -    data = xzalloc(struct acpi_cpufreq_data);
> -    if (!data)
> -        return -ENOMEM;
> -
> -    cpufreq_drv_data[cpu] = data;
> -
>       data->acpi_data = &processor_pminfo[cpu]->perf;
>   
>       perf = data->acpi_data;
> @@ -409,23 +399,18 @@ static int cf_check acpi_cpufreq_cpu_ini
>           if (cpufreq_verbose)
>               printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
>                      "HARDWARE addr space\n");
> -        if (!cpu_has(c, X86_FEATURE_EIST)) {
> -            result = -ENODEV;
> -            goto err_unreg;
> -        }
> +        if ( !cpu_has(c, X86_FEATURE_EIST) )
> +            return -ENODEV;
>           data->arch_cpu_flags = SYSTEM_INTEL_MSR_CAPABLE;
>           break;
>       default:
> -        result = -ENODEV;
> -        goto err_unreg;
> +        return -ENODEV;
>       }
>   
>       data->freq_table = xmalloc_array(struct cpufreq_frequency_table,
>                                       (perf->state_count+1));
> -    if (!data->freq_table) {
> -        result = -ENOMEM;
> -        goto err_unreg;
> -    }
> +    if ( !data->freq_table )
> +        return -ENOMEM;
>   
>       /* detect transition latency */
>       policy->cpuinfo.transition_latency = 0;
> @@ -483,23 +468,14 @@ static int cf_check acpi_cpufreq_cpu_ini
>       return result;
>   
>   err_freqfree:
> -    xfree(data->freq_table);
> -err_unreg:
> -    xfree(data);
> -    cpufreq_drv_data[cpu] = NULL;
> +    XFREE(data->freq_table);
>   
>       return result;
>   }
>   
>   static int cf_check acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>   {
> -    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
> -
> -    if (data) {
> -        cpufreq_drv_data[policy->cpu] = NULL;
> -        xfree(data->freq_table);
> -        xfree(data);
> -    }
> +    XFREE(policy->drv_data.freq_table);
>   
>       return 0;
>   }
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -35,8 +35,6 @@
>   
>   #include <acpi/cpufreq/cpufreq.h>
>   
> -struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
> -
>   struct perf_pair {
>       union {
>           struct {
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -84,16 +84,14 @@ static int cf_check powernow_cpufreq_tar
>       struct cpufreq_policy *policy,
>       unsigned int target_freq, unsigned int relation)
>   {
> -    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
> +    struct acpi_cpufreq_data *data = &policy->drv_data;
>       struct processor_performance *perf;
>       unsigned int next_state; /* Index into freq_table */
>       unsigned int next_perf_state; /* Index into perf table */
>       int result;
>   
> -    if (unlikely(data == NULL ||
> -        data->acpi_data == NULL || data->freq_table == NULL)) {
> +    if ( !data->acpi_data || !data->freq_table )
>           return -ENODEV;
> -    }
>   
>       perf = data->acpi_data;
>       result = cpufreq_frequency_table_target(policy,
> @@ -185,11 +183,9 @@ static void cf_check get_cpu_data(void *
>   
>   static int cf_check powernow_cpufreq_verify(struct cpufreq_policy *policy)
>   {
> -    struct acpi_cpufreq_data *data;
>       struct processor_performance *perf;
>   
> -    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
> -        !processor_pminfo[policy->cpu])
> +    if ( !policy || !processor_pminfo[policy->cpu] )
>           return -EINVAL;
>   
>       perf = &processor_pminfo[policy->cpu]->perf;
> @@ -197,7 +193,7 @@ static int cf_check powernow_cpufreq_ver
>       cpufreq_verify_within_limits(policy, 0,
>           perf->states[perf->platform_limit].core_frequency * 1000);
>   
> -    return cpufreq_frequency_table_verify(policy, data->freq_table);
> +    return cpufreq_frequency_table_verify(policy, policy->drv_data.freq_table);
>   }
>   
>   static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
> @@ -205,18 +201,12 @@ static int cf_check powernow_cpufreq_cpu
>       unsigned int i;
>       unsigned int valid_states = 0;
>       unsigned int cpu = policy->cpu;
> -    struct acpi_cpufreq_data *data;
> +    struct acpi_cpufreq_data *data = &policy->drv_data;
>       unsigned int result = 0;
>       struct processor_performance *perf;
>       struct amd_cpu_data info;
>       struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
>   
> -    data = xzalloc(struct acpi_cpufreq_data);
> -    if (!data)
> -        return -ENOMEM;
> -
> -    cpufreq_drv_data[cpu] = data;
> -
>       data->acpi_data = &processor_pminfo[cpu]->perf;
>   
>       info.perf = perf = data->acpi_data;
> @@ -228,8 +218,7 @@ static int cf_check powernow_cpufreq_cpu
>           if (cpumask_weight(policy->cpus) != 1) {
>               printk(XENLOG_WARNING "Unsupported sharing type %d (%u CPUs)\n",
>                      policy->shared_type, cpumask_weight(policy->cpus));
> -            result = -ENODEV;
> -            goto err_unreg;
> +            return -ENODEV;
>           }
>       } else {
>           cpumask_copy(policy->cpus, cpumask_of(cpu));
> @@ -238,21 +227,16 @@ static int cf_check powernow_cpufreq_cpu
>       /* capability check */
>       if (perf->state_count <= 1) {
>           printk("No P-States\n");
> -        result = -ENODEV;
> -        goto err_unreg;
> +        return -ENODEV;
>       }
>   
> -    if (perf->control_register.space_id != perf->status_register.space_id) {
> -        result = -ENODEV;
> -        goto err_unreg;
> -    }
> +    if ( perf->control_register.space_id != perf->status_register.space_id )
> +        return -ENODEV;
>   
>       data->freq_table = xmalloc_array(struct cpufreq_frequency_table,
>                                       (perf->state_count+1));
> -    if (!data->freq_table) {
> -        result = -ENOMEM;
> -        goto err_unreg;
> -    }
> +    if ( !data->freq_table )
> +        return -ENOMEM;
>   
>       /* detect transition latency */
>       policy->cpuinfo.transition_latency = 0;
> @@ -298,23 +282,14 @@ static int cf_check powernow_cpufreq_cpu
>       return result;
>   
>   err_freqfree:
> -    xfree(data->freq_table);
> -err_unreg:
> -    xfree(data);
> -    cpufreq_drv_data[cpu] = NULL;
> +    XFREE(data->freq_table);
>   
>       return result;
>   }
>   
>   static int cf_check powernow_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>   {
> -    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
> -
> -    if (data) {
> -        cpufreq_drv_data[policy->cpu] = NULL;
> -        xfree(data->freq_table);
> -        xfree(data);
> -    }
> +    XFREE(policy->drv_data.freq_table);
>   
>       return 0;
>   }
> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -37,8 +37,6 @@ struct acpi_cpufreq_data {
>       unsigned int arch_cpu_flags;
>   };
>   
> -extern struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
> -
>   struct cpufreq_cpuinfo {
>       unsigned int        max_freq;
>       unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
> @@ -80,6 +78,8 @@ struct cpufreq_policy {
>       int8_t              turbo;  /* tristate flag: 0 for unsupported
>                                    * -1 for disable, 1 for enabled
>                                    * See CPUFREQ_TURBO_* below for defines */
> +
> +    struct acpi_cpufreq_data drv_data;
>   };
>   DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
>   
> 


