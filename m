Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B667439DD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 12:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557414.870739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFBgz-0001Vd-Ij; Fri, 30 Jun 2023 10:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557414.870739; Fri, 30 Jun 2023 10:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFBgz-0001Sv-Fa; Fri, 30 Jun 2023 10:49:33 +0000
Received: by outflank-mailman (input) for mailman id 557414;
 Fri, 30 Jun 2023 10:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zhT=CS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qFBgw-0001Sp-VZ
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 10:49:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8b45a17-1733-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 12:49:28 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB8324.namprd12.prod.outlook.com (2603:10b6:8:ec::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Fri, 30 Jun 2023 10:49:24 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 10:49:24 +0000
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
X-Inumbo-ID: c8b45a17-1733-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR3KXxLoucGyTPKXNS2J/inqi7SvWmfOU+Mg2owNYdGEoX03pFrZLXVq4TLGH9B6HD9cZQZo8HZV/+825hBl5EdgXf4iAojezUeNHt99/yDboJTAtAk2PZIz6LdNR50Abq4s0h3kDnfCEBMxL83UksVDC8IeLhZhAbAK8zM1s4xmSuPh87Bbf20EnWNNCdvbjl/DVPgQ68rkDdfVSn+j1yyylNjqaZ8K48Uil3VcKUfxXLZj+zJ9QNorBASrbxvzIzY8MmAHXkUIj/O/h5kUOyekgF5U4iqEj17HUJsuATAtvHO/mMpH9MiEpPEcmMQDK6tq/hQcQ9M6Td7ztmr6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHX1Fd9dDOQCRruNcMeN5GXSVPomf/TOfeInI+e2Aps=;
 b=FgqtBY5OcgeXz+GQkIzpKXKLyenCTWkNMgDP1OKl7WYKEqrOvY74vlszygHeUljiTNFTROYPyWcXl5Wfr3iDKu0dg+zD+YbuVKYRFzBnBJO6h/VBxfErIsbddcfKvOkVzqnz6jcvFK0KH3S1aYzJLhpnVyXKG3byiTaPwb5ampny7L2PR+te3diJShUyvLdJXbBu+XSF3EziUfEXGwb//ZKiI5hbAMDMk/Z3R2ZZBZDt20GDvWxVzRqtLLF6iDN77j3F0LHlKO7Ltb08NiVlLxUJRiG6jxFPVvqE755mocCI4gWHm1PHwsRTzpRDCxurzx3q3HOAliDDFkvuLEV/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHX1Fd9dDOQCRruNcMeN5GXSVPomf/TOfeInI+e2Aps=;
 b=QKNrQBI7Og7mvCjE/+q8zlx/Pe+R0XoRZMneTaTH6Y7G5G/B2Q7wm+NMsHcyFREW7ykQ4/SCAX9fWKcXqzPdU0yUbn6+RHXdSCTPAmBGbzvxGGV6EHZ9S3lWAnJ/qWNjqAMJP6ozv7FU0r8F8tz8gGIebpPKp7UHLcaHgKBShxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
Date: Fri, 30 Jun 2023 11:49:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 5baa0bca-2116-4db3-86df-08db7957aadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQCQ7N5K/Mmt8KI/JWJtr5XveVF9rgx6pS2HY6abcKi5BIFM/pYS/IfKfx+6Yz65z8Mm9at5gY6uAQwSxYsFJ6rty6OiznG1at8/GFJmBqisYL47R8q3GCDC81og5UUz1oHvALzCuissSJ2lc6H/yP3ZVA85ip0cAL7oRr20B1EIbUBdHyeOVihHst8cp7HWAbJvGSbcpEeeds5RmqQmC2PY+nUiIuFCn2VvAqrTV9VIuJD/lRQGfrWPi1bqodsZgF1oTBHH4oHW0rJfdWJqZJ+MTeoTgia5ZsQTdFF6uopIM3kG9z47wvglX99qtCco7BTvaZHmu2xMafAgkEdXziCQaJ1Ghdv3eDoCw5/HqV7VIrzv929WLrDqBfl/+zEfNJdgSV9NlOzC7KIc0XtIiYFuFcjZBMQEJRU1uhMfcgSjzi9IVf04RD5MhMYf0TkiL+hOwWgndWHvH3GFqw84clHK1yz6M1+C5YdlCmfjNL2Xrs8GbpXxRt5eExn+tZ+/7oy1wI07iW6SJCaG+TPWbUG5FX0mOCr6Lntum2u3k3ju0LZlz9nlIKHSG4KZjHQvCNiyV13Eupz3wlivWNRiGX3R9m15fAw0wyJUf2RCqC6E7tiZSLqiUCrb6rbDWOqx+BoTAabFmvJv60+vbD1U8r0xKvits/jJYkmOAcrFv64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(2906002)(8936002)(8676002)(6506007)(316002)(53546011)(66556008)(66476007)(66946007)(4326008)(31686004)(41300700001)(186003)(26005)(6486002)(83380400001)(31696002)(38100700002)(6666004)(6512007)(54906003)(2616005)(5660300002)(478600001)(36756003)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxrM0Vrc1lLNS9CT1BEQ3BrUnNrellsVWNYNnJyN1oreE4wTkVXS2dYdE82?=
 =?utf-8?B?bjVRTkI5U3ptaTNPT1E2V3ovTllNUzJ4aTZRaGIrZFJtOTdWN3ExT085YlZv?=
 =?utf-8?B?UkpLUWJjelBrc1lkSmprTDFqQStOOE9URy9vbGt5TkR4QlJxOTUra1gzbGlL?=
 =?utf-8?B?TEJna0UwUldMT3VseGpkMjdMWXFVSEFRK1BxSmQvNU8zQ29ZZkdQYUhpVHph?=
 =?utf-8?B?cTZnUDRZRU54UUFodzRTTm5TYXZGS3Q4MDgxbGcvd3h6RUs4L0UxRi9JaTFI?=
 =?utf-8?B?SGlsRVNXb3I2OXVqV1hnN1doeXowaG1jQ05RM0d6ZGJtVEdHUExQWVhYdzVv?=
 =?utf-8?B?aUpNTXdGelN4Y3VDTm0xYnlUNEpOT2RnQ2pNdjZHUTRGS2RMcmd6MVIxUzJr?=
 =?utf-8?B?VDlpZ0VyUVdTalBsV01qOFRoY3M3V29iczZNbWNoUzNDd0V2blp3TGhHVUZG?=
 =?utf-8?B?NXR6V25lMzBFU3hReUs5OWdIWjI0YjQwT2xvV0hqUlVmMHlmWklMQzVPVkhi?=
 =?utf-8?B?NkphQ1dObFJyak9JN1RBaC92Nnorc2pYeEpMUU5Hd0J2R21ZR05Ha2MwcGZV?=
 =?utf-8?B?Q21pZEZLUHBYMjloQmhJZXh1Z2pCdzNaTmN1M0JvWW5qaUQyWVRua1hFUnJn?=
 =?utf-8?B?NFd4NEE4elZXbmZ4KzBzYk0rajhGWG1mVG9xOTc5K3BqNUJqT3YzMVB1Y25y?=
 =?utf-8?B?MHBCdXI5Ulp3VWJzWHJtQWZRZENvNjdhQkNrN2srbHE5dGRSNlVzcm5oS2RB?=
 =?utf-8?B?c2p2a01QMTNTeVF1UWVaMWE3eEsyNjMrQWpuV1ZoYzBqa0p2M2lDOUhuZ1Ro?=
 =?utf-8?B?RnNkYTJNbUhXY0s0RVpaT3hkdm1HQlEwT0ZxU2lHRUZwVFpvSnZkcUZYRHFa?=
 =?utf-8?B?WkZIQ1g4azJMelJETXo2RTFsUzV0YjEzY1BWNW9pdlRNbUo0TzlUckh2RmFY?=
 =?utf-8?B?Y2JKWkttMUplVHV4YmROajBIRE90dUJFcmI3NUhkS2FpNHJkR2JmZXFvNnFk?=
 =?utf-8?B?V0hidVhlc3VzRUlCVS9xb3A5UktYMTNmdzgxUDl6RWxaUmduWTAyQnFVRTE4?=
 =?utf-8?B?SmJqOUl6NEJWNlhPK3ZHVzZsVk9ra3M4WmlqUXprTWo4QkJDdEtuclczWnc0?=
 =?utf-8?B?Y0R2RERRK3dBTmxBYU93a0cyOW51VjFJM0VZbVNhNDNyVkhkUFlDOXExVUE5?=
 =?utf-8?B?WURXWnVLaEFWOVRzNzRLQXNOZ2VVaEEyaHhsaGtJZEIzWFBtMnlyb2FYVFNG?=
 =?utf-8?B?ajg4a05oMjA4S0FyN2x0ME1kQVJSWFplU0lESHBwQmdmaFJ5NmpOZVNyMVA2?=
 =?utf-8?B?WndNSGE2cTdjVVBYT3RRU1RjL0tBWWg0OHh5L1VzUExVRUFzVVhSU3A0MTlo?=
 =?utf-8?B?MzVsb1FYNlFYeVZ4dkkwbGN1WGVRWVprcFVEUUtnQk1UVnFUMFU0aElaaXdQ?=
 =?utf-8?B?aXd5dTJNU1FkY1AyRkZJTTRxLzREM1Rvay92a0F2NGZ5ZVYrZXBzaXhOL1VS?=
 =?utf-8?B?ZHBqUyszUzRIMXVlSTFwRTlqNlVUTi9BQUkyWkxWQm1xdmJ6bDJ4SzBwaTI3?=
 =?utf-8?B?N0V3eDV5NkFJTm83RHAyUlkyMkpPSlV5RzdFQk1xc285YWpoNTdhMFB3a1JP?=
 =?utf-8?B?ajNkNnY4QjgrTXFxMk0wRlVKWlU5eVVUZk9sdVlZVUV4bEY1Qkh5V0g4OC9a?=
 =?utf-8?B?SytrQ2Y4dG5UWGpPeEJCUU9oQ0dFNENEN0E3TWZMeStSYTlCZ3libzhkWTJq?=
 =?utf-8?B?YXNNZmZ5TTk1UkhrdjBPcmtOWWliU3QwczdpM2JodGtENG81cjBKc2w2Vjh0?=
 =?utf-8?B?OTlqRmJVZWFKMUZpSHdsYStYZE40YlI4YUw1M3UvM282VlhpL1IzTjM1SEI5?=
 =?utf-8?B?dk9aUW9tbDlFdXdDakpybWp6UVkwV2svT1RlaW15OTNqdHZHTU82MmNJWmtM?=
 =?utf-8?B?MytzanloZmJlOU9qV0UvUTNMU2kzZ3loK053Y1kyZzFLWnRwUFo4N2M5UStx?=
 =?utf-8?B?VHRMa21mMjRTczZuN0Z1S0RMRW4xdzd1TWNBQUN6RU1DcGoyZ2tLeXJmaFh3?=
 =?utf-8?B?bmRNd1FmYnJJOGRPRjVGeGdIakdFelZiTjI0UkoyOGxVVkpzWTB1aEo5THE1?=
 =?utf-8?Q?ozqbxAXuw2YvFz3fo5rdMCUlP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baa0bca-2116-4db3-86df-08db7957aadd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:49:24.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cKRA9gx5NTROBxy2KvEMF7mXH4UUvJtqzRvhJEuoRmhtkinBUcApLCpJR4xIQFzwn34WQNRjGcBTjmt0XS6iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8324


On 30/06/2023 05:07, Penny Zheng wrote:
> Hi,
Hi Penny,
>
>
> On 2023/6/30 01:22, Ayan Kumar Halder wrote:
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so in 
>>> order to
>>> not access unexpected memory area, dtb section in xen.lds.S should 
>>> be made
>>> page-aligned too.
>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it 
>>> happen.
>>>
>>> In this commit, we map early FDT with a transient MPU memory region, as
>>> it will be relocated into heap and unmapped at the end of boot.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - map the first 2MB. Check the size and then re-map with an extra 
>>> 2MB if needed
>>> ---
>>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>>   xen/arch/arm/mm.c                    | 26 ++++++++++++++++++++------
>>>   xen/arch/arm/mpu/mm.c                |  1 +
>>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index a6b07bab02..715ea69884 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -72,7 +72,8 @@ typedef union {
>>>           unsigned long ns:1;     /* Not-Secure */
>>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>>           unsigned long limit:42; /* Limit Address */
>>> -        unsigned long pad:16;
>>> +        unsigned long pad:15;
>>> +        unsigned long tran:1;   /* Transient region */
>>>       } reg;
>>>       uint64_t bits;
>>>   } prlar_t;
>>> diff --git a/xen/arch/arm/include/asm/page.h 
>>> b/xen/arch/arm/include/asm/page.h
>>> index 85ecd5e4de..a434e2205a 100644
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -97,19 +97,24 @@
>>>    * [3:4] Execute Never
>>>    * [5:6] Access Permission
>>>    * [7]   Region Present
>>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>>> + *                              mapped for a short time
>>>    */
>>>   #define _PAGE_AI_BIT            0
>>>   #define _PAGE_XN_BIT            3
>>>   #define _PAGE_AP_BIT            5
>>>   #define _PAGE_PRESENT_BIT       7
>>> +#define _PAGE_TRANSIENT_BIT     8
>> I don't think this is related to MPU. At least when I look at the bit 
>> representation of PRBAR_EL1/2,
>
> This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 register 
> map.
> It is a flag passed to function map_pages_to_xen() to indicate memory
> attributes and permission.

