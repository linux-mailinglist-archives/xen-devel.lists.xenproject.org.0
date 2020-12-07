Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC432D15F0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 17:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46830.82997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJNz-0002A3-QX; Mon, 07 Dec 2020 16:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46830.82997; Mon, 07 Dec 2020 16:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJNz-00029e-N6; Mon, 07 Dec 2020 16:29:15 +0000
Received: by outflank-mailman (input) for mailman id 46830;
 Mon, 07 Dec 2020 16:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmJNy-00029Z-R3
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 16:29:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ef093d0-fa7b-49b4-ad86-2b5226dab19f;
 Mon, 07 Dec 2020 16:29:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BE89ADCD;
 Mon,  7 Dec 2020 16:29:12 +0000 (UTC)
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
X-Inumbo-ID: 9ef093d0-fa7b-49b4-ad86-2b5226dab19f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607358552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuDNFLNOZxKVULJwkXmi28LdVyrLgNpGSQ7VYcZCdKY=;
	b=Dp3GlhExFUYZATcyjAakOAH/uLdqBLto4qAuwOi7+G89+nlBYPzxcRS0dqK4JNGuk2l085
	t8lwRe7t5wFji7h5JTPB1IF8k+GMjJAyA1WrYO05/SqXLS/RUagUR/M675G9GkCyeO5Fbr
	hpPtQHRUjh0q3WP1lYPMg111VR02Jfw=
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <51a5c06f-e6ce-c651-2fd2-352aaa591fb1@suse.com>
 <029c3dcc-fac2-5b65-703e-5d821335f2a0@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d83a093-29d3-5870-0814-229cc7f1c04b@suse.com>
Date: Mon, 7 Dec 2020 17:29:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <029c3dcc-fac2-5b65-703e-5d821335f2a0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 16:27, Oleksandr wrote:
> On 07.12.20 13:13, Jan Beulich wrote:
>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>> @@ -601,7 +610,7 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
>>>       return rc;
>>>   }
>>>   
>>> -static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>>> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>>>   {
>>>       hvm_unmap_ioreq_gfn(s, true);
>>>       hvm_unmap_ioreq_gfn(s, false);
>> How is this now different from ...
>>
>>> @@ -674,6 +683,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>>>       return rc;
>>>   }
>>>   
>>> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
>>> +{
>>> +    hvm_remove_ioreq_gfn(s, false);
>>> +    hvm_remove_ioreq_gfn(s, true);
>>> +}
>> ... this? Imo if at all possible there should be no such duplication
>> (i.e. at least have this one simply call the earlier one).
> 
> I am afraid, I don't see any duplication between mentioned functions. 
> Would you mind explaining?

Ouch - somehow my eyes considered "unmap" == "remove". I'm sorry
for the noise.

>>> @@ -1080,6 +1105,24 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>>>       return rc;
>>>   }
>>>   
>>> +/* Called with ioreq_server lock held */
>>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>>> +                                   struct hvm_ioreq_server *s,
>>> +                                   uint32_t flags)
>>> +{
>>> +    int rc = p2m_set_ioreq_server(d, flags, s);
>>> +
>>> +    if ( rc == 0 && flags == 0 )
>>> +    {
>>> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>>> +    }
>>> +
>>> +    return rc;
>>> +}
>>> +
>>>   /*
>>>    * Map or unmap an ioreq server to specific memory type. For now, only
>>>    * HVMMEM_ioreq_server is supported, and in the future new types can be
>>> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
>>>       if ( s->emulator != current->domain )
>>>           goto out;
>>>   
>>> -    rc = p2m_set_ioreq_server(d, flags, s);
>>> +    rc = arch_ioreq_server_map_mem_type(d, s, flags);
>>>   
>>>    out:
>>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>   
>>> -    if ( rc == 0 && flags == 0 )
>>> -    {
>>> -        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> -
>>> -        if ( read_atomic(&p2m->ioreq.entry_count) )
>>> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>>> -    }
>>> -
>>>       return rc;
>>>   }
>> While you mention this change in the description, I'm still
>> missing justification as to why the change is safe to make. I
>> continue to think p2m_change_entry_type_global() would better
>> not be called inside the locked region, if at all possible.
> Well. I am afraid, I don't have a 100% justification why the change is 
> safe to make as well
> as I don't see an obvious reason why it is not safe to make (at least I 
> didn't find a possible deadlock scenario while investigating the code).
> I raised a question earlier whether I can fold this check in, which 
> implied calling p2m_change_entry_type_global() with ioreq_server lock held.

I'm aware of the earlier discussion. But "didn't find" isn't good
enough in a case like this, and since it's likely hard to indeed
prove there's no deadlock possible, I think it's best to avoid
having to provide such a proof by avoiding the nesting.

> If there is a concern with calling this inside the locked region 
> (unfortunately still unclear for me at the moment), I will try to find 
> another way how to split hvm_map_mem_type_to_ioreq_server() without
> potentially unsafe change here *and* exposing 
> p2m_change_entry_type_global() to the common code. Right now, I don't 
> have any ideas how this could be split other than
> introducing one more hook here to deal with p2m_change_entry_type_global 
> (probably arch_ioreq_server_map_mem_type_complete?), but I don't expect 
> it to be accepted.
> I appreciate any ideas on that.

Is there a reason why the simplest solution (two independent
arch_*() calls) won't do? If so, what are the constraints?
Can the first one e.g. somehow indicate what needs to happen
after the lock was dropped? But the two calls look independent
right now, so I don't see any complicating factors.

>>> --- a/xen/include/asm-x86/hvm/ioreq.h
>>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>>> @@ -19,6 +19,25 @@
>>>   #ifndef __ASM_X86_HVM_IOREQ_H__
>>>   #define __ASM_X86_HVM_IOREQ_H__
>>>   
>>> +#define HANDLE_BUFIOREQ(s) \
>>> +    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
>>> +
>>> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
>>> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
>>> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
>>> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
>>> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
>>> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
>>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>>> +                                   struct hvm_ioreq_server *s,
>>> +                                   uint32_t flags);
>>> +bool arch_ioreq_server_destroy_all(struct domain *d);
>>> +int arch_ioreq_server_get_type_addr(const struct domain *d,
>>> +                                    const ioreq_t *p,
>>> +                                    uint8_t *type,
>>> +                                    uint64_t *addr);
>>> +void arch_ioreq_domain_init(struct domain *d);
>>> +
>>>   bool hvm_io_pending(struct vcpu *v);
>>>   bool handle_hvm_io_completion(struct vcpu *v);
>>>   bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
>> What's the plan here? Introduce them into the x86 header just
>> to later move the entire block into the common one? Wouldn't
>> it make sense to introduce the common header here right away?
>> Or do you expect to convert some of the simpler ones to inline
>> functions later on?
> The former. The subsequent patch is moving the the entire block(s) from 
> here and from x86/hvm/ioreq.c to the common code in one go.

I think I saw it move the _other_ pieces there, and this block
left here. (FAOD my comment is about the arch_*() declarations
you add, not the patch context in view.)

> I thought it was a little bit odd to expose a header before exposing an 
> implementation to the common code. Another reason is to minimize places 
> that need touching by current patch.

By exposing arch_*() declarations you don't give the impression
of exposing any "implementation". These are helpers the
implementation is to invoke; I'm fine with you moving the
declarations of the functions actually constituting this
component's external interface only once you also move the
implementation to common code.

Jan

