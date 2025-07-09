Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B6AFE276
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037844.1410347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQ6k-0006sp-GB; Wed, 09 Jul 2025 08:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037844.1410347; Wed, 09 Jul 2025 08:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQ6k-0006qs-DG; Wed, 09 Jul 2025 08:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1037844;
 Wed, 09 Jul 2025 08:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z9E=ZW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uZQ6i-0006jl-HI
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:24:48 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2b0d44-5c9e-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 10:24:46 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso1128864966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 01:24:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f62e0e21sm1044115266b.0.2025.07.09.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 01:24:45 -0700 (PDT)
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
X-Inumbo-ID: 2c2b0d44-5c9e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752049486; x=1752654286; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhDSjJqJx2qxFU07F2gAyuN8uq3y2rkmGm68LD8c3lg=;
        b=mKJYnFA61EnpGm1jkknaAN7pmY16ulEyyJ5LNQ58rTViJlHgt7g60v4a/NKwn/JIxy
         kOz2Q4ck+FaYK/mdTqgfd74Uq/ynCa20f6NwEgavnWPZtgFn4RgpUryiTsJGh/GU/cKh
         zS8hDQ7uYzMubUYZBDmIyf7md823cNVfbrFaTGD5F88xCiuRw2vGFhX9W4AwOe/Sti4p
         GhtfrxYQkW/7b1FfiNqnkbgoffinJcv/pSxL8sWLO/jYrhV9U/aWR+adueYCEveupTks
         l3/IuruXHurbsy/kudU7jXedjWxANZGhBaOCzia0+BFBg8qJBdOyLk9PqJ+wIAG84SCN
         s2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049486; x=1752654286;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhDSjJqJx2qxFU07F2gAyuN8uq3y2rkmGm68LD8c3lg=;
        b=KW6gCdHSWm1xaShrkIkmwA5/effWoCN9Z+IRnI2PwFb4QRHT5rgXns6J+4wUI3jKlF
         JM9Wi4b/cJyW+EdNvNEVBHSBvdYvv7glF6Bi5dE7GJZkBFnUZ2Ih1CXQr/+d2nTpoEwx
         3GaTJCI6zshXvXBxtV4MJR+fCYznvWlA7G51KyXeDxNDyq9IyB1/HoV3S99rySyhKy1L
         POLuBazHV/teKtScQQzJl4MetTTNzI4rwe26QxStlSqE4v4E5eSzGnTVuMg8J9YbCNLK
         QXuEhTIEUyQBx6BA1MqFYG1dHdn0B9M7b5n/ILFVmgXvHuqVtL+tjYBXuwe0+fvE+nTA
         176A==
X-Forwarded-Encrypted: i=1; AJvYcCXXSQIo3x7T5TypSmBkpeknMNe4Q2i6Y7VXtTUHpOFSEK4xccvt6jwZM+oQW5pLTRURdgutbi3qruU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWePmyyn9YMBszFkOD5K4xu2kqsDvbovvq2S1SsOCBWwW0K9Dn
	hCP8qXf5kzHHm4MaC1okr5/AWdKHdfLU64UkffOEPsAS7RCJj0s8+tyJ
X-Gm-Gg: ASbGnct1LJNqlyqYfHfw+PCs22n46vuao6M3/4Jryue15uCp21TNb5ot8QScB49t6my
	To8tpO23OjEKOe6EUNG2gZTdMi9vyiAizdBWul3yuUXt3jQt93orXqUvQ0O8H+l1A1wCtv0BMNB
	BDMpHktGMILsU94XuMZpOxjr9jLVhcVRXn9IXW3RVXAMo+LFa7CmXOecCt9aVfsERZHDIksyjj7
	k1mTSMt7RMYzI4F2cVRvrPoOvMPeO6jkWYh+5YmXxd2QhcP+6s1sCr216p+Th7ItcBMsNF2ZgZl
	Fq0MOIyGVTEvmfyKBgZ1x7GAFnYS7SGZr2t6VZs+xHxOjow2vXL/1lbVTXtbxYVSPFsZbP1rIWV
	JogGRAudX5/H1WDCQE9MTX9IgFVPoclwEZ9E=
X-Google-Smtp-Source: AGHT+IGFelETx6HEJw8b0MZpmK07TdLeBXyHvgrknoDnevx3dfq9dykb00GKGHh2YkaBNFKH1LAc1Q==
X-Received: by 2002:a17:907:6e8e:b0:ade:4593:d7cd with SMTP id a640c23a62f3a-ae6cf6985d6mr156191666b.13.1752049485466;
        Wed, 09 Jul 2025 01:24:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3jage84wVK5YfavCuKu0xHcL"
