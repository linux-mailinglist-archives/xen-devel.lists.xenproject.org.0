Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9001DB3E171
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104527.1455562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2fC-0000Yd-18; Mon, 01 Sep 2025 11:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104527.1455562; Mon, 01 Sep 2025 11:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2fB-0000Vw-Tp; Mon, 01 Sep 2025 11:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1104527;
 Mon, 01 Sep 2025 11:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RBY=3M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ut2f9-0000Vq-UV
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:25:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b18d703-8726-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:25:26 +0200 (CEST)
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 11:25:22 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:334:cafe::3c) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14 via Frontend Transport; Mon,
 1 Sep 2025 11:25:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Mon, 1 Sep 2025 11:25:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:25:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:25:14 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 06:25:13 -0500
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
X-Inumbo-ID: 5b18d703-8726-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSDrvNHkseGd5OgwAQaULKhskN+oALDUMws1Bry+7JRMGznF+Au8F/X3ye8vfBWcIxRDyZm+e1kGo/4LLBDFAOv1tq9DVNXGOMNWj1YPftxCimtE+woUKaM0zcUtTU1iDLqNKwhifmn65lvB9mwW0J7pc81AMAQJ0bbG8S2Gys6c0f1+sZCqhPyPoIlM3OcRmYv/nv50R3ONppHpw5Tx/doYId8SDAUSrlB3yrPUUebjjiXWEdSk60NJpCMeRM7Pu1cjgfNrLxS4meSVAJMmnCj+A9Z2E+z/EWkSux91SOvWJQqy7g2oLCTIh2O5qZEKIHSfVnPgGRJOKt6cwdLlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lY+PfkKFnxrCbnL2IIXOubHGUZpoEuEuP7kTOb4ktw=;
 b=t9wH5y36+izy8TLN9gSfqh4YDcFYibkR5nnlfcXfrkUcfFj9bfyhEYCwu6QexEcUEyJObMfRTD9DW5tdxwTT6yGJZlVLWnZ5NmVx5c7+ipulP0Za1alz058NXZLz58CT9FNvwamdue2wnGG+46MQqakAHwm0G07+hq5oNexLKKukVlJGadgzFh8FFpFzs1H1zgDHSd5O0Pgwhc0UdKUkBRp+bcx7kiPIzW0G22Jsv6yba3wpo6/KItQQQPuQP8cp9RKMLHS/t3Trf8YbziJiUmpywBD0yv8RGAptHy+KqSeyVzLQvhwY34euSKL5qr2WWIgfCvetcSZp8qXaJTWJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lY+PfkKFnxrCbnL2IIXOubHGUZpoEuEuP7kTOb4ktw=;
 b=AOe06Mgwc5YLdRZRdV8sdgVJ2He1kJ4D0B0WiGGmo9bztR9cN+IHVxbQQy6i49ra6tr3odyqFjXh809bCY0lqNeM89s+g9e1irTF3EqjIbD2mut4JLtQYpKaLxSiZa6ywL+FOGwR3PMPxXh85kf2TUsggmHeAV6E68s2NVMKOKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4f59cfd8-dff6-4ac0-beda-13ccd161d628@amd.com>
