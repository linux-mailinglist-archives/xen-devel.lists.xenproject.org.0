Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F305691A60C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750006.1158257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnof-0005tc-35; Thu, 27 Jun 2024 12:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750006.1158257; Thu, 27 Jun 2024 12:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnof-0005rj-00; Thu, 27 Jun 2024 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 750006;
 Thu, 27 Jun 2024 12:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LqiX=N5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sMnod-0005k3-Sy
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 12:01:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa0fed2f-347c-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 14:01:25 +0200 (CEST)
Received: from CH2PR02CA0022.namprd02.prod.outlook.com (2603:10b6:610:4e::32)
 by LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 12:01:21 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::9b) by CH2PR02CA0022.outlook.office365.com
 (2603:10b6:610:4e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Thu, 27 Jun 2024 12:01:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 12:01:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 07:01:20 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Jun 2024 07:01:19 -0500
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
X-Inumbo-ID: fa0fed2f-347c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVQCDW25BBeZXJQq7Sfgf+JNbfN5GSHaCBXg6KNGbMr65cnXhw0Ls+/5SqhcKMAM7NCnl5U67UXenHVXjzfPmXJ5XlMOPvbSvOePO1eesF2sSi8796HFBhRiWSKWCQsEIf0fopcWrYUssHv3kzTbjq2ezPFf9LpuW7N8RN3XXL/Iur2lhYuuz3Echmms8KjHMJYXEwRQlwgbtFLPi55HzmKZqJinCBzYyHlRbKRXRDB9Awf3kDbQafG6dBK9L7STTJsU3DGx+gmCj2H3Cq2H36J+fjiBs7Zkes3VuNdPnmDPlK9faVLDaR51lXdvq313N2bR9B+amkRwqlBgFBaqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zopRGf0SiJVOAOBufZsTLCwsUY4uwnCSzqb5Ja9hr5M=;
 b=DFucPRw00gEuEnEEbTg/jNomP+uePdIpjIOW3eE2tuUQJu60sNC8RxKg0rprS0DCRenMEYAVLumyHuy8DQqGLVUEWhbZBOjxZcUazIhCFJly2vfF/3yNziXL+opd2BpdHevY4FZZcgQQh5eWhf4ugvhWmj1iPX3eq/Q9mEq1cPsoegKAS0B7U2ze89cPGsUUnwvGWvFauWKTSWf9+Z1il0LsqZaZkFzwKIPTJSnfW9dabsuz6bsPO9A8vhruim8WZxRehVm7HjIpZLnEosXsa8qKdvJKN8lc/bhMGagx1eVuGPZ/1MoDSvm7kh664v/7kZ8xfFnXIVxdZghmE7l8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zopRGf0SiJVOAOBufZsTLCwsUY4uwnCSzqb5Ja9hr5M=;
 b=mssJv23cbdNmO+/DeUt5AiKPtX4QDenVAKRS2OHdV4V8P1MLUFPqsbbcJYqaWo1KXG1LaAZghBs7r8ARElW+XSPyP+p6uu7cE4KX7s/iEUDyx+jtyg55Lyd8dwC0Mpk0NVQijc3U2NR/Kl8o/Rn/IPr6MLye9v6F76vPejpen2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <03bad4dd-9d6e-4341-b72c-5bb516f3ce36@amd.com>
Date: Thu, 27 Jun 2024 14:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
References: <20240626080428.18480-1-michal.orzel@amd.com>
 <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
 <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
 <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 2787f05a-64dd-4f39-eb47-08dc96a0dc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjZoRDRSSzI4aUVmSkVtdlRWczhJRVhhdnAyak1GOXd0bFJlSDJsREh5UC8r?=
 =?utf-8?B?VXhxM0RKYVVCZEFCRjZsU0IxaWExMFN1YlIvVGVkRmxUekZPQzk1aHdFZVFL?=
 =?utf-8?B?WGw3MkNZOUltN1d0Z1dWRjVkaU9FSmRFQXVCQzJFSG4vVFZmSFdmclFuaUxT?=
 =?utf-8?B?TTlJeUduWjV5dlhoY28zVE5jNmgydGJyazByaC9IRVBBc1N6aUJxbFVkakw2?=
 =?utf-8?B?bEFydXV2cENqbjNPd01PSEtRd3lCUTBvbjNxTS9Fbk5PRCtueDhtdHZDVUph?=
 =?utf-8?B?cVFzekgvb0hhSklqSlpvRVFlVVd4d2k4OE1YWkRzN3FReHNVeDlFNWtwMmxk?=
 =?utf-8?B?M2RyMTA0U3lPT0VFakRncjk2bVhPdkpOdVVmRDRvQ2tOZjNvRmVlVnpTcnFw?=
 =?utf-8?B?ZGpldUo3RU9jckJ5KzdHdWt5Q1VvWk5weUZ5QnBZK0RPeWZ2UzJ4UjIxakd5?=
 =?utf-8?B?Y04rQnduUE13Nis0dzc2SS90NkFwUk9aTlUvNVU3b0RFTEI3dkk0WWI2bDEv?=
 =?utf-8?B?djJvMkcrYTFMUEZ2dWZ1b25xK3FWOE9CY1VWd1U4M0tBSEFaVU5TRnBzaXpx?=
 =?utf-8?B?enhtWDJiNUhqbHFkZzNRRTdsMXVVcks2U3k4ZlpaZ3hYYXhEMXhDamtkZ0Ro?=
 =?utf-8?B?SWxkRGhjZXpJR0ZFSjcxaUdpZTlEd012aU1uelREZmdNcnJ4eThvVExPQ2Q2?=
 =?utf-8?B?QWZsUkVMWjBZdWFzenlIT0VrVGhmRTBhdzVkWTFFTCtsT2R5NmU1M1BKeUxK?=
 =?utf-8?B?Yy9lYXY4M3JzbG43enhSYkZlOEsyVXZhSmVPM2xIMUVGY3F2VXBtVi95Z0tK?=
 =?utf-8?B?L0lpMDRnaWJ4bi84TnhWTHk2bFNnNUJEN0podnBUckJ2SWJCS3pnZ3NjdFlR?=
 =?utf-8?B?MU9IMkJPQTBrUGlKWVdyUDhqQWowazl5clVuWFJpQi9TWlFvYTJTVlBhV2RS?=
 =?utf-8?B?RE5Lc1Q3V3NvVEQvSWRZSmUxOE9FbzZVbEtwSENEZ284cE0xWmkvZmxCeEpa?=
 =?utf-8?B?ZG52ZW5KZ0VvUXZpOUZCTnlVK3FZM3NOd2pvZ2FXcmpyVlNac1YrL0VXVkRK?=
 =?utf-8?B?V3h0T1NmZVRISndrdFUzOE5yOUZFNzM3MjFSZzNVaTVQUm0wRHpIWHl0SEhJ?=
 =?utf-8?B?WWp1NCs3SlRjeTJsWXpXN09uN2hCQVZLVkdWL3BOZkN3VW5rUUJDRVNZMFVF?=
 =?utf-8?B?TStOVjcyY1B4T1EwSm1uWnBBa1FQUVVnM292TzN6NmFQVXNUcnU3L285L2Nw?=
 =?utf-8?B?bFhaV1hEQ1k5bWhsdDFid2Q0eFpTSUxleHZ1QVlwdy8wZ2JzVWM0Y3UwU1Bv?=
 =?utf-8?B?VUVPNVVXL3JwM241VTFzMUpzWVVGbE5ENVlHN2ViQUJ1d3lCSnkyVEFFR1Fs?=
 =?utf-8?B?R1lyZFFrMStjWUtxNiszam12MWdEdUZ6NmdsdmFiU0tqUnV6ekdJK3Vaem1s?=
 =?utf-8?B?eHppN2ttdHlvNmNXMFRIb0trS2VUMjhwOFVCM1E5WHRZUGtMVkhZTFNuMmhO?=
 =?utf-8?B?M3BHYkx6Q3poK0ZoSlBVcVhKaklDc1ZKME1LVUxLWEhBRmErL01vRUZTOGpa?=
 =?utf-8?B?cXNkaUVEdjJIcFpzSEloUWhrMTc0QU5zVjRqRGRMbit2WTVLWEpkSFRnT2xD?=
 =?utf-8?B?ZUtUSVRETU1JYTdQa3M4NjNwK24xRVdEZEo4ZU5VOEVVQjV2NmdHWG5qRzJ0?=
 =?utf-8?B?Y0ltMGpBWnhkYm5NMzFDTEpaZlJaQk9FVFh2cTJnVlZMQnEyTU1paEVOQWU4?=
 =?utf-8?B?c1FHQkhlSkVPbXBXcUZkMUZtVzBSNWVpTzBNS3YwaXlhUCtaUEtGOVRMcUFp?=
 =?utf-8?B?VWZYWkJ6R1RpSzNoTm9makFLYWFLTEVFWWx6V0RkOVJRWVRmaXZULzlYd3R5?=
 =?utf-8?B?cEVuMlV6Nkt5NWpZbERaRFA1cmo5VHQzUy91allPcEEwM2N3ZldUd2M4VzF2?=
 =?utf-8?Q?SUao7E7udu543ksreCdPeQPrdoPZYfao?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 12:01:21.3621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2787f05a-64dd-4f39-eb47-08dc96a0dc47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207



On 27/06/2024 12:32, Julien Grall wrote:
> 
> 
> On 27/06/2024 08:40, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 26/06/2024 22:13, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 26/06/2024 09:04, Michal Orzel wrote:
>>>> Memory node probing is done as part of early_scan_node() that is called
>>>> for each node with depth >= 1 (root node is at depth 0). According to
>>>> Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
>>>> as a top level node. However, Xen incorrectly considers all the nodes with
>>>> unit node name "memory" as RAM. This buggy behavior can result in a
>>>> failure if there are other nodes in the device tree (at depth >= 2) with
>>>> "memory" as unit node name. An example can be a "memory@xxx" node under
>>>> /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
>>>> perform all the required checks to assess if a node is a proper /memory
>>>> node.
>>>>
>>>> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> 4.19: This patch is fixing a possible early boot Xen failure (before main
>>>> console is initialized). In my case it results in a warning "Shattering
>>>> superpage is not supported" and panic "Unable to setup the directmap mappings".
>>>>
>>>> If this is too late for this patch to go in, we can backport it after the tree
>>>> re-opens.
>>>
>>> The code looks correct to me, but I am not sure about merging it to 4.19.
>>>
>>> This is not a new bug (in fact has been there since pretty much Xen on
>>> Arm was created) and we haven't seen any report until today. So in some
>>> way it would be best to merge it after 4.19 so it can get more testing.
>>>
>>> In the other hand, I guess this will block you. Is this a new platform?
>>> Is it available?
>> Stefano answered this question. Also, IMO this change is quite straightforward
>> and does not introduce any engineering doubt, so I'm not really sure if it needs
>> more testing.
> 
> At this stage of the release we should think whether the bug is critical
> enough (rather than the risk is low enough) to be merged. IMHO, it is
> not because this has been there for the past 12 years...
> 
> But if we focus on the "riskness". We are rightly changing an interface
> which possibly someone may have (bogusly) relied on. So there is a
> lowish risk that you may end up to break use-case late in the release
> (we are a couple of weeks away) for use-case that never worked in the
> past 12 years.
> 
> We should also think what the worse that can happen if there is a bug in
> your series. The worse is we would not be able to boot on already
> supported platform. This would be quite a bad regression this late in
> the release. For Device-Tree parsing, I don't think it is enough to just
> test on just a handful of platforms this late in the release.
> 
> Which is why to me the answer to "It should be in 4.19" is not
> straightforward. If we merge post 4.19, then we give the chance to
> people to test, update & adjust their setup if needed.
> 
> Anyway, ultimately this is Oleksii's decision as the release manager.
Ok, I agree with your reasoning.

> 
> [...]
> 
>>>> +/*
>>>> + * Check if a node is a proper /memory node according to Devicetree
>>>> + * Specification v0.4, chapter 3.4.
>>>> + */
>>>> +static bool __init device_tree_is_memory_node(const void *fdt, int node,
>>>> +                                              int depth)
>>>> +{
>>>> +    const char *type;
>>>> +    int len;
>>>> +
>>>> +    if ( depth != 1 )
>>>> +        return false;
>>>> +
>>>> +    if ( !device_tree_node_matches(fdt, node, "memory") )
>>>> +        return false;
>>>> +
>>>> +    type = fdt_getprop(fdt, node, "device_type", &len);
>>>> +    if ( !type )
>>>> +        return false;
>>>> +
>>>> +    if ( (len <= 0) || strcmp(type, "memory") )
>>>
>>> I would consider to use strncmp() to avoid relying on the property to be
>>> well-formed (i.e. nul-terminated).
>> Are you sure? AFAIR, libfdt returns NULL and -FDT_ERR_TRUNCATED as len if a string is non null terminated.
> 
> I can't find such code in path. Do you have any pointer?
I checked and I cannot find such code either. I made the wrong assumption thinking that fdt_getprop can only work with strings.
Therefore, I'm ok with changing s/strcmp/strncmp/ for hardening. Shall I respin the patch marking it as for-4.20?


~Michal

