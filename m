Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461527480A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmuI-0007sk-LL; Tue, 22 Sep 2020 18:20:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKmuH-0007sf-5R
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:20:49 +0000
X-Inumbo-ID: 4a1804bd-1679-4795-81f4-951bc5ba5eaa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a1804bd-1679-4795-81f4-951bc5ba5eaa;
 Tue, 22 Sep 2020 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kTF4AL/Y9JqzKDWDVOtcKlZvwqN0TuM0qxfbavwBGik=; b=6qiZ7cUm5JRKyCIDnODzPrxqpj
 tF2TrQBBcOyqKwJAmEvzsNPG/KtEWuIYyYR+B+Jrm2ibpgFkv5unSBeVghEjHM7ORJnn2xZuZB70t
 Jsb8kGZ849ANuHRmgbsOYyLOWuNhcdlrTWHgOjAVHoW10sGnkDKG5J2zHX05QrFY132Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmu9-0005OG-Ip; Tue, 22 Sep 2020 18:20:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmu9-0004xt-3w; Tue, 22 Sep 2020 18:20:41 +0000
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
From: Julien Grall <julien@xen.org>
Message-ID: <d80519d8-6699-7beb-9192-0e87623b0b62@xen.org>
Date: Tue, 22 Sep 2020 19:20:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a2e1773d-cb01-fa02-334a-a642f9316b57@citrix.com>
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

On 21/09/2020 21:29, Andrew Cooper wrote:
> On 21/09/2020 19:02, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> While Arm never had a M2P, the implementation of mfn_to_gmfn is pretty
>> bogus as we directly return the MFN passed in parameter.
>>
>> Thankfully, the use of mfn_to_gmfn is pretty limited on Arm today. There
>> are only 2 callers in the common code:
>>      - memory_exchange: Arm cannot not use it because steal_page is not
>>      implemented. Note this is already protected by !CONFIG_PV.
>>      - getdomaininfo: Toolstack may map the shared page. It looks like
>>      this is mostly used for mapping the P2M of PV guest. Therefore the
>>      issue might be minor.
>>
>> Implementing the M2P on Arm is not planned. The M2P would require significant
>> amount of VA address (very tough on 32-bit) that can hardly be justified with
>> the current use of mfn_to_gmfn.
> 
> If anyone cares, access to the shared info page should be wired up
> through acquire_resource, not through this foreign mapping bodge,
> because ...
> 
>>      - memory_exchange: This does not work and I haven't seen any
>>      request for it so far.
>>      - getdomaininfo: The structure on Arm does not seem to contain a lot
>>      of useful information on Arm. It is unclear whether we want to
>>      allow the toolstack mapping it on Arm.
>>
>> This patch introduces a config option HAS_M2P to tell whether an
>> architecture implements the M2P.
>>      - memory_exchange: This is PV only (not supported on Arm) but take
>>      the opportunity to gate with HAS_M2P as well in case someone decide
>>      to implement PV without M2P.
>>      - getdomaininfo: A new helper is introduced to wrap the call to
>>      mfn_to_gfn/mfn_to_gmfn. For Arm, a fixed value will be provided that will
>>      fail on mapping if used.
>>
>> Signed-off-by Julien Grall <julien.grall@arm.com>
> 
> ... possibly the single best reason for returning -1 on ARM is that this
> is already the behaviour for x86 HVM guests, until the guest has mapped
> the shared info frame for the first time.
> 
> (XEN) *** d0v6 getdomaininfo(d1) d->shared_info ffff83007cffe000,
> shared_info_frame 0x7cffe
> (XEN) *** d0v6 getdomaininfo(d2) d->shared_info ffff83007a401000,
> shared_info_frame 0xffffffffffffffff
> 
> (d1 is PV, d2 is HVM.  This is the result of creating domains at the
> python shell, then querying them for their info, without any further
> construction or execution).
> 
> Furthermore, both PV and HVM guests can invalidate the M2P mappings for
> their shared_info page, which in the HVM case would cause -1 to be
> returned again.
> 
>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>> index 5ac6e9c5cafa..2bf3e6659018 100644
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -68,6 +68,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>>       u64 cpu_time = 0;
>>       int flags = XEN_DOMINF_blocked;
>>       struct vcpu_runstate_info runstate;
>> +    gfn_t shared_info_frame;
>>   
>>       info->domain = d->domain_id;
>>       info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
>> @@ -111,8 +112,12 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>>       info->outstanding_pages = d->outstanding_pages;
>>       info->shr_pages         = atomic_read(&d->shr_pages);
>>       info->paged_pages       = atomic_read(&d->paged_pages);
>> -    info->shared_info_frame = mfn_to_gmfn(d, virt_to_mfn(d->shared_info));
>> -    BUG_ON(SHARED_M2P(info->shared_info_frame));
>> +
>> +    shared_info_frame = domain_shared_info_gfn(d);
>> +    if ( gfn_eq(shared_info_frame, INVALID_GFN) )
>> +        info->shared_info_frame = XEN_INVALID_SHARED_INFO_FRAME;
>> +    else
>> +        info->shared_info_frame = gfn_x(shared_info_frame);
> 
> This can be simplified to just  info->shared_info_frame =
> gfn_x(arch_shared_info_gfn(d)) based on the suggestion at the bottom.
> 
>>   
>>       info->cpupool = cpupool_get_id(d);
>>   
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 9300104943b0..c698e6872596 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -504,7 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>>   
>>   static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>   {
>> -#ifdef CONFIG_PV
>> +#if defined(CONFIG_PV) && defined(CONFIG_M2P)
> 
> There is no such thing as PV && !M2P.  The M2P table is part of the PV
> ABI with guests.
> 
> These two hunks should be dropped.

I will drop them.

> 
>>       struct xen_memory_exchange exch;
>>       PAGE_LIST_HEAD(in_chunk_list);
>>       PAGE_LIST_HEAD(out_chunk_list);
>> @@ -801,7 +801,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>       if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>>           rc = -EFAULT;
>>       return rc;
>> -#else /* !CONFIG_PV */
>> +#else /* !(CONFIG_PV && CONFIG_M2P) */
>>       return -EOPNOTSUPP;
>>   #endif
>>   }
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 6819a3bf382f..90161dd079a1 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -262,6 +262,11 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>   
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>   
>> +static inline gfn_t domain_shared_info_gfn(struct domain *d)
>> +{
>> +    return INVALID_GFN;
>> +}
> 
> We don't want every every architecture to provide a stub.  Instead, ...
> (bottom reply)
> 
>> +
>>   #endif /* __ASM_DOMAIN_H__ */
>>   
>>   /*
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 5c5e55ebcb76..7564df5e8374 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
>>       uint64_aligned_t outstanding_pages;
>>       uint64_aligned_t shr_pages;
>>       uint64_aligned_t paged_pages;
>> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
> 
> We've already got INVALID_GFN as a constant used in the interface.  Lets
> not proliferate more.

This was my original approach (see [1]) but this was reworked because:
    1) INVALID_GFN is not technically defined in the ABI. So the 
toolstack has to hardcode the value in the check.
    2) The value is different between 32-bit and 64-bit Arm as 
INVALID_GFN is defined as an unsigned long.

So providing a new define is the right way to go.

> 
>> +    /*
>> +     * GFN of shared_info struct. Some architectures (e.g Arm) may not
>> +     * provide a mappable address in the field. In that case, the field
>> +     * will be set to XEN_INVALID_SHARED_INFO_FRAME.
>> +     */
>>       uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */
> 
> Delete this comment, especially as it is using obsolete naming terminology.

