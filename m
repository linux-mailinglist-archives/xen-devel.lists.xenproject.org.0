Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D8AAE255
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 16:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978600.1365345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfZN-0006cz-IK; Wed, 07 May 2025 14:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978600.1365345; Wed, 07 May 2025 14:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfZN-0006af-FK; Wed, 07 May 2025 14:16:21 +0000
Received: by outflank-mailman (input) for mailman id 978600;
 Wed, 07 May 2025 14:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRk5=XX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uCfZL-0006aX-9B
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 14:16:19 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2408::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61b14fe-2b4d-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 16:16:17 +0200 (CEST)
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 14:16:05 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::ac) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Wed,
 7 May 2025 14:16:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 14:16:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 09:16:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 09:16:03 -0500
Received: from [172.18.31.235] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 09:16:03 -0500
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
X-Inumbo-ID: d61b14fe-2b4d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyNUR+rcMnB+nOxbNkngNhvQcn1zTDbHg/VjNLdPzbarGylPj83x81hNgHajFj/qHeCyyEKUpm3e8NbPQFklrA0FwZU6qImnNk4kWwbS/eYVZ3eluofnKJYOPvrVuuXVHvsXZKTSiswdeN1fdEgVTZGvvVEwKEg/2eG0aqAaZA4vQc0U77QztUgMA8PD2p1jEKLi6/6FQkCeO/BkCrL2/ZpLau6g8to00hoUpo7flLIYXPC1XOGuCnfZksCeuxvnxAAgxN3m2IH2Amic3BUVGVKvxiX6Va8z9D+ztQ/aWir/CH/f97dy52p9n4a1omHPh3OCW80rrStLmyWkdEgOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXJ8CCsNS1QaMcsfn0m+y5P6NyFMLI02JABXfdkwrY0=;
 b=JhW+UrIwO1H2jKbXvGi0HjIbxPplNl4f1l++FACt8Lk8W/0huqkY5REk98ZtKdZ4BskdOp9t4mQ0/jjElrZfi7tZAojKZyzkDRWAtyXNJ9RIcy1KU9GQZZHD+oXwTdwCEK1TAwUw3wdjze4jjKIbN8JXm2/pWGngVA0fuQJRTrI8V4qcxMTrMEzc9uZWGDtaQyEJa/u5xdUsZDadQ2Vo0Yx8P15Q4fzA3pPjLx/OhzRjHGT4UTwYVFHolhPxdwC/Yb9Mhl69Dwusk29yix8j3CBeDr8reotrbSFvYp3kBzLO+V1dPj1AWc3MrIM89WAOihcQLmDCHLmw3fbdtkA2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXJ8CCsNS1QaMcsfn0m+y5P6NyFMLI02JABXfdkwrY0=;
 b=NLKDcr3KGA9jkafoNrvDy7iLmh9RE6JWfDqjw43hbUzIWxOoDG4ZyU+nnGqItQ4O1kPLt7ZcT2qf4VnFADIyPjwhsfQ38t2UJGjpKx5GK9ayL3pjEb35XBPw+eysvKMjA6/wZsDSi9o9yvDHDPZF3nACRYZVPw4WegOvkBhO6/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6452909d-94f8-4df3-87fc-d8ee0bdba01a@amd.com>
