Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F0AFB6AA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035633.1407971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnKX-0005k0-U3; Mon, 07 Jul 2025 15:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035633.1407971; Mon, 07 Jul 2025 15:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnKX-0005h9-Qq; Mon, 07 Jul 2025 15:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1035633;
 Mon, 07 Jul 2025 15:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYnKW-0005h3-Fo
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:00:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d495d8e-5b43-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 17:00:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ade5b8aab41so672294966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:00:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b66419sm712102266b.167.2025.07.07.08.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:00:24 -0700 (PDT)
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
X-Inumbo-ID: 1d495d8e-5b43-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751900426; x=1752505226; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqE8ZUvTRqdLZdH8U2NXVhUjGwGPnT+ZszjezIqgSRE=;
        b=VdHa+b7SwIQRzJCE+3EXHFScjySAN0Mx+DKva2la80ONjBal2z5FQ2Kmu+jZNVKjOQ
         vYxtF9Kb6jkLgpUcyScaFCH+YIDTWmadc9YeGmq3MdFFtADPldTroiTaJJaM/PG/2qmk
         OZTTsTdrsbrhRb7gMbPyEUf5tXk2StZlzknb8uoJQuFZLeNNXgAQVl2hcx9o/zXcgl63
         18wZ8rHR2CPufDDncsYq8e+ylIU0Eo7VyALM9rHBfkYO3CA9yZmAfjsmFJSPxG8uqdS0
         7qpoaAphIpj/mrLK1T7sqDbCpZds1GoQc8C4cMVFD4c+gaBGAaPKLPYfy9DidbnkUOX3
         gfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751900426; x=1752505226;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqE8ZUvTRqdLZdH8U2NXVhUjGwGPnT+ZszjezIqgSRE=;
        b=UBUpEgcaxP90jfvIpjdBFXBbnwx6wnbnwCNCfIM5OGmySz87cLigmmEqBnFeiskmUJ
         paqpRXWGXEZ4LWlpz3NZ8YSM4uiwMhz5YV1+h0CNAHgMaoOfgFgi8FjOjIgzJhwtefQz
         ZHqFWDd+tOSxZAJLybSukNis43RDn9SQuz+DEQcXF+Az17m5GzqfseFe8SKEDslJZHC9
         skbWfCx/GeUksMW5O8iwng1ZXGAfEnPZ6T4pGuywrOJz85eIowAzKqToA70b6WjklOFj
         /QGIF+6GCcrmktCeX/c0LiqQF0fyysyBBGpvlYoeGH5DEdxSjUiwcIvboBo0SwnnkiWr
         zW5w==
X-Forwarded-Encrypted: i=1; AJvYcCV53pP/K5k8htM9qxt9tFKvF+4eoWtgpsZPUOxT7QOs8Qpwgj5uEMsz3BhAaOgml6ipDfJ/lr5M5+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykGIWGFES7DtLWp7VZKLqAdNwxQtyPhgU4OWqvKTC674+dfIgG
	Hujw8VhubgNf1hXin9wMox88Pd4xWCum2yvqWcxmAKS8SuGGFk+vSlXS
X-Gm-Gg: ASbGncueq4RjubPMZbDf6bnNfIqRIfNwjXwI6vDhAouIzmYqeUWbj47E2eh/iH0Lkb+
	+2NWF943DJicERPtCPI7MtEui3aRSTavUTs8mV4wIpySU5mJ4WshPJGZYCQx58wEjWzK0VHA9VX
	o3zrve07Ea+1E5aEMPOfCAFi8HjRvezuoMORzMj6/O23/yhbdE3cy/omBrbo0DbQJvrrEx5JF4F
	AAlOy5RJe8yPTAOi6xV+E4r/kX1D18U380VXHtR9uQ2yskiS6b+6qTGQrhECcbjli+c1L0N9TQ1
	irKglPEOKfnIzwZ5dt0M8/FdFuVbIlbkNkLSozPTrKLgUy+Y3VXFA0RwZsG+3qSRcCjfcYnjaBB
	3Z51/Vx6fmU7YCw5tsJ3vFvLIW+GCQl/kDBg=
