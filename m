Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6AA35F57B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110669.211247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWg1H-0006Xt-3b; Wed, 14 Apr 2021 13:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110669.211247; Wed, 14 Apr 2021 13:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWg1H-0006XU-0Q; Wed, 14 Apr 2021 13:57:27 +0000
Received: by outflank-mailman (input) for mailman id 110669;
 Wed, 14 Apr 2021 13:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWg1F-0006XP-14
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:57:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b2426b5-18a6-4385-829e-f63dac13effc;
 Wed, 14 Apr 2021 13:57:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5FC1AE89;
 Wed, 14 Apr 2021 13:57:22 +0000 (UTC)
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
X-Inumbo-ID: 8b2426b5-18a6-4385-829e-f63dac13effc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618408643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h6ETvXlbIYmiKaDbAn1EZgwXD9K6BRPPCZ0FtAWagqQ=;
	b=LHP81nxt86+zDXLGxKFI67B0tF9Qg37XsVJ7My2fd0fG0ucb8/f7GmOwoW7AZnBvNVY0QE
	B9z/Dt+JHUg5AB8gE7+gZqY0M9i8TTLYjsg4KKJoj0R04KmN+aEfGKQJjtyf1nTUbI1PCG
	FWMuwZtd1sEAHFQ1eDnBGxApR5+QZrw=
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
 <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
 <af2cb854-ca3f-22ee-a7b3-8c24fdecfb7e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12301367-e19a-5c89-5751-9937402ac099@suse.com>
Date: Wed, 14 Apr 2021 15:57:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <af2cb854-ca3f-22ee-a7b3-8c24fdecfb7e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.04.2021 15:25, Andrew Cooper wrote:
> On 14/04/2021 14:05, Andrew Cooper wrote:
>> On 14/04/2021 13:57, Jan Beulich wrote:
>>> On 14.04.2021 13:04, Roger Pau Monne wrote:
>>>> @@ -264,6 +265,38 @@ struct cpuid_policy
>>>>              };
>>>>              uint32_t nc:8, :4, apic_id_size:4, :16;
>>>>              uint32_t /* d */:32;
>>>> +
>>>> +            uint64_t :64, :64; /* Leaf 0x80000009. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000b. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000c. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000d. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000e. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000f. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000010. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000011. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000012. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000013. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000014. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000015. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000016. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000017. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000018. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001c. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
>>>> +
>>>> +            /* Leaf 0x80000021 - Extended Feature 2 */
>>>> +            union {
>>>> +                uint32_t e21a;
>>>> +                struct { DECL_BITFIELD(e21a); };
>>>> +            };
>>>> +            uint32_t /* b */:32, /* c */:32, /* d */:32;
>>>>          };
>>>>      } extd;
>>> Due to the effect of this on what guests get to see, I think this
>>> wants to take my "x86/CPUID: shrink max_{,sub}leaf fields according
>>> to actual leaf contents" as a prereq, which in turn may better
>>> remain on top of "x86/CPUID: adjust extended leaves out of range
>>> clearing" (both are neighbors in that over 4 months old series,
>>> fair parts of which could imo go in irrespective of the unsettled
>>> dispute on xvmalloc() - unfortunately I had made that patch 2 of
>>> the series, not expecting it to be blocked for so long, and then
>>> presumably signaling to others that the rest of the series is also
>>> blocked).
>> There is no shrinking to be done in this case.  The bit is set across
>> the board on AMD/Hygon hardware, even on older parts.
>>
>> What does need changing however is the logic to trim max_extd_leaf down
>> to what hardware supports, so the bit is visible on Rome/older
>> hardware.  I.e. after this change, all VMs should get 0x80000021 by
>> default on AMD hardware.
>>
>> (A curious observation of Milan hardware is that it actually advertises
>> 0x80000023 as max_extd_leaf, and has two leaves of zeros at the end. 
>> I've got an open query about this.)
> 
> Something like this:
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 050cd5713e..d9eb2878c5 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -311,6 +311,7 @@ static void __init calculate_raw_policy(void)
>  static void __init calculate_host_policy(void)
>  {
>      struct cpuid_policy *p = &host_cpuid_policy;
> +    unsigned int max_extd_leaf;
>  
>      *p = raw_cpuid_policy;
>  
> @@ -318,7 +319,18 @@ static void __init calculate_host_policy(void)
>          min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
>      p->feat.max_subleaf =
>          min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
> -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf &
> 0xffff,
> +
> +    max_extd_leaf = p->extd.max_leaf;
> +
> +    /*
> +     * For AMD/Hygon hardware before Zen3, we modify LFENCE to be dispatch
> +     * serialsing.  Extend max_extd_leaf beyond what hardware supports, to
> +     * include the feature leaf containing this information.
> +     */
> +    if ( cpu_has_lfence_dispatch )
> +        max_extd_leaf = max(max_extd_leaf, 0x80000021);
> +
> +    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
>                                            ARRAY_SIZE(p->extd.raw) - 1);
>  
>      cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);

Well, why not set it to ARRAY_SIZE() and then have
x86_cpuid_policy_shrink_max_leaves() (from "x86/CPUID: shrink
max_{,sub}leaf fields according to actual leaf contents") have
a go? It'll recognize the non-zero leaf ... Otherwise, if we
gain a few more such special cases, things are going to get
ugly here.

Jan

