Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA74C6C184
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 01:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165389.1492168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVj6-0005rE-Ni; Wed, 19 Nov 2025 00:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165389.1492168; Wed, 19 Nov 2025 00:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVj6-0005pD-Kj; Wed, 19 Nov 2025 00:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1165389;
 Wed, 19 Nov 2025 00:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLVj4-0005p7-Du
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 00:07:10 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada64bff-c4db-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 01:07:04 +0100 (CET)
Received: from DM5PR08CA0036.namprd08.prod.outlook.com (2603:10b6:4:60::25) by
 IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 00:07:01 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::50) by DM5PR08CA0036.outlook.office365.com
 (2603:10b6:4:60::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:07:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 00:07:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 16:07:00 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Nov
 2025 18:07:00 -0600
Received: from [172.27.232.218] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 16:06:59 -0800
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
X-Inumbo-ID: ada64bff-c4db-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJZ+/Zq7m15vY8GrYgOMeDhghqW5ScxyFy76YWctJE0Mz2T8zum6o4cANYPWqId2me12iZeLfob7bQKVgXnV4XyLv6/gfoh7ba/5xInZullmxfEzlWYB+eoVZV8C4/clT57up/ZXNQAt6geO5P4gMxc7l60yHd1l9It27NORlAxYJ2YhM+V1R6s+zMFlnZjFXbxmJYt094ER4MJO20Zhlz8e4vH6IWuUjRMQn1I79f8gqMP64sp/9J/nZ7kF/AzFzfBSx/V/7+9Mctlzum9tzzslwcPy4xkH+WWO3j7UqZE2+VqQ81FEK/awhq+tgPgvvJq6o2CTrpWpZ7lxnb1Tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mjn+Qd46gOML/itX0B1Ca5s1DfEHlEzRO2k3J7b9So=;
 b=h4BEwBzF2g7vM6fLccVG6M6Sl50QkB7Kay4VpryrKQBH8BnqxuBD+Rlee9hyVMteXd+19zlgx8p366fq02rWWR2lfhK4LgpZXM01qIQy/9tgHMvYjqtaSosoiH9IkMx1JJbvssyRDL9etnZojuW2d7MmGT35tDZz30CxR1YOnq94m9ZwUcfwbC0PESjT2N0QyiqMEYldx2KyBHLO+vNEKXbw5yRfpWiMsgQC6Ycg+KLq8SSNRukNDv1HYdXCAvTiD5/M0GdaVcc6BWlQcCaoczfS7046Cf6KB0G+SaCON7KvjxUkggpBWUyZrYGM00NsrjcrFJ6XbbZXfxWvVztSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mjn+Qd46gOML/itX0B1Ca5s1DfEHlEzRO2k3J7b9So=;
 b=EzKkvF2XpZoeVw0PxizE1D8/RlGM5VkRB4ZxbZV1amxaTFU9KcsG+qG4j3owwR4FrSID2LLv8utrUO9YnxXG4y/zAtjJJ36+qbJg4Gk3eBE8aswpodQwec10vQCMkT4uUMtevun3AaQ2DD46cvAgno4R+oaz7uZZNQ2+lRkeFI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <82407d33-14a8-44b3-ab43-78fc7908ea7f@amd.com>
Date: Tue, 18 Nov 2025 18:30:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] xen/vm_event: introduce vm_event_is_enabled()
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-3-Penny.Zheng@amd.com>
 <8c74b068-ba9a-4867-8d39-31c77f3cc339@suse.com>
 <DM4PR12MB845153694D28CC23FCF7C7C3E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB845153694D28CC23FCF7C7C3E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: a85f86d5-8296-492c-4660-08de26ff9013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anAweWEyc0pCeE5lcDROaGlTcVA2QS82L0FqM21CL1JXeVNDWEd4VzZmTjhM?=
 =?utf-8?B?S01QQkxBTW12TmF4aTNSdkNsVTNpS2QzVjlGRUlSM3l5VmkvcEt3VWV5VUR5?=
 =?utf-8?B?a0JiSjVlaXZ5aDJuTXNKYm9yaWpraEQ2Q00xaWU0L0ZQSEJUZlh1ZlMxUWlp?=
 =?utf-8?B?b0Y2UU1RaG8vcUlhbXpLSnEvam1YYnFvN1NSUE1JdEF3ZlBCc3FtcHZTUVk0?=
 =?utf-8?B?VHMyL2kzT1VkVTM2RHd4OHZGdjU5cldGNmErcGticXljWVYvQnh4dnc3MnpR?=
 =?utf-8?B?RHh1UmpFRm5aaDBRSDlrVmxLaTNKZExKd29rb1NnMHRQTU9KT3Vod0o1Tmdl?=
 =?utf-8?B?L1hzdTlBMFh6Y3pHTzZldjgrOWdvUlJQTG9DRXZCbzZyd2VsSlRwcEtXUUhm?=
 =?utf-8?B?QjRtTzd4ajFOTTdBV0htQ0FVdXNyU3ZwZit0dG9BaXhMVmZmUTk2SGZzVEZ5?=
 =?utf-8?B?RXU2ZzNpZFZhKy8rcjNLbGhsaWtQalRhVGk0WXFZZ3lEQWJrWExaTnJDZ1NP?=
 =?utf-8?B?Yk53R3BqQVNacjFpc1NlZDZXUC8xdHR0WVdaNEhvZnVWWmdvK3JUK0hsMHFE?=
 =?utf-8?B?U0NCN0Uvdk8xckpYeGNweXFjR1pheTJSMyt5KytTNnBTeDdBMGZXVVZnSzhV?=
 =?utf-8?B?bTRvU3NTUWZ2K2hjUzdGZlZiZ1M0eUJwa3AvS3dUbkRqbWI2azlrVWUxMGg4?=
 =?utf-8?B?VGtoNUx3RTA1Q3NqQ3hET2toT2JwSU5SZXEvSElWT3RQL2FhTEJZcmlBU2Jp?=
 =?utf-8?B?SEl5Y0dmcFpyUmQ0Z0FoaGxIM25zZFlXVGRhd0k0dXZzRExDUEorME1QRjM2?=
 =?utf-8?B?MGNTRUNvS1NxalhqaXQxcjFwUC8wcVlsV2lnakkxSmZTd1N1Nnl5Z3Bib1g4?=
 =?utf-8?B?bnIxL1JUK3pHTnNuUzRyN0l4amczakNyeVlJRnFnUE5NV2UwTTFnL0VFakZt?=
 =?utf-8?B?NW16d3VINkU1RDQyazlGZmdXVzMvbGJONmo3ZTdZdytEWWF1QlB3Tythb0lt?=
 =?utf-8?B?NXBweTJrZWlqRTJ2MFpIR3llYUVYRTVIRkRJalJFU0RYTDh1Z0swTFQ4aXZ5?=
 =?utf-8?B?am95WmNyR1drVDduZ0xXeVZQUmIzRVVVRjNQb1JLNmh4dzc0Y3NKbWMwb2tU?=
 =?utf-8?B?MDNBcXI0aUVqdHFMbFZkeEg1Q2hHVGd3dU50ZmFFM0tLUy9xTU8vcDVGdzVz?=
 =?utf-8?B?OFFNWlJNTjNDbEkwdDVpWlRIaWNKUVNvRmpsMFZyNHlCdUNxUTNCZEpPUWUw?=
 =?utf-8?B?TFdGbjlTL1lyQzBZclpRMVJCeVJSVlkwRldtTXdWNjZZMU4rZWJmYkxaY0NR?=
 =?utf-8?B?bGo0ajNkVWxxYm5HWWJBcVRZOUtmL2MyN09HemMzeC85enJuQW9ZMld1L2dP?=
 =?utf-8?B?UGsvWk5QSnhvQjRjZVkxdUJORlNEK0FEUDVZNW5sZjBQdkU1eC9GNVVrcGQ5?=
 =?utf-8?B?SFRDSU5hYkc5RDhQRVo0c2k0cUdKTEVFcW10V05DeG1JSnk0R3hCZUVScFdB?=
 =?utf-8?B?ck1RSDRhQlV0VVpFMWNkbE5nZFRjQXh1ei94M0ZkdjlJemx6b2x1eTRwdmhq?=
 =?utf-8?B?NDBNdFptbzBhZjhtRzBPTitqemtSYjI0UTRjU2hMYTB1YWhFbHpMR0RzeGFL?=
 =?utf-8?B?WTk4ank2MlNNVWZ3MzlTRTZLaStvbHFka0QybnBQN1dDVmZ3VE5SeFR2MDFr?=
 =?utf-8?B?OXBhK3Y1Q21UOHNIamdvTkV0OHdITHo0VDlKUkRmaUd4UTJpYkc3TDByRmRX?=
 =?utf-8?B?UWJsY0xhSlErYncrREt6MXhPQ0Q0eFg1UC82cXhrUGJpOHlza2NucTUyc1ln?=
 =?utf-8?B?Ry9PNHZLdjAwblZPSzRxN0o2MUdpMTh5aUk4WFJyRU5WQU1yVEI3aGNFN2g5?=
 =?utf-8?B?bFFOM2Y0SGdndnp4dnBOQ1hzWE9LMG9YYUFOaWV0SVdwRENhazAybi9QNmp4?=
 =?utf-8?B?alRnWEIrRzJvdnZBZU5WV0NjL2RNenpHd1ZCcS83YUxvTEtSaXZDaG9EVnUz?=
 =?utf-8?B?cHd0Nnc1YVZTaGRpTUpRSDJVK3RJcTQ0NVF3NVVXdzV3VHllNUoyb1Q5dGJm?=
 =?utf-8?B?bVBkR1hCNXdNeGZzeXhNdU9YSlFiOUgrKzlwV2RoWDJ1K3JzZ2VBQU54TlRl?=
 =?utf-8?Q?/LOw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:07:00.8489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85f86d5-8296-492c-4660-08de26ff9013
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

On 2025-11-18 05:11, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, November 13, 2025 5:14 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Andryuk, Jason <Jason.Andryuk@amd.com>; Tamas K
>> Lengyel <tamas@tklengyel.com>; Alexandru Isaila <aisaila@bitdefender.com>;
>> Petre Pircalabu <ppircalabu@bitdefender.com>; Grygorii Strashko
>> <grygorii_strashko@epam.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 2/7] xen/vm_event: introduce vm_event_is_enabled()
>>
>> On 13.11.2025 04:16, Penny Zheng wrote:
>>> Function vm_event_is_enabled() is introduced to check if vm event is
>>> enabled, and also make the checking conditional upon CONFIG_VM_EVENT,
>>> which could help DCE a lot unreachable calls/codes, such as
>>> hvm_monitor_io(), etc, when having VM_EVENT=n.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> I guess I might as well do the adjustments while committing, even if it's quite a few
>> of them. In any event, with the adjustments
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Mant thanks

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