Date: Wed, 7 May 2025 10:16:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenbus: Use kref to track req lifetime
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20250506210935.5607-1-jason.andryuk@amd.com>
 <6b17cb41-a4f1-4055-966a-54301493085c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6b17cb41-a4f1-4055-966a-54301493085c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 782e647a-322d-42aa-67f2-08dd8d71b468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGJnMnZ5S1dOeS9tMkhrcTA0WVBVS2xReHV5SXNwcTJCYXNpcHlEZ0tpY0p3?=
 =?utf-8?B?ZkExMlhGeWJidlpOQS8rNmNsWjM3WUdaWitQVXpUUndQZG45MkdsVnd4Vlgw?=
 =?utf-8?B?TGt6NXhLMEJEQ3hwamFlc01Jd0dXTTJ5Um5LM2xxQkhuMFBiUGY1QXJyWnho?=
 =?utf-8?B?bXpqZnowaFUyUmtLUmlkY1lPREFHNnluM2lwZGRtQVd3NGFaZjYvRmM4Z1VY?=
 =?utf-8?B?bEk4RXU3bjBNU2dKOUlFYUV4SWdmOEE0TjR2RTF4YVNZT2ltNm5ITi9SODhi?=
 =?utf-8?B?N09lWGhIV0lpREVwRWY5NC92THNwMWtTUFoxMUtEQ25kenZ4dkJSM25MRFlC?=
 =?utf-8?B?QTVwTXBFNG5YRk9HSVFLditTRGhnL3p0NFZxQzJLRmFyT0Ixc0MzdHptSkxp?=
 =?utf-8?B?bTZnOUNHOWFEdEVVUjU1aDAvY2tqNDZKaTJUbHBMTXh5ZzhFNXJ1Ry9Odytr?=
 =?utf-8?B?R3p0TmpQeWpXdVlPckgzM1BMT3JMQTlIbGVMUVRjNXdaK3JPS09JdS9VQVlp?=
 =?utf-8?B?YmJoKzBiQ09pcGNlUzE0M2RaQkFRcy83ek1nbGNxbE5qRHZyMm90aXJJSEVK?=
 =?utf-8?B?ZjFvQ05RRktGRGhYK0N0MzdGVGNIV0VwRlQ1ZDdrT0NGQ3VIT2o5Wm8yQ0s4?=
 =?utf-8?B?L2M4OTJQZzQyRlJleUNlN2p2cjA5WGFJdnNjQ09FRTUxcDB4b05jSTdZZkNp?=
 =?utf-8?B?VXUrbmlaVm90YUxtZkxDN2psMUNNWFBBTnhRckwzbmxHRXVDV2ppWHpiZk1n?=
 =?utf-8?B?dm81a1hrdjljeVQvYzh6d2xNUnUzNmxhMEdxekwycDhjUEVmNStZTnJwa2tV?=
 =?utf-8?B?NWpRNlBnSk5TVUFVQis3MHZGR09tMnozWWdKNXJ6ZUMwTTdtMmhoRU1ya3NF?=
 =?utf-8?B?bHhkWGpPSENGaVdIYWV0QThrZmp3dFNhNG82alhmQTYrRDdQUC9VZm9OUlo1?=
 =?utf-8?B?V3dXd2svSGpvNjNmWERLNlBsMGxYWUdyQlpYZmNnamxRamxCeGsrQlZNNW5U?=
 =?utf-8?B?eXJHalNSVmtOWGQ5SnRDenBMRGlkaGdLTzh5THFPK0VCUmZFT21IZWJvQ3VB?=
 =?utf-8?B?T2lkdE5abzZ3Nm1ZcmN6ek8ycVFMTjEyMCtYUk5DS2tYY0xVU2lqbmFRYnlm?=
 =?utf-8?B?alRwckFhZ1hNWEZZQXNzM0szY2VQM01LN1NhVUtTbGdJcmgwN1ZZQ2RBMWZ2?=
 =?utf-8?B?V1pOaHN5b21kc2daejNVcHVkWTh2U3RTWmxHbVFSTlFscUEvT0RhSllqTk9K?=
 =?utf-8?B?LzNTZjVhY0cwTFJlNktvSVJMNmpzUnlJWk1DZ0ZxZzFSaTQ1bGFBRDgwYWh0?=
 =?utf-8?B?WHBISEhVVlhienk5Y1ZOU2hwTjV6dlA5aTZyTThYNzU5S1JiQTZCekIwWHVC?=
 =?utf-8?B?ZnNJZEpSRjIzYmhPTkJJNXdhVW83VVcrRnBCRFF1NTBOaWpBSEUrMUxtdEx5?=
 =?utf-8?B?Ukg4WUVVMUtidko5K3JyZXYxVHIrSkhBUjd6ZmJsR3FuMnlNNmFFUzN2VW96?=
 =?utf-8?B?MGJUcDhobjBhNW11ZTFraFNZdTBMSTlPRmh5Sm03L0c0T1NSQWhTZmluUVVW?=
 =?utf-8?B?TUJJVVNDcVJrcFFva0U5MWVNVEpjOTB5RjRLQmE0QytkY2M3QStFN1hRTkR5?=
 =?utf-8?B?L2NhNW9nKzNiU3dnbFRVRDdqRlNCelJkWDRDTkFWNWJSSUlKOFFuRUxyNVE5?=
 =?utf-8?B?NjVZcTczNjVWUUdKeVBVdkt1NFNSYWYrU2FEQXMzSnJHN2taL092bno3SnI0?=
 =?utf-8?B?YU1iaXg0UU42QVpJWUZ5T3hNbXJyRGZnWW1kOWZxVUlnUVZDYVFQVERmbEJL?=
 =?utf-8?B?U21jWVF2RXc3Y1ExcUluTXFjU3JZQm1VZUJsZHNScjdVZkl5UUowNjFGeisy?=
 =?utf-8?B?V21QZ2dBZUZ6T2Raa1czZTJNTnJRQklCbnRiZ1BKMDdHNEp1L2dYTWFHRmlM?=
 =?utf-8?B?aWhOZ2VqcTFkVEJTZEtIVE4waHJwVVhISnhjMENLZ3VSeTk3OUcwaHlCNnI4?=
 =?utf-8?B?bFJnWGUrYTVlaHR1QW4xdFpNaWtieUpzcEh0TTIrUGsrbEpqRStmemxDR1h3?=
 =?utf-8?B?OHVFbElzUC9UTkdTcWFvU3puM3lGeEFOVkRaQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:16:05.3321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782e647a-322d-42aa-67f2-08dd8d71b468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265

