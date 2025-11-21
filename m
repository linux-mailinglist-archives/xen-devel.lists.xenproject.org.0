Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93834C78309
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168550.1494529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNaa-0005jQ-QM; Fri, 21 Nov 2025 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168550.1494529; Fri, 21 Nov 2025 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNaa-0005gj-NE; Fri, 21 Nov 2025 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1168550;
 Fri, 21 Nov 2025 09:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfPM=55=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vMNaZ-0005gR-73
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:37:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1dd722a-c6bd-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 10:37:55 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso297354366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 01:37:55 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4e51sm415577766b.42.2025.11.21.01.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 01:37:53 -0800 (PST)
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
X-Inumbo-ID: c1dd722a-c6bd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763717875; x=1764322675; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4WLGDTdYpE0UpvRqdAbbIpa6f/gZL1niV3eIf2Peig=;
        b=hcA+cFv+SXpqjGreZDaSCAyRnHNO+CX25KAOXuPL3kthEVi0h1NusoAN5+0kSr09YN
         6gfmtezLYycnyIFh/WAG9zJwSBPVbpVRJK86L8dPKfje+zOynwQIWEAeKh//szVCtPLR
         OB2wa5g9drs8k0MG1qMeIwgl8NaGi4GYZjQB5kdwtBJvlErCthu/t30y4Sn0px3VEUjO
         ixNcNNSOEIaydjgaPL5n95F4T7aJUpDyTKNx/ezlzIWCBlOubtCeKujjwNDfl9XDJ+dt
         99KmkiRduFcB9lTPtcIIbBKK/eYnITnmdeEDStSlXQ8YG2x64a9cTETSYc57mhXwH3cU
         B5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717875; x=1764322675;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4WLGDTdYpE0UpvRqdAbbIpa6f/gZL1niV3eIf2Peig=;
        b=kqHihLPNkIs2JPjdiyDwN2xgLY1UHE+2vi91FC8g7h1VXcLVYPMHFLnqEo2x8i4l04
         bbJcE/WHhEdXFTfyywrf3qlFGh8q1sa5HD0ZHnIfWiBdLmFgCHZiKuQGJFHlDkjek0f0
         WrU5P5zuQly6ZHtO12lr8TvxwZt5CYi8dCiEjZLWRoC/zB+HOt9aHa5gLZO7v5ZQR25R
         WxPho/wkF31mmvezXRcdw/KLNLuB8T2nHU/10ZS1ubz8T59MFIM82t1VWSejbJuY82LG
         Ertd1Iyq8JMKwxutfp7GGU2JXdKiFktrNF6oxt12sr1lijQTiMaNYK+/1C3/MDTo00l4
         kCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdODXX8FE9Dt8oDg40kMmaGMispLv1yCD6k13M0sJurQYyjj/r5PnaithUVOhWshDcxYUWFZvFbuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnjVCy3k+Dt73ccS/qzP8/WjUBDi8q+1lkeNIdREb2uFcghozt
	+MDr+h9701KYepok4TuO1SD8ozvJls8rhj6cRxxk8SC4181O78mEqu56
X-Gm-Gg: ASbGncu2KbgcCOqwL7GsDA0IC3tTAVwN1XaPEYW6wG4DXOQy3VeX4CDDQfOqcUzC3Rt
	CZgQpx5EGr+32kV/IVuWrGt3Eud9uG0cnQ2a4BVzsem7s5Ob1ujWRr+AkuoihPQymLjfQp+2JyV
	X/FRENb1hzrGHsBIVab0HQxVHMXMEe+9sPiguWk+KM45sXMfzee71vRAdVL7vqNWZVTE8ick7PD
	TEG+LqPx46WAtD6eArgerbV+ILzRStWr624bj31dvHk7OHYjqoRCdhAzvloe7uG1XJcQ/X+QhDq
	gkwroartIhqgtf6Zx9RSZwPm4nTWUFO9T9RJMfGRxc39Vz+zgdv9nd7w7vpIiMQXhMRqjtSArJ+
	xkpkvFzn/0EbhMeM6ffjDdots7Fp/7cQ18tMqfLYTXkwNGwQjJ8pq9JvyULm4RXXmyXCh15Cx8r
	bnxeegNcpY2LsyVYsPX9MShVJHRsq/jcaNePBajv3ki9B9tkCzxaa2TAeqxEhX6gpbzRNouIs=
X-Google-Smtp-Source: AGHT+IEFbW7Jvrh2e3aX0n67UOKKJauX+PSq7yPIUp/uX2xuPXTV1RrN8kx1coXrYbTFvrUkRe6RZA==
X-Received: by 2002:a17:907:e8c:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b767173c3f7mr164808366b.26.1763717874465;
        Fri, 21 Nov 2025 01:37:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------8XlkmW7sZwONcM6khLj70fBq"
