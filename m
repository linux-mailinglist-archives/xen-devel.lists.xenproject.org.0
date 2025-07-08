Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926AEAFC883
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 12:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036360.1408616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5i1-0001Za-8h; Tue, 08 Jul 2025 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036360.1408616; Tue, 08 Jul 2025 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5i1-0001Xz-5i; Tue, 08 Jul 2025 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1036360;
 Tue, 08 Jul 2025 10:37:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XL9v=ZV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uZ5hz-0001Xd-Mv
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 10:37:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a92c45a-5be7-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 12:37:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ade5a0442dfso688931566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 03:37:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66d942bsm867825666b.24.2025.07.08.03.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 03:37:52 -0700 (PDT)
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
X-Inumbo-ID: 9a92c45a-5be7-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971073; x=1752575873; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBZevyqqf6XS/bac6kc2lqG5Ugb5dYozZ+DoxgvgZDQ=;
        b=igtpZ8Sn1tvSSmw2chzxAXROriTBrFks62upB2hJeKbn6+0PSJxrjM7wCViZJYxOvI
         nRfvdMz0Tzzi5As45EOOxgFClfxiZbnb4QGeh9a+XxnWpRtlihBEYfjAC7L4Bn5YvhzP
         sO/45mdZuZOpNUdCsltADokI+nzMj5/ugQLok+ec+zIjwosJrPv9UhN45Ta64I6m0Hs6
         VxMsx06nnO9F8WdICftnbEHJq96ciab6oadP5foU2YSNXY3dw3GQ3E9R1/8EZc9VkY4H
         W+QAzEuHzlMBQk0J6VayPuPiTKideR4zOefTl6zRRQM/zqq6TO1GmoludW1tWWOGkeza
         uoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971073; x=1752575873;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBZevyqqf6XS/bac6kc2lqG5Ugb5dYozZ+DoxgvgZDQ=;
        b=N/JLKpyKdSNPe9Bjr/32YCYyvfDNprpEeeRQUPqd1NXCKmKiyfyNu4c96cCPDQz/r1
         WYBiIKy1qACuh4IuciXMvSTibnuAkhcc0QGnxbWyTrvtsxJmOhlKtjllNcDQarbaohoe
         e8muIZZ6Q1afLSTKDtOvkDMDSi2J8pzKOmxhC8sVLopsLLG7Wx/ocPLgdRnCjEQy7JRm
         BcDypxzu1pELavSYsrZhPmLt8E4Icb4a+SMTTWkjQffFjIeFH2oH3KD6I/b+Q4aCUuQm
         2vLtVVMTEX9njykD8Su8koQEkhBF2XoYJ5MHvHEeu+xEJuvGmPYJyG7C14QTFcH135/R
         vRIg==
X-Forwarded-Encrypted: i=1; AJvYcCXS0rIjJgCnEnYO7bqgUS+6YTY5AMNLTUiKUE1kzPPE/cNFgZaKO33p8uqCgWfg+TqfXPXhjfeIr9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkYxxP/F9DAL4dtHbeoRSe/zeCxaV+kwWKLaBAfum4uMOMISmo
	SLU9G5hhYzFExWnfYKoEUWyPjdEy3LZUm6Ld2eNT/gy5V8JiP09OKI8Z
X-Gm-Gg: ASbGnctvl+uRuAKfIYKQUokgreNQQpAMxbPmK8slOlGgQ59+fMsBefJhyrjp81+F1eO
	ZsQFlhUsvdcbgE7QiSZ8mbtuB04GuLs/J66UDFUff7oM/1dGN8a+Pvbh0TvT0Ty2gaqjUBApqVL
	NfgYUjpljR7AVUKNFlVABu8E3XRfVnTFuWqYceWewIPqo16CKcSENL6Tt1NviiW9KpMQXddRkmA
	wWAi/QGz/KYckqlRzivRPo2RxT7AQIj4Lo31OV7VooIUnThKo3SaqxtYSaIJreG2FJRtN4bi8SQ
	I+uPi/jtLsI/cD2hTiIcTZpC0DYOZ5UbWZvLlCCEBBc5nwF7md45lPZSkgrSW6SZBwj05by9ht1
	6DPTfX4DICIYqzKA3wpRqzi42yt6FJPC9gIg=
X-Google-Smtp-Source: AGHT+IHQO5TvL5W9Xrmdf1c8M055aXQYbAVg7i7K72PVwIqrg6N80GOFd6xsiwsOjr3kybOT4KSoqw==
X-Received: by 2002:a17:907:7f92:b0:ad2:2fe3:7074 with SMTP id a640c23a62f3a-ae6b0b711f4mr266197466b.14.1751971073098;
        Tue, 08 Jul 2025 03:37:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uZpU0vnZMP6NUyAOuJFyFOSk"
Message-ID: <05b789f0-7064-4ec3-9e0c-ba528a30d315@gmail.com>
Date: Tue, 8 Jul 2025 12:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <65aaf77e-85fe-4934-a485-710aff59f4eb@gmail.com>