On 2025-05-07 05:27, Jürgen Groß wrote:
> On 06.05.25 23:09, Jason Andryuk wrote:
>> Marek reported seeing a NULL pointer fault in the xenbus_thread
>> callstack:
>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>> RIP: e030:__wake_up_common+0x4c/0x180
>> Call Trace:
>>   <TASK>
>>   __wake_up_common_lock+0x82/0xd0
>>   process_msg+0x18e/0x2f0
>>   xenbus_thread+0x165/0x1c0
>>
>> process_msg+0x18e is req->cb(req).  req->cb is set to xs_wake_up(), a
>> thin wrapper around wake_up(), or xenbus_dev_queue_reply().  It seems
>> like it was xs_wake_up() in this case.
>>
>> It seems like req may have woken up the xs_wait_for_reply(), which
>> kfree()ed the req.  When xenbus_thread resumes, it faults on the zero-ed
>> data.
>>
>> Linux Device Drivers 2nd edition states:
>> "Normally, a wake_up call can cause an immediate reschedule to happen,
>> meaning that other processes might run before wake_up returns."
>> ... which would match the behaviour observed.
>>
>> Change to keeping two krefs on each request.  One for the caller, and
>> one for xenbus_thread.  Each will kref_put() when finished, and the last
>> will free it.
>>
>> This use of kref matches the description in
>> Documentation/core-api/kref.rst
>>
>> Link: https://lore.kernel.org/xen-devel/ZO0WrR5J0xuwDIxW@mail-itl/
>> Reported-by: "Marek Marczykowski-Górecki" 
>> <marmarek@invisiblethingslab.com>
>> Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple 
>> concurrent xenstore accesses")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks

>> ---
>> Kinda RFC-ish as I don't know if it fixes Marek's issue.  This does seem
>> like the correct approach if we are seeing req free()ed out from under
>> xenbus_thread.
> 
> I think your analysis is correct. When writing this code I didn't think
> of wake_up() needing to access req->wq _after_ having woken up the waiter.

Yes, this was tricky.

One other thing that makes me think this is correct.  If this is the 
same underlying issue: 
https://lore.kernel.org/xen-devel/Z_lJTyVipJJEpWg2@mail-itl/

The failure is in the unlock:

pvqspinlock: lock 0xffff8881029af110 has corrupted value 0x0!
WARNING: CPU: 1 PID: 118 at kernel/locking/qspinlock_paravirt.h:504 
__pv_queued_spin_unlock_slowpath+0xdc/0x120

Which makes me think the req was fine entering wake_up(), and it's only 
found to be corrupt on the way out.

Regards,
Jason

