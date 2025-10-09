Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E56BC8479
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 11:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140423.1475315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6mqK-0007kS-TQ; Thu, 09 Oct 2025 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140423.1475315; Thu, 09 Oct 2025 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6mqK-0007hS-QA; Thu, 09 Oct 2025 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1140423;
 Thu, 09 Oct 2025 09:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDLD=4S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6mqJ-0007hM-Nw
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 09:21:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b0ae581-a4f1-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 11:21:37 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-636de696e18so1450450a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 02:21:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f6csm1896851266b.31.2025.10.09.02.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:21:35 -0700 (PDT)
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
X-Inumbo-ID: 5b0ae581-a4f1-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760001696; x=1760606496; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff4dO5G2nnGSM4lPvVgeqpIYqHJNKvnaYz1OSG26nII=;
        b=UBWLmyLQUv6yyu27faRfUZaM1WU3F34DmA8RaD1aeukSiwJV3OH+3LP79ykk/wOWOL
         JsciH/Pt5AceErulN6BW9f4nMkXg0zCXgTwD17ls6p7aYUG74sSKfYh9AVsTF2wun9V2
         ZSFVnecCG7kUf8nZnNS6ChgHO1FmGbHSmFo4kjqmbD5PiV4qlJIxgSjHQyNlIyfjo2D2
         rNtH3GYAAwv8riS3ojSM+ej9YXK63wK9NQxYa8ftlttD3MBtcFfkPRKie09LtyEBOlK7
         Rvipi++9Xod1Ub0u2sLXE8EIo7Fzr0F8/sELX1eo9LMkgUmWuyNpn0kAjz1hCuUvuZ1G
         nt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001696; x=1760606496;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ff4dO5G2nnGSM4lPvVgeqpIYqHJNKvnaYz1OSG26nII=;
        b=BBnhvrqVG2ZxoAV48RoT+xhABdaiphZf02iq/ZOKGet5I4smbGrnuzBY47BJmKgI8a
         OHTFndxODEOboMt7AZiwRtVAm1n7YTUIhqmjLszDjMf3AqbmHNj86ch6BbxP8FUfvPyS
         7O/Xb2jppQiUi0f7M2ZgOhWo5MpT42pxu3e+iUgeAjyzI5GgfQf2Hg8SksUk3vEF8ZhA
         AbC0avK0GJFNsv8P0Xrn975bxi5zEOqXZRq0Kzpd3M+dfZGZd6fqArt6EqIsdeZlHI3T
         DvBmP70HmjTANSmAPLVO4xZIpnI8TDeRxJhTXrFs2tauJ6O0Ip2L7OrtXx7xsvkVcpNk
         2Dhg==
X-Forwarded-Encrypted: i=1; AJvYcCXVT6FqW964mdwfITixz7PC2kD23D1q8d9/Z2WB0+9KoWe653ozJoRM3QjwLASDmTkSQsbNbbU6v9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIJJKMFV5IKgUCyv2BXhiU/s5O+5vE9/IqSFm4CrotPf+sOBPf
	EPk98g/h2SDS6Eo60+ZH9NlwWAscO341PB3GK51Un52Zv/7PcJY5Ra4q
X-Gm-Gg: ASbGncsVzdM3ZrvMILzwhvtZs03SpdfOMYZZtwWgD6OwxMcy3FtsTCQpUQo/qjFltUQ
	fZlMoO5Cgqgr2tKVt3bbrJmTFomkjufcc5G3lxpPtxPDbqZ0v6dTGABQxjUnoPjkUhu/CVFtES9
	1NScZc4m3LOBbfrNwOWHpzSrYCwWc83lqIk2L2LxSdr2tYW9tv4S4Kj6ZXB/eDKCjZkwEPr2K5w
	Q+OHhR3n3+I93fDHQRNgUmsaQlBuQ1AY/UQLXwTKo/6xiBzlHrtmrcTDaQX16BiDs1jpMhk6/qD
	KWYt/i0H/ktQWtjsopN1Wlyk9Vrd+BrkDxjRWO43/l6rAkNYDEq3XfqwzJz57dEklc15S/6Qgu9
	rDi735EHszsQMYNg9eZQGspNQv3oVwjgH29GZR8MQLH17eD3nKVtAhErqeBuHIpSBFWb6PS1xMv
	Xy0/dSsrtEX3G9gkCjI7Uvh12jMFk=
X-Google-Smtp-Source: AGHT+IHA86AaObrRcz0ydT3b4uAB9zl9B3JJJICm+SF/RNxFbEVuE9NEpD1C8pEJwa3tdcKEiImKsQ==
X-Received: by 2002:a17:907:3daa:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b50a9c5b3c8mr816696766b.3.1760001696163;
        Thu, 09 Oct 2025 02:21:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------moUjmcIwiTyaV3D0Z4WEk0Dw"
Message-ID: <08f2b98c-928e-44eb-96ee-f8566330aed5@gmail.com>
Date: Thu, 9 Oct 2025 11:21:34 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com>

