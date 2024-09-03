Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B296974E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788834.1198316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP2L-0000jq-OZ; Tue, 03 Sep 2024 08:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788834.1198316; Tue, 03 Sep 2024 08:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP2L-0000h7-L3; Tue, 03 Sep 2024 08:37:17 +0000
Received: by outflank-mailman (input) for mailman id 788834;
 Tue, 03 Sep 2024 08:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slP2J-0000h0-TQ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:37:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a65d18-69cf-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:37:14 +0200 (CEST)
Received: from BN9PR03CA0159.namprd03.prod.outlook.com (2603:10b6:408:f4::14)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:37:09 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::78) by BN9PR03CA0159.outlook.office365.com
 (2603:10b6:408:f4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 08:37:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:37:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:37:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:37:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 03:37:04 -0500
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
X-Inumbo-ID: b7a65d18-69cf-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWjMM3SogfTbuEUXNQJNCO1KTiI6XW5M9CX0aSSpgzFCN6VD/Dvu638Q2LqYWZ1Qa3vrkPDV2ZYeQd5l0u9Ra4wK9D8ICXPgNAFCAHVSZDAZxfiDHn0+2yEXsloxeTg4UYfx+VaQLjk8JWC4OLIgyHn8Gwy4JOQ8TqUq/+FOs0Jj3zilh7ZEU/bJjwimEkuDHeeXIyEx/QfRO+LGxA4BKykMG5nBG/biwsBOdPd3bTbJWPwT+MlLuUZVeo37JKYClNnnUwOv3lRVZ7w/YyRA/lVK6MbdtCw1I5Gy4AUFT2Q+9rFCoQdUsQQMTPI1hgoHY7BvRnG40DOQ4ztrhz/lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02U6JTTHNpozou3eoV5DxhOmDHrT+Bdj4X9yawzaNB4=;
 b=jAZ/UG2B/0oxyCYK7Ib61bE4aEdSi4KZQWUTVMaaaCvyFs5Sn2UVfDJes0ZTSI/K9ceWPYp2aVcauLrH1Ky5YihYJsKJJHfapFB+yj+rLkx3lN1SQkY0g2HvM2/DYvkSM3a5wjShNBvZJWDtCFFC21NBw7LHI97Udn6kWF6QoN02RbxeXyuLamzUhhV6mVBTTRVZiAg7qAZh9s3xq00IWP/fc0aOmIOeDxdS4/VOFPkbPxm+ZzW6AgabGJMbQ77XUKBYubCdnfEpcqhRsJMF9kTWFd04wVx2D9LxpIflhNjetmmj8oPrJ04K7oOF57gQgPqIrsS0oCuySgVSh7qNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02U6JTTHNpozou3eoV5DxhOmDHrT+Bdj4X9yawzaNB4=;
 b=w7St3Ynb0fc8GktqGyiEBbmLSkChV49TrcOpjLY9pqnEHm+02aY3ENxP81IqsGUfq8/6f6nDzbfvSCF7G9z/m/ycB2gQOpgqot5qrkWJuU3ha8pfXAU8ZtAWEY5xteONGqL6FKbZ89V1Qp5Efdf+C9M/1KP/ps/XB0zRx68MzNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <14c41969-fbb8-4991-a1a9-e4f4e36cb226@amd.com>
Date: Tue, 3 Sep 2024 10:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM/div: Drop __div64_fls()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240902100355.3032079-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a4e0fb-e070-4ad8-6d84-08dccbf39990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFIzaXhVVmxNWkZ3NFJCSGh3ckpzU1o4bGNOeDdiLzJaekx2NHovZkZnYXpD?=
 =?utf-8?B?bDUzOExKeXJFSU1kVy9zUTFOYksvSHUyMXNxYjFwTk5qZWxYaU1MSlExd0Zx?=
 =?utf-8?B?dVpvQU5ua3AxVVlsMkV5SGlFWmVvK2xHTE9CY1cxdnloKzJCc3lnZy8ybVZm?=
 =?utf-8?B?cUpQbEZYNUVqTDZsTHlZRS9OYUFEMThTSlFwL2N4K3ZnaHhRM0RBVnRYSmxK?=
 =?utf-8?B?Ym4zOG5MVG5xYTRyMENkbFlZa0k4UXZTWGpFNWhENlNBZ3dNSnFjbFdyQXdO?=
 =?utf-8?B?T0hZTTVWOW05QkxtQ0NzT3krMjgzWGNseldJdG1tK1daUTl2WFZqZXFOdzVE?=
 =?utf-8?B?ek1tbWVDWklLWnI0bkVsVlVTRWV0VmQ5a2d5OTZoTXlCM3hPek1jN2svTTV0?=
 =?utf-8?B?cGxSQS9wV3VDSXp0N0dMTnkzYmhnWjRaWUEyVVdPM2pxOGw1VFlrTTV0L2xE?=
 =?utf-8?B?UFkzbkM1S2lpbFBqN2I4VnhTZ3JvdEZicEg1U0pCdnpzNWh6RXVTS1ZVNC80?=
 =?utf-8?B?cGM3aktKZVlnb3d2eW92elFlQnFFS2ZyM2R6Z25OeVRGL1h2K0pObXAyMmc2?=
 =?utf-8?B?anVjTnFPcDNQbXFTU1Z6MjJaMTNmRmpNY1doMG5heTRlMFVPbE5ySzFza2ow?=
 =?utf-8?B?a0JGMW5rbEVOSko3dldsRUVaeG1ISTRGeDdxd1BuSzVDcktIcytYa3g1OXhl?=
 =?utf-8?B?M2xVczJaVWRwSTRiaGdmeW1RekZaRHZRcXh6OVEwWGs5bVg4eGxJTnF4RUdG?=
 =?utf-8?B?QUVPb3krYVludnB6bUEyRTdQNGJJSHRhc0NZUkdtZG4vZGtNQ2hPNk8rQmxU?=
 =?utf-8?B?Si9Bcjh6aFdoeXp6My9FbWVOejgyMlBJcUxna0s0K2hPNktHZDNwZTRLUkxS?=
 =?utf-8?B?WW0wa2hDdUQvNUF5ekg0bUFmWmZiVWNQUGtVUDc0bWxoYVViVThoeEZmZzQz?=
 =?utf-8?B?bG5iakJ1dkp5ekZFWllobVNXei8raTdJclZ0clZMcE9oY0xRVlJOQUJDd2dO?=
 =?utf-8?B?NyszdHozOHlxTENyakloQThmVXE3UkRDN1pSK1c0V1kzN3BQY1M0N0N0dFhU?=
 =?utf-8?B?ODhaSWRGZ0lJVjdmdE5qcW9Zc1dLbnlYRmJuMGliM2U0MFBnRWl4OFdqajJW?=
 =?utf-8?B?OWx4cmEwa2dETkNnWTlnYXlKOVd0dy93aHpFdlRpb1dHem9MZng4TmhlMExL?=
 =?utf-8?B?ZXpYVm0xMzB2TXVpWXNTUFhzL08yYmdod0txdDNtSnpQTlZJTk1oREtjNVBM?=
 =?utf-8?B?aEMzT1pmZ3RmakYyYlNId3JoNWd0NWs1RW1HWEpOb2MyTkw5NUtDaEZvSmUx?=
 =?utf-8?B?QUVqVVpuSmpxOGtHVUloZ0VTZGhVV01YV2o5a1E4MGxXODdPNXVwdjNyYkIr?=
 =?utf-8?B?b2k2NnlYandNbk5oT1RJVnhpZXhQaG5INmVjOGZCQWlBbitoYWJhTEx1RTJI?=
 =?utf-8?B?N1ozUi9QajZRZGhqbGoyN0p1bitEUzdGQVh5aTJ1c1pRemVGbGJhTlJjWU9K?=
 =?utf-8?B?blFpci9rVWRqemNLeUpwT2M2SnpmMU9IVHV2MHRldGZ2QmFFWXh5Y1o1MjlV?=
 =?utf-8?B?c2J1VVdoNFNVRmphV0huenBRdzhXQnVlSGhWSkdLSHpxVWFYcXUvblQ1dXpI?=
 =?utf-8?B?Q1RwckhKRms0MDZRL29EaEFQNHorNXVkTElmZ2E5bGJKUzRIZWt4QlpDbkhU?=
 =?utf-8?B?dkRma1FmYVlzTnJXeXUrOEVGV3ZjcFNseFlmbi9CdnVFazVBYWxLaTBUVWN2?=
 =?utf-8?B?NG9tSGhKdjNLM3NzeDVFY1R0Q0F1VUs2Y3U2T3A0cHcyOSsrb2tzVHdmWnBq?=
 =?utf-8?B?SWFrODdsY2VVUUVwQXhqZFcyQi8yOGNoWnpEdGVodDd2MDd6aHhqb1NRWDcw?=
 =?utf-8?B?RGtHSW1BbFJ1NHdzU3BsL3BZay8wQjlJLzFPUlVybzZ4NkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:37:09.2857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a4e0fb-e070-4ad8-6d84-08dccbf39990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761



On 02/09/2024 12:03, Andrew Cooper wrote:
> 
> 
> Following the improvements to Xen's bitops, fls() does constant propagation in
> all cases.  Use it, and drop the local opencoded helper.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> ARM32 gets a very minor code generation improvement:
> 
>   xen.git/xen$ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
>   add/remove: 0/0 grow/shrink: 0/6 up/down: 0/-48 (-48)
>   Function                                     old     new   delta
>   wallclock_time                               288     280      -8
>   printk_start_of_line                         560     552      -8
>   domain_vtimer_init                           472     464      -8
>   do_settime                                   376     368      -8
>   burn_credits                                 760     752      -8
>   __printk_ratelimit                           424     416      -8
> 
> But it's just a couple of operations improvement and no real change in code
> structure.  I expect that the constant propagation being done through
> __builtin_clz(), rather than pure C, is giving the optimiser a bit more
> information to work with.
> 
> This file also has an __GNUC__ < 4 case which seems ripe for removing...
Agree and noted.

~Michal

