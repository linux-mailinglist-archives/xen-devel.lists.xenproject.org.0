Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9E9F75DC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 08:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860808.1272786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOB8L-0004Fo-FV; Thu, 19 Dec 2024 07:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860808.1272786; Thu, 19 Dec 2024 07:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOB8L-0004Cy-CN; Thu, 19 Dec 2024 07:39:45 +0000
Received: by outflank-mailman (input) for mailman id 860808;
 Thu, 19 Dec 2024 07:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOB8K-0004Cs-1H
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 07:39:44 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 690cbcf2-bddc-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 08:39:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so2833125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 23:39:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364b14f241sm65262655e9.1.2024.12.18.23.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 23:39:41 -0800 (PST)
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
X-Inumbo-ID: 690cbcf2-bddc-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734593982; x=1735198782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NL/Dn4eeXHpUC+uka+GCUZoSmWhpqIRRTK/SA78XebA=;
        b=ggOgBC2/3bvO7Qx4tKW5dV6gu3fyX5gPvOBQ6IedzD1J1oFybfD9nmorkQrHYg2InM
         5QaocrhyIiBXxq+4x5+pVk+J6t26brqH7AC7m4H5e6GvZHNIzu81HIYpXLp7ALBNcsGj
         5WHjOSN11bcrHQ3Zz4qvHcuA5WOtoWd0dEwUmSE+xsikAL8M8SefGAAd5s+AOWjIahWW
         EWiuM4L/rohTtgrfPhKgKP3jhTm27jIP7ssKpunxD9jx6FlQ0rDkJrLMcvgVqgxbTyOI
         JErTA90N4kbYbBaGYS9BBLZNg0BXkg+006a3p6ylZrwr0iehlnPxzT8k1a4V+ydtIAVf
         w+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734593982; x=1735198782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL/Dn4eeXHpUC+uka+GCUZoSmWhpqIRRTK/SA78XebA=;
        b=GXDwfEplm4NS/Dv2BTl5e9CsVvzM7ol1yhZbkydOXZPz4wBFLMmnTjgdsqadX0xSmX
         H4ZuEXtTIPM4pwzyzLkwQ6F4rhCKq6xkfY1dAIBT7u3rXuBs9lue1pdp315rtAN5cGNj
         pZqdPnDhVTpGUIgnzuunvjhFAM083ctJci7eGFqv8n2wFf83FFKnsj2fEixUdYOizFqY
         y385GnNtuV2Hi3bSid/iQcB3SjTB3DWOnhW+EhLVvpUO91R56LYy43UTOfX7oKcGtKRg
         ydKDqYHCF4gbc2S5vHXggFxusftkziYEJK0sYXrEhZWUL3HiPLJTPJXmZ/r4iqulf2JI
         IXcA==
X-Forwarded-Encrypted: i=1; AJvYcCXueX/eJVLMuq4yZNfeEIPIxkOt2Jp1HPyyQbJRz2VCFmfOr++bZOpc6/FilpyyGvDywd5eMLBtJpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymiHxhPUcMG+7Ihd0uC/OFSKhHrqQO/ujGGxRfqXlFZIxG6ULO
	Qbf5k4ROak8tAA7k5BbkEKFf6BC/LiP1+GnjVgWF6VfPYKsTglBrhbGjdqJVYA==
X-Gm-Gg: ASbGncv0vbghIAOIvRBAiojoqvSnTXE1Kkz0umGWW61IlanfiW9V4llvqUx/hM+8gRX
	4qj60xSv/6ZFAdEk/HCkyBE+QamNehSyk/6cq9xOkBvfh8+LGkrMI+0xZ/QtM6dwuSPC+budf0D
	JNsAi7KyV0DdfcHSk+/jvIZK5eArqr6Y/r8d8z36sxll99abArxNiDkp4qe88GbTUoCV/WbZt4K
	Q08/oD881ixTiPF3qZkw5XoGcI7BMy7b+38GS0Za5GzTg4H1RCXdQMAIaC8po5FFRRF4SkQzsWi
	lvINOeheEeKXaDID2KlxStHTUEfIplaY9UvqX3B6EQ==
X-Google-Smtp-Source: AGHT+IFaeye4akgm2Hh7STO9FWOYku9hI1tCYk0/UdlNWml1bCNoFs5TmLb8ChU1IoeqZ0MdbjzH7A==
X-Received: by 2002:a05:600c:3b88:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4365c77e436mr18878925e9.3.1734593981959;
        Wed, 18 Dec 2024 23:39:41 -0800 (PST)
Message-ID: <f3119165-2518-4192-a2c4-c53d0fd5864b@suse.com>
Date: Thu, 19 Dec 2024 08:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
 <9056a92d-8e91-4f2d-a8f3-5cde378f6c6f@suse.com>
 <7aea0e1d-f60c-4e82-8b63-c4e18cbcce85@suse.com>
 <a49b3be1-4bf4-434b-8260-1d37685d9054@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a49b3be1-4bf4-434b-8260-1d37685d9054@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2024 01:20, Andrew Cooper wrote:
