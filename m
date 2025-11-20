Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E0C757A2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 17:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167653.1493909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM7tm-00048n-RZ; Thu, 20 Nov 2025 16:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167653.1493909; Thu, 20 Nov 2025 16:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM7tm-00046X-OK; Thu, 20 Nov 2025 16:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1167653;
 Thu, 20 Nov 2025 16:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vM7tl-00046R-Gj
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 16:52:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54eb8fb0-c631-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 17:52:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b737502f77bso171992666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 08:52:43 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdd5bfsm252580166b.9.2025.11.20.08.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 08:52:41 -0800 (PST)
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
X-Inumbo-ID: 54eb8fb0-c631-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763657562; x=1764262362; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ak40zxKaq3+23GW7CW6VFOeumz59z7LChuu1B8krt4=;
        b=AnXqgNPErGGhmmoNzgpKENKx1T+/GvGtNIqCGbMXKM/HN7PTt4vdZ8qmjxAO9j6nor
         osHnus0YyXl6fIxbJV2H87Wi/FB5IE6Fb3lylGpMLRrOQ5pYXkwllST7LTggo0E8plkl
         qTY/MSEw/bzcTcjY0BSaPzmPzz0J1vXvIpRKhjQE78bStrw4lAJJejuV1HNhzxuJnkRK
         ZW3Xb2ltRUJdW/IAcbKNX1umk8cJBZCXfcBCq2JF3h8P2mU5Tm1iXbfTuw8MCX4aYy3q
         6YU9PtHtg1Q+If3y73H0Z0lRhHYRy2HlqUOiyTb1yTJMwQ25rS+fEaa1XoGmB8mj69i0
         HSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763657562; x=1764262362;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ak40zxKaq3+23GW7CW6VFOeumz59z7LChuu1B8krt4=;
        b=pK6RdGRzFAwowRxvgUqD+luxLWyjtsVJBvYdiPYTIMAcILx2Axc5N3MZ1Ec811drKl
         huiak7pWUrx2hO0/0PeeadzWYPLugeLtnFjHdiU1p405pfm7FGGOiwY+hMrvSGYL467c
         hlxtMUd3dkcC3L9D2AnZ+XiBsXCc9H2Mgw4EY/SNolCf091UyE36h+p8Q453p6P+Pqls
         Q2bjqtB14p0t3ob1Hm8F5w4AfruP4kY1R77TvIqqTRW93hApU9Tf53oNowC9GCRuH3RR
         cfD/j/pJiz6A1C1H9vbDUv9zorJ7IhAg1H1wtS/UnDCKZWcQ2jQxe6T/cynXYWQkpqgm
         bjGw==
X-Forwarded-Encrypted: i=1; AJvYcCUM8TNmFnKVYqKqJPSWgA3CCkQ85QdHNPGgYn/89a+Pcrxgaojc9m47XZs/+vZa5OPzl1bUCk0rTjs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbAytLCIz50tVNUa/WzTQqo28vKHlhCQnZdv8huXErs4NoV5C0
	0eqUbjMpBcgca0OL8l3nmC4Jz5CTXE5ZCt+iituLB8h9OyT8qNZX1tpn
X-Gm-Gg: ASbGnctE2OQ6m4DClaqLaNXRQi6ip/wkNsgmvUTlHh9msv0XWNk0n5VqHOiRs5IkOyu
	mEMsKZda1T4V3K9eQEv8I9Rh6MSo86GRmFSsLcCTcJJdEH8YPeN2vmao8bfAJR8qoJ/XTZpI8IY
	gkyaS2O04duJjXCfNbFu/5dxYUMeXKdSWa5gvUEeah8dlpugaWpwGZUnsVkU9bdszYTq1/Ks6Rb
	OJhLvGNwix4jyoBaTaT/vvigG2/ULfy9J80IbuY1YsTWbESiWsnDSjvqXbxHQsVMU2wefkiFt6J
	ERSwf2J08ZOkD70r4Ms16+rGLJUw9vHexHY/bQyM1X3xWEr+z7vTusRCom/xJomM049RQDY2rTB
	o8kgCCu7FhpiqSG0HPnGIFvw/o75T9+UOH8lbvOORyy1bFJz0dGMygUqsBdMt9JcgoGwyrog5QA
	i9mqjaLlSr6B1PrEuEC//rQS2GSonAYPVgVeoMIGA2Cnk4ROQXlc4fY8yLlACP
X-Google-Smtp-Source: AGHT+IHDM7X3OKJ/QPfpblGqFIYbjPgzpwL/8qLuqd6z6N2E5ipRHlB7MNYtZDwNChyJH/mIAHX6xw==
X-Received: by 2002:a17:906:fe47:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b7654dd66ecmr421368166b.18.1763657562002;
        Thu, 20 Nov 2025 08:52:42 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------PMK9GPWPHuNX3OjgopwO5bTu"
Message-ID: <3f772780-75af-4d77-96c9-7eb7dc697ff8@gmail.com>
Date: Thu, 20 Nov 2025 17:52:40 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b859d5c1-b602-4e61-b667-2701e0f31434@suse.com>

