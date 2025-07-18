Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2BB0A1CF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048559.1418768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj7M-0007PM-F8; Fri, 18 Jul 2025 11:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048559.1418768; Fri, 18 Jul 2025 11:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj7M-0007Nu-CW; Fri, 18 Jul 2025 11:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1048559;
 Fri, 18 Jul 2025 11:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPPV=Z7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucj7K-0007No-PO
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:19:06 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04143b65-63c9-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 13:19:05 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso3582179a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 04:19:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c9040d91sm839017a12.38.2025.07.18.04.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 04:19:04 -0700 (PDT)
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
X-Inumbo-ID: 04143b65-63c9-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752837545; x=1753442345; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ty1AVZXClvnmVJyJrTqaQbJNg11JVF6Iu61YXdiGNhY=;
        b=AlClVUtY2+MrdpdYBIFRnkMq8d0BIMRPrM7zppFZfgWsGoPCgTrxHXziGBhpx1LlyM
         PKN96n32Ggn4n/AuH5do1goMaycuP8Vw04QrsaV21vpLANyWGhqPltXGf1FLKOn4Phl6
         Gni7Q7B1sIt7R7kXeXyBUqQXCtBimJ3DuIMRdQdkeUvo2gYKAPD+WKMafZI7mHlZKENI
         CSBskEg4/4sC01JSagjdcuhYeZSEBPggEJo9wN+N3fTMBvvzYFL5GNXvaaZdB077aq4K
         EA/ZJXZ4CF4TJZkXNKV9VYlQi92bbMH7L+c0boWQj2mNioeGqU4oRg3ytIuG5HKpXlKY
         3Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752837545; x=1753442345;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ty1AVZXClvnmVJyJrTqaQbJNg11JVF6Iu61YXdiGNhY=;
        b=V9CoWQHhEjSlZo8GIDmX7AYcO92zluRiDrAJ2CrGA/Bx4KNE4YIUGbee16Ya2OQ31s
         NbNj5TCv5HPyP5kJXIxZmMbzwj7yr536wI2qwC0bzklxUG03Ih6XENiKRYkXBPnnSEW3
         9UoYg6569NuLyewJCU9EeskKcbcCrR+jSyHexuF2ubQ7Q6wZAYyhRlh2pYC+oTpME7qE
         eQCq9RYJZfAn3gY8ea204/oNWRES38sHv8nEM9u64HvP+oybZioTh++m0d0MfVaHR7Vp
         8eBHJ1BZQGdXWmVmNB7kGcsT3YYSTLnOIbgkxBhAEC+9FLPmgcvetBf4ALqdhU7FOd7E
         ThSw==
X-Forwarded-Encrypted: i=1; AJvYcCWOzIp58VwdPGGxY1GF4qaac7rICj6Ut4J9aCNFzdfc8RcnTeIVbVRXth0JMoFMumSFKrJAibzJoXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYofZ+x8PHi1O/Xxwfn1PG+TZdhBsDMm9OwHcrtBLzYzWqSKsH
	4wlTZqzm5q4zrLOkdBaAgSCwZqE9oa3Iaedza+8crFi7JAjm21caxu1L
X-Gm-Gg: ASbGncvrgZwZC6t5EHWJ0rL4ZeTqKbJO7pykOX+fAnapRdvcK3DaQI/49YxID7liJCD
	wn2OCMf8XzjWXfYZCc+iDe7qc3u8nQsXzi/6R27beiCbTsX1NLTgnTjunMEFGib973RhOOWG0E2
	/Yf7adhmRB/ntAKKqxh5PrNAht/xzfVQPbDyH2iL47b8HruIny8mqaW/Hyv5QP0pPZ79dR7U5HB
	TLcscyxqqD+NMAJ29g/OYu0Y0JmLmo+bN6j48gvSOfR/dWukb3VztseLaspxmGO3Mt5zjH8N5qv
	Jk6NbcOz/Yw5iRRx0tX6iVpna06zH7ONUvbNU5U++Ule3RxoJnVyX5ueHpm5yZobu/O4fl+7/zr
	dzJ7yv+bYV5gHzsJjyd2TJTZtlgDddGZtN8USKm9VZPyOOaUcDAEeggfAh2zhB7jFk7K2VlE=
