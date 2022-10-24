Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D928609F4B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428844.679396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuzp-0003Oh-P9; Mon, 24 Oct 2022 10:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428844.679396; Mon, 24 Oct 2022 10:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuzp-0003Mh-MK; Mon, 24 Oct 2022 10:47:53 +0000
Received: by outflank-mailman (input) for mailman id 428844;
 Mon, 24 Oct 2022 10:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1omuzo-00039L-Di
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:47:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d955513-5389-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 12:47:50 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 10:47:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 10:47:46 +0000
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
X-Inumbo-ID: 4d955513-5389-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKPK18TL43YTznMAZ0hpTLEBehJhD3PstFimnsvV99YguVcI0B63r2pSNKYiPaHvYrdw4/Uj0flii+VEAdVB07M6QoZxYa1Uj+2Si4AMoKh81KuCS9J5oiVtx6wCKzv008aWC0oN2RJohlvJx6B/wl09vhbTecwTotUus5faTkoilCqS3bxg5KDuOjOIf7trSDWOJQO0ZzFl4lsyy8r4Wj9RdFG6JVfjf+C8yCZNygCJ0IWpzYlEFth1BVPxVv5tI/kLT2Vlx9eL8/u7LcJxt6kkTQEgaL/czkc1+fIrvbQe/T91NU1rgTUxLO4O5bY5UdIm0jnv7Gvue6yCT6m4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNnGKL9Sez5Pv6RkaHdYhArAypCrVURdZJKj/LfAKok=;
 b=Py8OfBHRooUv9rfcqecJiXzfWWShrtlUpo+3HtBIcxR5IUhEiMYq48/agbrr2R6KVBqKCxD1212nJ+3hasJR9HJN9jjTFzSGgURP/feHEHnU0Yg44b+leHEkBntWxweID7pKrTwD11La02Go1G8IIs5LJQFNRokkw6ViZbFtticLDmU4rGeIdMjbnBIMWqvOggT5QJE/GnkYTzT1AfcyCgmZf9EOq3+nerhVzrag+HfH1p2jvzzH5uuBxC68/LfEOmIihl7QVtHUGRUleKv9+vBUZEXYlaVtFf41XTP7JGYfgu0SlE1hA2AAMn1rxTDOZhHJmCEIK6lS/IngqLv2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNnGKL9Sez5Pv6RkaHdYhArAypCrVURdZJKj/LfAKok=;
 b=nXpk0CISVVtTf9zFV4Ni1+qmSqECzsM+3UbNdQNiIm1AcKQwqgOa+8Q8PM7cn344x38WJ7weOIGYQZUtXGYxfdK8DDUs3KxSd63Zv9cypmQbSNMXZ4LaArJCGeTlvMg4HObPwDai5A8KxK3L++PEQmSAPHNAf2Hyn19t/oZnmzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e952fcd7-bab6-68ed-d884-6505e529a073@amd.com>
