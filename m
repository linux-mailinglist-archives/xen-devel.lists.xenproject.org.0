Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3EB12163
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058201.1425878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKoF-000586-LF; Fri, 25 Jul 2025 15:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058201.1425878; Fri, 25 Jul 2025 15:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKoF-00055i-HV; Fri, 25 Jul 2025 15:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1058201;
 Fri, 25 Jul 2025 15:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufKoD-00055c-HK
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:58:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27ac47bf-6970-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:58:07 +0200 (CEST)
Received: from DS7PR07CA0018.namprd07.prod.outlook.com (2603:10b6:5:3af::27)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 15:58:02 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:3af:cafe::b9) by DS7PR07CA0018.outlook.office365.com
 (2603:10b6:5:3af::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 15:58:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Fri, 25 Jul 2025 15:58:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 10:58:01 -0500
Received: from [172.18.23.14] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 10:58:00 -0500
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
X-Inumbo-ID: 27ac47bf-6970-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP3CbeTyYp+akWDH6yoZx6ty3xh9Y10OYb88l/HbB5Fim/53/ya1RoLgQgqgBP4xE2GJ9eajswtI1hiA/EfrCBsPf2CMQrLWRHSpY5Ozlmo9OWN/JhNIKYuNzqytUltqnV7JL2zzjycNiotfZdVZGhWhGxqtUvg22EtYPo5hx6qJnE2zNW9kWYrakMVg0rg/TmQrmBv4XJxo+tS2fSYciOlxqjSqevL1UBvqGUVv3P3e7ZxKOSwZhvksJ1NNME/6cHIpFzlkPkClvSBhAPDvt8HCHFASFhAsEJVHeWFcGNt10grBvswHGbCBlPS79PjYPu88KOv/0N4MThEeWd5yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP0sLEHwFxZYxPzPsqCdRWfZUXiMdttFoV/Qs+ynwX0=;
 b=gfZRXgNno8TIgUuHamgSblBAJFpsZAPLQOEB8uN3NcSx8BEd5n+xZaDRNMYPPDn+DyqcAZKBGXOohu1vEqvv7dRBhaJ1o8qTXLBiPYdeHjlTm0MnUN+F0rgNPJp7bA6xBiGie5BZPoVOQT7Ri/E3BAr4Y1CIrgh0Nf+nA6WMlkArESqpBA2Exu/HFQXpXsAI2FE2DvCi+Qw4DuLvlxM40kW8EnBBv9VaQi/yWuuEEc2TOx2WxEIMtAPP+r4vtDdbVJVfnA+kAyJWKePSI40LAGjdIIvJXaeBTIFoT1GaInl1ItnvOavRqMkk71WmloCR57iEj8VtD5srbkkeztxbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP0sLEHwFxZYxPzPsqCdRWfZUXiMdttFoV/Qs+ynwX0=;
 b=fFH6ia90SM5w8SF2Y1HJJFjLtr2wbaLnZ49Anp9Vjael3AIe8Af1izS7lzfcenLTTiMctkLvqXec+INAOptxMVl5ht1zqFW8EVpa4H5DgAZy39d0UMvUha3e39ly61T9HlCJdG4wqEq5s5/4zjwip7ql2Ob4nfF2PGmi184i/Vs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f147ff2e-fcdb-42d6-ad4c-2d6a23013ae0@amd.com>
Date: Fri, 25 Jul 2025 11:58:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: restrict scratch page quarantining to x86
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>
References: <20250724174351.3969-1-stewart.hildebrand@amd.com>
 <aIM58gJm6oWQwyKT@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aIM58gJm6oWQwyKT@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: a66a6b73-ffcb-4582-ec58-08ddcb940930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzRpVzJUY2lrVU1ZNU5LbkxDbkU1dzJyZktlMDREdDhGUVo4bnorR2dqR2FY?=
 =?utf-8?B?ZEsxaHJ2amZHTU1ZVU1HOXZCazl0TkJtUGFoVm1UZzBqMU9JM3JrVzMzQ3RK?=
 =?utf-8?B?QlBEWmgzckFpNmtNWXZpQ2dTdS9jY0YzV1huK2V0NTViUmE4R1JzTEQzTm9I?=
 =?utf-8?B?MU9XTEliSGNVYW9CbW5ad0FOTzNvZFhTM3krOXdxcDBScVE2TVJzWmlkaTNI?=
 =?utf-8?B?U013RUpzcUJnZStoYnkxcHFVVldUdEk1dndpRk5PQ3Q5cHRJZFhUdkRtMStV?=
 =?utf-8?B?cU5JcmloY20xajRZUEZ0aTFydUlPcnllcTVlSWIxWVVzK29qTElJbWdBZlZk?=
 =?utf-8?B?RUNwK2lGL3I5d1RsL2dCcEUvU2lLR3crclU2MVF2VVF4UkMzbFpzdElRN0VN?=
 =?utf-8?B?Vi9tcHlOblk4UGwzUlRIcWh0UE0vVHBnVjRLZzlPMnNlWGIyazFVa2l1V2hS?=
 =?utf-8?B?Nk9oSnBnZXVJVFFMVWhMYndpbFg0UVdPMnBQU1Znd0FnNkMwaTV1bTJBNFIr?=
 =?utf-8?B?dGdFckZZU3dMM2NHZ21SVE5GTVdHU1BtVit6aWt6Q1N5UFdPUFQ5U0x4WGg4?=
 =?utf-8?B?ajZSTXE1RUdocitQZGZPL1dkODBBU0JQR0ZZa09wNExMbCt3VGdtTkk1VWpS?=
 =?utf-8?B?dG9CYVEwKzRTWVBJeE0wb1BMV0JJUGpNQVpTU3J3YmdrN0R3bEQxblZFQnlr?=
 =?utf-8?B?YzJETXZNdkdLVE9NL0ZyOXFnSENHa25LSktMUXMzTXFxeS8rQlRYOVZPVGtG?=
 =?utf-8?B?TkpjbjUvazhYVWdXcThsdDIzVXdON0c5c3F0VElJVTlZaTRxQWJpVUxCRGtV?=
 =?utf-8?B?bjhQYy9LZFZHaExnK1JmMEI4NmZPNjRVWFJvLzJ1THV1OW10cDYxNlVXVTFv?=
 =?utf-8?B?eG0zUUlDVWpmdVRnS0RhWXJmcEdsdml0d3BoNW9pSElOMlk3M0lyZ0JIaTcz?=
 =?utf-8?B?RG5uSlVta0JiRzNveGhUcmU5YXhTSWlNMFZ0OGZlaGdCUTVFa2NmaVhtZnlt?=
 =?utf-8?B?UTBOU1dNaTBhRXg4dGxWNnRtVXRIZXJyVCt0V1VmdTVIWFlMVGk4TlM1WUNh?=
 =?utf-8?B?R0NiMWdwU1YzSTBCMFNiQnU3TXMrcDEwVWRjQzd1RStPdGZORlo4cVkweUR6?=
 =?utf-8?B?WVhKWHBwMmhTVzdDRmcwcktXUkRCQmJKcllaUHFXRU1oREtzOEJ5d2JGMjNX?=
 =?utf-8?B?M2NjT0ZGTzliWXZsbHNBYTc2TUlaQ0hwTXBJQkQ5ZVVKV1NBb0lneDFzUDNY?=
 =?utf-8?B?NlhkaDVsWmpQejF2NHdBTnNKb2lBUnFQck9pemJoUnZuVFNqTjlCT3U3R0FF?=
 =?utf-8?B?dFZ1L2Njelh4eGNYT1U1b3VnU2txOGFwV244ODVCa0RveXhpeFZadVkvTEpr?=
 =?utf-8?B?dk9MZi8xWWVHUnc1Tmx1MVlUMFI3QStPb1hVblh5L0NjZGJPQ3Y0QWx4VzlR?=
 =?utf-8?B?aWVEa2draC96MlR0dDdrT01qOWRTQ0ZXN21zeDg1dk5CdmRMQjl0cXBhU2F5?=
 =?utf-8?B?ZVZqV0wyM2NXV2xmaXczbTNjMnlCcEJNcGwvWWZjZm9DVXRBNUNsVkhTYmE3?=
 =?utf-8?B?QVMwbzJOSnVtVFVmbWlHUld0Z0EwV0dIUURYSEx2ZGRzMExxRXRuYnJwZmdD?=
 =?utf-8?B?K0pBR0lrK0gxQlFDQVJXYXJyeWV5UGNZODdCU1Z2Sk14NnFkSUdydEl5all0?=
 =?utf-8?B?R1ZlV0FKR2psYXpMd1UyT2laWk1FajRmeDRMenlqVGdNb0k4aCtyZVZnM1l6?=
 =?utf-8?B?elIrcEM5L05mVjRZaU9HbldXcldneXJMWStkNUlMYlFpUFdDdm12THNtcGRH?=
 =?utf-8?B?MzJYUXJXbXZmVndUeXFHcTFKNkVKT1d4VWljbWhsMnFyUTM2dUV3aGJnNmNs?=
 =?utf-8?B?VDRjYStBaktmUVAvYzR2NStsdlVrZTY1TjhFMDFMMmZ2b2VrMjhuUHA3T2Uw?=
 =?utf-8?B?UkFwWHM1TWlHaUExVjEwamJsMWdnbjRHZUxxNEJRZkpWZDBqZ1ozUGJrWlhB?=
 =?utf-8?B?OHNsSG1Wei9NYUZleXBKYUdSd29DWXdYSzhmdE5OYUJHNjRDVUxlTXhuVDFT?=
 =?utf-8?Q?U4xCRp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:58:02.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66a6b73-ffcb-4582-ec58-08ddcb940930
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

On 7/25/25 04:01, Roger Pau Monné wrote:
> On Thu, Jul 24, 2025 at 01:43:48PM -0400, Stewart Hildebrand wrote:
>> All IOMMU_QUARANTINE_* options are exposed on Arm since 163c6b589879
>> ("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option"). However,
>> only NONE and BASIC are implemented in any Arm iommu driver since
>> 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3") and
>> ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2").
>> SCRATCH_PAGE is not yet implemented in any Arm iommu driver. Restrict
>> scratch page quarantining to x86 for now.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Cc'ing Arm maintainers to request an Arm ack.
>> ---
>>  xen/drivers/passthrough/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index 78edd805365e..11aece5f7bda 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -90,4 +90,5 @@ choice
>>  		bool "basic"
>>  	config IOMMU_QUARANTINE_SCRATCH_PAGE
>>  		bool "scratch page"
>> +		depends on X86
> 
> Since this is tied to specific IOMMU implementations, could you please
> tie it to AMD_IOMMU and INTEL_IOMMU instead of X86?
> 
> depends on AMD_IOMMU || INTEL_IOMMU
> 
> Should do it I think?

Yes, that makes sense. Since the version with X86 was already committed,
I'll send the modification with a Fixes: tag.

