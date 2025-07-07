Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617AAFB861
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 18:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035712.1408071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYoQY-0004Jo-2O; Mon, 07 Jul 2025 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035712.1408071; Mon, 07 Jul 2025 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYoQX-0004I9-Vy; Mon, 07 Jul 2025 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1035712;
 Mon, 07 Jul 2025 16:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYoQX-0004I3-0w
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 16:10:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef011f27-5b4c-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 18:10:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-adfb562266cso523713666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 09:10:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66d93afsm729360666b.6.2025.07.07.09.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 09:10:42 -0700 (PDT)
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
X-Inumbo-ID: ef011f27-5b4c-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751904643; x=1752509443; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EeLOUHoZUQaII23dJWtlH32DOfTFSeJCbDxaei1nRQ=;
        b=EsBegeq3XuAko/nTloQ0kbYgTUBsW6PHct6of86yl0455m0Z8qLQqunYFYR8UGV0L9
         Z+ZmqqOEzQIqAI2XT3xwqE4WnTV0eQzlQciPT1yRi4v6nnEMk381CFcB31DbxPtX4WBu
         jtmSflZ0NxMhssH7hJ3FYTzEb2pEyMxfZYs5v5/mKwF3XfDC8R7/5gDeZ3H6NjrqPGBs
         dKthdfEfV4Tx6wk2nt/knvMzd9mMKuCH7LfojGQIeiijGOZ3hCe/o1kQvjMyG/UbTmzz
         9rVqQJfMv64rN9DrVwN3NprG+uLiZg9NFLCx6wtN4lFamyyYdN5HqF7BuUOyL8PTAJbe
         8Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904643; x=1752509443;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EeLOUHoZUQaII23dJWtlH32DOfTFSeJCbDxaei1nRQ=;
        b=klfG0+2fzooIfIeee8BMZ98WVGmG5OqIFA/1fhpOlrYNrESOFrOsrjq8kFPn/ArWQ7
         bbYIK6dWcetga1qLCTauOTcP4P6MjtLrLiqlkyfb68nvt7n5AeNOGpW7MVPGnGNkgyJZ
         nH457Np1ZXN4TDwXUiAVSgha7KAK60BTH9iWd7+aBNUht5WV1VVaoVesA1EyWJZUJ15h
         jwJW5W4gE+QleBeoh/LurW9tQKUVOs+JhbVCFpp/2hDTdXqiWUenKyvTLqKwsLAaWJiR
         YgF1BKMOMbU7cMSlYBpzl2Wur33sWlngV89UEt1FIpwrz2mCWYhG7018x11FJ8E+eI+L
         EjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc27RGdOBbkI6CRjzMgricDBPz+FbQCv4grmVsN1chIl0MDuFairbgxx4ezFxHQy5uA+dCXHmlGdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+eMzuTSnYfMQCW5jLo40xW+BiqrjNPBl8f1Mvlri0t70zCT0f
	WdnrtjWDZ0A7gFt06aPiqmM0Fd+2Xp8es3IdD02PVACupobD32/lEoug
X-Gm-Gg: ASbGnctxIqDVrrOZqxjO5Z3+poEO2ONjzt3H+BIKfvhTMvB5OE6hve8agRI3t7s170O
	a42O8tVQYUJqDYcRxXQYZDZwpNpLfJPtUAkT3h+wz75IkkH4a7fj7Ly/QO+HfEzDl2lDPC26jbT
	571aj1k9Wgl3Fsx+O+9Q2dHqLdIZhB303E2DgP4UeS8iFbre+/s8ubRwc1LclmnREsXZe6JDGrK
	p+EtAUYQhiWvgmX3f/w2fqcsiI99houZvXwXdRp7YRecvErmd4k17FlcnaDv7Jwdn8ACLr+phGt
	grdeWJZSjwuUO2tB7W8oU5hCdW6z6YyesQ2AhOqVAxw37Vg8jsMvvKXLMq4/9oL14z3+gukviWs
	QuTWrlwy+FzTySsWHE/PxIUp8U7MlJA2tyrk=
