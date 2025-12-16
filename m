Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D09CC38ED
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 15:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187998.1509281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVW1C-0007zi-2L; Tue, 16 Dec 2025 14:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187998.1509281; Tue, 16 Dec 2025 14:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVW1B-0007ws-Vo; Tue, 16 Dec 2025 14:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1187998;
 Tue, 16 Dec 2025 14:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qh75=6W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vVW1A-0007wm-MA
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 14:27:13 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a51f19d-da8b-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 15:27:04 +0100 (CET)
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 14:26:57 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ac) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 14:27:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 14:26:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 16 Dec
 2025 08:26:56 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Dec
 2025 08:26:56 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Dec 2025 08:26:54 -0600
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
X-Inumbo-ID: 4a51f19d-da8b-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF4ojAzgewFwDFQ1CtUEjbNVok7/Ds/LtMQuz03DhMF5dyc3UFHQpTTQXWJXhZpTxj8iYK4fPUPSt5rky3iTNr30eyLm4IH23YJ3+PL4kiJtdAXIg/C/CPaLMBtOYebMdpDnFKPB1WGyqW2UAf6hVJv7F0Lkla1i+HqW3yeCVXQFT/i/eP6wm6A1+Z2yeUrg/ZDJZdbNwdrhleGpZCc5H6u06dW029DojkxmxJTM/e0186wkrbdR0Dunik6/ebNGKiaWwW9U+wHRXCPvljFHNVBsTbsff1HAe8cKsNmgGaNN9XSolO6kpnjVjN3KS28XRh3Eqvv4wjoqGDq5oRq3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPOSsHYRCeBUlJrwrhpOq3UFJCjDGk8epb5FVMtbQKY=;
 b=iUGEAIggxCJlL81EmVqTzR0y6dHYG1j/ccYTkf4wFjmHBJaiFvgKM5EEmOfE7WB0XDHfckzUos7J9tZnh4EeG4+6vafg3CiICNe8DS48QROk5Zq7tWEUzBbgGu1xmiwMb9UPzGXguioqTSBsox2XrcoEHAWpjqC+5OoGy61ZCbN5MTWpWKcwAaoqA9hqAnj+AGxep/MF/dJcEZOBsx0eTUyM4OEGyQUOQ9AnoESMtUdvRaT7LicW5tqaoLqFYGNbiz2Bqk1wk3f4f9gsZCPiPwp9IncfGWqEP1iLsL5D4iAXAzYRgnvwDIQclFGPGCZuQvRMfqgWLZOcVjcHBJ5QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPOSsHYRCeBUlJrwrhpOq3UFJCjDGk8epb5FVMtbQKY=;
 b=F/yDb5nxcHhyNQgZ8+w/Q8v5tCSIXLTy3aUnWTrYUg0jg/vE5ABMS2L3la5x80wkyI/76witTwDIKF+KcUHNxeePA+MN9eIZRxFI75R1xVispGBSXJeHIAI2/0AVpdhpfuAf8VGJvd+B7cjGEk6PKiLVQUJh+saZ6hhGzPgfZJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <52071968-d222-4bfe-ac8e-4e8cb7f3bc1f@amd.com>
