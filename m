Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B66C393D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 19:34:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513015.793423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pegnx-00075s-R3; Tue, 21 Mar 2023 18:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513015.793423; Tue, 21 Mar 2023 18:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pegnx-00073G-N5; Tue, 21 Mar 2023 18:33:53 +0000
Received: by outflank-mailman (input) for mailman id 513015;
 Tue, 21 Mar 2023 18:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pegnv-00073A-Ul
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 18:33:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea68a6c2-c816-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 19:33:48 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 18:33:44 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 18:33:44 +0000
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
X-Inumbo-ID: ea68a6c2-c816-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg1TplbqW8pZWSQzLCj0lYm0OXWPRQUVB5utsA5ZlrfPBBroQQwvWEnPznnVXt8YRibVvw3AJ85U3V08JF1QW7h6osbPuAMID1UbD2oa8XyLFmGKdJY57H4kaElrkkv1HF8A8Jd8qZ5EcjncHyGyNEFVHG0c+TrWeIRBo/cizKks3abhlI3/B5R2vXbWZy4V+5fxHX+i2plWVJaqf1WHigCwmfD+seWBqCXmkxFR3YcSdAtSTYxyworuBon5qSww9ZW1cAzThkf8nnCfqyO2NCMYayNR/oJVgdEeeRsT9METErNOwfQlu+CsjF3Bsdu/kkkZllbfOc/vR9BgsJWn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3AWmQytbyq6lVxqpKpF05l0Xi9x/G2roTeBtxMBBdo=;
 b=Axv41nfJrleKRzGCN2gkuRbpZ5bPGDdV0uNxoOrV6ES64XavRu06i7mg/UE7osVN4vdrkd4W8jUAd32nyBMaOq+JIpK5cUEC/IBR+i6NaZuEqQweIL2dNRS/iJl0OKvRj1SkoV1EJwEfViBTkJaSrFpwpmfaG3gm1wMTrupjbk0rsJctfmKpYr3Ssdu5XFHi9o1xnXWAYZKJqYOC8vBd4mCpIKY/3EH0vb4o7KgG8dRGRY+d+LqMlOyYqXmVosAnMu5YrvGhXstIs8jYNBjFJjZ4FIZJ5Y5Yc3FqfS0lZ/vx3ARxuub5dvpbI+hSuGFZbQiuKJR+IC+iCevCRTWyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3AWmQytbyq6lVxqpKpF05l0Xi9x/G2roTeBtxMBBdo=;
 b=VPGzmbEgnw0wMtxOqHvZwCXiN2iVwoXA1jB4uuGF34Tfs1adFjBGz3wgjeygXdFNxY3xLlf3iuLGP886iltp06x7xXLg+81VYau7t3PHVmR8jtxOoAZkFOkFc9kkEiPW3pzPPGlC200/569xBIc+yHegLLZln9Mj1xKkORPOev8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
