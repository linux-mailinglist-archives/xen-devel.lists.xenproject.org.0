Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDDB115E0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 03:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056806.1424814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf7Ey-0008WN-DD; Fri, 25 Jul 2025 01:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056806.1424814; Fri, 25 Jul 2025 01:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf7Ey-0008Tk-A3; Fri, 25 Jul 2025 01:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1056806;
 Fri, 25 Jul 2025 01:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uf7Ew-0008Te-Lz
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 01:28:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5fe86ed-68f6-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 03:28:48 +0200 (CEST)
Received: from BL1P223CA0041.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::12)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 01:28:42 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::99) by BL1P223CA0041.outlook.office365.com
 (2603:10b6:208:5b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 01:28:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 01:28:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 20:28:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 20:28:41 -0500
Received: from [172.19.34.177] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 20:28:38 -0500
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
X-Inumbo-ID: b5fe86ed-68f6-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5Bv46FaVgT+RJ8Bep1JagUn2HnxRLDOI8Ek4W0sRaVskoX4RA5SSt9J9KO8J1zYogewi6vEzksyP3A46ZJu84k2dyL6VhIkIIpq5O6wYteL1/KEdeP6YEmWoLrJKNE3AjxIQAP/zOQXjzIskKttXYjxM98BiY4xMgE7gJBVbpvIMMyuYUy2nM24H9gl/OBXpfeJeqDiYPHldghTzYzwm3U0OQbCzW4Q92e3yctVArcMwYYMlgR4gMkWhDAPc5XIm2aMBLVJEu/QobOU8ctqK9CEFqiwIS3JzicBqzSKedD/gzTBz/t4URfUh5nBcVEanfvSu1UPCCbbSsdLEVqNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXUxFZ9qfxdPooQPW6ImcbmEIQKyxHh+zF+JxJPMTUE=;
 b=SRFGknswOtB26KKoPita3t5Cqf/hukcETfyAvZfqFquhuYhobnnnWB6AZBjSmMaOP1juaNPHZPRZMHo5SQDdRYAaZLzknBiZGn1gNpYbqdPPutWbOK+FMB/JjBugVZZN1PMeLhPk1wqa+KO5OEUtIUwDGqHiGq1H1UJMFElfc8cdLSa3laFFW8JTDFRnMG9l+9jSX7co/Zk1EtBQEcGH51Z+I65Lguqosx0MLCXayRKgJYlhkcBydB9ebxlPifI45ZJCiCCWnLOHtSpNewgnKYTriVPsTaA9PV+OSvnE39rmXmUfZzWrXX5ogAdJh3Vm9MzJ9E4ffgUg3Qh42Cb9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXUxFZ9qfxdPooQPW6ImcbmEIQKyxHh+zF+JxJPMTUE=;
 b=PZx9Q0D+Dip7GNjv8DKDap/bx9wAvRl6CncIH6WfCiUp9TOVWbaaMv1s+fSQMh1iuni7mK29ZX3JthJ4Gm9M4JsbMTOSVCFaLHMbnkDKTy2wIp0QshzhJkwK+Uw0r2/xqQ1bAp4kn4raqP9/JiRUU8HRwz809p9SW8dCn5KXz8Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <69b04328-59a1-4186-837e-19d608054aa7@amd.com>
Date: Thu, 24 Jul 2025 21:28:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] xen/arinc653: fix delay in the start of major
 frame
To: Anderson Choi <anderson.choi@boeing.com>, <xen-devel@lists.xenproject.org>
CC: <matthew.l.weber3@boeing.com>, <joshua.c.whitehead@boeing.com>, "Nathan
 Studer" <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>,
	<xen-devel@dornerworks.com>
