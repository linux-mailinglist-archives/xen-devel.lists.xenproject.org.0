Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5283BA21D97
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 14:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879140.1289360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td7rV-0002ru-2Z; Wed, 29 Jan 2025 13:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879140.1289360; Wed, 29 Jan 2025 13:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td7rU-0002ou-VD; Wed, 29 Jan 2025 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 879140;
 Wed, 29 Jan 2025 13:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GOy=UV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1td7rT-0002oo-8w
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 13:12:07 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a29e5dfa-de42-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 14:12:05 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3711868f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 05:12:05 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188c28sm17400228f8f.54.2025.01.29.05.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 05:12:03 -0800 (PST)
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
X-Inumbo-ID: a29e5dfa-de42-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738156324; x=1738761124; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trLx6JwfJllUuS8P0EqTYKZd77YfKPSeHak/5lAU2Ws=;
        b=YpIVd/vdHOUznzj8npzXSB1lNTVGjkNrQdTki/voRT+MySAyOM9ly7Hy52rXYTsOeE
         AtxzBxtJkkywJChl0yEpkWnA7kEgNpl7YFkmulFruOmT+kGhX4DaixezVcxu0guTI8bt
         +wBHkExEKyFc1/ujVSzPKc04DDxThPA+JIou6ZBkT+fqFGyn1oXomwSGHjPB2s4bUoep
         DutTep4waHbbnlMoLXRVrOyjlEn8rV4wAnH1y+DIH5KZ18rFpGn6SXCj1V/4w4c7VSRZ
         qJ9WcQD/E2WGXwdHp7MXW56x/sOYvH2+y49ITtSJscmctkqKD5/PYeJsslutvNo2g2Zx
         AVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156324; x=1738761124;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=trLx6JwfJllUuS8P0EqTYKZd77YfKPSeHak/5lAU2Ws=;
        b=oE1Rs2xyJBrZTs8Lc6IttWYOwCR+oNTLPk2r5U8kT9DYQJW51bQDxR5NIRtmS4R6VK
         4veMzBrEMg3w6BzaHWsQrRWxmbK7YNu3E5TDmNUqtz3Z8oLCwpno9O+rnUN1l8PtwJxn
         z968pUfd1d/g9Yw4fAfHxf6uCqZPz1mqg3SnF3Tsf7joeqPsbfemPjSumNfvwCtVHHPA
         WN1vlXCFeJkqR6HxVC3usbaUxmKola1ReNMkyIfYiEA1Z2tl4YvNvq0O53e+wFee9x/P
         pxUZV0qw37l0Kk74WL0phaamRnXFHkhUVzh0UL3gZKemSe0UUo1hpgvW/o7x4q3+MaM5
         GYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01MXm3kIEp9obl1Qil7O9HZd8PUSkFB412rSJLhuc6s2lzrfkHIKRBCUWWSHcvk8A93BDI39CKP8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfco/5qFp/+OoH+OxbcycGm1x/kP35IjuGlmd+wMRfeqsCI9Es
	fihYDRVuq6l4byrSr62/TqD1bLR8cmCL2ZQNyXGeqCNEYHiYrclU
X-Gm-Gg: ASbGnctVP8SfyEvVS2XCKRjDGWl34JSj53FhBfwwgCSbBMr631A6Anoz/vxkoJKFLSw
	q5LqqdQjT86zdeuVXA7UgsPw5XPOROdiohjv7rtAvzEhRHTnuI/HuVXcrCoo5jH93q5GyZJ0ND4
	LLRUFt9h6c7z7hxlL7PqJgTJVNhXd5Hig5iO9TzuGeBjkCNFtsrArBEWlHTUtCRisfvRj6cxPA2
	CRUcWWu5gWd0unkQhpCRAPnSG0om1GtnxNbYvEJZRGDUIcc77OaYb1W14//UQHbW7Ng3VU2ryn+
	fplLcGqVYxUuQTDElaHlqoAXLWF0xOx3v8PMPtic/sF0KUjHyk+cEF06/UJwscwkRTCg55UFdSs
	QHwg=
X-Google-Smtp-Source: AGHT+IEHubvAsDZ74swSz5SL8CjeMUqbYGgB1C02KK746+NkISr7fYrOoudFEMRA7WqPTzVvzldgBw==
X-Received: by 2002:a5d:5906:0:b0:388:caf4:e909 with SMTP id ffacd0b85a97d-38c51b5d858mr2472232f8f.25.1738156324167;
        Wed, 29 Jan 2025 05:12:04 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ypomjzEAl5vSfD0OKh9jNtFl"
Message-ID: <c602d580-8d62-4fa9-9aa4-37fbd6201fa3@gmail.com>
Date: Wed, 29 Jan 2025 14:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
 <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
 <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
 <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
 <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
 <dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com>

