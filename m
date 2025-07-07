Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5FAFB285
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035522.1407834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkJ4-0007fC-LC; Mon, 07 Jul 2025 11:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035522.1407834; Mon, 07 Jul 2025 11:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkJ4-0007e5-Hf; Mon, 07 Jul 2025 11:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1035522;
 Mon, 07 Jul 2025 11:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYkJ2-0007dy-Np
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:46:45 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5280b5-5b28-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 13:46:43 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so506823666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 04:46:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e6d2sm686262166b.154.2025.07.07.04.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:46:41 -0700 (PDT)
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
X-Inumbo-ID: 0d5280b5-5b28-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751888802; x=1752493602; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJ2+Po1dh1UQq94RP+CdGm1+We7Sm0huNcVEd/73+M8=;
        b=Nv1b+fzth18vy3dpL6UUDm+BMHarZ2UIcm4lf5qbjXVk0tQI3xOyTNQ/vmSk4ryIZH
         HpnWvIoNRsINKYGAN57IivZkt1e6xHvxgeagpQ4k6mu2pbvVpGXcQ6VAn0EmamMKmDtl
         Fn9EdNXQz5P6H2ioAZtZkKdmW/H9bT+QSHNzOGkDNJtyecTU/O1KVlWl1O7bR9fxCCvP
         tONTatIqbcZ8ZrNFo7fNa7sTttBqHCc/sD1GY2UHiA/inyFIbN6lbxFltEiOlqSe0xA9
         KtgzWT2QDZakBPxvvDiJhhOfckzHEGruryNeDz0B4ktncgZB7le8g++70+2p1RcFnwNa
         mSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888802; x=1752493602;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJ2+Po1dh1UQq94RP+CdGm1+We7Sm0huNcVEd/73+M8=;
        b=uLbUzfMZ31iC9sr2TzTavjKKKNRHz/qfonOrpj72cVGvzpxtFe00v/vs38gBz3if2C
         splihaq8rhUCVRR2/6X8QsVQfC+n9zs4r9X005XotKmiph/jj5OQbwjYTlTZ+/2xpn0p
         HGhy+HTnN6r++f7J7/GIXnaPMy/3uTNOqvev4YQVBjO5DdaH9O4g3LQu32RsIX0tLGMe
         GCgDRGEoUK61nVhv97NxxL5tdImxp1/uyBBoRIdAy0Kfo+pCo0A5itZV/4NyhDVOY3Xe
         b8WV0/qC4xWczRvJDC5GVLIz/pP6ZKzMLw2T8fVGR3Lp3p71X04iwh09nn8dyBaQHcO/
         SheA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ukX6cGZNRg1ZOaxr2DlKxxJ+mE7gonD/VjYkn96YxWrvnKgauGEuqF7ZpS1glNi9DBldEwsgXWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAQe6R3xqNiThqf772nytY+bgTV6HomTq+NfIBWJTeycudkXdy
	m++iYwWFjSMwdxmXxOva8Xzjz+pQgBvb/SeI0wXO1P0I0VvdRSHyAr9o
X-Gm-Gg: ASbGnctFgNfOA5xz1EUDAgzWoHD+vCZ64m73egjVJVIJm1Y9WKsZ2b3HgNld9XrEQTz
	OmueU7Sn0chdi+BDmHWrj9eMVcnaV9K+Ej9en5SD/Fy+XHP+kGz5BP1afBWfHIXOgdbuhvQGlKX
	zV3TgTsH2UdyGBQ/GLadXPxEivQHYhaxVnkLAXctm1CTEvupakmhbbKH8R1SjrumrInrfndt5Qp
	0i4ecjbgTxLEW5b36EQYobjoqItAVXTBLmPWphNqWvAgzaX7wYenuU4o0a+TP4zumPAXLpytMsl
	RH37iJUW3LYOHKYeqj0upCiSxdDEFSTiUvyljPniPyjUoxxvf0qCFKzUnoTrzoCi1e2XQ5z+Puo
	PYxJlSmuMwuJNnKnYT9vIwn3HmYiyUVR5fck=
X-Google-Smtp-Source: AGHT+IFKQ9J3qbtVl9Xx0NU/VYCIWir+3RwXpxOWQvcnfU09emxy2bPLtsvHThH0gmnT+1SLIk9kPA==
X-Received: by 2002:a17:907:c15:b0:ae3:c968:370 with SMTP id a640c23a62f3a-ae3fe831ddamr991154966b.59.1751888801929;
        Mon, 07 Jul 2025 04:46:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------F1OzagL0MaOQ1C2ILP0roqcR"
