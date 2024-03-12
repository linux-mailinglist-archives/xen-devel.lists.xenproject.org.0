Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91213878DAB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 04:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691634.1077849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjt4H-000113-9f; Tue, 12 Mar 2024 03:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691634.1077849; Tue, 12 Mar 2024 03:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjt4H-0000xr-5a; Tue, 12 Mar 2024 03:44:45 +0000
Received: by outflank-mailman (input) for mailman id 691634;
 Tue, 12 Mar 2024 03:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Msr=KS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rjt4F-0000xl-Sc
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 03:44:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b2ac30-e022-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 04:44:39 +0100 (CET)
Received: from DS7PR03CA0330.namprd03.prod.outlook.com (2603:10b6:8:2b::22) by
 MW4PR12MB6755.namprd12.prod.outlook.com (2603:10b6:303:1ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Tue, 12 Mar
 2024 03:44:35 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::e8) by DS7PR03CA0330.outlook.office365.com
 (2603:10b6:8:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 03:44:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 03:44:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 22:44:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 22:44:34 -0500
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 22:44:32 -0500
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
X-Inumbo-ID: d9b2ac30-e022-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io5p5dGsc6auCqhRClgUlW1hoi3493HSHs5hHs3aMLaHJhQ/TtF1FUoUKYft0ta86UDEjsBDmaSp/N8Jjt0FsA/rdFpd4MNdmU2/cFuLxUDWNrQGibOqslI49D2cwffNFpiYabjH3kczTT+DNryvw7EU4kwm6z5EoANLe/kGJSMaimxgXFC8BgxYsPbE0RLo1G5X887mqzbtCHyzK510DpJVK1Qhbd4I+St6BBacLJir5oPj8DyL0mYDMEx18dW1XSxND3YhmXLC5fhXneCK03QyYooWx66ITkl2tPWWBIIfsmwGNq2mfxwy3ak9irXho0NtCV4cWS+397+Pc86SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR421RGaH5R1i1LbuXUsNy0Y5fvdoCWT+n3WMAEeT/U=;
 b=h4udzrhZvIgP1TuYWSe+xtC34d8YsUC4MKDCz3asfno/gKye0oh+waMgjJ9XYlCZNJqDVF+1lR2Y1ueus/+VnZaRRnQQMffWh9tQQ2DibNWvr9G+OCzmYtvJiFJ3lxvN9xbAvv0YZYdGy5g9X7jqrcMtTfxEkkIDLrKP2MJcyvM6pBK8E/I3t8AIkKxmCR7C+rd7iViOwn++lNLPc14d6S4rE91r8gKbsbxigwlmYzQwwsjBc8b2Tnc8/aGxlTyeIt3TXK+xrQovakdWiN0A6fM0DZm7+PxhRiyR7TppBRbbU5N8VLg1faSvRv5JbcF6K9kfmeepb/TACD1h2fVP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR421RGaH5R1i1LbuXUsNy0Y5fvdoCWT+n3WMAEeT/U=;
 b=FXuutLzWLNvizAF/wyX8Fi936huSvhyP0a5+G44EePkiXXFR7FsVSjGn7VtJL4C/Hd0wmXDk/mzyu41JueRKURT1u2W3NLhDd1ITL0BO7gV4p2Gxb1VWm12XjM2O4ceNj27O6NQHbBSy7tXn+MT3xvQo2hv94im5FGT6eU0un8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <294ff8fb-825c-4950-857a-166b65474a53@amd.com>
Date: Tue, 12 Mar 2024 11:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|MW4PR12MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: f5418fff-bb7d-4cef-63ff-08dc4246bc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jg3ac/8tpsN7UOvjH1zIa8omVli6JoNy0209H9EMFTVtkVkrwmnc9yuJNiG118jCy5q0OxlKNc3qizcvrrNJQ2ZMipQiEdblxCfSt3FI8GBkDSD48QibOyjjHy/ZFWuTssv9t6ioTqFpGLgT5JM1eyTplPEzNhhJcnoSJNmwV9cRF92rJ/N7a2U3y3E+MRKJEQKE5G3upKgy7zX2cqJxRb3wIe4N6V2sFQn9D0dXWYnq/rQznXyVwh+w94aYYGIJ3xpzudf+BybFTIVNU66Ma3xpoBW9NJyAeTayp4jpCMatPbHnh9cy127Ar0Dwh8khgFsMv1vJqc258Oqjxh8duWy1qCrLn0h9rML3pCo0ZSw8YdfGfYY3HPs2eWfaGbvozlcBCznnx/tSVNSA4hHKyXOBszV5GkwmCMb1AjwMAH0XMwmQExuyPgaeFcYYoG4aQJHzvQK2Vo+9lOOiUOccywp1//Y5ea3qGg9eKvMwdxJjE59JudpdkzK0mBj7taRMA6Q4ZgV5DVXNPZCq5R9gZvjRvNeEP5qWDgQKZqlbpSA2mCfOPVfsot00g7tHWo29sqZxbNXpOskhZS8soY/CWR3Oge3IZdfRfaxVL+35sYSRcWjChVmpYmOMVfcc9ttbNkrwUzJKC9NQFZzTbzcu1rNjbbNX6B0CszhcE7dbZCY0fB036EZJtGz6ZIgwvB66LVzS4Eo4atEBVVqyIcP09A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 03:44:34.9845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5418fff-bb7d-4cef-63ff-08dc4246bc18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6755

Hi Jan,

On 3/12/2024 1:07 AM, Jan Beulich wrote:
> I'm afraid the title doesn't really say what the patch actually means
> to achieve.
>
> On 08.03.2024 02:54, Henry Wang wrote:
>> Previous commits enable the toolstack to get the domain memory map,
>> therefore instead of hardcoding the guest magic pages region, use
>> the XEN_DOMCTL_get_mem_map domctl to get the start address of the
>> guest magic pages region. Add the (XEN)MEMF_force_heap_alloc memory
>> flags to force populate_physmap() to allocate page from domheap
>> instead of using 1:1 or static allocated pages to map the magic pages.
> A patch description wants to be (largely) self-contained. "Previous
> commits" shouldn't be mentioned; recall that the sequence in which
> patches go in is unknown to you up front. (In fact the terms "commit"
> or "patch" should be avoided altogether when describing what a patch
> does. The only valid use I can think of is when referring to commits
> already in the tree, and then typically by quoting their hash and
> title.)

Thanks for the detailed explanation. I will rewrite the title and part 
of the commit message in v3 to make it clear.

>> --- a/xen/include/public/memory.h
>> +++ b/xen/include/public/memory.h
>> @@ -41,6 +41,11 @@
>>   #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>   /* Flag to indicate the node specified is virtual node */
>>   #define XENMEMF_vnode  (1<<18)
>> +/*
>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>> + * or static allocation.
>> + */
>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>   #endif
> If this is for populate_physmap only, then other sub-ops need to reject
> its use.
>
> I have to admit I'm a little wary of allocating another flag here and ...
>
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -205,6 +205,8 @@ struct npfec {
>>   #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>   #define _MEMF_no_scrub    8
>>   #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>> +#define _MEMF_force_heap_alloc 9
>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>   #define _MEMF_node        16
>>   #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>   #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
> ... here - we don't have that many left. Since other sub-ops aren't
> intended to support this flag, did you consider adding another (perhaps
> even arch-specific) sub-op instead?

Not really, I basically followed the discussion from [1] to implement 
this patch. However I understand your concern. Just want to make sure if 
I understand your suggestion correctly, by "adding another sub-op" you 
mean adding a sub-op similar as "XENMEM_populate_physmap" but only with 
executing the "else" part I want, so we can drop the use of these two 
added flags? Thanks!

[1] 
https://lore.kernel.org/xen-devel/3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org/

Kind regards,
Henry

> Jan


