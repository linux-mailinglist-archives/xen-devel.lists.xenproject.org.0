Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A47027BE
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534648.831858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU3X-0001OZ-8G; Mon, 15 May 2023 08:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534648.831858; Mon, 15 May 2023 08:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU3X-0001Mg-4N; Mon, 15 May 2023 08:59:47 +0000
Received: by outflank-mailman (input) for mailman id 534648;
 Mon, 15 May 2023 08:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOm1=BE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pyU3V-0001MY-AP
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:59:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4bc28fd-f2fe-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 10:59:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:59:39 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:59:39 +0000
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
X-Inumbo-ID: d4bc28fd-f2fe-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn3oFdHk/e0wMMmgEjnVBUyRO7MO9SszVsu+RZqaZBBPAsEBacUJuHqn6s8SYQAd3FZWPrLLc49iHezb5ZTnbnuSnzmCQt7LQNtlWPiCXLbET68uH80KfdlWayOO1OYJ87d2QMo4AEf2QBjGb85kjOBF+XEYmthX3uNVZu7PH20aB3LbLa39qqHoGSOhLnNT7Bhf6G6pUtWo22B/iLinsAsSOrhE0O/39i09MJDLvI+zsFYTWBatYtAure60c4R5ZZbT+HbS+Cf/WQ3of1bm0AIhgnzSX9cqBCEvmHJJseA5BMaXbz4Lby49K0i1Q97l7wcNvHfzrJQZCpBHrORCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPLfuueglwoWf/gPGAQD/6AZ90RyjyMYCgwMF7EXa1k=;
 b=eKWNl/mYIjywH2vBXvCxueER1XBYG/tna9OnK1ytXJveEiGUss8AvM4CaTSyolv8eL3vTWHeImrPPqrI9d9vTJlmg0Q3wWhsFTSUOYLm7KYQsG/KpoxaY5O6Hi6KyO8NwhOtjI3rPE1RjArg7DX6m0HHMl3zPg59W+hvVyOvcoDArZ9X8xFII1CPD/dOVP/2w3Zyjg/8KqifVMbIuSMnGIm02eLVCrTAvhbD0z6JmHR9PxFIgUtS8RIo3k0hMC4067CSyTKzYjCHCpFVmHBLuFqe6PJQQ95dNgCOYcuKwP4NR3GfYFwSXXrfDInr1dCZNKk9a+HRArC2EO7GHMWe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPLfuueglwoWf/gPGAQD/6AZ90RyjyMYCgwMF7EXa1k=;
 b=w39WKMmVQYh5dsDSSpDXJkFJucDTOh4IZKzI+k9yzZXP5YkkQ1gsYxbOQ1iFXNFSE152+6Aga5QOyUlkV4OTW9K3YQ9saUeZwYQ5k2uBYhpqmNdY1b4UZ8anOd+3bp1H2HUBlWTagmxMNmW82Z/SXUXbyJ1+CS+ZI9JA6y/+7HE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2930ee0b-d8c0-9e85-eb8e-e4440c5c4628@amd.com>