Message-ID: <60fc80c8-0f7b-41e4-8e38-e7ca915ec9bf@gmail.com>
Date: Fri, 21 Nov 2025 10:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
 <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
 <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
 <6f431394-5c08-4974-85ae-4b38f1975289@suse.com>
 <e2cbb6b9-ab07-4aad-8eb8-f4dd859ac6f6@gmail.com>
 <b859d5c1-b602-4e61-b667-2701e0f31434@suse.com>
 <3f772780-75af-4d77-96c9-7eb7dc697ff8@gmail.com>
 <a1fc8b4b-735e-4f5d-a015-318b3e1f3550@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a1fc8b4b-735e-4f5d-a015-318b3e1f3550@suse.com>

This is a multi-part message in MIME format.
--------------8XlkmW7sZwONcM6khLj70fBq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/21/25 8:35 AM, Jan Beulich wrote:
> On 20.11.2025 17:52, Oleksii Kurochko wrote:
>> On 11/20/25 4:47 PM, Jan Beulich wrote:
>>> On 20.11.2025 16:38, Oleksii Kurochko wrote:
>>>> On 11/18/25 7:58 AM, Jan Beulich wrote:
>>>>> On 17.11.2025 20:51, Oleksii Kurochko wrote:
>>>>>> On 11/12/25 12:49 PM, Jan Beulich wrote:
>>>>>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>>>>>> +    if ( *md_pg )
>>>>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>>>>> +
>>>>>>>> +    if ( t < p2m_first_external )
>>>>>>>> +    {
>>>>>>>>              pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>>>>      -    return rc;
>>>>>>>> +        if ( metadata )
>>>>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>>>>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>>>>>>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
>>>>>> I think that, at least, at the moment we are always explicitly set p2m type and
>>>>>> do not rely on that by default 0==p2m_invalid.
>>>>> You don't, and ...
>>>>>
>>>>>> Just to be safe, I will add after "if ( metadata )" suggested
>>>>>> BUILD_BUG_ON(p2m_invalid):
>>>>>>            if ( metadata )
>>>>>>                metadata[ctx->index].type = p2m_invalid;
>>>>>>                    /*
>>>>>>             * metadata.type is expected to be p2m_invalid (0) after the page is
>>>>>>             * allocated and zero-initialized in p2m_alloc_page().
>>>>>>             */
>>>>>>            BUILD_BUG_ON(p2m_invalid);
>>>>>> ...
>>>>> ... this leaves me with the impression that you didn't read my reply correctly.
>>>>> p2m_alloc_page() clear the page, thus_implicitly_ setting all entries to
>>>>> p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
>>>>> ftaod).
>>>> I think I still don’t fully understand what the issue would be if|p2m_invalid| were
>>>> ever equal to 1 instead of 0 in the context of a metadata page.
>>>>
>>>> Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
>>>> metadata pagebefore it was assigned any type. They would find a value of 0, which
>>>> corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
>>>> However, I’m not sure I currently see a scenario in which the metadata page would
>>>> be read before being initialized.
>>> Are you sure walks can only happen for GFNs that were set up? What you need to
>>> do walks on is under guest control, after all.
>> If a GFN lies within the range[p2m->lowest_mapped_gfn, p2m->max_mapped_gfn], then
>> |p2m_set_entry()| must already have been called for this GFN.
> No. All you know from the pre-condition is that p2m_set_entry() was called for the
> lowest and highest GFNs in that range.
>
Oh, right. There could still be some GFNs inside the range for which|p2m_set_entry()| has
not yet been called. Then it probably makes sense to add a|BUILD_BUG_ON| here as well, before
"if ( type == p2m_ext_storage )":

     static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
     {
         p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
     
         if ( type == p2m_ext_storage )
         {
             const pte_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
     
             type = md[ctx->index].pte;
     
             unmap_domain_page(md);
         }
     
         return type;
     }

I would expect that if|p2m_set_entry()| has not been called for a GFN, then|p2m_get_entry()|
(|p2m_get_type()| will be called somewhere inside|p2m_get_entry()|, for example) should return
the|p2m_invalid| type. I think we want to have the same check (as the one before the call to
|p2m_alloc_page()|), placed before the condition:
   BUILD_BUG_ON(p2m_invalid);

~ Oleksii

