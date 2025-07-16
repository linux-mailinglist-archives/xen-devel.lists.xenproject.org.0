Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC2B07A63
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045406.1415515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4S0-000737-Hz; Wed, 16 Jul 2025 15:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045406.1415515; Wed, 16 Jul 2025 15:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4S0-00071T-E9; Wed, 16 Jul 2025 15:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1045406;
 Wed, 16 Jul 2025 15:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAMf=Z5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uc4Rz-00071N-13
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:53:43 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0add9762-625d-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:53:40 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so9280275a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:53:40 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611fb169550sm6964015a12.50.2025.07.16.08.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:53:39 -0700 (PDT)
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
X-Inumbo-ID: 0add9762-625d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752681220; x=1753286020; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQkdmkwXv+dkDUMp61lkdTgJ2gP0Y+dPMnPs2ye8gJ8=;
        b=jyW1m52sq39D+rlTdSM+KqRvRuzeMLjZFGo1+M4rVGI9j/hGIxe+YRYB3Vq/pfURy5
         P56n8Xqozacz55dBc52xxKbjFdZ2dpYCzdQHlzmC2Li4cUO1JE54XR6T3DpPXDcL/bWI
         L02zfts8XzS/Vejl3BNsNHJY+XNPBJmHNEuXYFO7BsmNVS4t2IOWpk2iiBG1Jsj4Ac/q
         LkHNJaMA8gDM1eCrRP1GRTTIlIbDyUkvvRR7iszSILpoZXFpt051AyCr0QTo4eVXC9PL
         01X+jPbtz55JL0E3Olk3ne3JvshV4g89bsg3rNqEaUiNiP81fsP+PWr75tQZBipfIkIe
         VyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681220; x=1753286020;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQkdmkwXv+dkDUMp61lkdTgJ2gP0Y+dPMnPs2ye8gJ8=;
        b=NasHZX9aSW35+DEEKOHJdh7DtQH1XyP+qthl+kv5z+tQDuNFdb2ks8p+Qz3CQpzURg
         o40qUzcCNvPQd1Wj1dBE4D3l79jJvr3WymgjXETu3mMjbkzOLs9P4CL8lVidmLRqHmDR
         feqLXvVIS0wztLryP5YjOJvuYSNTDkNq1jXGg3GA4PW7wOh0X1EE370yeqxni4eFI33k
         OYML5qybpuzy11+ZPOcIt3mPgm2qbKsjNJ+0EB+DsN1Q1xFmFi08gENaMiMTT2tIFQDW
         96SXFLxK8ZJpt6Mt0yIhTAzFTZh5KcqnSSN5ECpcdGKuwguzQfZQQNiRDl7pRC04Kwa7
         MwMw==
X-Forwarded-Encrypted: i=1; AJvYcCXqfVgE3Xal85rXCMwitkCHmTcBJseJq4lDvwKgvKDyvPDVJ1xrCVBZx3QGGUgS0Wt1yzPlp9MeNHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrqEITD3LonEK8KCOXb8nbwD9yKlyPE1RM7HTM/3hIVg0hMW1K
	OdrMg79Ic2qHKk+efA6q4F+1YlWT5Z5H6WAiOEtkm0RL6PdeosPD7LLG
X-Gm-Gg: ASbGnctobqyiwZ5npWLUaoIva/QysAw1b4KwXfBGbCMI8Pai9ilrtXUaI/fU0GRzuUD
	k3FeNle9wmXgReitAJsdz8yvXiR2tIYgtV74neFkFhZnv/JkxjnSKNhAwAiVcJE8goJjSHxcVSv
	EIq9M9aUA9iXfme4zhXWJcaZIZhQ7AcJRBGbR0BTCBqM5eimRpRO503ReN0coqp+zVjn3AFvDq4
	oYySBpPhLQSCRxHn4BY6VKJ4sIWBN/unVVgAJzE8hfeMevd2qVCIaib7OIx6PATgGUBMt0uLY96
	jE9J+cIaAgzPGysKi6x/OGadn2ml7o52HkIaPWEIZNUQgey0d8V7GrflSSyDBiy0HSkOsNGA31c
	O1G+sYMQSDdt/i/qEMJEt0fB3/OQIRwR1p4PaZChmKMIRwctrUGC4vLVvChYfj7xdu+pL26B19L
	3DbWiLRM8=
X-Google-Smtp-Source: AGHT+IHsKM4rTEj92QEkz9oXHMP3eKqEmsFG/6bdY2Fwhm69vxM168Oudoe35vVA5uHATdatf4QCbw==
X-Received: by 2002:a05:6402:90d:b0:606:a99d:91d4 with SMTP id 4fb4d7f45d1cf-61285c03c78mr3289137a12.27.1752681219342;
        Wed, 16 Jul 2025 08:53:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------9UdMog6SUmcEbF0Ec36Ntq7B"
