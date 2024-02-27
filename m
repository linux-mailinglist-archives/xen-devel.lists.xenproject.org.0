Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81886918E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:17:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686147.1067750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexKk-00060S-6V; Tue, 27 Feb 2024 13:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686147.1067750; Tue, 27 Feb 2024 13:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexKk-0005ye-2R; Tue, 27 Feb 2024 13:17:22 +0000
Received: by outflank-mailman (input) for mailman id 686147;
 Tue, 27 Feb 2024 13:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fto1=KE=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rexKi-0005yY-1a
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:17:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877e6e22-d572-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:17:18 +0100 (CET)
Received: from BL1PR13CA0152.namprd13.prod.outlook.com (2603:10b6:208:2bd::7)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 13:17:13 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::5e) by BL1PR13CA0152.outlook.office365.com
 (2603:10b6:208:2bd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Tue, 27 Feb 2024 13:17:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 13:17:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:17:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:17:10 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 07:17:07 -0600
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
X-Inumbo-ID: 877e6e22-d572-11ee-afd6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+qkmM/ZRNcE5ghQLAXSYGGP0BOuVkDvfPm6V+Ch9WYGSdNulONqYHRJz9OLN3eM1YlTUGNWwC46Ogt1UoMs02pFNZaFepnfCROn+lk+9XNVu676baqpGadREbXQhUKFXhvMDa29Q4QyMii29WZXraPGWyYdxoPM0EXgO0wQ1N20IkhN9FuY1RBvuo7h6UDuXDDqYXSQf7S/lUlGUWlS5otIpVa5Dh5uo96rf/BbEj9MXB3E9qCTRRwkxQuqTCa0Ndsbe1fdXx1R7lJFlE1cZt2bgKEwpvukxA1fJjGb9NpmP6+0Xukqg830D3LWVtjDToEW98UCSbJEXbYfC4QSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jfcnZbpTwT0k2X+HU8w9stp1k0F2Txx7SkiWNsvG7U=;
 b=EXfakeevXh9mdjEhzMotmhTMIViLDxEL9bpFS0rwx7K4yFKg3gq2U5nUO2+bUOy0MKrqSP8MX2EuG+R7q2n3LrPfHgX4Eq6j3Pjp4oywrQ38cTC4BtP5lOAna4V3KxXDvDtEsXfs2hTIfC/3k5t2C7CnZg6Ft3QZT4MNVCOwmm7thxerxGYzTM2MgnPnvXHGGd5h3bE9FWf1Vz3XzqSiRSZBvjCNfPKUVy19mJcE1qQfYE3uVuGrjDZQ7XuPBEEiIyoA5hvJwJiz6mhrZDXIT0RU4ZmYwWELoKPVyvR5HRhJfl3Bc0SiGnrrB44LE6grW2fHAyosqwvhGmfEIy3hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jfcnZbpTwT0k2X+HU8w9stp1k0F2Txx7SkiWNsvG7U=;
 b=zlHZTCYz9pRnkpEv29Eez+8WnKnDnB75FtMO7LBkdoiUCjw/0lSjxrk7dMmVAbe+Zqhh11edCjUqrOzNJ7i9nbbE4v2FU3Gyme5B/pofHcOw0zVJcmsLJJeRRfPft7+TiWoT+fq1c7uUVCvlhnJGPuMCicjo2lzNidcnikWP/WA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
Date: Tue, 27 Feb 2024 21:17:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <d1518124-483c-4409-9b36-6a3392378911@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SA1PR12MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: c99bcef4-40a5-45d0-4ab0-08dc37966922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4XTDCSDomYt4bnaCAK9HZJC4dH8pl9A3jR0GFmsNUYcqauQcHsT32q3ppPIBd+yRa/zUdmxWClqTnFwuXwp2BCkN1wbmHNZ64RCWkTnzqUX/X4lcjZG75BJzdNX8NVhZCNGymKRj77yapbppyCrOgqi94bQ9a2eRzA6o1cPtWA0zlDeIAHxgK5FnyOrODDxC7EBSyYz3RatKUsd4FLc39B6aCw30YsMY4yDqPNOoASRGjWHZsOfA9ZeMcC9kj3DwI/ZvbNDAm/j+5djbb722ygNcYu11V5d/3c5dJjdCtlXzRtHA5FHtG7/hoj3YdnWB0Z0gRANZKxfyzG4LBabyTHWrsfGGF2dbkDAdnbWxLtCyPd931lQZS1AxTMAUoG4lfyJKyXkkc07JR8f2S3BpvU0LI2Hv3l/5z+lOa28Nh9LurMXEBdcuS9ClyURD/m/5qK8tEzPj5+Doi9X8Bd0XZhHobTfd3v9e2RWDNmJ3OTpcS3qGE9Ns41ZQCw3WwHVYqurX2V7SGctij170w/oRs09vTdvZrKtwjtvTYARkRa7LytdH5bwnofzjrTH9EVCkpJN4q+51tEcrv0XKy0A99e6gwJq5vSuzdXKHUra8gglz6R6aFgPHAX+qdCVBGt6a/Iht7izDAw5cScJaBtZeEsC0x+WeWrFreIJQBo1YMAcA6djrh6WgkLS3CsUSAALMhzID+/i4WXDnBZIvP6g8///yHLv2OdTqMTdZz++OO8k2LLbN4gWqK1Za+1L/fi/I
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 13:17:12.7776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c99bcef4-40a5-45d0-4ab0-08dc37966922
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859

(-RISC-V and PPC people to avoid spamming their inbox as this is quite 
Arm specific)

Hi Julien,

On 2/26/2024 5:13 PM, Julien Grall wrote:
> Hi Henry,
>
> Welcome back!

Thanks!

> On 26/02/2024 01:19, Henry Wang wrote:
>> An error message can seen from the init-dom0less application on
>> direct-mapped 1:1 domains:
>> ```
>> Allocating magic pages
>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>> Error on alloc magic pages
>> ```
>>
>> This is because populate_physmap() automatically assumes gfn == mfn
>> for direct mapped domains. This cannot be true for the magic pages
>> that are allocated later for Dom0less DomUs from the init-dom0less
>> helper application executed in Dom0.
>>
>> Force populate_physmap to take the "normal" memory allocation route for
>> the magic pages even for 1:1 Dom0less DomUs. This should work as long
>> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
>> guest address as the magic pages:
>> - gfn 0x39000 address 0x39000000
>> - gfn 0x39001 address 0x39001000
>> - gfn 0x39002 address 0x39002000
>> - gfn 0x39003 address 0x39003000
>
> This is very fragile. You are making the assumption that the magic 
> pages are not clashing with any RAM region. The layout defined in 
> arch-arm.h has been designed for guest where Xen is in full control of 
> the layout. This is not the case for directmapped domain. I don't 
> think it is correct to try to re-use part of the layout.

Apologies for the (a bit) late reply, it took a bit longer for me to 
understand the story about directmap stuff, and yes, now I agree with 
you, for those directmapped domains we should not reuse the guest layout 
directly.

> If you want to use 1:1 dom0less with xenstore & co, then you should 
> find a different place in memory for the magic pages (TDB how to find 
> that area). 

Yes, and maybe we can use similar strategy in find_unallocated_memory() 
or find_domU_holes() to do that.

> You will still have the problem of the 1:1 allocation, but I think 
> this could be solved bty adding a flag to force a non-1:1 allocation.

After checking the code flow, below rough plan came to my mind, I think 
what we need to do is:

(1) Find a range of un-used memory using similar method in 
find_unallocated_memory()/find_domU_holes()

(2) Change the base address, i.e. GUEST_MAGIC_BASE in alloc_xs_page() in 
init-dom0less.c to point to the address in (1) if static mem or 11 
directmap. (I think this is a bit tricky though, do you have any method 
that in your mind?)

(3) Use a flag or combination of existing flags (CDF_staticmem + 
CDF_directmap) in populate_physmap() to force the allocation of these 
magic pages using alloc_domheap_pages() - i.e. the "else" condition in 
the bottom

Would you mind sharing some thoughts on that? Thanks!

>> Create helper is_magic_gpfn() for Arm to assist this and stub helpers
>> for non-Arm architectures to avoid #ifdef. Move the definition of the
>> magic pages on Arm to a more common place.
>>
>> Note that the init-dom0less application of the diffenent Xen version
>
> s/diffenent/different/

Oops, will correct this in v2, thanks for spotting it.

>> +
>>   #endif /* __ASM_X86_MM_H__ */
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index b3b05c2ec0..ab4bad79e2 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>           }
>>           else
>>           {
>> -            if ( is_domain_direct_mapped(d) )
>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>
> This path will also be reached by dom0. Effectively, this will prevent 
> dom0 to allocate the memory 1:1 for the magic GPFN (which is guest 
> specific).

I think above proposal will solve this issue.

> Also, why are you only checking the first GFN? What if the caller pass 
> an overlapped region?

I am a bit confused. My understanding is at this point we are handling 
one page at a time.

>>               {
>>                   mfn = _mfn(gpfn);
>>   diff --git a/xen/include/public/arch-arm.h 
>> b/xen/include/public/arch-arm.h
>> index a25e87dbda..58aa6ff05b 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>   +#define NR_MAGIC_PAGES 4
>> +#define CONSOLE_PFN_OFFSET 0
>> +#define XENSTORE_PFN_OFFSET 1
>> +#define MEMACCESS_PFN_OFFSET 2
>> +#define VUART_PFN_OFFSET 3
>
> Regardless of what I wrote above, it is not clear to me why you need 
> to move these macros in public header. Just above, we are defining the 
> magic region (see GUEST_MAGIC_BASE and GUEST_MAGIC_SIZE). This should 
> be sufficient to detect whether a GFN belongs to the magic region.

You are correct, I will undo the code movement in v2.

Kind regards,
Henry