Date: Tue, 16 Dec 2025 15:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm/mpu: Introduce modify_after_init_mappings
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hari Limaye <Hari.Limaye@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-5-harry.ramsey@arm.com>
 <6acc279f-15d8-43c5-b676-7312de3dde5e@amd.com>
 <1D457431-73BE-4FA6-A27C-7D130CB9EA53@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1D457431-73BE-4FA6-A27C-7D130CB9EA53@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1828b4-6446-40f1-27fa-08de3caf2ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z29vNlgyelJRdlZvSFc5NktJMUFmUU5qWkpEMVZ4djRvQXpOaG9kc2JSM205?=
 =?utf-8?B?Ky95QlRHZ0ZZV2FvS2VoYXlaa3NkTURvK3dNcDNGVHVGb0VlQmoxbmxaTWwx?=
 =?utf-8?B?MHJlR2RDV2hpbmFER0JxT0szYWNSK0lIakJnV0tXdFpiTkR2QS9vZ2hBOGN2?=
 =?utf-8?B?b2pzSGZVN0cvT0N0Wm9kZHZCNjI3elN1RWdrZjM3S2xOTFhFdVN0SkZoS1hv?=
 =?utf-8?B?UFYrZUpvNzVIWTQ4WVhyZGNnRDNXSlJ2VXNxWVdjQ1kvbHh6RlJoSk9QSXkx?=
 =?utf-8?B?OG5IUnROWkZ1NUJwalRZQkhERFpPMVUyVFY1V0xEZjJEUjZRVk4vNzdjWnhB?=
 =?utf-8?B?L1ArT0NybXk0QUpGalJUVWEyeS8zNWk4MmNvWko0Z3JESTdzelYyTGF4Nkw3?=
 =?utf-8?B?UlVRMDZKb1I5ZWJVd2lRakxxc3d4U3VtSE5GKzNDWUo4U2VMa3E2RWtBVitE?=
 =?utf-8?B?dGNKakNNY0RzYzdBcUx3RitrQ3ZjNFZJdTdHeFpjYzJqb2c5YUhuZGVraS8v?=
 =?utf-8?B?dG8xS3dPYWNWTU9IMThhVkNXeEovU2RIS2hacnRVV2RJUFQ1d1ljTU9mNVdU?=
 =?utf-8?B?cWgxYVNYQ2FCUlhSMTdMSDJHQ3dMYTVodXZ0a21sZGdVN3o0U2RWWXNlTUw3?=
 =?utf-8?B?UUV0RFVLTW9JOUt0RXdyNmd4R245TUFnZkwvbXYvTGR0cWpPUG1rUU8xTW1J?=
 =?utf-8?B?VVgrc21lelM1Qk9pSVpDeEZ5MEx2WVB3d3V3UUZ4M29DVGtpQzVGeFZhbkY2?=
 =?utf-8?B?b3F6Nk9FdFJzSCtLSHcwdWJ0WHhHdDVETThhbVNVVHRCSThpNk12YnJFcXJF?=
 =?utf-8?B?ejduZHJPY01SMzBiOHBEWGhKSkJvOXdKTHNlU1o5RHVSMk1FeVJwZ2NuYVIx?=
 =?utf-8?B?c3JKTWZzbkxiUlFBZVViTUlUSlR0dkNoZ3dJYXZmREU2ZUwvTFhzRElkUEtJ?=
 =?utf-8?B?cnROUGV1OW1iTXJmazg2cHZGN2ZYMEVCckxoTEtMR3ZqTThYa0NUYVpybytD?=
 =?utf-8?B?MFh2UTB5SExZUzBJT0x5V3QxNDc5ZUdKeklkTGV2MnFhQVRTSUdpUStvTzhI?=
 =?utf-8?B?VUdqK2R2SE9iMklHNW56VGxHdmxkdkI2MlRyY2xJS3ZMN0RxQWV6NG14Lzg1?=
 =?utf-8?B?MEpmUkJPM2hOMHZ5aUhWTzFzZTdyQ0NyMGk1TnV4cmxDWEhLc2oxTjdJd05k?=
 =?utf-8?B?YWNzVVZWVEp5REk2YTNUY1R2U1BsbTRTNXA3VVQzTVVSN2tTRkE2YW5tbVJ0?=
 =?utf-8?B?MjBPK29UVUMxUkIxOTVJeFVCeU5OSXdPdlNjRHM3OUdOT0lTZFZVTDl1NUNj?=
 =?utf-8?B?Sko4QzM2NmIxT1h2SGdsMU5qWUxQOWlscGhiRHVQUWlIMnA2TnJuanRZci8y?=
 =?utf-8?B?cTQxNTZrS3MrWEh1TXlMMUk2S0Q5WGF3b2FVNjVpSlZKYzVGc21nOW9Rb1FN?=
 =?utf-8?B?TXlITnl6S1ZINE0wak0zMmQ1MkhHbU5lNU5tdTZTbC9KVmF6dUN1ZFZBTWxr?=
 =?utf-8?B?UHZhcmZxMjBDcklvaWZTY0M4bzY1b3BnUk1nMmJOY29ubEpZMlBRUUdQMi9M?=
 =?utf-8?B?YWs3bmMrZFhoejZkVysvcG9qc2ZUTGl5djZjTFFXV0lkMlVlamxJM05DdUdi?=
 =?utf-8?B?aTRFWjVXby9JenMzVHE0bVUrL1VtRi95Sk9Hd3oyelNmZ3ArTzFlRStuRU5U?=
 =?utf-8?B?TlNHWDZNYmpPQURud1FKczVVWUs0eDdjZUVuZ1Q4OGtLWkJQMDZlV3BDdVZQ?=
 =?utf-8?B?U21nVEdtZFRXNlZTcUUzNjdpcmw2b0d5M29tS20xTW9INlg3c1NVODFSRzVX?=
 =?utf-8?B?VWZDME1XcURnNHNtek1HR3BaVWROTE1ycjVuNWhjK00yb3FtbzFqME80L1V5?=
 =?utf-8?B?L1BOWTlXMG5EQVhOMHJIaGJWNWo3NFJMaXJTSW9oblBpU2JMakZMQzF5VGVp?=
 =?utf-8?B?eUxUNjNNTm9RK3hCejdSSEtxNTNBTlhkbTVXU1Zid25WYUVLRHNEVkNnVmlr?=
 =?utf-8?B?TFZuZGpvMlUyQ3M5ZzMvdis5ZEpaK3E2WFhSa1hUU3ZrR2hUSlBwVm9MTnZm?=
 =?utf-8?B?OWdLYS84TmNLTkpEellNbEN4K0JreVpLQk9rSEZRWFhEZU1nK3BySi96RThK?=
 =?utf-8?Q?zA4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:26:56.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1828b4-6446-40f1-27fa-08de3caf2ae8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950