Date: Mon, 1 Sep 2025 13:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Fix AMD_SVM and INTEL_VMX dependency
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250901104329.25693-1-michal.orzel@amd.com>
 <4012a431-0d1d-400e-a0f4-b2ece3439441@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4012a431-0d1d-400e-a0f4-b2ece3439441@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: da757508-db03-434f-459e-08dde94a3c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXVYY0t0bHM4Z0JpYWJhZkxuTlorMjNwclk0Y05tUTkrMVV6WGpMeDdQSWp0?=
 =?utf-8?B?c1VoTXpVZjYzQ3JvV0QzS3pxNDBjS0lvdUEweHpPSHFPd2lxSW4yMStYZWI1?=
 =?utf-8?B?bFFrZGNJdW9sVjR6dzhCZjhHQmc3di81dG50NEx5ZmNrdFgwK3Q5NWtBWTZp?=
 =?utf-8?B?YU8vSmJTR2ROejE5YU4rczE4VmNDUXp2TFp5RUZQQTJEYWoyUWlEbWFrVHAx?=
 =?utf-8?B?RzFFNkVSdHl4N1hYQnRTYXBQa2ZJL3dIL0pxOER1NGZkVmdkdytPanlCOTVQ?=
 =?utf-8?B?MlI1RXl4Y3RWMnJyeHdOWEVUWEoxMTAwRnQ0N1FaL3BMd05ZREgwMWpTaEw1?=
 =?utf-8?B?aHBXeGIrVkhXU1BQZ3M2Q0xZYWNkVFBzanBqU3BINHRsaTFJSTNOdzU1TGcz?=
 =?utf-8?B?QnBLMnFud2doSnJkSDErUXQvaUl0UzdVUGZPeE8wZ2NLMlR2QkxyVUJsOS9j?=
 =?utf-8?B?NXFPdDdOQ0E1T25jV2dmY3dWYWVibGVucFdiRnVmYnZld0JhdTFUM1F5Sng4?=
 =?utf-8?B?Vm1SK3h5SVVhdm5DSGJtaFVWb3ZISzNFd0h3SUlmLzRXU0F6OXBIOEJYTERy?=
 =?utf-8?B?ZHRib2NnZ1hlM21jc1BMaHYvVlFibEhnaTd3OEp1bEhERDlsMDk4dXFGeWdj?=
 =?utf-8?B?N0VHMG1YelR4QVdvL2VSNG5seThiVVNwMnBZcCtOKzhLZUJlVk9TRk5tbnZj?=
 =?utf-8?B?OW1XVkJmSnpnUWZ4OGxXS2tkUFVNM0FvcGd2Y3BhN3g1TCtjUDhiU3FzNXV2?=
 =?utf-8?B?ZWNLZm13K0NGdzltU3FCcGZSZFVpcDBQYnVMTFRaNkhyNHc1LzZ1OUt4b1BG?=
 =?utf-8?B?UzFCWGxEVlVMZE11MGNORW9zS0hxSk9UZEczNSsvQS94V2l0cDgrSEN2SjNz?=
 =?utf-8?B?TUR3SUMwcC93aE9rcjhXTlRaMFdZd2RDTmY3QUNpRC9LdjVaZGR2RndGOTFG?=
 =?utf-8?B?WjJva01OakZDREhnenNjZHJUcjdkd3J0TFVSc3IwRUdQUWtGdWorV05ydkFy?=
 =?utf-8?B?ZlZ1QVR6d1VwaVQ2T09hU3U1YXBMLytNWVhVa2RKRTA5MW5FU0tIeENSZDV2?=
 =?utf-8?B?dnl3cVFRaFZ2Y2hybmFUdDdWUkFINTZBVkZYaHUrQUhTQUppWXBBNlBURU4w?=
 =?utf-8?B?ZGxjMFhXdTBEQVVRaXpjSTRRV1JFenJUVEwyYWVpdHJHWjMvTmdOM210SHl6?=
 =?utf-8?B?ZklvaDYyVGExcFc5bEpBeXlHQlRSVjJmUU5wSzJEUktESFRnNms5TXlSNFRs?=
 =?utf-8?B?TmY2TE5sK050Vk0yLzJZVEJKUmYxOTArV3hPelJTT1RERURPUThTS2JMMk5X?=
 =?utf-8?B?Y2FwZHdVN1hQWGV0clhFb0VpbUpYZU1zVjNZRW5MQ1NyYm1xK3gwb080Njdk?=
 =?utf-8?B?eE9zZTBsSmxmNlZtaGRvSkFWTmZsci9aNEVGZStwR2haYmU1Tkc4WStWRmMz?=
 =?utf-8?B?ZkVOTU5uQlZEMUZ1eDc3bmlzQ3llNThQRjJOOGk5aGxreWYyQW15UHppTFV4?=
 =?utf-8?B?QnRiL3JWQ2dWek84YkJRNlRRSFdud01hWHdFOW05VTM1ZDNQb2NmeENLd2da?=
 =?utf-8?B?aGZnNUhXRVllemZQRWxEdjlyN21yUElNTU1PaTlRS0F4cEdrTWI1emhMa3pR?=
 =?utf-8?B?ejF6V3Zxc0NqeGhpVG5scGlNeEFuSG1IczQwLzQ1Tis4N2NrQTBxQThFUWUx?=
 =?utf-8?B?OWRFWFdQZnVtdmsrN3p1YlUzc01GaFFLUzVobElodGZKalVWR252MGQxbTZO?=
 =?utf-8?B?TjhSR2lVQ1BFa2NpZWJmSnIvUEszZ0ttdlZyL05jMlpZaWxmdGZDSEtDL0FY?=
 =?utf-8?B?OTRPdHh1ZUpiR1ZmbC9ZT2pVK2g1RFlRSnFjZnRJUHpMdkhEeVAxVkpoUUpG?=
 =?utf-8?B?eHVZOEU3VjFyUHh0Zkk3d0VYd2MyTktvTXBnTWcrRjQrV3lwUDFSd1JWN1Jm?=
 =?utf-8?B?T25EdDZNK3dKSEJZY1pxWWlrY0VyQUhEWXhLVDlLbzIybk90T28xWnBsRlFu?=
 =?utf-8?B?NHpCU2doMkRSMThQRE5rUkE2OEY3dDYvbDRiaGFwM1FIRDNBb29IYWRxdlFz?=
 =?utf-8?Q?K5sRQ/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:25:20.4760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da757508-db03-434f-459e-08dde94a3c54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304



On 01/09/2025 13:19, Jan Beulich wrote:
> On 01.09.2025 12:43, Michal Orzel wrote:
>> Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
>> INTEL_VMX on INTEL. Such dependency should be done using 'depends on'
>> and not 'if' next to prompt that deals only with the visibility of the
>> given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
>> when INTEL is disabled (option is hidden).
> 
> Hmm, yes, just that ...
> 
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -16,7 +16,8 @@ menuconfig HVM
>>  if HVM
>>  
>>  config AMD_SVM
>> -	bool "AMD-V" if AMD && EXPERT
>> +	bool "AMD-V" if EXPERT
>> +	depends on AMD
>>  	default y
>>  	help
>>  	  Enables virtual machine extensions on platforms that implement the
>> @@ -25,7 +26,8 @@ config AMD_SVM
>>  	  If in doubt, say Y.
>>  
>>  config INTEL_VMX
>> -	bool "Intel VT-x" if INTEL && EXPERT
>> +	bool "Intel VT-x" if EXPERT
>> +	depends on INTEL
>>  	default y
>>  	select ARCH_VCPU_IOREQ_COMPLETION
>>  	help
> 
> ... now it becomes impossible to _enable_ INTEL_VMX when INTEL is disabled,
> yet which may be of interest if you target some other vendor's VMX
> implementation. Perhaps really we should have
> 
> config INTEL_VMX
> 	bool "Intel VT-x" if EXPERT
>  	default INTEL
I did not think such configuration makes sense (VMX without INTEL)
which is in line with the last sentence from the mentioned commit.
I'm ok either way.

~Michal


