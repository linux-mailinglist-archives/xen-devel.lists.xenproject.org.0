Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB729F771B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860850.1272830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBkW-0003Cp-Ay; Thu, 19 Dec 2024 08:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860850.1272830; Thu, 19 Dec 2024 08:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBkW-0003Ac-6m; Thu, 19 Dec 2024 08:19:12 +0000
Received: by outflank-mailman (input) for mailman id 860850;
 Thu, 19 Dec 2024 08:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QrUY=TM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOBkU-0002xG-4G
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:19:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb012ed-bde1-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:19:09 +0100 (CET)
Received: from MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::22)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 08:19:05 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::59) by MW4P223CA0017.outlook.office365.com
 (2603:10b6:303:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 08:19:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 08:19:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 02:19:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 02:19:01 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 02:18:59 -0600
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
X-Inumbo-ID: ebb012ed-bde1-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7FwgRc4HOLWIaSCg26SK8NxgUVYjVipevLfVSgsrpIOT1brh3pV5DW+q09WvjOZjXXGwSiHpKPQseipktmlUcKy8ed5cQX6umoTqGjcasx8CYX3lE2TAhV2Y5Ua48F9M2MVNh5foPVPGgk5R6dE+fsUdbIGp35u2sEVuGvS1JjQEfainZLg7NxD2qu+mEurqhrv7vb4lkK2OBq7FVaNuaHZzCerhXd5+zqG2gmQODhXiUD20mfYw1J2IZeirldWof3LXtiaKH6IZCbuSrV1qC7Vq9zz2WDr7g9ZIU4TTNY25h3eVCaAPO8Ktjg6HS45ceB4ZKfggo4ZUC+ch2kFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb0Jwr8ZAr5STYERUAS8FBU5YnufPumQ0+feLCaQuAs=;
 b=JLXuRCX9lmeNCAbSPE10vtNnSyOqd1bQBaVa7IZSRDYwYAJaTn2sv97iQ7zcNubCH2pssWcB7lGSUN5l2TIShNbCGWjJS3j8AljbGOJiyj44QNXzRqfqfVS131lJ02n1qdByjRAiNmD0iPYH6oogULz9EmS5J1JuONGhMtRpP71gfZXqVy06ujYkgnf83e5Q1N3u6koqPATTycUasg2AY40NYYQ2XbFLTmKNnIyGJ6k7E3dy+QxXGf+a0OzEzcQWsHm0mnnCJJgwMTh+QwBkcjIHkialYmXjJTq7uS2xxrDMe/ODxcNE4/3tnTtkwdq3NXmZT8KAOrM5gxohVPnm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb0Jwr8ZAr5STYERUAS8FBU5YnufPumQ0+feLCaQuAs=;
 b=oHe8/9GTbmsmKv+DhSWnN2dRmhxF6rIRBKAj889ypIM1cwtC6J4aN8IDTiL6zmJwBGiIYPEQdOYX1XU5n7X2wMP7vm4Tbf1EoDRSS/AYm3+cs28myW5KhPXX4l6Rixys6wLKoHbRGAg1GK+UVnYX6yAspyKPKMwOIdfZirvt+2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <76b582ab-ede7-4fcd-9de3-247265ca862d@amd.com>
Date: Thu, 19 Dec 2024 09:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Julien Grall
	<julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
 <2423b111-0a3e-42f8-a11e-02d81fa75eb5@amd.com>
 <1f17eea5-c3cd-4a78-9973-b5996bb1dd1e@apertussolutions.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1f17eea5-c3cd-4a78-9973-b5996bb1dd1e@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 049d64cf-5048-4537-dc75-08dd2005cd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm80V25DaDZBUW0vMHEvTGFEU2Q0Yll2ZWdwMXJIK29UWjRkVGJWMloya2hp?=
 =?utf-8?B?Kys0SWFSYjZKaVRQM0xxOVJIbzZOZlBIeG1lVEc4czhBaml5OXhvL0pmcDFl?=
 =?utf-8?B?bWY0cGlKN2ppNTVPaGVvYkNNNDluZHdRaHhWMVBzOUU4cHNtRnU0Qm1DZnh3?=
 =?utf-8?B?ay9BWjlmbGRzOUdNOW1SbGlyc3R4ZEpQaUszc1dFQUI1S3Fyc0ZQcEdtbWth?=
 =?utf-8?B?R1Ayd3VVUkE2Q0V4c3hTelhxQStmSWRSRWJVL2pLakVxb2Vzc2hjQ2NxTmFk?=
 =?utf-8?B?MGNCS1pDeWhXRDZ3RndtQUQwZmJvcHNETllPYW4ycEEwWTlqUmthLzAzWVdC?=
 =?utf-8?B?UnZpTlpkWDFDby9vaDM1ZEpUTFI2WUlHZVVkTkV1aFhPZ3hNMHE1QnRPclBr?=
 =?utf-8?B?bEJJUFFRaXhmUFVZb2xGaDg5dGVYT2NNQTFWZk44VW1MdnhvU2V0UExaOVp3?=
 =?utf-8?B?S0FsRDg3NmpPaGtyTHNtVjRvK3hqUmdjaW9rRXNJNmMrYWc0a3padGlGY2Vq?=
 =?utf-8?B?Q3p5bUhyZjhzNkNyRzh5Q2VJY0dOQ1FURUN4ZWlyQ0I3by9Yekd4SC9pa2hX?=
 =?utf-8?B?R2J3Z1ZkbEZWVldRdGNVVkVMTlJEQXJJU1ZGT3F3S1kxc2JPNWdFck1WNXJi?=
 =?utf-8?B?Y1pKeGVmWWQ1OEVlM1RNODBHVjE2b3lVSHdYRUxMa0doaVMyOW9Vd3FXT0xQ?=
 =?utf-8?B?cHN4eVdNSXZ5RG56Z3YyUDJnTmlPWDdpOTI0NzA2QUJvaktDYVNMbThPb3lG?=
 =?utf-8?B?NjhSVFJleENUeDRjRzdCK012NTdzdFRsK1o5V0JtS0pTUkR0TElNak0vWkpH?=
 =?utf-8?B?M2ZRbWhyeUYzL3pOaXhwUnVpLy81VDVEL2x5SHIyZzFEZHRMNzBwZmhPbzla?=
 =?utf-8?B?NFJGWTR2WUR0SVVkWFo0blFTUmFHMDA1OUtDL0R3NmxqUU9tWmpvVjZjbHZW?=
 =?utf-8?B?OXhZZmNNd1JKRFVyR29uWnlXU0tSeVNyV0hTd3pYRnZGVmlrTVRxRWhXUEhO?=
 =?utf-8?B?c0gxOXJ6TkNsVXhzbkxKeG1XYk5hcy82QU9jbklpSlhZVHZMZ3lUc0VPVDV2?=
 =?utf-8?B?RGVrR1pKZGdCU2g2M2M1QkhzV0s1ZVZqNldpV1QvTVNBbWhwSDVGTGVvSUxj?=
 =?utf-8?B?NHBIOHdMVHF0M0ZsVEZRcmU1M0FTNnRIV000bG9FR3c0TUZsNjNaOHA1dzlO?=
 =?utf-8?B?WDZZcWhCM2ZhSUQxUjVvOXRQUHpCMDdZWXI1M2owY3BLQjMvREFqVE1uNWd6?=
 =?utf-8?B?SlRtYVJKSnFjellPK05veUF5OW5jSmozZ1RlczNvWXRuY1h2Y3dZMGZpYXpJ?=
 =?utf-8?B?K1h4ZVZnL2RKUmtpa3c5clhETlJHWjg5MDVmRE9NNGdpb3BnbUowWTFOcUpS?=
 =?utf-8?B?eEkyWms3YnovU1BxYXpjQ09RVHNaVDFIQ01mZmdxQXF2eHphYkxjTCt0enEr?=
 =?utf-8?B?VWNZcDJsZFl1RncwekwzR0lac2hNUi8xT1QyU09uUCtPMkxNV0ZDand2V1lI?=
 =?utf-8?B?MW1lWURPOWk1bEhGVEZpOFpSM3ZMaXB5WmtNSW5WMHlobnZRU3g0b2hJc0Ix?=
 =?utf-8?B?R29neHVVNlU0eER5TGZBWGFSbDFyRTVuaHByNkJUQ1REYm02SUIxZWRrT3FC?=
 =?utf-8?B?OEZPM3ZrdkdxcTg0WUtVL1hpdkZpQmVXQkVIUldxb3c2a1ZNbUY3K1VwUGxr?=
 =?utf-8?B?R0tvamFDclRDVE5rN2h0Mlp2aGpDSGxDYTJGam1VYUZzT204SGVyZmtWVjBV?=
 =?utf-8?B?Y213U21QNHNBa3ovODZsejdaSHVaMTVjVXZNUjhzOHNGQSs1VjZkTW5iQzBl?=
 =?utf-8?B?NmFINW1xRnZZMWFkMmVyZVF2eXI2UDFvZ3djTXMwc3pRSnlBbk9GeW5ZN2NS?=
 =?utf-8?B?cklOTFNiZzdnZ0NhdzNHUXZwYXNYbHlNWU12VmIydW5iNnBPR21SaTF6dlRH?=
 =?utf-8?B?Y2xEK05BKy9OWklCUUNYbUdza29lVlhoQklTUEZUNGFkWVVySWtsRWhIY0lN?=
 =?utf-8?Q?tWBmBgyhZqI/RgIHenzWUc3fwJOEjc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 08:19:04.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 049d64cf-5048-4537-dc75-08dd2005cd5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708



On 18/12/2024 17:26, Daniel P. Smith wrote:
> 
> 
> Hey Michal,
> 
> On 12/18/24 06:04, Michal Orzel wrote:
>> Hi Daniel,
>>
>> On 18/12/2024 02:17, Daniel P. Smith wrote:
>>>
>>>
>>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>>> Allow to build ARM configuration with support for initializing
>>>>> hardware domain.
>>>>> On ARM it is only possible to start hardware domain in multiboot mode, so
>>>>> dom0less support is required. This is reflected by dependency on
>>>>> DOM0LESS_BOOT
>>>>> instead of directly depending on ARM config option.
>>>
>>>
>>> Just to make sure my assumption is correct, you are looking to do a
>>> multi-domain construction at boot time, with at least two domains. One
>>> of those two domains is the "control domain" and one is the "hardware
>>> domain", aka late hwdom except it's not constructed "late".
>>>
>>> If you want such a configuration, I would highly recommend you first
>>> enable setting flask labels via dom0less (assuming it is not there)
>> Speaking about dom0less and FLASK. A year ago, I did sent you (privately, through
>> AMD hyperlaunch collab) my attempt to add minimal steps to enable setting FLASK policy
>> for dom0less domUs. You then told me that you have a slightly different vision on how it
>> should be done. Any update with that regard? TBH I though that you're going to add this
>> support together with other hyperlaunch patches.
> 
> As I mentioned back in my March response, the concern I have with the
> patch you provided was with the layering violation. A security label is
> a flask-centric concept, at least currently, and thus not a concept you
> want to expose in the general XSM api. The correct way to get an XSM
> module's specific info, or translation, is to use the xsm_do_xsm_op(). I
> do feel that xsm_do_xsm_op() has a laying violation in its
> implementation, and is what I want to fix, it is still the correct
> interface. Priorities in meeting the core requirements AMD needs from
> hyperlaunch resulted in several abilities to fall to the wayside for the
> time being. I understand things need to move along, so I would prefer
> the use of existing interface that can be just updated when
> xsm_do_xsm_op() does get fixed up.
xsm_do_xsm_op() is made as an interface between a guest and Xen and is expected to be
called from within a guest, just like any other hypercall. In dom0less case, it's Xen who
needs to convert seclabel specified by the user to SID. How do you expect Xen to use
xsm_do_xsm_op()?

~Michal


