Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wXNgBqqGKWrTYgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:45:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1C66AF9E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=uFEWcaPd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334509.1597519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXL7U-0004ce-Uy; Wed, 10 Jun 2026 15:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334509.1597519; Wed, 10 Jun 2026 15:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXL7U-0004Zs-Qt; Wed, 10 Jun 2026 15:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1334509;
 Wed, 10 Jun 2026 15:45:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wXL7S-0004Zl-Lw
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:45:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXL7R-009xxa-O8
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:45:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a298680-2eae-0a2a0a5409dd-0a2a4503b146-34
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:45:29 +0200
Received: from [40.107.200.61]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a298697-672d-0a2a45030019-286bc83d3d0a-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:45:29 +0200
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Wed, 10 Jun
 2026 15:45:20 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::8a) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 15:45:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 15:45:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 10:45:16 -0500
Received: from [172.17.22.200] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 10:45:15 -0500
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
 b=mt8eC5tzQv6OQCZBJKFR9XWMohwxy50/8eOUKOnYOxdTA33h9H+TmCN2Ckg6vr1akHDrzxEa6wOQc31lrT+G+fyC0eIZP0qJgmiBiaUR0IFiZzIpLwDCTqHbxuKK2+pGePSKoVnQ+4B9eO2k3rPnsujiO4SLunDPZmGMRJnp5lkN9SQ1mkb1UNz/6IpNYQQ/WLIK0Lz9QDgXHBkQ733Hx4zsCPM8GApBJGbGOKkkTFlJNpBovXgFZpHcspcT3YSYKijavaqbTJtu9qOvug7gPPHQCACks89M7UoVaXe/fp4tR58vmk/Dl0Q5y2YZ437MOYywitNrB2q5mvp5SfeOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwDpoZYDoqRnwaMk4OgJztsPnMqVvdDuo/by29s8Q+o=;
 b=HuLQMeN9UhO5U0AbjrbbPN4DU0HSL6Cr+0QbutTkJoIdS10hPxn0lYCUWHFqLWDXHe0apF/tIK86EdmuqeQJ023Ofd4J4Xwt+wVU+Mj9f5zImGMlqIj3zRfMcUqWbPhs/1TBdoplVtDE7pj6t7AKk1N3+k0SQiyVo0rrCp36G7bPggpzIU3Y58gvWipkrC7iMPXk3Wz1raopw2PuEAPtvSTbx/M/2RmCH1BPuwEvsCyaedbqpkxXyRrbfBI3f8L33CypvWablLoXLSHiIibLbCA84LgyNMMpnZQuDhZPulDVkp4NVeDkRFcXJCfFodWfBHfZGDzg397o6REYUHRnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwDpoZYDoqRnwaMk4OgJztsPnMqVvdDuo/by29s8Q+o=;
 b=uFEWcaPdmg03C/gZy+H3r8icP73uYPl+GJcnAkF3vJym3lBPj3DcOPgU9LvRJxVQmQyDNsxvJftbWD4y6DoFrDfzESZvxJ1I46gJzKd8aauT8YtrRGeSvt7kaI3K4DKnwYrQ1QUAp1h2asD2jY19Sebe7G2NdyT+aRmkPytbma4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <085ebfb8-d76c-4a13-8b5b-130959b25b51@amd.com>
Date: Wed, 10 Jun 2026 11:23:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/x86: Change stub page allocation/free
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
 <20260609000638.121027-3-jason.andryuk@amd.com>
 <ail8YNrQLZ9bumiH@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ail8YNrQLZ9bumiH@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d3b8f6-5f4b-4795-26b5-08dec70744d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	2DWm5PwWJbQdDW/szJ13uIMcYUzeqlNDe5a+CByqy/iqiDDTj6Of9lijnsKsymO5txzKkssp0zc7TBQTN6oxY6bOthLOjzI10PYAywWC2AlPQibOqF/dPQg2lrUCbluzcPLg/P7k0OJSbTo7kPmduqy8F+ZCkTPQ+gUx9m01wm4QHQfjTDWd+uUs82mgg7m1SHOkFVNaDtstLwgonuy3ZCvtEDskof25vpzrT0zEb/zudl5PbaxIRl5mM1c7nfDDlB9lcdk4bmt5aUDsoiJlENm86Bm/lNv2j/FZKzbcsSjeHmbwwZaEnNW2cw88mbD/Aw7cfZJ68sIAp+e+vNZlOXIljhgvEGORqiAQx4rrLoxy2DeQ2p6XOiB+SMM68ufhenK1slzgXFjDtQn7VJX+SY62IIqDpL9WibtZppVtHDf5ocK5tYDXDkxkfCClUnqDhN290ZC0/Qu7eKxXiHaQ2VPbunPUwMlRdznvKg/Ax5pJ8OTbGAD6uuMU+fRMMg1XRmOQzUg/dkcuKTiPs98OZ7foJJGLTuueajrZ2uEeUs5Nx2WzhOtvoF+GoxKHaYVEbsRpvQbsiuEQIVpo1fQRGQPtKTuLvyOpy8Fg6y4BLn0gdtI7fSzW2EpuIcJ/FD6Nkui6skIUIDgjzma7SA13+mQTJIMvx4z/ZFllZK615E6F1AvIDBNya0Rb+TPTW1ExCaYWh4kzD8EOaznTttkvohgsD3hsnuT3qd7Zv56T7Rg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YBhOwWqWdvAbDRp95HRPbLbk2/HNWVtFm2ZA1LD9ki8NCJrPbxsPUHcrCyTLLlKF9xuF5HNvRQPKjoBtyDTZzMt+bWgeU476NLKaBE35oegTLMXGGJqemVo1T2lHmTDP7XCICjdXJ7Tq1aQEslDRi1bhvJQtdXPH2H1RrhSuM9fP4Yfw41l+RoA3l9MOjRwyeA8PxRnfMzrKUPlVyznh0QZ3KKrZr9o68vx8uImUB4EUQUMNhWLjHH4Ig22SRbm4RfbanTWjXRGwZ8JIpAV7j44o/xi2tkKXLgR3eM2kzBdKPKKLpQCAGgc0fbnbzoxDxIEIuTtWVZZ4So3x4PQXeTpmcnrrWIcyWXUXSXhCv8F1xLjtoX26YDYcq5qv7mNzUnN2MO+F/Lmf341TQxgW53PmlLfn36SJMSjDYJgVp40EaU0EAXTlTENze1mbccbB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:45:16.6344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d3b8f6-5f4b-4795-26b5-08dec70744d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226
