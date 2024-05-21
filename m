Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A98CA96A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 09:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726642.1130984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KN6-0002Qi-AZ; Tue, 21 May 2024 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726642.1130984; Tue, 21 May 2024 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KN6-0002PB-7h; Tue, 21 May 2024 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 726642;
 Tue, 21 May 2024 07:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbJz=MY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s9KN5-0002P5-1C
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 07:57:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf79c77-1747-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 09:57:18 +0200 (CEST)
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Tue, 21 May 2024 07:57:14 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::49) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 07:57:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 07:57:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 02:57:13 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 02:57:12 -0500
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
X-Inumbo-ID: bdf79c77-1747-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5tjaY+JkNAboZ1C+WZ89Vz32d0tcsRvGBILO2FMS74HznJDMkbSZYxo9ZYn1FR8uZrES2Y7K8V08VSB/CF+Xoi0SCyUkThWbgv0vSH67nowMrZ0QY9wIlw9XixaDRfxwFR/+5I2R5ltsNpxWGfdRfG08Ptqd9cZq7jU3wfc8oAYfrAQnHQWAvLIG1rrZATzJ/Sg00/dkg1QMyL0bzpm1A+5GZ8/VPFNFwcdrK1zl9GNVx9jtfuzHFu8VzOR4TG1D49lvsHIUFAA84ckzJ7IsGAI2/gwcRBcABOOhgowDl8Nf27vpTKhrQPt+tLxQjyq4533lk53DRWM7OIx553RsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSBbL6llymM5kwICXoSUKun7pq9ChUTp2++7iY5p2uI=;
 b=Bxq9gOTlJ1+/HodywRXf8c8LHlzkLRMxV31eskFz2y+MLaPx0tfGROyGOMeZVoZ2BwwnWfALFuUn2+UH4NL5SuqMi3O/5WYoUJYea/wt8ib5Aryz3rzT5dMQFxL23/BJmKLgN3Cg95K3vl7OIMLfs6g7bvrrPQalXZB37TQ95/lK0qVxb0BZ8WUoj418+7+pAgm6lAXnIZkjwnUrbX7aXt5xQYhcZGrQrkyamI1YtoWzVfMHvlWnJjBLa7t/HPJBRj38lGteHO0DNDm0DfOhPzg3tgtbFTlCD3vNblqIFFojQnsBxI8Aura2ixPmrkWJ6ifPJ/Ef3LnMV/DDuoOL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSBbL6llymM5kwICXoSUKun7pq9ChUTp2++7iY5p2uI=;
 b=gyucHzBBnoNgFWNxA75geKcpPWTXn3St3lzbKLWwFt1qZUDL3jynPeMP1U/tZ7HdJ/es9YU2v7VBB69oVB2QhKZtmIXtxk/IKf1hU4pq775qF6xbg6yAfM0GSWVAbyV9jJtJayyp8TdCgnxM+8mAJ9VnhEEPbK24VA1AV1NeJ9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e9e188ef-6de5-4cc7-8edd-dd7d004670de@amd.com>
