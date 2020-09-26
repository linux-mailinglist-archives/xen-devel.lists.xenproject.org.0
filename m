Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7D279963
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 15:01:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kM9oT-0004Gt-2G; Sat, 26 Sep 2020 13:00:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kM9oQ-0004Go-SU
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 13:00:26 +0000
X-Inumbo-ID: a60ce5bb-2a5e-4c81-9412-e05cfb011e75
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a60ce5bb-2a5e-4c81-9412-e05cfb011e75;
 Sat, 26 Sep 2020 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=hvEwiQi29S6aVaqAhRPCXwpDOgYnXRiBjnTaKCWiB84=; b=1RaLaiWM8Mv/ss0MLKGoHehNPG
 D9Ie8yuVLPBAg4Z+HKzgDEdzplVRI0zO5ecDrH6g8ZE7fAAWVnZ9An8HXtl16Ul70/ufgVkZzcfsC
 coki0X01cwcCYW4d5j4r5efQCmj9KJ9RDiFOibVlpW7mQfIO9t3sYMMzhPrfDfsowwP0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kM9oJ-0006gV-Tr; Sat, 26 Sep 2020 13:00:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kM9oJ-0007CK-Ic; Sat, 26 Sep 2020 13:00:19 +0000
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
 <a2e1773d-cb01-fa02-334a-a642f9316b57@citrix.com>
 <d80519d8-6699-7beb-9192-0e87623b0b62@xen.org>
 <bc50c5cd-d239-60a4-0a66-790717de5815@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ff006b75-73d2-ae21-1811-fbd5c9c244c7@xen.org>
Date: Sat, 26 Sep 2020 14:00:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bc50c5cd-d239-60a4-0a66-790717de5815@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Andrew,

On 22/09/2020 19:56, Andrew Cooper wrote:
> On 22/09/2020 19:20, Julien Grall wrote:
>>>> +
>>>>    #endif /* __ASM_DOMAIN_H__ */
>>>>      /*
>>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>>> index 5c5e55ebcb76..7564df5e8374 100644
>>>> --- a/xen/include/public/domctl.h
>>>> +++ b/xen/include/public/domctl.h
>>>> @@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
>>>>        uint64_aligned_t outstanding_pages;
>>>>        uint64_aligned_t shr_pages;
>>>>        uint64_aligned_t paged_pages;
>>>> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
>>>
>>> We've already got INVALID_GFN as a constant used in the interface.  Lets
>>> not proliferate more.
>>
>> This was my original approach (see [1]) but this was reworked because:
>>     1) INVALID_GFN is not technically defined in the ABI. So the
>> toolstack has to hardcode the value in the check.
>>     2) The value is different between 32-bit and 64-bit Arm as
>> INVALID_GFN is defined as an unsigned long.
>>
>> So providing a new define is the right way to go.
> 
> There is nothing special about this field.  It should not have a
> dedicated constant, when a general one is the appropriate one to use.
> 
> libxl already has LIBXL_INVALID_GFN, which is already used.

Right, but that's imply it cannot be used by libxc as this would be a 
layer violation.

> 
> If this isn't good enough, them the right thing to do is put a proper
> INVALID_GFN in the tools interface.

That would be nice but I can see some issue on x86 given that we don't 
consistenly define a GFN in the interface as a 64-bit value.

So would you still be happy to consider introducing XEN_INVALID_GFN in 
the interface with some caveats?

> 
>>>>        uint64_aligned_t cpu_time;
>>>>        uint32_t nr_online_vcpus;    /* Number of VCPUs currently
>>>> online. */
>>>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>>>> index cde0d9c7fe63..7281eb7b36c7 100644
>>>> --- a/xen/include/xen/domain.h
>>>> +++ b/xen/include/xen/domain.h
>>>> @@ -131,4 +131,16 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>>>>    static inline void vnuma_destroy(struct vnuma_info *vnuma) {
>>>> ASSERT(!vnuma); }
>>>>    #endif
>>>>    +#ifdef CONFIG_HAS_M2P
>>>> +#define domain_shared_info_gfn(d) ({                            \
>>>> +    const struct domain *d_ = (d);                              \
>>>> +    gfn_t gfn_;                                                 \
>>>> +                                                                \
>>>> +    gfn_ = mfn_to_gfn(d_, _mfn(__virt_to_mfn(d_->shared_info)));\
>>>> +    BUG_ON(SHARED_M2P(gfn_x(gfn_)));                            \
>>>> +                                                                \
>>>> +    gfn_;                                                       \
>>>> +})
>>>
>>> ... this wants to be
>>>
>>> #ifndef arch_shared_info_gfn
>>> static inline gfn_t arch_shared_info_gfn(const struct domain *d) {
>>> return INVALID_GFN; }
>>> #endif
>>>
>>> with
>>>
>>> gfn_t arch_shared_info_gfn(const struct domain *d);
>>> #define arch_shared_info_gfn arch_shared_info_gfn
>>>
>>> in asm-x86/domain.h
>>>
>>> and the actual implementation in arch/x86/domain.c
>>
>> What's wrong with implement it in xen/domain.h? After all there is
>> nothing x86 specific in the implementation...
> 
> d->shared_info is allocated in arch specific code, not common code.
> This macro assumes that __virt_to_mfn() is safe to call on the pointer.

That's a fair point. I will move the code in an x86 specific files.

Cheers,

-- 
Julien Grall

