Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD3BCC234
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 10:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141037.1475640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78Vd-0005sd-MK; Fri, 10 Oct 2025 08:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141037.1475640; Fri, 10 Oct 2025 08:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78Vd-0005rA-Jd; Fri, 10 Oct 2025 08:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1141037;
 Fri, 10 Oct 2025 08:29:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LP+B=4T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v78Vc-0005r4-MT
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 08:29:52 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49fb3071-a5b3-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 10:29:50 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62ecd3c21d3so2957578a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 01:29:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f3aasm1736032a12.13.2025.10.10.01.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 01:29:49 -0700 (PDT)
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
X-Inumbo-ID: 49fb3071-a5b3-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760084990; x=1760689790; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHN8sEnwYmpaUMEmwrSUuRk+evBGnH06D8gKFSnXvII=;
        b=ZY023NeUWdCul06ebTsTFKxGkieZYxb6gJwwWzGFw9NMbeXfDRZWknFfmy3b5dBnIz
         NL3EREmtOtb6Zd3dKwjmIBm84YzSy/5AkqKTp2fOuWhrDWNDscLl9Q9uaF8oMQBVQGKc
         NOuK7J7io5kY3EzK2iZvTA6DLd5EJWWkgG1f4gdsaF7LEHvmwFVANaZE/c7YmPHUjZmn
         0DqWsFNo8yFpIfL+wKS+hTVkRYNduo6YpIMx4UCsFggUc+87goK/Vr7o2Mztmsig6BYg
         jfXYyk8YbZLuIwjCse2Ah2otsunzo98SsEKphepEUe4WBVK4v3jubXil0REzWWBG3dlq
         ++SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084990; x=1760689790;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHN8sEnwYmpaUMEmwrSUuRk+evBGnH06D8gKFSnXvII=;
        b=DzysSANQ3hQUgH2ylN/Nagn8aTGmpA6oewtAHNk75d6queINmltEhxqPUqKF5V0FvZ
         lq0dzMyin5r7V6waiLHEi2B5F+P3hKgqgZzHzffDSEZoRvTnwgG3aD/wO1Kc366UmxOg
         VbtcGdZ1wg4vzgHTD/t3dLNB8+Z7oZvwUByt9K2nh8NF0mfDVi1GmVU1Vx+xwB+lRr10
         XzZNhiVnXNZlvSJAD6dJTERMJ/rWwIhN0LQ57q4bXmuDq7kDG7LmSspEjUhtLmb2JAgr
         N5JaSp8ih90/TuaEfh+F0ZirfYNQurgtagPC+ttuMTvhruQ6eLBE89nqUGIu4nU49/Xx
         K2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1HgfsnecX3u7SRxiMIxouZ/cFfBqvUcWHYm5Bdz9I48xEN8oEx7Y4TTnKf1/i9sBwJCqQRTzkGTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDzzFLKI/bDgNAPGqvcFDp2vF+nHe58eZgXEJql5Ctc8O4BbKI
	+7b96L4lDhw0K3peo9gM/0XvvlFm3r5FcKOnL9laJjOiP7ZRuMA2eqI9
X-Gm-Gg: ASbGncugzLXu2SOcoaUyn1kqkowiGmr0Binao63S4vGPmx+ido4uJYjGZOPu8ggvdpN
	zh1kjVpSdhbHgGxpYWN0UgYBUA6ftMeaq/EwyfMHhnXdyMt9m/oIFtX6RGeflBWiTLFmBpDUl/t
	vUqQo8dRcGS9lWomCRMSvlXWMe2xrKkZ8Ls0ekNyomu2NlGl1CkK5+WacvCuzjji1kB/MA5ZaLR
	Norzx8kmbRK2Nq7PvWY78k4Pg2LqMYvp5Uma1bsLx+fE839sZFAZLGVfVKTMLx2YyMYEewYtO33
	bqAYzqsKItCNopEuAmG7AE7vP+AzadaVAFP6q4lbmstMKPf5/twGTZ9TMAOlnPwgrYl6iH9KSqf
	AGCCIJQTXv0CiUdmbQp9RI/m6xtFod6gT2RiK79ac54grRzj00dVXPpjzjo1MTMxRIYrum+iWEx
	k2xs1IR6+GHaWf4ef+VatVog==
X-Google-Smtp-Source: AGHT+IFRflsMCPZsD8IOkwQT5OPySXYVJuq3kyRyLPKV7J+4Rr1fabVvgnsaRSQ9gqM7yxdZY/mlEA==
X-Received: by 2002:a05:6402:518c:b0:62f:67e0:55 with SMTP id 4fb4d7f45d1cf-639d5c371demr9604394a12.24.1760084990158;
        Fri, 10 Oct 2025 01:29:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Cb0orVteTALmg07Z3wPX2tl0"
