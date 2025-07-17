Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62579B08986
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 11:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046490.1416840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucL84-0004SO-BB; Thu, 17 Jul 2025 09:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046490.1416840; Thu, 17 Jul 2025 09:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucL84-0004PG-7y; Thu, 17 Jul 2025 09:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1046490;
 Thu, 17 Jul 2025 09:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83TL=Z6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucL82-0004PA-IR
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 09:42:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d359b4-62f2-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 11:42:13 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae0b2ead33cso137880166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 02:42:12 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82646a5sm1352133466b.90.2025.07.17.02.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 02:42:11 -0700 (PDT)
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
X-Inumbo-ID: 50d359b4-62f2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752745332; x=1753350132; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCCv4VNHs6qKLgNnrrbPCGyXKdEWQysCQareo8iN+iM=;
        b=E0WtqJFaIRx9eOmDvl/BDWwTo6U/8pN0a0fTkkJdSPfrUdEioJS683GHtlz/7sanxM
         /3krczKZDwrJIaYl8Fff3tk8hfFvMHHujYhNzQNGnXNSS8jlwsFGcL4O00oCGPHGEW8t
         98O8Sb5SlGRmQD+hOHNsX7D4PCOQjPk0Z55/A4rSv0gNNzj4b4NfqToisHV8DGsgCYKv
         QKONGVCmCVloqoKAjo7NYiC/P0dZU8hGeL2jO86h0DWsTfY4P5u/VffOxnm8TLn9+3hL
         0mlyI5QtHLTI4+CfTBGwfWlmHuwWzAha6k9nZ04Fv2XpSc3Y/cxhUSfuz+Bbt9G3h0xA
         w8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745332; x=1753350132;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCCv4VNHs6qKLgNnrrbPCGyXKdEWQysCQareo8iN+iM=;
        b=bJF7b8fs/O5tEaCEwLFzWlNNfj60ld8n8oU/GwgMhqn3PWhLdMQVtC1zRIz7wt9Mkv
         SbclhSomS3m8ZYigV0Yq+MdctZgyBeryyjPgIGwiDaxGKZeCGZKfdT5xL1uFRjn64CMX
         53dLcnINW2rWxcF+di+rL9JJImP3Buj8kZcSpD3heNxHM4B2bCqekhIXSONWHkXloYnw
         Y9+27qF8yqlTuxK0NJiwKYUy0dBfQqJjcv/XQAQS30uI1f7GIBP999fe5xLUZUXE+paW
         AWOhWs2Y8HeKQ0qhdwnfj3e6pKQIVpRCYs7gosNSWRKex9J9LWpI5i8hFlbRzxnACNCj
         MZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBmTFYyJpTwaKa3kE97w5ir2ksWsOgHy4vZD7kDvWCiG0qTfIZlwXEWdcEFrDc+uwHa7eRGQwHSoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydZHueEEoC+Tsnq8P6bEoYW+YiPSqzcxJ5Lwcq0eyEwHSMC8hL
	OUEcoYFvX5HRl80IJ5nnVxSJNp4a35UhTS7WVRWJHiLbeT1vEcRrs3ZU
X-Gm-Gg: ASbGncu2Al92mrteWcryBB9XNYVJ5eyYByEUBQiB3QJYv03bvnjYR2NAMBpJdre18xx
	HRcZlFQBck8k1+aRAwvA3eOEojp03xz5ABqCvnnaDTZeM+iFYbPjweuD1srd09lwtOG4I/D8oW8
	dcSsAwkU0syhIuje4V9bKPPFDSAmJHsp15kG6ixN2jJvPb2+wuD0LOHlIF6UEoga9u9TVu4B0NM
	RIOJfpA2N3hyC+JTP59fxuCekbdJwSSqP479BcAotbJIBp9fiUN4hgk9JFrnSPt5W6MsjANLHKC
	Z9XARxLZ/VynoI0W9himaTORXVd8k+QpQZppRwU22/kBvINMZUWy0hH+ZBIyhn5xCthDZTlq5hz
	FeAMa3CiHwcOAA+9Xkqm4Z6/iPO7RF/qxvumRw8qAxj7wxBJ3FX4R04JvCq5dlA+WXrlGHXQ=
