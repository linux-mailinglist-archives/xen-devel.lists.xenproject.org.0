Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3AC6C190
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 01:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165400.1492177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVks-0006NN-1c; Wed, 19 Nov 2025 00:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165400.1492177; Wed, 19 Nov 2025 00:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVkr-0006LG-V1; Wed, 19 Nov 2025 00:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1165400;
 Wed, 19 Nov 2025 00:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLVkq-0006LA-Jb
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 00:09:00 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a3602c-c4db-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 01:08:58 +0100 (CET)
Received: from BYAPR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:40::27)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 00:08:55 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::3c) by BYAPR04CA0014.outlook.office365.com
 (2603:10b6:a03:40::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:08:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 00:08:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 16:08:54 -0800
Received: from [172.27.232.218] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 16:08:53 -0800
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
X-Inumbo-ID: f1a3602c-c4db-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3WKCXfjl16Cd8vk1vR9Jy3fyn4k7Knzi08dTvrzss0e65rpoBiV+DV7JF50IpuyhYjNbQIYf+fuKnpsbhM22lhoH+7vcOzh3JPXsTFbvy0QojzRpuXCnq76p6yOAmAVzw0O/3DhXwUyBNHHHif/qTRuoQ5b5YeXFjN/uHOcDJhk25gDVVEU1Vy9EDPcInjbbIgdPeD9LKH34d2VHtNIMAAqVsRZG/xzb9floGzZCjhQT9rNhHJS+zNvFRDr9Vmn1Oo1Pp4PmJDL001Kp1HywJ3WuirPCbjNF69C3WQd8mklUoT9xK1GqQba6paGZB4XSGoMOFvxxwSSQ84fjy30EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R81sVUysovOxXE6UE4eYjgnofd2JsEJPd3NYNv6MvEw=;
 b=LINqwAnYLeBczllGmN1kfod8W+TjMZfa8zbR8ScrFYLCufYwlyGND0fSfFbU2S+FLdrNQHP/Zg8C5j5+VT3aUF49yUlSH67Ps0hsTgZ/9BxXS0c1pKhx98/kPu0Hm3gsuaanI0AtZ9bnJTj8jPPWeGBi+XViuEafEEIFSF4I2zcV5mT1NhSFWugqQVSglZedau579Xvh5xjwV/yy39sdxY47CVgUvXgzu9XBNWAijiZp/70kSyy5zVBi1Rr7jm5oq+wJtolZUyjcYqChPL3rpcS1mPK1spkCyC56ld66d1TU+z4+KqDfA5WxSc82OBT8b8JZhrePQ5CFNeTzB40Rcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R81sVUysovOxXE6UE4eYjgnofd2JsEJPd3NYNv6MvEw=;
 b=msmGh3HRPGJHyMs0OkBYfE1hbC6JEWf0ZGNsyvYlH7mdcR1TaxpwdvMQyJ2rL9y2PFdeMsFemgREQ16JI5lrzjaORCVi4vaP83KiTm4EigOXi7+Qh2ur0zWbiZNKVa8IB5hKU0YQJjsTuKIY0Sn7K+BDfID5d0VX3Qx7+OhYcmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <99620d96-4a79-48a4-a506-38d5ecc14eae@amd.com>
Date: Tue, 18 Nov 2025 18:32:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] xen/monitor: wrap monitor_op under CONFIG_VM_EVENT
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, <xen-devel@lists.xenproject.org>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-4-Penny.Zheng@amd.com>
 <e443bbe9-e2ac-42c7-803f-2017848c4f58@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e443bbe9-e2ac-42c7-803f-2017848c4f58@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 49272bc0-fedc-489e-2394-08de26ffd3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFdDUFd6ZWRGRkNGajF1TWYvbkZyZVNVT1ZKQzlTcFR5a0RtdHNvdFlMYWFo?=
 =?utf-8?B?T3I1ZVlmZzNMYk9VUTZlSVBQa2pBc1hTajJ4RDdQbGJiMEsxUDdqbk5uWUcz?=
 =?utf-8?B?eFlSZlQ0bWRZY01nRzlCdjdlWHpObzNybEc4TnRiZDRoOVk4WG1yU2pQNURw?=
 =?utf-8?B?enZ6VEVHMDhXUWtFWjBxc2FzNVZDL0RXcDJHWGhYazZZR1ZYemZEVEVlRHYr?=
 =?utf-8?B?eVBTUXA1UHhEM2xmMHltOGVvYmlMNDNWY3lmN3JZaDdWNHVLT0ZNMWdDbHdw?=
 =?utf-8?B?QmVwRkFjQmRyRldlVGh2akxFL3hSdzhOMzM3ZWlnMkcwU2YxMk90U1RSMUlu?=
 =?utf-8?B?T0UxZm84S293YTBUZTVKNDF6YVZmTjVHTk1CTThXRFdOc1M0TDk4cFZkTVkr?=
 =?utf-8?B?S0ZLc0orSXRRSmdxTnN1K0pjTjRrTk85Qjk1K3JoelNqdXhaWGRmcW1iSm1l?=
 =?utf-8?B?WjZkSytLaW56NzJ4bTl2YjZuZUV6ckdTek9GYWpjVnFNeWVHblBjV2lmc0pZ?=
 =?utf-8?B?RGQ2aFFKamlES1hSYW1nbmhydE0wS29lZkwxTC9IOWw0M1I2NklGbkVPalY3?=
 =?utf-8?B?OVdjWmtxSC9KNVdCSnhqSHFmVVBYVFFKdUp2bmJkSDdwTXpzTXJyaUpwOEtG?=
 =?utf-8?B?M1RkTURuaEw4cWRLOFpRVDJTY25zUjh2TSs3cmdFQXllOU9uc2tYdUZaNnE3?=
 =?utf-8?B?eVlZVjFKUi8wa2FvUnpDUUw5UnRoVHBuSk42c0FzVlRMczFlTjhOUWI3aWlC?=
 =?utf-8?B?T1E5cG9xTGxQU2ZuOTJ5YWZHNmVqMWpCV3hxWUEvNlVsekxUcEQxaldGcEdY?=
 =?utf-8?B?bm9KdFkrVitvZHppdmxLaXQzZkxIV1FKcGE5cXhCWmpiYTcwMjE4cGcxZHpl?=
 =?utf-8?B?am9Zak9hVGhNeTNmdTcxSTU1SkFuSzd6R09CYTJxRlQ4MHpOMTh1RHFKek1j?=
 =?utf-8?B?YVZ4MytIeUNOUGl4TjBzVVZQVkYvVlpPajFkVk9tYmdURDMwWTdwS1BsR0Fp?=
 =?utf-8?B?SDdQYmt4MUFLNlJlL3FmUjFPaU1ISy84bjY5Sm1NRGNjN3Z0REM3MVFGakdw?=
 =?utf-8?B?VWZtdlU3WFFVcjFrQzJNdU1NdVI4NjBsMHA1ditqVEVYTEI3aFNFcHM4a002?=
 =?utf-8?B?d2ptWGdDVm5hNnNvb21iYmxvazMyR3JlOTZ4NDYrdDNvVGN6Tyt3anZGRnVE?=
 =?utf-8?B?L2ZQdUdzdVd4b3hqbVJ4WVR1NXM1QkVWZnFTZTNpZnozTk91aDdPUkZURXRz?=
 =?utf-8?B?SURza2dHaHViK1ZIZXZkaURwejQzY1NvTkx0bHE4ZC8wVkw0VzNHTWJDTXJY?=
 =?utf-8?B?RmpUQUgwblJPU1VEeTMyYWt3Zi9NeWcreCtzVnI0M0dZUkRldWxTWWw4TVlF?=
 =?utf-8?B?NjA0WTU5d0Z3bWs4cUFmemdtSXhLR0JHSzI5cU9VS0ZGaTBmcHVSUWcrTE55?=
 =?utf-8?B?L2NwcHorRG1hQnl4WDBKb280YVlRUGNJUmRGZTUra1FCRjkzS1RsS0tDSTZL?=
 =?utf-8?B?cTNlVDhiak1qK3piY2JGY1hKSXpEN01DMGV3UFpSS3U1NTluUmtDaEx0Q2dR?=
 =?utf-8?B?UERDZXk3Unh4M3JuTTVtVFZ1dEI1TTloVm8xbERpQk4zQW5hTGt4YjN0dmJE?=
 =?utf-8?B?dTVEb1BzOWhJN3hXUFhzRGY2dFFYdFZEcFF0T044RnZBWkdVWWllbURiZXhR?=
 =?utf-8?B?OUVUaFRxYkE1aWFiakI4bGJUdTkyTEdrN2RDbkI3cTJ3cXY2ZE1GNVAvMCtF?=
 =?utf-8?B?TDNqODI5UlBXdUlyMFlCUUljaERoMTJZSCthUC85aXoweXlsc2VVSFFnVTlP?=
 =?utf-8?B?SEZlT0tVUGlqbklDRlZUZ1orZkpsRk9WeVB6anplUDB0OUVmeDFtR29iQTd5?=
 =?utf-8?B?NkJHSXhkQjlpZEhUYmhGck4wNVY2ckpLZDIxc3E4bVQyWjZEdUhvSTN1a2ZM?=
 =?utf-8?B?UUEzQ2hjQmZSd1hkMzMvRm1ZKzRZQXdnSUY0VnFSWHBTMy9sZ3hydWNuY0h0?=
 =?utf-8?B?ZUczcXRYQVFaUjc1dEx3dTV3OXdWOGtxcE0xVGVtZDZzWXY2K3VROFZMMHhZ?=
 =?utf-8?B?T2EyYTlaU2ZOamUrRDduYmsrWjhlQVAzTjRsNzRWYW91WXhoclZkeC9aVlBM?=
 =?utf-8?Q?2Okk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:08:54.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49272bc0-fedc-489e-2394-08de26ffd3e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126