Message-ID: <d63ab4e1-d98b-4251-a5c7-87bf4688d5bb@gmail.com>
Date: Wed, 16 Jul 2025 17:53:37 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com>

This is a multi-part message in MIME format.
--------------9UdMog6SUmcEbF0Ec36Ntq7B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/25 1:43 PM, Jan Beulich wrote:
> On 16.07.2025 13:32, Oleksii Kurochko wrote:
>> On 7/2/25 10:35 AM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>        return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>    }
>>>>    
>>>> +/*
>>>> + * pte_is_* helpers are checking the valid bit set in the
>>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>>> + * p2me_is_valid())
>>>> + * Provide our own overlay to check the valid bit.
>>>> + */
>>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>>> +{
>>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>>> +}
>>> Same question as on the earlier patch - does P2M type apply to intermediate
>>> page tables at all? (Conceptually it shouldn't.)
>> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
>> to a page — PTE should be valid. Considering that in the current implementation
>> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
>> of PTE.v.
> I'm confused by this reply. If you want to name 2nd level page table entries
> P2M - fine (but unhelpful). But then for any memory access there's only one
> of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
> how can there be "PTE.v = 0 but P2M.v = 1"?

I think I understand your confusion, let me try to rephrase.

The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
have the ability to use the P2M PTE valid bit to track which pages were accessed
by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
won't be too expensive, for example.
In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
will be set to something other than|p2m_invalid| (even for a table entries),
so when an MMU fault occurs, we can properly resolve it.

So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
the P2M PTE is genuinely invalid.

It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have 
ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
properly handle it and set to 1 P2M PTE valid bit to 1...

>
> An intermediate page table entry is something Xen controls entirely. Hence
> it has no (guest induced) type.

... And actually it is a reason why it is needed to set a type even for an
intermediate page table entry.

I hope now it is a lit bit clearer what and why was done.

>
>>>> @@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
>>>>        return e;
>>>>    }
>>>>    
>>>> +/* Generate table entry with correct attributes. */
>>>> +static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
>>>> +{
>>>> +    /*
>>>> +     * Since this function generates a table entry, according to "Encoding
>>>> +     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
>>>> +     * to point to the next level of the page table.
>>>> +     * Therefore, to ensure that an entry is a page table entry,
>>>> +     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
>>>> +     * which overrides whatever was passed as `p2m_type_t` and guarantees that
>>>> +     * the entry is a page table entry by setting r = w = x = 0.
>>>> +     */
>>>> +    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
>>> Similarly P2M access shouldn't apply to intermediate page tables. (Moot
>>> with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
>>> read what it means, didn't you?)
>> |p2m_access_n2rwx| was chosen not really because of the description mentioned near
>> its declaration, but because it sets r=w=x=0, which RISC-V expects for a PTE that
>> points to the next-level page table.
>>
>> Generally, I agree that P2M access shouldn't be applied to intermediate page tables.
>>
>> What I can suggest in this case is to use|p2m_access_rwx| instead of|p2m_access_n2rwx|,
> No. p2m_access_* shouldn't come into play here at all.

Okay, then it seems like I just can't explicitly re-use p2m_pte_from_mfn() in
page_to_p2m_table() and have to open-code p2m_pte_from_mfn() or add another one
argument is_table to decide if p2m_access_t and/or p2m_type_t should be applied.

>   Period. Just like P2M types
> shouldn't. As per above - intermediate page tables are Xen internal constructs.

Look please at the explaining above why p2m types is needed despite of the fact that
logically it isn't really needed.

>
>> which will ensure that the P2M access type isn't applied when|p2m_entry_from_mfn() |is called, and then, after calling|p2m_entry_from_mfn()|, simply set|PTE.r,w,x=0|.
>> So this function will look like:
>>       /* Generate table entry with correct attributes. */
>>       static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
>>       {
>>           /*
>>           * p2m_ram_rw is chosen for a table entry as p2m table should be valid
>>           * from both P2M and hardware point of view.
>>           *
>>           * p2m_access_rwx is chosen to restrict access permissions, what mean
>>           * do not apply access permission for a table entry
>>           */
>>           pte_t pte = p2m_pte_from_mfn(p2m, page_to_mfn(page), _gfn(0), p2m_ram_rw,
>>                                       p2m_access_rwx);
>>
>>           /*
>>           * Since this function generates a table entry, according to "Encoding
>>           * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
>>           * to point to the next level of the page table.
>>           */
>>           pte.pte &= ~PTE_ACCESS_MASK;
>>
>>           return pte;
>>       }
>>
>> Does this make sense? Or would it be better to keep the current version of
>> |page_to_p2m_table()| and just improve the comment explaining why|p2m_access_n2rwx |is used for a table entry?
> No to both, as per above.
>
>>>> +static struct page_info *p2m_alloc_page(struct domain *d)
>>>> +{
>>>> +    struct page_info *pg;
>>>> +
>>>> +    /*
>>>> +     * For hardware domain, there should be no limit in the number of pages that
>>>> +     * can be allocated, so that the kernel may take advantage of the extended
>>>> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
>>>> +     */
>>>> +    if ( is_hardware_domain(d) )
>>>> +    {
>>>> +        pg = alloc_domheap_page(d, MEMF_no_owner);
>>>> +        if ( pg == NULL )
>>>> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>>>> +    }
>>> The comment looks to have been taken verbatim from Arm. Whatever "extended
>>> regions" are, does the same concept even exist on RISC-V?
>> Initially, I missed that it’s used only for Arm. Since it was mentioned in
>> |doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
>> But now I see that it’s Arm-specific:: ### ext_regions (Arm)
>>
>>> Also, special casing Dom0 like this has benefits, but also comes with a
>>> pitfall: If the system's out of memory, allocations will fail. A pre-
>>> populated pool would avoid that (until exhausted, of course). If special-
>>> casing of Dom0 is needed, I wonder whether ...
>>>
>>>> +    else
>>>> +    {
>>>> +        spin_lock(&d->arch.paging.lock);
>>>> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>> +        spin_unlock(&d->arch.paging.lock);
>>>> +    }
>>> ... going this path but with a Dom0-only fallback to general allocation
>>> wouldn't be the better route.
>> IIUC, then it should be something like:
>>     static struct page_info *p2m_alloc_page(struct domain *d)
>>     {
>>         struct page_info *pg;
>>         
>>         spin_lock(&d->arch.paging.lock);
>>         pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>         spin_unlock(&d->arch.paging.lock);
>>
>>         if ( !pg && is_hardware_domain(d) )
>>         {
>>               /* Need to allocate more memory from domheap */
>>               pg = alloc_domheap_page(d, MEMF_no_owner);
>>               if ( pg == NULL )
>>               {
>>                   printk(XENLOG_ERR "Failed to allocate pages.\n");
>>                   return pg;
>>               }
>>               ACCESS_ONCE(d->arch.paging.total_pages)++;
>>               page_list_add_tail(pg, &d->arch.paging.freelist);
>>         }
>>      
>>         return pg;
>> }
>>
>> And basically use|d->arch.paging.freelist| for both dom0less and dom0 domains,
>> with the only difference being that in the case of Dom0,|d->arch.paging.freelist |could be extended.
>>
>> Do I understand your idea correctly?
> Broadly yes, but not in the details. For example, I don't think such a
> page allocated from the general heap would want appending to freelist.
> Commentary and alike also would want tidying.

Could you please explain why it wouldn't want appending to freelist?

>
> And of course going forward, for split hardware and control domains the
> latter may want similar treatment.

Could you please clarify what is the difference between hardware and control
domains?
I thought that it is the same or is it for the case when we have
dom0 (control domain) which runs domD (hardware domain) and guest domain?

Thanks.

~ Oleksii

--------------9UdMog6SUmcEbF0Ec36Ntq7B
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
    <div class="moz-cite-prefix">On 7/16/25 1:43 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
to a page — PTE should be valid. Considering that in the current implementation
it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
of PTE.v.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm confused by this reply. If you want to name 2nd level page table entries
P2M - fine (but unhelpful). But then for any memory access there's only one
of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
how can there be "PTE.v = 0 but P2M.v = 1"?</pre>
    </blockquote>
    <pre>I think I understand your confusion, let me try to rephrase.

The reason for having both <code>p2m_is_valid()</code> and <code>pte_is_valid()</code> is that I want to
have the ability to use the P2M PTE valid bit to track which pages were accessed
by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
won't be too expensive, for example.
In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
will be set to something other than <code>p2m_invalid</code> (even for a table entries),
so when an MMU fault occurs, we can properly resolve it.

So, if the P2M PTE type (what <code>p2m_is_valid()</code> checks) is set to <code>p2m_invalid</code>, it
means that the valid bit (what <code>pte_is_valid()</code> checks) should be set to 0, so
the P2M PTE is genuinely invalid.</pre>
    <pre>It could also be the case that the P2M PTE type isn't <code>p2m_invalid (and P2M PTE
valid will be intentionally set to 0 to have ability to track which pages were
accessed for the reason I wrote above)</code>, and when MMU fault occurs we could
properly handle it and set to 1 P2M PTE valid bit to 1...
</pre>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
      <pre wrap="" class="moz-quote-pre">

An intermediate page table entry is something Xen controls entirely. Hence
it has no (guest induced) type.</pre>
    </blockquote>
    <pre>... And actually it is a reason why it is needed to set a type even for an
intermediate page table entry.

I hope now it is a lit bit clearer what and why was done.

</pre>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
      return e;
  }
  
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
+{
+    /*
+     * Since this function generates a table entry, according to "Encoding
+     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
+     * to point to the next level of the page table.
+     * Therefore, to ensure that an entry is a page table entry,
+     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
+     * which overrides whatever was passed as `p2m_type_t` and guarantees that
+     * the entry is a page table entry by setting r = w = x = 0.
+     */
+    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Similarly P2M access shouldn't apply to intermediate page tables. (Moot
with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
read what it means, didn't you?)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
|p2m_access_n2rwx| was chosen not really because of the description mentioned near
its declaration, but because it sets r=w=x=0, which RISC-V expects for a PTE that
points to the next-level page table.

Generally, I agree that P2M access shouldn't be applied to intermediate page tables.

What I can suggest in this case is to use|p2m_access_rwx| instead of|p2m_access_n2rwx|,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No. p2m_access_* shouldn't come into play here at all.</pre>
    </blockquote>
    <pre>Okay, then it seems like I just can't explicitly re-use p2m_pte_from_mfn() in
page_to_p2m_table() and have to open-code p2m_pte_from_mfn() or add another one
argument is_table to decide if p2m_access_t and/or p2m_type_t should be applied.

</pre>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
      <pre wrap="" class="moz-quote-pre"> Period. Just like P2M types
shouldn't. As per above - intermediate page tables are Xen internal constructs.</pre>
    </blockquote>
    <pre>Look please at the explaining above why p2m types is needed despite of the fact that
logically it isn't really needed. 

</pre>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">which will ensure that the P2M access type isn't applied when|p2m_entry_from_mfn() |is called, and then, after calling|p2m_entry_from_mfn()|, simply set|PTE.r,w,x=0|.
So this function will look like:
     /* Generate table entry with correct attributes. */
     static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
     {
         /*
         * p2m_ram_rw is chosen for a table entry as p2m table should be valid
         * from both P2M and hardware point of view.
         *
         * p2m_access_rwx is chosen to restrict access permissions, what mean
         * do not apply access permission for a table entry
         */
         pte_t pte = p2m_pte_from_mfn(p2m, page_to_mfn(page), _gfn(0), p2m_ram_rw,
                                     p2m_access_rwx);

         /*
         * Since this function generates a table entry, according to "Encoding
         * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
         * to point to the next level of the page table.
         */
         pte.pte &amp;= ~PTE_ACCESS_MASK;

         return pte;
     }

Does this make sense? Or would it be better to keep the current version of
|page_to_p2m_table()| and just improve the comment explaining why|p2m_access_n2rwx |is used for a table entry?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No to both, as per above.

</pre>
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
        <pre wrap="" class="moz-quote-pre">
Initially, I missed that it’s used only for Arm. Since it was mentioned in
|doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
But now I see that it’s Arm-specific:: ### ext_regions (Arm)

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Also, special casing Dom0 like this has benefits, but also comes with a
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
        <pre wrap="" class="moz-quote-pre">
IIUC, then it should be something like:
   static struct page_info *p2m_alloc_page(struct domain *d)
   {
       struct page_info *pg;
       
       spin_lock(&amp;d-&gt;arch.paging.lock);
       pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
       spin_unlock(&amp;d-&gt;arch.paging.lock);

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
      <pre wrap="" class="moz-quote-pre">
Broadly yes, but not in the details. For example, I don't think such a
page allocated from the general heap would want appending to freelist.
Commentary and alike also would want tidying.</pre>
    </blockquote>
    <pre>Could you please explain why it wouldn't want appending to freelist?

</pre>
    <blockquote type="cite"
      cite="mid:aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com">
      <pre wrap="" class="moz-quote-pre">

And of course going forward, for split hardware and control domains the
latter may want similar treatment.
</pre>
    </blockquote>
    <pre>Could you please clarify what is the difference between hardware and control
domains?
I thought that it is the same or is it for the case when we have
dom0 (control domain) which runs domD (hardware domain) and guest domain?

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------9UdMog6SUmcEbF0Ec36Ntq7B--

