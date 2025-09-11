Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09647B53D9D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 23:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120882.1465544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwoiK-0000aU-JF; Thu, 11 Sep 2025 21:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120882.1465544; Thu, 11 Sep 2025 21:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwoiK-0000YC-Dh; Thu, 11 Sep 2025 21:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1120882;
 Thu, 11 Sep 2025 21:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u83V=3W=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uwoiJ-0000Y6-A4
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 21:20:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2418::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c2d7432-8f55-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 23:20:15 +0200 (CEST)
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 21:20:12 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::94) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 21:20:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 21:20:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Sep
 2025 14:20:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Sep
 2025 16:20:02 -0500
Received: from [172.17.248.197] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Sep 2025 14:20:02 -0700
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
X-Inumbo-ID: 1c2d7432-8f55-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjkl4ui0p2OD1cLImV0zwLq4GnTiMpHluAX0eBG88OeEb+72lNer1dRSML/8eC9peb4T7QXjVchXvMUPJ6vWkZVeS8L+YUfu+oz5Fflui7o+DwHWm1yoHN4DamMdh+5cGbb/zrQblIKCZqOYBIaQfFXG7TLnO2bDXs7qEfQFcDQm1XSlXJbUXPATzHTsN1zaQmvc5m/B4/DGvnDep8YRAFxsv5bhC4Q+hrH2TMnBEE+WhWo8iB3e1+S/sxJbZpzkyJWOBbcF6v+oMiYZuoG5TjYHwavuxfMNGqZycA8wXcS8AjXE3RFruwnNRjPK9s44aK2YcZ7wCCh/Hf6LA74gJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYxhfaTKwgGAktgCxBHpAENAvJBMyx4rARatCt1E9C8=;
 b=LJEwSjpPqo3NaBvkkMry30D7nLpC/yJoV94oaZAQOAZ4RzXs5q+sQ1Kh0+CMI3pIAHz0fUklvDlhD/F5bw5EvBkC1duYrQGP7s2CxUlsp5picD+wooqS6QJjH+vqCPo1PuI13m7+lU5YK4Z7xwo3zPKUZOrWQaX1yvRRKJPD9fNjmTAJbhUJD31JihXfIVYr0XQ8vxYKBBMpb5HDtYv/e3w96rdeNwY5JjNDUgZQA7a47StSbtzXmEZ686XBAtAZRpWP1VXzku2fNoApevg58AkDn+3VjxNtJtUvqKzQrjYeobmiz0cnMN/6gFruLvhysbHh2QGRt36Trx2dzjvbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYxhfaTKwgGAktgCxBHpAENAvJBMyx4rARatCt1E9C8=;
 b=CwYFocD8NObFF7B9aT5DXpZPAfFGwSJye2dDjPY+7yAo1RSZyiP8h8/bQZD+aPL/i2o5MB0oCGs8kdZojtgNaf9Z+7yEXdZzxD1VCl1V+wv5C/mfYn0Ci7osj3BqGBM1G5EaeHl6k71XRCzDuVHBpYNQK0tM5SDhjt69ZsFExEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <44207905-ece0-48f1-a7d7-8c30720cb48d@amd.com>