Date: Mon, 24 Oct 2022 11:47:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 03/12] Arm: GICv3: Enable vreg_reg64_* macros for
 AArch32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-4-ayankuma@amd.com>
 <19fc76cf-cdf2-0321-8336-7c5a7fb09406@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <19fc76cf-cdf2-0321-8336-7c5a7fb09406@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::13) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL0PR12MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2806e427-84b0-48fc-33d1-08dab5ad2f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vhSxpuhmXYEg0HT++Ip/zcTILb6tEz9/VOEFVWynDjTDm/DFNTiu9qXnQypQzI4bZMssXRko/PzsGLB8W2RmlzWu3/CocfjSgR6aSCplqTntXlSXvv+DqL6CAVJlDFrpDd2XEiCKylACGy7APwHHdK2Xs0K0aOlS5BZ+bhKZCxlALrlVj6jaPwuC/XOhK6KJ+2F+qiYuqhmgl1tXebrXhwox/Dpgu3OwC3K6tpsJ/P5r+b35xaBkS8c8cyspqAlhnQn7bymUxb1rTB8lhaiE1hbM5PqCcc1BiaX1HglRQu0+HdtGuFh3JMfwyKbd0nlWGB28dmI84USLq6J/vS4WnSticF2we3L0JnRd5SafBlAhua9uZzg0fL3MiEMUXh8VL0AEMWEGqe4JjtmRvBhi6YjLeU7zyolpdDnycrK4GItqZsONnuEtIpyERAXX5VB378dK9dzyjHM9nI5V7BykMDiq5WeGZrMA5JGB6VYGRQAbMgo/bLIOUg0eu0xW1I/92k1Bi86AtXukHvcmBa7+kyPLjnBKdkTmGSi3rkGM9bZR3ea5oso/mCTMe6jPX/w9+Avan7953AATbpdBrxzDowY2s3+w+cqhEj+Gr0EeiueTeeqQVW8Em+p58Ze5byPXkaZ6a0eCP1gTOSQegpKfykGzUkQwgVijhojzx1DQftbN3c3O/R5LlV5K3HyayR3Y2gZB8MoWSoeomUfOhNrRZfacIdJsLB9lgJQMOZj+1RRxz0MMfU6Oa8hlIo6hOztBVM9/RdtG63mOGODaBdEL0ftV4PsXpka69Af8YAMdbY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(451199015)(31686004)(6512007)(53546011)(316002)(26005)(36756003)(66476007)(4326008)(8676002)(66556008)(31696002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(6666004)(478600001)(6486002)(6506007)(83380400001)(38100700002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RGcFl1ZlFnZ2dCa05jYlY5T1R2RGFXRE9VTlY5dXZBQ3lUODFTVjBTS0lq?=
 =?utf-8?B?QTc5d0hUWXFTbG15dDVuQnJCZDZhaTM1SVQrOHBGM2V4N3RBdlF4bkZ5ZjFR?=
 =?utf-8?B?WDJwRXJUeEc1WHZrbXMzc1hrb2Evc1pWOS9EWVNKT2RUQVgyeGxKRGJMclJk?=
 =?utf-8?B?bFpSVTdaQ2JlUGdiSlF1OXVscDJBbzloNTdIdGduQTF1MzlTdE1KUi9ZRFpV?=
 =?utf-8?B?YUxJSzJkWHl3K2xHTm9yQnNLVFRNd0VSUnNQTXhwM3grSERLTHNqSTA1aEYy?=
 =?utf-8?B?VTJSc2xKRE9kWFNIWlNVYnlBUUZlV3ZUUzBiM1V0c2c1NnNoZWEyTHZEZnJa?=
 =?utf-8?B?RjhkcVAvcFhnVk9CbG9pK2pMS21BR09KVVFIVVUyMzI0SjhSL2ZIMnYwUndZ?=
 =?utf-8?B?T1VvcFgwaEFLRVNPdGFuS2IzSERvb05oOUFRRnhmR285WW1tQ0o5VEhXMnlx?=
 =?utf-8?B?MFYySDdsRXJnOStidkZHandFaitHTzVmTlFET0xtT1BnNXNhdlFCNVZsY3Vm?=
 =?utf-8?B?ZUJ3M1h4a2s4UHlZVXh1eVUzS25YVkRYdWxwUmVaam9aSVFRVkdWT2JBZTFi?=
 =?utf-8?B?a1JLb2hQWTFNU3NUTkpncUtzNjMzWWxsRjZVYklabHJrYXBTbWNYVHR1bHRq?=
 =?utf-8?B?Vjk0THc1SldQY0JpYVYySWVKN201NEFJSE8zdWtrZmEzTnlNZjh2OGg4Qlpy?=
 =?utf-8?B?eXdIc2cxa2dBM094M1k3MElJM1doQlo5TlU1N0s2UVZqck1UM01PWVlzVjlk?=
 =?utf-8?B?VU1Pb2VnUEhHSjhySW5zSnN2RDVnanpIT01oYUVpU01YL3NuaDZDTytzV3Uw?=
 =?utf-8?B?T2FxWFhmMzF3T2tkeHQ4Tm15RzYrK0xEdFJ6TFBuQkw2aW5MUmUzSWtzTTNn?=
 =?utf-8?B?Wk1JMFNJYTRmSUhLYjhMajhGbzNWYWFGMERDNkxwaUtMczV0Ulp6Y2ZHRCtr?=
 =?utf-8?B?U2tCOWtqMEU4RVJoRXF3UFRqeGJyU215RGJaV25IVy9XM3JGdlFQVUEwZGVk?=
 =?utf-8?B?VHZkRmx5Wk1HMng1QU4wOCtjL2RtNWlaQU5RUDJLM2VCL2dBQmZmSmFKRnM5?=
 =?utf-8?B?NEpIU0JQbUUzOWhJZytnWU1ZbjlnWjYyNmdaTmRsN0dsamhXeEhCZk5DM0c0?=
 =?utf-8?B?ZTdBWDlvcmp1a1JKbU1ENzR3N1RFT3U5Vk83ZmRZQXpqNks3MjN1OWM3VUtk?=
 =?utf-8?B?ZUMwRDJxYzhrejhPT0Y3cUhtcUxaN1prZEp6WWFQTmYrSkw2WFNkWEduaHpl?=
 =?utf-8?B?YU14ZzU0UlpwM2k1Z0RCVGxGbVhmVjU3YjNRb3NxRk0zTkVVUDFWNnE4K05R?=
 =?utf-8?B?Vm41TnZCMVBXMnI0cmxxeE51Q0dZZDZlS2tYcStVZC9BYWhRSGF0Q3RwRGxE?=
 =?utf-8?B?K2d1Y2dld3BKME81VVd6WjJRZ090SCtPMHp5S3FrSUpEalUwRXVkb3FyLzVV?=
 =?utf-8?B?REdvTkxjS1RaNzZoa3E1R3YxVER2SVlNTkRTUlRsMzZZUzlMc0ZRSHZjdWt3?=
 =?utf-8?B?ZE41NVhQNGNPTEd2NCtFVWVVVjFSVndsVklJUUZ5Qlg5RzZzeG5kNW1mOWRp?=
 =?utf-8?B?d2FTeWVzZkNGWEFEOWtoZWQ0aFFpUVpDbDJYbDQya2hNWnVKanh0VzdOTkQw?=
 =?utf-8?B?ejAzUWZTMXFBVzFUUHhMa2xDWG5zSmFFbU5PTzFRNGswTzlCbDhMakNFT2gw?=
 =?utf-8?B?djVXb2VFUUorMU5iSm0vOXJoNlhIQldwMzY2ZE5keVFGSFhheXF4SnFWNWRa?=
 =?utf-8?B?Y012ZnBZTW5QbjYrVHpZZG5JYSs3NTVqZGhXS2s5VmlCa1Z0Z3RpSzFkWCsz?=
 =?utf-8?B?ZDI4c0xJSmozVXVacGxacytaL2NoQnkxdnE5MVVWK3M2K0tBczRjY2ZqSDR4?=
 =?utf-8?B?OUQ2WWk0UEg4MkhldkROWDNOcWpBY2h0bGd6eUNSelB6TVpXUjlvVC8zdm9O?=
 =?utf-8?B?Y1lQcUZ5SklqNlErQndONzhaNkF2YWcyd3l3QWJpVXliYmtxOHVNdTM3bFFD?=
 =?utf-8?B?bTU5WmZtM2JTTDRIeE9uRFowcDJzNGIxOFhEd1RNMm1WZFZIQnVlL2k2ak5J?=
 =?utf-8?B?RGRKNzROQXhmdHEwK2FHaWRHTVRKbnNwRXZ3b24vWXhjSjNHUWNKaWk0ZzZq?=
 =?utf-8?Q?Dcynl2e5+j66nGHpxs1ZojuT1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2806e427-84b0-48fc-33d1-08dab5ad2f84
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:47:45.9852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCd8YwIOozq0SPblRF7nnuqwp2wPUqMUMbWzd2f/fzIB0dQy5xj23yfEFOcyqTn6cVzyLFH5aMjr+c0QqOTbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916


On 22/10/2022 11:13, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need some clarification.

>
> Title: The code you are modifying below is not GICv3 specific. I would 
> suggest the following title:
>
> xen/arm: vreg: Support vreg_reg64_* helpers on Aarch32
>
> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>> In some situations (eg GICR_TYPER), the hypervior may need to emulate
>> 64bit registers in aarch32 mode. In such situations, the hypervisor may
>> need to read/modify the lower or upper 32 bits of the 64 bit register.
>>
>> In aarch32, 64 bit is represented by unsigned long long. Thus, we need
>> to change the prototype accordingly.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>   xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/vreg.h 
>> b/xen/arch/arm/include/asm/vreg.h
>> index f26a70d024..ac6e702c5c 100644
>> --- a/xen/arch/arm/include/asm/vreg.h
>> +++ b/xen/arch/arm/include/asm/vreg.h
>> @@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct 
>> cpu_user_regs *regs, union hsr hsr
>>    * Note that the alignment fault will always be taken in the guest
>>    * (see B3.12.7 DDI0406.b).
>>    */
>> -static inline register_t vreg_reg_extract(unsigned long reg,
>> +static inline register_t vreg_reg_extract(unsigned long long reg,
>>                                             unsigned int offset,
>>                                             enum dabt_size size)
>>   {
>> @@ -105,7 +105,7 @@ static inline register_t 
>> vreg_reg_extract(unsigned long reg,
>>       return reg;
>>   }
>>   -static inline void vreg_reg_update(unsigned long *reg, register_t 
>> val,
>> +static inline void vreg_reg_update(unsigned long long *reg, 
>> register_t val,
>>                                      unsigned int offset,
>>                                      enum dabt_size size)
>>   {
>> @@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned long 
>> *reg, register_t val,
>>       *reg |= ((unsigned long)val & mask) << shift;
>>   }
>>   -static inline void vreg_reg_setbits(unsigned long *reg, register_t 
>> bits,
>> +static inline void vreg_reg_setbits(unsigned long long *reg, 
>> register_t bits,
>>                                       unsigned int offset,
>>                                       enum dabt_size size)
>>   {
>> @@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned long 
>> *reg, register_t bits,
>>       *reg |= ((unsigned long)bits & mask) << shift;
>>   }
>>   -static inline void vreg_reg_clearbits(unsigned long *reg, 
>> register_t bits,
>> +static inline void vreg_reg_clearbits(unsigned long long *reg, 
>> register_t bits,
>>                                         unsigned int offset,
>>                                         enum dabt_size size)
>>   {
>> @@ -149,7 +149,7 @@ static inline void 
>> vreg_reg##sz##_update(uint##sz##_t *reg,             \
>>                                            register_t 
>> val,                \
>>                                            const mmio_info_t 
>> *info)       \
>> { \
>> -    unsigned long tmp = 
>> *reg;                                           \
>> +    unsigned long long tmp = 
>> *reg;                                      \
>> \
>>       vreg_reg_update(&tmp, val, info->gpa & 
>> (offmask),                   \
>> info->dabt.size);                                   \
>> @@ -161,7 +161,7 @@ static inline void 
>> vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>>                                             register_t 
>> bits,              \
>>                                             const mmio_info_t 
>> *info)      \
>> { \
>> -    unsigned long tmp = 
>> *reg;                                           \
>> +    unsigned long long tmp = 
>> *reg;                                      \
>> \
>>       vreg_reg_setbits(&tmp, bits, info->gpa & 
>> (offmask),                 \
>> info->dabt.size);                                  \
>> @@ -173,7 +173,7 @@ static inline void 
>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>                                               register_t 
>> bits,            \
>>                                               const mmio_info_t 
>> *info)    \
>> { \
>> -    unsigned long tmp = 
>> *reg;                                           \
>> +    unsigned long long tmp = 
>> *reg;                                      \
>> \
>>       vreg_reg_clearbits(&tmp, bits, info->gpa & 
>> (offmask),               \
>> info->dabt.size);                                \
>> @@ -181,15 +181,8 @@ static inline void 
>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>       *reg = 
>> tmp;                                                         \
>>   }
>>   -/*
>> - * 64 bits registers are only supported on platform with 64-bit long.
>> - * This is also allow us to optimize the 32 bit case by using
>> - * unsigned long rather than uint64_t
>> - */
>
> The comment above explain why we never use uint64_t in the helpers 
> above. IIRC, the compiler would end up to use 2 registers on AArch32 
> even for the vreg_reg32_* helpers. I wanted to avoid that and would 
> like like to today. Can you check the code generated?

I am not sure I understood the comment very well.

With this patch, the disassembly is as follows :-

         vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
   28124c:   e597000c    ldr r0, [r7, #12]
VREG_REG_HELPERS(32, 0x3);
   281250:   e5d52002    ldrb    r2, [r5, #2]
   281254:   e1a02322    lsr r2, r2, #6
     unsigned long mask = VREG_REG_MASK(size);
   281258:   e3a03008    mov r3, #8
   28125c:   e1a03213    lsl r3, r3, r2
   281260:   e2633020    rsb r3, r3, #32
   281264:   e3e02000    mvn r2, #0
   281268:   e1a02332    lsr r2, r2, r3
VREG_REG_HELPERS(32, 0x3);
   28126c:   e5953010    ldr r3, [r5, #16]
   281270:   e2033003    and r3, r3, #3
     int shift = offset * 8;
   281274:   e1a03183    lsl r3, r3, #3
VREG_REG_HELPERS(32, 0x3);
   281278:   e59013f0    ldr r1, [r0, #1008] ; 0x3f0
   28127c:   e1c11312    bic r1, r1, r2, lsl r3
     *reg |= ((unsigned long)val & mask) << shift;
   281280:   e0022009    and r2, r2, r9
VREG_REG_HELPERS(32, 0x3);
   281284:   e1813312    orr r3, r1, r2, lsl r3
   281288:   e58033f0    str r3, [r0, #1008] ; 0x3f0
         v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
   28128c:   e597200c    ldr r2, [r7, #12]
   281290:   e59233f0    ldr r3, [r2, #1008] ; 0x3f0
   281294:   e2033001    and r3, r3, #1
   281298:   e58233f0    str r3, [r2, #1008] ; 0x3f0

Without the patch (ie original code) , the disassembly is :-

         vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
   27f8f4:   e597000c    ldr r0, [r7, #12]
VREG_REG_HELPERS(32, 0x3);
   27f8f8:   e5d52002    ldrb    r2, [r5, #2]
   27f8fc:   e1a02322    lsr r2, r2, #6
     unsigned long mask = VREG_REG_MASK(size);
   27f900:   e3a03008    mov r3, #8
   27f904:   e1a03213    lsl r3, r3, r2
   27f908:   e2633020    rsb r3, r3, #32
   27f90c:   e3e02000    mvn r2, #0
   27f910:   e1a02332    lsr r2, r2, r3
VREG_REG_HELPERS(32, 0x3);
   27f914:   e5953010    ldr r3, [r5, #16]
   27f918:   e2033003    and r3, r3, #3
     int shift = offset * 8;
   27f91c:   e1a03183    lsl r3, r3, #3
     *reg &= ~(mask << shift);
   27f920:   e5901400    ldr r1, [r0, #1024] ; 0x400
   27f924:   e1c11312    bic r1, r1, r2, lsl r3
     *reg |= ((unsigned long)val & mask) << shift;
   27f928:   e0022009    and r2, r2, r9
   27f92c:   e1813312    orr r3, r1, r2, lsl r3
VREG_REG_HELPERS(32, 0x3);
   27f930:   e5803400    str r3, [r0, #1024] ; 0x400
         v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
   27f934:   e597200c    ldr r2, [r7, #12]
   27f938:   e5923400    ldr r3, [r2, #1024] ; 0x400
   27f93c:   e2033001    and r3, r3, #1
   27f940:   e5823400    str r3, [r2, #1024] ; 0x400

Sorry, I can't spot the difference. :(

I had a look at commit 423e9ecdc26c4b40c8db1fcc63b3655463c29976 which 
introduced this. But I could not make out the reason from the commit 
message.

>
> For other options, I would consider to either:
>   1) Fold vreg_reg_* in the macros.

Can you explain this option a bit ?

- Ayan

>   2) Write a separate vreg_reg64_*
>
> My preference would be 1).
>
> If we are planning to keep the code with "unsigned long long", then I 
> think this should be addressed in the commit message.
>
>> -#if BITS_PER_LONG == 64
>> -VREG_REG_HELPERS(64, 0x7);
>> -#endif
>>   VREG_REG_HELPERS(32, 0x3);
>> +VREG_REG_HELPERS(64, 0x7);
>
> Regardless what I wrote above, the code movement seems to be unwarranted.
>>     #undef VREG_REG_HELPERS
>
> Cheers,
>