References: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: a68e8dc1-6f2f-474a-4b86-08ddcb1a9721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3dUSnpGOVNXbE1HTVh2NzMyYTVuRVV0d3pOZzU4ZUppUUZZZHJkVFVHd0xa?=
 =?utf-8?B?djlaT092RUk0em9CMjVyek9xRVk3cFV6UmgzUnF1Wk5JamxyZk0rcnVUSEND?=
 =?utf-8?B?UkVrNnUrUlBvRElGdGJhQVNKcFA0VnhFYU1nbm9WRDVxdE1vdTFqWHlJU2Rw?=
 =?utf-8?B?ZTVDNUo4Y0lwVjVjbEhCUXJsbUVFamdFY1dIbTk4UVZMRXM5Vk9qQUNpcE5w?=
 =?utf-8?B?UU1ua0F0T09YYmJCMEdRS1E0aUN6dlo2aFZ5ZEdCdFVKL0V5dWQ5QmZqY2Vv?=
 =?utf-8?B?Mldsc2taY09EaWo3Q0NHcVJFME1HcHErcVdYVGdBSHFQVEdnb0FiMXQxb3Ez?=
 =?utf-8?B?MXFxZjZCc2tRaHJQR3VCWUJ0MnVTQ0EzeFgrQktuakY3YlJIN2xhay92US9L?=
 =?utf-8?B?THVpVEdoSjdGQ2NONlN4SU9mMWRnYUxaUFVISDBFb04va0tsbWZNQ1JpUjJC?=
 =?utf-8?B?Ujd6dG1YQlFONm5vbXhuMkt5RHlVVHowRmlYQ05mVnhaSmVUdWp5eVlyZ0Fy?=
 =?utf-8?B?bE5Idjh6RkE5WHUxcTFpeXhaekJkU1d4SDBVVERZcXhpbnl3bGJxaTM0VUwz?=
 =?utf-8?B?am12cmhNajJrNHhwWm4yVzNkY1I3MEhqbWk2U0RrOUgwNUdsT2Y3eE9WSDRJ?=
 =?utf-8?B?cG9VbytoWjNKT01TSi80c2RScGUyajZTWTNpSGwzMmdpcVhiUWc0TTNMV0Rt?=
 =?utf-8?B?NXpSa05vRDBrZXA1L21OSm1xZUdwUmJpL2pxL1Q2K0I3U0pSSm94NVZIMjZh?=
 =?utf-8?B?NWdlU25iRHVQbFhEVWk5empFaWlNSkc4RjZIekxSK09mVTA2NkVuRmFLckpy?=
 =?utf-8?B?VWt2d2FwaGFPQklORjJINnpINzJENE1DVGtBZFMrQTU5OFRTbmJNazlWV1VV?=
 =?utf-8?B?d0FlenJIU3A0U1ZpMVRwdUVZZ0ZoWVVtb0Y0N3lNaytwMkFVelh3THN0a1cy?=
 =?utf-8?B?c1ZleUxaZ0lxY05yT1JZMDRQRkp6Vk9EYWlSY1hsNjl1ODhLd2VYRlpLUUtt?=
 =?utf-8?B?Nysydk01ZzBjaVN4S0JYb3hwSUZrdjF5U0x2a1lnRVBqbXhGL0w5V2JGWklP?=
 =?utf-8?B?UVlldU1SdGJyTHB6VW53elJVM0pvVDdwNEpGaEo4ZWh6a1NydkgzOXFRT0VH?=
 =?utf-8?B?YUo0TkVlcFBnWHgxSjVnbDB1SXRqQ3dFNkpxSUd0amo1cURjSjJwU0N0M2U2?=
 =?utf-8?B?dy9HemJnR1BrNkJnOC9CaU03RWdqdmtFc1pkZi90TTFmZW9LZnp2QXhqTmVH?=
 =?utf-8?B?LzZJb3MrWCs3b2hGWERzSmZGNStISUxrWnNBTmlaSXRmUEIwUXdXSTFFdzlH?=
 =?utf-8?B?RWdJci84OThPNzNKV292SnZqMUdkam9DTnhTclVtWk9ybkJhWHgvRnRtZVVj?=
 =?utf-8?B?UnhEVWtsaGszcjRGanFPUWVGc0tNRFFoeDNGLytQSkhYTFZFSXppR0pzMytG?=
 =?utf-8?B?NkRKVnc1cFVoVS9jL1pOVFpKQVRGa2hRbjc5NldZS1BjeEtKM1RPSXlYek1I?=
 =?utf-8?B?TlhqVVhQOXFIaHhadCtmc3VYeVF5d01tWjd5YkVxY20zckZYYm5jbzNYMzA1?=
 =?utf-8?B?cldpY3BOWVpwUXZGM2lDL3EvWjRPeTFXZWcvbklTMFVtV2w1M0pSUkFxWSt6?=
 =?utf-8?B?WGRYUlkxNUFrQ0xqaC9QZkw0UGQ4TlFMV3JLUmJBMC9HbHM4YXZYYkxjSVdT?=
 =?utf-8?B?NVBXZ2REUkVPb1ZpazVqZ09VOEtQclN2eTgvZ3drcHZ3aGNKcERiZkI3NkNJ?=
 =?utf-8?B?L05YYkJDalhpQ1hhVWpsNlBUSlVPa0Fydmh3RDRXS3Z0aUlOai9vQmppd3By?=
 =?utf-8?B?UGFjNVZUS1NlQmZJMW8yejc4NDAvcjdUVVhqTzJrWEFzTjUwWk1wWGVhK2gx?=
 =?utf-8?B?UUF2UXJhUEwzeGgvWUoxb0J0bjZOeTNPSkJhS0w0K004alJvN1gxM0kwUnFp?=
 =?utf-8?B?Y2FqUkZTeThkb0h1RjE5d3FTTUx5NUp3cG1KVmNOU2FMbWVhVzdqWDRkUjVH?=
 =?utf-8?B?ellwdEtMQWlDTmRwWDZ5c0pNc2NQNTdJME5aekFoWEh0QlRmb2g5SmUxRGFQ?=
 =?utf-8?Q?BnNblg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 01:28:42.1108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a68e8dc1-6f2f-474a-4b86-08ddcb1a9721
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431

