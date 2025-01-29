Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B045A2207C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879214.1289438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdA4r-0007JG-Fy; Wed, 29 Jan 2025 15:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879214.1289438; Wed, 29 Jan 2025 15:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdA4r-0007HU-D4; Wed, 29 Jan 2025 15:34:05 +0000
Received: by outflank-mailman (input) for mailman id 879214;
 Wed, 29 Jan 2025 15:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GOy=UV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tdA4q-0007HB-8k
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 15:34:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77bc2c67-de56-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 16:34:03 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so4085751f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 07:34:03 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d315sm17378568f8f.22.2025.01.29.07.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 07:34:01 -0800 (PST)
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
X-Inumbo-ID: 77bc2c67-de56-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738164842; x=1738769642; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMMXwf5LB+65rQn3YABm35hGxlU9ABoLUYEYjVc4PtY=;
        b=Ra1JXkkfISlJJFGATQ2rzP6tl2ekQsMFnDa3/eWRNVk8abHRSt2917xcZPhdqbLxnS
         Hqa2ig2GXeOdXKphCfWtUpsXSxVLNk7rSegsZYOx5cEGfXOgAPzcDAvKMRE+FGfCClFO
         vbjuQOvNAKB3+NUlgmaJQ0DMA3v6VZUNbMyhfKxpDhxJ6KGws8lfk3XuVknup5UGH/Eq
         4U3dKHOhSUBb1yW0NFX6Poxd9m//n9P2xj9FkbAqVPRRw82+HLQvi18PbDHi+bXxY+wI
         1KcZwpUIBYMgLygkoTkSMZZDYeHmjAo81AolTXNtT1D1viwXePXYCJAX75XbB7eLZLoB
         dmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738164842; x=1738769642;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JMMXwf5LB+65rQn3YABm35hGxlU9ABoLUYEYjVc4PtY=;
        b=ODwoJUtwhnWUByNdNIniUpPDp3oGBI35euZva3VrZ1syp/csmQL0YrhfF+BerBojGm
         39T4FbxiFxQ/R6F7+MPt4cm5iIyKZlWQ/FskhoK3ZAZnNkZ7rT6cxd/KscYBypeY/v5/
         q9nfawEusxpvgfSgSP5bVxhI3ePEH6BWc8tRAgBFMlnUXxSXBsgREVFajUxftRBc9i1z
         9GIMR760lG3NHpWZ53mf4eMSKibzXjGC015sNqE73xyYXwkJDglSChiPI73muQvLUIep
         BYPLYg0NOOXggkuCuX68J7ypA8rT3WmI4TWAyaXA+UxMvU07OG1XLRVn/i3SsdTzO86m
         5OQg==
X-Forwarded-Encrypted: i=1; AJvYcCWnJjIf7Fu+VNFkBupKITvo28mIyeCNZDvjwGOy/RERlVbhrNZB8kGKNE46LZS3BQ7Fv3OkHDUu2iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm+Os+rsHckaQoDIeHx6rPgCouZIsC3f0L+IbeMV/gJxzSNNFH
	FxKRXg1+LidaacmbQjIKLpd7pV+oRML+M/fT9cQ1acvsz9JfURry
X-Gm-Gg: ASbGnctnMB2bBhys56WZ9pyBizhIWkcNM32uHOPm5MdWqcIqoYNbQvu2xZM2bQj2UFV
	qjKFZvWw5/+wxhjypUCp32FwtVxTkUEjAnatLd2a9afFWVhf4mAIlTwUxmrvP989SzJWpAU9kqH
	AtlVSLwXib8XMU0cBhIogb3h2AvdnWMcGeW3tYlfUk05z04klNvO5oqKHSi1FDlaI6kd8dGQpkA
	aU49pTL7ZsDLUdz99UoRL2oXaC3npHMzpx8DiQaIOSf8SdDOJP4w17404p6JiK4Yf76Hc+9j2on
	ds5o1kFRgDsjDCsQ4sVfUKDevhUTM1nSw9JxhEfjA+VQpzw44bgMRH+/MkwcT+Da/yeJkd+nmOP
	LA2s=
