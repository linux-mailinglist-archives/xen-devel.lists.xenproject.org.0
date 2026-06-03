Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ga5AWU0IGpMygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:04:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396C6385F5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:04:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=vUFQu1yJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326434.1591877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmCT-0002to-0t; Wed, 03 Jun 2026 14:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326434.1591877; Wed, 03 Jun 2026 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmCS-0002rA-UH; Wed, 03 Jun 2026 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 1326434;
 Wed, 03 Jun 2026 14:04:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wUmCR-0002r2-7j
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:04:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmCQ-00467Z-E5
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:04:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a20343a-5cb7-0a2a0a5109dd-0a2a4507d266-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:04:01 +0200
Received: from [40.93.194.55]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a203450-229c-0a2a45070019-285dc237d65a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:04:01 +0200
Received: from SJ0PR13CA0143.namprd13.prod.outlook.com (2603:10b6:a03:2c6::28)
 by IA1PR12MB6577.namprd12.prod.outlook.com (2603:10b6:208:3a3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:03:55 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2a) by SJ0PR13CA0143.outlook.office365.com
 (2603:10b6:a03:2c6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:03:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 14:03:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 09:03:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 07:03:53 -0700
Received: from [172.18.181.126] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 09:03:53 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHIl9oYmS4DKY/4SzFtBhlMM8JQT47zLP+qnyFNUETUjZ6hDLqKsI0CLfpuDUC1DwYW8ldL/XgK4Bd5T6HR+PTshDxiF98Oqt39+ia8s1WG3zKJxv261WYijVrA8XaHkUEbH3Ra2trAjA9QjBX5C8ZT5IcDYP8yx3Sk8Zqa3bUmG6BXUwCgjEoBZ1H/cUnyb+6L5NwjtHL+g4vd/d1e/lBfkoH3K2aIOPaPA7o5j4rcmMwr2hgiMUJDNdqUjWPCAhUPzmjLKdVBMLDfu49POfMXnf2QACpkXkRnwhVQH91PFEYPODAAVLqcV6Uur0+RoPsA98ZdJNyHEMBY8SyLcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtUQ7dI8GYYjwXRow9TBh9EOBLUJfW3qGKPhhNc4IXk=;
 b=jgi4sPUdI04BMDVV4Z2sXfo8CBUggsSXj04MFD+23oL6kNfI+orwHa67L73uLsfhjYTUQp+5WZyP2vAQig+O8M1xiVB+B0p3VU32o262u1DEoMWbqu7DOmdkim1BLP2t9a1AkUMpvLQ0c+s0idbNJIAzFoWtU3MA791qKO/mhDegOrWSu7QmBoV5qdqAqmTgp9243qQbSIPmvpIjH+fq45D7MuX6JakeSoc1XxRvlbBlE5hGILbkD+uMLiX5K68xh909MuEm1u6kfTMuAWrREKYdeTTjlyjCYVQuuqbAC+L9PlX+UNGpwVIOIMsBnEPHm5x4FVOcTFL382q1zIdjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtUQ7dI8GYYjwXRow9TBh9EOBLUJfW3qGKPhhNc4IXk=;
 b=vUFQu1yJ6a/mtxxtnP1G6QTMzbJnM7z/GPz5LvBN5kyMVDx9dX11jBV/bNsabe4p7N+0e1p73Tu+LzOsdV0BAsHZgB9kR3TShr4UqH9D9eHLiHfJ/GPXLo4DUpIG4FxbJWWAE1rJBQG4kT4fM5rB5YLaJvUjAZf5kjWiZNJPh+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
Date: Wed, 3 Jun 2026 10:03:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
 <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
 <ah5_0vvipY2Wch-x@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ah5_0vvipY2Wch-x@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|IA1PR12MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: bcab0520-a2ee-422d-1b9e-08dec178f28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099006|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6fw9MBgJdW0UpQw9BhcCsXRqq/uCd2W92gLZm5AG3RENULYG8m4FB3/KfOs15n576wO75AsNu6AvNLa7voNFpC7uyG3BUmy1ZTJL9mj/aC1dC1C1mFzTuqAt/Mq85EcqXJBxRpVcxFyGMPbM/WT0xjDCXMUF0NKFmoT1V26Y6Iob7o10QPAj/D8RAqcggqLZP9A6/nAhUyNw+FIhkvvJLYGu8jYURlVNNnFbcoGHT8EbhT+qyTsf4CV+BXnIdWJzEG0DV5nJ0xNte2rbWUl2OXizKRl2eTFvUU487zkvY5L5cjVGgaQYe1rjKbPd0brnHWB+RH1rMSTRmENH1s4D2sFLvzs5XSl6xoRP5mUu45R+nvCNuJ2H4WDYybMLvscctj/EiUV3sCTeOn13+lN9q7/rSPzmvCcvTjPVcqn3uE1KqBZ6GIT37AmhATz3gaRa50ejlr2hrWDUOBm+8l87Uf8guAfRTuT9gPM+bM/fuOBsGkuy5nXz+ARLoxUu5N3GWP3GMhgZiODSQSt1jI/Jn/xnSKsF2W7lu+H+79xbA+60YBwBma+loXRoVkCdqUu8hcsK7XwDdc+QiJPh286YilNKCUb5r3pe6HK+hjHKPtHixqrOGbNRlJn2w4/HKExRQJr8pXDxiC1aMahaT6VLpKgVyCTewlwCu3PnV3iG6MIeryvjM5peVkizinAKduqFYH6fw5nD3hegRADdqJ8yvc/TX5ZkLCOwGbfSnVkoMXQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sQROONdT9dtGKQvw6qwUm+1mK2I6ClZ2DPBc9TUHmeOTdegZwhUr76sj1qgxykmSuCcbZ9dD9KtbhZX3D8VDXkVYoLT5PxLPrRww/SRducU7t5FcnH+METBN9Ud5H/QVDA2ZYhR6XJPgM06lE5Hw20VB/GMzeXgTdl7fr+GcdUj/LHnJR6C/WoIVejt2J1v46wC/2/VugXpFx1qwmgoy+HeJjkO+8zVDb8mwbEjAbWD8sb3wFllTM5cjk5xCedrukByQ09RElKQNBLr1S2EieDCQTBeuYgvXeigvl9RY8EI/V9jEo86FB1cj8E9c1rhNWIJKVxytFtaASVukpG66qXGu6xLbqC7JTF6GlxkmnM9Op6VjjKQw2wrD/zIulcGIj0vYuMOdL4A3q42GUFKe/1WzcIvqOZ78zKBP/oNhaVRdOmguMC2JRIRa45oW5uBL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:03:54.2103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcab0520-a2ee-422d-1b9e-08dec178f28d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6577
X-purgate-ID: tlsNG-ef75cf/1780495441-2377AC48-23AFE7A6/0/0
X-purgate-type: clean
X-purgate-size: 5546
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6396C6385F5

On 2026-06-02 03:01, Roger Pau Monné wrote:
> On Mon, Jun 01, 2026 at 05:07:52PM -0400, Jason Andryuk wrote:
>> On 2026-06-01 13:00, Roger Pau Monné wrote:
>>> On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
>>>> A single stubs page is initialized with 0xcc and re-used, with multiple
>>>> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
>>>> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
>>>> page is freed.
>>>>
>>>> Booting a system with smt=0, CPU0 is initially setup, allocating the
>>>> stubs page and initializing to 0xcc.  When more CPUs are brought up,
>>>> CPU1 is initialized and then immediately brough offline as it is the
>>>> sibling of CPU0.  Since the page was initially memset with 0xcc,
>>>> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
>>>> However, the page is still assigned to CPU0 and continues to be assigned
>>>> to other CPUs.
>>>>
>>>> Meanwhile the page can be reallocated, which can lead to misbehavior.
>>>> The particular instance was the stubs page re-used as a page table which
>>>> later faulted when the entry was all 0xcc.
>>>>
>>>> Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
>>>> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
>>>> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
>>>> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
>>>> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
>>>> partially used.
>>>>
>>>> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
>>>> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
>>>> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
>>>> should be okay to use here.
>>>>
>>>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> ---
>>>> It would be nice to use get_page()/put_page() to let count_info handle
>>>> reference counting, but they require an owning domain.
>>>>
>>>> The listed Fixes introduced the use of 0xcc, but the smt commit may have
>>>> made it more problematic.
>>>> Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
>>>
>>> Speaking with Andrew, we believe it might be easier to simply forego
>>> the freeing of the page, possibly something like:
>>>
>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>> index ff05955bae40..62c6cbf4b561 100644
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>>        {
>>>            mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
>>>            unsigned char *stub_page = map_domain_page(mfn);
>>> -        unsigned int i;
>>>            memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
>>> -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
>>> -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
>>> -                break;
>>>            unmap_domain_page(stub_page);
>>>            destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
>>>                                 (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
>>>            per_cpu(stubs.addr, cpu) = 0;
>>> -        per_cpu(stubs.mfn, cpu) = 0;
>>> -        if ( i == STUBS_PER_PAGE )
>>> -            free_domheap_page(mfn_to_page(mfn));
>>>        }
>>>        if ( IS_ENABLED(CONFIG_PV32) )
> 
> I think I've made an oversight in the code above: if all 32 CPUs
> sharing the same stubs page are offlined, the reference to the stubs
> page is possibly lost (if CPUs are not parked) and a new stubs page
> would be allocated if any of those CPUs is brought back online, thus
> leaking the previous allocation.  The simplest way to solve this would
> be to introduce an array that indexes the stub pages, and replace the
> logic in cpu_smpboot_alloc() that figures out whether stubs.mfn is set
> for adjacent CPUs.

Right, but I thought Andrew's point was that offlining 32 CPUs is 
unrealistic, so don't even bother tracking.  If CPUs are offlined (and 
you somehow keep running), you can leak the page.

>>> (there might be further cleanup possible if the page is not freed, the
>>> above chunk is untested).
>>>
>>> It's a single page shared between 32 CPUs, and offlining 32 adjacent
>>> CPUs seems very unlikely.  IMO the extra complexity of having to deal
>>> with the freeing overshadows the very small memory gain we get from
>>> it.
>>
>> Hi Roger,
>>
>> Yes, I made and tested the same change locally last week.  Well, I retained:
>>       per_cpu(stubs.mfn, cpu) = 0;
>>
>> Maybe it would be good to save the mfn in case the CPU returns?  But I
>> thought per-cpu vars are cleared, so it wouldn't be available anyway?
> 
> Depends on whether the CPUs are parked or not (see park_offline_cpus).
> I think leaving stubs.mfn is fine, in the parked case we avoid part of
> the setup logic by already having the mfn cached (no big deal either
> way).

Right.

>> Also, I was waiting to see if anyone chimed in with other ideas.
> 
> Maybe you could assign the page to dom_xen and then use
> {get,put}_page(), but again it seems overly complicated.

Code-wise this doesn't look bad, but it blows up:

(XEN) d[IDLE]v0 Over-allocation for d[XEN]: 1 > 0

I don't think we should pursue that.

Regards,
Jason