On 7/24/25 18:33, Anderson Choi wrote:
> ARINC653 specification requires partition scheduling to be deterministic
> and periodic over time.
> 
> However, the use of current timestamp (now) as the baseline to calculate
> next_major_frame and next_switch_time introduces a delay in the start of
> major frame at every period, which breaks determinism and periodicity in
> partition scheduling.
> 
> For example, we observe 3.5 msec of accumulated delay at the 21st major
> frame with the following configuration.
> 
> Target : qemuarm64
> xen version : 4.19 (43aeacff86, x86/IRQ: constrain creator-domain-ID assertion)
> dom1 : 10 msec runtime
> dom2 : 10 msec runtime
> 
> $ a653_sched -p Pool-arinc dom1:10 dom2:10
> 
> 0.014553536 ---x d?v? runstate_change d1v0 runnable->running //1st major
> frame
> 0.034629712 ---x d?v? runstate_change d1v0 runnable->running //2nd major
> frame
> <snip>
> 0.397747008 |||x d?v? runstate_change d1v0 runnable->running //20th
> major frame
> 0.418066096 -||x d?v? runstate_change d1v0 runnable->running //21st
> major frame
> 
> This is due to an inherent delta between the time value the scheduler timer
> is programmed to be fired with and the time value the schedule function
> is executed.
> 
> Another observation that breaks the deterministic behavior of partition
> scheduling is a delayed execution of schedule(); It was called 14 msec
> later than programmed.
> 
> 1.530603952 ---x d?v? runstate_change d1v0 runnable->running
> 1.564956784 --|x d?v? runstate_change d1v0 runnable->running
> 
> Enforce the periodic behavior of partition scheduling by using the value
> next_major_frame as the base to calculate the start of major frame and
> the next domain switch time.
> 
> Per discussion with Nathan Studer, there are odd cases the first minor
> frame can be also missed. In that scenario, iterate through the schedule
> after resyncing the expected next major frame.
> 
> Per suggestion from Stewart Hildebrand, use a modulo operation to
> calculate the start of next major frame.
> 
> Fixes: 22787f2e107c ("ARINC 653 scheduler")
> Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

Reviewed-by: Stewart Hildebrand <stewart@stew.dk>