Date: Thu, 11 Sep 2025 17:20:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU reboot claim failed
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
 <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c72dfb-a215-4283-598c-08ddf178fe8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UENaaTlSLzMvc29HNmwxS09pdlRMNGNENFRmL2Y5VUY4R1o3N1g3aVhoQ2g5?=
 =?utf-8?B?UWdxMVQyRmJKVTFYOEptRHBlOVpucmN0NGsxcmxsZ1dDMFRWOXBRWjNNUGRL?=
 =?utf-8?B?QlBoQVZzOVBpWm1wbERpLzIwRWxNRS9MOEo0eUxSWTFsODZnK25qQTNDRUVC?=
 =?utf-8?B?U3ltWTU5TzRsV3BOaWxzNmVJdytzcE1DYjNUYWgzVVBseVUzOHpQdWFjME1s?=
 =?utf-8?B?YmFXSGRuZjZ4K0xXcG5zN25TeGszVitneHZxWTZXRW5aTmhHQ05RSk4yZ3dV?=
 =?utf-8?B?Rk5mWDl2YnA2MDhqM2VrSTU5YlhvazFoK25wWDRpeElqMldvYmdnSWtrR0VU?=
 =?utf-8?B?Q0dUM0RQVkZJV1NHS3pVaXAwRmV0aUthdG9FcUdWT28waFU1RldDb2VudUZw?=
 =?utf-8?B?bys0bEoxWE9zZFJqSEtLcy9LQ0xMLzRGOFd3TENsWngrOThmNnAzM1gwMUZn?=
 =?utf-8?B?TnZnelRLNnpOTTNseTVlL0VhZkZmUDB1SWNxN3NQUlBhT3lqR1p6eUVUY1Fu?=
 =?utf-8?B?TUFCWHVGQXM3czRVY0xtcWxkQ2FSY3ZjK3NBdjk0OGJaMFpGQUNsdFJrUVZU?=
 =?utf-8?B?MGE0bVkraS9FeVg4WnROeGJZWW9VYmU3ckZFU1ZFK3Bsd3RCbTk5b25DSDZR?=
 =?utf-8?B?dHJlcWtFNDViUlNaVzhZR1Y0a1NNcWhqQ1Z6NlRwUEJUVDNsY1JlcS8rQVJx?=
 =?utf-8?B?YkhMaGVhNlY3OVRMc2pFV2tPS29WRDdZN1JpSmJ5VmNqbHRHYWxhVDQ1cUtx?=
 =?utf-8?B?Ry9CcUJwbGxWMnZqSTExUWFHbUppL3dBdkNPWVRMdmZiY2hSMXZWSDJaMDM1?=
 =?utf-8?B?MzVvaTROUWlxZzE5a1dnNVlkQWdWOC96a2RYc1dZRml6MUZMZ01QbCtaSVIz?=
 =?utf-8?B?OE52Tm00WThpN1Vmb20yVmpEVUNidGIwTFlsWFNyd1VhT25DL2tjYy8rVmM0?=
 =?utf-8?B?TnFvZEExYUt0K0pkRDNTaWdkaDArSXQ4c0NwaWQxSWZFWmhxZDRwaGs1Rmsy?=
 =?utf-8?B?dHJjRVI4NEp2NFJGdnFMdVUzVkgrb3B3bXlJU2Fad0tBNThUV0ZQQ2VMM3lV?=
 =?utf-8?B?a0pudDY5R3BnbHJ1VjYrcldTRE5CWTA0Q3NlQWdZVkY2UytETUdVTXRnODZi?=
 =?utf-8?B?ciswT3BNNlIvZ0RBK3FoRUNTUVhZOWo1bXp2R2tyRG53R0Y0MHU1L2cwWGNZ?=
 =?utf-8?B?c3lXMnkxMDNxQ3dKcDlvckxiVjZtOURtRTZRT2F0RG1iTnNMaUpuY0ZUQ0hV?=
 =?utf-8?B?ZHppRXJZMHFSWjhpYjhUbC83M1FCb2lwcWVGRm41cjBRUG12bWdldVRsT3ly?=
 =?utf-8?B?b1p0Um9YclNzT2FnUGpxdHhOSVlXRExoVXUxazFpc0NKZzlKR3lCL1hrV2VC?=
 =?utf-8?B?emY5eStqdVFFeGJ5WndlVWdkb28wemJ6MEt3a0RzSzFQelAvSk1vOHZab3FN?=
 =?utf-8?B?WDFyV2ZQam8rRWcyTHpOWDJGbDNycmZ3a3gxWlFPTDlNeEZPUmdBeklDV2po?=
 =?utf-8?B?TlpidFJEeHFad0IxSm5Ta0ZrODJBREZRUmhFQUhqa0U1bFVkTnNsb2JIelJT?=
 =?utf-8?B?dGx0NHZ3UklWOGxoRHBnUGRRR3FjRVZIblUvb1FNZENPT3hvUE5rWXR6MDZh?=
 =?utf-8?B?YU1ITDZSSkYvWTR4YzVycHBzRndTOW5RUnVpbGJJRE1zMEUreGV5RHVZTkdl?=
 =?utf-8?B?KzlLeUgzd0JFeXJ0Ymp5MnlrRDRCRXJJUDZlWXpSVk1CTG9NUUpKQVdURVoy?=
 =?utf-8?B?THVGNFBsNWYxb09zRXF4SlJtUjhuanVXd1VJSGZQY3drblBvK1JTWXlaMXY1?=
 =?utf-8?B?SXI0b2ZDVzRTZjJoelIzc1hsK3QwQXExMjNjTHkzNWpsMUViWkNSa1R3dW5W?=
 =?utf-8?B?ZHRJSUNSUmFwdmlEYy9aN1k1KzIvdHdCTTRBeTR0bHc1QjRkRlZMU1VLbFlG?=
 =?utf-8?B?alVhejdpay9JaFRuamtpZzJzRFp3cTdkTTBmYkVpb25OK0ttSXgwc3hpejhR?=
 =?utf-8?B?TUplZ1dXcGc2QnFuanRSMmJZdHE0VHR6ZGwwc1BhZTc2cVU5SURkZ2FJSVJP?=
 =?utf-8?Q?81Qizl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 21:20:12.3946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c72dfb-a215-4283-598c-08ddf178fe8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646