On 2025-11-13 04:18, Jan Beulich wrote:
> On 13.11.2025 04:16, Penny Zheng wrote:
>> Feature monitor_op is based on vm event subsystem, so monitor.o shall be
>> wrapped under CONFIG_VM_EVENT.
>> The following functions are only invoked by monitor-op, so they all shall be
>> wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
>> violate Misra rule 2.1 when VM_EVENT=n):
>> - hvm_enable_msr_interception
>>    - hvm_function_table.enable_msr_interception
>> - hvm_has_set_descriptor_access_existing
>>    - hvm_function_table.set_descriptor_access_existi
>> - arch_monitor_get_capabilities
>> Function monitored_msr() still needs a stub to pass compilation when
>> VM_EVENT=n.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>> v3 -> v4:
>> - a new commit split from previous "xen/vm_event: consolidate CONFIG_VM_EVENT"
>> - Another blank line ahead of the #ifdef
>> - Move hvm_enable_msr_interception() up into the earlier #ifdef
>> - only arch_monitor_get_capabilities() needs wrapping, as this static inline
>> function calls hvm_has_set_descriptor_access_exiting(), which is declared only
>> when VM_EVENT=y
>> ---
>>   xen/arch/x86/hvm/Makefile          |  2 +-
>>   xen/arch/x86/hvm/svm/svm.c         |  8 +++++++-
>>   xen/arch/x86/hvm/vmx/vmx.c         | 10 ++++++++++
>>   xen/arch/x86/include/asm/hvm/hvm.h | 18 +++++++++++-------
>>   xen/arch/x86/include/asm/monitor.h |  9 +++++++++
>>   5 files changed, 38 insertions(+), 9 deletions(-)
> 
> Same remark as for patch 2 regarding the subject prefix. Then
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