X-purgate-ID: tlsNG-33051d/1781106329-38B74938-FE977C3B/0/0
X-purgate-type: clean
X-purgate-size: 9922
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
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50E1C66AF9E

On 2026-06-10 11:01, Roger Pau Monné wrote:
> On Mon, Jun 08, 2026 at 08:06:38PM -0400, Jason Andryuk wrote:
>> Today the inline tracking of the stub page is problematic.  0xcc is used
>> to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
>> with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
>> the in-use stub page.  Subsequent CPU onlining can write to the re-used
>> page.
>>
>> The new approach uses a global, CPU-indexed array of stub pages.
>> However, to handle NUMA aware allocations, we cannot allocate all the
>> pages in advance because the NUMA information is not available.  Keep
>> track of 1 current page for each NUMA node, allocated on demand, and
>> allocate the stub buffers out of those pages.
>>
>> The current NUMA allocation approach is opportunistic sharing among the
>> groups of 32 processors.  The new approach will allocate buffers densely
>> in a NUMA node.
>>
>> stub pages are no longer freed.  They remain referenced in the global
>> CPU-indexed array and are re-used if the CPU is re-onlined.
>>
>> stubs and node_stubs don't have an explicit lock.  During boot they are
>> accessed single threaded.  During runtime, &cpu_add_remove_lock
>> serializes access.
>>
>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> I'm not sure how to test the NUMA part - I don't have an NUMA system.
>> Also, if NUMA is active, is a cpu node of NUMA_NO_NODE still possible?
>> I used the MAX_NUMNODES + 1 array sizing to handle that, but it's not
>> obvious to me if that is necessary.
>>
>> Roger mentioned removing the per-cpu stubs.mfn.  We'd need to replace
>> that with exposing the stubs array for traps and the emulator.  I have
>> no idea if that will be an improvement and am looking for agreement on
>> this patch before attempting.
>> ---
>>   xen/arch/x86/include/asm/stubs.h |   2 +-
>>   xen/arch/x86/setup.c             |   3 +-
>>   xen/arch/x86/smpboot.c           | 110 +++++++++++++++++++++----------
>>   3 files changed, 77 insertions(+), 38 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
>> index a520928e9a..9d776f81dd 100644
>> --- a/xen/arch/x86/include/asm/stubs.h
>> +++ b/xen/arch/x86/include/asm/stubs.h
>> @@ -32,6 +32,6 @@ struct stubs {
>>   };
>>   
>>   DECLARE_PER_CPU(struct stubs, stubs);
>> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
>> +unsigned long assign_stub_page(unsigned int cpu);
>>   
>>   #endif /* X86_ASM_STUBS_H */
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 19ee857abf..0cac94cbdb 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2089,8 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>   
>>       init_idle_domain();
>>   
>> -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
>> -                                           &this_cpu(stubs).mfn);
>> +    this_cpu(stubs.addr) = assign_stub_page(0);
> 
> Given stub pages is first used quite late in the boot process, the above
> arrays would better be dynamically allocated using xvmalloc_array().

Ok.  At some point I intended to dynamically allocate.  But x86 doesn't 
have num_possible_cpus(), and I thought num_present_cpus() wouldn't have 
the correct value.  nr_cpu_ids seemed close to the value, but then I 
convinced myself NR_CPUS would be okay.