Thanks, everyone.

On 2025-09-10 17:57, Andrew Cooper wrote:
> On 10/09/2025 7:58 pm, Jason Andryuk wrote:
>> Hi,
>>
>> We're running Android as a guest and it's running the Compatibility
>> Test Suite.  During the CTS, the Android domU is rebooted multiple times.
>>
>> In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
>> domainbuilder: detail: Could not allocate memory for HVM guest as we
>> cannot claim memory!
>> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
>> allocate low memory for domain: Out of memory
>> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
>> failed: Cannot allocate memory
>> domainbuilder: detail: xc_dom_release: called
>>
>> So the claim failed.  The system has enough memory since we're just
>> rebooting the same VM.  As a work around, I added sleep(1) + retry,
>> which works.
>>
>> The curious part is the memory allocation.  For d2 to d5, we have:
>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>> xc: detail:   4KB PAGES: 0x0000000000000000
>> xc: detail:   2MB PAGES: 0x00000000000006f8
>> xc: detail:   1GB PAGES: 0x0000000000000003
>>
>> But when we have to retry the claim for d6, there are no 1GB pages used:
>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>> domainbuilder: detail: HVM claim failed! attempt 0
>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>> xc: detail:   4KB PAGES: 0x0000000000002800
>> xc: detail:   2MB PAGES: 0x0000000000000ce4
>> xc: detail:   1GB PAGES: 0x0000000000000000
>>
>> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>>
>> Does the change in memory allocation stick out to anyone?
>>
>> Unfortunately, I don't have insight into what the failing test is doing.
>>
>> Xen doesn't seem set up to track the claim across reboot.  Retrying
>> the claim works in our scenario since we have a controlled configuration.
> 
> This looks to me like a known phenomenon.  Ages back, a change was made
> in how Xen scrubs memory, from being synchronous in domain_kill(), to
> being asynchronous in the idle loop.
> 
> The consequence being that, on an idle system, you can shutdown and
> reboot the domain faster, but on a busy system you end up trying to
> allocate the new domain while memory from the old domain is still dirty.
> 
> It is a classic example of a false optimisation, which looks great on an
> idle system only because the idle CPUs are swallowing the work.
> 
> This impacts the ability to find a 1G aligned block of free memory to
> allocate a superpage with, and by the sounds of it, claims (which
> predate this behaviour change) aren't aware of the "to be scrubbed"
> queue and fail instead.

Claims check total_avail_pages and outstanding_claims.  It looks like 
free_heap_pages() sets PGC_need_scrub and then increments 
total_avail_pages.  But then it's not getting through the accounting far 
enough to stake a claim?

Also free_heap_page() looks like it's trying to merge chunks - I thought 
that would handle larger allocations.  Are they not truly usable until 
they've been scrubbed, which leads to the lack of 1GB pages?

Clearly I need to learn more here.

> I thought OpenXT had a revert of this.  IIRC it was considered a
> material regression in being able to know when a domain has gone away.

OpenXT wants to scrub the memory ASAP so there is no remnant data.  They 
is a patch for that.

Thanks,
Jason

