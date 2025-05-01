Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128BAA5F71
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 15:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974146.1362086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUDE-0003Or-3N; Thu, 01 May 2025 13:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974146.1362086; Thu, 01 May 2025 13:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUDD-0003MR-W1; Thu, 01 May 2025 13:44:27 +0000
Received: by outflank-mailman (input) for mailman id 974146;
 Thu, 01 May 2025 13:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/ab=XR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uAUDB-0003ML-Nm
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 13:44:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 639f5697-2692-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 15:44:24 +0200 (CEST)
Received: from MW4PR03CA0217.namprd03.prod.outlook.com (2603:10b6:303:b9::12)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 13:44:19 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:303:b9:cafe::a4) by MW4PR03CA0217.outlook.office365.com
 (2603:10b6:303:b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 1 May 2025 13:44:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Thu, 1 May 2025 13:44:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 May
 2025 08:44:17 -0500
Received: from [172.25.248.240] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 May 2025 08:44:17 -0500
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
X-Inumbo-ID: 639f5697-2692-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0AAttwvV6nPvEk44QKpb5uaLp/jRehAcHzVtsqEEzp3aZjDaH1Ctpz8tEtoMIpuR0ifbM/Fh4nyLxVrNCEW4a7YqcknEqRhPHwKqZ/Ns2rMfBZzFGESSPH27tzx8cctwkYZ3Zja3Q5LWugpDSUl2vax6mfz0Jb9i1uI8KXw4uuauPvtNbi7R0K+Dz9FhiJInznmWb5ySFA4DmlD3l397/yL2OlPCjuIpioqnW9zHGQzsNZr0KXnGbO+trDKtJR+/O2V4m3Veeq5XbGl4ob7SJFqLu8WWDP406EF/yT46qQ/Aj1Yi+/cWjQ0KNPxCZiDc/24VairvcSZTxKgYgOp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvxN1QaZ8FeuqiatsTUso/7s43/8NUTjJy/bZlCuti0=;
 b=mYfPBoSdAeSHePQ3GNKemK8oy0R0fPZY2tKnFr7RAIoT8QpW7jDSU8tfe35KLs/0xM+WsoGNeo3wN4YWnFjf7TKi8YCHXwXE9FHmEgEhPclNEJ08gS8Zlre3tcaJosRJwiipLOYj6OQpYiReCns6GEj/waffZLcY0gZTxUC94SrM/TEwj+fD0KIZxGmzwNKqv51KE9C017FDCrs0W/30ykob6qsh5TWeBStWt65UL/QdHnmy/x2GOmrfuQuyBeWjPIEAPCcJ3W2r2IE8pQVAQ4UXX7MhPAuZ8K5SaLseE7EfZtKqRWYo4XxvCTjBp1W6ZPROZi5PfgkRFST91LCHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvxN1QaZ8FeuqiatsTUso/7s43/8NUTjJy/bZlCuti0=;
 b=oMMA4pWhez6H6oFoH/i6k+kOP31O5qg2VluIHID/v8fHPLEgcQI1uH5rgyOciyDzJYoNu41c0eZwQ2hbSYlT4DLKynKz6AOD2uSbcGQwMq20DDhA5nzuY/cMF+Q5j+J0VXvN1rHu5RFaoRD7/sKJZSTIXOhTLFT6bkCY5ANzAMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3e7b4b20-0127-4db2-806d-f142547f275a@amd.com>
Date: Thu, 1 May 2025 09:44:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Ragiadakou, Xenia"
	<Xenia.Ragiadakou@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<agarciav@amd.com>, <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
 <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>
 <aBHUJjQk248aLi68@macbook.lan>
 <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb52cd3-f11c-40bb-5d60-08dd88b64587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXVOSDRLWGI2OXZhM2VzemFoZE9JTkpHbm0xaVNjTTVuQldZcWZ4MG5xQ3pS?=
 =?utf-8?B?cjZ3MTVjMlltY2JlMElwQTRGbGhvTTl4R20xcXhHNVFZbHhxd2s4SXVQbE0v?=
 =?utf-8?B?VXRZeUp6bjBWVlk4YXFBRFBFMzdNU0FCSGNaK3FZQ3ZsaEhNdU5LTDEzenM5?=
 =?utf-8?B?WVU3UXdHTlpPbUxPY3hQVEF3dS92ZXF4Y2ZpOE9IbWtpUkZ0d0JJcjBnWXEx?=
 =?utf-8?B?L042Z1BYQ3VVSCtkelNkV1VscFg5WlpncGl0akwzWGlaa2VHSmlmSFJvaHJD?=
 =?utf-8?B?blIxNm1XcDlZNS9ZVzhSYWM1NEYvUHJzN1ZqSnFHZWtVNUxDU0hVVDNPVTAr?=
 =?utf-8?B?MzZjYkZSS2RpeFVURG9yYWgySnIxakcwMC9rTFVhdGx3aDNoQWVmeHJWMW81?=
 =?utf-8?B?QUU3MUd1Z2hoM1dHS1lqUlYra0ZMd2c2a3ZBenJEN1gwTjlTb0hlR00ya2dh?=
 =?utf-8?B?NVQ2OG4xOUF1TVBOMUZoT0Jtemdld3hhR1VUU0I1K3pTMjFMVVpIQzV4UzUw?=
 =?utf-8?B?VU1zVzF3Zzl1TUQxQkRlUmxqS2xGblFSNWc4WGR6NEpGSnIwNXU2Q1FnL25Z?=
 =?utf-8?B?aDYxbFNON2F0dFZCRFNFQXEyS2k2NisxR2xIQWM0OTVtY2NjbjBFUHBYK1FC?=
 =?utf-8?B?NFlVU3U1ejFTYmFZMFYzZXQyYVkrc1lST1VweW5ENVlLYjFZMHhtK2F6VmlF?=
 =?utf-8?B?cXJIc3JDbm0zQ25FZ2dyY0huZDhwWStkY3FaNDZ0V1o2SXFuNXV3VXhhU3hu?=
 =?utf-8?B?Vkc1SEQreWk2SE5HUmIvTzVHRjRrWVhXRnhhRmk1WFpUYXpUZGJQT1orQkdu?=
 =?utf-8?B?V1ZLRmxoWGg3Tk05ekJOZ250cEZrOG41bnVOUGcvaEFjdEJ6NWdRZTVycG1t?=
 =?utf-8?B?NGZlM3poeDNVczBOZkNtZ1hzaStMOURwU3J4M1REWjExNTZOVVEyN2wzMXJJ?=
 =?utf-8?B?b1dzMlNON0dPR0JQZlluZXhOWkxFbVZyVFFESVhUaE9wcUg2UXpvUmcrNUhE?=
 =?utf-8?B?QzFPZk84Wk1QN3JBM3UvQ1pDeXk1N2R3ZzFlK0ZGZ3pDT2RVdWJ4Y2hDTktB?=
 =?utf-8?B?emtSSTUxZi9GNzdRVnNzaTRpcnAwM2JlL0d4L1lGMlFVTDNoN2pGMWZUenRC?=
 =?utf-8?B?dk1ZTlpLY1MyeVpDT1gwZ2RLSlIxVXdIcHJaQTRQdjJWYzMvQWljcGxyZEJp?=
 =?utf-8?B?SWhFQzNBcXpPalJ2aDVWa1ptZjkxUlh0OVVxdVBUVzlrWGN1YU1CSDNyVWtl?=
 =?utf-8?B?N2VFUjQ2aGg3cWRXN3h4enYzV25rZDZaUFNoRktJZEJKK1FrWnJiQkR1WWNU?=
 =?utf-8?B?MjJTM29UYlBlWTU0S2NTaGZhSG5oa0ZhUlNlWUpSR2tJWmpNV0Nvc1JjTmZU?=
 =?utf-8?B?d2NCU2tIZklMaVl5bUNiY0dpRW9sVmlWbCsyVHJ1SHVDajlRWDE1V3EzWFZB?=
 =?utf-8?B?T3NsT0VUZnBXSXowejNCNk02OG8xSnBEU01UM0VvN1J0ZTl5REJIVkdsY3Iy?=
 =?utf-8?B?RmpVaEVTWFVWUWZONHkrRW41OFBaWHhSS281R0NwNmNESHhsdFZ0aE1KUnIy?=
 =?utf-8?B?ZndRcHJhTWdiQXkrZ010K3RSUjRNaVZ5R3YwOWlnb0gzeFo0SlUzTDRLTko1?=
 =?utf-8?B?YjJEWW1tZ3UwazFuNzhlYmtNM1JIbWVDYW1KNWJuN094OERLR1oyMVlackFS?=
 =?utf-8?B?MzhkN1VRemJIVFNoNldQa1F1clVicWdxbktQYWszUEhvdktNSStpdzhTenUr?=
 =?utf-8?B?Z0pYWEdMaW5MMWE4cTMxd2cyenk1cFFWNHdrWXg0ZG1TeUJMVlBtMGRwQk5S?=
 =?utf-8?B?c2RKWGJscHZQRFFZa0RxTThwRHNhSGE1dzN1c2VES0Q3L3E4Q1REZ1ZzYWhC?=
 =?utf-8?B?bFhHeGRRYTdBZlpVZE5YVWJvb29kb0hHVkd1cjd3Vjd3bWJIaG1LK1hINXlu?=
 =?utf-8?B?M3ZSVElveERubUJBNGIwNHBSZGxYVk5jZWFNSUlpRmhkbEtIRDhzYU1mSjRS?=
 =?utf-8?B?WnJqNWUrMkNxWmZFZDBBOFhTZzdpZ3dRdUYzUStBRTNLc3hITm8wN1ZYVUhs?=
 =?utf-8?Q?O+F2YO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 13:44:18.7084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb52cd3-f11c-40bb-5d60-08dd88b64587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411

On 2025-04-30 20:19, Stefano Stabellini wrote:
> On Wed, 30 Apr 2025, Roger Pau Monné wrote:
>> On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
>>> On 29.04.2025 23:52, Stefano Stabellini wrote:
>>>> On Tue, 29 Apr 2025, Jan Beulich wrote:
>>>>> On 28.04.2025 22:00, Stefano Stabellini wrote:
>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:

>>>>>>>> --- a/xen/common/memory.c
>>>>>>>> +++ b/xen/common/memory.c
>>>>>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>>>>>>               rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
>>>>>>>>                                           exch.out.extent_order) ?: rc;
>>>>>>>>   
>>>>>>>> -            if ( !paging_mode_translate(d) &&
>>>>>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>>>>>>>>                    __copy_mfn_to_guest_offset(exch.out.extent_start,
>>>>>>>>                                               (i << out_chunk_order) + j,
>>>>>>>>                                               mfn) )
>>>>>>>
>>>>>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
>>>>>>> it?
>>>>>>
>>>>>> One way or another Dom0 PVH needs to know the MFN to pass it to the
>>>>>> co-processor.
>>>>>
>>>>> I see. That's pretty odd, though. I'm then further concerned of the order of
>>>>> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
>>>>> same upper bound. With both CPU and I/O side translation there is, in
>>>>> principle, no reason to permit any kind of contiguity. Of course there's a
>>>>> performance aspect, but that hardly matters in the specific case here. Yet at
>>>>> the same time, once we expose MFNs, contiguity will start mattering as soon
>>>>> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
>>>>> make tightening of the presently lax handling prone to regressions in this
>>>>> new behavior you're introducing. What chunk size does the PSP driver require?
>>>>
>>>> I don't know. The memory returned by XENMEM_exchange is contiguous,
>>>> right? Are you worried that Xen cannot allocate the requested amount of
>>>> memory contiguously?

