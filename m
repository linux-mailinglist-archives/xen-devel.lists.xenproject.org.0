Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8129BC91CE
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140597.1475440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q4O-000418-Gm; Thu, 09 Oct 2025 12:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140597.1475440; Thu, 09 Oct 2025 12:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q4O-0003yH-C3; Thu, 09 Oct 2025 12:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1140597;
 Thu, 09 Oct 2025 12:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LuT=4S=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v6q4M-0003yB-K0
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:48:30 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1f0ce9-a50e-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 14:48:23 +0200 (CEST)
Received: from BN0PR04CA0128.namprd04.prod.outlook.com (2603:10b6:408:ed::13)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 12:48:16 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::70) by BN0PR04CA0128.outlook.office365.com
 (2603:10b6:408:ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Thu, 9
 Oct 2025 12:48:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 12:48:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Oct
 2025 05:48:15 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Oct
 2025 05:48:15 -0700
Received: from [172.21.123.104] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Oct 2025 05:48:14 -0700
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
X-Inumbo-ID: 3d1f0ce9-a50e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEux8iESMUagMutPC98FQgZT35lqDXLPw5kYe7Vto8kg/HcxqcSATBCzs9KZKGEthSmjO2lowYNY+VzbpFs6FuScLcV9Lvz0PrMPJehaREw9i48WLL3KPVSm1I3zw3o1FcwRwyvKgNsAvmSeH0c4Kdv1glOFqpUdCbjmGSBBSyJFJDmzKNpmWXOLQql7Y6FMj3crjjWWe37/O7hpyCNijigCPUUh9PkM95Hghd9Dk5DTPS9wSKb1kR5L3+j/uHDpjiJGfBHNfJltApXXrZJynscPg+3fxjSTW3EphO4d/1pxjGDC0LAHVETpVr2pH+ms14/HubFkARMssxXZwGdN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5dS+75ICDFn+HBf0KBDjBiKDWpK1DoCQK2xHFnZ+jE=;
 b=xPmiSBsEbEHy59YWFGVOt/kDgHt8AkU53BXR9mHY+imddq2+qNWwBqS+SvU8/KGhhIBFWIJgKzEGxy6O2vSgXGzUS4yDyMEMqX8APv7zqRLTUSdgQbfU4VAH7HyPGv7Gvi0t5RH0wqBN1iqdpz8VuedJcjZuLyQAJ0hFZRkocTjeA8UsU8rOiFuk5cC9wwpJrZsawscKpOcP/bjnimN9y1nZKyedyGTIj5/xtZ4qK7TYGjtd8tX9tj0wDqJ+1usuBi0SHm5TJQkVZxkgUoabxuBRUSbNZOqiaQtzMmaoPt+K6VbdktLszmNwlUntOIvpq3AqqV9ZAZkZh4X2qcmrMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5dS+75ICDFn+HBf0KBDjBiKDWpK1DoCQK2xHFnZ+jE=;
 b=gJ5kwbJLqiGQB7miW6O0l2bB4C+HwIVM7/VLO504W3MtbWnw5469ehe5AHyhmqXE6Wwlm7yRRf8Bg70Fel3E9KvdlNW6uo7Fmdz8E4Y+Ool1baU59eHxWVmarGefOIILvr5sCcP1AXTEAnuP53hLd16zLbmps+1rBRdFXV+RoHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <31cbe58b-370c-45ba-bafd-9994f58ba84c@amd.com>
Date: Thu, 9 Oct 2025 08:48:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <oleksii.kurochko@gmail.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251008143923.2557-1-roger.pau@citrix.com>
 <7754ab37-4faa-476e-98e1-0417afca1e70@amd.com> <aOdjBLaK1Tg2I51E@Mac.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aOdjBLaK1Tg2I51E@Mac.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 465b2050-4fb6-4bb5-05f2-08de07321da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjZQWHpNaHZUcWUzNmU0TlFydHVCanZlT09rR1JReVAzcE9TN3Q0Y256NndF?=
 =?utf-8?B?MlgyVk1Ld2RIcEl1cU5QREVQc2JTQmJpZ1l2U1FEMTA1WnpjV2ZxTllIbDFr?=
 =?utf-8?B?d0VZQzM0ei8yaEpYTStyZTNJSTFuNGt4UXRMcjNHcmxYZjJqUXJTL3o4NUFM?=
 =?utf-8?B?ZFc3U2o2UXBoTWxOZ3pUdzFteUlPTmp0OEsySDlOMklxaFplNyswbHI1a1JI?=
 =?utf-8?B?b3NwOUsyRHNVUnNsNnRUYjQ0Y3hUeTUvVkhLblI5MXFBUnNSbDM2c2hxQWo2?=
 =?utf-8?B?dHZZYzAwRlEyN1hQcWFHY1dTTkIwTHpUMVQ3RllvQ1VwZUdvZGZWcTVPVUJE?=
 =?utf-8?B?SU9wakpUNXR5UnhXRUZ1b1hpQTZnVFU3TmZweXZyZll5QURQZDlHUHRDdU5Z?=
 =?utf-8?B?TTFVaFJ0VmU2WGwvOXQwdFFFaTFVdUI0Ykw1U05qRXFidUVzR2lhSHpLOVlZ?=
 =?utf-8?B?T3cxMlN2blFpYTJqdWtOZUl0UGZ5OEVWV2MwcThVaG5xNVQvekhoeCsrdEw4?=
 =?utf-8?B?SUtVOGJxZmxHVUs3RFFVQnRrYmNwUkR4R3Rlc25raDd1aldSaHg3czVtZGl1?=
 =?utf-8?B?TENLcHdEamJIbHIvSUxKSXd4SzdjdVI0dFFsT3BEcXFrMGRtTmh4S0FFWnJv?=
 =?utf-8?B?SXQwdEs2K2hJZEtVZ20yUEt4NzV4NGtUYUNRNjlpYU01dEVnTHdQdSt2M08z?=
 =?utf-8?B?bjBZUGRPQ0JvY2p0eWRYaE1TZDhQWWpCK1hLb0hEUWhQWnNSZlYyalRNY0Na?=
 =?utf-8?B?QmZTUVdUeWM5b3E3TTQ0V2xjdktlN3NiY0dWc3ZCYWhUTTZlZlNWTzlLN1Rh?=
 =?utf-8?B?QTN6bkNRQ2JSN3VSYVNxUFNyN1ZPZnZJNHpwZVRXc3pYTFJaSTVYWlA2Q2h5?=
 =?utf-8?B?SzgyaHBuaXNNQ2UyWVBabDQyVmY3d2QxQW5xczliam0rWjhGWUpyWjUvdkNQ?=
 =?utf-8?B?TjFyNWcvdXl5Y3RlRVNScXdEMzI0Nm04M28rY0tKTlRkb1ZxREFoYnBSWmJJ?=
 =?utf-8?B?cGFCRG4vNC95S0NnUUNPTFlkOXRaRHR5N3hUeEdVWmlPRnJlaDR4ZVA2NDZH?=
 =?utf-8?B?WFpuNEFyaUtBWWNhNjl0TG9uTVo5TU5rSm1VL1dmVndORUhoWjhmdU5jOVBS?=
 =?utf-8?B?d1c5ZFJ1aUpDTlpiaEQ2bXFPajVxaG4vS1o4RnFUN1MyMXZDWHRCNWErWE1Z?=
 =?utf-8?B?L0ZPSkNCUmcyUGpKOHdDY0NHdW9mazhUQ2JnNVVEa0tYK1VvOFlNb0M2TlNt?=
 =?utf-8?B?dzRTbitIR0k0dld5bWpKRUFDWUFnK3MvRXVnM2RleU5QVUQ2bVU2SWs1OFRo?=
 =?utf-8?B?Y3RMM25xbW83dktLZjl0OHNCWGovQldqenlTM0xTSHpDZjZzeUlXZzFsY3hk?=
 =?utf-8?B?Zkd0S0p5ZVMzanQxclRVckJOdHQ1OUVUeWtxeldjN0VkTXRLR2RwcHhYWnVk?=
 =?utf-8?B?RXpaU21SN3FQd2hhVW1ZL1hzYldlTHFncEhMYUpHN0lzOVAwL1RLV0xkUlky?=
 =?utf-8?B?V1NXWXFUT09wOHVwc2dqOW5RUm1IcnIrM0V6V290SmRiVTNFaHdvUG5oU0RM?=
 =?utf-8?B?UU9hS2R2T2V4Vk9Gby9CcDFnZVU5aHQxK0pBbW1OZm1iZWUrSElFd2lFODJz?=
 =?utf-8?B?cnRIVzdXaVBFdGhEQWtpRkQ5d0VGQ0xienhkVW5OVTl5bTlSZTlWUGIxS2wx?=
 =?utf-8?B?R1dZQkpjUjBWYXNPWndCdlRVYnZFNTB0UFlib05VWkliRHNXaThvcHZDVGM1?=
 =?utf-8?B?WXFZeHVwOXVYZldMK1graVA3TmxjWXhFenlLSU1XeU1FQnczT09WdmpVRFJI?=
 =?utf-8?B?NWE0WXhOaUk2MUU1dG9JWFVZYTVtTFl2bmxwZGYyTkN6aTFjOUlacDc5eEhz?=
 =?utf-8?B?TGxoKzhIUXRpN0hRMGJFSDNMc1Y3cU5CaU1obzhvTjV2LzlETDdNNVp1aWg0?=
 =?utf-8?B?dVp1NVJSZE5jQnY3V1d1UU1hYnFqcWZ1aVVSYmpVSnE4bEwzQXJCZWVkVGg3?=
 =?utf-8?B?M3VuZWZoNU12YnJJSG9PZkVWbDJ3cmM3cy83YjUybko0NjJSQjJQaWpzaDB0?=
 =?utf-8?B?U0tLWVpnQkpoSzRocVhNWTV5TFBlbkRORWxnRFFwTENRNzBQY3RoZVJtanVS?=
 =?utf-8?Q?Qc0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:48:15.9915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465b2050-4fb6-4bb5-05f2-08de07321da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

On 10/9/25 03:23, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 09:17:30AM -0400, Stewart Hildebrand wrote:
>> On 10/8/25 10:39, Roger Pau Monne wrote:
>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>
>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>> still use the address of such empty BAR (0) and attempt to carve a hole in
>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>
>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>
>>> And the device left unable to enable memory decoding due to the failure
>>> reported by vpci_make_msix_hole().
>>>
>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>> tables are usable.  This requires checking that the BIR points to a
>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>> target BAR.
>>>
>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD

s/severs/servers/

>>> EPYC 9965 processors.  The broken device is:
>>>
>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>
>>> There are multiple of those integrated controllers in the system, all
>>> broken in the same way.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes since v1:
>>>  - Introduce a DEVICE BUG prefix.
>>>  - Remove extra newline.
>>>  - Fix typo in commit message.
>>> ---
>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>>  xen/include/xen/lib.h   |  3 +++
>>>  2 files changed, 48 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>>> index 54a5070733aa..4ddcefbcb274 100644
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>
>> Do we need to #include <xen/lib.h>?
> 
> Can do,

With that adjusted:
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> it's the same header that has the declarations for the printk
> functions that we already use in msix.c, so if it wasn't indirectly
> included the file won't build already.
> 
> Thanks, Roger.