X-Google-Smtp-Source: AGHT+IFhviJl5YslHUlij/uwhG/GVVuzueUCnRLs2v/xO04IUsGSfhEp0pEtfRdrOzZ6GYUxUCcO0A==
X-Received: by 2002:a17:907:7b89:b0:ae3:6bd5:ebe7 with SMTP id a640c23a62f3a-ae4108e67e2mr990942366b.54.1751904642558;
        Mon, 07 Jul 2025 09:10:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------vH0uxB9fUD6YxWBCEIHWyUu0"
Message-ID: <8f166b5d-eed3-4695-a0e9-ba8fc8a2b9b2@gmail.com>
Date: Mon, 7 Jul 2025 18:10:41 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com>

This is a multi-part message in MIME format.
--------------vH0uxB9fUD6YxWBCEIHWyUu0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/7/25 5:15 PM, Jan Beulich wrote:
> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> +{
>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>> +
>>>>>>>> +    return false;
>>>>>>>> +}
>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>       /*
>>>>>>        * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>        * the type to check whether an entry is valid.
>>>>>>        */
>>>>>>       static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>       {
>>>>>>           return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>       }
>>>>>>
>>>>>> It is done to track which page was modified by a guest.
>>>>> But then (again) the name doesn't convey what the function does.
>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>> For P2M type checks please don't invent new naming, but use what both x86
>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>> set. Just that it's not doing what you want here.
>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>> free bits for type).
> Because this is how it's defined on x86:
>
> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>                               (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>
> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
> would better be uniform across architectures, such that in principle they
> might also be usable in common code (as we already do with p2m_is_foreign()).

Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
x86 and Arm have different understanding what is valid.

Except what mentioned in the comment that grant types aren't considered valid
for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
p2m_is_valid() is stricter then Arm's one and if other arches should be also
so strict.
It seems like from the point of view of mapping/unmapping it is enough just
to verify a "copy" of PTE's valid bit (in terms of P2M it is p2m_invalid type).

>
>>>>>     Plus
>>>>> can't a guest also arrange for an entry's type to move to p2m_invalid?
>>>>> That's then still an entry that was modified by the guest.
>>>> I am not really sure that I fully understand the question.
>>>> Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
>>>> with p2m_invalid argument?
>>> That I'm not asking, but rather stating. I.e. I expect such is possible.
>>>
>>>> If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
>>>> will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
>>>> this entry isn't expected to be used anymore.
>>> Right. But such an entry would still have been "modified" by the guest.
>> Yes, but nothing then is needed to do with it.
> I understand that. Maybe I'm overly picky, but all of the above was in response
> to you saying "It is done to track which page was modified by a guest." And I'm
> simply trying to get you to use precise wording, both in code comments and in
> discussions. In a case like the one here I simply can't judge whether you simply
> expressed yourself not clear enough, or whether you indeed meant what you said.
>
>>>>>>>> +        /*
>>>>>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>>>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>>>>>> +         *
>>>>>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>>>>>> +         * superpage size.
>>>>>>>> +         */
>>>>>>> Does this really need leaving as a to-do?
>>>>>> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
>>>>>> a smaller order will simply be chosen.
>>>>> Well, my question was more like "Isn't it simple enough to cover the case
>>>>> right away?"
>>>>>
>>>>>>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>>>>>>> +        mask |= gfn_x(sgfn) | nr;
>>>>>>>> +
>>>>>>>> +        for ( ; i != 0; i-- )
>>>>>>>> +        {
>>>>>>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>>>>>>> +            {
>>>>>>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>>>>>>> +                    break;
>>>>>>> Nit: Style.
>>>>>>>
>>>>>>>> +            }
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>>>>>>> +        if ( rc )
>>>>>>>> +            break;
>>>>>>>> +
>>>>>>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>>>>>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>>>>>>> +           smfn = mfn_add(smfn, (1 << order));
>>>>>>>> +
>>>>>>>> +        nr -= (1 << order);
>>>>>>> Throughout maybe better be safe right away and use 1UL?
>>>>>>>
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    return rc;
>>>>>>>>      }
>>>>>>> How's the caller going to know how much of the range was successfully
>>>>>>> mapped?
>>>>>> There is no such option. Do other arches do that? I mean returns somehow
>>>>>> the number of successfully mapped (sgfn,smfn).
>>>>> On x86 we had to introduce some not very nice code to cover for the absence
>>>>> of proper handling there. For a new port I think it wants at least seriously
>>>>> considering not to repeat such a potentially unhelpful pattern.
>>>>>
>>>>>>> That part may need undoing (if not here, then in the caller),
>>>>>>> or a caller may want to retry.
>>>>>> So the caller in the case if rc != 0, can just undoing the full range
>>>>>> (by using the same sgfn, nr, smfn).
>>>>> Can it? How would it know what the original state was?
>>>> You're right — blindly unmapping the range assumes that no entries were valid
>>>> beforehand and I missed that it could be that something valid was mapped before
>>>> p2m_set_entry(sgfn,...,smfn) was called.
>>>> But then I am not really understand why it won't be an issue if will know
>>>> how many GFNs were successfully mapped.
>>> The caller may know what that range's state was. But what I really wanted to
>>> convey is: Updating multiple entries in one go is complicated in some of the
>>> corner cases. You will want to think this through now, in order to avoid the
>>> need to re-write everything later again.
>> I can add one more argument to return the number of successfully mapped GFNs.
>> Fortunately, that's very easy to do.
>>
>> The problem for me is that I don’t really understand what the caller is supposed
>> to do with that information.
> That's only the 2nd step to take. The first is: What behavior do you want, overall?

My initial idea was that if something went wrong ( rc != 0 ) then just panic(). But
based on your questions it seems like it isn't the best one idea.

>
>> The only use case I can think of is that the caller
>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>> issue, and retrying would probably result in the same error.
>>
>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>> array to track all modified PTEs and then use it to revert the state if needed.
>> But again, what would the caller do after the rollback? At this point, it still seems
>> like the best option is simply to|panic(). |
>>
>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>> successfully mapped, or whether a rollback was performed, would really help — because
>> in most cases, I don’t have a better option than just calling|panic()| at the end.
> panic()-ing is of course only a last resort. Anything related to domain handling
> would better crash only the domain in question. And even that only if suitable
> error handling isn't possible.

And if there is no still any runnable domain available, for example, we are creating
domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
If yes, then it is enough to return only error code without returning how many GFNs were
mapped or rollbacking as domain won't be ran anyway.
(just to mention, I am not trying to convince you that rollback or returning of an amount
of GFNs isn't necessary, I just trying to understand what is the best implementation of
handling none-fully mapped mappings you mentioned)

>
>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>> tree node, and the mapping fails partway through, I’m left with two options: either
>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>    booting; in which case I’d need to perform a rollback, and simply knowing the number
>> of successfully mapped GFNs may not be enough or, more likely, just panic.
> Well, no. For example, before even trying to map you could check that the range
> of P2M entries covered is all empty.

Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
just do a mapping, right?
Won't be this procedure consume a lot of time as it is needed to go through each page
tables for each entry.


>   _Then_ you know how to correctly roll back.
> And yes, doing so may not even require passing back information on how much of
> a region was successfully mapped.

If P2M entries were empty before start of the mapping then it is enough to just go
through the same range (sgfn,nr,smfn) and just clean them, right?

Thanks.

~ Oleksii


--------------vH0uxB9fUD6YxWBCEIHWyUu0
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
    <div class="moz-cite-prefix">On 7/7/25 5:15 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
And in here it is checked if P2M pte is valid from P2M point of view by checking
the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
free bits for type).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Because this is how it's defined on x86:

