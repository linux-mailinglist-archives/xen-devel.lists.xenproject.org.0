Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A704E709E95
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 19:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537226.836165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q04Hh-00069d-1E; Fri, 19 May 2023 17:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537226.836165; Fri, 19 May 2023 17:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q04Hg-00067J-Uu; Fri, 19 May 2023 17:52:56 +0000
Received: by outflank-mailman (input) for mailman id 537226;
 Fri, 19 May 2023 17:52:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q04Hf-00067D-So
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 17:52:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q04Hf-0001x8-Cc; Fri, 19 May 2023 17:52:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.127]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q04Hf-0003UG-6k; Fri, 19 May 2023 17:52:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=OFAmjKXftJ4RBA1ryqRaIdThFbC4gw18/FRgeaN8hg4=; b=tVtXrYf8MtPH2icEtvRD9C6h5I
	xuHdIdefsPtcytILybeE8ndNdHJk/BPBK6iEmUuY6cG50n4crkBnQa6qYJy2fZ2oGwcznZFxHseEr
	N6H5xQbP4MRsjpb+HU7+m+wRF9wXbgFRicEcpigL5wjybxuWfMVvHTVVaGtGR9RBlgIE=;
Message-ID: <df689411-07dd-30fe-2ded-4c68b0313a81@xen.org>
Date: Fri, 19 May 2023 18:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
 <d735e539-a8ad-0c14-2eda-22fbad19191f@xen.org>
 <57A30CAD-678F-45F8-93A5-7CB65764E26D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <57A30CAD-678F-45F8-93A5-7CB65764E26D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/05/2023 18:35, Luca Fancellu wrote:
> 
> 
>> On 18 May 2023, at 19:27, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 24/04/2023 07:02, Luca Fancellu wrote:
>>> Save/restore context switch for SVE, allocate memory to contain
>>> the Z0-31 registers whose length is maximum 2048 bits each and
>>> FFR who can be maximum 256 bits, the allocated memory depends on
>>> how many bits is the vector length for the domain and how many bits
>>> are supported by the platform.
>>> Save P0-15 whose length is maximum 256 bits each, in this case the
>>> memory used is from the fpregs field in struct vfp_state,
>>> because V0-31 are part of Z0-31 and this space would have been
>>> unused for SVE domain otherwise.
>>> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
>>> creation given the requested vector length and restore it on
>>> context switch, save/restore ZCR_EL1 value as well.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes from v5:
>>>   - use XFREE instead of xfree, keep the headers (Julien)
>>>   - Avoid math computation for every save/restore, store the computation
>>>     in struct vfp_state once (Bertrand)
>>>   - protect access to v->domain->arch.sve_vl inside arch_vcpu_create now
>>>     that sve_vl is available only on arm64
>>> Changes from v4:
>>>   - No changes
>>> Changes from v3:
>>>   - don't use fixed len types when not needed (Jan)
>>>   - now VL is an encoded value, decode it before using.
>>> Changes from v2:
>>>   - No changes
>>> Changes from v1:
>>>   - No changes
>>> Changes from RFC:
>>>   - Moved zcr_el2 field introduction in this patch, restore its
>>>     content inside sve_restore_state function. (Julien)
>>> ---
>>>   xen/arch/arm/arm64/sve-asm.S             | 141 +++++++++++++++++++++++
>>>   xen/arch/arm/arm64/sve.c                 |  63 ++++++++++
>>>   xen/arch/arm/arm64/vfp.c                 |  79 +++++++------
>>>   xen/arch/arm/domain.c                    |   9 ++
>>>   xen/arch/arm/include/asm/arm64/sve.h     |  13 +++
>>>   xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
>>>   xen/arch/arm/include/asm/arm64/vfp.h     |  12 ++
>>>   xen/arch/arm/include/asm/domain.h        |   2 +
>>>   8 files changed, 288 insertions(+), 34 deletions(-)
>>> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
>>> index 4d1549344733..8c37d7bc95d5 100644
>>> --- a/xen/arch/arm/arm64/sve-asm.S
>>> +++ b/xen/arch/arm/arm64/sve-asm.S
>>
>> Are all the new helpers added in this patch taken from Linux? If so, it would be good to clarify this (again) in the commit message as it helps for the review (I can diff with Linux rather than properly reviewing them).
>>
>>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>>> index 86a5e617bfca..064832b450ff 100644
>>> --- a/xen/arch/arm/arm64/sve.c
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -5,6 +5,8 @@
>>>    * Copyright (C) 2022 ARM Ltd.
>>>    */
>>>   +#include <xen/sched.h>
>>> +#include <xen/sizes.h>
>>>   #include <xen/types.h>
>>>   #include <asm/arm64/sve.h>
>>>   #include <asm/arm64/sysregs.h>
>>> @@ -13,6 +15,24 @@
>>>   #include <asm/system.h>
>>>     extern unsigned int sve_get_hw_vl(void);
>>> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
>>> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
>>> +                         int restore_ffr);
>>
>>  From the use, it is not entirely what restore_ffr/save_ffr is meant to be. Are they bool? If so, maybe use bool? At mimimum, they probably want to be unsigned int.
> 
> I have to say that I trusted the Linux implementation here, in arch/rm64/include/asm/fpsimd.h, that uses int:

