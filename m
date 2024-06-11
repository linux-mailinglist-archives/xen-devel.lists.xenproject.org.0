Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63188903C1B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 14:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738343.1145075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0pJ-0006ot-Of; Tue, 11 Jun 2024 12:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738343.1145075; Tue, 11 Jun 2024 12:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0pJ-0006m2-LR; Tue, 11 Jun 2024 12:42:13 +0000
Received: by outflank-mailman (input) for mailman id 738343;
 Tue, 11 Jun 2024 12:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PtoW=NN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sH0pI-0006lw-1s
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 12:42:12 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:2408::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035d82e6-27f0-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 14:42:08 +0200 (CEST)
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 11 Jun
 2024 12:42:04 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::23) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 12:42:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 12:42:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Jun
 2024 07:42:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Jun
 2024 07:42:02 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Jun 2024 07:42:01 -0500
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
X-Inumbo-ID: 035d82e6-27f0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L71tS/Rvzgu7J9QoR1Z+8FqAY2wO3Y2nA5/j5uXfqaKjpJS9ySp172B2KKPP7Ph0dwFMmefC/XkeLELfwNu/DWXyWPUPtSanvphzppqTBK4OIRNssvNVMYe8FCfOVD62Ltx4mi9pkYU9zaEI7QHN8ve42tGngDuQ3zwymORWNrHo8QqD1FkMDfkZ1kQeI+NJbow/5gwRh09jo5c3vcaAmk9EWK0B6/rMFN1W0EQ3vsSszHuV/kECQTejR9oTJjyOZglHghZJiuAJ5rbW7d4xxKKZ49/kURvEgzBaQqhhi7zstga19ExyVHVomlFuIopdNzZ9P36UE8T0oBDm5SKtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwN7sSeMlmS1YUWczykEipW7HhUPiWbqBijU+k3Ruuk=;
 b=Zpp1dJ5AYpzrSGUsfjgbE1CKuUNwvh3gxeqkalAvM9/EwHDgHA/L0TKEo3ykQukkzF9NsNkz9bEs6FpcU1BjmDv66cIJlwQKq9Ym/FKISNLkDm9xXxU0At7152BkO8vIdZmeu9DGct8y5LgRJwOFat35UEz9RSHmAcMwr5PkK3PprU8zq84i6ywjsOR4UeamMOPadlgjnl7jBH1z7ffrtNNQvCGnvauxX7QAegBo/C1NQjEW8BiKdE92wQ8fNjYPDajEtQZEmY4z7eyo+2f2zGFbpcwV2u3ivYzh9TXEXX6HhMcWdiIRCgLm+RYmK9CFTMAOxwwntciqPHwkUux7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwN7sSeMlmS1YUWczykEipW7HhUPiWbqBijU+k3Ruuk=;
 b=g4xvvApvlFjQCNugxEJ5L6NNWd4wFlCwjNm5Ddi95ubwp1+Y2pBHeHJ+jiLOJeginNrE20AewO1/AFb6M5ZOjkYn2yR3WqBF6TJcRG83qjEPq/sOEz99NAF7wsc1JhL1kkt/gRKVy4h5B4QfPa/8HOdikP+PLX9cjXtjoRrB+yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <66e5d584-b326-4197-81d5-ec2b8233a3fa@amd.com>