This is a multi-part message in MIME format.
--------------PMK9GPWPHuNX3OjgopwO5bTu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/25 4:47 PM, Jan Beulich wrote:
> On 20.11.2025 16:38, Oleksii Kurochko wrote:
>> On 11/18/25 7:58 AM, Jan Beulich wrote:
>>> On 17.11.2025 20:51, Oleksii Kurochko wrote:
>>>> On 11/12/25 12:49 PM, Jan Beulich wrote:
>>>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>>>> +    if ( *md_pg )
>>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>>> +
>>>>>> +    if ( t < p2m_first_external )
>>>>>> +    {
>>>>>>             pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>>     -    return rc;
>>>>>> +        if ( metadata )
>>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>>>>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
>>>> I think that, at least, at the moment we are always explicitly set p2m type and
>>>> do not rely on that by default 0==p2m_invalid.
>>> You don't, and ...
>>>
>>>> Just to be safe, I will add after "if ( metadata )" suggested
>>>> BUILD_BUG_ON(p2m_invalid):
>>>>           if ( metadata )
>>>>               metadata[ctx->index].type = p2m_invalid;
>>>>                   /*
>>>>            * metadata.type is expected to be p2m_invalid (0) after the page is
>>>>            * allocated and zero-initialized in p2m_alloc_page().
>>>>            */
>>>>           BUILD_BUG_ON(p2m_invalid);
>>>> ...
>>> ... this leaves me with the impression that you didn't read my reply correctly.
>>> p2m_alloc_page() clear the page, thus_implicitly_ setting all entries to
>>> p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
>>> ftaod).
>> I think I still don’t fully understand what the issue would be if|p2m_invalid| were
>> ever equal to 1 instead of 0 in the context of a metadata page.
>>
>> Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
>> metadata pagebefore it was assigned any type. They would find a value of 0, which
>> corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
>> However, I’m not sure I currently see a scenario in which the metadata page would
>> be read before being initialized.
> Are you sure walks can only happen for GFNs that were set up? What you need to
> do walks on is under guest control, after all.

If a GFN lies within the range[p2m->lowest_mapped_gfn, p2m->max_mapped_gfn], then
|p2m_set_entry()| must already have been called for this GFN. This means that either
- a metadata page has been created and its entry filled with the appropriate type, or
- no metadata page was needed and the type was stored directly in|pte->pte|

For a GFN outside the range(p2m->lowest_mapped_gfn, p2m->max_mapped_gfn),
|p2m_get_entry()| will not even attempt a walk because of the boundary checks:
     static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                                p2m_type_t *t,
                                unsigned int *page_order)
     ...
         if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
                                     &level) )
             goto out;
     
         if ( check_outside_boundary(p2m, gfn, p2m->max_mapped_gfn, false, &level) )
             goto out;

If I am misunderstanding something and there are other cases where a walk can occur for
GFNs that were never set up, then such GFNs would have neither an allocated metadata
page nor a type stored in|pte->pte|, which looks like we are in trouble.

~ Oleksii

--------------PMK9GPWPHuNX3OjgopwO5bTu
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
    <div class="moz-cite-prefix">On 11/20/25 4:47 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b859d5c1-b602-4e61-b667-2701e0f31434@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 20.11.2025 16:38, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 11/18/25 7:58 AM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 17.11.2025 20:51, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 11/12/25 12:49 PM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t &lt; p2m_first_external )
+    {
           pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
   -    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
</pre></blockquote><pre wrap="" class="moz-quote-pre">Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
p2m_alloc_page()'s clearing of the page won't have the intended effect?
</pre></blockquote><pre wrap="" class="moz-quote-pre">I think that, at least, at the moment we are always explicitly set p2m type and
do not rely on that by default 0==p2m_invalid.
</pre></blockquote><pre wrap="" class="moz-quote-pre">You don't, and ...

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Just to be safe, I will add after "if ( metadata )" suggested
BUILD_BUG_ON(p2m_invalid):
         if ( metadata )
             metadata[ctx-&gt;index].type = p2m_invalid;
                 /*
          * metadata.type is expected to be p2m_invalid (0) after the page is
          * allocated and zero-initialized in p2m_alloc_page().
          */
         BUILD_BUG_ON(p2m_invalid);
...
</pre></blockquote><pre wrap="" class="moz-quote-pre">... this leaves me with the impression that you didn't read my reply correctly.
p2m_alloc_page() clear the page, thus <span class="moz-txt-underscore"><span
      class="moz-txt-tag">_</span>implicitly<span class="moz-txt-tag">_</span></span> setting all entries to
p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
ftaod).
</pre></blockquote><pre wrap="" class="moz-quote-pre">I think I still don’t fully understand what the issue would be if|p2m_invalid| were
ever equal to 1 instead of 0 in the context of a metadata page.

Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
metadata pagebefore it was assigned any type. They would find a value of 0, which
corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
However, I’m not sure I currently see a scenario in which the metadata page would
be read before being initialized.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Are you sure walks can only happen for GFNs that were set up? What you need to
do walks on is under guest control, after all.</pre></pre>
    </blockquote>
    <pre data-start="139" data-end="310">If a GFN lies within the range <span
    data-start="170" data-end="219">[p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn]</span>, then
<code data-start="226" data-end="243">p2m_set_entry()</code> must already have been called for this GFN. This means that either
- a metadata page has been created and its entry filled with the appropriate type, or
- no metadata page was needed and the type was stored directly in <code
    data-start="468" data-end="478">pte-&gt;pte</code></pre>
    <pre data-start="481" data-end="640">For a GFN outside the range <span
    data-start="509" data-end="558">(p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn)</span>,
<code data-start="562" data-end="579">p2m_get_entry()</code> will not even attempt a walk because of the boundary checks:
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
page nor a type stored in <code data-start="1210" data-end="1220">pte-&gt;pte</code>, which looks like we are in trouble.

~ Oleksii

</pre>
  </body>
</html>

--------------PMK9GPWPHuNX3OjgopwO5bTu--