This is a multi-part message in MIME format.
--------------uZpU0vnZMP6NUyAOuJFyFOSk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/8/25 11:01 AM, Oleksii Kurochko wrote:
>
>
> On 7/8/25 9:10 AM, Jan Beulich wrote:
>> On 07.07.2025 18:10, Oleksii Kurochko wrote:
>>> On 7/7/25 5:15 PM, Jan Beulich wrote:
>>>> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>>>>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>>>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>> +{
>>>>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>>>>> +
>>>>>>>>>>> +    return false;
>>>>>>>>>>> +}
>>>>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>>>>        /*
>>>>>>>>>         * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>>>>         * the type to check whether an entry is valid.
>>>>>>>>>         */
>>>>>>>>>        static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>>>        {
>>>>>>>>>            return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>>>        }
>>>>>>>>>
>>>>>>>>> It is done to track which page was modified by a guest.
>>>>>>>> But then (again) the name doesn't convey what the function does.
>>>>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>>>>> For P2M type checks please don't invent new naming, but use what both x86
>>>>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>>>>> set. Just that it's not doing what you want here.
>>>>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>>>>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>>>>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>>>>> free bits for type).
>>>> Because this is how it's defined on x86:
>>>>
>>>> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>>>>                                (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>>>>
>>>> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
>>>> would better be uniform across architectures, such that in principle they
>>>> might also be usable in common code (as we already do with p2m_is_foreign()).
>>> Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
>>> x86 and Arm have different understanding what is valid.
>>>
>>> Except what mentioned in the comment that grant types aren't considered valid
>>> for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
>>> p2m_is_valid() is stricter then Arm's one and if other arches should be also
>>> so strict.
>> Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
>> could also consider x86'es to require a better name). It's a local helper, not
>> a P2M type checking predicate. With that in mind, you may of course follow
>> Arm's model, but in the longer run we may need to do something about the name
>> collision then.
>>
>>>>> The only use case I can think of is that the caller
>>>>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>>>>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>>>>> issue, and retrying would probably result in the same error.
>>>>>
>>>>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>>>>> array to track all modified PTEs and then use it to revert the state if needed.
>>>>> But again, what would the caller do after the rollback? At this point, it still seems
>>>>> like the best option is simply to|panic(). |
>>>>>
>>>>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>>>>> successfully mapped, or whether a rollback was performed, would really help — because
>>>>> in most cases, I don’t have a better option than just calling|panic()| at the end.
>>>> panic()-ing is of course only a last resort. Anything related to domain handling
>>>> would better crash only the domain in question. And even that only if suitable
>>>> error handling isn't possible.
>>> And if there is no still any runnable domain available, for example, we are creating
>>> domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
>>> If yes, then it is enough to return only error code without returning how many GFNs were
>>> mapped or rollbacking as domain won't be ran anyway.
>> During domain creation all you need to do is return an error. But when you write a
>> generic function that's also (going to be) used at domain runtime, you need to
>> consider what to do there in case of partial success.
>>
>>>>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>>>>> tree node, and the mapping fails partway through, I’m left with two options: either
>>>>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>>>>     booting; in which case I’d need to perform a rollback, and simply knowing the number
>>>>> of successfully mapped GFNs may not be enough or, more likely, just panic.
>>>> Well, no. For example, before even trying to map you could check that the range
>>>> of P2M entries covered is all empty.
>>> Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
>>> just do a mapping, right?
>> Possibly that would simply mean to return an error, yes.
>>
>>> Won't be this procedure consume a lot of time as it is needed to go through each page
>>> tables for each entry.
>> Well, you're free to suggest a clean alternative without doing so.
> I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
> and then use it to roll back if __p2m_set_entry() returns rc != 0 ...
>
>>>>    _Then_ you know how to correctly roll back.
>>>> And yes, doing so may not even require passing back information on how much of
>>>> a region was successfully mapped.
>>> If P2M entries were empty before start of the mapping then it is enough to just go
>>> through the same range (sgfn,nr,smfn) and just clean them, right?
>> Yes, what else would "roll back" mean in that case?
> ... If we know that the P2M entries were empty, then there's nothing else to be done, just
> clean PTE is needed to be done.
> However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
> case), then rolling back would mean restoring their original state, the state they
> had before the P2M mapping procedure started.

Possible roll back is harder to implement as expected because there is a case where subtree
could be freed:
     /*
      * Free the entry only if the original pte was valid and the base
      * is different (to avoid freeing when permission is changed).
      */
     if ( p2me_is_valid(p2m, orig_pte) &&
          !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
         p2m_free_subtree(p2m, orig_pte, level);
In this case then it will be needed to store the full subtree.

~ Oleksii

--------------uZpU0vnZMP6NUyAOuJFyFOSk
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
    <div class="moz-cite-prefix">On 7/8/25 11:01 AM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:65aaf77e-85fe-4934-a485-710aff59f4eb@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 7/8/25 9:10 AM, Jan Beulich wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:409cdade-192d-47dc-941d-9256bfa53cea@suse.com">
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
        <pre wrap="" class="moz-quote-pre">Well, you're free to suggest a clean alternative without doing so.</pre>
      </blockquote>
      <pre>I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
and then use it to roll back if __p2m_set_entry() returns rc != 0 ...

</pre>
      <blockquote type="cite"
        cite="mid:409cdade-192d-47dc-941d-9256bfa53cea@suse.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  _Then_ you know how to correctly roll back.
And yes, doing so may not even require passing back information on how much of
a region was successfully mapped.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If P2M entries were empty before start of the mapping then it is enough to just go
through the same range (sgfn,nr,smfn) and just clean them, right?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yes, what else would "roll back" mean in that case?</pre>
      </blockquote>
      <pre>... If we know that the P2M entries were empty, then there's nothing else to be done, just
clean PTE is needed to be done.
However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
case), then rolling back would mean restoring their original state, the state they
had before the P2M mapping procedure started.</pre>
    </blockquote>
    <pre>Possible roll back is harder to implement as expected because there is a case where subtree
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
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------uZpU0vnZMP6NUyAOuJFyFOSk--