Message-ID: <82362709-c386-485e-935c-e229e735fba6@gmail.com>
Date: Mon, 7 Jul 2025 13:46:40 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2afe5641-0790-4f27-823b-ab941ad2c971@suse.com>

This is a multi-part message in MIME format.
--------------F1OzagL0MaOQ1C2ILP0roqcR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/7/25 9:20 AM, Jan Beulich wrote:
> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
>>>> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
>>>> modifications.
>>>>
>>>> Key differences include:
>>>> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>>>>     break-before-make (BBM). As a result, the flushing logic is simplified.
>>>>     TLB invalidation can be deferred until p2m_write_unlock() is called.
>>>>     Consequently, the p2m->need_flush flag is always considered true and is
>>>>     removed.
>>>> - Page Table Traversal: The order of walking the page tables differs from Arm,
>>>>     and this implementation reflects that reversed traversal.
>>>> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>>>>     P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
>>>>
>>>> The main functionality is in __p2m_set_entry(), which handles mappings aligned
>>>> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
>>>>
>>>> p2m_set_entry() breaks a region down into block-aligned mappings and calls
>>>> __p2m_set_entry() accordingly.
>>>>
>>>> Stub implementations (to be completed later) include:
>>>> - p2m_free_entry()
>>> What would a function of this name do?
>> Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
>> put_page() (which will free if there is no any reference to this page),
>> freeing intermediate page table (after all entries were freed) by removing
>> it from d->arch.paging.freelist, and removes correspondent page of intermediate page
>> table from p2m->pages list.
>>
>>> You can clear entries, but you can't
>>> free them, can you?
>> Is is a question regarding terminology?
> Yes. If one sees a call to a function, it should be possible to at least
> roughly know what it does without needing to go look at the implementation.
>
>> I can't free entry itself, but a page table or
>> a page (if it is a leaf entry) on which it points could free.
> Then e.g. pte_free_subtree() or some such?

It sounds fine to me. I'll use suggested name.

Just want to notice that other arches also have the same function
for the same purpose with the same name.
Does it make sense then to change a name for all arches?

>
>>>> +static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>> The rule of thumb is to have inline functions only in header files, leaving
>>> decisions to the compiler elsewhere.
>> I am not sure what you mean in the second part (after coma) of your sentence.
> The compiler does its own inlining decisions quite fine when it can see all
> call sites (as is the case for static functions). Hence in general you want
> to omit "inline" there. Except of course in header files, where non-inline
> static-s are a problem.

Thanks, now it is clear what you meant.

>
>>>> +{
>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>> +
>>>> +    return false;
>>>> +}
>>> For this function in particular, though: Besides the "p2me" in the name
>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>> how is this going to be different from pte_is_valid()?
>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>> what is a type stored in the radix tree (p2m->p2m_types):
>>     /*
>>      * In the case of the P2M, the valid bit is used for other purpose. Use
>>      * the type to check whether an entry is valid.
>>      */
>>     static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>     {
>>         return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>     }
>>
>> It is done to track which page was modified by a guest.
> But then (again) the name doesn't convey what the function does.

Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.

>   Plus
> can't a guest also arrange for an entry's type to move to p2m_invalid?
> That's then still an entry that was modified by the guest.

I am not really sure that I fully understand the question.
Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
with p2m_invalid argument?
If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
this entry isn't expected to be used anymore.

> Overall I think I'm lacking clarity what you mean to use this predicate
> for.

By using of "p2me_" predicate I wanted to express that not PTE's valid bit will be
checked, but the type saved in radix tree will be used.
As suggested above probably it will be better drop "e" too and just use p2m_type_is_valid().

