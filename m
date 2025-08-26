Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CCCB35D80
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 13:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094349.1449688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqs6S-0000HQ-FZ; Tue, 26 Aug 2025 11:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094349.1449688; Tue, 26 Aug 2025 11:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqs6S-0000FN-AZ; Tue, 26 Aug 2025 11:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1094349;
 Tue, 26 Aug 2025 11:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2Dh=3G=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uqs6R-0000FH-65
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 11:44:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a04aec7-8272-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 13:44:36 +0200 (CEST)
Received: from BY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:a03:167::23)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 11:44:33 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::c7) by BY5PR17CA0046.outlook.office365.com
 (2603:10b6:a03:167::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 11:44:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 11:44:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 06:44:31 -0500
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 06:44:30 -0500
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
X-Inumbo-ID: 0a04aec7-8272-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDSrGssuwwDkgZ38vASG0+RamwbmSQkxeOBAxqdgLbyeYUMLzkGRozg/xaqJ7Z+x6F0T1hyBpn86SfJyApT6LwyR5VgpVyfVK/l6edAr5Tw4nkU0DQJFTJiPb9OQUsCIXnTRTpGZbsobYtYMYjFYr1WRTuhMO5BOBqfAQHo+N+zPZN1ZTdJrYcLRDMmjZ26qqasHH1N+VbrXPo+5auJTA+g9HJcPGFFr88SOiP0ZHdiFjhBNFWvKT2unJxtK90l6ZkeDoKkhxlSqOgBVpB6coalRk4uDGqy5ekt3ELy2vS8xq5WcNZWLTqUZZB10JGYPP/NfllIHqq21B3cNySIWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmEeKHw5fF1VWFWzOMvaj1PJz9JBVKGw848DtlPqHt4=;
 b=H3jNQjDrSRtMATqRCmhxbQfDDZCwxx4Lx4QPbf5yeKJp6oFLyLYUYW/g6fNtLUjwbe/7WeNJn7/VMnQXA0C0WhnIbFUaPFaYV9lk+Tc00xWmhXkBwDhwe+UW1OixknztRDMY3aeuvhVaT3TsGmvfxjUefN8EYjIDkSsnltH3HXxgVcIkJcqgbxznUeKVuJB3UfY+PvBtzDbtsTB1qd+w+rsQoPLvKSwsXrbxUFe3D0KL/FacutkRkkFNw6qWCFslqNis3Rq2yvro1AWMGlFZkqSca5DM4VcpSTXBuUUuax9IBw4Y9g7eGvk6BNCHPCJp1I7zKHIpJymh9Mh2fm3XWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmEeKHw5fF1VWFWzOMvaj1PJz9JBVKGw848DtlPqHt4=;
 b=EKCSqeR/+s5S/p9j1eFdDYnvnqlu3tGm0zWcXc/fuA5WrGPfUD7Bvtq2d0l/A/Tqel9v3kRaKmHLWJEWedMBJgrDrLAtTaByBRKaTFA5VJyrFbTsnV9fABbk8LogJ+SHbZAXGelM33nrSGN4/j9GVuCy8asMNi1UsUx+wYJftOE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <474bffdc-f42e-4727-ab69-b11a67430adf@amd.com>
Date: Tue, 26 Aug 2025 13:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
To: Julien Grall <julien@xen.org>, Dmytro Firsov <Dmytro_Firsov@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
 <cff3e94c-4476-4103-ae7e-19656703e755@amd.com>
 <5d48d927-7e1e-4b11-b429-0b94259154ab@epam.com>
 <e0c2b06e-947a-4d1d-864f-5785cfe00b1c@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e0c2b06e-947a-4d1d-864f-5785cfe00b1c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 97260351-21b7-4651-212a-08dde495ec60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M05rcG9YTDl1cXBDTkdjN2JrM2Z2UFcwUy8yNmp2K25DRFNXczIzUGZqZ2VY?=
 =?utf-8?B?Z2VZRnBxSWorOGJZQWg1Q1pvRFZIOFhDNi92cjUvNnhOOHlDZVNEQjhCRjZR?=
 =?utf-8?B?d3oxeE0yR1U2Rkx3OHpYZnJKQnRNVUpqb1BIb2Q4dVBjQ0ZLQVhVVnFNNWhN?=
 =?utf-8?B?dDQ1VVhEV0w1KzI2WVpGLzFOK3RnRGt6WTRHRUVhN2xmZTdtOUEySGRhUDhu?=
 =?utf-8?B?K2cwdkNuVWx5cmhVKzBmcm9QYUFWM1M5OXZHVU5TRWNYaEt5THFYVzhtYnBa?=
 =?utf-8?B?M3k0cWFzU2VjSmx1YjdWTmQ3cy9Gd3FSYUw3VG8rdmh6RnBiaXVkTnNDWVBq?=
 =?utf-8?B?Y2hiUFVNTVYwZFZKaDNuZVZjdlpuWk5DRmJzS2MxQnFSdTFwZGpqeXVRc0Q5?=
 =?utf-8?B?NGNYb1VLVzViRkJOM282cDF6R3d6YzFkdTlIWm1Pb1IzSWtHRHFQVklnRU84?=
 =?utf-8?B?WlpYVDZIeEd1aVRpelNCdCtoT1JZcnhSMHBMaEU4S2gydCs5d2kxYlRMbVZp?=
 =?utf-8?B?eTdiYU95ZHRWVVpJdmdsTVJBMzVBVWs4RmJTei96NDY5eDVtZjRSUWdJbHIz?=
 =?utf-8?B?UlVZUjJ3cUs0NHQwY0lIaEF2eHhSaVdKOGs4VzVQc1BxNmMxUDZjU3RNVUhQ?=
 =?utf-8?B?dXhsd3cwV1lvekVRQnRoazhqQVNrYTh6YXRjUDQ2MXRROWZsbUNnem1JL0I5?=
 =?utf-8?B?ZVBkNU8vSUpWOHVZVG5oZGtrR0IrS2s4RXF2SFQ5WlpVS1o4emxHUnAwMkx6?=
 =?utf-8?B?cUswSVg4blNCNkhtWStUeWtlZVg2cXJEeHZjeURLNEJXSDRzbmVkWURZRWdX?=
 =?utf-8?B?UkpKWDN0TE9OZE1DaXVuQWNvMFMvK2p5T2UzS24wajJxUkFTVmpiWk0rWC9M?=
 =?utf-8?B?SFpDTGxEOHltVTZ3T0xnWXhqRmZlL1lEb1g5bm0vM05vRjFiTS9rVFV3YkRh?=
 =?utf-8?B?Vlg1Ry8vOWNuYkV2Y3FjTDRZekNDVWRNOUpZajlXTGRNMXFBaDAyWURLQ0E4?=
 =?utf-8?B?SSs0U0YycVRoM1AzckxJajFKYzBRdlN2Mzc1d2I4Q0tTMzd1c3JCRTBkdzdL?=
 =?utf-8?B?b3E2Wk9JRlVHRlNNTTRRRytwR1RIRVkzR0pNT1oyQ1FFNnBVVTZPYUZRRm5D?=
 =?utf-8?B?TWp1UVdQWG9oN0t2N0lWSHRnN0VGTDZROWZ6d09YSk5odC9LVkN6d2pYSDJB?=
 =?utf-8?B?VzZCUTU5dEQrNTd1ZFJDZFltMEM3bURKRW1xaHI5Q3NVK096Y1BidW1rc3BV?=
 =?utf-8?B?YkFoM2FVdVRNWWkyNFE3dDMrdzQ1RWtHQWQzMW5xbEc3OFNJK00wTzVsSXlV?=
 =?utf-8?B?Qlk1RHA4WG5hWHh0OXJXcU1DdXA4dmNaVDVTVXpHQUhWYXBMa2Z5ZVJFUjZ3?=
 =?utf-8?B?K2ZDSW4yVVVVRWkyVkpIU1dwMUpUSWhEeEFPbmxXazlrUUJOOUx0MWZhV0tJ?=
 =?utf-8?B?bWptN2NVTU9wLzlwMGFZZkdnUlh5cXhYZzJrMzhMWWZmQ0JRenFKd0tVZ05m?=
 =?utf-8?B?VVFnUDZ0Vmx2TXBlcm83Wk1TOGN5cmlZeGVSY09seUlVd09MVXBrZEhGUzBx?=
 =?utf-8?B?TUV5WHV5aEg4NDhSbXFkQ2hPMC9STXZFNEFTVmlDYmRFbXFKTTV2SlZ6Unpn?=
 =?utf-8?B?bnhVMnVjeU04aDRhU0RFTzlFY21KMExqY01mUHY3blR1M2h1N0dCUktjamhH?=
 =?utf-8?B?aFI3ZDBLeXliSzF1a2Vvd3ZSM1NQekZRQ1lrUXR1MnQxTnR5WHFhRHo3aklz?=
 =?utf-8?B?N0YrNW9jQTJGMzdYOU1uVENIMEFQanI2ZHdCOWlIOEJEYm5abzJuU2lOdjR6?=
 =?utf-8?B?dzJEYXdVUTkyTk9wakp1U0hnV2NJK09BUkw0M3lCdEFPZWRtK3lNUlF0MmJO?=
 =?utf-8?B?b2lYa0VyMllmRTJnSjRJTUpCaHBDQXZOZWh6aVlVQWZ1MmxYRzRUOUp0cHpN?=
 =?utf-8?B?WS9OZVpUZ2lmb0YxdDVUWVZiVTR5WE5IbkdjaEFMdVdPbnowWXpLY1BiY0p5?=
 =?utf-8?B?MWFrV3U1aTY4Q3p3SHU3K0ZKQkJTc1NnVklMaGFVNnJ6QzJORE5yTE0yekpo?=
 =?utf-8?Q?VRtOwq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 11:44:32.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97260351-21b7-4651-212a-08dde495ec60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089



On 26/08/2025 12:48, Julien Grall wrote:
> Hi,
> 
> On 26/08/2025 10:47, Dmytro Firsov wrote:
>> On 22.08.25 11:12, Orzel, Michal wrote:
>> On 06/08/2025 16:58, Dmytro Firsov wrote:
>>
>>
>> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
>> SMMU(s) that is/are non-coherent to the PE (processing element). In such
>> cases, memory accesses from the PE should be either non-cached or be
>> augmented with manual cache maintenance. SMMU cache coherency is reported
>> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
>> Xen driver. However, the current implementation is not aware of cache
>> maintenance for memory that is shared between the PE and non-coherent
>> SMMUs. It contains dmam_alloc_coherent() function, that is added during
>> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
>> returns normal writeback memory (which is OK for coherent SMMUs).
>>
>> During Xen bring-up on a system with non-coherent SMMUs, the driver did
>> not work properly - the SMMU was not functional and halted initialization
>> at the very beginning due to a timeout while waiting for CMD_SYNC
>> completion:
>>
>>    (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>>    (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>>
>> To properly handle such scenarios, add the non_coherent flag to the
>> arm_smmu_queue struct. It is initialized using features reported by the
>> SMMU HW and will be used for triggering cache clean/invalidate operations.
>> This flag is not queue-specific (it is applicable to the whole SMMU), but
>> adding it to arm_smmu_queue allows us to not change function signatures
>> and simplify the patch (smmu->features, which contains the required flag,
>> are not available in code parts that require cache maintenance).
>>
>>
>> There are already a few places advertising the SMMU coherency:
>> 1) smmu->features
>> 2) d->iommu->features
>> 3) platform_features
>>
>> All of them are better places than queue struct (that as you pointed out is not
>> specific to coherency). I'd suggest maybe to use 3) and removing ro_after_init
>> if you don't have access to 1) and 2). All in all, providing yet another place
>> for coherency flag seems a bit too much.
>  > >
>> First of all, thank you very much for review! I will consider using
>> "platform_features" in next patch version, it looks more appropriate and
>> should be available within the whole driver. Also, I believe "ro_after_init"
>> is also OK, since I have no need to change it (only check if cache
>> maintenance should be performed).
> 
> I have to disagree with using "platform_features". Flushing the queue is 
> a per-SMMU decision. But looking at the code, I think passing the SMMU 
> to the caller would look wrong (what if you mistakenly pass the wrong 
> SMMU?). So I think a boolean per queue is the right appraoch.
For my own understanding: don't we consider SMMU coherency globally, not per
SMMU (hence why I suggested re-using the global flag)? We set the coherency
feature in the flags if all SMMUs support it. Do we want to diverge now and do
the flushing per SMMU?

~Michal


