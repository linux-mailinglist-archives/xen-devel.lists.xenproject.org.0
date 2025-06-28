Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94766AEC982
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 19:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028411.1402401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZTE-0006Pr-QE; Sat, 28 Jun 2025 17:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028411.1402401; Sat, 28 Jun 2025 17:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZTE-0006Mm-NU; Sat, 28 Jun 2025 17:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1028411;
 Sat, 28 Jun 2025 17:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVZTD-0006Mg-D8
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 17:36:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZTC-0072r0-0N;
 Sat, 28 Jun 2025 17:36:06 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZTB-002uqE-2z;
 Sat, 28 Jun 2025 17:36:06 +0000
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
	bh=ByFeS0RkIpsb7AF6Lw9JEwuiFql4pCQgpK/XJxQc1T0=; b=cdpoR4DR1CV8lqVZUrTLViduJK
	IXeuWV6EXfPFm6XaNA/q8KpeVpUvCeIWj1i+hhq/D1JDW0UuhaVCgGLqN1l0EX05WJIrwcy1Qt4Kg
	UFS0QIMfK8wVlLfx+WLq3daYjsgXjbof5TzepcOc4w80tmXrE0r/xtCNnxiEUDpEBBWs=;
Message-ID: <a2544b8f-ec1d-46ef-acbe-d1683940f841@xen.org>
Date: Sat, 28 Jun 2025 18:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
Content-Language: en-GB
To: Koichiro Den <den@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-5-den@valinux.co.jp>
 <21cbc79b-2209-42ef-8085-81c41e8e697b@xen.org>
 <zyuhfqsecyt3upsj3lrixgakn4bevbofdaylgqfwkukss5l54p@j5wvfn3545a6>
From: Julien Grall <julien@xen.org>
In-Reply-To: <zyuhfqsecyt3upsj3lrixgakn4bevbofdaylgqfwkukss5l54p@j5wvfn3545a6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/06/2025 14:58, Koichiro Den wrote:
> On Mon, Jun 23, 2025 at 09:41:47AM +0100, Julien Grall wrote:
> ---(snip)---
>>> @@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
>>>                           unsigned int flags)
>>>    {
>>>        unsigned int count = 0;
>>> +    int order;
>>>        int rc;
>>>        BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>>> @@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
>>>        d->arch.sve_vl = config->arch.sve_vl;
>>>    #endif
>>> +    /*
>>> +     * Preallocate the stolen time shared memory regions for all the
>>> +     * possible vCPUs.
>>> +     */
>>> +    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));
>>
>> As this is an order, we could end up to waste memory fairly quickly. So we
>> should try to free the unused pages from the order. That said, the maximum
>> number of virtual CPUs we currently support is 128. If I am not mistaken,
>> this could fit in 2 4KB pages. So I would also be ok with a
>> BUILD_BUG_ON(MAX_VIRT_CPUS <= 128) and we defer this work.
> 
> I'll go with the former in the next iteration. Thanks!
> 
>>
>>> +    d->arch.pv_time_regions_gfn = INVALID_GFN;
>>
>> Does this mean PV time is optional? If so, shouldn't we allocate the memory
>> conditionally?
>>
>> Also, looking at the code below, you seem to cater domains created via
>> dom0less but not from the toolstack. I think both should be supported for
>> the PV time.
> 
> Yes, that was intentional. I should've mentioned that this RFC series only
> caters the dom0less case. For domains created dynamically via xl create, the
> only viable solution I've found so far is to reserve PFN range(s) large enough
> to cover the maximum possible number of toolstack-created domains on boot,
> which I think would be too wasteful.

AFAICT, with current MAX_VIRT_CPUS (128), we would only need to reserve 
8KB in the guest address space. We still have plenty of space that we 
can afford reserve 8KB (the layout is described in 
xen/include/public/arch-arm.h). I would suggest to allocate the region 
just before the grant-table (see GUEST_GNTTAB_BASE).

> In any case, I agree that conditional allocation would be preferable.

For XL, I would suggest to introduce a field flags in 
xen_arch_domainconfig and use one bit for enabling the PV time 
interface. The other bits would be reserved for the future (so we would 
need to check they are zeroes). You can have a look how "flags" in 
xen_domctl_createdomain is handled.

[...]

>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>> index a3487ca71303..c231c45fe40f 100644
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -59,6 +59,18 @@ struct paging_domain {
>>>        unsigned long p2m_total_pages;
>>>    };
>>> +/* Stolen time shared memory region (ARM DEN 0057A.b) */
>>> +struct pv_time_region {
>>> +    /* This field must be 0 as per ARM DEN 0057A.b */
>>> +    uint32_t revision;
>>> +
>>> +    /* This field must be 0 as per ARM DEN 0057A.b */
>>> +    uint32_t attribute;
>>> +
>>> +    /* Total stolen time in nanoseconds */
>>> +    uint64_t stolen_time;
>>> +} __aligned(64);
>>> +
>>>    struct arch_domain
>>>    {
>>>    #ifdef CONFIG_ARM_64
>>> @@ -121,6 +133,9 @@ struct arch_domain
>>>        void *tee;
>>>    #endif
>>> +    struct pv_time_region *pv_time_regions;
>>> +    gfn_t pv_time_regions_gfn;
>>
>> Given the feature is 32-bit specific, shouldn't the field be protected with
>> #define CONFIG_ARM_32?
> 
> Is this typo s/32/64/? Assuming so, I'll do so (=protect them with #ifdef
> CONFIG_ARM_64) in the next iteration. Thanks!

Yes this is a typo.

Cheers,

-- 
Julien Grall