Message-ID: <a37e790b-90f6-40c1-8984-564951650ef2@gmail.com>
Date: Wed, 9 Jul 2025 10:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
 <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>
 <674c9f82-f486-4cca-991b-3ac3da3a237d@gmail.com>
 <2afe5641-0790-4f27-823b-ab941ad2c971@suse.com>
 <82362709-c386-485e-935c-e229e735fba6@gmail.com>
 <cec77342-367c-41fe-abaf-b7e04309ca63@suse.com>
 <8036ddb2-f223-41f5-a498-75b483c237bb@gmail.com>
 <6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com>
 <8f166b5d-eed3-4695-a0e9-ba8fc8a2b9b2@gmail.com>
 <409cdade-192d-47dc-941d-9256bfa53cea@suse.com>
 <65aaf77e-85fe-4934-a485-710aff59f4eb@gmail.com>
 <05b789f0-7064-4ec3-9e0c-ba528a30d315@gmail.com>
 <61773bca-32f7-42ee-867f-80dc8a389bef@suse.com>
 <dd73f1ed-e2cb-40c5-ad06-bd390467e128@gmail.com>
 <7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com>

This is a multi-part message in MIME format.
--------------3jage84wVK5YfavCuKu0xHcL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/8/25 6:04 PM, Jan Beulich wrote:
> On 08.07.2025 17:42, Oleksii Kurochko wrote:
>> On 7/8/25 2:45 PM, Jan Beulich wrote:
>>> On 08.07.2025 12:37, Oleksii Kurochko wrote:
>>>> On 7/8/25 11:01 AM, Oleksii Kurochko wrote:
>>>>> On 7/8/25 9:10 AM, Jan Beulich wrote:
>>>>>> On 07.07.2025 18:10, Oleksii Kurochko wrote:
>>>>>>> On 7/7/25 5:15 PM, Jan Beulich wrote:
>>>>>>>> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>>>>>>>>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>>>>>>>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>>>>>>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>>>>>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>>>>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +    return false;
>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>>>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>>>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>>>>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>>>>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>>>>>>>>          /*
>>>>>>>>>>>>>           * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>>>>>>>>           * the type to check whether an entry is valid.
>>>>>>>>>>>>>           */
>>>>>>>>>>>>>          static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>>>>>>>          {
>>>>>>>>>>>>>              return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>>>>>>>          }
>>>>>>>>>>>>>
>>>>>>>>>>>>> It is done to track which page was modified by a guest.
>>>>>>>>>>>> But then (again) the name doesn't convey what the function does.
>>>>>>>>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>>>>>>>>> For P2M type checks please don't invent new naming, but use what both x86
>>>>>>>>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>>>>>>>>> set. Just that it's not doing what you want here.
>>>>>>>>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>>>>>>>>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>>>>>>>>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>>>>>>>>> free bits for type).
>>>>>>>> Because this is how it's defined on x86:
>>>>>>>>
>>>>>>>> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>>>>>>>>                                  (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>>>>>>>>
>>>>>>>> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
>>>>>>>> would better be uniform across architectures, such that in principle they
>>>>>>>> might also be usable in common code (as we already do with p2m_is_foreign()).
>>>>>>> Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
>>>>>>> x86 and Arm have different understanding what is valid.
>>>>>>>
>>>>>>> Except what mentioned in the comment that grant types aren't considered valid
>>>>>>> for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
>>>>>>> p2m_is_valid() is stricter then Arm's one and if other arches should be also
>>>>>>> so strict.
>>>>>> Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
>>>>>> could also consider x86'es to require a better name). It's a local helper, not
>>>>>> a P2M type checking predicate. With that in mind, you may of course follow
>>>>>> Arm's model, but in the longer run we may need to do something about the name
>>>>>> collision then.
>>>>>>
>>>>>>>>> The only use case I can think of is that the caller
>>>>>>>>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>>>>>>>>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>>>>>>>>> issue, and retrying would probably result in the same error.
>>>>>>>>>
>>>>>>>>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>>>>>>>>> array to track all modified PTEs and then use it to revert the state if needed.
>>>>>>>>> But again, what would the caller do after the rollback? At this point, it still seems
>>>>>>>>> like the best option is simply to|panic(). |
>>>>>>>>>
>>>>>>>>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>>>>>>>>> successfully mapped, or whether a rollback was performed, would really help — because
>>>>>>>>> in most cases, I don’t have a better option than just calling|panic()| at the end.
>>>>>>>> panic()-ing is of course only a last resort. Anything related to domain handling
>>>>>>>> would better crash only the domain in question. And even that only if suitable
>>>>>>>> error handling isn't possible.
>>>>>>> And if there is no still any runnable domain available, for example, we are creating
>>>>>>> domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
>>>>>>> If yes, then it is enough to return only error code without returning how many GFNs were
>>>>>>> mapped or rollbacking as domain won't be ran anyway.
>>>>>> During domain creation all you need to do is return an error. But when you write a
>>>>>> generic function that's also (going to be) used at domain runtime, you need to
>>>>>> consider what to do there in case of partial success.
>>>>>>
>>>>>>>>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>>>>>>>>> tree node, and the mapping fails partway through, I’m left with two options: either
>>>>>>>>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>>>>>>>>       booting; in which case I’d need to perform a rollback, and simply knowing the number
>>>>>>>>> of successfully mapped GFNs may not be enough or, more likely, just panic.
>>>>>>>> Well, no. For example, before even trying to map you could check that the range
>>>>>>>> of P2M entries covered is all empty.
>>>>>>> Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
>>>>>>> just do a mapping, right?
>>>>>> Possibly that would simply mean to return an error, yes.
>>>>>>
>>>>>>> Won't be this procedure consume a lot of time as it is needed to go through each page
>>>>>>> tables for each entry.
>>>>>> Well, you're free to suggest a clean alternative without doing so.
>>>>> I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
>>>>> and then use it to roll back if __p2m_set_entry() returns rc != 0 ...
>>> That's another possible source for failure, and such an allocation may end
>>> up being a rather big one.
>>>
>>>>>>>>      _Then_ you know how to correctly roll back.
>>>>>>>> And yes, doing so may not even require passing back information on how much of
>>>>>>>> a region was successfully mapped.
>>>>>>> If P2M entries were empty before start of the mapping then it is enough to just go
>>>>>>> through the same range (sgfn,nr,smfn) and just clean them, right?
>>>>>> Yes, what else would "roll back" mean in that case?
>>>>> ... If we know that the P2M entries were empty, then there's nothing else to be done, just
>>>>> clean PTE is needed to be done.
>>>>> However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
>>>>> case), then rolling back would mean restoring their original state, the state they
>>>>> had before the P2M mapping procedure started.
>>>> Possible roll back is harder to implement as expected because there is a case where subtree
>>>> could be freed:
>>>>        /*
>>>>         * Free the entry only if the original pte was valid and the base
>>>>         * is different (to avoid freeing when permission is changed).
>>>>         */
>>>>        if ( p2me_is_valid(p2m, orig_pte) &&
>>>>             !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
>>>>            p2m_free_subtree(p2m, orig_pte, level);
>>>> In this case then it will be needed to store the full subtree.
>>> Right, which is why it may be desirable to limit the ability to update multiple
>>> entries in one go. Or work from certain assumptions, violation of which would
>>> cause the domain to be crashed.
>> It seems to me that the main issue with updating multiple entries in one go is the rollback
>> mechanism in case of a partial mapping failure. (other issues? mapping could consume a lot
>> of time so something should wait while allocation will end?) In my opinion, the rollback
>> mechanism is quite complex to implement and could become a source of further failures.
>> For example, most of the cases where p2m_set_entry() could fail are due to failure in
>> mapping the page table (to allow Xen to walk through it) or failure in creating a new page
>> table due to memory exhaustion. Then, during rollback, which might also require memory
>> allocation, we could face the same memory shortage issue.
>> And what should be done in that case?
>>
>> In my opinion, the best option is to simply return from p2m_set_entry() the number of
>> successfully mapped GFNs (stored in rc which is returned by p2m_set_entry()) and let
>> the caller decide how to handle the partial mapping:
>> 1. If a partial mapping occurs during domain creation, we could just report that this
>>      domain can't be created and continue without it if there are other domains to start;
>>      otherwise, panic.
> I don't see how panic()-ing is relevant here. That's to be decided (far) up
> the call stack.

So it's just a question of whether the caller should panic() or propagate the return
value (error code) up the call stack.

For example, in case of domain construction return value is propogate almost to  the top
of the stack:
   p2m_set_entry(p2m_access_t a, p2m_type_t t, mfn_t smfn, unsigned long nr, gfn_t sgfn, struct p2m_domain * p2m) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1005)
   p2m_insert_mapping(struct domain * d, gfn_t start_gfn, unsigned long nr, mfn_t mfn, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1055)
   guest_physmap_add_entry(struct domain * d, gfn_t gfn, mfn_t mfn, unsigned long page_order, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1076)
   guest_physmap_add_page(unsigned int page_order, struct domain * d) (/run/media/ok/blue_disk//xen/xen/arch/riscv/include/asm/p2m.h:152)
   guest_map_pages(struct domain * d, struct page_info * pg, unsigned int order, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:63)
   allocate_domheap_memory(struct domain * d, paddr_t tot_size, alloc_domheap_mem_cb cb, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:47)
   allocate_bank_memory(struct kernel_info * kinfo, gfn_t sgfn, paddr_t tot_size) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:99)
   allocate_memory(struct domain * d, struct kernel_info * kinfo) (/run/media/ok/blue_disk//xen/xen/include/xen/mm-frame.h:43)
   construct_domU(struct domain * d, const struct dt_device_node * node) (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:835)
   create_domUs() (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:1019)
   start_xen(unsigned long bootcpu_id, paddr_t dtb_addr) (/run/media/ok/blue_disk//xen/xen/arch/riscv/setup.c:296)
   start() (/run/media/ok/blue_disk//xen/xen/arch/riscv/riscv64/head.S:61)

And panic() almost at the end:
         rc = construct_domU(d, node);
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);

>
>> 2. If a partial mapping occurs during the lifetime of a domain, for example, if the domain
>>      requests to map some memory, we return the number of successfully mapped GFNs and let the
>>      domain decide what to do: either remove the mappings or retry mapping the remaining part.
>>      However, I think there's not much value in retrying, since p2m_set_entry() is likely to
>>      fail again. So, perhaps the best course of action is to stop the domain altogether.
>> Does that make sense?
> Sure, why not. Provided you actually have a way to communicate back how much
> was mapped.

I was thinking of simply returning it as the return value. This way, a return value of 0 would
indicate that everything was mapped successfully, while a value greater than 0 would indicate
how many GFNs were successfully mapped. And negative value if nothing was be mapped at all:
     static int p2m_set_entry(struct p2m_domain *p2m,
                            gfn_t sgfn,
                            unsigned long nr,
                            mfn_t smfn,
                            p2m_type_t t,
                            p2m_access_t a)
    {
       int rc = 0;
       unsigned int i;
   
       ...
   
       for ( i = 1; i <= nr; i++ )
       {
           ...
           rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
           if ( rc )
               break;
           ...
       }
       
       return i == nr ? 0 : i ?: rc;
    }

~ Oleksii

--------------3jage84wVK5YfavCuKu0xHcL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/25 6:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.07.2025 17:42, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 7/8/25 2:45 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 08.07.2025 12:37, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 7/8/25 11:01 AM, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
On 7/8/25 9:10 AM, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 07.07.2025 18:10, Oleksii Kurochko wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 7/7/25 5:15 PM, Jan Beulich wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On 07.07.2025 17:00, Oleksii Kurochko wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">On 7/7/25 2:53 PM, Jan Beulich wrote:
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">On 07.07.2025 13:46, Oleksii Kurochko wrote:
</pre>
                        <blockquote type="cite">
                          <pre wrap="" class="moz-quote-pre">On 7/7/25 9:20 AM, Jan Beulich wrote:
</pre>
                          <blockquote type="cite">
                            <pre wrap="" class="moz-quote-pre">On 04.07.2025 17:01, Oleksii Kurochko wrote:
</pre>
                            <blockquote type="cite">
                              <pre wrap="" class="moz-quote-pre">On 7/1/25 3:49 PM, Jan Beulich wrote:
</pre>
                              <blockquote type="cite">
                                <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                                <blockquote type="cite">
                                  <pre wrap="" class="moz-quote-pre">+{
+    panic("%s: isn't implemented for now\n", __func__);
+
+    return false;
+}
</pre>
                                </blockquote>
                                <pre wrap="" class="moz-quote-pre">For this function in particular, though: Besides the "p2me" in the name
being somewhat odd (supposedly page table entries here are simply pte_t),
how is this going to be different from pte_is_valid()?
</pre>
                              </blockquote>
                              <pre wrap="" class="moz-quote-pre">pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
what is a type stored in the radix tree (p2m-&gt;p2m_types):
        /*
         * In the case of the P2M, the valid bit is used for other purpose. Use
         * the type to check whether an entry is valid.
         */
        static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
        {
            return p2m_type_radix_get(p2m, pte) != p2m_invalid;
        }

It is done to track which page was modified by a guest.
</pre>
                            </blockquote>
                            <pre wrap="" class="moz-quote-pre">But then (again) the name doesn't convey what the function does.
</pre>
                          </blockquote>
                          <pre wrap="" class="moz-quote-pre">Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
</pre>
                        </blockquote>
                        <pre wrap="" class="moz-quote-pre">For P2M type checks please don't invent new naming, but use what both x86
and Arm are already using. Note how we already have p2m_is_valid() in that
set. Just that it's not doing what you want here.
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
And in here it is checked if P2M pte is valid from P2M point of view by checking
the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
free bits for type).
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Because this is how it's defined on x86:

#define p2m_is_valid(_t)    (p2m_to_mask(_t) &amp; \
                                (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))