>
>>>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>>>> +{
>>>> +    write_pte(p, pte);
>>>> +    if ( clean_pte )
>>>> +        clean_dcache_va_range(p, sizeof(*p));
>>>> +}
>>>> +
>>>> +static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
>>>> +{
>>>> +    pte_t pte;
>>>> +
>>>> +    memset(&pte, 0x00, sizeof(pte));
>>>> +    p2m_write_pte(p, pte, clean_pte);
>>>> +}
>>> May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
>>> (or simply give the variable a trivial initializer)?
>> Sure, I will rename and use plain 0.
>>
>>> As to the earlier function that I commented on: Seeing the names here,
>>> wouldn't p2m_pte_is_valid() be a more consistent name there?
>> Then all p2me_*() should be updated to p2m_pte_*().
>>
>> But initial logic was that p2me = p2m entry = p2m page table entry.
>>
>> Probably we can just return back to the prefix p2m_ as based on arguments
>> it is clear that it is a function for working with P2M's PTE.
> In the end it's up to you. Having thought about it some more, perhaps
> p2me_*() is still quite helpful to separate from functions dealing with
> P2Ms as a while, and to also avoid the verbosity of p2m_pte_*().
>
>>>> +{
>>>> +    unsigned int level;
>>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>>> +    pte_t *entry, *table, orig_pte;
>>>> +    int rc;
>>>> +    /* A mapping is removed if the MFN is invalid. */
>>>> +    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
>>>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
>>>> +
>>>> +    ASSERT(p2m_is_write_locked(p2m));
>>>> +
>>>> +    /*
>>>> +     * Check if the level target is valid: we only support
>>>> +     * 4K - 2M - 1G mapping.
>>>> +     */
>>>> +    ASSERT(target <= 2);
>>> No provisions towards the division that produced the value having left
>>> a remainder?
>> The way the order is initialized will always result in division without
>> a remainder.
>>
>> If it makes sense, the|ASSERT()| could be updated to ensure that the order
>> is always a multiple of|PAGETABLE_ORDER|:
>>     ASSERT((target <= 2) && !IS_ALIGNED(page_order, PAGETABLE_ORDER));
> Except that the ! looks wrong here.

Agree, it shouldn't be here. Thanks.

>
>>>> @@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>>>                             p2m_type_t t,
>>>>                             p2m_access_t a)
>>>>    {
>>>> -    return -EOPNOTSUPP;
>>>> +    int rc = 0;
>>>> +
>>>> +    /*
>>>> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
>>>> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
>>>> +     * be accessible after, we need to prevent mapping to be added when the
>>>> +     * domain is dying.
>>>> +     */
>>>> +    if ( unlikely(p2m->domain->is_dying) )
>>>> +        return -ENOMEM;
>>> Why ENOMEM?
>> I expect that when a domain is dying, it means there’s no point in using its
>> memory—either because it's no longer available or it has already been freed.
>> Basically, no memory.
> That can end up odd for call sites. Please consider using e.g. EACCES.
>
>>>> +    while ( nr )
>>> Why's there a loop here? The function name uses singular, i.e. means to
>>> create exactly one entry.
>> I will rename the function to  p2m_set_entries().
> Or maybe p2m_set_range()?

It is much better.

>
>>>> +        /*
>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>> +         *
>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>> +         * superpage size.
>>>> +         */
>>> Does this really need leaving as a to-do?
>> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
>> a smaller order will simply be chosen.
> Well, my question was more like "Isn't it simple enough to cover the case
> right away?"
>
>>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>>> +        mask |= gfn_x(sgfn) | nr;
>>>> +
>>>> +        for ( ; i != 0; i-- )
>>>> +        {
>>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>>> +            {
>>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>>> +                    break;
>>> Nit: Style.
>>>
>>>> +            }
>>>> +        }
>>>> +
>>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>>> +        if ( rc )
>>>> +            break;
>>>> +
>>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>>> +           smfn = mfn_add(smfn, (1 << order));
>>>> +
>>>> +        nr -= (1 << order);
>>> Throughout maybe better be safe right away and use 1UL?
>>>
>>>> +    }
>>>> +
>>>> +    return rc;
>>>>    }
>>> How's the caller going to know how much of the range was successfully
>>> mapped?
>> There is no such option. Do other arches do that? I mean returns somehow
>> the number of successfully mapped (sgfn,smfn).
> On x86 we had to introduce some not very nice code to cover for the absence
> of proper handling there. For a new port I think it wants at least seriously
> considering not to repeat such a potentially unhelpful pattern.
>
>>> That part may need undoing (if not here, then in the caller),
>>> or a caller may want to retry.
>> So the caller in the case if rc != 0, can just undoing the full range
>> (by using the same sgfn, nr, smfn).
> Can it? How would it know what the original state was?

You're right — blindly unmapping the range assumes that no entries were valid
beforehand and I missed that it could be that something valid was mapped before
p2m_set_entry(sgfn,...,smfn) was called.
But then I am not really understand why it won't be an issue if will know
how many GFNs were successfully mapped.

~ Oleksii

--------------F1OzagL0MaOQ1C2ILP0roqcR
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
    <div class="moz-cite-prefix">On 7/7/25 9:20 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
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
        <pre wrap="" class="moz-quote-pre">
Is is a question regarding terminology?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes. If one sees a call to a function, it should be possible to at least
roughly know what it does without needing to go look at the implementation.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I can't free entry itself, but a page table or
a page (if it is a leaf entry) on which it points could free.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Then e.g. pte_free_subtree() or some such?</pre>
    </blockquote>
    <pre>It sounds fine to me. I'll use suggested name.