Sure.

> 
>>       uint64_aligned_t cpu_time;
>>       uint32_t nr_online_vcpus;    /* Number of VCPUs currently online. */
>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index cde0d9c7fe63..7281eb7b36c7 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -131,4 +131,16 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>>   static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
>>   #endif
>>   
>> +#ifdef CONFIG_HAS_M2P
>> +#define domain_shared_info_gfn(d) ({                            \
>> +    const struct domain *d_ = (d);                              \
>> +    gfn_t gfn_;                                                 \
>> +                                                                \
>> +    gfn_ = mfn_to_gfn(d_, _mfn(__virt_to_mfn(d_->shared_info)));\
>> +    BUG_ON(SHARED_M2P(gfn_x(gfn_)));                            \
>> +                                                                \
>> +    gfn_;                                                       \
>> +})
> 
> ... this wants to be
> 
> #ifndef arch_shared_info_gfn
> static inline gfn_t arch_shared_info_gfn(const struct domain *d) {
> return INVALID_GFN; }
> #endif
> 
> with
> 
> gfn_t arch_shared_info_gfn(const struct domain *d);
> #define arch_shared_info_gfn arch_shared_info_gfn
> 
> in asm-x86/domain.h
> 
> and the actual implementation in arch/x86/domain.c

What's wrong with implement it in xen/domain.h? After all there is 
nothing x86 specific in the implementation...

Cheers,

[1] <20190507151458.29350-10-julien.grall@arm.com>

-- 
Julien Grall