Date: Tue, 21 Mar 2023 18:33:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 399259d4-85c4-40de-39ee-08db2a3acd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4fMiH4ZZsOH2omWkvMmyf8M7OGo2wKV+GMt8KIkTm3ovBznuk/94E7wePWZITzKw+qZXkWk35MCYMNXUmZQmdMgTHBidLRzPXBKbE5jBsz5oMtx4RCZdWy6mNoORYRBvG3gKg7n/TFIs3gyBk9p8+wqiXVsfBMIIvYlJt6p7BdcrwUihfrFWrUpivH7aeIfemakgLW470eps/R74aJkLBzAQmFtohQCJ6/4ZhsI+TafgyCWswUYf6I27NrI90brqnk0MZomjfPcdC9dxXOc41vq47e5ysoIFnEPlpyZqJoBagHzCR/jyNs6JJdZm9jwJ0BpcNedh9UX5Jf78OZAuber9Iy5vQQbKMZqwUj+x2BL75B8BMiJT5W2VlKIvvAJsecGIr8+CVZVB7ApHIXfOlIrRjsxsqMOM3ZoCMUJgGd8Yn1g5Xohrzbb5W2cpRus+OSaFG8OUQhJRbtRl7Xcxh25kxA6sw+WBOmIvQxaeCfAjeTJICAu7VxOu2TlxqtzMYimvISHR3DchSX1vM6e+O5aOYg4aYpiBYRZAA/KvTW56zUboduU2yFc3cHWgaxr/Ial5d3e4gGFoYXw7sP7Pmzk0J9xyFigMSgcSMUr4emCqiG+X1XSOxb65qah4X+cGK1RfCznV5Wiq4Q7a0AGBOTG1Dpbba110r+/PE/mcXeg2b8B3LZlj8CNUvc3mU8lbcsnV+Wk8RxMMoa4/o2Bkt23GxTmzlCsA5K388ehZuQJ50dKTxmhrRupMdHQy8FeYxS6CJsEnN4PYbrHhvF8jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(38100700002)(6636002)(31696002)(110136005)(7416002)(8676002)(316002)(66946007)(66476007)(36756003)(66556008)(8936002)(4326008)(5660300002)(41300700001)(2906002)(83380400001)(478600001)(6666004)(2616005)(31686004)(6506007)(26005)(186003)(53546011)(6512007)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVNIZXN1M2d6ZHJDNGlBekRDUmFoRnFJR1FTY0tQZ2tISzBFMExPemFycmps?=
 =?utf-8?B?SitpLzlCZmpuakltbXNzVmZrMkgzd0VheC85aklPMG5pRXkyZTZsL1VIc0w3?=
 =?utf-8?B?dTJHMm5MZmpBM2tkMVlXTVg1aFN0cXlxdW1uRytnUnhhSWFReUVrbysyTTJx?=
 =?utf-8?B?NVlxRE5ON09aeGJqclFxK2VVL25UZjVXMVBNQ3c5cnBRa1RBZE5QZnI3Q2tH?=
 =?utf-8?B?a2ZwWFlhK2JVRDBOaTJoWndPUDdPTG5lZUZ2eXlpUXd5VWVQdTN4K01ieW9F?=
 =?utf-8?B?ZG1lMXIycERhMCtPcCtyay94NEdmUW93Q0pySzZGOFd1Z2Y2dUhieVNjKzhz?=
 =?utf-8?B?VVEzdHlXK1NvUU42aVFpTVVRWFpyY1ZtUG4xZExsMEpGc3BNMndjS3gvdWla?=
 =?utf-8?B?VFA4Ukk0SE9ZaFRGd0xrMUdhN2RwVVJQV1ZwTXZtTWd5R2M1ejR4ditBNFAz?=
 =?utf-8?B?bS84bFBwT2M5MHZOMHlHbkJoTzNaTUFHR295L2wvcXRtMmF0Qkp1QWxqRE1a?=
 =?utf-8?B?a09hTWhEMm1tbnBwYkRxOGZiamJWZFB0QW5oTDNaS1J3bHRQQUtsOCtZTUVR?=
 =?utf-8?B?OXcxS20yOVFkUnhzc0dCSW93cXdyWXFpeTQwZExZcUU5ZGNha3dMYlJWZHNa?=
 =?utf-8?B?d09VRTRUeXNVNFZZY1ozbDhDRUgyNkNPK1BZQzZYcDRQcEl3aGZBL3dabi9x?=
 =?utf-8?B?Y2ZXU3R4ZkRXNDdNUGZBd1NKOTRyWktuS1JkMksvdUQvRldvNEtpVmp3TEtC?=
 =?utf-8?B?U0NTcUdFZ202NDIvTnBsOU54ZTdoczFnRUVTcHJ3UEhhQjZhdWljZkdncHJT?=
 =?utf-8?B?SHVxZHJ1U1pmb0RHYlhHUmhBckJJdGp0aG1MTWE3STZtbEVDM1Z5bmpyUWw4?=
 =?utf-8?B?eTk2NmN2M0xxcGw4OFdKbHVzWkFLVTIyYVVuTS9TeWpoRmJqWHhpNjVONEZG?=
 =?utf-8?B?MDZSdVozNlpoUjBjUlNYY08reUsrMjNCWHFpczlEU3Jaa29HbHlMOVFzbTFz?=
 =?utf-8?B?YjJqSmVLV3E1TlpBMHV3eXdwL2hQR3ZpRkVyYThqTThCeWQvVU5KeVExYlRo?=
 =?utf-8?B?WnJjSlJCbW8yYWszU3ZkV0JZMjhqK1dDMTVUajJZaWNrbFFBUHNjOWtHcXIw?=
 =?utf-8?B?NGQ2akt6cDE2WHN5OHJLOWZxZkttb25Oc0Z2TXdVOXFxT2JlUDNHRFhyalZP?=
 =?utf-8?B?cUkzZnBvNGFWQ1RRYk42OVp2T3hreGFzNFNhbngxTFZ2dTZDL0tiSXc5V2tr?=
 =?utf-8?B?bmpxNWJ6WVd2eEd2TmdSUzRKV1ZoYWYrNnhNajV0ZzBrSmk5b0U4ajNXN3pk?=
 =?utf-8?B?RWFpbXVCVEFiRFlSYWNDZzBTV0pMZ3BxbmNrMjhLZjhwRmF2OVY1MU1yRnpv?=
 =?utf-8?B?dWc2djZkdVFEWXZ0NEM5NkhXUVRKRlcvWTFYYWNrRElZNUNlWnlPcUtjandz?=
 =?utf-8?B?c2hZTS9ZVExSRTQ5TFk4dllQVlJwbG9mSFg1ZDF0d2tRRXM4SlhPd2daWm1L?=
 =?utf-8?B?STRMTE9nVy9nNGhPTEZDZUQxc0FqNFdiTDFLNWVJRzNvZ0FKSzVMOHZLNmJr?=
 =?utf-8?B?VzVkUXdMdmZ0LzNuRE10NWxaazZYNnBkeVNMT21Gc0R0c2RBZ1BrSGVIWU9k?=
 =?utf-8?B?Zk9yMzhFclA0RjFGeFdndWJTUzNNWGhaZDVjVy8wanZKZm9jcnVTZ053NW5l?=
 =?utf-8?B?SUxKU2ZrU0RVVWdBVE5kNXFvL09ZUlZBaGZrS3BYU0xvYW9WbU5QYlBEMkhG?=
 =?utf-8?B?ME44UDVwOUN0ZkM4bUxZdFNpbTZFa1BLOFh0QURXaklOakVub095RFo3VkJq?=
 =?utf-8?B?bDROK1RWdGlDR0E0TnlNYnpVWnJVL2wxSlJiZis4NGcwNE9Bc0dVWXV1ZlRz?=
 =?utf-8?B?b05QODUzZEJUQzAyQ1hLRGd0VU8wbUkzWjNVaURsZXpFemMrUXJ3V2NOeEc5?=
 =?utf-8?B?UFFWQWcvZDVFSThjVGU1SXVmaXNod24zbkxhTnE2VHBlcEJ0WkFaMWcxUUFR?=
 =?utf-8?B?VlJibjA2K29UOHRmWWx4U3pLMG83RWJzRmtVT0Nuak5NWHQvRkxFM24wSC96?=
 =?utf-8?B?NCtVNG5MRTQwS0FKb2JiOHJ6NWVTRCtqSEQrcHEwRUFUWVQvUWRjM3RMUmI4?=
 =?utf-8?Q?MgJyaxq5ZNFydXYcHN2nGkqPn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399259d4-85c4-40de-39ee-08db2a3acd17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 18:33:44.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPnIXSxX6OCdQmbL6Xb4ma1SxKi4VFOKryIZltiLoXmJoRv+GJdhsk/PoOppWTJEL34858P/n+A6Pf+7nWStcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101

