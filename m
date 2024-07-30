Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1B941F25
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 20:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768039.1178781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYr9J-0006Ri-6H; Tue, 30 Jul 2024 18:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768039.1178781; Tue, 30 Jul 2024 18:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYr9J-0006P2-3c; Tue, 30 Jul 2024 18:00:37 +0000
Received: by outflank-mailman (input) for mailman id 768039;
 Tue, 30 Jul 2024 18:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2aj=O6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYr9H-0006Ou-Kw
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 18:00:35 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d8f0f37-4e9d-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 20:00:34 +0200 (CEST)
Received: from BL0PR01CA0018.prod.exchangelabs.com (2603:10b6:208:71::31) by
 DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Tue, 30 Jul 2024 17:59:27 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:71:cafe::11) by BL0PR01CA0018.outlook.office365.com
 (2603:10b6:208:71::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 30 Jul 2024 17:59:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 17:59:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 12:59:22 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 12:59:21 -0500
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
X-Inumbo-ID: 9d8f0f37-4e9d-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKWP3MxQ1RH3t67j9YehFdOVCD3XXWjPqA5AQR+/kDgxW5La5+nNWF1o05UaKaSkT/SWaokybcoUCaXHMERHrVrotf56H58VvkJgb6w7yGI94Zd6k+8WqIeCCqXv66T/tQfv8KuVUt5o1X4B4ffayVlFf8JNCHmiUgfB/CEZ7x/s1Gx+/AnUR+jPU8Gf08/Jy+z4sQsRLKAIDT2j1roBkHOV+3wVSaTIGfeEf+dw2f+NVJn9KRiSyr8PFr2v5xfLKpPtDPPY0Ne330CivYiGNtinejZo8Oz7nSTJif95C42U2oUs9c/qIQta1y/zymwnl+3oQM3OHifVIrqLadaF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hLBkBNp6xGIMHq5CfzoN6NZid8uO2Qk/Xnt+K4+0/E=;
 b=QFnMsHCXKJQJLibVIKT9k6XGC5PtZbgJIlH9MaF7c6p7WvU47IMPn0RhRqU2TnGrOKgUrEdkU3D33GZiu2IyvRSzOsSHrT2TFFWlr1NlygZe04u+oIQsIts5qozLG/HpdHRto8i0MWx2GYxyi11MXFch/ty6oCgMUT8Qtq6VNMCga89S9bTH+QKQUOSmv2vokZ2OBpTHkmo5xwYkmUrwkM2eaj5Iaen9LKV4RbBkA/G+GlUICIWkVuJBSdMeQtY9TiasNdBYJK8A/Bi9zVFSamHIHfah/IxbcHRmZcl99/24jjxJnfFwv/OdKdN5xSCi/G1vRmt499T8TQev+Y/wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hLBkBNp6xGIMHq5CfzoN6NZid8uO2Qk/Xnt+K4+0/E=;
 b=ZMb9jBqUWF+cOPpAiqoyrCCJn5Dq24SyzXNaWVRQW9xxOUZ1vQlRc9E+Mbp592TMLzHLfO/sFJEdHKu83pC883f/ZU0605PB4O+4VJI6fzWYWKiMGIE3rhkKAffwuGH5oogC4vNhXgzSoEz+dfizlGEq6MqFnO2rlNHFEuvQ+dI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0af03558-d6ec-4a5b-92bc-f088fd5697c7@amd.com>
Date: Tue, 30 Jul 2024 13:59:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <e49e00d0-0986-4382-a8c9-1934417eaffc@xen.org>
 <1cf7f9d4-9df8-423b-a033-8c93acb3cfce@amd.com>
 <8c013f47-56c9-4b43-8ec2-79230897fedb@xen.org>
Content-Language: en-US
In-Reply-To: <8c013f47-56c9-4b43-8ec2-79230897fedb@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DM6PR12MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: 975c9453-d3f2-42ae-6a88-08dcb0c15a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGNpT2dGNWJHcjd5MDZ1eHhONVJzdXJkWFBGZkFMLzNZNjVoR0dnWHgySjJw?=
 =?utf-8?B?UkhiK0FKQlNFQjV3aTFNZkkrdzRRYkFjbFYwU3MzODBodHBNMHJmSS9PbW9s?=
 =?utf-8?B?eFVmK2hDei9tZUVXYm9EYlVCZkEyRHM4RXVqbDUreGtkMWVRSjlTY1JUcXRB?=
 =?utf-8?B?VzZzSVppVlpXL2tkWUMvNitldXR0ZGhHTkRXNG8veVV3elpoOXcrRzBFa09E?=
 =?utf-8?B?Y0hDVEk2UUNybXZEa2txOW9la0JXUFU1bktUZVJJYmI4MFFueVozTlZZK2pL?=
 =?utf-8?B?UDZ4Y1hIUWJlQ3RGMmM0MU5FWTZqanc0OXJVYk1PWnRnMVlvaUdBdWFJRXlF?=
 =?utf-8?B?NzM2Mko3WkxMekltTUdHcW80bmV4RkxGcVJGT050U1dLYVg2VGtDL01XTHBr?=
 =?utf-8?B?RG5YdCtJMk5HVWZtRHJmRnVrS20vMkdMb3ptaWlCb0QwRGdFejZDZlgzOEVn?=
 =?utf-8?B?QTFtVHJMVWF0enIxcFdOcTZJTDhDbko3amxpeFo3aDRTRDJHaWpTYXJHK1F1?=
 =?utf-8?B?VkJOZkcranVCK05mOVVQQlljU3RNNGpVd041S0FnaDhlTVNTcTBQVlByRnJz?=
 =?utf-8?B?WEtRU2dBVlV0YStETkY0ZjJIbFhhNElUaEFvRTJiVnp1OGpsaytZcHNkS0xT?=
 =?utf-8?B?a0RsWk9MK29haWszQ0dNMFVuRmxJcjN4SThsK2tnUVdHRWhUWWJpQjJzL2Jk?=
 =?utf-8?B?UlFRVUZiL1VIRXk2aTYzdVFzSmZpVFg0QjdiN2NZTFl2bDN6UFhiM1lSRXVD?=
 =?utf-8?B?SC9zNzdibkhmd0pxeHllT0E2ZU9pVlFOTGJTTEtTd1F6LzJpeG8zbDh4RnBk?=
 =?utf-8?B?Tnh3TnJnOUR2RTRuOXRyYUQzTHM0bElUM05lZnRuTnlCQnlCZCt3RHFzZ2xD?=
 =?utf-8?B?RVgxVHRWY3l3SVVrYk9VQkRsVFRjcHNUUmtCdVZQSTIzSmJLb1VUTjdLUWRk?=
 =?utf-8?B?NEQ3SzEwWThDWGQ4cWFKSDcwc1ZoUkNjMFlueDlkTStLWGRheHR0bTM3dkpm?=
 =?utf-8?B?cXBUcU9KQ3ozMUIvam5qUU9CalpUcDZGN3FDVHZqVlJ1Tzg0RjVrM1ZhVGd2?=
 =?utf-8?B?dUEycXpkekw3V3A5bWR5bDFMVW8xWDRJYUZzaWttL1JKRHBVNm5vRXVBa3Rk?=
 =?utf-8?B?cTdReHUvSU94NU1ONS9tRkZKUFlMVCs2eWRCd3pGQkRsME9tVWRNZ0JjM2pV?=
 =?utf-8?B?RFh0T0pPWFJ1WEEzajVKU0RReitaOU5mSyt4QlpiSmFtT0orSWpKVEh0SWxP?=
 =?utf-8?B?Sjlubk90VVV0bGZpUFJNZXlNdmJiNE1KRWNwVVFYQ29BMGJzRHIzMlFTa2dR?=
 =?utf-8?B?M3NianV1cDNFenBIYmJLMUtNYVdOK0tZeW8rbnl5aE45N2pMbTRHbmROWDlV?=
 =?utf-8?B?aHB4NjhGRmdlbzUxL2gwb1d6ZXZ5TEhkbFZZQXNHMlQ2YTBFZFBVRXB6cEds?=
 =?utf-8?B?VThySHFVeU01K1dIMXhJWEdxT0NsZ0FUaUQxQit5Y1pSOGppR05naUk2ei9q?=
 =?utf-8?B?aTNGOFhOamNtM0Z2Y0M2V3d6anpPdXdBVG1JWnFyY0tCaVlseDFiV0szQ0Rz?=
 =?utf-8?B?Y1VxTmViQ2tncEY2a1hmZDVrbGZNS1JpRFRDelI4cDRRa2tLL2RFR2FMQjFk?=
 =?utf-8?B?TzEvTnlGNXd5MkxFU05wVkMvMmRLVnBQSHRkVGpKZFVzZzlFNldGbWw2ZEwz?=
 =?utf-8?B?em1hbjl3ODFqdzR3Z1RONm9FeXJaanZxdm9LYzgyZmcwSE1QamNCeG41VlVD?=
 =?utf-8?B?bnNoakpML1E4Q1RCL21NQU9pMStqTG95aWRpenRXKzNsM3plTFd3enVZaldZ?=
 =?utf-8?B?ejk2ZnQ5bVNuMmk5MVkrTzZIR2J2eGc3eWZoc2dLNlYyMTFmdmVZMndKTjMy?=
 =?utf-8?B?akNaQ3NPRU1UNWxCWldUSXJuVkZBVjNzVmdKWHV6bm1nSWFmM3pBU1FQc0Z0?=
 =?utf-8?Q?9/rnOoFSn6mZGI4mnHasoL8ckRCEUbbJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 17:59:27.0522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 975c9453-d3f2-42ae-6a88-08dcb0c15a5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419

On 7/29/24 16:37, Julien Grall wrote:
> Hi,
> 
> On 29/07/2024 20:40, Stewart Hildebrand wrote:
>> On 7/29/24 14:50, Julien Grall wrote:
>>> Hi again,
>>>
>>> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>>> index aac6c599f878..b4890eec7ec4 100644
>>>> --- a/xen/arch/arm/traps.c
>>>> +++ b/xen/arch/arm/traps.c
>>>> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>>>>            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>>>>    }
>>>>    +#ifdef CONFIG_DEBUG
>>>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>>>> +DEFINE_PER_CPU(unsigned char *, stack_base);
>>>
>>> While looking at the code, I just realized that this should be equivalent to current->arch.base.
>>
>> current->arch.stack
>>
>> That's true only after the idle vcpu stacks have been allocated.
>>
>>> So do we actually need stack_base?
>>
>> This is a way to enable stack instrumentation much earlier during boot
>> when we are still using the static boot stack.
> 
> Sure. But we are only partially checking the static boot stack.

