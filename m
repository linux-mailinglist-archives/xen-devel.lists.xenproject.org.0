Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B148086AE37
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686505.1068658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIVJ-0001XZ-Ai; Wed, 28 Feb 2024 11:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686505.1068658; Wed, 28 Feb 2024 11:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIVJ-0001Vq-7Z; Wed, 28 Feb 2024 11:53:41 +0000
Received: by outflank-mailman (input) for mailman id 686505;
 Wed, 28 Feb 2024 11:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gbmv=KF=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rfIVH-0001Vk-Jl
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:53:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0172dd0d-d630-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 12:53:37 +0100 (CET)
Received: from DS7PR05CA0022.namprd05.prod.outlook.com (2603:10b6:5:3b9::27)
 by PH7PR12MB6740.namprd12.prod.outlook.com (2603:10b6:510:1ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 11:53:34 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::2) by DS7PR05CA0022.outlook.office365.com
 (2603:10b6:5:3b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26 via Frontend
 Transport; Wed, 28 Feb 2024 11:53:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 11:53:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 05:53:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 05:53:32 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 05:53:30 -0600
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
X-Inumbo-ID: 0172dd0d-d630-11ee-afd7-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiiClwfXiE9FqsAEP/8Z/JWgDQbt/+sawICxsBqkrvirvDCF0fG/iYgtRxl9BL8k46fbolzDKLPhBnr4/sTn1ygj5NPhteUnoaQC0SrSChVYwek6qhXWC5xLJWWbps1LdTTdhtkxspUThIlrbtsjdx+uytbjfk+aJgSTEjN/5yAVfcANHoAOjiAcfbnWP7Hac9UBcOGy6Yb7xybkLkEZwPAfYXKjq/4GWE+RLxKKpkj8zbOZMeHsatHScwj/iKFYRWRS0PHbqGvlL95OFXzUmPeGzGv63aHNScVDpGuoSu0qBlKBqDbA3QMSelUe95txb9BzBCqd7URIgF8I3sTuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLzq84tn4lCka/GQbxFPBE0tifvRbGlwJ8Ye+duneBo=;
 b=WgLfJUJk2qADch331FrRyzCT3R0WocIkELN/hN+P5mE3R22ltRomh4rs4WpEDRwk0BFSXesvE4ucdy+A+77cpR8YZuvskjAbiCxV3gdwVBseo07284TsvZ+qRLrAbJXtMdHCJQiG/lzXnfoQJVky+BIGNZsP70uDpiqX17mWZppW/8WSsLTNxt4Qc+sqCUucM1KowhsB2s7yK61p2WvIyk5j+RanlstciwM0UiMqm9Tpyr36wY0brMZO78U34ZAQl7fF5hFAUg5KS6kTuTLFYKvsItaqLwHD14CEVO+8ckx+C5/z2c82rjaK/29QomhGcNzEGYFgacPy4vfr/T/OpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLzq84tn4lCka/GQbxFPBE0tifvRbGlwJ8Ye+duneBo=;
 b=cZGHTTSZaDY7X29iCbEm9hwRZFjpXK76cGY07SGOvvAfKpqZVCUycl1L6FDFZVif7jQuPWO4ZaFB1Yu4x7qUzVOl8GHI2Y1EFiN5eAVtTr8urz9Y/Ns1lrEtfC4f4YCkow3D2IWV1kaagN95x+Tpc0n2bHLAd4Xkn9HZuEIUC24=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
Date: Wed, 28 Feb 2024 19:53:29 +0800
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
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|PH7PR12MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ede8c5-6dfe-45a8-7b59-08dc3853e3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eYk3eLP2bThrkSYqPInrhxGhr3EjIvbamtv/ThJEZuXN7ff+y21SrK50rYRmfYvvOqNnuLReqMc1udZXiyjEZVYjIL+48YnxMM5mH5u2grBBM8Zms2bk2MEFGrPn6X8Tyh3ZTbRhR+M+AtKsjVsEAV60SAP46Lzjnaf3Z75eLkh23HwyX3R8SjKoIIWr/wdcXkRtAhTVUeUrNu0nfLioZwej8ranEZipn7n9MCjjo3huuwi8ZuWPK1iqt+i6H9qe4hxxtkJ3E2ANkuJJa7CMbwi576Z+dnrBytp299pBNUHvZAjs7i/KYLtwtmbEXvz3ARv3poZPIvs4rtIs0ySRYLaD2XOKMWG8up3SGOYY6xZm21nww3pusjTzwu0RluJO3Tpm5t1Awy9VN/LYJobBKzypcMMf9hM4f1yPI37k8uP7HB4w3uZ6phLo03t3oQpjZE1sFNvQso95u1IfygtgcCVoaxCHrDdhb7YBl99igLHwFAKwoVDgGo6cz0kJ4Xb8En/kEh4vei8FzpvPCNooO9pR4HcwTN/TVACdiZlGWJz2vaANtxPyigU3Pis6E2nGjEgqqNnA/OXfvv9f7RK0BN2jPquSVFSANHIoy6BrszF7ePFdpfQuy7PafZQ8tZ1PR1VN77VdxlQG4KWtaTT9eYG3i4QWPtKVdDfMK74z5R+WQmQELvfzqS/ONrKdrpHQav4hZLhMq2jSqwfUsqTv9F/NVVuGaVEv1HtOa5PSoQg4iyXhOzsYiygTENmGpZuu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 11:53:33.6419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ede8c5-6dfe-45a8-7b59-08dc3853e3ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6740

Hi Julien,

On 2/28/2024 6:35 PM, Julien Grall wrote:
> Hi Henry,
>>>>
>>>> Force populate_physmap to take the "normal" memory allocation route 
>>>> for
>>>> the magic pages even for 1:1 Dom0less DomUs. This should work as long
>>>> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
>>>> guest address as the magic pages:
>>>> - gfn 0x39000 address 0x39000000
>>>> - gfn 0x39001 address 0x39001000
>>>> - gfn 0x39002 address 0x39002000
>>>> - gfn 0x39003 address 0x39003000
>>>
>>> This is very fragile. You are making the assumption that the magic 
>>> pages are not clashing with any RAM region. The layout defined in 
>>> arch-arm.h has been designed for guest where Xen is in full control 
>>> of the layout. This is not the case for directmapped domain. I don't 
>>> think it is correct to try to re-use part of the layout.
>>
>> Apologies for the (a bit) late reply, it took a bit longer for me to 
>> understand the story about directmap stuff, and yes, now I agree with 
>> you, for those directmapped domains we should not reuse the guest 
>> layout directly.
>>
>>> If you want to use 1:1 dom0less with xenstore & co, then you should 
>>> find a different place in memory for the magic pages (TDB how to 
>>> find that area). 
>>
>> Yes, and maybe we can use similar strategy in 
>> find_unallocated_memory() or find_domU_holes() to do that.
>>
>>> You will still have the problem of the 1:1 allocation, but I think 
>>> this could be solved bty adding a flag to force a non-1:1 allocation.
>>
>> After checking the code flow, below rough plan came to my mind, I 
>> think what we need to do is:
>>
>> (1) Find a range of un-used memory using similar method in 
>> find_unallocated_memory()/find_domU_holes()
>
> AFAIK, the toolstack doesn't have any knowledge of the memeory layout 
> for dom0less domUs today. We would need to expose it first.

If I understand correctly, I think the issue you mentioned here and ...

> Then the region could either be statically allocated (i.e. the admin 
> provides it in the DTB) or dynamically.
>
>> (2) Change the base address, i.e. GUEST_MAGIC_BASE in alloc_xs_page() 
>> in init-dom0less.c to point to the address in (1) if static mem or 11 
>> directmap. (I think this is a bit tricky though, do you have any 
>> method that in your mind?)
>
> AFAIK, the toolstack doesn't know whether a domain is direct mapped or 
> using static mem.

...here basically means we want to do the finding of the unused region 
in toolstack. Since currently what we care about is only a couple of 
pages instead of the whole memory map, could it be possible that we do 
the opposite: in alloc_xs_page(), we issue a domctl hypercall to Xen and 
do the finding work in Xen and return with the found gfn? Then the page 
can be mapped by populate_physmap() from alloc_xs_page() and used for 
XenStore.

If above approach makes sense to you, I have a further question: Since I 
understand that the extended region is basically for safely foreign 
mapping pages, and init_dom0less.c uses foreign memory map for this 
XenStore page, should we find the wanted page in the extended region? or 
even extended region should be excluded?

> I think this ties with what I just wrote above. For dom0less domUs, we 
> probably want Xen to prepare a memory layout (similar to the e820) 
> that will then be retrieved by the toolstack.
>
>>
>> (3) Use a flag or combination of existing flags (CDF_staticmem + 
>> CDF_directmap) in populate_physmap() to force the allocation of these 
>> magic pages using alloc_domheap_pages() - i.e. the "else" condition 
>> in the bottom
>
> If I am not mistaken, CDF_* are per-domain. So we would want to use 
> MEMF_*.

Ah yes you are correct, I indeed missed MEMF_*

>>> Also, why are you only checking the first GFN? What if the caller 
>>> pass an overlapped region?
>>
>> I am a bit confused. My understanding is at this point we are 
>> handling one page at a time.
>
> We are handling one "extent" at the time. This could be one or 
> multiple pages (see extent_order).

I agree, sorry I didn't express myself well. For this specific XenStore 
page, I think the extent_order is
fixed as 0 so there is only 1 page. But you made a good point and I will 
remember to check if there are
multiple pages or an overlapped region. Thanks!

Kind regards,
Henry