Hi Jan,

On 21/03/2023 16:53, Jan Beulich wrote:
> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>> On 21/03/2023 14:22, Jan Beulich wrote:
>>> On 21.03.2023 15:03, Ayan Kumar Halder wrote:
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -1,6 +1,12 @@
>>>>    config 64BIT
>>>>    	bool
>>>>    
>>>> +config PHYS_ADDR_T_32
>>>> +	bool
>>>> +
>>>> +config PHYS_ADDR_T_64
>>>> +	bool
>>> Do we really need both?
>> I was thinking the same. I am assuming that in future we may have
>>
>> PHYS_ADDR_T_16,
> Really? What contemporary system would be able to run in just 64k?
> Certainly not Xen, let alone any Dom0 on top of it.
>
>> PHYS_ADDR_T_128. So, I am hoping that defining them explicitly might help.
> Yes, 128-bit addresses may appear at some point. Then (and only then)
> we'll need two controls, and we can then think about how to represent
> them properly without risking issues.
>
>> Also, the user cannot select these configs directly.
> Sure, but at some point some strange combination of options might that
> randconfig manages to construct.
>
>>> If so, what guards against both being selected
>>> at the same time?
>> At present, we rely on "select".
> You mean 'we rely on there being only one "select"'?
Yes, that was what I meant.
> Else I'm afraid I
> don't understand your reply.
>
>>> Them being put in common code I consider it an at least latent issue
>>> that you add "select"s ...
>>>
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -9,6 +9,7 @@ config ARM_64
>>>>    	select 64BIT
>>>>    	select ARM_EFI
>>>>    	select HAS_FAST_MULTIPLY
>>>> +	select PHYS_ADDR_T_64
>>>>    
>>>>    config ARM
>>>>    	def_bool y
>>>> @@ -19,13 +20,48 @@ config ARM
>>>>    	select HAS_PMAP
>>>>    	select IOMMU_FORCE_PT_SHARE
>>>>    
>>>> +menu "Architecture Features"
>>>> +
>>>> +choice
>>>> +	prompt "Physical address space size" if ARM_32
>>>> +	default ARM_PA_BITS_48 if ARM_64
>>>> +	default ARM_PA_BITS_40 if ARM_32
>>>> +	help
>>>> +	  User can choose to represent the width of physical address. This can
>>>> +	  sometimes help in optimizing the size of image when user chooses a
>>>> +	  smaller size to represent physical address.
>>>> +
>>>> +config ARM_PA_BITS_32
>>>> +	bool "32-bit"
>>>> +	help
>>>> +	  On platforms where any physical address can be represented within 32 bits
>>>> +	  , user should choose this option. This will help is reduced size of the
>>>> +	  binary.
>>>> +	select PHYS_ADDR_T_32
>>>> +	depends on ARM_32
>>>> +
>>>> +config ARM_PA_BITS_40
>>>> +	bool "40-bit"
>>>> +	select PHYS_ADDR_T_64
>>>> +	depends on ARM_32
>>>> +
>>>> +config ARM_PA_BITS_48
>>>> +	bool "40-bit"
>>>> +	select PHYS_ADDR_T_64
>>>> +	depends on ARM_48
>>>> +endchoice
>>> ... only for Arm. You get away with this only because ...
>>>
>>>> --- a/xen/arch/arm/include/asm/types.h
>>>> +++ b/xen/arch/arm/include/asm/types.h
>>>> @@ -34,9 +34,15 @@ typedef signed long long s64;
>>>>    typedef unsigned long long u64;
>>>>    typedef u32 vaddr_t;
>>>>    #define PRIvaddr PRIx32in
>>>> +#if defined(CONFIG_PHYS_ADDR_T_32)
>>>> +typedef unsigned long paddr_t;
>>>> +#define INVALID_PADDR (~0UL)
>>>> +#define PRIpaddr "08lx"
>>>> +#else
>>>>    typedef u64 paddr_t;
>>>>    #define INVALID_PADDR (~0ULL)
>>>>    #define PRIpaddr "016llx"
>>>> +#endif
>>>>    typedef u32 register_t;
>>>>    #define PRIregister "08x"
>>>>    #elif defined (CONFIG_ARM_64)
>>> ... you tweak things here, when we're in the process of moving stuff
>>> out of asm/types.h.
>> Are you suggesting not to add anything to asm/types.h ? IOW, the above
>> snippet should
>>
>> be added to xen/include/xen/types.h.
> It's not your snippet alone, but the definition of paddr_t in general
> which should imo be moved (as a follow-on to "common: move standard C
> fixed width type declarations to common header"). If your patch in its
> present shape landed first, that movement would become more
> complicated - first and foremost "select"ing the appropriate
> PHYS_ADDR_T_* on x86 and RISC-V would then need to be done there, when
> it really doesn't belong there.

I understand your point. I am assuming that as PHYS_ADDR_T_* is now 
introduced at xen/arch/Kconfig, so x86 or RISC-V should be able to 
select the option.

As I see today, for :-

RISCV defines PADDR_BITS to 56. Thus, it will select PHYS_ADDR_T_64 only.

X86 defines PADDR_BITS to 52. Thus, it will also select PHYS_ADDR_T_64 only.

For Arm, there will be at least two configurations 1. which selects 
PHYS_ADDR_T_64   2. not select PHYS_ADDR_T_64 (ie for 32 bit physical 
address).

>
>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>> course suspicious as well - this ought to be uint32_t.)
>> The problem with using uint32_t for paddr_t is that there are instances
>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>
>> For eg , handle_passthrough_prop()
>>
>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>                      " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>                      kinfo->d->domain_id,
>>                      mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>
>> And in xen/include/xen/page-size.h,
>>
>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>
>> Thus, the resulting types are unsigned long. This cannot be printed
>> using %u for PRIpaddr.
> Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
> when physical addresses are only 32 bits wide?

I don't have a strong objection except that this is similar to what 
linux is doing today.

https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12

>
>> I remember some discussion (or comment) that the physical addresses
>> should be represented using 'unsigned long'.
> A reference would be helpful.

https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html

- Ayan

>
> Jan

