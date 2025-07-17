Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB4B0888D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046447.1416789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKQ7-0002RT-3I; Thu, 17 Jul 2025 08:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046447.1416789; Thu, 17 Jul 2025 08:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKQ7-0002PQ-0h; Thu, 17 Jul 2025 08:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1046447;
 Thu, 17 Jul 2025 08:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83TL=Z6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucKQ5-0002P7-CN
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:56:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f824e35e-62eb-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:56:47 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae0df6f5758so122730966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:56:47 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7eead7csm1344259866b.62.2025.07.17.01.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:56:45 -0700 (PDT)
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
X-Inumbo-ID: f824e35e-62eb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752742606; x=1753347406; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dejbkhEdLCkxLsNnNY4JgtPvycDTe8c6VE8wvivWqGg=;
        b=MyYeocYTkr6HUY/NICp/ry70p+DkWtbvedK0k1rB1TtEN5hCd7kzbdmcxFSmXz/Bdw
         qZ9yutahhnKj8yBeSlChqCPvy71Wc82aA/4wN3r7s0R95JJ4lQ/HMYJ6EHRXCKkD8rPz
         wsuIhHh8Qo3oWy2gUJ33y6CPCqw6+O24qzPt+awX+o2y6EsZTJhXtntxS/TWz6XLIHJR
         I6zLuYkEZAvYH9tj1LvV3UoxeSft4mMUFs+1QOhA3L1qa1p2WDrPKWIuhEN94GBr8LJL
         VjExyUNMekqCQD7zkLZOaQYPL1ark830cdGr3MiUOFXrNhxfInA0k/SL/qEjb+6KVcoO
         /M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752742606; x=1753347406;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dejbkhEdLCkxLsNnNY4JgtPvycDTe8c6VE8wvivWqGg=;
        b=m5L75yHTPVpE1QpTRRVwOajcwjkuFnZiy0FxmFPOCWP9xJhH1beAQbB6vNaaHwzDXZ
         F2m4+LYydDJAWHAhoo98HWbmogTV94fwxr1GjQuehxQVHbNHhXNdSw6sBkZZWKBm7Had
         0RjLtFZTfqIkj426ozPHn5SDK9uCvJhZLqDu19/D05PSd0eM9GWfW0i4NoIOeQe6wjK7
         tTu1bsZ/LpltieUHEFLOzJ5MxaIjjrq6xSWScwGggwk7cN5ukeIG2lsdCJdBkKxxQh//
         u7tQwNBF+n/nW+E1tqqftHc7+NX25QdUKprKxIhh1UdaYUNxsnuNTgWlYYuZee5sKnrn
         +5hA==
X-Forwarded-Encrypted: i=1; AJvYcCXma5E8wkQBvPtR8PlLR4mD1Kqg65cUOf8BrV6dfI1fLLWimPokAQrqqq/jPd9pW9tngtn45J2nCXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7ghrsKpNCOM6u6Wcaa6iN1xRP7/FhJR1hneIAkvb9MuPsPi+7
	NOAZTR0GEcVQf3MXvBI9hPR1rlDcv9MtAtrbzPnCvrH97T5tE3mnYh1C
X-Gm-Gg: ASbGncvy+2Znqx02ME9UFFn1W7AWrIJ6zOOP3jMThdLIZ+RtWSl/aNf3H7Ar9YudEFJ
	0wpAu9T+HTpd9pncV4ZnpgsDFUM698eUqMoTSMsEMtbB64Lznyo1jHuFQlov77/2ARN62Pl6xat
	qzjFfKanlNkhxldpRyGEVZ2yRoG937qB3kt38wwsaVDfSKTJWLOZN0LuXl5Lka/SRpNuOONfx3s
	rOo9A7domZkaW4smwKfa/06WPWEmavBTyo2/86DiUASdkUhD85uQI7V1Dbk5GYoh+6r7hcfod1T
	IszbmoEXWVfUORR1+cVQ+LHiyM7bERie2V3R6ugpFSzyQ+v8ES/iFTWSacwOnN0xeloz7la4kWq
	dmTRk17foNNB/69S3g9Fpeamj5zAx6SLXTj0cBXWBkIJvjuzn47leejCBYnRQ0C717Z56sgo=