Just want to notice that other arches also have the same function
for the same purpose with the same name.
Does it make sense then to change a name for all arches?

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The rule of thumb is to have inline functions only in header files, leaving
decisions to the compiler elsewhere.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I am not sure what you mean in the second part (after coma) of your sentence.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The compiler does its own inlining decisions quite fine when it can see all
call sites (as is the case for static functions). Hence in general you want
to omit "inline" there. Except of course in header files, where non-inline
static-s are a problem.</pre>
    </blockquote>
    <pre>Thanks, now it is clear what you meant.

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
        <pre wrap="" class="moz-quote-pre">
pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
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
      <pre wrap="" class="moz-quote-pre">
But then (again) the name doesn't convey what the function does.</pre>
    </blockquote>
    <pre>Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre"> Plus
can't a guest also arrange for an entry's type to move to p2m_invalid?
That's then still an entry that was modified by the guest.</pre>
    </blockquote>
    <pre>I am not really sure that I fully understand the question.
Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
with p2m_invalid argument?
If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
this entry isn't expected to be used anymore.

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">Overall I think I'm lacking clarity what you mean to use this predicate
for.</pre>
    </blockquote>
    <pre>By using of "p2me_" predicate I wanted to express that not PTE's valid bit will be
checked, but the type saved in radix tree will be used.
As suggested above probably it will be better drop "e" too and just use p2m_type_is_valid().

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&amp;pte, 0x00, sizeof(pte));
+    p2m_write_pte(p, pte, clean_pte);
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
(or simply give the variable a trivial initializer)?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Sure, I will rename and use plain 0.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
As to the earlier function that I commented on: Seeing the names here,
wouldn't p2m_pte_is_valid() be a more consistent name there?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Then all p2me_*() should be updated to p2m_pte_*().

But initial logic was that p2me = p2m entry = p2m page table entry.

Probably we can just return back to the prefix p2m_ as based on arguments
it is clear that it is a function for working with P2M's PTE.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In the end it's up to you. Having thought about it some more, perhaps
p2me_*() is still quite helpful to separate from functions dealing with
P2Ms as a while, and to also avoid the verbosity of p2m_pte_*().

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target &lt;= 2);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">No provisions towards the division that produced the value having left
a remainder?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The way the order is initialized will always result in division without
a remainder.

If it makes sense, the|ASSERT()| could be updated to ensure that the order
is always a multiple of|PAGETABLE_ORDER|:
   ASSERT((target &lt;= 2) &amp;&amp; !IS_ALIGNED(page_order, PAGETABLE_ORDER));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Except that the ! looks wrong here.</pre>
    </blockquote>
    <pre>Agree, it shouldn't be here. Thanks.

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
                           p2m_type_t t,
                           p2m_access_t a)
  {
-    return -EOPNOTSUPP;
+    int rc = 0;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m-&gt;domain-&gt;is_dying) )
+        return -ENOMEM;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why ENOMEM?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I expect that when a domain is dying, it means there’s no point in using its
memory—either because it's no longer available or it has already been freed.
Basically, no memory.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That can end up odd for call sites. Please consider using e.g. EACCES.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    while ( nr )
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why's there a loop here? The function name uses singular, i.e. means to
create exactly one entry.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I will rename the function to  p2m_set_entries().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Or maybe p2m_set_range()?</pre>
    </blockquote>
    <pre>It is much better.

</pre>
    <blockquote type="cite"
      cite="mid:2afe5641-0790-4f27-823b-ab941ad2c971@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
        <pre wrap="" class="moz-quote-pre">
I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
a smaller order will simply be chosen.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, my question was more like "Isn't it simple enough to cover the case
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
        <pre wrap="" class="moz-quote-pre">
There is no such option. Do other arches do that? I mean returns somehow
the number of successfully mapped (sgfn,smfn).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
On x86 we had to introduce some not very nice code to cover for the absence
of proper handling there. For a new port I think it wants at least seriously
considering not to repeat such a potentially unhelpful pattern.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">That part may need undoing (if not here, then in the caller),
or a caller may want to retry.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
So the caller in the case if rc != 0, can just undoing the full range
(by using the same sgfn, nr, smfn).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can it? How would it know what the original state was?</pre>
    </blockquote>
    <pre>You're right — blindly unmapping the range assumes that no entries were valid
beforehand and I missed that it could be that something valid was mapped before
p2m_set_entry(sgfn,...,smfn) was called.
But then I am not really understand why it won't be an issue if will know
how many GFNs were successfully mapped.

~ Oleksii
</pre>
  </body>
</html>

--------------F1OzagL0MaOQ1C2ILP0roqcR--