X-Google-Smtp-Source: AGHT+IEBAuAvjGKL2zkzyHWZQQW4BrRvrhPchxxHWY70c83u+BksYqQjsMJXD6Mt5ummIVnxruyE9A==
X-Received: by 2002:a05:6402:234b:b0:606:bea1:1740 with SMTP id 4fb4d7f45d1cf-6128263a83fmr10198763a12.30.1752837544652;
        Fri, 18 Jul 2025 04:19:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xO4C9i1JuQg0ITCMmcTiNsrc"
Message-ID: <cf7ffaba-0a75-41e7-adc9-55613bc311d2@gmail.com>
Date: Fri, 18 Jul 2025 13:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
 <1496586d-484c-4e99-aea7-974be335150f@suse.com>
 <b0013513-2646-4de4-a172-0d2ea571a3e8@gmail.com>
 <aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com>
 <d63ab4e1-d98b-4251-a5c7-87bf4688d5bb@gmail.com>
 <b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com>
 <a3beabba-b320-4401-861e-b528309b786d@gmail.com>
 <106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com>

This is a multi-part message in MIME format.
--------------xO4C9i1JuQg0ITCMmcTiNsrc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/17/25 12:37 PM, Jan Beulich wrote:
> On 17.07.2025 11:42, Oleksii Kurochko wrote:
>> On 7/16/25 6:12 PM, Jan Beulich wrote:
>>> On 16.07.2025 17:53, Oleksii Kurochko wrote:
>>>> On 7/16/25 1:43 PM, Jan Beulich wrote:
>>>>> On 16.07.2025 13:32, Oleksii Kurochko wrote:
>>>>>> On 7/2/25 10:35 AM, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>>          return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +/*
>>>>>>>> + * pte_is_* helpers are checking the valid bit set in the
>>>>>>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>>>>>>> + * p2me_is_valid())
>>>>>>>> + * Provide our own overlay to check the valid bit.
>>>>>>>> + */
>>>>>>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>>>>>>> +{
>>>>>>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>>>>>>> +}
>>>>>>> Same question as on the earlier patch - does P2M type apply to intermediate
>>>>>>> page tables at all? (Conceptually it shouldn't.)
>>>>>> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
>>>>>> to a page — PTE should be valid. Considering that in the current implementation
>>>>>> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
>>>>>> of PTE.v.
>>>>> I'm confused by this reply. If you want to name 2nd level page table entries
>>>>> P2M - fine (but unhelpful). But then for any memory access there's only one
>>>>> of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
>>>>> how can there be "PTE.v = 0 but P2M.v = 1"?
>>>> I think I understand your confusion, let me try to rephrase.
>>>>
>>>> The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
>>>> have the ability to use the P2M PTE valid bit to track which pages were accessed
>>>> by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
>>>> won't be too expensive, for example.
>>> I don't know what you're talking about here.
>> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649
> How does that Arm function matter here? Aiui you don't need anything like that
> in RISC-V, as there caches don't need disabling temporarily.

I thought that it could be needed not only in the case when a d-cache is disabled
temporarily, but it seems like that I was just wrong and all other cases are
handled by cache coherency protocol.

>
>>>> In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
>>>> will be set to something other than|p2m_invalid| (even for a table entries),
>>>> so when an MMU fault occurs, we can properly resolve it.
>>>>
>>>> So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
>>>> means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
>>>> the P2M PTE is genuinely invalid.
>>>>
>>>> It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have
>>>> ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
>>>> properly handle it and set to 1 P2M PTE valid bit to 1...
>>>>
>>>>> An intermediate page table entry is something Xen controls entirely. Hence
>>>>> it has no (guest induced) type.
>>>> ... And actually it is a reason why it is needed to set a type even for an
>>>> intermediate page table entry.
>>>>
>>>> I hope now it is a lit bit clearer what and why was done.
>>> Sadly not. I still don't see what use the P2M type in of an intermediate page
>>> table is going to be. It surely can't reliably describe all of the entries that
>>> page table holds. Intermediate page tables and leaf pages are just too different
>>> to share a concept like this, I think. That said, I'll be happy to be shown code
>>> demonstrating the contrary.
>> Then it is needed to introduce new p2m_type_t - p2m_table and use it.
>> Would it be better?
>>
>> I still need some type to have ability to distinguish if p2m is valid or not from
>> p2m management and hardware point of view.
>> If there is no need for such distinguish why all archs introduce p2m_invalid?
>> Isn't enough just to use P2M PTE valid bit?
> At least on x86 we don't tag intermediate page tables with P2M types. For
> ordinary leaf entries the situation is different, as there may be varying
> reasons why a PTE has its valid (on x86: present) bit cleared. Hence the
> type is relevant there, just to know what to do when a page is accessed
> through such a not-present PTE.

I think that I got your idea now.

Does it make sense to have such optimization when we have 2Mb memory range and
it was mapped using 4k pages instead of 1 super-page, could it be useful to
invalidate just just page table entry of L1 which corresponds to the start of
this 2mb memory range, instead of invalidating each entry on L0?
If it could useful then intermediate page tables should be tagged too. Arm has
such use cases:
   https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1286

~ OLeksii

--------------xO4C9i1JuQg0ITCMmcTiNsrc
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
    <div class="moz-cite-prefix">On 7/17/25 12:37 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.07.2025 11:42, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/16/25 6:12 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 16.07.2025 17:53, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 7/16/25 1:43 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 16.07.2025 13:32, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 7/2/25 10:35 AM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
        return p2m_type_radix_get(p2m, pte) != p2m_invalid;
    }
    