#define p2m_is_valid(_t)    (p2m_to_mask(_t) &amp; \
                             (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))

I.e. more strict that simply "!= p2m_invalid". And I think such predicates
would better be uniform across architectures, such that in principle they
might also be usable in common code (as we already do with p2m_is_foreign()).</pre>
    </blockquote>
    <pre>Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
x86 and Arm have different understanding what is valid.

Except what mentioned in the comment that grant types aren't considered valid
for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
p2m_is_valid() is stricter then Arm's one and if other arches should be also
so strict.
It seems like from the point of view of mapping/unmapping it is enough just
to verify a "copy" of PTE's valid bit (in terms of P2M it is p2m_invalid type).

</pre>
    <blockquote type="cite"
      cite="mid:6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">   Plus
can't a guest also arrange for an entry's type to move to p2m_invalid?
That's then still an entry that was modified by the guest.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I am not really sure that I fully understand the question.
Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
with p2m_invalid argument?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That I'm not asking, but rather stating. I.e. I expect such is possible.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
this entry isn't expected to be used anymore.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Right. But such an entry would still have been "modified" by the guest.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, but nothing then is needed to do with it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I understand that. Maybe I'm overly picky, but all of the above was in response
to you saying "It is done to track which page was modified by a guest." And I'm
simply trying to get you to use precise wording, both in code comments and in
discussions. In a case like the one here I simply can't judge whether you simply
expressed yourself not clear enough, or whether you indeed meant what you said.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
            <pre wrap="" class="moz-quote-pre">You're right — blindly unmapping the range assumes that no entries were valid