Date: Tue, 11 Jun 2024 14:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Static shared memory followup v2 - pt2
To: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
 <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bb0cf4-e36b-4b9c-cd0e-08dc8a13e58b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUYzOWp2ekZPM29XcVozZi84M2Y5ZFllNzVGcC9SLzlTaGtkTVNxTkI5Mi9F?=
 =?utf-8?B?S2tJbUNuZHZzb0kvNi9pU2RXbS9FL2x0TDM0UGdnalNQQnBwdmJSbFFKdWdJ?=
 =?utf-8?B?TG9pM2NLOVhUNTlpZ3o0ZCt4eVhWTjVGK1NyZXNTb2l1aFpyZDNVV2JwUlN2?=
 =?utf-8?B?Q282ZXljUnZpMnpIWjJ1dmozRnp4SGpXMjB5UUZZSVJJYjMwUXNNRWYySVRt?=
 =?utf-8?B?VVRQRVVLRFJWTmMxcytnb1l5cTVlWHJlQmJ4b3NCY29tMEdKOVM5aWNBNWla?=
 =?utf-8?B?MEdwUXNKY1ZjeDNBNWpzQXJxV1ZEVitid0FrMXFTV3RkSWQzNTk1ajJlL2Iz?=
 =?utf-8?B?UWJZVXE0SVdkVEtWZmdtMFlrZW9GQ3dMM1hJblQ3NmxhSytJQzdXcXNzODV4?=
 =?utf-8?B?QnpUNnpmZ1hiUFZnenZoM3Q4a2JFSzF6OEpsQ2doNS9FTG10bHRWbW9Xc3RC?=
 =?utf-8?B?NnJLblJNMjF2QlluVEJnTy9KVExSblN1TUp1RjFobHFndWtBekptQnpVUTN1?=
 =?utf-8?B?TGNNbXFSYzVsM3hHOVZhWk11aURRMWhlK3VzTmNsYVFNQ3R1bVdRcEtLMjd4?=
 =?utf-8?B?ZzVOdFNJQUhQbUt4TWNXZGNLWUpNN3U4dWV0NC9Ib0hqVzNVWWV3bFhxTWJ5?=
 =?utf-8?B?MVRxbEhJR1d3b3k4M0hVdXFWcUJKVEhQUTlZU0VKS28xWjZ1bi94QVoyZTJI?=
 =?utf-8?B?UTJ6RTFqUnNNNWJGYmxCOG0vZklzR0d0ZTMvMFd5VUdwcmkxZUlhN0NJanFt?=
 =?utf-8?B?SVc0cnNZcUxJcnplSUlLOW5WK0FpT1RkMGJadGt4Nm9nWlZ2VUlxMDY1NHB3?=
 =?utf-8?B?WTdRUjlFWURTSTJvOXJucndVVXlrKzk3ZzNtUDNHa1JwV05SYzRUNG5VM1Ez?=
 =?utf-8?B?Z3NzdzgrRHNqQmUrUU5vRGZTMm1HbHE4RFp6aFQrWnJMT0kyNmFubzB6QnZW?=
 =?utf-8?B?WkRtUmU4TFBSS21seldhZEZ4QmNSMGxyNlhsdXRMWmhaL2N0Y2RLUFlYMUZT?=
 =?utf-8?B?TFdoWitGTllYazVCZ2tzNDk0ZEVjNDNEM2VJbVFpZlRpd3Z5SHBLM3dMMXh0?=
 =?utf-8?B?YnZlV3hlb1Q3eSttMDRMTjkrbHBqR21zYk5VaTIxN1JMWGVmckVPVEtaUXRm?=
 =?utf-8?B?SThybk01TllwbWRVVi9zRERSc1lRQjQ4TE9jMWRkSlkraHdyOVRqRFJiYXlz?=
 =?utf-8?B?RmFGNEdPWkN5TjYyQjg2K09jWXBWWUdQMUwydFZaN3VXQ1hoV05MMjlzaFJh?=
 =?utf-8?B?bDBZcHRFd05zSk5YRFdFZ1hoTURBN3VoWmpaMGJPazFGTzlrZU54aTVTRDRT?=
 =?utf-8?B?YWZ5ZzZHRTZtalJBNXh2MzNUTFJpU2FhMXdTWUp5ekY5MlJ4dnJmVFF3UUMw?=
 =?utf-8?B?QXNoRXdvQm03b3JJcWNySng0YUxUMDJES0EvZjJWU0toNENTL3dtRlZoV3JV?=
 =?utf-8?B?dGxUUjZ2NFQycEc2WmtEOElvazZTcjNDbHNoK3Rleks4Nm84R0RWZXd5MEQ4?=
 =?utf-8?B?cU8xd0Nnd0VGZEtmbUsxRzV4UnRacUttdjlrTlBUY3ZGSVI0UzgxcXF5eHVm?=
 =?utf-8?B?NzA4VlprYlBHa1ZTNGdnSktxVVVJOTJYNmZNK0NjczV0K1UyK3pGL0hGSmpK?=
 =?utf-8?B?MUR2aUhVRDhvQkIrc2twTGRWdlBEQjF3WjNTK3hMdi95UnZLOG9yd1BIZHBI?=
 =?utf-8?B?WHE5WDgydFNmYWhjenNSRVgzRTc1WTlUcUNienhUYWloMmtCdFFzcno4LzhD?=
 =?utf-8?B?VG93Z0hNMmU1am1kUUlWaEZMTmRnRlBCUU44WlloZDVoZFJjS25vZUs3WWVC?=
 =?utf-8?B?YlRlMDRUMXFSTnhWaE1CSjVnYlRyWit3a2M2S0dycksrbmtRZUdCVHRJc1FS?=
 =?utf-8?B?VUJmUWh1V01zaFFOVkpFV3VWbDJGUk1jdzByQll1K3FlT3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 12:42:03.8048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bb0cf4-e36b-4b9c-cd0e-08dc8a13e58b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978