I.e. more strict that simply "!= p2m_invalid". And I think such predicates
would better be uniform across architectures, such that in principle they
might also be usable in common code (as we already do with p2m_is_foreign()).
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
x86 and Arm have different understanding what is valid.

Except what mentioned in the comment that grant types aren't considered valid
for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
p2m_is_valid() is stricter then Arm's one and if other arches should be also
so strict.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
could also consider x86'es to require a better name). It's a local helper, not
a P2M type checking predicate. With that in mind, you may of course follow
Arm's model, but in the longer run we may need to do something about the name
collision then.

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">The only use case I can think of is that the caller
might try to map the remaining GFNs again. But that doesn’t seem very useful,
if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
issue, and retrying would probably result in the same error.

The same applies to rolling back the state. It wouldn’t be difficult to add a local
array to track all modified PTEs and then use it to revert the state if needed.
But again, what would the caller do after the rollback? At this point, it still seems
like the best option is simply to|panic(). |

Basically, I don’t see or understand the cases where knowing how many GFNs were
successfully mapped, or whether a rollback was performed, would really help — because
in most cases, I don’t have a better option than just calling|panic()| at the end.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">panic()-ing is of course only a last resort. Anything related to domain handling
would better crash only the domain in question. And even that only if suitable
error handling isn't possible.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">And if there is no still any runnable domain available, for example, we are creating
domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
If yes, then it is enough to return only error code without returning how many GFNs were
mapped or rollbacking as domain won't be ran anyway.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">During domain creation all you need to do is return an error. But when you write a
generic function that's also (going to be) used at domain runtime, you need to
consider what to do there in case of partial success.

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
tree node, and the mapping fails partway through, I’m left with two options: either
ignore the device (if it's not essential for Xen or guest functionality) and continue
     booting; in which case I’d need to perform a rollback, and simply knowing the number
of successfully mapped GFNs may not be enough or, more likely, just panic.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Well, no. For example, before even trying to map you could check that the range
of P2M entries covered is all empty.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
just do a mapping, right?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Possibly that would simply mean to return an error, yes.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Won't be this procedure consume a lot of time as it is needed to go through each page
tables for each entry.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Well, you're free to suggest a clean alternative without doing so.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
and then use it to roll back if __p2m_set_entry() returns rc != 0 ...
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That's another possible source for failure, and such an allocation may end
up being a rather big one.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">    _Then_ you know how to correctly roll back.
And yes, doing so may not even require passing back information on how much of
a region was successfully mapped.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">If P2M entries were empty before start of the mapping then it is enough to just go
through the same range (sgfn,nr,smfn) and just clean them, right?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Yes, what else would "roll back" mean in that case?
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... If we know that the P2M entries were empty, then there's nothing else to be done, just
clean PTE is needed to be done.
However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
case), then rolling back would mean restoring their original state, the state they
had before the P2M mapping procedure started.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Possible roll back is harder to implement as expected because there is a case where subtree
could be freed:
      /*
       * Free the entry only if the original pte was valid and the base
       * is different (to avoid freeing when permission is changed).
       */
      if ( p2me_is_valid(p2m, orig_pte) &amp;&amp;
           !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
          p2m_free_subtree(p2m, orig_pte, level);
In this case then it will be needed to store the full subtree.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Right, which is why it may be desirable to limit the ability to update multiple
entries in one go. Or work from certain assumptions, violation of which would
cause the domain to be crashed.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It seems to me that the main issue with updating multiple entries in one go is the rollback
mechanism in case of a partial mapping failure. (other issues? mapping could consume a lot
of time so something should wait while allocation will end?) In my opinion, the rollback
mechanism is quite complex to implement and could become a source of further failures.
For example, most of the cases where p2m_set_entry() could fail are due to failure in
mapping the page table (to allow Xen to walk through it) or failure in creating a new page
table due to memory exhaustion. Then, during rollback, which might also require memory
allocation, we could face the same memory shortage issue.
And what should be done in that case?

In my opinion, the best option is to simply return from p2m_set_entry() the number of
successfully mapped GFNs (stored in rc which is returned by p2m_set_entry()) and let
the caller decide how to handle the partial mapping:
1. If a partial mapping occurs during domain creation, we could just report that this
    domain can't be created and continue without it if there are other domains to start;
    otherwise, panic.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't see how panic()-ing is relevant here. That's to be decided (far) up
the call stack.</pre>
    </blockquote>
    <pre>So it's just a question of whether the caller should panic() or propagate the return
value (error code) up the call stack.

For example, in case of domain construction return value is propogate almost to  the top
of the stack:
  p2m_set_entry(p2m_access_t a, p2m_type_t t, mfn_t smfn, unsigned long nr, gfn_t sgfn, struct p2m_domain * p2m) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1005)
  p2m_insert_mapping(struct domain * d, gfn_t start_gfn, unsigned long nr, mfn_t mfn, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1055)
  guest_physmap_add_entry(struct domain * d, gfn_t gfn, mfn_t mfn, unsigned long page_order, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1076)
  guest_physmap_add_page(unsigned int page_order, struct domain * d) (/run/media/ok/blue_disk//xen/xen/arch/riscv/include/asm/p2m.h:152)
  guest_map_pages(struct domain * d, struct page_info * pg, unsigned int order, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:63)
  allocate_domheap_memory(struct domain * d, paddr_t tot_size, alloc_domheap_mem_cb cb, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:47)
  allocate_bank_memory(struct kernel_info * kinfo, gfn_t sgfn, paddr_t tot_size) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:99)
  allocate_memory(struct domain * d, struct kernel_info * kinfo) (/run/media/ok/blue_disk//xen/xen/include/xen/mm-frame.h:43)
  construct_domU(struct domain * d, const struct dt_device_node * node) (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:835)
  create_domUs() (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:1019)
  start_xen(unsigned long bootcpu_id, paddr_t dtb_addr) (/run/media/ok/blue_disk//xen/xen/arch/riscv/setup.c:296)
  start() (/run/media/ok/blue_disk//xen/xen/arch/riscv/riscv64/head.S:61)

And panic() almost at the end:
        rc = construct_domU(d, node);
        if ( rc )
            panic("Could not set up domain %s (rc = %d)\n",
                  dt_node_name(node), rc);

</pre>
    <blockquote type="cite"
      cite="mid:7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">2. If a partial mapping occurs during the lifetime of a domain, for example, if the domain
    requests to map some memory, we return the number of successfully mapped GFNs and let the
    domain decide what to do: either remove the mappings or retry mapping the remaining part.
    However, I think there's not much value in retrying, since p2m_set_entry() is likely to
    fail again. So, perhaps the best course of action is to stop the domain altogether.
Does that make sense?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sure, why not. Provided you actually have a way to communicate back how much
was mapped.</pre>
    </blockquote>
    <pre>I was thinking of simply returning it as the return value. This way, a return value of 0 would
indicate that everything was mapped successfully, while a value greater than 0 would indicate
how many GFNs were successfully mapped. And negative value if nothing was be mapped at all:
    static int p2m_set_entry(struct p2m_domain *p2m,
                           gfn_t sgfn,
                           unsigned long nr,
                           mfn_t smfn,
                           p2m_type_t t,
                           p2m_access_t a)
   {
      int rc = 0;
      unsigned int i;
  
      ...
  
      for ( i = 1; i &lt;= nr; i++ )
      {
          ...
          rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
          if ( rc )
              break;
          ...
      }
      
      return i == nr ? 0 : i ?: rc;
   }

~ Oleksii
</pre>
  </body>
</html>

--------------3jage84wVK5YfavCuKu0xHcL--