But aren't you writing these flags to PRBAR_EL1/EL2 when you call 
xen_mpumap_update_entry().

In the below snippet of xen_mpumap_update_entry(), IIUC, you are writing 
these flags.

         xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
         xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);

         write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);

Please clarify here.

In this case, I don't prefer mixing hardware specific bits with software 
only representation for these reasons :-

1. It makes it confusing and hard to differentiate the hardware specific 
attrbutes from software only.

2.  Also, refer xen/arch/arm/include/asm/arm64/mpu.h, typedef union 
prbar_t {} :-

typedef union {
     struct __packed {
         unsigned long xn:2;       /* Execute-Never */
         unsigned long ap:2;       /* Acess Permission */
         unsigned long sh:2;       /* Sharebility */
         unsigned long base:42;    /* Base Address */
         unsigned long pad:12;
         unsigned long p2m_type:4; /* Ignore by hardware. Used to store 
p2m types.*/

** ReferARM DDI 0600A.d ID120821, Glossary for RES0

For a bit in a read/write register, it is IMPLEMENTATION DEFINED whether:

 1.

    The bit is hardwired to 0. In this case:

      *

        Reads of the bit always return 0.

      *

        Writes to the bit are ignored.

If the writes are ignored and you read back 0s, then the software logic 
which relies on p2m_type can break.

Thus, I will prefer keeping RES0 unused so that the software works 
consistently across all silicons. **

     } reg;
     uint64_t bits;
} prbar_t;

