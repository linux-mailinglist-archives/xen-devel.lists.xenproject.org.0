Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61C89FAD0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703363.1098991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruZPX-0000gY-Tj; Wed, 10 Apr 2024 14:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703363.1098991; Wed, 10 Apr 2024 14:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruZPX-0000eZ-PE; Wed, 10 Apr 2024 14:58:51 +0000
Received: by outflank-mailman (input) for mailman id 703363;
 Wed, 10 Apr 2024 14:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruZPW-0000eT-Ov
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:58:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d55d3808-f74a-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 16:58:48 +0200 (CEST)
Received: from MW2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:907:1::43)
 by IA0PR12MB8893.namprd12.prod.outlook.com (2603:10b6:208:484::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 14:58:44 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:907:1:cafe::63) by MW2PR16CA0066.outlook.office365.com
 (2603:10b6:907:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 14:58:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:58:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:58:43 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 09:58:42 -0500
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
X-Inumbo-ID: d55d3808-f74a-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoPabj3pLU3MYE7mMmMUwu2CP5rRlQoq7BdvwIeqsoiig3Bg8kCG2Wfci+XLosDwH1FSgxv6U9cp99oVmAn77kurVxDMdSa6dZMVFsnFHaN2/0nl54R0GN5qzTZAxrn6dp3DH6NluThaPAw7F74LqX7YuSPwvmJFBV8aOiaEM/u4pFJ3bh9Kv2oeYMvSCrwuGW6eO6V1WUQgsi7d2TxDqimxUPhC2Fdd4qOenjGeWd4lJYvrv9/8kDcSqYrYtyM5IAtW+eo5BLZoqe25lHGx7DYjKlJYU/3dlRc4wTZa+lv0pqeLkxEkJ3lT1wedGkLQPRj8NcDU8Fpdn/13Uw1ntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUYXT+lySupyG2n8L+1iRKSiFtZLMt2zGXTL1cZJQ/c=;
 b=c5CHnwQJ6vBiI0miMpM2zoXof9F7jE6nHBEa8JMHCAksHbcbbtcKLFOz2clxICk8xZzPep04kR1BHD26SAIg/W2+QqfDFS/hy7vILzQbvr92nP7q/toNRnKvBX6cpwCwLc1NtnX8SNByyStS/MtXtTxoXzrpMtgKVM6fiBxg+UdhG1iAVzgPR1c9ZrkAHaeceYr4bZWsl4kXgdQj7rcoD83l6yyif0/wyrBsBr8zHzKmWS0L84QZqQnss9a4VIhy3U6Kerbe0g8ymevqQXfmIhOORWdGK6gkUkHdjjYWU/Uen+C7thoyy+Bt0vW/bydzMnbs7S8FIK+mbtnDd+QVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUYXT+lySupyG2n8L+1iRKSiFtZLMt2zGXTL1cZJQ/c=;
 b=dkiGYlPQwYg+5jTIOBNtw9Yfp+iCl05jFX54ZhG3ETua8tvasejKezjz3+tO+/p58ObfTHp7Bb0U1JOx0viSgoV3GSuJ8rXfD/B1LADjFyvC/xP2PJSMZYPVvdID1LGa/S5qn0fQn9+nUb15Rv8bS3YQqTn0AndF9wcseyUCRks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f31cf43c-90f9-40e2-8d25-7a421d4c6d6f@amd.com>
Date: Wed, 10 Apr 2024 16:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-11-luca.fancellu@arm.com>
 <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
 <B92FBADE-8FB8-471F-AD6E-693FC5C1D91A@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B92FBADE-8FB8-471F-AD6E-693FC5C1D91A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA0PR12MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: efb4f885-ad51-4805-d873-08dc596eb7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rCP0dW7xxmDOG3hDj7LtuQYpsPU6gTvLqo725jLfhVHJ0XE/kXyIYu8UWkXLhcSkHIlDpBPxE3e6uOoP7WAjxPYtCcYF12eiNusxC7gbZYqCkS8//xAqiwc2hOS8O0dwPe3/FKdeyM1kPOjMC0uqTRvaSCxQQgHxBcXJcxZUBxT1Fiwbei8iJ1VogG+Zh9iWGuUqbRcUHSGkvU87YC8Z4jNp7JfZFwCM5Hvp8+ELi5Zny9ih8gmSt7Lyh4R5qx2JUPZWWkUl1uJXiQ1d9DkQMZYmH3slvMCDKHdLV5ZEZ7askUBKQBaXu6rmF5kNb8+I3AQ4YpQnNGCnk2D+OY2lXOq+bN4VsoR5YNrp5Le2hCF3WbPpg905UPG2M2HoSlQZARrDMD1Nsr7OgEIBRDZn1djQeajdixb8S+HkfUIcKH2MO0tFop2Xml1lPFukiMnWySmMVmsf+V+SVQrX2ov8LYazO5XD0aMmWLqdu9vwZUCEBss506+auvdMzfm6agiJLxhP0BgQ6EB2y3a/hf+mRQGUkrShI8XTquxXm0HO1pa12BRfOxRx4S3a3CPpDZIb/930LsY7oA0yWWc7RiR8el9Gzs3EBVZgzGCOAIHzc36uAZYfM2f71AD0K8r7q29+WVnMpztjW+VFqrlPhNSTYuzkq4hfBkVLddgjFCJaLPi419hnr1HZeOZ1OMxlEcxg7r1yvhZdd6BF42SPXeP4flTPGmX4iKxu+K/WaVf0Gid+H/5Otl8EvtYGahWQsIIH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:58:44.2545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb4f885-ad51-4805-d873-08dc596eb7c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8893

Hi Luca,

On 10/04/2024 16:08, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>>>
>>> For direct-map domain with iommu on, after we get guest shm info from "kinfo",
>>> we use "remove_shm_from_rangeset" to remove static shm.
>>>
>>> For direct-map domain with iommu off, as static shm has already been taken
>>> care of through reserved memory banks, we do nothing.
>> Stale info given that shmem is no longer part of reserved memory banks. It's been taken care
>> of by removing shmem regions in find_unallocated_memory()
> 
> Sure, will amend for this:
> 
>>>
>>> +int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
>>> +                                    struct rangeset *rangeset)
>>> +{
>>> +    const struct membanks *shm_mem = &kinfo->shm_mem.common;
>>> +    unsigned int i;
>>> +
>>> +    /* Remove static shared memory regions */
>>> +    for ( i = 0; i < shm_mem->nr_banks; i++ )
>>> +    {
>>> +        paddr_t start, end;
>>> +        int res;
>>> +
>>> +        start = shm_mem->bank[i].start;
>>> +        end = shm_mem->bank[i].start + shm_mem->bank[i].size - 1;
>> If you look at other rangeset_remove_range use cases and error messages, 1 is subtracted
>> in PFN_DOWN() so that the error message contains end unchanged. Please adhere to that so that
>> printed messages are consistent.
> 
> Yes I will change it to have -1 inside PFN_DOWN(), here and in the other occurrences
>>>
>>> +    /* Remove static shared memory regions */
>>> +    res = remove_shm_from_rangeset(kinfo, guest_holes);
>>> +    if ( res )
>>> +        goto out;
>>> +
>> Could you please add a comment explaining here what's done below?
> 
> Is it ok something like this:
I'm ok with your proposal in the other e-mail.

> 
> /*
>  * Take the interval of memory starting from the first extended region bank
>  * start address and ending to the end of the last extended region bank.
I would stop here. The rest reads quite difficult.

>  * The interval will be passed to rangeset_report_ranges to allow it to
>  * create, by the add_ext_regions callback, a set of extended memory region
>  * banks from the guest_holes rangeset, which contains the original extended
>  * memory region ranges where the static shared memory ranges are carved
>  * out.
>  */
> 
>>> +    i = ext_regions->nr_banks - 1;
>>> +    start = ext_regions->bank[0].start;
>>> +    end = ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
>>> +
>>> +    /* Reset original extended regions to hold new value */
>>> +    ext_regions->nr_banks = 0;
>>> +    res = rangeset_report_ranges(guest_holes, PFN_DOWN(start), PFN_DOWN(end),
>>> +                                 add_ext_regions, ext_regions);
>>> +    if ( res )
>>> +        ext_regions->nr_banks = 0;
>>> +    else if ( !ext_regions->nr_banks )
>>> +        res = -ENOENT;
>>> +
>>> + out:
>>> +    rangeset_destroy(guest_holes);
>>> +
>>> +    return res;
>>> +}
>>> +
>>> /*
>>>  * Local variables:
>>>  * mode: C
>>> --
>>> 2.34.1
>>>
>>
>> ~Michal
>>
> 
> Cheers,
> Luca

~Michal