X-Google-Smtp-Source: AGHT+IF9lfzKi04UL9fnb5F1jSGX6zijwmu8etp6AnmJj1rAIZqYkUEHXgE3lQIOFnZZUemhXoHc4A==
X-Received: by 2002:a17:907:e2d3:b0:ae0:bbd2:68d5 with SMTP id a640c23a62f3a-ae9cdda7c83mr554761266b.2.1752742605849;
        Thu, 17 Jul 2025 01:56:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kBoHI4PTq4fBKMVLacsG37xa"
Message-ID: <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
Date: Thu, 17 Jul 2025 10:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>

This is a multi-part message in MIME format.
--------------kBoHI4PTq4fBKMVLacsG37xa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/25 6:18 PM, Jan Beulich wrote:
> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>         return __map_domain_page(p2m->root + root_table_indx);
>>>>>>     }
>>>>>>     
>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>> See comments on the earlier patch regarding naming.
>>>>>
>>>>>> +{
>>>>>> +    int rc;
>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>
>>>> I think I don't understand what is an issue. Could you please provide
>>>> some extra details?
>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>> of the function, making it possible to use it here?
>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>> implementation.
> Isn't that on overly severe limitation?

I wouldn't say that it's a severe limitation, as it's just a matter of how
|mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
|mfn_to_gfn()| can be implemented differently, while the code where it’s called
will likely remain unchanged.

What I meant in my reply is that, for the current state and current limitations,
this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
see the value in, or the need for, non-1:1 mapped domains—it's just that this
limitation simplifies development at the current stage of the RISC-V port.

>
>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>> making Xen insert very many entries?
>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>> Which would require these allocations to come from that pool.
>> Yes, and it is true only for non-hardware domains with the current implementation.
> ???

I meant that pool is used now only for non-hardware domains at the moment.

>
>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>> impacting just itself may be tolerable. But a domain affecting other domains
>>> isn't.
>> But it seems like this issue could happen in any implementation. It won't happen only
>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>> Otherwise, if extra pages allocation is allowed then we can't really do something
>> with this issue.
> But that's why I brought this up: You simply have to. Or, as indicated, the
> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.

Why it isn't XSA for other architectures? At least, Arm then should have such
XSA.
I don't understand why x86 won't have the same issue. Memory is the limited
and shared resource, so if one of the domain will use to much memory then it could
happen that other domains won't have enough memory for its purpose...

> This is the kind of thing you need to consider up front. Or at least mark with
> a prominent FIXME annotation. All of which would need resolving before even
> considering to mark code as supported.

... At the moment, I’m trying to understand if this issue can be solved properly at
all when a domain is allowed to request or map extra memory for its own purposes.

The only solution I see is that each domain—regardless of its type—should have its
own pre-populated pools. This way, during construction, we’ll know whether the
domain can be created or if we’ve run out of memory, which would mean that no
more domains can be launched.
And if in runtime of a domain there is no free pages in a pre-populated pool then
just stop a domain (or return rc to a domain that there is no memory anymore and
let a domain to decide what it should do), otherwise if I will start to allocate
extra memory for domain which doesn't have free pages in a pool, it could lead
to the XSA issue you mentioned that one domain could exhaust memory so another
domain, at least, won't be able to allocate extra pages (in the case this another
domain also doesn't have free pages in a pool).

~ Oleksii

--------------kBoHI4PTq4fBKMVLacsG37xa
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
    <div class="moz-cite-prefix">On 7/16/25 6:18 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 16.07.2025 18:07, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/16/25 1:31 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 15.07.2025 16:47, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 7/1/25 5:08 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
       return __map_domain_page(p2m-&gt;root + root_table_indx);
   }
   