X-Google-Smtp-Source: AGHT+IGmd/ktUcARQVIHqKctJC7XN5iUNPpP2+sLzebmIMXhYbX5eb3/Wbj21x2Iz1ulbqN+R+PXhQ==
X-Received: by 2002:a17:907:9496:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae3fe6fa77cmr1229160266b.37.1751900425038;
        Mon, 07 Jul 2025 08:00:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------C4Q7PEIzebT9zSxv8YE5Qu6J"
Message-ID: <8036ddb2-f223-41f5-a498-75b483c237bb@gmail.com>
Date: Mon, 7 Jul 2025 17:00:23 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cec77342-367c-41fe-abaf-b7e04309ca63@suse.com>

This is a multi-part message in MIME format.
--------------C4Q7PEIzebT9zSxv8YE5Qu6J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/7/25 2:53 PM, Jan Beulich wrote:
> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
>>>>>> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
>>>>>> modifications.
>>>>>>
>>>>>> Key differences include:
>>>>>> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>>>>>>      break-before-make (BBM). As a result, the flushing logic is simplified.
>>>>>>      TLB invalidation can be deferred until p2m_write_unlock() is called.
>>>>>>      Consequently, the p2m->need_flush flag is always considered true and is
>>>>>>      removed.
>>>>>> - Page Table Traversal: The order of walking the page tables differs from Arm,
>>>>>>      and this implementation reflects that reversed traversal.
>>>>>> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>>>>>>      P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
>>>>>>
>>>>>> The main functionality is in __p2m_set_entry(), which handles mappings aligned
>>>>>> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
>>>>>>
>>>>>> p2m_set_entry() breaks a region down into block-aligned mappings and calls
>>>>>> __p2m_set_entry() accordingly.
>>>>>>
>>>>>> Stub implementations (to be completed later) include:
>>>>>> - p2m_free_entry()
>>>>> What would a function of this name do?
>>>> Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
>>>> put_page() (which will free if there is no any reference to this page),
>>>> freeing intermediate page table (after all entries were freed) by removing
>>>> it from d->arch.paging.freelist, and removes correspondent page of intermediate page
>>>> table from p2m->pages list.
>>>>
>>>>> You can clear entries, but you can't
>>>>> free them, can you?
>>>> Is is a question regarding terminology?
>>> Yes. If one sees a call to a function, it should be possible to at least
>>> roughly know what it does without needing to go look at the implementation.
>>>
>>>> I can't free entry itself, but a page table or
>>>> a page (if it is a leaf entry) on which it points could free.
>>> Then e.g. pte_free_subtree() or some such?
>> It sounds fine to me. I'll use suggested name.
>>
>> Just want to notice that other arches also have the same function
>> for the same purpose with the same name.
> As to x86, it's not general P2M code which uses this odd (for the purpose)
> name, but only p2m-pt.c.
>
>> Does it make sense then to change a name for all arches?
> I think so.
>
>>>>>> +{
>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>> +
>>>>>> +    return false;
>>>>>> +}
>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>> how is this going to be different from pte_is_valid()?
>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>      /*
>>>>       * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>       * the type to check whether an entry is valid.
>>>>       */
>>>>      static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>      {
>>>>          return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>      }
>>>>
>>>> It is done to track which page was modified by a guest.
>>> But then (again) the name doesn't convey what the function does.
>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
> For P2M type checks please don't invent new naming, but use what both x86
> and Arm are already using. Note how we already have p2m_is_valid() in that
> set. Just that it's not doing what you want here.

Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
And in here it is checked if P2M pte is valid from P2M point of view by checking
the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
free bits for type).

