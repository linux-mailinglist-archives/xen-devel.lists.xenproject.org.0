Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849C2483BF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 13:23:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7zht-00032M-A5; Tue, 18 Aug 2020 11:23:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5IsI=B4=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1k7zhs-00032H-0D
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 11:23:08 +0000
X-Inumbo-ID: 00421497-b13e-4197-8424-27968a0980b1
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 00421497-b13e-4197-8424-27968a0980b1;
 Tue, 18 Aug 2020 11:23:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CAD31B;
 Tue, 18 Aug 2020 04:23:03 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 350723F6CF;
 Tue, 18 Aug 2020 04:23:02 -0700 (PDT)
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Steve Capper <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 nd <nd@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
 <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
 <ba38efd7-2fdd-e354-7a24-bcd67f9793b2@arm.com>
 <D52E4104-F43D-4A8D-A135-79569EC0BDDA@arm.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <f475e3f7-f820-7bd8-4b41-b8378ec7faaf@arm.com>
Date: Tue, 18 Aug 2020 12:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <D52E4104-F43D-4A8D-A135-79569EC0BDDA@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/08/2020 11:13, Bertrand Marquis wrote:

Hi,

>> On 18 Aug 2020, at 10:42, André Przywara <andre.przywara@arm.com> wrote:
>>
>> On 18/08/2020 10:25, Bertrand Marquis wrote:
>>
>> Hi,
>>
>>>> On 18 Aug 2020, at 10:14, André Przywara <andre.przywara@arm.com> wrote:
>>>>
>>>> On 18/08/2020 04:11, Wei Chen wrote:
>>>>
>>>> Hi Wei,
>>>>
>>>>> Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
>>>>> FP/SIMD or not. But currently, this two MACROs only consider value 0
>>>>> of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
>>>>> that support FP/SIMD and half-precision floating-point features, the
>>>>> ID_AA64PFR0_EL1.FP/SIMD are 1. For these CPUs, xen will treat them as
>>>>> no FP/SIMD support. In this case, the vfp_save/restore_state will not
>>>>> take effect.
>>>>>
>>>>> Unfortunately, Cortex-N1/A76/A75 are the CPUs support FP/SIMD and
>>>>> half-precision floatiing-point. Their ID_AA64PFR0_EL1.FP/SMID are 1
>>>>> (see Arm ARM DDI0487F.b, D13.2.64). In this case, on N1/A76/A75
>>>>> platforms, Xen will always miss the float pointer registers save/restore.
>>>>> If different vCPUs are running on the same pCPU, the float pointer
>>>>> registers will be corrupted randomly.
>>>>
>>>> That's a good catch, thanks for working this out!
>>>>
>>>> One thing below...
>>>>
>>>>> This patch fixes Xen on these new cores.
>>>>>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> ---
>>>>> xen/include/asm-arm/cpufeature.h | 4 ++--
>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
>>>>> index 674beb0353..588089e5ae 100644
>>>>> --- a/xen/include/asm-arm/cpufeature.h
>>>>> +++ b/xen/include/asm-arm/cpufeature.h
>>>>> @@ -13,8 +13,8 @@
>>>>> #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
>>>>> #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
>>>>> #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
>>>>> -#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
>>>>> -#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
>>>>> +#define cpu_has_fp        (boot_cpu_feature64(fp) <= 1)
>>>>> +#define cpu_has_simd      (boot_cpu_feature64(simd) <= 1)
>>>>
>>>> But this is only good until the next feature bump. I think we should be
>>>> more future-proof here. The architecture describes those two fields as
>>>> "signed"[1], and guarantees that "if value >= 0" is a valid test for the
>>>> feature. Which means we are good as long as the sign bit (bit 3) is
>>>> clear, which translates into:
>>>> #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
>>>> Same for simd.
>>>>
>>>
>>> We cannot really be sure that a new version introduced will require the
>>> same context save/restore so it might dangerous to claim we support
>>> something we have no idea about.
>>
>> I am pretty sure we can, because this is what the FP feature describes.
>> If a feature bump would introduce a larger state to be saved and
>> restored, that would be covered by a new field, look at AdvSIMD and SVE
>> for examples.
>> The feature number would only be bumped if it's compatible:
>> ====================
>> · The field holds a signed value.
>> · The field value 0xF indicates that the feature is not implemented.
>> · The field value 0x0 indicates that the feature is implemented.
>> · Software that depends on the feature can use the test:
>>      if value >= 0 {  // Software features that depend on the presence
>> of the hardware feature }
>> ====================
>> (ARMv8 ARM D13.1.3)
>>
>> And this is how Linux handles this.
> 
> Then changing the code to use <8 should be ok.

Thanks. Another angle to look at this:
Using "< 8" will never be worse than "<= 1", since we only derive the
existence of the floating point registers from it. The moment we see a 2
in this register field, the "<= 1" would definitely fail to save/restore
the FP registers again. But the ARM ARM guarantees that those registers
are still around (since "value >= 0" hits, so the feature is present, as
shown above).
The theoretical worst case with "< 8" would be that it would not cover
*enough* state, but as described above this will never happen, with this
particular FP/SIMD field.

Cheers,
Andre

>>> I agree though about the analysis on the fact that values under 8 should
>>> be valid but only 0 and 1 currently exist [1], other values are reserved.
>>>
>>> So I would vote to keep the 1 for now there.
>>>
>>> Cheers
>>> Bertrand
>>>
>>> [1] https://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/id_aa64pfr0_el1
> 