This is a multi-part message in MIME format.
--------------ypomjzEAl5vSfD0OKh9jNtFl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/28/25 9:14 AM, Jan Beulich wrote:
> On 27.01.2025 18:22, Oleksii Kurochko wrote:
>> On 1/27/25 1:57 PM, Jan Beulich wrote:
>>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>>> so software page table walking in implemented.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>>> ---
>>>>>>     xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>>     xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>>     2 files changed, 58 insertions(+)
>>>>>>
>>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>>> index 292aa48fc1..d46018c132 100644
>>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>>> @@ -15,6 +15,8 @@
>>>>>>     
>>>>>>     extern vaddr_t directmap_virt_start;
>>>>>>     
>>>>>> +paddr_t pt_walk(vaddr_t va);
>>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>>> If not, perhaps say a word on the limitation in the description.
>>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>>
>>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>>> Often you care about the permissions as well. Sometimes it may even be relevant
>>> to know the (super-)page size of the mapping.
>> Perhaps it would be better to change the prototype to:
>>     bool pt_walk(vaddr_t va, mfn_t *ret_pa);
>> or even
>>     void pt_walk(vaddr_t va, mfn_t *ret_pa);
>>     In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
>> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
>>
>> What do you think? Would this approach be better?
>>
>> I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
>> page size) as needed in the future. Both solutions seem more or less equivalent.
> Imo the most natural thing for a page walking function would be to return the
> leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
> would provide (almost) all possible information to the caller. "Almost"
> because depending on how page walk works, permissions may combine across page
> table levels. Yet then (see also the "no-access" above) this would also
> require further input, to specify the context for which the translation is
> being seeked. For example, the intention to write may want to yield no valid
> PTE when there are present ones down to the leaf, but effective permissions
> say "read-only".

Perhaps returning the leaf PTE could be a really good option.

I'm not entirely sure I understand what you mean by "leaf-most not-present". Could you please try to explain this moment one more time?
My expectation was that the function should return an existing leaf PTE (from which "access" rights could be determined)
or|NULL| to indicate that no leaf PTE was found.

Another thing I'm curious about is whether this would be sufficient for determining the level.
It seems clear that, given a PTE and a virtual address, we could compute:
|mask = VA | paddr_from_pte(pte)|
Then, iterating through each level, we could apply and understand on which one level it was mapped:
|mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)|.

If I haven't overlooked any other way to calculate the page table level, would it be better to simply add another argument
to|pt_walk()| to return the level.

Thanks.


~ Oleksii

>
> Jan
--------------ypomjzEAl5vSfD0OKh9jNtFl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/28/25 9:14 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.01.2025 18:22, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 1/27/25 1:57 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 27.01.2025 13:29, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 1/27/25 11:06 AM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 20.01.2025 17:54, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking in implemented.

Signed-off-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
   xen/arch/riscv/include/asm/mm.h |  2 ++
   xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
   2 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 292aa48fc1..d46018c132 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,6 +15,8 @@
   
   extern vaddr_t directmap_virt_start;
   
+paddr_t pt_walk(vaddr_t va);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">In the longer run, is returning just the PA really going to be sufficient?
If not, perhaps say a word on the limitation in the description.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
Anyway, yes, it is still returning a physical address, and that seems enough to me.

Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Often you care about the permissions as well. Sometimes it may even be relevant
to know the (super-)page size of the mapping.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Perhaps it would be better to change the prototype to:
   bool pt_walk(vaddr_t va, mfn_t *ret_pa);
or even
   void pt_walk(vaddr_t va, mfn_t *ret_pa);
   In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
If there's a need to return permissions or (super-)page size in the future, another argument could be added.

What do you think? Would this approach be better?

I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
page size) as needed in the future. Both solutions seem more or less equivalent.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo the most natural thing for a page walking function would be to return the
leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
would provide (almost) all possible information to the caller. "Almost"
because depending on how page walk works, permissions may combine across page
table levels. Yet then (see also the "no-access" above) this would also
require further input, to specify the context for which the translation is
being seeked. For example, the intention to write may want to yield no valid
PTE when there are present ones down to the leaf, but effective permissions
say "read-only".</pre>
    </blockquote>
    <div class="flex max-w-full flex-col flex-grow">
      <div data-message-author-role="assistant"
        data-message-id="1bca5013-9c80-49e2-b761-5a57d8de95d0"
        dir="auto"
class="min-h-8 text-message flex w-full flex-col items-end gap-2 whitespace-normal break-words text-start [.text-message+&amp;]:mt-5"
        data-message-model-slug="gpt-4o">
        <div
          class="flex w-full flex-col gap-1 empty:hidden first:pt-[3px]">
          <div
class="markdown prose w-full break-words dark:prose-invert light">
            <pre>Perhaps returning the leaf PTE could be a really good option.</pre>
            <pre>I'm not entirely sure I understand what you mean by "leaf-most not-present". Could you please try to explain this moment one more time?
My expectation was that the function should return an existing leaf PTE (from which "access" rights could be determined)
or <code>NULL</code> to indicate that no leaf PTE was found.</pre>
            <pre>Another thing I'm curious about is whether this would be sufficient for determining the level.
It seems clear that, given a PTE and a virtual address, we could compute:
<code>  mask = VA | paddr_from_pte(pte)</code>
Then, iterating through each level, we could apply and understand on which one level it was mapped:
<code>  mask &amp; (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)</code>.</pre>
            <pre>If I haven't overlooked any other way to calculate the page table level, would it be better to simply add another argument
to <code>pt_walk()</code> to return the level.</pre>
          </div>
        </div>
      </div>
    </div>
    <pre>
Thanks.


~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com">
      <pre wrap="" class="moz-quote-pre">

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------ypomjzEAl5vSfD0OKh9jNtFl--