Ah, so this is a verbatim copy of the Linux code? If so...

> 
> extern void sve_save_state(void *state, u32 *pfpsr, int save_ffr);
> extern void sve_load_state(void const *state, u32 const *pfpsr,
> int restore_ffr);
> 
> But if you prefer I can put unsigned int instead.

... keep it as-is (Linux seems to like using 'int' for bool) but I would 
suggest to document the expected values.

> 
>>
>>> +
>>> +static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
>>> +{
>>> +    /*
>>> +     * Z0-31 registers size in bytes is computed from VL that is in bits, so VL
>>> +     * in bytes is VL/8.
>>> +     */
>>> +    return (vl / 8U) * 32U;
>>> +}
>>> +
>>> +static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
>>> +{
>>> +    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
>>> +    return (vl / 64U);
>>> +}
>>>     register_t compute_max_zcr(void)
>>>   {
>>> @@ -60,3 +80,46 @@ unsigned int get_sys_vl_len(void)
>>>       return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>>>               SVE_VL_MULTIPLE_VAL;
>>>   }
>>> +
>>> +int sve_context_init(struct vcpu *v)
>>> +{
>>> +    unsigned int sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
>>> +    uint64_t *ctx = _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
>>> +                             sve_ffrreg_ctx_size(sve_vl_bits),
>>> +                             L1_CACHE_BYTES);
>>> +
>>> +    if ( !ctx )
>>> +        return -ENOMEM;
>>> +
>>> +    /* Point to the end of Z0-Z31 memory, just before FFR memory */
>>
>> NIT: I would add that the logic should be kept in sync with sve_context_free(). Same...
>>
>>> +    v->arch.vfp.sve_zreg_ctx_end = ctx +
>>> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +void sve_context_free(struct vcpu *v)
>>> +{
>>> +    unsigned int sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
>>> +
>>> +    /* Point back to the beginning of Z0-Z31 + FFR memory */
>>
>> ... here (but with sve_context_init()). So it is clearer that if the logic change in one place then it needs to be changed in the other.
> 
> Sure I will
> 
>>
>>> +    v->arch.vfp.sve_zreg_ctx_end -=
>>> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
>>
>>  From my understanding, sve_context_free() could be called with sve_zreg_ctxt_end equal to NULL (i.e. because sve_context_init() failed). So wouldn't we end up to substract the value to NULL and therefore...
>>
>>> +
>>> +    XFREE(v->arch.vfp.sve_zreg_ctx_end);
>>
>> ... free a random pointer?
> 
> Thank you for spotting this, I will surround the operations in sve_context_free by:
> 
> if ( v->arch.vfp.sve_zreg_ctx_end )

Rather than surrounding, how about adding:

if ( !v->arch.vfp...)
   return;

This would avoid an extra indentation.

> 
> I’m assuming the memory should be zero initialised for the vfp structure, please
> correct me if I’m wrong.

This is part of the struct vcpu. So yes (see alloc_vcpu_struct()).

[...]

>>> index 143359d0f313..24c722a4a11e 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -552,7 +552,14 @@ int arch_vcpu_create(struct vcpu *v)
>>>         v->arch.cptr_el2 = get_default_cptr_flags();
>>>       if ( is_sve_domain(v->domain) )
>>> +    {
>>> +        if ( (rc = sve_context_init(v)) != 0 )
>>> +            goto fail;
>>>           v->arch.cptr_el2 &= ~HCPTR_CP(8);
>>> +#ifdef CONFIG_ARM64_SVE
>>
>> This #ifdef reads a bit odd to me because you are protecting v->arch.zcr_el2 but not the rest. This is one of the case where I would surround the full if with the #ifdef because it makes clearer that there is no way the rest of the code can be reached if !CONFIG_ARM64_SVE.
>>
>> That said, I would actually prefer if...
>>
>>> +        v->arch.zcr_el2 = vl_to_zcr(sve_decode_vl(v->domain->arch.sve_vl));
>>
>> ... this line is moved in sve_context_init() because this is related to the SVE context.
> 
> Sure I will do that, so if I’ve understood correctly, you want me to keep this:
> 
> 
> v->arch.cptr_el2 = get_default_cptr_flags();
> if ( is_sve_domain(v->domain) )
> {
>      if ( (rc = sve_context_init(v)) != 0 )
>          goto fail;
>      v->arch.cptr_el2 &= ~HCPTR_CP(8);
> }
> 
> Without #ifdef CONFIG_ARM64_SVE

Yes please.

-- 
Julien Grall