The stack checking begins just a few lines into C world, after the
percpu_init_areas(), set_processor_id(), and stack_check_init() calls in
arch/arm/setup.c:start_xen().

> I am not entirely sure if there is any value for that because at that point the stack would be barely used.

The entirety of start_xen() uses the boot stack, and it makes plenty of
device tree parsing calls (where there is recursion) and performs domain
creation, which hits the stack significantly.

arch/arm/dom0less-build.c: In function ‘construct_domU’:
arch/arm/dom0less-build.c:742:19: warning: stack usage is 7824 bytes [-Wstack-usage=]
  742 | static int __init construct_domU(struct domain *d,
      |                   ^~~~~~~~~~~~~~

arch/arm/domain_build.c: In function ‘make_memory_node’:
arch/arm/domain_build.c:788:12: warning: stack usage is 4720 bytes [-Wstack-usage=]
  788 | int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
      |            ^~~~~~~~~~~~~~~~

arch/arm/domain_build.c: In function ‘construct_dom0’:
arch/arm/domain_build.c:2120:19: warning: stack usage is 7776 bytes [-Wstack-usage=]
 2120 | static int __init construct_dom0(struct domain *d)
      |                   ^~~~~~~~~~~~~~

> 
> Anyway, this is only for debug build so far, so I am ok to keep it.
> 
> Cheers,
> 