>
>> This means that either
>> - a metadata page has been created and its entry filled with the appropriate type, or
>> - no metadata page was needed and the type was stored directly in|pte->pte|
>>
>> For a GFN outside the range(p2m->lowest_mapped_gfn, p2m->max_mapped_gfn),
>> |p2m_get_entry()| will not even attempt a walk because of the boundary checks:
>>       static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>                                  p2m_type_t *t,
>>                                  unsigned int *page_order)
>>       ...
>>           if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
>>                                       &level) )
>>               goto out;
>>       
>>           if ( check_outside_boundary(p2m, gfn, p2m->max_mapped_gfn, false, &level) )
>>               goto out;
>>
>> If I am misunderstanding something and there are other cases where a walk can occur for
>> GFNs that were never set up, then such GFNs would have neither an allocated metadata
>> page nor a type stored in|pte->pte|, which looks like we are in trouble.
>>
>> ~ Oleksii
>>
--------------8XlkmW7sZwONcM6khLj70fBq
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
    <div class="moz-cite-prefix">On 11/21/25 8:35 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a1fc8b4b-735e-4f5d-a015-318b3e1f3550@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.11.2025 17:52, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 11/20/25 4:47 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.11.2025 16:38, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 11/18/25 7:58 AM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 17.11.2025 20:51, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 11/12/25 12:49 PM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t &lt; p2m_first_external )
+    {
            pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
    -    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
p2m_alloc_page()'s clearing of the page won't have the intended effect?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">I think that, at least, at the moment we are always explicitly set p2m type and
do not rely on that by default 0==p2m_invalid.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">You don't, and ...

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Just to be safe, I will add after "if ( metadata )" suggested
BUILD_BUG_ON(p2m_invalid):
          if ( metadata )
              metadata[ctx-&gt;index].type = p2m_invalid;
                  /*
           * metadata.type is expected to be p2m_invalid (0) after the page is
           * allocated and zero-initialized in p2m_alloc_page().
           */
          BUILD_BUG_ON(p2m_invalid);
...
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... this leaves me with the impression that you didn't read my reply correctly.
p2m_alloc_page() clear the page, thus_implicitly_ setting all entries to
p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
ftaod).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think I still don’t fully understand what the issue would be if|p2m_invalid| were
ever equal to 1 instead of 0 in the context of a metadata page.

Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
metadata pagebefore it was assigned any type. They would find a value of 0, which
corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
However, I’m not sure I currently see a scenario in which the metadata page would
be read before being initialized.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Are you sure walks can only happen for GFNs that were set up? What you need to
do walks on is under guest control, after all.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
If a GFN lies within the range[p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn], then
|p2m_set_entry()| must already have been called for this GFN.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No. All you know from the pre-condition is that p2m_set_entry() was called for the
lowest and highest GFNs in that range.

</pre>
    </blockquote>
    <pre>Oh, right. There could still be some GFNs inside the range for which <code
    data-start="205" data-end="222">p2m_set_entry()</code> has
not yet been called. Then it probably makes sense to add a <code
    data-start="286" data-end="300">BUILD_BUG_ON</code> here as well, before
"if ( type == p2m_ext_storage )":

    static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
    {
        p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
    
        if ( type == p2m_ext_storage )
        {
            const pte_t *md = __map_domain_page(ctx-&gt;pt_page-&gt;v.md.pg);
    
            type = md[ctx-&gt;index].pte;
    
            unmap_domain_page(md);
        }
    
        return type;
    }

I would expect that if <code data-start="749" data-end="766">p2m_set_entry()</code> has not been called for a GFN, then <code
    data-start="803" data-end="820">p2m_get_entry()</code>
(<code data-start="824" data-end="840">p2m_get_type()</code> will be called somewhere inside <code
    data-start="873" data-end="890">p2m_get_entry()</code>, for example) should return
the <code data-start="912" data-end="925">p2m_invalid</code> type. I think we want to have the same check (as the one before the call to
<code data-start="1004" data-end="1022">p2m_alloc_page()</code>), placed before the condition:
  BUILD_BUG_ON(p2m_invalid);

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:a1fc8b4b-735e-4f5d-a015-318b3e1f3550@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This means that either
- a metadata page has been created and its entry filled with the appropriate type, or
- no metadata page was needed and the type was stored directly in|pte-&gt;pte|

For a GFN outside the range(p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn),
|p2m_get_entry()| will not even attempt a walk because of the boundary checks:
     static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                                p2m_type_t *t,
                                unsigned int *page_order)
     ...
         if ( check_outside_boundary(p2m, gfn, p2m-&gt;lowest_mapped_gfn, true,
                                     &amp;level) )
             goto out;
     
         if ( check_outside_boundary(p2m, gfn, p2m-&gt;max_mapped_gfn, false, &amp;level) )
             goto out;

If I am misunderstanding something and there are other cases where a walk can occur for
GFNs that were never set up, then such GFNs would have neither an allocated metadata
page nor a type stored in|pte-&gt;pte|, which looks like we are in trouble.

~ Oleksii

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------8XlkmW7sZwONcM6khLj70fBq--