Date: Mon, 15 May 2023 09:59:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
 <1dadc8b9-00be-55f9-e8b7-f867eacf20b1@amd.com>
 <2cdb4e1c-5151-f820-5ceb-35f782842393@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2cdb4e1c-5151-f820-5ceb-35f782842393@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ea24a9-f046-4624-faba-08db5522b725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gb0exok9xe6HBMtof/jg8fDyiivyhjosrNYirqMjxfbJIjNUAkDyXCFQ1GKkiq6oaxwix1mwqiIxCjRLSw60hGjxTts1k/yy6u1RpzPsk3YFf6FL0oqa9m59ZVCvV55qMhH9JudZvjDYpYvKru1pNHhwqNg0l+F7gnw2XK7GF92sG/EkG9sLz4vy/rkFtChp3v12Lz92PvtIthnGR5dK4szrjj+P+PivqaVF8GUhSQuQlaHq+qS9EP4uJULO6q3nDhbAtwP0gK14kFCun8que+lQlNQz1dFWhJwvPHMiDAUa3o6koonWvTjJkHORuiWXKMTX6PA0yp+1xseY0R5yzDX855s4YghZmI3ShYyyvFur7JrWk5WRQSmdGIS1hpp5e4sjxwNiS8eu2rCZgm3wnT9f9IHMxTXUdvX24cYqhA/VoZ9dNq2AkCq3gmj4M4XCF+Z808aI3QKFO/ry7YuZ+ndxUx+JtQuSV+zKQhNBuX5SF/5uRs8JdlJy9xEv9oIKbgtaXBN94m3LsyFD1MHQiWIn5wQJrqjX/cAMWweYAN/K4KMS8UaYOvCAir8pCoczCWpys9fcbFrBYdDmkTK+xeE/nT1jHDY12vusOTO4t5qFyq0QJXLh0BPR/UBv2SqGqvy8Xws6PTa0GvwBFj4qXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(36756003)(54906003)(316002)(66556008)(66946007)(66476007)(4326008)(6486002)(478600001)(8936002)(8676002)(5660300002)(6666004)(2906002)(38100700002)(31696002)(41300700001)(6512007)(2616005)(26005)(186003)(53546011)(6506007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vmtmb3I5YUhXekFBc2JwNVUzSXNlNVUraHJiYjNFWlJOSlRITHRybVNEYm5w?=
 =?utf-8?B?T3IxQUxoN1NubW9NUEpJZ1VUMkxtZUlxWDRWdDBkMFFOVXpZaU5UM0JpRTFF?=
 =?utf-8?B?WVpkYjB3MGsyRTVPdjlNV2s2dUs3VCtETktUTThYZmlMRWg5RlJFZ3NlWEoz?=
 =?utf-8?B?VG1jTVB2VXZEUWhacVZxbXpvUjhnMzhRZXRrVlJMRlI3dmw3SnFqOHBkSDUw?=
 =?utf-8?B?RXZtbi9ramlhT2UyWDh0RFpYSW9zeHM0eSs3N3BWd3psb25mZjgwOUIyTFRv?=
 =?utf-8?B?YWtIMUVvWUhRMmp1MlFmRlV2eGJiZVN1RllkN0VMYURkZ1A1Q2p0MHVHT1R0?=
 =?utf-8?B?NzZQazFqSUhlYVZOT1k4ZFcybWVqanY2MVFnZDBmTG1UNllnZ2cxQVhCK3Br?=
 =?utf-8?B?TjZJSUIzcy9aVFh3NWtFNmdmY3I0TFVkN3NvNXQxME1zMytTRUdIaERkSHR1?=
 =?utf-8?B?UklOODZLWEErajAvRU9UMUJGbWdCNCt3S2V5K2Z6b2xiQmNIempORW5MekZW?=
 =?utf-8?B?RjAyYUVlSGNNbHhrd1dOSnd3UnlSUHc5bjRUcDN3OWhlQTZTSS80V1pnQ2JO?=
 =?utf-8?B?YStiRlNkaWlYRllCNWtpakVZUnViaUNsYWF6cFRKZkVGYVNlcHVVZmVCYnFO?=
 =?utf-8?B?S1lUZWkxdnY3aDc1azVLbkxoTjZMNWZNc2NsSzdkS0NyL1d0ZlFpRGpodkV5?=
 =?utf-8?B?aXR1M2NleGlOdHoydDNubmZHckYra3lSdXVoc0RaV09vbVE1a1dadUgxZzBO?=
 =?utf-8?B?bE05VjR6UTFtdnBtSVRvcEtqMU84L2ViRVZaMFZFOUFtN09FOXVnOWJ2UkFs?=
 =?utf-8?B?WEc3NTR2TnZrQ2psTkdXVGxLMHEyaU52aHdRM291OUJOdmdiamZnb3RnMk5W?=
 =?utf-8?B?a3JUb01scmFLM0xMMXU3S0Q1TjR2NzMrZGQ3ZmJsZGtGaWxSb3hhbUdvcW1K?=
 =?utf-8?B?dHdlZitxZlJQNEJhYWYrUWFoL0RSMlFaT3FLdWZvVWpDYVZJbzFmczUrRXhu?=
 =?utf-8?B?SlRGT2xBOVJZckN6MDNoU2RwQTZtV2F0aldzM0UxOG5hV2Njb3J4S1dsbG1L?=
 =?utf-8?B?YU50UldzbmY0cmRNZXR2UWlZZHMreXIvbE5aY0laUGZGYnJPN1lUT3IxcnhL?=
 =?utf-8?B?ZmtYM0hINTdXUGNsQUtkMVluVzA0MnNnRlpGTldjZnNDWUpNTFprZ05aQm1s?=
 =?utf-8?B?UVAzdkZ5blVwNTFSaHJNeHozZURZZWdXaExvUlY2U0tCcjdqV3JIcUxITUR5?=
 =?utf-8?B?NGxNOWdicDlFa2tPTStvdkl5QmF4dXV6VzRpZlhtcUtnM3JiajdzUENZWE5j?=
 =?utf-8?B?aTh3Q2JiY24raCtoYnN4Q2dOM3Zpa0lFVzJ3UmJhMEV5TXcyb2o3VXZDMWlS?=
 =?utf-8?B?cWwwZGZwSkc3WHRqMklCeXNaNVhOMm1BUHErMEE3TXhpSHp2NzZTMDhqc0NR?=
 =?utf-8?B?MkFudnRHOWRjeitNdTZKa1c4VHptYmdtT1AyYm9ERjRrWXhnUFFoajNmUENq?=
 =?utf-8?B?aTdrWVlzaUtJYW9wWHZvM1Q2VFlWbTlRZXZIc2FBQWFTczF5Ti9ya0ltWkdn?=
 =?utf-8?B?Z1JnVmtjMzZjbkJzditDamJyWStwQi96czgySDQyMXZHbDJzajRwTnQxTnVa?=
 =?utf-8?B?aXFXWnZhdUQ1VzRRUThSOWNhRFpHeWIrTWQ3NWtlN2ZzMEtMd0RLdFkrQnNC?=
 =?utf-8?B?a3JvOS9kYk9UYTdyb3VSV3gzMWdDUkEwMVVRMzRFTUloak1GTzYra2dlditO?=
 =?utf-8?B?YzJQd1JhR1RmOVNyQmxSWFB3QWRIYnRUclltMUtsQ0xGUEU2SHJvNnBweEhr?=
 =?utf-8?B?WVErdUFqQUVkZzR3WW1kYWc2MVNCRDc4ZW16UUVMb3BOT05oUVRiNWhHclBR?=
 =?utf-8?B?eTJudDloVk55LzlhS0VyYS9rSTVTbmV3TTJFNW5jaU9pZ0hMUDZwY0lOeTlX?=
 =?utf-8?B?KzVXbmtIS095UENjTDZMOGQrYUp4dTkzbWZWOW9jbGw3Qk82bExpY3luY3Fl?=
 =?utf-8?B?T09JQlNaTll6azhWeU1IMHVQMFhVeXAyS2pFcktmTXRFVHEvNFNHdDJCNjRT?=
 =?utf-8?B?ZkFDa2xuUzBPRzhRWXVubUcwQ0RFY0JlcjRDd3JKNUwyODljQS9iU0ZnTVFU?=
 =?utf-8?Q?XrzU9Hq2GxNRVpfEVvQSrwFT9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ea24a9-f046-4624-faba-08db5522b725
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:59:39.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93+TEQ9U202vNwaTJoB2QVa1t/pyvZZNZwlKm4Y3SbHp8czkKN5Uv2CWUar1gxnTMLHc+H/UghAS6971s9oPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850


On 15/05/2023 07:46, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 12/05/2023 18:59, Ayan Kumar Halder wrote:
>> Hi Michal,
>>
>> On 12/05/2023 15:35, Michal Orzel wrote:
>>> At the moment, even in case of a SMMU being I/O coherent, we clean the
>>> updated PT as a result of not advertising the coherency feature. SMMUv3
>>> coherency feature means that page table walks, accesses to memory
>>> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>>>
>>> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
>>> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>>>
>>> The same restrictions apply, meaning that in order to advertise coherent
>>> table walk platform feature, all the SMMU devices need to report coherency
>>> feature. This is because the page tables (we are sharing them with CPU)
>>> are populated before any device assignment and in case of a device being
>>> behind non-coherent SMMU, we would have to scan the tables and clean
>>> the cache.
>>>
>>> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
>>> requires that all SMMUv3 devices support I/O coherency.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> There are very few platforms out there with SMMUv3 but I have never seen
>>> a SMMUv3 that is not I/O coherent.
>>> ---
>>>    xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>> index bf053cdb6d5c..2adaad0fa038 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>>>    };
>>>    
>>>    /* Start of Xen specific code. */
>>> +
>>> +/*
>>> + * Platform features. It indicates the list of features supported by all
>>> + * SMMUs. Actually we only care about coherent table walk, which in case of
>>> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
>>> + * section 3.15 and SMMU_IDR0.COHACC bit description).
>>> + */
>>> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
>>> +
>>>    static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>>>    {
>>>    	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>>> @@ -2708,8 +2717,12 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>>>    	INIT_LIST_HEAD(&xen_domain->contexts);
>>>    
>>>    	dom_iommu(d)->arch.priv = xen_domain;
>>> -	return 0;
>>>    
>>> +	/* Coherent walk can be enabled only when all SMMUs support it. */
>>> +	if (platform_features & ARM_SMMU_FEAT_COHERENCY)
>>> +		iommu_set_feature(d, IOMMU_FEAT_COHERENT_WALK);
>>> +
>>> +	return 0;
>>>    }
>>>    
>> All good till here.
>>>    static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>> @@ -2738,6 +2751,7 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>>    				const void *data)
>>>    {
>>>    	int rc;
>>> +	const struct arm_smmu_device *smmu;
>>>    
>>>    	/*
>>>    	 * Even if the device can't be initialized, we don't want to
>>> @@ -2751,6 +2765,14 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>>    
>>>    	iommu_set_ops(&arm_smmu_iommu_ops);
>>>    
>>> +	/* Find the just added SMMU and retrieve its features. */
>>> +	smmu = arm_smmu_get_by_dev(dt_to_dev(dev));
>>> +
>>> +	/* It would be a bug not to find the SMMU we just added. */
>>> +	BUG_ON(!smmu);
>>> +
>>> +	platform_features &= smmu->features;
>>> +
>> Can you explain this change in the commit message ?
> I think it is already explained by saying that in order to advertise the *platform* feature, all
> SMMUs need to report it. If at least one doesn't, the feature is disabled. This is exactly
> what this line is doing. It is comparing platform features with a just probed SMMU features (arm_smmu_dt_init()
> is called for each SMMU).
All good.
>
> ~Michal