X-Google-Smtp-Source: AGHT+IH22CmFWrGTYiE++BdUb+jjGF+Arux+vKdOr27JD1eC2/NfRwGQOODKAvXzVqOavSSDoE/8sA==
X-Received: by 2002:a17:906:dc91:b0:ae3:52ae:b0d2 with SMTP id a640c23a62f3a-aec4deac749mr246777466b.18.1752745331622;
        Thu, 17 Jul 2025 02:42:11 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------WSrmY0Rfc09W1vjNtMTj3NDe"
Message-ID: <a3beabba-b320-4401-861e-b528309b786d@gmail.com>
Date: Thu, 17 Jul 2025 11:42:10 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com>

This is a multi-part message in MIME format.
--------------WSrmY0Rfc09W1vjNtMTj3NDe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/25 6:12 PM, Jan Beulich wrote:
> On 16.07.2025 17:53, Oleksii Kurochko wrote:
>> On 7/16/25 1:43 PM, Jan Beulich wrote:
>>> On 16.07.2025 13:32, Oleksii Kurochko wrote:
>>>> On 7/2/25 10:35 AM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>         return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>     }
>>>>>>     
>>>>>> +/*
>>>>>> + * pte_is_* helpers are checking the valid bit set in the
>>>>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>>>>> + * p2me_is_valid())
>>>>>> + * Provide our own overlay to check the valid bit.
>>>>>> + */
>>>>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>>>>> +{
>>>>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>>>>> +}
>>>>> Same question as on the earlier patch - does P2M type apply to intermediate
>>>>> page tables at all? (Conceptually it shouldn't.)
>>>> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
>>>> to a page — PTE should be valid. Considering that in the current implementation
>>>> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
>>>> of PTE.v.
>>> I'm confused by this reply. If you want to name 2nd level page table entries
>>> P2M - fine (but unhelpful). But then for any memory access there's only one
>>> of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
>>> how can there be "PTE.v = 0 but P2M.v = 1"?
>> I think I understand your confusion, let me try to rephrase.
>>
>> The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
>> have the ability to use the P2M PTE valid bit to track which pages were accessed
>> by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
>> won't be too expensive, for example.
> I don't know what you're talking about here.

https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649

>
>> In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
>> will be set to something other than|p2m_invalid| (even for a table entries),
>> so when an MMU fault occurs, we can properly resolve it.
>>
>> So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
>> means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
>> the P2M PTE is genuinely invalid.
>>
>> It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have
>> ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
>> properly handle it and set to 1 P2M PTE valid bit to 1...
>>
>>> An intermediate page table entry is something Xen controls entirely. Hence
>>> it has no (guest induced) type.
>> ... And actually it is a reason why it is needed to set a type even for an
>> intermediate page table entry.
>>
>> I hope now it is a lit bit clearer what and why was done.
> Sadly not. I still don't see what use the P2M type in of an intermediate page
> table is going to be. It surely can't reliably describe all of the entries that
> page table holds. Intermediate page tables and leaf pages are just too different
> to share a concept like this, I think. That said, I'll be happy to be shown code
> demonstrating the contrary.

Then it is needed to introduce new p2m_type_t - p2m_table and use it.
Would it be better?

I still need some type to have ability to distinguish if p2m is valid or not from
p2m management and hardware point of view.
If there is no need for such distinguish why all archs introduce p2m_invalid?
Isn't enough just to use P2M PTE valid bit?

>
>>>>>> +static struct page_info *p2m_alloc_page(struct domain *d)
>>>>>> +{
>>>>>> +    struct page_info *pg;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * For hardware domain, there should be no limit in the number of pages that
>>>>>> +     * can be allocated, so that the kernel may take advantage of the extended
>>>>>> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
>>>>>> +     */
>>>>>> +    if ( is_hardware_domain(d) )
>>>>>> +    {
>>>>>> +        pg = alloc_domheap_page(d, MEMF_no_owner);
>>>>>> +        if ( pg == NULL )
>>>>>> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>>>>>> +    }
>>>>> The comment looks to have been taken verbatim from Arm. Whatever "extended
>>>>> regions" are, does the same concept even exist on RISC-V?
>>>> Initially, I missed that it’s used only for Arm. Since it was mentioned in
>>>> |doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
>>>> But now I see that it’s Arm-specific:: ### ext_regions (Arm)
>>>>
>>>>> Also, special casing Dom0 like this has benefits, but also comes with a
>>>>> pitfall: If the system's out of memory, allocations will fail. A pre-
>>>>> populated pool would avoid that (until exhausted, of course). If special-
>>>>> casing of Dom0 is needed, I wonder whether ...
>>>>>
>>>>>> +    else
>>>>>> +    {
>>>>>> +        spin_lock(&d->arch.paging.lock);
>>>>>> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>>>> +        spin_unlock(&d->arch.paging.lock);
>>>>>> +    }
>>>>> ... going this path but with a Dom0-only fallback to general allocation
>>>>> wouldn't be the better route.
>>>> IIUC, then it should be something like:
>>>>      static struct page_info *p2m_alloc_page(struct domain *d)
>>>>      {
>>>>          struct page_info *pg;
>>>>          
>>>>          spin_lock(&d->arch.paging.lock);
>>>>          pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> Note this: Here you _remove_ from freelist, because you want to actually
> use the page. Then clearly ...
>
>>>>          spin_unlock(&d->arch.paging.lock);
>>>>
>>>>          if ( !pg && is_hardware_domain(d) )
>>>>          {
>>>>                /* Need to allocate more memory from domheap */
>>>>                pg = alloc_domheap_page(d, MEMF_no_owner);
>>>>                if ( pg == NULL )
>>>>                {
>>>>                    printk(XENLOG_ERR "Failed to allocate pages.\n");
>>>>                    return pg;
>>>>                }
>>>>                ACCESS_ONCE(d->arch.paging.total_pages)++;
>>>>                page_list_add_tail(pg, &d->arch.paging.freelist);
>>>>          }
>>>>       
>>>>          return pg;
>>>> }
>>>>
>>>> And basically use|d->arch.paging.freelist| for both dom0less and dom0 domains,
>>>> with the only difference being that in the case of Dom0,|d->arch.paging.freelist |could be extended.
>>>>
>>>> Do I understand your idea correctly?
>>> Broadly yes, but not in the details. For example, I don't think such a
>>> page allocated from the general heap would want appending to freelist.
>>> Commentary and alike also would want tidying.
>> Could you please explain why it wouldn't want appending to freelist?
> ... adding to freelist here is wrong: You want to use this separately
> allocated page, too. Else once it is freed it'll be added to freelist
> a 2nd time, leading to a corrupt list.

Got it, I understand why it shouldn’t be added to the freelist.

Incrementing total_pages still makes sense, right?

>
>>> And of course going forward, for split hardware and control domains the
>>> latter may want similar treatment.
>> Could you please clarify what is the difference between hardware and control
>> domains?
>> I thought that it is the same or is it for the case when we have
>> dom0 (control domain) which runs domD (hardware domain) and guest domain?
> That's the common case, yes, but conceptually the two can be separate.
> And if you've followed recent discussions on the list you would also
> have noticed that work is being done in that direction. (But this was
> really a forward-looking comment; I didn't mean to make you cover that
> case right away. Just wanted you to be aware.)

Thanks.

~ Oleksii

--------------WSrmY0Rfc09W1vjNtMTj3NDe
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
    <div class="moz-cite-prefix">On 7/16/25 6:12 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
I think I understand your confusion, let me try to rephrase.

The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
have the ability to use the P2M PTE valid bit to track which pages were accessed
by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
won't be too expensive, for example.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't know what you're talking about here.</pre>
    </blockquote>
    <pre><a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649</a>

</pre>
    <blockquote type="cite"
      cite="mid:b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
          <pre wrap="" class="moz-quote-pre">
An intermediate page table entry is something Xen controls entirely. Hence
it has no (guest induced) type.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
... And actually it is a reason why it is needed to set a type even for an
intermediate page table entry.

I hope now it is a lit bit clearer what and why was done.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sadly not. I still don't see what use the P2M type in of an intermediate page
table is going to be. It surely can't reliably describe all of the entries that
page table holds. Intermediate page tables and leaf pages are just too different
to share a concept like this, I think. That said, I'll be happy to be shown code
demonstrating the contrary.</pre>
    </blockquote>
    <pre>Then it is needed to introduce new p2m_type_t - p2m_table and use it.
Would it be better?

I still need some type to have ability to distinguish if p2m is valid or not from
p2m management and hardware point of view.
If there is no need for such distinguish why all archs introduce p2m_invalid?
Isn't enough just to use P2M PTE valid bit?

</pre>
    <blockquote type="cite"
      cite="mid:b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+static struct page_info *p2m_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    /*
+     * For hardware domain, there should be no limit in the number of pages that
+     * can be allocated, so that the kernel may take advantage of the extended
+     * regions. Hence, allocate p2m pages for hardware domains from heap.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        pg = alloc_domheap_page(d, MEMF_no_owner);
+        if ( pg == NULL )
+            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
+    }
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">The comment looks to have been taken verbatim from Arm. Whatever "extended
regions" are, does the same concept even exist on RISC-V?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Initially, I missed that it’s used only for Arm. Since it was mentioned in
|doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
But now I see that it’s Arm-specific:: ### ext_regions (Arm)

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Also, special casing Dom0 like this has benefits, but also comes with a
pitfall: If the system's out of memory, allocations will fail. A pre-
populated pool would avoid that (until exhausted, of course). If special-
casing of Dom0 is needed, I wonder whether ...

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    else
+    {
+        spin_lock(&amp;d-&gt;arch.paging.lock);
+        pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+        spin_unlock(&amp;d-&gt;arch.paging.lock);
+    }
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... going this path but with a Dom0-only fallback to general allocation
wouldn't be the better route.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">IIUC, then it should be something like:
    static struct page_info *p2m_alloc_page(struct domain *d)
    {
        struct page_info *pg;
        
        spin_lock(&amp;d-&gt;arch.paging.lock);
        pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Note this: Here you _remove_ from freelist, because you want to actually
use the page. Then clearly ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">        spin_unlock(&amp;d-&gt;arch.paging.lock);

        if ( !pg &amp;&amp; is_hardware_domain(d) )
        {
              /* Need to allocate more memory from domheap */
              pg = alloc_domheap_page(d, MEMF_no_owner);
              if ( pg == NULL )
              {
                  printk(XENLOG_ERR "Failed to allocate pages.\n");
                  return pg;
              }
              ACCESS_ONCE(d-&gt;arch.paging.total_pages)++;
              page_list_add_tail(pg, &amp;d-&gt;arch.paging.freelist);
        }
     
        return pg;
}

And basically use|d-&gt;arch.paging.freelist| for both dom0less and dom0 domains,
with the only difference being that in the case of Dom0,|d-&gt;arch.paging.freelist |could be extended.

Do I understand your idea correctly?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Broadly yes, but not in the details. For example, I don't think such a
page allocated from the general heap would want appending to freelist.
Commentary and alike also would want tidying.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Could you please explain why it wouldn't want appending to freelist?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... adding to freelist here is wrong: You want to use this separately
allocated page, too. Else once it is freed it'll be added to freelist
a 2nd time, leading to a corrupt list.</pre>
    </blockquote>
    <pre data-start="0" data-end="63">Got it, I understand why it shouldn’t be added to the freelist.</pre>
    <pre data-start="65" data-end="115" data-is-last-node=""
    data-is-only-node="">Incrementing total_pages still makes sense, right?

</pre>
    <blockquote type="cite"
      cite="mid:b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">And of course going forward, for split hardware and control domains the
latter may want similar treatment.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Could you please clarify what is the difference between hardware and control
domains?
I thought that it is the same or is it for the case when we have
dom0 (control domain) which runs domD (hardware domain) and guest domain?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's the common case, yes, but conceptually the two can be separate.
And if you've followed recent discussions on the list you would also
have noticed that work is being done in that direction. (But this was
really a forward-looking comment; I didn't mean to make you cover that
case right away. Just wanted you to be aware.)</pre>
    </blockquote>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------WSrmY0Rfc09W1vjNtMTj3NDe--