>
>>>    Plus
>>> can't a guest also arrange for an entry's type to move to p2m_invalid?
>>> That's then still an entry that was modified by the guest.
>> I am not really sure that I fully understand the question.
>> Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
>> with p2m_invalid argument?
> That I'm not asking, but rather stating. I.e. I expect such is possible.
>
>> If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
>> will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
>> this entry isn't expected to be used anymore.
> Right. But such an entry would still have been "modified" by the guest.

Yes, but nothing then is needed to do with it. For example, if it is already invalid there
is not any sense to flush page to RAM (as in this case PTE's bit will be checked),
something like Arm does:
   https://elixir.bootlin.com/xen/v4.20.0/source/xen/arch/arm/p2m.c#L375

>>>>>> +        /*
>>>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>>>> +         *
>>>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>>>> +         * superpage size.
>>>>>> +         */
>>>>> Does this really need leaving as a to-do?
>>>> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
>>>> a smaller order will simply be chosen.
>>> Well, my question was more like "Isn't it simple enough to cover the case
>>> right away?"
>>>
>>>>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>>>>> +        mask |= gfn_x(sgfn) | nr;
>>>>>> +
>>>>>> +        for ( ; i != 0; i-- )
>>>>>> +        {
>>>>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>>>>> +            {
>>>>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>>>>> +                    break;
>>>>> Nit: Style.
>>>>>
>>>>>> +            }
>>>>>> +        }
>>>>>> +
>>>>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>>>>> +        if ( rc )
>>>>>> +            break;
>>>>>> +
>>>>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>>>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>>>>> +           smfn = mfn_add(smfn, (1 << order));
>>>>>> +
>>>>>> +        nr -= (1 << order);
>>>>> Throughout maybe better be safe right away and use 1UL?
>>>>>
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>>     }
>>>>> How's the caller going to know how much of the range was successfully
>>>>> mapped?
>>>> There is no such option. Do other arches do that? I mean returns somehow
>>>> the number of successfully mapped (sgfn,smfn).
>>> On x86 we had to introduce some not very nice code to cover for the absence
>>> of proper handling there. For a new port I think it wants at least seriously
>>> considering not to repeat such a potentially unhelpful pattern.
>>>
>>>>> That part may need undoing (if not here, then in the caller),
>>>>> or a caller may want to retry.
>>>> So the caller in the case if rc != 0, can just undoing the full range
>>>> (by using the same sgfn, nr, smfn).
>>> Can it? How would it know what the original state was?
>> You're right — blindly unmapping the range assumes that no entries were valid
>> beforehand and I missed that it could be that something valid was mapped before
>> p2m_set_entry(sgfn,...,smfn) was called.
>> But then I am not really understand why it won't be an issue if will know
>> how many GFNs were successfully mapped.
> The caller may know what that range's state was. But what I really wanted to
> convey is: Updating multiple entries in one go is complicated in some of the
> corner cases. You will want to think this through now, in order to avoid the
> need to re-write everything later again.

I can add one more argument to return the number of successfully mapped GFNs.
Fortunately, that's very easy to do.

The problem for me is that I don’t really understand what the caller is supposed
to do with that information. The only use case I can think of is that the caller
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

For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
tree node, and the mapping fails partway through, I’m left with two options: either
ignore the device (if it's not essential for Xen or guest functionality) and continue
  booting; in which case I’d need to perform a rollback, and simply knowing the number
of successfully mapped GFNs may not be enough or, more likely, just panic.

Are there any realistic use cases where knowing the number of mapped GFNs or having
rollback support would actually allow us to avoid a panic?

Even more so, how would that information be used in the current call chain?
We have the following chain:
  |map_regions_p2mt()| →|p2m_insert()| →|p2m_set_entry()|

If|p2m_set_entry()| returns the number of successfully mapped GFNs, what should
|p2m_insert()| do with it — process it further, or just pass it along to
|map_regions_p2mt()|?

Thanks in advance for clarifications.
|~ Oleksii |


--------------C4Q7PEIzebT9zSxv8YE5Qu6J
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
    <div class="moz-cite-prefix">On 7/7/25 2:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cec77342-367c-41fe-abaf-b7e04309ca63@suse.com">
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
                <pre wrap="" class="moz-quote-pre">This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
modifications.

Key differences include:
- TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
    break-before-make (BBM). As a result, the flushing logic is simplified.
    TLB invalidation can be deferred until p2m_write_unlock() is called.
    Consequently, the p2m-&gt;need_flush flag is always considered true and is
    removed.
- Page Table Traversal: The order of walking the page tables differs from Arm,
    and this implementation reflects that reversed traversal.
- Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
    P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.

The main functionality is in __p2m_set_entry(), which handles mappings aligned
to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).

