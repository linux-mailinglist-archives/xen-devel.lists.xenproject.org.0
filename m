Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7DA657BA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917406.1322339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD9v-0004E8-3V; Mon, 17 Mar 2025 16:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917406.1322339; Mon, 17 Mar 2025 16:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD9u-0004Bv-Vf; Mon, 17 Mar 2025 16:17:46 +0000
Received: by outflank-mailman (input) for mailman id 917406;
 Mon, 17 Mar 2025 16:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuD9t-0003kW-NX
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:17:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a6d538c-034b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:17:43 +0100 (CET)
Received: from DS7PR03CA0296.namprd03.prod.outlook.com (2603:10b6:5:3ad::31)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:17:39 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3ad:cafe::16) by DS7PR03CA0296.outlook.office365.com
 (2603:10b6:5:3ad::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 16:17:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 16:17:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 11:17:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 11:17:38 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 11:17:38 -0500
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
X-Inumbo-ID: 5a6d538c-034b-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAlZZAnuI0IqR8CFEG8P+xvMjZUKdnWmv0HpRyGfujzsS3ejx13kChd8WdZnsQzzcAktGsg2FPIpCa+9AMtMHL1E2qVk0Iczl6A2jxwgbkldqCNL7lnWBkoTbDo7jrrxXndKJgwZ+8pN9mtTHCjr9gYCXiMrEWCs594Q9PvRtOQMn8IX5IweIDkRpyHAvA4lShz5wOwvLisEYSYMtSXdD2Dhag6Kjdkece0LN/ICzmukGRPewJpoaPzz/R1olAN4mss/PFeOkK85btM+SQKEZy2zA7xfnNxzKf7mz6jev3Izd0dwY40g+82Yuh2AZkdfraiVsFttHZCsBekVt9/O+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4Q49e6FKtUlrxzhZWKmKEd+5xhJlzAh4n8emjo78ZE=;
 b=hIl5KMpgCNewm6idemCYVTIXS1bErRxDrzCSZUDbQDzakfFND3nT9B7sZGybXeuUhYZp+6ee7tlIxH9h5dbcihe6Vl/H/aHc+2zylpFEyotkyyc/zhY0W8oIiNyt46p1qeo3ugAbm8ayBbMBYek+Hyl44GUf36rp/DmLwLKBbLc3cCznL/ZdoCoGXdoxnslP6S17rsMCYBlCj6DqYEiyAbVatNkZdvl3sYoBMzgev9g9J/EHO+4JOLMFNPb3tvqQ7mBikGxR8KnINz1HRPu0Ys+PROf5ez/faLcO0nwhkQEI3H1rveCr/xMf+rHvQXCyEVOj1yIKxaxLwD9xIbYbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4Q49e6FKtUlrxzhZWKmKEd+5xhJlzAh4n8emjo78ZE=;
 b=sSSM3yJUlpiac/4+YZQIEJgEbnhTMlRgPbBC00/Q6wOvtiEXkaLympuMr8d62+uCDwYOyG/RnbbVLIwvFGG/KyjLSwl+F+IF5zB2gU1xvP1DKYwX/jrpIaEa3k9K3eG3RkGuNx1BOkZGoRRkq42qjXFhYccJbxlSexAk4hO6Avw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a89753a3-c8e4-49fa-bb4d-744ba16581d6@amd.com>
Date: Mon, 17 Mar 2025 12:17:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] xsm/dummy: Allow hwdom more - except targeting
 control
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-18-jason.andryuk@amd.com>
 <66291536-a164-48a6-ab3e-304dc6035ed6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <66291536-a164-48a6-ab3e-304dc6035ed6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: f24f5671-8e4f-4dd2-46b6-08dd656f3cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09GaVJjUzhtbEs5R2w5Z3VFMHV0MVZ5MWtwYjUzMnI0RmVhVytZdFB3Vkhk?=
 =?utf-8?B?b20vR3FQVHYwakJnb1lmdnpVUnRvZ0xrTG5rcWhEK1U4YW5uYnJqU3ZoS0tX?=
 =?utf-8?B?TzA0TkFiQlVXUkJHRkozUXRhSjhhVXluRjBGaXRwcXNHaGZHZzIvWEJicnRB?=
 =?utf-8?B?b0JGK21HTmxHbEF1VWJ3eTVnTzlZb1ZHM0FyakVoT01wLzhmWWt2NFA3cS9p?=
 =?utf-8?B?cU9KRkVmRWlabmFmVW8vcHZsanFmNVVTQjRTUWZSa0hBeW5Ram53Rnk3RGl5?=
 =?utf-8?B?bXRHQzlWQ1Y5ZW1uWk81UjZaZUhBU2JrN25RcW4xR2tTVHBSeUpYNTZlcm5E?=
 =?utf-8?B?RnlXTTQ2L0Y5YlBJalpJaXgvdWtHWGpkQVVCMUt4VE1lYkRrbEFobHVrVDJO?=
 =?utf-8?B?ZkgxV3ovcVJqa01VaktHZzJQSmZUakVIMWFQNlY5NFBITjZ2aTFUU2IxZWNr?=
 =?utf-8?B?WHBjZmlmekNxVVNnQ0FSTmZDM2dabFlBQmlpZ2FkT0ozTS9BL21JRXlhZGMy?=
 =?utf-8?B?QXhaSmZOZ3QvMWxCaGRwUk11b2hMcXNlQ2Yzb0JqLytQdkxlSmtSV2QvYjVo?=
 =?utf-8?B?VFZnMlFvN1JGQmZKeTNBZ0h6UHZHLzFsSTQzKzlrUElMZVRrNEdMRUZ2aFl0?=
 =?utf-8?B?cFdFa2xVLy9tUDQ2VTZzRDltcll1ZUxEM2lYM1FKZnFMTEdrK1dZYTJxSUpo?=
 =?utf-8?B?ZjBtZFgyNXNPODIrc0xzd2lIYmI3VGo1Z05LUWx3dE03bjBKcjJFcnNTalJy?=
 =?utf-8?B?NE1zWnBtVzdrc2ZJazdCeEhUdjdEbEhvakZzYVc5ejNFQlFiZklra0w3RzJr?=
 =?utf-8?B?OUVTbHZKdWdGbTI3TzlHSmhVaG9kcmcrNENSMHRXSC81aGVUVWJCTHJBOGdF?=
 =?utf-8?B?YVR4bHcrR3NwSU1HTlFlWk1SR2xOSFlzWGl4cnpPZWVNZG9sOVpCZmNWVUZY?=
 =?utf-8?B?UG11UThpYWFlNHZvT1RFNGZiQkRhc09BZExMZ2gwMFI5ZXlYd3FGSHlKcVFI?=
 =?utf-8?B?Y1pya3lxVldPNGoyVVAvdFcvYnQzeFc2Vzd1K2pIOXR1cXEzVkVqVUVVaFVH?=
 =?utf-8?B?WFFJNnUweWNqSWltZjdncFlOUFJCRTVSVy82dXhSU3VaR2x6VHJ2cUl5bVUr?=
 =?utf-8?B?VS8xUjlBTjZxci83MGQyNkpWemRFUkRuMHlWQ1plNkJIcmpMMTAzZXMwbExW?=
 =?utf-8?B?K0lWUTk1bEhOSExRSWt5MzZiS1dFUVd0VnkwQlFpZmF4UjREWk1tWTdJbzJV?=
 =?utf-8?B?T0luZFVzVjFPNWlkRGpYYjlNN1N1VGdSQnA5dmwyMDFSY1NLRitaUUIwb3Uz?=
 =?utf-8?B?eW1FZ0I4cWFFWjg1QzI2UVVTSkxKUU4xTFhaOGdwTm5yR293Z0JmeFYxVTFR?=
 =?utf-8?B?Nyt0RGFuTnpUVDF2aUR0dElTMlhHZy9CQjhUcnFiWEh1R0pBbEpocVE3VnBO?=
 =?utf-8?B?NFp4dWdmalZRVVlNQkF4UmNkY290UzZza0hpVFlxalZlT1JTMENsbXd0aWww?=
 =?utf-8?B?dzBlZ2g5cWdWaEJWd3I3cXlRY3psbUtjbk5ZaXJmY2Z1S01pNVlpVFRENEQy?=
 =?utf-8?B?WnNKazJ3N2dpS0J3ZGY4a0liZWdFOU9FbGU3TU5Ja2UrYkNONGJWck1yZXNr?=
 =?utf-8?B?aEJNR1pweDZjOXpLdERXVzZJc0FtNzloaktobzFmMlE5Q0d6RlM1QVZEMEJF?=
 =?utf-8?B?MS9LelFCYlhsZk0wbTU5aWxSOTd4a2Z1SU9MN2wzd3BiYjJuVGkyZVpiOTE4?=
 =?utf-8?B?azNtMUhwRzBtM2NUS0VIa1dzYjJZTTF4Y1JiU0QwWWpqek4zTGFGZ2NMVWRp?=
 =?utf-8?B?Qnc3WVorS3l6M3lsSVBaQjRSdHB3YU1Yd2NjSVJmTXZPNE1EZDllNWQ2bmli?=
 =?utf-8?B?VVp1ckw2MkhuWFFUZVFOQUlGcHduOG4rQmlIU3JDRzFvbEg4cnpkRU9rOVYx?=
 =?utf-8?B?bmpsWHVYUGpSNFZiZTYrWHJxeXhiWTlFdFpMWEVBSm96ZWRUZVVSbmlEMjdF?=
 =?utf-8?Q?tzbO1ksKY2sAtIESq0xgvaHEoBZaXA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:17:39.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24f5671-8e4f-4dd2-46b6-08dd656f3cd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762

On 2025-03-17 10:28, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> Allow hwdom all perms, except XSM_PRIV, and except commands where the
>> target is the control domain.  This protects the control domain from
>> hwdom while allowing the hardware domain to serve as the backend and
>> device model for other domUs.
> 
> I can see why backends may need to live there. But device models don't
> belong in the hardware domain, do they?

One of my tests was on x86 with hardware domain running QEMU providing 
virtio-gpu to a domU.  QEMU needs to access the GPU for virtio-gpu. 
Also HVM/QEMU PCI passthrough would need to run from hardware domain. 
for the config space access.

I viewed the hardware domain as the place to run the device model - sort 
of like a stubdom moving out of dom0.

Regards,
Jason