X-Google-Smtp-Source: AGHT+IGwoLuvwtPb228WZXqSqrIZiLthpNeSvlJM+QD8fe4VuyXUocnnuWgpXgjB6/5mcKdGi/AgFg==
X-Received: by 2002:adf:e441:0:b0:385:fd07:85f4 with SMTP id ffacd0b85a97d-38c51960e78mr2821983f8f.31.1738164841958;
        Wed, 29 Jan 2025 07:34:01 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------l9FIo2gVAAD0dO9rebsI1lM9"
Message-ID: <b468ef6e-0745-4962-a555-216406257602@gmail.com>
Date: Wed, 29 Jan 2025 16:34:00 +0100
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
 <c602d580-8d62-4fa9-9aa4-37fbd6201fa3@gmail.com>
 <47fb2f0f-fb75-4343-8f7c-cf8b27857d67@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <47fb2f0f-fb75-4343-8f7c-cf8b27857d67@suse.com>

This is a multi-part message in MIME format.
--------------l9FIo2gVAAD0dO9rebsI1lM9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/29/25 3:01 PM, Jan Beulich wrote:
> On 29.01.2025 14:12, Oleksii Kurochko wrote:
>> On 1/28/25 9:14 AM, Jan Beulich wrote:
>>> On 27.01.2025 18:22, Oleksii Kurochko wrote:
>>>> On 1/27/25 1:57 PM, Jan Beulich wrote:
>>>>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>>>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>>>>> so software page table walking in implemented.
>>>>>>>>
>>>>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>>>>> ---
>>>>>>>>      xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>>>>      xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>>>>      2 files changed, 58 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>>>>> index 292aa48fc1..d46018c132 100644
>>>>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>>>>> @@ -15,6 +15,8 @@
>>>>>>>>      
>>>>>>>>      extern vaddr_t directmap_virt_start;
>>>>>>>>      
>>>>>>>> +paddr_t pt_walk(vaddr_t va);
>>>>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>>>>> If not, perhaps say a word on the limitation in the description.
>>>>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>>>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>>>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>>>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>>>>
>>>>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>>>>> Often you care about the permissions as well. Sometimes it may even be relevant
>>>>> to know the (super-)page size of the mapping.
>>>> Perhaps it would be better to change the prototype to:
>>>>      bool pt_walk(vaddr_t va, mfn_t *ret_pa);
>>>> or even
>>>>      void pt_walk(vaddr_t va, mfn_t *ret_pa);
>>>>      In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
>>>> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
>>>>
>>>> What do you think? Would this approach be better?
>>>>
>>>> I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
>>>> page size) as needed in the future. Both solutions seem more or less equivalent.
>>> Imo the most natural thing for a page walking function would be to return the
>>> leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
>>> would provide (almost) all possible information to the caller. "Almost"
>>> because depending on how page walk works, permissions may combine across page
>>> table levels. Yet then (see also the "no-access" above) this would also
>>> require further input, to specify the context for which the translation is
>>> being seeked. For example, the intention to write may want to yield no valid
>>> PTE when there are present ones down to the leaf, but effective permissions
>>> say "read-only".
>> Perhaps returning the leaf PTE could be a really good option.
>>
>> I'm not entirely sure I understand what you mean by "leaf-most not-present". Could you please try to explain this moment one more time?
>> My expectation was that the function should return an existing leaf PTE (from which "access" rights could be determined)
>> or|NULL| to indicate that no leaf PTE was found.
> "no leaf PTE" may be for a variety of reasons. Hence why I think returning
> the PTE at which the walk stopped (leaf or leaf-most not-present) is likely
> best. Such a not-present PTE may, after all, still contain valuable
> information; it's not like it has to be all zero.

Thanks, it is clearer now.

It will complicate a little bit vmap_to_mfn() (as we should to check that pt_walk()
returns a leaf; otherwise something wrong happens), but I think it is not really
critical as you mentioned before, and for convenience it would be better to implement
it as a static inline function:

   static inline mfn_t vmap_to_mfn(vaddr_t va)
   {
       pte_t *entry = pt_walk(va, NULL);

       BUG_ON(!pte_is_mapping(*entry));

       return mfn_from_pte(*entry);
   }