I see you are using RES0 bits in prlar_t {} as well. My objections 
applies here as well.

- Ayan

> This bit _PAGE_TRANSIENT is to tell whether the new adding MPU region 
> is a fixed one, or a temporary one.
> The MPU region created for early FDT is a temporary one, as it will be
> unmapped at the end of boot.
>
>>
>> bits [47:6] are for the base address.
>>
>> If my understanding is correct, then please take it out of this patch 
>> and put it in a separate MMU related patch.
>>
>>>   #define _PAGE_AI                (7U << _PAGE_AI_BIT)
>>>   #define _PAGE_XN                (2U << _PAGE_XN_BIT)
>>>   #define _PAGE_RO                (2U << _PAGE_AP_BIT)
>>>   #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
>>> +#define _PAGE_TRANSIENT         (1U << _PAGE_TRANSIENT_BIT)
>>>   #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
>>>   #define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
>>>   #define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
>>>   #define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
>>> +#define PAGE_TRANSIENT_MASK(x)  (((x) >> _PAGE_TRANSIENT_BIT) & 0x1U)
>>>   #endif /* CONFIG_HAS_MPU */
>>>
>>>   /*
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index d35e7e280f..8625066256 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -61,8 +61,17 @@ void flush_page_to_ram(unsigned long mfn, bool 
>>> sync_icache)
>>>
>>>   void * __init early_fdt_map(paddr_t fdt_paddr)
>>>   {
>>> +#ifndef CONFIG_HAS_MPU
>>>       /* We are using 2MB superpage for mapping the FDT */
>>>       paddr_t base_paddr = fdt_paddr & SECOND_MASK;
>>> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_BLOCK;
>>> +    unsigned long base_virt = BOOT_FDT_VIRT_START;
>>> +#else
>>> +    /* MPU region must be PAGE aligned */
>>> +    paddr_t base_paddr = fdt_paddr & PAGE_MASK;
>>> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_TRANSIENT;
>>> +    unsigned long base_virt = ~0UL;
>>> +#endif
>>>       paddr_t offset;
>>>       void *fdt_virt;
>>>       uint32_t size;
>>> @@ -79,18 +88,24 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>>       if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
>>>           return NULL;
>>>
>>> +#ifndef CONFIG_HAS_MPU
>>>       /* The FDT is mapped using 2MB superpage */
>>>       BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>>> +#endif
>>>
>>> -    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, 
>>> maddr_to_mfn(base_paddr),
>>> -                          SZ_2M >> PAGE_SHIFT,
>>> -                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>> +    rc = map_pages_to_xen(base_virt, maddr_to_mfn(base_paddr),
>>> +                          SZ_2M >> PAGE_SHIFT, flags);
>>>       if ( rc )
>>>           panic("Unable to map the device-tree.\n");
>>>
>>>
>>> +#ifndef CONFIG_HAS_MPU
>>>       offset = fdt_paddr % SECOND_SIZE;
>>>       fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
>>> +#else
>>> +    offset = fdt_paddr % PAGE_SIZE;
>>> +    fdt_virt = (void *)fdt_paddr;
>>> +#endif
>>>
>>>       if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>>>           return NULL;
>>> @@ -101,10 +116,9 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>>
>>>       if ( (offset + size) > SZ_2M )
>>>       {
>>> -        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
>>> +        rc = map_pages_to_xen(base_virt + SZ_2M,
>>>                                 maddr_to_mfn(base_paddr + SZ_2M),
>>> -                              SZ_2M >> PAGE_SHIFT,
>>> -                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>> +                              SZ_2M >> PAGE_SHIFT, flags);
>>>           if ( rc )
>>>               panic("Unable to map the device-tree\n");
>>>       }
>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index 14a1309ca1..f4ce19d36a 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -448,6 +448,7 @@ static int xen_mpumap_update_entry(paddr_t base, 
>>> paddr_t limit,
>>>           /* Set permission */
>>>           xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>>>           xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>>> +        xen_mpumap[idx].prlar.reg.tran = PAGE_TRANSIENT_MASK(flags);
>>
>> ReferARM DDI 0600A.dID120821 , G1.3.23, PRLAR_EL2, Protection Region 
>> Limit Address Register (EL2), I don't seethis bit described anywhere. 
>> Do we really need this bit for MPU ?
>>
>
> Yes, It is introduced for software implementation.
> You could see commit [PATCH v3 36/52] xen/mpu: implememt ioremap_xxx 
> in MPU and commit [PATCH v3 38/52] xen/mpu: map domain page in MPU 
> system for better understanding.
>
>>
>> - Ayan
>>
>>>
>>>           write_protection_region((const pr_t*)(&xen_mpumap[idx]), 
>>> idx);
>>>       }
>>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>>> index 4f7daa7dca..f2715d7cb7 100644
>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -216,7 +216,10 @@ SECTIONS
>>>     _end = . ;
>>>
>>>     /* Section for the device tree blob (if any). */
>>> -  .dtb : { *(.dtb) } :text
>>> +  .dtb : {
>>> +      . = ALIGN(PAGE_SIZE);
>>> +      *(.dtb)
>>> +  } :text
>>>
>>>     DWARF2_DEBUG_SECTIONS
>>>
>>> -- 
>>> 2.25.1
>>>
>>>