Hi,

On 11/06/2024 14:35, Luca Fancellu wrote:
> 
> 
> + Oleksii
> 
>> On 24 May 2024, at 13:40, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> This serie is a partial rework of this other serie:
>> https://patchwork.kernel.org/project/xen-devel/cover/20231206090623.1932275-1-Penny.Zheng@arm.com/
>>
>> The original serie is addressing an issue of the static shared memory feature
>> that impacts the memory footprint of other component when the feature is
>> enabled, another issue impacts the device tree generation for the guests when
>> the feature is enabled and used and the last one is a missing feature that is
>> the option to have a static shared memory region that is not from the host
>> address space.
>>
>> This serie is handling some comment on the original serie and it is splitting
>> the rework in two part, this first part is addressing the memory footprint issue
>> and the device tree generation and currently is fully merged
>> (https://patchwork.kernel.org/project/xen-devel/cover/20240418073652.3622828-1-luca.fancellu@arm.com/),
>> this serie is addressing the static shared memory allocation from the Xen heap.
>>
>> Luca Fancellu (5):
>>  xen/arm: Lookup bootinfo shm bank during the mapping
>>  xen/arm: Wrap shared memory mapping code in one function
>>  xen/arm: Parse xen,shared-mem when host phys address is not provided
>>  xen/arm: Rework heap page allocation outside allocate_bank_memory
>>  xen/arm: Implement the logic for static shared memory from Xen heap
>>
>> Penny Zheng (2):
>>  xen/p2m: put reference for level 2 superpage
>>  xen/docs: Describe static shared memory when host address is not
>>    provided
>>
>> docs/misc/arm/device-tree/booting.txt   |  52 ++-
>> xen/arch/arm/arm32/mmu/mm.c             |  11 +-
>> xen/arch/arm/dom0less-build.c           |   4 +-
>> xen/arch/arm/domain_build.c             |  84 +++--
>> xen/arch/arm/include/asm/domain_build.h |   9 +-
>> xen/arch/arm/mmu/p2m.c                  |  82 +++--
>> xen/arch/arm/setup.c                    |  14 +-
>> xen/arch/arm/static-shmem.c             | 432 +++++++++++++++++-------
>> 8 files changed, 502 insertions(+), 186 deletions(-)
>>
>> --
>> 2.34.1
>>
>>
> 
> Hi,
> 
> We would like this serie to be in Xen 4.19, there was a misunderstanding on our side because we thought
> that since the serie was sent before the last posting date, it could have been a candidate for merging in the
> new release, instead after speaking with Julien and Oleksii we are now aware that we need to provide a
> justification for its presence.
> 
> Pros to this serie is that we are closing the circle for static shared memory, allowing it to use memory from
> the host or from Xen, it is also a feature that is not enabled by default, so it should not cause too much
> disruption in case of any bugs that escaped the review, however we’ve tested many configurations for that
> with/without enabling the feature if that can be an additional value.
> 
> Cons: we are touching some common code related to p2m, but also there the impact should be minimal because
> the new code is subject to l2 foreign mapping (to be confirmed maybe from a p2m expert like Julien).
> 
> The comments on patch 3 of this serie are addressed by this patch:
> https://patchwork.kernel.org/project/xen-devel/patch/20240528125603.2467640-1-luca.fancellu@arm.com/
> And the serie is fully reviewed.
> 
> So our request is to allow this serie in 4.19, Oleksii, ARM maintainers, do you agree on that?
As a main reviewer of this series I'm ok to have this series in. It is nicely encapsulated and the feature itself
is still in unsupported state. I don't foresee any issues with it.

~Michal