p2m_set_entry() breaks a region down into block-aligned mappings and calls
__p2m_set_entry() accordingly.

Stub implementations (to be completed later) include:
- p2m_free_entry()
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">What would a function of this name do?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
put_page() (which will free if there is no any reference to this page),
freeing intermediate page table (after all entries were freed) by removing
it from d-&gt;arch.paging.freelist, and removes correspondent page of intermediate page
table from p2m-&gt;pages list.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">You can clear entries, but you can't
free them, can you?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Is is a question regarding terminology?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yes. If one sees a call to a function, it should be possible to at least
roughly know what it does without needing to go look at the implementation.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I can't free entry itself, but a page table or
a page (if it is a leaf entry) on which it points could free.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Then e.g. pte_free_subtree() or some such?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It sounds fine to me. I'll use suggested name.

Just want to notice that other arches also have the same function
for the same purpose with the same name.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As to x86, it's not general P2M code which uses this odd (for the purpose)
name, but only p2m-pt.c.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Does it make sense then to change a name for all arches?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think so.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
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
        <pre wrap="" class="moz-quote-pre">
Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For P2M type checks please don't invent new naming, but use what both x86
and Arm are already using. Note how we already have p2m_is_valid() in that
set. Just that it's not doing what you want here.</pre>
    </blockquote>
    <pre>Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
And in here it is checked if P2M pte is valid from P2M point of view by checking
the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
free bits for type).

</pre>
    <blockquote type="cite"
      cite="mid:cec77342-367c-41fe-abaf-b7e04309ca63@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  Plus
can't a guest also arrange for an entry's type to move to p2m_invalid?
That's then still an entry that was modified by the guest.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I am not really sure that I fully understand the question.
Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
with p2m_invalid argument?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That I'm not asking, but rather stating. I.e. I expect such is possible.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
this entry isn't expected to be used anymore.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Right. But such an entry would still have been "modified" by the guest.</pre>
    </blockquote>
    <pre>Yes, but nothing then is needed to do with it. For example, if it is already invalid there
is not any sense to flush page to RAM (as in this case PTE's bit will be checked),
something like Arm does:
  <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/xen/v4.20.0/source/xen/arch/arm/p2m.c#L375">https://elixir.bootlin.com/xen/v4.20.0/source/xen/arch/arm/p2m.c#L375</a>

</pre>
    <blockquote type="cite"
      cite="mid:cec77342-367c-41fe-abaf-b7e04309ca63@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+        /*
+         * Don't take into account the MFN when removing mapping (i.e
+         * MFN_INVALID) to calculate the correct target order.
+         *
+         * XXX: Support superpage mappings if nr is not aligned to a
+         * superpage size.
+         */
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Does this really need leaving as a to-do?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
a smaller order will simply be chosen.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Well, my question was more like "Isn't it simple enough to cover the case
right away?"

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
+        mask |= gfn_x(sgfn) | nr;
+
+        for ( ; i != 0; i-- )
+        {
+            if ( !(mask &amp; (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
+            {
+                    order = XEN_PT_LEVEL_ORDER(i);
+                    break;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Nit: Style.

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+            }
+        }
+
+        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, (1 &lt;&lt; order));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, (1 &lt;&lt; order));
+
+        nr -= (1 &lt;&lt; order);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Throughout maybe better be safe right away and use 1UL?

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    }
+
+    return rc;
   }
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">How's the caller going to know how much of the range was successfully
mapped?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">There is no such option. Do other arches do that? I mean returns somehow
the number of successfully mapped (sgfn,smfn).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">On x86 we had to introduce some not very nice code to cover for the absence
of proper handling there. For a new port I think it wants at least seriously
considering not to repeat such a potentially unhelpful pattern.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">That part may need undoing (if not here, then in the caller),
or a caller may want to retry.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">So the caller in the case if rc != 0, can just undoing the full range
(by using the same sgfn, nr, smfn).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Can it? How would it know what the original state was?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
You're right — blindly unmapping the range assumes that no entries were valid
beforehand and I missed that it could be that something valid was mapped before
p2m_set_entry(sgfn,...,smfn) was called.
But then I am not really understand why it won't be an issue if will know
how many GFNs were successfully mapped.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The caller may know what that range's state was. But what I really wanted to
convey is: Updating multiple entries in one go is complicated in some of the
corner cases. You will want to think this through now, in order to avoid the
need to re-write everything later again.</pre>
    </blockquote>
    <pre data-start="49" data-end="164">I can add one more argument to return the number of successfully mapped GFNs.