>>       BUG_ON(!this_cpu(stubs.addr));
>>   
>>       bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index d7619f534b..d9cd90389d 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -641,41 +641,96 @@ static int do_boot_cpu(int apicid, int cpu)
>>       return rc;
>>   }
>>   
>> -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
>> +/*
>> + * Indexed by CPU.  `pg` may be shared by up to STUBS_PER_PAGE CPUs.  Offset
>> + * is the byte offset into the stub page for the CPU's stub buffer.
>> + */
>> +struct stub_info {
>> +    struct page_info *pg;
>> +    unsigned int offset;
>> +};
>> +struct stub_info __read_mostly stubs[NR_CPUS];
>>   
>> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
>> +/*
>> + * Index by NUMA node.
>> + *
>> + * `pg` is the current stub page for the node.
>> + * `next` is the next available stub index (STUBS_PER_PAGE available).
>> + *
>> + * if `pg` is NULL, allocate a new one.
>> + * if `pg` is !NULL, use `pg` and stub `next`
>> + * When STUBS_PER_PAGE are all assigned, clear `pg` and `next`.
>> + */
>> +struct stub_node {
>> +    struct page_info *pg;
>> +    unsigned int next;
>> +};
>> +struct stub_node stub_nodes[MAX_NUMNODES + 1];
> 
> I think we could get away with a single array, that uses the CPU as
> the index and stores the physical address of the stub.

Yes, this is a good idea.

> We could also simplify the allocation logic, assuming that CPUs
> belonging to the same NUMA node are packed contiguously in the common
> case.  I've given a try at this, and adjusted your original commit.  I
> however only tested this in QEMU so far.  If you think it's OK I can
> test it on XenRT and see how that goes.
> 
> Sorry I took over the patch, I didn't want to force you into another
> direction without knowing whether it would be OK, as it wasn't clear
> to me this approach would be fine (seem so, but still needs further
> testing).

No worries.  Thank you!

> One thing that would simplify the logic greatly, which Andrew brought
> up, is foregoing the NUMA memory affinity for the allocated stubs page, and
> allocate and map them contiguously in both the physical and the linear
> address spaces, so that you would find the VA using:
> 
> XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * STUB_BUF_SIZE
> 
> This would possibly allow to simply populate the whole range up to
> num_present_cpus() at boot and get done with it.  However that's a
> bigger change that should likely be done after 4.22 is out.

 From your initial feedback, I intended to use a single array, but NUMA 
quickly complicated that.

> 
> Thanks, Roger.
> ---
> diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
> index a520928e9a50..d575f1eb0631 100644
> --- a/xen/arch/x86/include/asm/stubs.h
> +++ b/xen/arch/x86/include/asm/stubs.h
> @@ -32,6 +32,7 @@ struct stubs {
>   };
>   
>   DECLARE_PER_CPU(struct stubs, stubs);
> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
> +unsigned long assign_stub_page(unsigned int cpu);
> +void init_bsp_stub(void);

With init_bsp_stub(), assign_stub_page can be static and not exported.

>   
>   #endif /* X86_ASM_STUBS_H */

> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index b3045eac5b5e..dd0972a3025e 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -20,6 +20,7 @@
>   #include <xen/serial.h>
>   #include <xen/softirq.h>
>   #include <xen/tasklet.h>
> +#include <xen/xvmalloc.h>
>   
>   #include <asm/apic.h>
>   #include <asm/cpuidle.h>
> @@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
>       return rc;
>   }
>   
> -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
> +static paddr_t *__ro_after_init stubs;
>   
> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> +unsigned long assign_stub_page(unsigned int cpu)
>   {
>       unsigned long stub_va;
> -    struct page_info *pg;
> +    paddr_t addr = stubs[cpu];
>   
> -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
> -
> -    if ( *mfn )
> -        pg = mfn_to_page(_mfn(*mfn));
> -    else
> +    if ( addr == INVALID_PADDR )
>       {
> -        nodeid_t node = cpu_to_node(cpu);
> -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> +        nodeid_t nid = cpu_to_node(cpu);
>   
> -        pg = alloc_domheap_page(NULL, memflags);
> -        if ( !pg )
> -            return 0;
> +        /*
> +         * Attempt to use the same page as the previous CPU if possible,
> +         * otherwise allocate a new one.
> +         */
> +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
> +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
     PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE)
is to ensure we it remains inside the allocated stub page?

> +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
> +        else
> +        {
> +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
>   

> @@ -1092,15 +1106,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>       memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
>       disable_each_ist(per_cpu(idt, cpu));
>   
> -    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
> -          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
> -        if ( cpu_online(i) && cpu_to_node(i) == node )
> -        {
> -            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);

This loop tries hard to re-use the same page for a NUMA node.  My posted 
approach will densely allocate the stubs.  Your approach would re-use 
less, unless the CPUs are contiguous in a node.

This is just an observation.  I have no idea how NUMA nodes are 
allocated.  The "round robin" code in numa_init_array() made me worry 
that CPUs are more likely to be non-contiguous.

If you have NUMA systems in XenRT, I think it would be worthwhile to 
test.  Some printks to see how many pages are allocated would be useful.

Thanks,
Jason

