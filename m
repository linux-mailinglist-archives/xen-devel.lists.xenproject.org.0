Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA86B15493
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063054.1428825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrZD-00015N-NH; Tue, 29 Jul 2025 21:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063054.1428825; Tue, 29 Jul 2025 21:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrZD-000134-KX; Tue, 29 Jul 2025 21:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1063054;
 Tue, 29 Jul 2025 21:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSrU=2K=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ugrZB-00012y-MM
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:08:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2405::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bcddb8f-6cc0-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 23:08:55 +0200 (CEST)
Received: from BN0PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:e5::7)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:08:50 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::b3) by BN0PR02CA0032.outlook.office365.com
 (2603:10b6:408:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Tue,
 29 Jul 2025 21:08:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 21:08:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 16:08:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 16:08:48 -0500
Received: from [172.27.127.215] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Jul 2025 16:08:47 -0500
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
X-Inumbo-ID: 3bcddb8f-6cc0-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzKA1ji43edwF8nMlowquIb8lkJW/LJlYMYw7n1UBus7WkZ6afXowv+tcVTHPsZdsly4zgPCUAPnynlC6o4lf6QI1OoPqlNR3pZnnpvevwxZOMiC6yJj6NNpBSGAZHRbAg66o6FCyKLnbkQDAFA+GwxzF93PJvgt+PtSK43qwIGvaP0dstqWRYaKV4Oe1Br5t7HeLKARW5U23hVJjGvObJLrKAWX+xLOsLRxDVOq7YvTK3PbveZVH6KqYP5VMdNR9BIK6MyU4d+1sw08b7yXYxxvuLXmfIE0Afe93j34a+/6nKNY8UwXhW30Lp2QHWqW+4v2h/BxGYfxByoE4mXu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VW+wjfXcQvbT20HvHNUkAoWTLEUJwffevIw3a8bgHE=;
 b=OQi9woBLDqHIc9VsR49dwUd/i8Iojm0Ntcwc8C3Fyadu3+EQL9xZarUZWQiNC8tIs60GXqtfrMqhETv5S8zWdMWcIttCcAr2pjKVA7eDLHiVflnmuC7S0hl3iPn44088hA7LJwHQ1Uo3FpF//AqjnG8N8lse1LSZnKl3fW7bSrGd8tINVfplRLXW33BRhG34D0ue6dvwPa1InFPUC1oVcAyBFcLNMqTGGFxQsE/QfvPNvWSiNzXdB/6sIPEbtZfaVbAqAXF/yCdZPaKilOtsNSqwMgi9LzyKxNS02Pe9pJQR24GCrlihMgY/+aljTN3hKqfoGubdsrmdlPUZCbfANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VW+wjfXcQvbT20HvHNUkAoWTLEUJwffevIw3a8bgHE=;
 b=XJ1c1AehqwBVaNGWq5agvL2ujk++BFMMa2jso2t6NQhy9SjUjJs1r9F1jqwbyy1kc56NO1nX3SyrvuxHgn4bqPDy2QByzwJ5TO/vlewlDcTHc86sHRL6/6KCCNELkxtn49zW74+i6o2hU/n+rye638fFuzCY5dK11GobTYBnK4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <31db960a-e22b-4054-9ba3-97830859c054@amd.com>
Date: Tue, 29 Jul 2025 17:08:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix memory leak on error in vcpu_create
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20250728195245.90356-1-stewart.hildebrand@amd.com>
 <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
 <0fce6207-15b9-491a-97ab-3ad4b36ddaac@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0fce6207-15b9-491a-97ab-3ad4b36ddaac@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0f7bcc-52bf-4b43-0cc9-08ddcee41d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWd3bEpvMlpLNzh3QmZUdUZNY09LSlBWTHJMOFNlTmJnZ3h4YmJqdE45S3VW?=
 =?utf-8?B?V3VQOUV4ODRBamlKWndqbEp2WHBMRFhXcGtMdlF5OWw3WUltbXJTdEVCNmww?=
 =?utf-8?B?a0tTRHVueXZnUXVERUg3KzRGK1RIS1lLWFZieVcxR25EclFPZ3RlZHZTWHBB?=
 =?utf-8?B?QU1sQjYrU0E2RVhrUi80U0NvTUdvc0QzTU95RlJLRXhYcHI4MExSNmtqQVhU?=
 =?utf-8?B?NXN5ZVNNVFR5M2FING9Ia0lWUkxLbHVYNHpWNHdwT3Z5YXhRZUtEMDVLZXZj?=
 =?utf-8?B?Vy90Mk9pakFKdEZNWUZTU0pxR0EwZHdnVVJaeHpEUTFiRmJwS241TmhERHU5?=
 =?utf-8?B?ZmZPM3U0RGNTSW9GMHF5bmo2REpHZHcwajlibnh1ZUtJWTZjSjA1Wnd1Y2dH?=
 =?utf-8?B?dk9BWUxrV3NyNnpRUFYwNktpc1V4NCszcGNyWWw4SzZER2w5alNZR3ZqWWU5?=
 =?utf-8?B?SzVXOTc1aGF3Q0ljRk0vSVpXZWRuVEhTYjRLZTVUc09PdkJLejRZMXBmWXBO?=
 =?utf-8?B?bXBmSnRyQUVEaGdlRnFLT0JjRFluQnhveVBOdGZtNkt3MTk4L3ZEeWJBL3B4?=
 =?utf-8?B?T0ozT2IrTzk2ZUMrZTdQQXZlOC9IVW5SSms0aDBjcVcwODRTbXFCNTdLUVR1?=
 =?utf-8?B?QVhsV1BFUjlhR3o2SzBGd3VUMVZSS2ZiNk5RdUYwRlNiU2diRGsyaGErUFQ0?=
 =?utf-8?B?OTlxRmd5SGNmZmJ6M05TeTVJZDkxa2NTMlZsc0daNzFLZGx3aDNCZ09wTWxi?=
 =?utf-8?B?VTlSdHRFbFVuNGtNQUlLRWpjMGdVdVNYc3RHK054QnNKOVhVSnFyb3dSWTd5?=
 =?utf-8?B?SFYzUEQxQ0RkM2xINGZJR3BZOE5SWnJHRVhueXBna0xwcStNTTltK295eEFO?=
 =?utf-8?B?OFBDTWN2aVZQVmZ0ZEIyY0RjV3o1bDJJZFNKSVZlejdjekoySEp3VFEwZTNG?=
 =?utf-8?B?ZS9oUHNwNWUwekwvUVRIa1JYUmFZWUVDKzJFSTdoVHQyV2gzVXhRR2pMTm5r?=
 =?utf-8?B?WTk0ckZuUks4OWlZYkVucmlOa1pYYWt3L1VNeVZqMkJsYVY5VElLamZyQ1Fy?=
 =?utf-8?B?NkZiWmduM1MwQkYrcVc4MElMNUt2R1JRTzhLeEJmbDhPSzRZSEpHRkxxNU4v?=
 =?utf-8?B?Tlc4akl6aUs0YUN5M1dsdDJHR0htWVJYaXpRZERKc2xWVENRZm1QcjhXUHRC?=
 =?utf-8?B?OWdrOFU3bnhVQTk5LzBFTFNBM1h2cW9aTFk2MEk4VHd2djRwalJjcmJleHZJ?=
 =?utf-8?B?SGFnT0tUdEVMUnpmRFArY1BnaE0xVlBUMkttVVhlUmgweXh1cG9mNDBwQ1Jo?=
 =?utf-8?B?bngvNzNoa3pTQWNNa2FGenZmMVFyeGhsWkwzbkRTWHlpZlR2MkNZcUUvUHAv?=
 =?utf-8?B?UWYxUTQ1K1JVdk1XR3dZbGlrNEhCdm9BWnY4UzVvdndwR3ZhQ3VJeFNKMzZB?=
 =?utf-8?B?czg1aFJKUUZINm8wa0ZjdFhHMVB2dzBiSDREd3JXZUVzSUo3OHNRUzB3QkV4?=
 =?utf-8?B?UWR0ZEJPajNKeEg3NWRqTWxpTmpMcldoQ3N6b3JDVlJtYURqcFpkN0VRaDNK?=
 =?utf-8?B?THgyVktUT0VJMUNpUW5yUElQaWRQamhPdUVPTGJLZi94bnBMN0dSblF0UjNw?=
 =?utf-8?B?WTJTWGMyMmQ5cU90bDN6am11THE1TlAxcXh5RFFaSzBjc1krbVAxa3pnRFI3?=
 =?utf-8?B?OGhsRU93TURnaFJsQjhIdzVGSUhyWHlCVENUUCtyV200ZWphTzdNaFZiak5m?=
 =?utf-8?B?MXhwRitxTWNhMTh1ZER1Tlp0djJmTDZjbHpJa2p2V05aVVlZT0ZXT3NKNHE5?=
 =?utf-8?B?TWU1b3kva2R5dG1hRUQvWXF2aUdzT0UxUUVjVGZDRjVkZ01rTnNLZXZLbFhq?=
 =?utf-8?B?enJjMy9hRCtDYTBlSzdISWREZ1gwMEtXeVlBQzZ1RCtIWjVldGpjNVB6bHcx?=
 =?utf-8?B?SS8zR09hbE0vSi9lejRnYUNnREIyOW1vRlA5dmFqaDZSaUUybmhpdEh1aC90?=
 =?utf-8?B?M09NaXc4UXVVMGJqOVl1MDhoVmtiUkpjbFRxblpnWTNxOW1wM01teVEyenlZ?=
 =?utf-8?Q?z/j7zD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 21:08:50.0034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f7bcc-52bf-4b43-0cc9-08ddcee41d92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

On 7/29/25 04:32, Jan Beulich wrote:
> On 28.07.2025 22:09, Andrew Cooper wrote:
>> On 28/07/2025 8:52 pm, Stewart Hildebrand wrote:
>>> In vcpu_create after scheduler data is allocated, if
>>> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
>>> resulting in a memory leak. Correct the label.
>>>
>>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Urgh, sorry for breaking this.  Ultimately it comes from having two
>> different error handling schemes.
>>
>> This patch is probably ok to start with (and to backport), but a better
>> fix would be to handle sched and wq in vcpu_teardown().  That way we get
>> a single failure path that does the correct thing irrespective.
> 
> I agree, and that variant would apparently be as easily backportable.
> Stewart, are you up for going that route?

Yep, I'll give it a try

> 
> Jan
> 
>> An unrelated observation, but there's a waitqueue vcpu allocated in the
>> common path, but I was under the impression that only x86 had any need
>> for wqv (and I still need to get around to fixing introspection so we
>> can drop wait.c entirely).
>>
>> ~Andrew
> 