Fortunately, that's very easy to do.</pre>
    <pre data-start="166" data-end="553">The problem for me is that I don’t really understand what the caller is supposed
to do with that information. The only use case I can think of is that the caller
might try to map the remaining GFNs again. But that doesn’t seem very useful,
if <code data-start="410" data-end="427">p2m_set_entry()</code> wasn’t able to map the full range, it likely indicates a serious
issue, and retrying would probably result in the same error.</pre>
    <pre data-start="555" data-end="849" data-is-last-node=""
    data-is-only-node="">The same applies to rolling back the state. It wouldn’t be difficult to add a local
array to track all modified PTEs and then use it to revert the state if needed.
But again, what would the caller do after the rollback? At this point, it still seems
like the best option is simply to <code data-start="839" data-end="848">panic().

</code></pre>
    <pre data-start="66" data-end="315">Basically, I don’t see or understand the cases where knowing how many GFNs were
successfully mapped, or whether a rollback was performed, would really help — because
in most cases, I don’t have a better option than just calling <code
    data-start="294" data-end="303">panic()</code> at the end.</pre>
    <pre data-start="317" data-end="734">For example, if I call <code
    data-start="340" data-end="360">map_regions_p2mt()</code> for an MMIO region described in a device
tree node, and the mapping fails partway through, I’m left with two options: either
ignore the device (if it's not essential for Xen or guest functionality) and continue
 booting; in which case I’d need to perform a rollback, and simply knowing the number
of successfully mapped GFNs may not be enough or, more likely, just panic.</pre>
    <pre data-start="736" data-end="878">Are there any realistic use cases where knowing the number of mapped GFNs or having
rollback support would actually allow us to avoid a panic?</pre>
    <pre data-start="880" data-end="955">Even more so, how would that information be used in the current call chain?
We have the following chain:
 <code data-start="988" data-end="1008">map_regions_p2mt()</code> → <code
    data-start="1011" data-end="1025">p2m_insert()</code> → <code
    data-start="1028" data-end="1045">p2m_set_entry()</code>

If <code data-start="1051" data-end="1068">p2m_set_entry()</code> returns the number of successfully mapped GFNs, what should
<code data-start="1129" data-end="1143">p2m_insert()</code> do with it — process it further, or just pass it along to
<code data-start="1202" data-end="1222">map_regions_p2mt()</code>?</pre>
    <pre data-start="555" data-end="849" data-is-last-node=""
    data-is-only-node="">Thanks in advance for clarifications.
<code data-start="839" data-end="848">
~ Oleksii
</code></pre>
    <pre></pre>
    <br>
  </body>
</html>

--------------C4Q7PEIzebT9zSxv8YE5Qu6J--