> On 12/12/2024 4:52 pm, Jan Beulich wrote:
>> On 12.12.2024 15:30, Jan Beulich wrote:
>>> On 12.12.2024 02:17, Andrew Cooper wrote:
>>>> (With the knowledge that this is a disputed Kconfig pattern, and will
>>>> need rebasing), the way I want this to work is simply:
>>>>
>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>> index 0de0101fd0bf..5d0a88fb3c3f 100644
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -434,6 +434,9 @@ endif
>>>>  
>>>>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>>>  CFLAGS += -fstack-protector
>>>> +ifeq ($(CONFIG_X86),y)
>>>> +CFLAGS += -mstack-protector-guard=global
>>>> +endif
>>>>  else
>>>>  CFLAGS += -fno-stack-protector
>>>>  endif
>>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>>>> index 9cdd04721afa..7951ca908b36 100644
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -28,6 +28,7 @@ config X86
>>>>         select HAS_PCI_MSI
>>>>         select HAS_PIRQ
>>>>         select HAS_SCHED_GRANULARITY
>>>> +       select HAS_STACK_PROTECTOR if
>>>> $(cc-option,-mstack-protector-guard=global)
>>>>         select HAS_UBSAN
>>>>         select HAS_VMAP
>>>>         select HAS_VPCI if HVM
>>>>
>>>>
>>>>
>>>> Sadly, it doesn't build.  I get a handful of:
>>>>
>>>> prelink.o: in function `cmdline_parse':
>>>> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
>>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>>> --no-relax
>>>> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
>>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>>> --no-relax
>>>>
>>>> which is more toolchain-whispering than I feel like doing tonight.
>>> Imo the root of the problem is that the compiler doesn't itself mark
>>> __stack_chk_guard hidden (it does so for __stack_chk_fail, albeit only for
>>> 32-bit code), and hence finds it necessary to use @gotpcrel to access the
>>> variable. Even if the linker managed to relax all of these, it would then
>>> still be less efficient compared to direct RIP-relative accesses.
>>>
>>> I also can't see how we might be able to override the compiler's internal
>>> declaration to mark it hidden (the same appears to be true for other items
>>> the declares internally, like the retpoline thunks or even strcmp() et al).
>>> Passing -fvisibility=hidden doesn't make a difference (just as another
>>> data point).
>>>
>>> Playing with -fstack-protector* flavors, I observe:
>>> - -fstack-protector causing several failures, like you observed, oddly
>>>   enough exclusively from __init functions,
>>> - -fstack-protector-all and -fstack-protector-strong each causing a single
>>>   (but respectively different) failure, for apparently random non-__init
>>>   functions.
>>> Taking this together it very much smells like a linker issue. I'll see
>>> about checking there further.
>> The oddity with how many diags show up is down to internals of the linker.
>> It processes a single input section in full (continuing over this specific
>> type of error), but will stop processing afterwards if any such error was
>> encountered.
>>
>> The issue itself is a wrong assumption in the linker: It believes that it
>> would only ever build small-model code when encountering this kind of
>> relocation, and when not linking a shared library or PIE. With this
>> assumption it converts the relocation resulting from @gotpcrel to
>> R_X86_64_32S (converting the MOV from GOT to MOV $imm), which of course
>> overflows when later trying to actually resolve it. What I'm yet to
>> understand is why it doesn't use R_X86_64_PC32 (also) in such a situation
>> (it does e.g. when building a shared library).
>>
>> While so far I didn't try it, using --no-relax is presumably not an option,
>> as I expect that it'll leave us with a non-empty .got. Plus I didn't even
>> start looking into how the xen.efi linking would deal with the ELF-specific
>> gotpcrel relocs; the concept of GOT doesn't exist in PE/COFF, after all.
>>
>> While the linker certainly wants fixing, I continue to think that getting
>> the compiler side right would yield the better overall result.
> 
> Ok, so what precisely needs doing here?
> 
> For starters, I guess __stack_chk_guard wants to respect
> -fvisibilty=hidden and/or #pragma.  I can see why it wouldn't want to in
> regular userspace, but we're not that.

Yes, this is one of the things that may want reporting as a deficiency. Imo
it wants generalizing though, as it's not __stack_chk_guard alone which is
affected.

I'm not, btw, convinced the #pragma ought to have any effect. One might
consider it legitimate to have an effect if there's a subsequent re-
declaration. Yet one might also consider such an (incompatible) re-
declaration be an error.

> There's clearly also an LD error (bad assumptions about model).

I'm still in the process of collecting data for an eventual email or bug
report to be put together. For the purposes here I meanwhile think it is
largely irrelevant. That's because, as said, even if the linker was fixed
in this regard, there would still be the fact that we'd end up with a non-
empty .got (I did hack the linker enough to verify this). Whereas once the
compiler side was sorted, the linker issue wouldn't come into play anymore.

Jan