Message-ID: <45062a62-9076-4620-b316-6c8d093e4fbb@gmail.com>
Date: Fri, 10 Oct 2025 10:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
 <7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com>
 <6902c46e-c805-43aa-8753-7b6dc09716ae@gmail.com>
 <7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com>
 <08f2b98c-928e-44eb-96ee-f8566330aed5@gmail.com>
 <4b873422-a8be-4afe-b973-020690b0ff8e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4b873422-a8be-4afe-b973-020690b0ff8e@suse.com>

This is a multi-part message in MIME format.
--------------Cb0orVteTALmg07Z3wPX2tl0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/9/25 2:06 PM, Jan Beulich wrote:
> On 09.10.2025 11:21, Oleksii Kurochko wrote:
>> On 10/7/25 3:09 PM, Jan Beulich wrote:
>>> On 29.09.2025 15:30, Oleksii Kurochko wrote:
>>>> On 9/22/25 6:28 PM, Jan Beulich wrote:
>>>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>>>> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>>>>>         p2m_write_pte(p, pte, clean_pte);
>>>>>>     }
>>>>>>     
>>>>>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>>>>>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>>>>>     {
>>>>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>>>>> +    e->pte &= ~PTE_ACCESS_MASK;
>>>>>> +
>>>>>> +    e->pte |= PTE_USER;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Two schemes to manage the A and D bits are defined:
>>>>>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>>>>>> +     *     is clear, or is written and the D bit is clear, a page-fault
>>>>>> +     *     exception is raised.
>>>>>> +     *   • When the Svade extension is not implemented, the following scheme
>>>>>> +     *     applies.
>>>>>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>>>>> +     *     updated to set the A bit. When the virtual page is written and the
>>>>>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>>>>> +     *     address translation is in use and is not Bare, the G-stage virtual
>>>>>> +     *     pages may be accessed or written by implicit accesses to VS-level
>>>>>> +     *     memory management data structures, such as page tables.
>>>>>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>>>>>> +     * necesssary to set A and D bits.
>>>>>> +     */
>>>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>>>> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>> All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
>>>>> machine mode software responsible for dealing with this kind of page faults
>>>>> (just like the hypervisor is reponsible for dealing with ones resulting
>>>>> from henvcfg.ADUE being clear)?
>>>> In general, I think you are right.
>>>>
>>>> In this case, though, I just wanted to avoid unnecessary page faults for now.
>>>> My understanding is that having such faults handled by the hypervisor can indeed
>>>> be useful, for example to track which pages are being accessed. However, since we
>>>> currently don’t track page usage, handling these traps would only result in
>>>> setting the A and D bits and then returning control to the guest.
>>> Yet that still be be machine-mode software aiui. By always setting the bits we'd
>>> undermine whatever purpose _they_ have enabled the extension for, wouldn't we?
>> It’s a good point, and from an architectural perspective, it’s possible that
>> machine-mode software might want to handle page faults.
>> However, looking at OpenSBI, it delegates (otherwise all traps/interrupts by
>> default are going to machine-mode) page faults [1] to lower modes, and I expect
>> that other machine-mode software does the same (but of course there is no such
>> guarantee).
>>
>> Therefore, considering that OpenSBI delegates page faults to lower modes and
>> does not set the A and D bits for p2m (guest) PTEs, this will result in a page
>> fault being handled by the hypervisor. As a result, we don’t affect the behavior
>> of machine-mode software at all.
>>
>> If we want to avoid depending on how OpenSBI or other machine-mode software is
>> implemented, we might instead want to have our own page fault handler in Xen,
>> and then set the A and D bits within this handler.
> Won't Xen need its own page fault handler anyway?

Of course, it will.
I just meant that it won’t need it solely for the purpose of setting the A and
D bits.

Considering that Svade is mandatory for RVAxx profiles, and that at some point
we may want to implement certain optimizations (mentioned below), it would make
sense to handle the A/D bits in the page fault handler.
However, for now, for the sake of simplicity and given that none of the
optimizations mentioned below are currently implemented and OpenSBI delegates
page fault handling to hypervisor so OpenSBI isn't planning to deal with A/D
bits, I think we can set the A/D bits during PTE creation with a comment
explaining why it’s done this way, as suggested before.
Later, when additional optimizations that rely on A/D bits are needed, we can
remove this initial setting and add proper A/D handling in the page fault
handler.

>
>> Do you think it would be better to do in this way from the start? If yes, then
>> we also want drop setting of A and D bits for Xen's PTEs [3] to allow M-mode to
>> handle S/HS-mode page faults.
> What I don't really understand is what the intended use of that extension is.

I think this is mainly for software-managed PTE A/D bit updates, which could be
useful for several use cases such as demand paging, cache flushing optimizations,
and memory access tracking.

Also, from a hardware perspective, it’s probably simpler to let software manage
the PTE A/D bits (using the Svade extension) rather than implementing the
Svadu extension for hardware-managed updates.


~ Oleksii

> Surely every entity should be responsible for its own A/D bits, with lower
> layers coming into play only when certain things need e.g. emulating. This
> lack of understanding on my part extends to ...
>
>> Interestingly, OpenSBI doesn’t allow hypervisor mode to decide whether to
>> support Svade or not [2]. By doing so, we can’t set|henvcfg.adue = 1| to disable
>> it as menvcfg.adue=0 has more power, which is not very flexible.
> ... this point, which I was also wondering about before.
--------------Cb0orVteTALmg07Z3wPX2tl0
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
    <div class="moz-cite-prefix">On 10/9/25 2:06 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4b873422-a8be-4afe-b973-020690b0ff8e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.10.2025 11:21, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 10/7/25 3:09 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 29.09.2025 15:30, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 9/22/25 6:28 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">@@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
       p2m_write_pte(p, pte, clean_pte);
   }
   
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
   {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+
+    e-&gt;pte |= PTE_USER;
+
+    /*
+     * Two schemes to manage the A and D bits are defined:
+     *   • The Svade extension: when a virtual page is accessed and the A bit
+     *     is clear, or is written and the D bit is clear, a page-fault
+     *     exception is raised.
+     *   • When the Svade extension is not implemented, the following scheme
+     *     applies.
+     *     When a virtual page is accessed and the A bit is clear, the PTE is
+     *     updated to set the A bit. When the virtual page is written and the
+     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
+     *     address translation is in use and is not Bare, the G-stage virtual
+     *     pages may be accessed or written by implicit accesses to VS-level
+     *     memory management data structures, such as page tables.
+     * Thereby to avoid a page-fault in case of Svade is available, it is
+     * necesssary to set A and D bits.
+     */
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
+        e-&gt;pte |= PTE_ACCESSED | PTE_DIRTY;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
machine mode software responsible for dealing with this kind of page faults
(just like the hypervisor is reponsible for dealing with ones resulting
from henvcfg.ADUE being clear)?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">In general, I think you are right.

In this case, though, I just wanted to avoid unnecessary page faults for now.
My understanding is that having such faults handled by the hypervisor can indeed
be useful, for example to track which pages are being accessed. However, since we
currently don’t track page usage, handling these traps would only result in
setting the A and D bits and then returning control to the guest.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yet that still be be machine-mode software aiui. By always setting the bits we'd
undermine whatever purpose _they_ have enabled the extension for, wouldn't we?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It’s a good point, and from an architectural perspective, it’s possible that
machine-mode software might want to handle page faults.
However, looking at OpenSBI, it delegates (otherwise all traps/interrupts by
default are going to machine-mode) page faults [1] to lower modes, and I expect
that other machine-mode software does the same (but of course there is no such
guarantee).

Therefore, considering that OpenSBI delegates page faults to lower modes and
does not set the A and D bits for p2m (guest) PTEs, this will result in a page
fault being handled by the hypervisor. As a result, we don’t affect the behavior
of machine-mode software at all.

If we want to avoid depending on how OpenSBI or other machine-mode software is
implemented, we might instead want to have our own page fault handler in Xen,
and then set the A and D bits within this handler.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Won't Xen need its own page fault handler anyway?</pre>
    </blockquote>
    <pre>Of course, it will.
I just meant that it won’t need it solely for the purpose of setting the A and
D bits.

Considering that Svade is mandatory for RVAxx profiles, and that at some point
we may want to implement certain optimizations (mentioned below), it would make
sense to handle the A/D bits in the page fault handler.
However, for now, for the sake of simplicity and given that none of the
optimizations mentioned below are currently implemented and OpenSBI delegates
page fault handling to hypervisor so OpenSBI isn't planning to deal with A/D
bits, I think we can set the A/D bits during PTE creation with a comment
explaining why it’s done this way, as suggested before.
Later, when additional optimizations that rely on A/D bits are needed, we can
remove this initial setting and add proper A/D handling in the page fault
handler.</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:4b873422-a8be-4afe-b973-020690b0ff8e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Do you think it would be better to do in this way from the start? If yes, then
we also want drop setting of A and D bits for Xen's PTEs [3] to allow M-mode to
handle S/HS-mode page faults.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What I don't really understand is what the intended use of that extension is.</pre>
    </blockquote>
    <pre>I think this is mainly for software-managed PTE A/D bit updates, which could be
useful for several use cases such as demand paging, cache flushing optimizations,
and memory access tracking.

Also, from a hardware perspective, it’s probably simpler to let software manage
the PTE A/D bits (using the Svade extension) rather than implementing the
Svadu extension for hardware-managed updates.


~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:4b873422-a8be-4afe-b973-020690b0ff8e@suse.com">
      <pre wrap="" class="moz-quote-pre">
Surely every entity should be responsible for its own A/D bits, with lower
layers coming into play only when certain things need e.g. emulating. This
lack of understanding on my part extends to ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Interestingly, OpenSBI doesn’t allow hypervisor mode to decide whether to
support Svade or not [2]. By doing so, we can’t set|henvcfg.adue = 1| to disable
it as menvcfg.adue=0 has more power, which is not very flexible.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this point, which I was also wondering about before.
</pre>
    </blockquote>
  </body>
</html>

--------------Cb0orVteTALmg07Z3wPX2tl0--

