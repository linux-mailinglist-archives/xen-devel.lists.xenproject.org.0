Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB225C7451D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 14:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167396.1493716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4yG-0006Qn-TT; Thu, 20 Nov 2025 13:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167396.1493716; Thu, 20 Nov 2025 13:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4yG-0006PJ-PR; Thu, 20 Nov 2025 13:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1167396;
 Thu, 20 Nov 2025 13:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvbT=54=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vM4yE-0006PD-SS
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 13:45:10 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e307e73-c617-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 14:45:05 +0100 (CET)
Received: from SA1P222CA0191.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::24)
 by PH7PR12MB7988.namprd12.prod.outlook.com (2603:10b6:510:26a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 13:45:00 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::3) by SA1P222CA0191.outlook.office365.com
 (2603:10b6:806:3c4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 13:44:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 20 Nov 2025 13:44:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 05:44:57 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 05:44:57 -0800
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 20 Nov 2025 05:44:56 -0800
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
X-Inumbo-ID: 1e307e73-c617-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSJdiiAiulmM8fTpNYOWyC/NrH7apQwgTACBNQ0KvAPZcyntC/j2YkEaC8zZjYgLnscW+Hyt1zCM/jigl0ZY6c21rFgYDmZZ3KYHiEH56V4NFFoJxBrwiagCSJ4+lV1QnKNzselNcuWoqSZKmOvRnK1bv0GCvlmE2IZs7Ymdm6yTIGnAb5d6iy9TYSzgh1Mni1XvHV/z1F6nBLsBgwAyYAxl2Zr6C7HDeQgqSEZh0PHB/TQ6fEQMxgDSJUmGGKTnAHBKG88cPw0RS5Y7t37T0IqiUH5dvP9Us0iD+1oIoAH0kEWjpTiN+W8CqVQWZjZTbq09hpfH2Ufbt3EShMdYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kg2qsvqjIZG+K9TLdEaJarAOhIt3DN9fCLRMm3QZOWs=;
 b=iiQAqC0Ocy/718IW74i/UUD5hpvCUgm2Y1m8rrRpT2IzLhhMAgXAfLqnO+56jMG4VrkmRX1Jt9QlCWL9v3aRxhes2tEY6Z9Lm5MSxNZOfd+f1LBmL1UNc6KCAtXlj4KYQ37317+SBZbt9nkLMdzDG95YaJX/LOAAuxuWex6HjIRPwQ+0qVkJM0bk9OMHeIIAwsT6YSh8C7HNB2hMRbWmgRACpkInttlTbn5rFmCjTdv2dibnJxf6SLqh1VpHDmJlQxIwEx91T8b8M+KcOmu2c+rxoJM2SmjW2pBvAQYJX/DtJ02Ij7vZ509+u8ACnbxUFOwFTTxygeRcGVOuhGH8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kg2qsvqjIZG+K9TLdEaJarAOhIt3DN9fCLRMm3QZOWs=;
 b=XSwNuFAOlsHs5QIX2cfQOkaQaNZCBok3RlSKjPJcUiHfUJU7ABfbVwHPTBbyUuQ6ROz/PoC9EpfCsIHHN1J6g9lscJxWlW6FLzjq60mLwfc2P5JFo45lENVtQhq/tFsAkLbZdFh+ocUY/882ClsLfAYHVvbOvgnqhj+KtozFyI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c9358f1c-14bb-47df-95d4-01dfdad01c34@amd.com>
Date: Thu, 20 Nov 2025 08:44:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v8] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20251119193215.1012108-1-grygorii_strashko@epam.com>
 <dc779808-a46d-4b71-8cde-6239b4a68819@suse.com>
 <e79baedf-c619-461a-81e2-eb7eeafa648d@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e79baedf-c619-461a-81e2-eb7eeafa648d@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR12MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: c08b41d3-c519-499d-51d0-08de283afec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXFENHUrUlU0Q0NEcWk1U0djekh2Z1pkMXVlU0czbWVpdm8vOFRJaEJCY1hp?=
 =?utf-8?B?TzNhSi9WQVc5ZzB5TG5UY2dFeWJKUmhtbVNGRWw5b3VuRmFEdWR0ZGpiZHll?=
 =?utf-8?B?Ulc2TVJHVndKK0lNWGhFYkIrMTJZQ0wxbmJsbXROeGpjV3dwaDlVWDJGK2Zs?=
 =?utf-8?B?bDFYT1gwcnNuMExjem96NkU1RGFJYW54WGd3cHhML0pIV0RWUTNGcnZEaFNq?=
 =?utf-8?B?dXdYYURkVGpOVGtzK1Z2YkQ1UTNDUXFDQVR0aWFKTU9EbG9vVzE5Smh4Ni9y?=
 =?utf-8?B?dkRCSFZFdk5nVUZoN1ltV1lxa2U3YUVza1FDeVlQSnYxTkhob0ZQNWo3dnRr?=
 =?utf-8?B?UDhSSk85cGpSak9JT0pkZDBVNDBnTWlxSHRzL1VEWEhwWHRwbXJEOEVLaHhD?=
 =?utf-8?B?a3pDOERLaUExbFY4KzM3VExaQmIrbXBrQmRPM0RkMjgwdVVHbFQvaXFwMTVC?=
 =?utf-8?B?aDN1bWJxeDQ3SlExK1hPb1RMYlZocnBDVm1qWXN3YWVpZWZMWFl1WXdIMmZm?=
 =?utf-8?B?MzhLdHYyMmlUZFVCekdZK20xM3FpTytTeXZaQjVIVXpwMXltQjk4dW5zcGZW?=
 =?utf-8?B?UTNUV3dOUGxkZkNIWEE0UUZRYjJkcVk3ay9tV2FJMXYySEtxVzlhVVkxWDc2?=
 =?utf-8?B?NnBvV2lGTDQyMSt5K2s1VWJSMWdqZ0gzT09IbGZmL0xUWWR5cW1RaVlSYVZI?=
 =?utf-8?B?VEFaNC80OEdRUkVtWTZua1pmUHYyQW1ESmNCSWxpVGhwTVAyVXJIakoxaXRq?=
 =?utf-8?B?N2kzRWVsL1VJZ2xOS3BCRm05UlJTamV3dkpLVDdVMWRCQWk1cGZmMHIvMHQ2?=
 =?utf-8?B?bGRBNUdEZURnSEEwVENzRmJrVkVUdFlGQTd1WnZES1ZlajE0amc2TkR0Z2N3?=
 =?utf-8?B?N3lzTXRpN212MGVMV3FXWTRnMHBoay9zL0xaQStpeG5ZWkpSWlhZZTlnTXBL?=
 =?utf-8?B?alJUcDVEK3JYY002L203OU55dFUwWE5MZmVnRzN6VVdYRi9HVnlJWDVXUjRl?=
 =?utf-8?B?WW1WNU13YmNlYXA3bEUvT012SnBMZzJFRDFwY05BZkVjcEhPSlhKWWx4RHY3?=
 =?utf-8?B?WjVBVlB5OVFDNUc1ZkUwYWNHOE1yV1ZESE5zWXRjeDd4QmJwV0NwTkhhVVp2?=
 =?utf-8?B?T0NNMmQybkpTV0N6NC81Q21YbVAyVTRQd0RhaXdNZ3FGUWIreWVkV09WY0h1?=
 =?utf-8?B?SGxkWnV1UXZvVmtETnRXdGlrTmc3eEhNbFBLMDloT2FUMUlRbzlxd0xWNUdN?=
 =?utf-8?B?dHZsZDNOM25GODIrdUFwQllhSi9QYWVTU3ZRMDJ4emYvV1VPbjhWQ1RFY1Bu?=
 =?utf-8?B?UjdCY1A3MWx4YU9pcGs0TGo2ZXZVWnN0bEFvNDVwQUZRR1EwSTJ4MklKU1J4?=
 =?utf-8?B?M3NxU3h3YjVKdEY5L0wzMVJnbHV0bDZoYUpOd2RsSktaa09ISkJsSWJoZDV3?=
 =?utf-8?B?cnAvUnBPRmZHL0dQK0xLVksvSFphYnJDb2NSM0F4VFBxTVpLVTlYNzdBMGd4?=
 =?utf-8?B?UThtTG5xWEhrTzEwUjl4cFJ6SndXZHh5VkgzSXREMnFqeHB2UTFqZ2FCSVp2?=
 =?utf-8?B?aGprWVZUSWdkMHhvTHl4L21lSFlQZDJtNTRBejdyYkhLYktmak9FbTY3K0Nk?=
 =?utf-8?B?cHpIZ0M1ZzhEOFNyVkxsVE5VcnJmblVIb2FqU1Q1NjB0c2Z6WnAzaGM3VnJF?=
 =?utf-8?B?ZFdqV0p3ZXF0RlNPMk4zL3BYc0RqMTdUanpyaEEvdWladzJCckV4T1BaUXND?=
 =?utf-8?B?NFRydjFHOXNVTGl3SFEwenlsY09QUFN3a2hWa3UvQWRmbW5oU2V0b2xLZ28w?=
 =?utf-8?B?U3VLOGduSEJMYjRIWnF1YzdXSzVIOTJvNXo3T040eWFsOERzVUVOSldVZDl1?=
 =?utf-8?B?akVQOFUveHFid2dQcE9ES250MytLOExicy8zSjVORlJWQ0NXRDlMNUZzdCtG?=
 =?utf-8?B?OE9zQ2xXR1JMTFdOUDBqYWFhZ0x3S2xMZDgvNDlYeDFza3hEV3l1NnZZZm5M?=
 =?utf-8?B?WTdBZFdJOXBCTC9CQ1JIa0NweU5UdTRkZkd0NVpqczJnTGdrbWwvZXVKUjZV?=
 =?utf-8?B?dVZqUEp6dTdnZlRjUzVIK0IvK3lrTGJ3NlNXNG9tYUwvNkVaQWZ5Y3hQN1hs?=
 =?utf-8?Q?bIwY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:58.0130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c08b41d3-c519-499d-51d0-08de283afec5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7988

On 2025-11-20 05:42, Grygorii Strashko wrote:
> Hi Jan,
> 
> On 20.11.25 10:50, Jan Beulich wrote:
>> (adding v8 tag to subject)
>>
>> On 19.11.2025 20:32, Grygorii Strashko wrote:
>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>
>>> Add config option VIRIDIAN that covers viridian code within HVM.
>>> Calls to viridian functions guarded by is_viridian_domain() and 
>>> related macros.
>>> Having this option may be beneficial by reducing code footprint for 
>>> systems
>>> that are not using Hyper-V.
>>>
>>> [grygorii_strashko@epam.com: fixed NULL pointer deref in
>>> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> As before - this R-b likely would need dropping, ...
>>
>>> ---
>>> changes in v8:
>>> - drop checks from viridian_load_vcpu/domain_ctxt()
>>> - drop check "value != 0" in HVM_PARAM_VIRIDIAN handler, laways return
>>>    -ENODEV for VIRIDIAN=n
>>
>> ... when more than just cosmetic changes are made. Jason, please can you
>> indicate whether it's fine to retain?

Yes.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