This is a multi-part message in MIME format.
--------------moUjmcIwiTyaV3D0Z4WEk0Dw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/7/25 3:09 PM, Jan Beulich wrote:
> On 29.09.2025 15:30, Oleksii Kurochko wrote:
>> On 9/22/25 6:28 PM, Jan Beulich wrote:
>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>>>        p2m_write_pte(p, pte, clean_pte);
>>>>    }
>>>>    
>>>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>>>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>>>    {
>>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>>> +    e->pte &= ~PTE_ACCESS_MASK;
>>>> +
>>>> +    e->pte |= PTE_USER;
>>>> +
>>>> +    /*
>>>> +     * Two schemes to manage the A and D bits are defined:
>>>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>>>> +     *     is clear, or is written and the D bit is clear, a page-fault
>>>> +     *     exception is raised.
>>>> +     *   • When the Svade extension is not implemented, the following scheme
>>>> +     *     applies.
>>>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>>> +     *     updated to set the A bit. When the virtual page is written and the
>>>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>>> +     *     address translation is in use and is not Bare, the G-stage virtual
>>>> +     *     pages may be accessed or written by implicit accesses to VS-level
>>>> +     *     memory management data structures, such as page tables.
>>>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>>>> +     * necesssary to set A and D bits.
>>>> +     */
>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>> All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
>>> machine mode software responsible for dealing with this kind of page faults
>>> (just like the hypervisor is reponsible for dealing with ones resulting
>>> from henvcfg.ADUE being clear)?
>> In general, I think you are right.
>>
>> In this case, though, I just wanted to avoid unnecessary page faults for now.
>> My understanding is that having such faults handled by the hypervisor can indeed
>> be useful, for example to track which pages are being accessed. However, since we
>> currently don’t track page usage, handling these traps would only result in
>> setting the A and D bits and then returning control to the guest.
> Yet that still be be machine-mode software aiui. By always setting the bits we'd
> undermine whatever purpose _they_ have enabled the extension for, wouldn't we?

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
Do you think it would be better to do in this way from the start? If yes, then
we also want drop setting of A and D bits for Xen's PTEs [3] to allow M-mode to
handle S/HS-mode page faults.

Interestingly, OpenSBI doesn’t allow hypervisor mode to decide whether to
support Svade or not [2]. By doing so, we can’t set|henvcfg.adue = 1| to disable
it as menvcfg.adue=0 has more power, which is not very flexible.

[1]https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L209
[2]https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L168
[3]https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L343

>> To avoid this overhead, I chose to set the bits up front.
> Irrespective to the answer to the question above, if you mean to do so, I think
> all of this needs explaining better in the comment.

Sure, I will add the comment if the current one approach of setting A and D bits
will be chosen.

~ Oleksii

--------------moUjmcIwiTyaV3D0Z4WEk0Dw
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
    <div class="moz-cite-prefix">On 10/7/25 3:09 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com">
      <pre wrap="" class="moz-quote-pre">On 29.09.2025 15:30, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 9/22/25 6:28 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
In general, I think you are right.

In this case, though, I just wanted to avoid unnecessary page faults for now.
My understanding is that having such faults handled by the hypervisor can indeed
be useful, for example to track which pages are being accessed. However, since we
currently don’t track page usage, handling these traps would only result in
setting the A and D bits and then returning control to the guest.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet that still be be machine-mode software aiui. By always setting the bits we'd
undermine whatever purpose _they_ have enabled the extension for, wouldn't we?</pre>
    </blockquote>
    <pre data-start="177" data-end="444">It’s a good point, and from an architectural perspective, it’s possible that
machine-mode software might want to handle page faults.
However, looking at OpenSBI, it delegates (otherwise all traps/interrupts by
default are going to machine-mode) page faults [1] to lower modes, and I expect
that other machine-mode software does the same (but of course there is no such
guarantee).</pre>
    <pre data-start="446" data-end="717">Therefore, considering that OpenSBI delegates page faults to lower modes and
does not set the A and D bits for p2m (guest) PTEs, this will result in a page
fault being handled by the hypervisor. As a result, we don’t affect the behavior
of machine-mode software at all.</pre>
    <pre data-start="719" data-end="928">If we want to avoid depending on how OpenSBI or other machine-mode software is
implemented, we might instead want to have our own page fault handler in Xen,
and then set the A and D bits within this handler.
Do you think it would be better to do in this way from the start? If yes, then
we also want drop setting of A and D bits for Xen's PTEs [3] to allow M-mode to
handle S/HS-mode page faults.</pre>
    <pre data-start="930" data-end="1119">Interestingly, OpenSBI doesn’t allow hypervisor mode to decide whether to
support Svade or not [2]. By doing so, we can’t set <code
    data-start="1056" data-end="1074">henvcfg.adue = 1</code> to disable
it as menvcfg.adue=0 has more power, which is not very flexible.

[1] <a class="moz-txt-link-freetext" href="https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L209">https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L209</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L168">https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L168</a>
[3] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L343">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L343</a>

</pre>
    <blockquote type="cite"
      cite="mid:7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">To avoid this overhead, I chose to set the bits up front.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Irrespective to the answer to the question above, if you mean to do so, I think
all of this needs explaining better in the comment.</pre>
    </blockquote>
    <pre>Sure, I will add the comment if the current one approach of setting A and D bits
will be chosen.

~ Oleksii</pre>
  </body>
</html>

--------------moUjmcIwiTyaV3D0Z4WEk0Dw--

