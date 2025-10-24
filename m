Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE5C07D65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 21:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150839.1481833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCN59-0005hx-T3; Fri, 24 Oct 2025 19:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150839.1481833; Fri, 24 Oct 2025 19:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCN59-0005gZ-QD; Fri, 24 Oct 2025 19:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1150839;
 Fri, 24 Oct 2025 19:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOOD=5B=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vCN58-0005gT-Nc
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 19:04:10 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 371a6367-b10c-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 21:04:08 +0200 (CEST)
Received: from PH7P221CA0071.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::24)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:04:03 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::d8) by PH7P221CA0071.outlook.office365.com
 (2603:10b6:510:328::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 19:04:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Fri, 24 Oct 2025 19:04:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 24 Oct
 2025 12:04:01 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Oct
 2025 14:04:01 -0500
Received: from [172.21.152.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 12:04:01 -0700
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
X-Inumbo-ID: 371a6367-b10c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHDP7OCDjyz/oMgGUBOc5LCYHO9wbQpgo7xS+9qNS05VpSxWglgavTshQw6Nw6Ao7knANiSQFMqBL0LvZ0F5bJp2JvwUazwb6Qq3j5c6GdM4JskDzXDAoAGhBJUttxH7sHuK0/hMbLXObAZFUbQkdCSzEjrHxDQPUA7JcZhRI0p+oXc07G6V2yVzXmwaGw1ZLGQMLDXIWhhqgKKiNrKhq6lucAAkLfRlOIzpINv/CnT1GQu2JZelKGIzhCSMa8KBkGQ9aqWMRlwe0NAujdThbspa8lf00WvtldXUeqVSMmn+errdtdSiMq3nfEUlUN2G7g5FUY0DmTCBIsb4+8Zntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T1rlYStEE/yrdDRrGf8S0554bESBnR4FUtrJlxJAnE=;
 b=IaaPYNsR56JgV2Phus90vSSjLFC3Z9k186At9c+2tweNZuD5HwCEwuvELmoEqG3/25qeQYhnrKfqMq6k6Imt8143FDROsc1zz5HlSTKdqpgos7MGeiYLF8VD2xeENcn0Dwd8muBe0fhpFm+F7dL3d5OitReAbdEdTZQKoifWajTjuw2+UBrkWyBS/MuU/gr2lYVdFL3OCFXYNeg5WHKbUhzdShW7czs5K8awT2q2nCmL6emQBkJml3tDXakio4ILehC2DUITJ1K5qsc+FpsByMYWlNOoQFOxJTsvZNocvFnN/+Wcv0Q/mM+Mw0/UWebBGM6cZIcoEQUdCLnaAzNjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T1rlYStEE/yrdDRrGf8S0554bESBnR4FUtrJlxJAnE=;
 b=zbtkMvqpElp1gJVFeA6MJqvoMCs5hvWA0ghgnWcSsAmOjGvWsVgA96MV4DGRuRgM2M1eDIf6K8k2L2ZDzvamZ5uwb/YiKAatIF1YrltGEzeXAhdLPrLeJOZKAH53O0bHZYE6CzWbzq4x18vfn1SaZjBArQN1JULnaUqvICnpnSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <42edeeb3-3879-4433-8c1f-1790d35e2aae@amd.com>
Date: Fri, 24 Oct 2025 15:03:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20251023085730.36628-1-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251023085730.36628-1-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a6c224-ceb9-4909-545a-08de13301898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUh4L2wzeE1mcW9FMkpvWGRpQytiQ1hnckVZZkdVY3FhNUd3a09Ka3A1dFVF?=
 =?utf-8?B?WHVRdTh1Z25QdHI3L0dKS296WDJjcUs5T1RwbmhrOGhQSHkzS1hzeWFMUnR0?=
 =?utf-8?B?K1RuZlFERUs4VysvTU9NdVByLzhDbzFmbE0ybzkyL2lFa3d5ZklNZ0Z1RkxO?=
 =?utf-8?B?MHdMc0UyUW5OMFFranV0aTRpcUtmbHJwNWZTckFGRUNIM2Z4djBqbThYcHBr?=
 =?utf-8?B?cmxnV1Q1RHBUSGgyQzNjVXBwb2NtTG5xSkplZVprSy9KL3NTVzFrWFkxZ1Fw?=
 =?utf-8?B?RGNROEExSGN1Q1hHQWkxcGpGT1VxdVNybVFiTTl3VlB2M2hVdkcvd2ZKbWdW?=
 =?utf-8?B?U3dqQlJxVC9VdThuTHA1SDlXR09LUEk0K3Y1bXBUM3hEZDlZVGhiT2ZwMlFm?=
 =?utf-8?B?emJFQmw4dEYyMmcyNVd1THJSS2pUWnJ4RWNXdklnZnJSNUxPWWVubS96VGNZ?=
 =?utf-8?B?UDQzeGtlam9WMmc0TXYzd1FSTlRDcmhpaHJUdUdXZWN6bitBbVAwSWlkVFAr?=
 =?utf-8?B?S3g2bmVXS2owaUx6R3hUQWNtUWxJREwzdU9TVi8vMGdnZE9NeVhGeEU4dUUv?=
 =?utf-8?B?UnhYZzhxN2xNMW9BcmZwU1A2NjJBckxuZ0xUR2tsMVVRTHBiTlNDanF0ZlE0?=
 =?utf-8?B?MVBzclVsaW8wTGs5NnlXWk5PclpTUWZaRVI2c1FGcDJLVEZSbXFJb3BzcXEv?=
 =?utf-8?B?LzQ1SXJ5SWh5N1RzY1NyWkZwUk1ETGVEbVZSaFVMWkRBOW52SnlsU3VZazhN?=
 =?utf-8?B?dnpGNDQ2dytwWkdWTkFUR2wxWnBuMEhKUVQrRHNxdHNkSUtHeXl5bWtBZUNX?=
 =?utf-8?B?WkVXZ1ZzNitJOGNScnFhcWprbHB5YmxxN0ZOU29HTGJEbXI4anl6QytISldH?=
 =?utf-8?B?SXZRTjNCWFNCczZ6cUlObnVkYmppUnJWSXR0cjgwVkV4VjBndERPMHBMOTFi?=
 =?utf-8?B?TTdXWmdKa09mQVVQbHlRK3d2dTIya0g1b3pOdy9VdmJWeU92N3hlVFh5RUxF?=
 =?utf-8?B?T2xsNkQ0cnE5cC82VTByOXR2T2FsNjdqaXRVenJGTTlta2M4SFdPVUFYdkFY?=
 =?utf-8?B?RXFhd3UxUmorbjhvT2pZWjdLQVFvUnZuTURzR0V4VHBhVlVvQ1lSc1ZMVEpV?=
 =?utf-8?B?Slpac0hEUktvZUIyOEtnSmxNQ3lsOUFyNkI4eUxLVnNKZC9QaWhqdk5ZdGlE?=
 =?utf-8?B?T0x4NFNUWFJLTDZFaGJPMHlqRE1TOURjWlJoRXRwQ1ZRcmh3RytaS3FxR0Ey?=
 =?utf-8?B?ek55RUc5MTJRWXpETE9yVnFmNHExS2J3cGVva0d6Z2FHTktrOHRSV01Hbzcw?=
 =?utf-8?B?V1BRWXFlU3lHdENoYUlMakV6YjN2eGhqTUgzejJpN3QxOFJFNnJXMUk5UkEw?=
 =?utf-8?B?L2NlTC9PYlJvb2lBRFk3ZlRQenExSFFIZlVhM2tjSHkra1FBZG9rZm5KL0dM?=
 =?utf-8?B?OFJRcVNENytKYzhQUmJVMkl1U0QxMDlFWElEbE5IT25iWVZDV0k3Q2Q0Tm41?=
 =?utf-8?B?WXo4SmFtdkRaMGh3YVNZblpOZ3Qzby9hckM4SjlWMG1WNkQ3RE1FQWFmUkZn?=
 =?utf-8?B?K3pJV08wNnBrdU1nU3hIK3BhRC95eWd1RnMzbGNSY0R6S0luUHowamprK2xr?=
 =?utf-8?B?V0I2VEFEazBITXRjcmNMYmlMTnFoUmxLdjhzR3RsUVFIVzQ5ZUpPT3Z3cldO?=
 =?utf-8?B?TFdVU0xLOHNPNXRQM3FkSFBqQ25VbTJrUFVxTG5TQW1tMHdDL2Z1L1hEdThV?=
 =?utf-8?B?VFRaRHFLbEMvS1A3QnNxZm5TRXFtRGEwWU1LZTRVUjd2bVlEUXRsTWRaekpW?=
 =?utf-8?B?RGVLSXhDanJLaDJjRWxKZ3lrNUsyNjc1VHZCWUhmd09KbXVmQ1hMS0RCTFNZ?=
 =?utf-8?B?UTNuaHJFZmtoUVJJY21aeVI3L0FETWVPL1lEaS8yOWtzSFFWd05iNWZHdHox?=
 =?utf-8?B?ajJCUkJmelhtRzUrYWxwOVYrZy83Y3BCaDlQZVM1ZFQ0L2MzeG5MNXdnbzRt?=
 =?utf-8?B?OWdDQzVJQ0orUWR6akJyVXpONXA1SW41TW9iNGkyUEFRMjdlOWVkOERYMU5h?=
 =?utf-8?Q?K3TIQj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:04:02.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a6c224-ceb9-4909-545a-08de13301898
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448

On 2025-10-23 04:57, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> If not available, fallback to using YAJL.
> 
> The code is using json_c_visit() which was introduced in 0.13.
> json_object_new_null() and json_object_new_uint64() where added to
> 0.14. And the last one json_object_new_array_ext() was introduced in
> 0.15.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