+static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">See comments on the earlier patch regarding naming.

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+{
+    int rc;
+    gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">How does this work, when you record GFNs only for Xenheap pages?
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I think I don't understand what is an issue. Could you please provide
some extra details?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Counter question: The mfn_to_gfn() you currently have is only a stub. It only
works for 1:1 mapped domains. Can you show me the eventual final implementation
of the function, making it possible to use it here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
At the moment, I planned to support only 1:1 mapped domains, so it is final
implementation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't that on overly severe limitation?</pre>
    </blockquote>
    <pre data-start="0" data-end="258">I wouldn't say that it's a severe limitation, as it's just a matter of how
<code data-start="75" data-end="89">mfn_to_gfn()</code> is implemented. When non-1:1 mapped domains are supported,
<code data-start="149" data-end="163">mfn_to_gfn()</code> can be implemented differently, while the code where it’s called
will likely remain unchanged.</pre>
    <pre data-start="260" data-end="575" data-is-last-node=""
    data-is-only-node="">What I meant in my reply is that, for the current state and current limitations,
this is the final implementation of <code data-start="377"
    data-end="391">mfn_to_gfn()</code>. But that doesn't mean I don't
see the value in, or the need for, non-1:1 mapped domains—it's just that this
limitation simplifies development at the current stage of the RISC-V port.</pre>
    <blockquote type="cite"
      cite="mid:15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">In this context (not sure if I asked before): With this use of a radix tree,
how do you intend to bound the amount of memory that a domain can use, by
making Xen insert very many entries?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I didn’t think about that. I assumed it would be enough to set the amount of
memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Which would require these allocations to come from that pool.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, and it is true only for non-hardware domains with the current implementation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
???</pre>
    </blockquote>
    <pre>I meant that pool is used now only for non-hardware domains at the moment.

</pre>
    <blockquote type="cite"
      cite="mid:15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Also, it seems this would just lead to the issue you mentioned earlier: when
the memory runs out,|domain_crash()| will be called or PTE will be zapped.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Or one domain exhausting memory would cause another domain to fail. A domain
impacting just itself may be tolerable. But a domain affecting other domains
isn't.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
But it seems like this issue could happen in any implementation. It won't happen only
if we will have only pre-populated pool for any domain type (hardware, control, guest
domain) without ability to extend them or allocate extra pages from domheap in runtime.
Otherwise, if extra pages allocation is allowed then we can't really do something
with this issue.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But that's why I brought this up: You simply have to. Or, as indicated, the
moment you mark Xen security-supported on RISC-V, there will be an XSA needed.</pre>
    </blockquote>
    <pre>Why it isn't XSA for other architectures? At least, Arm then should have such
XSA.
I don't understand why x86 won't have the same issue. Memory is the limited
and shared resource, so if one of the domain will use to much memory then it could
happen that other domains won't have enough memory for its purpose...

</pre>
    <blockquote type="cite"
      cite="mid:15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com">
      <pre wrap="" class="moz-quote-pre">
This is the kind of thing you need to consider up front. Or at least mark with
a prominent FIXME annotation. All of which would need resolving before even
considering to mark code as supported.</pre>
    </blockquote>
    <pre>... At the moment, I’m trying to understand if this issue can be solved properly at
all when a domain is allowed to request or map extra memory for its own purposes.

The only solution I see is that each domain—regardless of its type—should have its
own pre-populated pools. This way, during construction, we’ll know whether the
domain can be created or if we’ve run out of memory, which would mean that no
more domains can be launched.
And if in runtime of a domain there is no free pages in a pre-populated pool then
just stop a domain (or return rc to a domain that there is no memory anymore and
let a domain to decide what it should do), otherwise if I will start to allocate
extra memory for domain which doesn't have free pages in a pool, it could lead
to the XSA issue you mentioned that one domain could exhaust memory so another
domain, at least, won't be able to allocate extra pages (in the case this another
domain also doesn't have free pages in a pool).

~ Oleksii

</pre>
  </body>
</html>

--------------kBoHI4PTq4fBKMVLacsG37xa--

