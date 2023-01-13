Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261F766924C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476897.739324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG1M-0001Ym-CE; Fri, 13 Jan 2023 09:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476897.739324; Fri, 13 Jan 2023 09:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG1M-0001X2-9Q; Fri, 13 Jan 2023 09:06:44 +0000
Received: by outflank-mailman (input) for mailman id 476897;
 Fri, 13 Jan 2023 09:06:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGG1K-0001Ww-TR
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:06:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGG1J-0004u8-L5; Fri, 13 Jan 2023 09:06:41 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGG1J-0002Po-EF; Fri, 13 Jan 2023 09:06:41 +0000
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
	bh=fWx2t2vjKMyHxD03g44wYPIrZcah6J8RTFBmmy80OyA=; b=Wd8DAAT3pfpZVu1BJCIPCD/ESu
	ammoZJQUlsAKLmvYxBOriIVM16PPEDKdlKjM+Iiq8DFawrfGW6+dglWbu7bz1OtpsrUTzLc2rWWL+
	mSlVg6gIDo/PyG8eAlwjR1pha5T++rNalfwiyTXIE0BrCVbfmKCxSM0FlQoEyiSIG9Bk=;
Message-ID: <096b4129-ace6-01b6-85c1-b153d3bc4ada@xen.org>
Date: Fri, 13 Jan 2023 09:06:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-3-luca.fancellu@arm.com>
 <91b5c7db-ec9b-efa6-f5cf-dc5e8b176db6@xen.org>
 <9168CB2A-A1F1-43E0-9DAD-BB31AD3979E0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9168CB2A-A1F1-43E0-9DAD-BB31AD3979E0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 12/01/2023 10:54, Luca Fancellu wrote:
>> On 11 Jan 2023, at 17:27, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 11/01/2023 14:38, Luca Fancellu wrote:
>>> Add sve_vl_bits field to arch_domain and xen_arch_domainconfig
>>> structure, to allow the domain to have an information about the
>>> SVE feature and the number of SVE register bits that are allowed
>>> for this domain.
>>> The field is used also to allow or forbid a domain to use SVE,
>>> because a value equal to zero means the guest is not allowed to
>>> use the feature.
>>> When the guest is allowed to use SVE, the zcr_el2 register is
>>> updated on context switch to restict the domain on the allowed
>>> number of bits chosen, this value is the minimum among the chosen
>>> value and the platform supported value.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   xen/arch/arm/arm64/sve.c             |  9 ++++++
>>>   xen/arch/arm/domain.c                | 45 ++++++++++++++++++++++++++++
>>>   xen/arch/arm/include/asm/arm64/sve.h | 12 ++++++++
>>>   xen/arch/arm/include/asm/domain.h    |  6 ++++
>>>   xen/include/public/arch-arm.h        |  2 ++
>>>   xen/include/public/domctl.h          |  2 +-
>>>   6 files changed, 75 insertions(+), 1 deletion(-)
>>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>>> index 326389278292..b7695834f4ba 100644
>>> --- a/xen/arch/arm/arm64/sve.c
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -6,6 +6,7 @@
>>>    */
>>>     #include <xen/types.h>
>>> +#include <asm/cpufeature.h>
>>>   #include <asm/arm64/sve.h>
>>>   #include <asm/arm64/sysregs.h>
>>>   @@ -36,3 +37,11 @@ register_t vl_to_zcr(uint16_t vl)
>>>   {
>>>       return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
>>>   }
>>> +
>>> +/* Get the system sanitized value for VL in bits */
>>> +uint16_t get_sys_vl_len(void)
>>> +{
>>> +    /* ZCR_ELx len field is ((len+1) * 128) = vector bits length */
>>> +    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>>> +            SVE_VL_MULTIPLE_VAL;
>>> +}
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 8ea3843ea8e8..27f38729302b 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -13,6 +13,7 @@
>>>   #include <xen/wait.h>
>>>     #include <asm/alternative.h>
>>> +#include <asm/arm64/sve.h>
>>>   #include <asm/cpuerrata.h>
>>>   #include <asm/cpufeature.h>
>>>   #include <asm/current.h>
>>> @@ -183,6 +184,11 @@ static void ctxt_switch_to(struct vcpu *n)
>>>         WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>>>   +#ifdef CONFIG_ARM64_SVE
>>> +    if ( is_sve_domain(n->domain) )
>>> +        WRITE_SYSREG(n->arch.zcr_el2, ZCR_EL2);
>>> +#endif
>>
>> I would actually expect that is_sve_domain() returns false when the SVE is not enabled. So can we simply remove the #ifdef?
> 
> I was tricked by it too, the arm32 build will fail because it doesn’t know ZCR_EL2

Ok. In which case, I think we should move the call to sve_restore_state().

> 
>>
>>> +
>>>       /* VFP */
>>>       vfp_restore_state(n);
>>>   @@ -551,6 +557,11 @@ int arch_vcpu_create(struct vcpu *v)
>>>       v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>>>         v->arch.cptr_el2 = get_default_cptr_flags();
>>> +    if ( is_sve_domain(v->domain) )
>>> +    {
>>> +        v->arch.cptr_el2 &= ~HCPTR_CP(8);
>>> +        v->arch.zcr_el2 = vl_to_zcr(v->domain->arch.sve_vl_bits);
>>> +    }
>>>         v->arch.hcr_el2 = get_default_hcr_flags();
>>>   @@ -595,6 +606,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>       unsigned int max_vcpus;
>>>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>>>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
>>> +    unsigned int sve_vl_bits = config->arch.sve_vl_bits;
>>>         if ( (config->flags & ~flags_optional) != flags_required )
>>>       {
>>> @@ -603,6 +615,36 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>           return -EINVAL;
>>>       }
>>>   +    /* Check feature flags */
>>> +    if ( sve_vl_bits > 0 ) {
>>> +        unsigned int zcr_max_bits;
>>> +
>>> +        if ( !cpu_has_sve )
>>> +        {
>>> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
>>> +            return -EINVAL;
>>> +        }
>>> +        else if ( !is_vl_valid(sve_vl_bits) )
>>> +        {
>>> +            dprintk(XENLOG_INFO, "Unsupported SVE vector length (%u)\n",
>>> +                    sve_vl_bits);
>>> +            return -EINVAL;
>>> +        }
>>> +        /*
>>> +         * get_sys_vl_len() is the common safe value among all cpus, so if the
>>> +         * value specified by the user is above that value, use the safe value
>>> +         * instead.
>>> +         */
>>> +        zcr_max_bits = get_sys_vl_len();
>>> +        if ( sve_vl_bits > zcr_max_bits )
>>> +        {
>>> +            config->arch.sve_vl_bits = zcr_max_bits;
>>> +            dprintk(XENLOG_INFO,
>>> +                    "SVE vector length lowered to %u, safe value among CPUs\n",
>>> +                    zcr_max_bits);
>>> +        }
>>
>> I don't think Xen should "downgrade" the value. Instead, this should be the decision from the tools. So we want to find a different way to reproduce the value (Andrew may have some ideas here as he was looking at it).
> 
> Can you explain this in more details?

I would extend XEN_SYSCTL_physinfo to return the maximum SVE vecto 
length supported by the Hardware.

Libxl would then read the value and compare to what the user requested. 
This would then be up to the toolstack to decide what to do.

> By the tools you mean xl?

I think libxl should do strict checking. If we also want to reduce what 
the user requested, then this part should be in xl.

> This would be ok for DomUs, but how to do it for Dom0?
Then we should fail to create dom0 and say the vector-length requested 
is not supported.

Cheers,

-- 
Julien Grall