Date: Tue, 21 May 2024 09:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
References: <20240321035706.165253-1-xin.wang2@amd.com>
 <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
 <e724dd97-03fc-4136-9a53-94bbddce160f@amd.com>
 <e81356e7-fcf2-4fdb-8585-e544ac4a15df@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e81356e7-fcf2-4fdb-8585-e544ac4a15df@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f294874-f4b8-4ae6-44e7-08dc796ba098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNQOFd3OCtuWW4ydXJkN1ZIUzRWYlRoSU1ickF6cEIzbDlKZldlT0lydnVu?=
 =?utf-8?B?ZWFrZ1MvNFdPc0w3d0VaM3ZqVFFxUlZiUnZnLzQ3V1ZySGorakVvSTRVekNh?=
 =?utf-8?B?V3EwMmhxaitzNUo3Y0ZCZmdoUWRZU1ZmNTBmbUQ1dU9yVm1VamxmRGZZWU9E?=
 =?utf-8?B?NURnS0pQYzhhMXRnNnNIaEJPRTRydTVaNHJyNmpTRldvVzJ6S1dWNGRPcW5a?=
 =?utf-8?B?OHZwbitCNGFHeG9nc1MvclhSTTBtWXhxT2Z0d1daUzNtdnFrekthQzRlZUpv?=
 =?utf-8?B?Uno2VG5HcEJObUxHK2NZSGd4dXExS0ZTMG8vTTZmWUlTb2VOZFIrcS95MTZN?=
 =?utf-8?B?SW1URDBpOFBPZUNpZzRKVEtqS2p3a3AvSTcwdWxtejVUeXd0YTdWUFltNjFa?=
 =?utf-8?B?LzQ0V1VZWFdQWXF2bTFxajRpaVJOMjFpK0hUZG41bG9KR1lLMDBvUm1VQU1Y?=
 =?utf-8?B?eEJuQmZxaU1BQjhXS04rREQwbDZtY2ZpWHE5bWZNSnpLUlVrQUNOMGNObXYx?=
 =?utf-8?B?N2FqUU5TY3BkOUZwcnFsQU1seEFIdHdTRU9XZTRweEtWRS9ZMU9jSVZ5Zmty?=
 =?utf-8?B?RUkxUkJMZEJtQ0JrZTJWdFZEbWtTTDIrRmh1SnI0U3FrbWd3b3ZLQy9Tck1D?=
 =?utf-8?B?bWV5Q1dsSjJ2MkZrenhjNytHTGI0RjVnSzNTVE9tdmZkcXFVYThEUW1xS1FY?=
 =?utf-8?B?N2EwenljNGIzTFYyYjAwTVd1YU45emZReVo0R2hjTTF0emU1SFliYVJUVVVv?=
 =?utf-8?B?SGtwMnVpTHdESUgwRElBS1ZDZjRIVXBrYldYMHJ0bFM5TUNmTFB3a25mWVRI?=
 =?utf-8?B?Q2hIVVFmUTQwUDBURFlNU2QrclJNZkJ1RVNjYmZHOURwZzFuYnJoSFpBWTlu?=
 =?utf-8?B?WXBHam1VaElHMExpcGpKa0RxdUF5KzZQemJucTltS1VIdFNRNHQzSmhoUHdR?=
 =?utf-8?B?MmpaL1kyUGFwem1CMy80L0dzQU9MNWdmWStxd1pTakpUNEU0RG1ycmsxZlVT?=
 =?utf-8?B?UEdzS1oyK3BZbTdieGxoMjAvMDhhRy9Ra3dTbURsSnlJa2Uyc0ZNZlc1N3Vl?=
 =?utf-8?B?RlF1b1k3eklPejVBSmNJT3JhaW1GeDU3R1c0SU9WV3JxNUdSUy9MVk45Q3pF?=
 =?utf-8?B?NWh6bWpxM1lqWkhrTFpoWkJFaGxVNlNuQ2V4VlBQMGNJeWFDQVBpbnJ5c1dR?=
 =?utf-8?B?MUQ0ODkwMm1ZTHBkd01TUUtQd3BzNUIxVWxUMVF6VVNHV21peG9RZk04T0ta?=
 =?utf-8?B?ZlpzOGk3QUcyL1JveC9Rd0xOdVR5QkhIRHV0Z3FBVzl4dXZITkRja3FHZ3Fn?=
 =?utf-8?B?ZDRkb0pmOWdFTDErSEl1SFRReTdhVUN1YkNyMlNtUHpTYmtCSzEwUUc0MUM4?=
 =?utf-8?B?YktOZ01wcHBXYkdhVnBRclFTWVBQMnJLRkhNWlBHQzlHZU9YYWhJemFYckdw?=
 =?utf-8?B?OG9WRTYvdnZMTVYvWlU4aDBwZlVocVJwMytjeE80SVhUa1FKaFZpYlp0a3JR?=
 =?utf-8?B?VjEzZTZBTDllekZ6MTl1YmVhRGt3VDFWRExuVFNpMEtISlBFSXM0czNvajYv?=
 =?utf-8?B?aUh1aURlVkU2SHFjc3NQcm0yT0pDY2UyelhHVHZvR2RrQTlFWFZSaVI2WUVQ?=
 =?utf-8?B?eTU1YnJWWWFMVlJyNDFwN0hZL2tTaEwrWVpyYzYwSFJiRHFLb0JURktCZ3ND?=
 =?utf-8?B?bVZ3bkpYQ0RCVWUyU2Z1Tk1EeDRxV3VzQUxBTmhSU0IrSXpaSW9vUktrUWxC?=
 =?utf-8?B?Qm41bUJsUkpXTTBuSDlJNnNtenNWdEVDMTNYRnlFREFVN2pZOUlua2Z4aTk2?=
 =?utf-8?Q?oQLGlIOKNlw+3IV0jrOCF1/Y9gLRatVJF+PMA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 07:57:14.1781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f294874-f4b8-4ae6-44e7-08dc796ba098
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611



On 21/05/2024 09:51, Henry Wang wrote:
> Hi Michal,
> 
> On 5/21/2024 3:47 PM, Michal Orzel wrote:
>> Hi Henry.
>>
>> On 3/21/2024 11:57 AM, Henry Wang wrote:
>>>> In the common sysctl command XEN_SYSCTL_physinfo, the value of
>>>> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
>>>> Currently on Arm this is a fixed value 1 (can be checked via xl info),
>>>> which is not correct. This is because during the Arm CPU online
>>>> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
>>>> cpu_core_mask for itself.
>>>>
>>>> cores_per_socket refers to the number of cores that belong to the same
>>>> socket (NUMA node). Currently Xen on Arm does not support physical
>>>> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
>>>> cores_per_socket means all possible CPUs detected from the device
>>>> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
>>>> accordingly. Modify the in-code comment which seems to be outdated. Add
>>>> a warning to users if Xen is running on processors with multithread
>>>> support.
>>>>
>>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks.
> 
>>>>    /* ID of the PCPU we're running on */
>>>>    DEFINE_PER_CPU(unsigned int, cpu_id);
>>>> -/* XXX these seem awfully x86ish... */
>>>> +/*
>>>> + * Although multithread is part of the Arm spec, there are not many
>>>> + * processors support multithread and current Xen on Arm assumes there
>> NIT: s/support/supporting
> 
> Sorry, it should have been spotted locally before sending. Anyway, I 
> will correct this in v4 with your Reviewed-by tag taken. Thanks for 
> pointing this out.
I don't think there is a need to resend a patch just for fixing this typo. It can be done on commit.

~Michal


