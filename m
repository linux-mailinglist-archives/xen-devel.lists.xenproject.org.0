Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903D9E2EB2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 23:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848209.1263171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIb55-0003aX-Ad; Tue, 03 Dec 2024 22:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848209.1263171; Tue, 03 Dec 2024 22:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIb55-0003Xr-7V; Tue, 03 Dec 2024 22:09:19 +0000
Received: by outflank-mailman (input) for mailman id 848209;
 Tue, 03 Dec 2024 22:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BnMR=S4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIb54-0003Xl-DW
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 22:09:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c1196ab-b1c3-11ef-a0d4-8be0dac302b0;
 Tue, 03 Dec 2024 23:09:17 +0100 (CET)
Received: from PH8PR15CA0015.namprd15.prod.outlook.com (2603:10b6:510:2d2::23)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 22:09:07 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::3b) by PH8PR15CA0015.outlook.office365.com
 (2603:10b6:510:2d2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 22:09:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:09:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 16:09:06 -0600
Received: from [172.25.146.163] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Dec 2024 16:09:05 -0600
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
X-Inumbo-ID: 3c1196ab-b1c3-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKmvV20VX8DAfak48q+YIKCysb5CeU+xNa4IPzuEqDsMFjZE5xyKG9CxhIuOcNvjGKi1i6FBOAnCPBPrenfk5UhnFaqio3NfcNNVWj5KkKwov3wdzCuhCQamjHV/9g8slf0Ahx9JfYlfqvvRm+/PagzpZ7C/ubOzunVJqn+p+Qv6jSgZbSJ1K6pyp7RgCKfisAzqaLhc2er8Nj/TMqNKRBOyw9Miz0KM2+17/JGcnx3qTPQI4mrYakL5GMft/vWaQumm0OVkGqpH836dfUyl3JNq1qK993OCJ0E3UaOl0fge7zFBUImL6WtrK0KjtmE1aw9TzbaVSflLzkWa944p6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9BW7P+K2nrEHfG3ECYMxja8KtSCfd9Yu4xjWNVvWx8=;
 b=D+Oh3n3qXeeGonR+BJcUnV0bj5UWhBG9H6Ox6v4PtQrOIT01a3vTa0deq7XMn0/hQ0jekhzMJ4oiGyTNNG4YDUW/Gz1qd0b7ddy+tJ8906LVeJXQOYNI87PKBFjxXqP76EEvkeeVCVuCXQDsQmQRB98WlUfodS3x73yS7NndhzP61xSBiYdHxERjDInlyb41z+wjG8K5GX0xK0CH4V/8FrZNReorCMzZuJm7+NN8RTZ5BmPT0TjNgQfR0xJNH0Oem/RjnayDCSjaPFwrF4jBrggn8ozGcrZM++CTqXXJPEF6zX27nP9h3v9yrsLsV/AcWEpBjijMDFmh/QA1zhhLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9BW7P+K2nrEHfG3ECYMxja8KtSCfd9Yu4xjWNVvWx8=;
 b=iSSez8G3gQceRt+MxYlQM+Dfcxb2zAXFi1sweU1DR/PBgRSs/bVmqEEjuvVWKzpFWNISDf1u1PH7g5EA/LcnQtwJaDeNn+9usj1oPS4JtIPeEKi+kruIw/uCcdnaXtkaXeHyd2aFsHVHf2UsUv63HG1DpRlXyzlX//yTNHI4FoI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5c76ebcb-baf2-4a63-b9d9-bd498f417202@amd.com>
Date: Tue, 3 Dec 2024 17:09:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/acpi: upload power and performance related data
 from a PVH dom0
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20240916205009.52887-1-jason.andryuk@amd.com>
 <52a2b2f3-ecdc-45fa-afcf-c4d6e2b1dd0c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <52a2b2f3-ecdc-45fa-afcf-c4d6e2b1dd0c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b45f19-4cdf-4ba4-c5c5-08dd13e71b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckR4blNQclYySWE5MHJoVDNvQjBzalh2TkdIUnM1eng3L3BIemMvZXFWT2Qw?=
 =?utf-8?B?b0RIazQ2TmpyUlBHQThZcEFjU2V0aWlLWmFvUWo5bDYwbzZSSzJsLzQwbkcw?=
 =?utf-8?B?RUJRbXFCc1poVkFOZ2RreGF5bFh0REdLYzFlYSs5K214UjBGWmNqRnVyUHNR?=
 =?utf-8?B?eGsxemo2ZE9zVlh0TWNnZW5DMzJRTlNhMlAvSjhKYUVhbE85ZWdNSHdpdkFP?=
 =?utf-8?B?dkkyYWxGYnNEYUc2SHVaV2ZrT3E5MGFpSkJMY1pkVlc3VTlLNGhRWnFLMnNN?=
 =?utf-8?B?S2tLeWR6UHJ2YXZXckR5TW1KOHRBeUdQSnpCVHl6MHdLdFBpV0p6b2xBTjBo?=
 =?utf-8?B?VjMxU1dQTjI5dDFLMW1pZ2wza2tHODZrc3dmTlJQZVJrTzg3Rm1LR0txUW9C?=
 =?utf-8?B?Q1QvYzBDOHdUL25aOEVyS29haWQ3ZG1mVHRGNlJncjE4anZFejJ0WnFvS3RD?=
 =?utf-8?B?TjZxT0JKaEpJQlYySm1zamlQRzhRK0luWmo3RmRSUGlBSktTWnNmWTdEZlVN?=
 =?utf-8?B?VTcyWkJpQVpBZ2RwQUNDWWowemUvdERCNDE1elJZclhsNC9JbGFlWWliQmw3?=
 =?utf-8?B?Q0ZCbmFETFdDZFlPakdmY2JDQTVSK0JsUGJLbjRGYnVXT2JQSmd2K0s2UUR2?=
 =?utf-8?B?QUlqcFFtYkVHWFJCYTJhcGhnYlo3OVJyMld4ZVhKNjFFL2dPQ013UkZaS1hB?=
 =?utf-8?B?ZkZ2bkpLVEIzc0VPaDZWUWRLbVd0N1Rjd05Jam1IOW9jOGV1YVNuamtyZTRQ?=
 =?utf-8?B?dlNNbFR5Qy9GVXh2RE52Mnl4OXZ6Q0dkUHZwVVlPQnA1dVRHdE90WnNSVjhC?=
 =?utf-8?B?QmlNNHlZZFRoY3VuMTB6SDRPQTNRVzZwVmNjVVFuNTBOalBCNmJyOXpzK28v?=
 =?utf-8?B?UE41NHpkSXpScVlNQkFId3Z3NWNGTUJaRUNSNGN3WHY4VzlrajcvM1hYWDZH?=
 =?utf-8?B?MmxoZ2ZpUmh5cGJZQWIyVkw3NnhDZFVjTFVLS0Q2Vko3L1k4cVJFR2R3Mnhj?=
 =?utf-8?B?MVh6LzhuWksrWWpyaHV4dmttRjg4ZTg4UVJKUFFSR2FuREVZNjlqRnh5dS84?=
 =?utf-8?B?cldWc3hQS0dXZEtiMmhxbDVXaW1uUnFzRmJpTkRWUGNybnI3dEoyWHp6ZGM5?=
 =?utf-8?B?L2cxMkExb1lpZTIwQUdQT0hPOTlKcDk0ekg5ajFZYkR0QzdwZk1RYnZ6bFNG?=
 =?utf-8?B?NnVIdXViUlJCVm9wUzRxVzhSajdTWlU5WjRZWVFNZHV3bW1ZMmJSMzdxSGtu?=
 =?utf-8?B?Zk1OZEZLTTI5dUJEZ0h4TlR2R2trdEtPT2d6NnB5eGlHRm53K0JBS1BCOElG?=
 =?utf-8?B?MGEwdjE0blZua1hHLzNqckxGbWdxVHBSNUU0K2FkWjVpdk0zZUk1RWc1d2hP?=
 =?utf-8?B?V1o4RUdzM3NORXhKM0cxZ3dPL2FWa2ZHWUlWcGp6NDBlWlJ0U29JYVJ1Snls?=
 =?utf-8?B?dWZyaTZBVlVabVVmZmNQempCNVh5bmNZNVZ0dGFFK2VoMnBBenJRbWw0TVE1?=
 =?utf-8?B?U3pCdTV6RHBOTU03bk1MeW9pNk03aG96R2xsZXIvZ2VPOW02QWV4UjBDWnRX?=
 =?utf-8?B?M1JxSzVsL0VObDBza2RzZGdDWC9IZUN4QVMxMUFSYUh3NlF1Vkdpd1k4VVd1?=
 =?utf-8?B?blFKazBhUjh5T1VYT0RTdVlXMW9TQWVWQ1FTMzJ4bVAzRGRKQVNPQUV6Mjhn?=
 =?utf-8?B?bTF1d1RIdktKWFB5UEJOcWNLTUlleVF4bWFLWjFuOTFCTVBJbnJQeXZtMTNp?=
 =?utf-8?B?UTFIaHAwRkJLRVJNNWtjSVFsR2Zub09LQkEvdmtHMHdES3o4cE1QVStGYll3?=
 =?utf-8?B?NFlJNEVRM0ZlMFUxK0dXbDdPN0xEUlNlVU5VbmV4S0lBY0NKVWM4Mkc5bmxr?=
 =?utf-8?B?b3dlQWJEODZ3QVVKd3hnY2krQUdlNkJYWmhvUnA0VFVzbTR5Vm04SVpRT0tD?=
 =?utf-8?Q?blsOhaKsdlhaffRQBP9ihSK/mu5zFucK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:09:07.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b45f19-4cdf-4ba4-c5c5-08dd13e71b4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332

On 2024-09-25 05:17, Jürgen Groß wrote:
> On 16.09.24 22:50, Jason Andryuk wrote:
>> From: Roger Pau Monne <roger.pau@citrix.com>
>>
>> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
>> report the correct numbers of vCPUs that dom0 has, so the host MADT is
>> not provided to dom0.  This creates issues when parsing the power and
>> performance related data from ACPI dynamic tables, as the ACPI
>> Processor UIDs found on the dynamic code are likely to not match the
>> ones crafted by Xen in the dom0 MADT.
>>
>> Xen would rely on Linux having filled at least the power and
>> performance related data of the vCPUs on the system, and would clone
>> that information in order to setup the remaining pCPUs on the system
>> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
>> that none of dom0 CPUs will have the power and performance data
>> filled, and hence the Xen ACPI Processor driver needs to fetch that
>> information by itself.
>>
>> In order to do so correctly, introduce a new helper to fetch the _CST
>> data without taking into account the system capabilities from the
>> CPUID output, as the capabilities reported to dom0 in CPUID might be
>> different from the ones on the host.
>>
>> Note that the newly introduced code will only fetch the _CST, _PSS,
>> _PPC and _PCT from a single CPU, and clone that information for all the
>> other Processors.  This won't work on an heterogeneous system with
>> Processors having different power and performance related data between
>> them.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> v2:
>> Add second buffer for _CST.  Call was failing with
>> AE_BUFFER_OVERFLOW(0x000b)
>>
>> Running a PVH Dom0 on AMD, I needed this v2 change to get the C-State
>> information uploaded.
>>
>> ---
>>   drivers/xen/pcpu.c               |   3 +-
>>   drivers/xen/xen-acpi-processor.c | 230 ++++++++++++++++++++++++++++---
>>   include/xen/xen.h                |   2 +-
>>   3 files changed, 216 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
>> index c63f317e3df3..dc9f2c14bf62 100644
>> --- a/drivers/xen/pcpu.c
>> +++ b/drivers/xen/pcpu.c
> 
> ...
> 
>> @@ -354,24 +511,44 @@ read_acpi_id(acpi_handle handle, u32 lvl, void 
>> *context, void **rv)
>>       default:
>>           return AE_OK;
>>       }
>> -    if (invalid_phys_cpuid(acpi_get_phys_id(handle,
>> -                        acpi_type == ACPI_TYPE_DEVICE,
>> -                        acpi_id))) {
>> +
>> +    if (!xen_processor_present(acpi_id)) {
>>           pr_debug("CPU with ACPI ID %u is unavailable\n", acpi_id);
>>           return AE_OK;
>>       }
>> -    /* There are more ACPI Processor objects than in x2APIC or MADT.
>> -     * This can happen with incorrect ACPI SSDT declerations. */
>> -    if (acpi_id >= nr_acpi_bits) {
>> -        pr_debug("max acpi id %u, trying to set %u\n",
>> -             nr_acpi_bits - 1, acpi_id);
>> -        return AE_OK;
>> -    }
>> +
>>       /* OK, There is a ACPI Processor object */
>>       __set_bit(acpi_id, acpi_id_present);
>>       pr_debug("ACPI CPU%u w/ PBLK:0x%lx\n", acpi_id, (unsigned 
>> long)pblk);
>> +    if (!pr_initialized) {
>> +        struct acpi_processor *pr = context;
>> +        int rc;
>> +
>> +        /*
>> +         * There's no CPU on the system that has any performance or
>> +         * power related data, initialize all the required fields by
>> +         * fetching that info here.
>> +         *
>> +         * Note such information is only fetched once, and then reused
>> +         * for all pCPUs.  This won't work on heterogeneous systems
>> +         * with different Cx anb/or Px states between CPUs.
>> +         */
>> +
>> +        pr->handle = handle;
>> +
>> +        rc = acpi_processor_get_performance_info(pr);
>> +        if (rc)
>> +            pr_debug("ACPI CPU%u failed to get performance data\n",
>> +                 acpi_id);
> 
> Is it really normal to get a failure here? Shouldn't the reaction
> be a little bit more visible in this case?
> 
> And can you just continue processing?
> 
>> +        rc = xen_acpi_processor_evaluate_cst(handle, &pr->power);
>> +        if (rc)
>> +            pr_debug("ACPI CPU%u failed to get _CST data\n", acpi_id);
> 
> Same again. Is pr_debug() enough?

Thanks.  I'll switch them to pr_err().  And I'll only set pr_initialized 
= true when both calls succeed.

Regards,
Jason