beforehand and I missed that it could be that something valid was mapped before
p2m_set_entry(sgfn,...,smfn) was called.
But then I am not really understand why it won't be an issue if will know
how many GFNs were successfully mapped.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The caller may know what that range's state was. But what I really wanted to
convey is: Updating multiple entries in one go is complicated in some of the
corner cases. You will want to think this through now, in order to avoid the
need to re-write everything later again.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I can add one more argument to return the number of successfully mapped GFNs.
Fortunately, that's very easy to do.

The problem for me is that I don’t really understand what the caller is supposed
to do with that information.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's only the 2nd step to take. The first is: What behavior do you want, overall?</pre>
    </blockquote>
    <pre>My initial idea was that if something went wrong ( rc != 0 ) then just panic(). But
based on your questions it seems like it isn't the best one idea.

</pre>
    <blockquote type="cite"
      cite="mid:6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
panic()-ing is of course only a last resort. Anything related to domain handling
would better crash only the domain in question. And even that only if suitable
error handling isn't possible.</pre>
    </blockquote>
    <pre>And if there is no still any runnable domain available, for example, we are creating
domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
If yes, then it is enough to return only error code without returning how many GFNs were
mapped or rollbacking as domain won't be ran anyway.
(just to mention, I am not trying to convince you that rollback or returning of an amount
of GFNs isn't necessary, I just trying to understand what is the best implementation of
handling none-fully mapped mappings you mentioned)

</pre>
    <blockquote type="cite"
      cite="mid:6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
tree node, and the mapping fails partway through, I’m left with two options: either
ignore the device (if it's not essential for Xen or guest functionality) and continue
  booting; in which case I’d need to perform a rollback, and simply knowing the number
of successfully mapped GFNs may not be enough or, more likely, just panic.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, no. For example, before even trying to map you could check that the range
of P2M entries covered is all empty.</pre>
    </blockquote>
    <pre>Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
just do a mapping, right?
Won't be this procedure consume a lot of time as it is needed to go through each page
tables for each entry.


</pre>
    <blockquote type="cite"
      cite="mid:6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com">
      <pre wrap="" class="moz-quote-pre"> _Then_ you know how to correctly roll back.
And yes, doing so may not even require passing back information on how much of
a region was successfully mapped.</pre>
    </blockquote>
    <pre>If P2M entries were empty before start of the mapping then it is enough to just go
through the same range (sgfn,nr,smfn) and just clean them, right?

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------vH0uxB9fUD6YxWBCEIHWyUu0--