+/*
+ * pte_is_* helpers are checking the valid bit set in the
+ * PTE but we have to check p2m_type instead (look at the comment above
+ * p2me_is_valid())
+ * Provide our own overlay to check the valid bit.
+ */
+static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
+{
+    return p2me_is_valid(p2m, pte) &amp;&amp; (pte.pte &amp; PTE_ACCESS_MASK);
+}
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Same question as on the earlier patch - does P2M type apply to intermediate
page tables at all? (Conceptually it shouldn't.)
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
to a page — PTE should be valid. Considering that in the current implementation
it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
of PTE.v.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">I'm confused by this reply. If you want to name 2nd level page table entries
P2M - fine (but unhelpful). But then for any memory access there's only one
of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
how can there be "PTE.v = 0 but P2M.v = 1"?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think I understand your confusion, let me try to rephrase.

The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
have the ability to use the P2M PTE valid bit to track which pages were accessed
by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
won't be too expensive, for example.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I don't know what you're talking about here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How does that Arm function matter here? Aiui you don't need anything like that
in RISC-V, as there caches don't need disabling temporarily.</pre>
    </blockquote>
    <pre>I thought that it could be needed not only in the case when a d-cache is disabled
temporarily, but it seems like that I was just wrong and all other cases are
handled by cache coherency protocol.

</pre>
    <blockquote type="cite"
      cite="mid:106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
will be set to something other than|p2m_invalid| (even for a table entries),
so when an MMU fault occurs, we can properly resolve it.

So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
the P2M PTE is genuinely invalid.

It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have
ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
properly handle it and set to 1 P2M PTE valid bit to 1...

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">An intermediate page table entry is something Xen controls entirely. Hence
it has no (guest induced) type.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">... And actually it is a reason why it is needed to set a type even for an
intermediate page table entry.

I hope now it is a lit bit clearer what and why was done.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Sadly not. I still don't see what use the P2M type in of an intermediate page
table is going to be. It surely can't reliably describe all of the entries that
page table holds. Intermediate page tables and leaf pages are just too different
to share a concept like this, I think. That said, I'll be happy to be shown code
demonstrating the contrary.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Then it is needed to introduce new p2m_type_t - p2m_table and use it.
Would it be better?

I still need some type to have ability to distinguish if p2m is valid or not from
p2m management and hardware point of view.
If there is no need for such distinguish why all archs introduce p2m_invalid?
Isn't enough just to use P2M PTE valid bit?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
At least on x86 we don't tag intermediate page tables with P2M types. For
ordinary leaf entries the situation is different, as there may be varying
reasons why a PTE has its valid (on x86: present) bit cleared. Hence the
type is relevant there, just to know what to do when a page is accessed
through such a not-present PTE.</pre>
    </blockquote>
    <pre>I think that I got your idea now.

Does it make sense to have such optimization when we have 2Mb memory range and
it was mapped using 4k pages instead of 1 super-page, could it be useful to
invalidate just just page table entry of L1 which corresponds to the start of
this 2mb memory range, instead of invalidating each entry on L0?
If it could useful then intermediate page tables should be tagged too. Arm has
such use cases:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1286">https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1286</a>

~ OLeksii</pre>
  </body>
</html>

--------------xO4C9i1JuQg0ITCMmcTiNsrc--