On 16/12/2025 14:11, Luca Fancellu wrote:
> Hi Michael,
> 
>> On 16 Dec 2025, at 09:15, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 28/11/2025 10:58, Harry Ramsey wrote:
>>> From: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> During `init_done`, Xen sets the permissions of all symbols marked with
>>> __ro_after_init to be read-only. Currently this is achieved by calling
>>> `modify_xen_mappings` and will shrink the RW mapping on one side and
>>> extend the RO mapping on the other.
>> Can you be more specific about the sides you mention? How did you deduce it?
>> I assume you are talking about MMU part.
> 
> You are right, this sentence is a bit misleading.
> So what was written here was meant to say that on MPU modify_xen_mappings
> should shrink the RW mapping region and extend the RO mapping region because
> as of now they are declared like this in xen.lds.S:
> 
> read only data:
> +------------------+
> | _srodata         |
> | _erodata         |
> +-------------------+
> 
> RW data:
> +---------------------------+
> | __ro_after_init_start |
> | __ro_after_init_end  |
> | __init_begin              |
> +---------------------------+
> 
> And in head.S we map like this:
> 
> /* Xen read-only data section. */
> ldr x1, =_srodata
> ldr x2, =_erodata
> prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
> 
> /* Xen read-only after init and data section. (RW data) */
> ldr x1, =__ro_after_init_start
> ldr x2, =__init_begin
> prepare_xen_region x0, x1, x2, x3, x4, x5
> 
> Now, because (__ro_after_init_start, __ro_after_init_end) needs to become RO,
> it means that RO section will be extended to (_srodata, __ro_after_init_end) and
> RW section will be shrinked to (__ro_after_init_end, __init_begin):
> 
> read only data region:
> +--------------------------+
> | _srodata                  |
> | __ro_after_init_end |
> +--------------------------+
> 
> RW data region:
> +---------------------------+
> | __ro_after_init_end  |
> | __init_begin              |
> +---------------------------+
> 
> So what we’ve done is taking (__ro_after_init_start, __ro_after_init_end) from
> the RW region and attach it to the RO region.
> 
>>
>>>
>>> This does not work on MPU systems at present because part-region
>>> modification is not supported. Therefore introduce the function
>> What else is in that region?
>> Wouldn't it be better to have one region for this __ro_after_init so that we
>> don't need to shrink/extend the mappings? Is it done because of number of
>> regions limitation?
> 
> So if we do in this way we waste one region, because we will have 2 region declared
> RO that are also contiguous, so easily mergeable, like how we are doing above by
> Extending/shrinking.
Ok, that makes more sense. I thought the descrption in commit msg was somehow
about MMU. It's not ideal to depend on the regions layout but I guess it's ok
if we don't want to waste regions.

~Michal