>> Another thing I'm curious about is whether this would be sufficient for determining the level.
>> It seems clear that, given a PTE and a virtual address, we could compute:
>> |mask = VA | paddr_from_pte(pte)|
> What would this value represent? No, from holding a PTE in your hands you
> can't determine the level it came from. So yes, ...
>
>> Then, iterating through each level, we could apply and understand on which one level it was mapped:
>> |mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)|.
>>
>> If I haven't overlooked any other way to calculate the page table level, would it be better to simply add another argument
>> to|pt_walk()| to return the level.
> ... for callers who care doing this might then be necessary (this would be
> a pointer parameter, and since I expect many callers wouldn't care about
> the level, it likely wants to be permissible to pass in NULL).
>
> Question then is whether it's better to hand back the level or the page
> order of the mapping. On x86 we return the latter from P2M lookups, for
> example.

Actually, I think for proper calculation of order in pt_update().

Thanks.

~ Oleksii


--------------l9FIo2gVAAD0dO9rebsI1lM9
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
    <div class="moz-cite-prefix">On 1/29/25 3:01 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:47fb2f0f-fb75-4343-8f7c-cf8b27857d67@suse.com">
      <pre wrap="" class="moz-quote-pre">On 29.01.2025 14:12, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 1/28/25 9:14 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
            <pre wrap="" class="moz-quote-pre">Perhaps it would be better to change the prototype to:
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
          <pre wrap="" class="moz-quote-pre">Imo the most natural thing for a page walking function would be to return the
leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
would provide (almost) all possible information to the caller. "Almost"
because depending on how page walk works, permissions may combine across page
table levels. Yet then (see also the "no-access" above) this would also
require further input, to specify the context for which the translation is
being seeked. For example, the intention to write may want to yield no valid
PTE when there are present ones down to the leaf, but effective permissions
say "read-only".
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Perhaps returning the leaf PTE could be a really good option.

I'm not entirely sure I understand what you mean by "leaf-most not-present". Could you please try to explain this moment one more time?
My expectation was that the function should return an existing leaf PTE (from which "access" rights could be determined)
or|NULL| to indicate that no leaf PTE was found.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"no leaf PTE" may be for a variety of reasons. Hence why I think returning
the PTE at which the walk stopped (leaf or leaf-most not-present) is likely
best. Such a not-present PTE may, after all, still contain valuable
information; it's not like it has to be all zero.</pre>
    </blockquote>
    <pre>Thanks, it is clearer now.

It will complicate a little bit vmap_to_mfn() (as we should to check that pt_walk()
returns a leaf; otherwise something wrong happens), but I think it is not really
critical as you mentioned before, and for convenience it would be better to implement
it as a static inline function:

  static inline mfn_t vmap_to_mfn(vaddr_t va)
  {
      pte_t *entry = pt_walk(va, NULL);

      BUG_ON(!pte_is_mapping(*entry));

      return mfn_from_pte(*entry);
  }
</pre>
    <blockquote type="cite"
      cite="mid:47fb2f0f-fb75-4343-8f7c-cf8b27857d67@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Another thing I'm curious about is whether this would be sufficient for determining the level.
It seems clear that, given a PTE and a virtual address, we could compute:
|mask = VA | paddr_from_pte(pte)|
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What would this value represent? No, from holding a PTE in your hands you
can't determine the level it came from. So yes, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Then, iterating through each level, we could apply and understand on which one level it was mapped:
|mask &amp; (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)|.

If I haven't overlooked any other way to calculate the page table level, would it be better to simply add another argument
to|pt_walk()| to return the level.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... for callers who care doing this might then be necessary (this would be
a pointer parameter, and since I expect many callers wouldn't care about
the level, it likely wants to be permissible to pass in NULL).

Question then is whether it's better to hand back the level or the page
order of the mapping. On x86 we return the latter from P2M lookups, for
example.</pre>
    </blockquote>
    <pre>Actually, I think for proper calculation of order in pt_update().

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------l9FIo2gVAAD0dO9rebsI1lM9--