In the case I looked at, it is 8 pages.  The driver defines a ring of 32 
* 1k entries.  I'm not sure if there are other paths or device versions 
where it might differ.

>>> That would be Dom0's problem then. But really for a translated guest the
>>> exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
>>> within Xen, rather than failing a request, we could choose to retry using
>>> discontiguous chunks (contiguous only in GFN space). Such an (afaict)
>>> otherwise correct change would break your use case, as it would invalidate the
>>> MFN information passed back. (This fallback approach would similarly apply to
>>> other related mem-ops. It's just that during domain creation the tool stack
>>> has its own fallback, so it may not be of much use right now.)
>>
>> I think the description in the public header needs to be expanded to
>> specify what the XENMEM_exchange does for translated guests, and
>> clearly write down that the underlying MFNs for the exchanged region
>> will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
>> request contiguous physical memory for the new range.
>>
>> Sadly this also has the side effect of quite likely shattering
>> superpages for dom0 EPT/NPT, which will result in decreased dom0
>> performance.

Yes, this appears to happen as memory_exchange seems to always replace 
the pages.  I tested returning the existing MFNs if they are already 
contiguous since that was sufficient for this driver.  It worked, but it 
was messy.  A big loop to copy in the GFN array and check contiguity 
which duplicated much of the real loop.

>> We have so far avoided exposing MFNs to HVM/PVH, but I don't see much
>> way to avoid this if there's no option to use IOMMU or NPT page-tables
>> with the PSP and we don't want to intercept PSP accesses in Xen and
>> translate requests on the fly.
>   
> Yeah, I think the same way too.

Regards,
Jason

