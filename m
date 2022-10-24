Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCB260A767
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 14:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429085.679891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwtg-0007gc-59; Mon, 24 Oct 2022 12:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429085.679891; Mon, 24 Oct 2022 12:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwtg-0007ee-1Q; Mon, 24 Oct 2022 12:49:40 +0000
Received: by outflank-mailman (input) for mailman id 429085;
 Mon, 24 Oct 2022 12:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1omwte-0007eW-6J
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 12:49:38 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fba2e48-539a-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 14:49:36 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4921.namprd12.prod.outlook.com (2603:10b6:610:62::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 12:49:31 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 12:49:31 +0000
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
X-Inumbo-ID: 4fba2e48-539a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg7ULXFWVksvPXrzSgdQXRUfAFQBsBHO+nJhdGfRSsQ6wE5066UqPtdvmSMuZ1K+8hfIuwlS+Cbz82XMXtA42pFCRnzLUePebgd5OqHGCLqsjYclmjRimRgLiYlcl0zMZ3QZj1meq28q55AihaHrj13boO6aIT1OeFUvlXOuGPhNjKZkxyCyjk6PjXhQsNgL7alf7ExbGJqg/puFDH3+Q7x9KLFuDDgzUD5UzKRF9zK28nSZhsmfUQQ0w1wVgsvZzCuOxkjDaRfiaFPuGOkOfP+iNblslEA3s2bSCO2ep84czqdALppM+OLN4r7DD1O3lsPYbBFBallzUggqzlLCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2E6jJtujNJaUdC56zk3jKCTfbugn5oe+esTUanRLHw=;
 b=aPAlGCTspb/WzLuY1AWYEn/lVUq0gWH4+WKFjsT+roIZIuah5TPeECAbmTakaA1xrkQDN+GHVegB5twzao3N3AkD/EaO/0l9YSsE5/g6emY2wLScYeG6pmRzvK9g6jfeICusIs2+xoIL8JJ/fObMk+V0PtbNSxND5Kltyr4f3gjehHPJZIyKzDcqfwsvPDfqyoq0HNHeltotRsZM2z8zRjyjqZAtPAWykNXdklmUyyn2GCY3dOdIclxGDH9hhfAh/Qpg/IjKSjk3GxgLvTjKPevNznCdZxgZFAcSqErXD2iWCDyvcAUgEmwFWJi8WedNmdcAzW3PMP1Yi3pjTNJrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2E6jJtujNJaUdC56zk3jKCTfbugn5oe+esTUanRLHw=;
 b=J0ckd3m26xP26tMt3Jdnj1zkGkzl7uaohjcZawowrMR+UGQohxQiZ8AWqtzAro/bNkQgbU0UyjRHXH+HiK7/HPD+enrR4REaf2PvOmJc/rlbCEtRCnpeqE2Gy65t4R+sKdbHC/jOmF8oba64s8eIuGUdjYiSeUBkK/4Bsv3Rz4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a27873a3-3697-9a67-16aa-f4340dc622aa@amd.com>
Date: Mon, 24 Oct 2022 13:49:26 +0100
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
 <e952fcd7-bab6-68ed-d884-6505e529a073@amd.com>
 <b0b4fc69-3da3-3229-77d9-9fe0f4bf1ec3@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b0b4fc69-3da3-3229-77d9-9fe0f4bf1ec3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c943a36-8dd6-48d7-91c8-08dab5be31c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AtKRWquLlixidaK7TW7290PIsqqwpZIAqHecIIj/h6JdXLh6jA18Mh6nXs6rE0L1Y2cj64P9313GkwMxzgcUGIL/EfYQJlXZN9OmyJyhNKfgeEwHK49XX5ZxKdYhIQm6HG667IvEGjlSxi2vhkAiITogpwqLPZuf2t2dlREbFLO6dAqFFD2lGilL5MEGxGWeZjymjJqjlRRvRf7Yo8nHb66dHHnZc/S5xV+sZxnP6U8hsMIGtTavI5MLtCB7bQZgPNqPNqyo0HFGGZVDDsyAzw0UIkbl3dtQdIlNiWN57XEISZKhq7up505gm6Erf7NT8X2iOMlQ8NKbytUs7191DGPJSDMcJFJrXI4ViNs6xVbbPZt4nKwwrMHfTorkQfiT2iW5RqdnxRcmChcUPg35F90UwQ4JxKbLznGuszBKP6b1Tc19hIWDOZvD1ITdL4uY6hywCRlft108JU4Qzuz35ZyGXAzo8Ds+1K2xBfqt9rXeFucFwIxFZmGaRTBbb57SegqfGje0gA8NOrAHiP1FrFEv+VIJ5/Wja/wxHDWtZ+V5ddAsxwt2654+G4Y0Ehk8B5hx2z/kLReZs4riCtvkp+5tOFu9PkGxOfZni4ktPkCXUhndkl2acRriVtRpuQgUJIUzmWcI8fYRcd3Vzhai+C1yWm5Wa2gwdeApaSOzYNNo/bvmzEXNTLHzRmmAl/zMhuqyzo1i/jY2NH0Nx7QuAlF2QgrELaZ+pIj1YCLJPz/hABrWA6i0vrlOHDEe6/Ae6Q4FtvsOar2tMXKMkHUJ1Vj2JuCL+rqVIeIGJBhEPY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(31696002)(83380400001)(6486002)(31686004)(478600001)(53546011)(66946007)(66556008)(6666004)(4326008)(36756003)(6506007)(8676002)(6512007)(41300700001)(26005)(8936002)(5660300002)(38100700002)(2906002)(2616005)(186003)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm5TTU14NWVWOUNvaVpReFVmaXhZVXdnbXAyL2t1UTEyR3BybitSR2Q3WVlL?=
 =?utf-8?B?eDJqTDVUbXkzV0gxWFBOQ2liR3ZjeUlvckwxQzgzMGNVRktMSU1WY2djOGZ3?=
 =?utf-8?B?cFN4aVIwQnFFMG5taFArbHA5YkZIMlZWUnBOWWh4NE5LcEJkNm0zMVh0a2Vh?=
 =?utf-8?B?dUdtSjZ5SXRDT0ZnR1Y1dUloSW1aVkVPTFFPUFNGWGRpcXM5SjB3SmxqRDZG?=
 =?utf-8?B?MFZpTlBTQS9JSzhwN1NYT2hua2FoLzkrT2tLMm1BNGFZSGN4RlZ2Njl4WlRG?=
 =?utf-8?B?MVFKY1l2Sm9qaWxrSGlsamF0eWpMUGFEbDRSSWpKNE1TOXJta1I5Nm1CU0xS?=
 =?utf-8?B?RldZbEw2aEtURzk5dVBoaXBEeGs2TldKQnFidmlzRzZhUGQ4VUZPajF3NVFz?=
 =?utf-8?B?YnUxaG1kLzhFOVYrUnpoMlZVT0Z6dVEvNzZWb1hmWDBxRGkybnd4Ykh1SVhN?=
 =?utf-8?B?eVR3N3pqVW5GSTE5dVlGN2F3MkhFelhBWTdlZWI0OElhZGRBUlN4VTMwOFY1?=
 =?utf-8?B?N2ZnZjdTYjVjNjYxRzZqbTRudGtuUGxLUHFSRWhFaWh0RzcrWmp4V2Rkd3Zw?=
 =?utf-8?B?MU9nRThjMzdoQUJ6VEdhK0szVVJwYVIzdVlqVGpOeWIydGlpTGFaZUpJWlB2?=
 =?utf-8?B?SXFOWStDVnphVVFqMUJ6N1lYcmRIR2g4Mis1aVB0RFgxM2RQa0N1eW92WFNG?=
 =?utf-8?B?aUZUTVZUVm96azVBVzQxZU5ubjZSSm15VjdxVEFYZFQwc0dlbWsvKzM4bUhs?=
 =?utf-8?B?a0ZoNWlSbHkySUhNL0x3QUJqY0pJTDkwZFZrVzJVdmJYY2RxVkgxVnZsZ20v?=
 =?utf-8?B?UCsxaWNIelFtRFVMc1RhR080VFpxTzBINktoZnBkRUlwVjR0UlN3eXNXSE9p?=
 =?utf-8?B?QnRCREo4ZUhDaWlDUVJiZll3QVRpenJ2dnBWTHhQbUduUXZuWXJrUDZkRGVk?=
 =?utf-8?B?cGViM1AyVDhESlFXbGFjcHZSMDRaREZIN0pQTVY4UzBSSkREMzRkOU1PWFpF?=
 =?utf-8?B?dS94bEtnZ3prdzUxNGo2b0tHM3dVK2dwQXIwc2VuMVNiUmtmamJjc1JSS0Fi?=
 =?utf-8?B?Q05sbkRCY20zV0p4OUhkTVVLd1A3bUIxd0hSaGoxKzNjb1gwYTJvRm1xN1Zx?=
 =?utf-8?B?OXFpTXRnNFZSWS9abHRqZkxMSno2SWw3VG1pcysxUUJOWUxwMWUyS1d1K1Bt?=
 =?utf-8?B?ZzJCeENOd0Z2NmZVL0V0Z1lHQVRiYU8vRmdHbG9ZR1N6Y2lKcC9IRTYrelhK?=
 =?utf-8?B?cHAyaHBtOW1KamM5c2JLUUNCT1k2ZmNLVWhmT1pvTi9QcEt4YWd3Ui84UVNk?=
 =?utf-8?B?UnA3M2kwRnBicERUWU9EQWdOMWZzNWtmdnFZWjdpOEN1UytWaGdyYkg5aUg1?=
 =?utf-8?B?MkZvc1dDKzYrYVhFRnA5T3Rpb2pJdFp4WlQ5RHpMZThlTlBZZkowMCtDSlNJ?=
 =?utf-8?B?S2Nnb1NhVnFraVlFSWpiWDhNUjY2cTJhOWtmUStaWFdjanpmd3RKbHQzRk1r?=
 =?utf-8?B?NWF5WkVRRDhTV2htSGtaK0dha2hkZkJZbVZIa0VtWEh3TENGMm5CN2JGQWJX?=
 =?utf-8?B?QUhYSFBxc2ozQWJWb1lxV1BwWDliV2ZSZTFhaU1CS3JHUHBidFdPeTg0WWZv?=
 =?utf-8?B?R3N1ckdYSjFiWUFzVjI4Y1hVeEJjZUNCekF6OU1qbVpRNFV2dHZZWmxWVVQ3?=
 =?utf-8?B?b1F5VC9BaUxwSnRTWEEweW1wRFl1bzNHZ1A4dlYwWFNxT2h6Z1BDVXgzYXhF?=
 =?utf-8?B?dGsvQzJJV0hRNFVJVkZjUlBleWZCZk1xTE53S2FZbUN0U2h5VUFOTUhscE1r?=
 =?utf-8?B?R3RlUHVZTTBERlVwSnZtb1ZweVZVcmRFQkp4RjZmSzI2VFlWakxQWWdIWW1Q?=
 =?utf-8?B?WEFSdG1XTC9EYThZa3NCZGVHdFNXQlFNYng0aXFKTDloWFlnb3VFTkNFWmpy?=
 =?utf-8?B?aWlmanNXQTdpWjFQZ2ZaTGJHaW9PMXBiWkZwUnZTbGQzOVVLZldqUm5HbGJr?=
 =?utf-8?B?Yy90c2FScmtjaUU3VTVoZkNheWRuYlEvQW5nU1B0VTRsNFhzd1BZdnlCTUVx?=
 =?utf-8?B?amx6U2xvTjNzVUdxTmI0N3BGT0tKNnFOd3gwemphbEpzSFpoRWt1Ly9CbWJK?=
 =?utf-8?Q?JU0tA5/4c7J332oyvZt2qWAPn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c943a36-8dd6-48d7-91c8-08dab5be31c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:49:31.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtLqxbpBBLtyMnWm0nQOV8D5OH8HPxKaFgTrS+p0I0YAfcfsdYjPI6Wd/tMYy2QY0oYp5Plmt05ny62iAf8Q0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4921


On 24/10/2022 12:01, Julien Grall wrote:
>
>
> On 24/10/2022 11:47, Ayan Kumar Halder wrote:
>>
>> On 22/10/2022 11:13, Julien Grall wrote:
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> I need some clarification.
>>
>>>
>>> Title: The code you are modifying below is not GICv3 specific. I 
>>> would suggest the following title:
>>>
>>> xen/arm: vreg: Support vreg_reg64_* helpers on Aarch32
>>>
>>> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>>>> In some situations (eg GICR_TYPER), the hypervior may need to emulate
>>>> 64bit registers in aarch32 mode. In such situations, the hypervisor 
>>>> may
>>>> need to read/modify the lower or upper 32 bits of the 64 bit register.
>>>>
>>>> In aarch32, 64 bit is represented by unsigned long long. Thus, we need
>>>> to change the prototype accordingly.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>   xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
>>>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/vreg.h 
>>>> b/xen/arch/arm/include/asm/vreg.h
>>>> index f26a70d024..ac6e702c5c 100644
>>>> --- a/xen/arch/arm/include/asm/vreg.h
>>>> +++ b/xen/arch/arm/include/asm/vreg.h
>>>> @@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct 
>>>> cpu_user_regs *regs, union hsr hsr
>>>>    * Note that the alignment fault will always be taken in the guest
>>>>    * (see B3.12.7 DDI0406.b).
>>>>    */
>>>> -static inline register_t vreg_reg_extract(unsigned long reg,
>>>> +static inline register_t vreg_reg_extract(unsigned long long reg,
>>>>                                             unsigned int offset,
>>>>                                             enum dabt_size size)
>>>>   {
>>>> @@ -105,7 +105,7 @@ static inline register_t 
>>>> vreg_reg_extract(unsigned long reg,
>>>>       return reg;
>>>>   }
>>>>   -static inline void vreg_reg_update(unsigned long *reg, 
>>>> register_t val,
>>>> +static inline void vreg_reg_update(unsigned long long *reg, 
>>>> register_t val,
>>>>                                      unsigned int offset,
>>>>                                      enum dabt_size size)
>>>>   {
>>>> @@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned 
>>>> long *reg, register_t val,
>>>>       *reg |= ((unsigned long)val & mask) << shift;
>>>>   }
>>>>   -static inline void vreg_reg_setbits(unsigned long *reg, 
>>>> register_t bits,
>>>> +static inline void vreg_reg_setbits(unsigned long long *reg, 
>>>> register_t bits,
>>>>                                       unsigned int offset,
>>>>                                       enum dabt_size size)
>>>>   {
>>>> @@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned 
>>>> long *reg, register_t bits,
>>>>       *reg |= ((unsigned long)bits & mask) << shift;
>>>>   }
>>>>   -static inline void vreg_reg_clearbits(unsigned long *reg, 
>>>> register_t bits,
>>>> +static inline void vreg_reg_clearbits(unsigned long long *reg, 
>>>> register_t bits,
>>>>                                         unsigned int offset,
>>>>                                         enum dabt_size size)
>>>>   {
>>>> @@ -149,7 +149,7 @@ static inline void 
>>>> vreg_reg##sz##_update(uint##sz##_t *reg,             \
>>>>                                            register_t 
>>>> val,                \
>>>>                                            const mmio_info_t 
>>>> *info)       \
>>>> { \
>>>> -    unsigned long tmp = 
>>>> *reg;                                           \
>>>> +    unsigned long long tmp = 
>>>> *reg;                                      \
>>>> \
>>>>       vreg_reg_update(&tmp, val, info->gpa & 
>>>> (offmask),                   \
>>>> info->dabt.size);                                   \
>>>> @@ -161,7 +161,7 @@ static inline void 
>>>> vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>>>>                                             register_t 
>>>> bits,              \
>>>>                                             const mmio_info_t 
>>>> *info)      \
>>>> { \
>>>> -    unsigned long tmp = 
>>>> *reg;                                           \
>>>> +    unsigned long long tmp = 
>>>> *reg;                                      \
>>>> \
>>>>       vreg_reg_setbits(&tmp, bits, info->gpa & 
>>>> (offmask),                 \
>>>> info->dabt.size);                                  \
>>>> @@ -173,7 +173,7 @@ static inline void 
>>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>>                                               register_t 
>>>> bits,            \
>>>>                                               const mmio_info_t 
>>>> *info)    \
>>>> { \
>>>> -    unsigned long tmp = 
>>>> *reg;                                           \
>>>> +    unsigned long long tmp = 
>>>> *reg;                                      \
>>>> \
>>>>       vreg_reg_clearbits(&tmp, bits, info->gpa & 
>>>> (offmask),               \
>>>> info->dabt.size);                                \
>>>> @@ -181,15 +181,8 @@ static inline void 
>>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>>       *reg = tmp; \
>>>>   }
>>>>   -/*
>>>> - * 64 bits registers are only supported on platform with 64-bit long.
>>>> - * This is also allow us to optimize the 32 bit case by using
>>>> - * unsigned long rather than uint64_t
>>>> - */
>>>
>>> The comment above explain why we never use uint64_t in the helpers 
>>> above. IIRC, the compiler would end up to use 2 registers on AArch32 
>>> even for the vreg_reg32_* helpers. I wanted to avoid that and would 
>>> like like to today. Can you check the code generated?
>>
>> I am not sure I understood the comment very well.
>>
>> With this patch, the disassembly is as follows :-
>>
>>          vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
>>    28124c:   e597000c    ldr r0, [r7, #12]
>> VREG_REG_HELPERS(32, 0x3);
>>    281250:   e5d52002    ldrb    r2, [r5, #2]
>>    281254:   e1a02322    lsr r2, r2, #6
>>      unsigned long mask = VREG_REG_MASK(size);
>
> Hmmm... Shouldn't this be "unsigned long long"?

The function looks like

static inline void vreg_reg_update(unsigned long long *reg, register_t val,
                                    unsigned int offset,
                                    enum dabt_size size)
{
     unsigned long mask = VREG_REG_MASK(size);
     int shift = offset * 8;

     *reg &= ~(mask << shift);
     *reg |= ((unsigned long)val & mask) << shift;
}

>
>>    281258:   e3a03008    mov r3, #8
>>    28125c:   e1a03213    lsl r3, r3, r2
>>    281260:   e2633020    rsb r3, r3, #32
>>    281264:   e3e02000    mvn r2, #0
>>    281268:   e1a02332    lsr r2, r2, r3
>> VREG_REG_HELPERS(32, 0x3);
>>    28126c:   e5953010    ldr r3, [r5, #16]
>>    281270:   e2033003    and r3, r3, #3
>>      int shift = offset * 8;
>>    281274:   e1a03183    lsl r3, r3, #3
>> VREG_REG_HELPERS(32, 0x3);
>>    281278:   e59013f0    ldr r1, [r0, #1008] ; 0x3f0
>>    28127c:   e1c11312    bic r1, r1, r2, lsl r3
>>      *reg |= ((unsigned long)val & mask) << shift;
>>    281280:   e0022009    and r2, r2, r9
>> VREG_REG_HELPERS(32, 0x3);
>>    281284:   e1813312    orr r3, r1, r2, lsl r3
>>    281288:   e58033f0    str r3, [r0, #1008] ; 0x3f0
>>          v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
>>    28128c:   e597200c    ldr r2, [r7, #12]
>>    281290:   e59233f0    ldr r3, [r2, #1008] ; 0x3f0
>>    281294:   e2033001    and r3, r3, #1
>>    281298:   e58233f0    str r3, [r2, #1008] ; 0x3f0
>>
>> Without the patch (ie original code) , the disassembly is :-
>>
>>          vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
>>    27f8f4:   e597000c    ldr r0, [r7, #12]
>> VREG_REG_HELPERS(32, 0x3);
>>    27f8f8:   e5d52002    ldrb    r2, [r5, #2]
>>    27f8fc:   e1a02322    lsr r2, r2, #6
>>      unsigned long mask = VREG_REG_MASK(size);
>>    27f900:   e3a03008    mov r3, #8
>>    27f904:   e1a03213    lsl r3, r3, r2
>>    27f908:   e2633020    rsb r3, r3, #32
>>    27f90c:   e3e02000    mvn r2, #0
>>    27f910:   e1a02332    lsr r2, r2, r3
>> VREG_REG_HELPERS(32, 0x3);
>>    27f914:   e5953010    ldr r3, [r5, #16]
>>    27f918:   e2033003    and r3, r3, #3
>>      int shift = offset * 8;
>>    27f91c:   e1a03183    lsl r3, r3, #3
>>      *reg &= ~(mask << shift);
>>    27f920:   e5901400    ldr r1, [r0, #1024] ; 0x400
>>    27f924:   e1c11312    bic r1, r1, r2, lsl r3
>>      *reg |= ((unsigned long)val & mask) << shift;
>>    27f928:   e0022009    and r2, r2, r9
>>    27f92c:   e1813312    orr r3, r1, r2, lsl r3
>> VREG_REG_HELPERS(32, 0x3);
>>    27f930:   e5803400    str r3, [r0, #1024] ; 0x400
>>          v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
>>    27f934:   e597200c    ldr r2, [r7, #12]
>>    27f938:   e5923400    ldr r3, [r2, #1024] ; 0x400
>>    27f93c:   e2033001    and r3, r3, #1
>>    27f940:   e5823400    str r3, [r2, #1024] ; 0x400
>>
>> Sorry, I can't spot the difference. :(
>
> If there is no difference, then it is a good sign. I was worried that 
> the compiler would end up to use "strd/ldrd" which would result to 
> more register allocations and therefore inefficient code.
>
> But see above.
>
>>
>> I had a look at commit 423e9ecdc26c4b40c8db1fcc63b3655463c29976 which 
>> introduced this. But I could not make out the reason from the commit 
>> message.
>
> The reasoning would be to show that the assembly is either the same or 
> no worse that then existing one with a few compilers.
>
>>
>>>
>>> For other options, I would consider to either:
>>>   1) Fold vreg_reg_* in the macros.
>>
>> Can you explain this option a bit ?
>
> At the moment, we have generic helpers for vreg_reg_*. They are only 
> called within the helper generated by VREG_REG_HELPERS().
>
> If we make those helpers size specific, then the only the 64-bit 
> helpers would use uint64_t local variables.
>
> As they are only called in one place, we could fold them in the 
> existing helpers.

Just to make sure, I understand this. The code would look like below


#define VREG_REG_HELPERS(type, offmask)                         \

static inline void vreg_reg_##type##_update(type *reg, register_t val, 
        \

     const mmio_info_t *info)        \

{                                                  \

unsigned long mask = VREG_REG_MASK(size);                     \

unsigned int offset = info->gpa & (offmask);                             
       \

int shift = offset * 8;                                            \

*reg &= ~(mask << shift);                                            \
*reg |= ((unsigned long)val & mask) << shift;                         
           \

}


#define vreg_reg_update(reg, val, info)     \

do {                        \

     if (sizeof(reg) == 4)                 \

           vreg_reg_uint32_t_update(reg, val, info);                \

     else if (sizeof(reg) == 8)               \

         vreg_reg_uint64_t_update(reg, val, info);              \

     else                           \

         BUG();                        \

} while(0);                           \


Similar implementation will be for vreg_reg_clearbits(), 
vreg_reg_setbits() and vreg_reg_extract()


VREG_REG_HELPERS(uint32_t, 0x3);

VREG_REG_HELPERS(uint64_t, 0x7);


And the functions would be invoked as follows :-

vreg_update(&priority, r, info);

Is this the correct understanding ?

>
> Cheers,
>

