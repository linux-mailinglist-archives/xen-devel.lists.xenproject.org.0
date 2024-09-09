Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508E9713A0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794076.1202765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaix-0006Nw-Pf; Mon, 09 Sep 2024 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794076.1202765; Mon, 09 Sep 2024 09:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaix-0006LT-La; Mon, 09 Sep 2024 09:30:19 +0000
Received: by outflank-mailman (input) for mailman id 794076;
 Mon, 09 Sep 2024 09:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snaiv-0004y7-M4
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:30:17 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f29945a-6e8e-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:30:16 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so272921266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:30:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72861sm313662966b.105.2024.09.09.02.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 02:30:14 -0700 (PDT)
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
X-Inumbo-ID: 1f29945a-6e8e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725874215; x=1726479015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AJHFSTpQ0vTZWzeYc8se6HF+FeXCZTqFo5T7kTZmgNo=;
        b=LWkFj/YbK9JkgfVdYWJbGErA2Y7jaKLZVQFvFeAJrX01dIFkg3lE4O3i4lpq1jKZMY
         86HPB7nsp+9F7AVmAo9TF6NrPZvTI+UD629lTsynRUt/QArzlV9lGJVQznY9GEr3wTnh
         AnmvfkoJZMUieKDAd+g9Z5bfKf5/AVGek5kfVAHh7AlJYrnBiAQ9wLp+och/VHUnzWeT
         ksgmC2NY87shUSEjiArefDauxRD1xrsb6DWjJf9fWq46KfEyrH9zKUre5DyFjqpY4yGK
         CihWkn34LIn7wUyvz/M7SdgLDJd1xzZsw6N5RjIM5C+GbDp4J0u+AQWfndZ5Y1dtb1Y+
         4VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874215; x=1726479015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJHFSTpQ0vTZWzeYc8se6HF+FeXCZTqFo5T7kTZmgNo=;
        b=OdCuLfHOLmJ/NL31Y0E9dwrhpvZOqv0Nvjx1c0REfId7+yJLnNl1SETZSf6oFLwtEC
         NcmmgkKBn3PMyFbh3n4CrSHWuWb5oFG/BTXPpj9sklNxgyJiluwAMW+5aHQ/GiEayRjo
         V8oNjgrlOdYzhD1aSiNo0/u3s1lPS+4cPXQvcTpLlfSlodPR/hpFSSdopsEH+gCy5TVg
         YVvN3DFFSysYic6NkP1SslEtur68AH8C0xZevKFLIL3alwrQDYfNF7M6UJ2n6jQmC9Jl
         5u4H5hCLmy0chU7bTZ9ELsZuuI0Ytz59i5X2tnRGi/kMU3NegeZlF7op6XKeP6DV8CdJ
         MqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJdXF+dGh+aXDVe4NA83JuG2trLsRHJgsk3glkxuPgexZ6P6wS6P4impW28QOADqdu6Es2thQ47k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXVyqK+5o8S+W6SbZFqyAB6BF8650s4JGqjjWqRyKFYwIEKv7P
	U9zqf3ypOyXYqQ5xkKGRLzgvVmJi3B/MSdMBzIy3ey898J9Z60CJ+hAcBmgykQ==
X-Google-Smtp-Source: AGHT+IGykTQZ+dCooMLmhVrd/L0wqLUxfa0lRUc0JHPb29ONtSHQBzuhY4BbIee/n0rzNtFGFK251w==
X-Received: by 2002:a17:907:2d1f:b0:a8d:55e1:a653 with SMTP id a640c23a62f3a-a8d55e1b600mr289350166b.13.1725874215138;
        Mon, 09 Sep 2024 02:30:15 -0700 (PDT)
Message-ID: <16d7ed89-fd25-491c-8e5a-ab6f5af6a3f5@suse.com>
Date: Mon, 9 Sep 2024 11:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline
 symbols
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-4-andrew.cooper3@citrix.com>
 <092700d9-101b-4bac-a500-7f03bd471d89@suse.com>
 <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
 <b16e9d77-869a-4ea3-93a6-647d3873ea4f@suse.com>
 <a16b5174-9af2-4efc-a91c-6e1159c5b383@citrix.com>
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
In-Reply-To: <a16b5174-9af2-4efc-a91c-6e1159c5b383@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.09.2024 21:46, Andrew Cooper wrote:
> On 06/09/2024 6:58 am, Jan Beulich wrote:
>> On 05.09.2024 18:10, Andrew Cooper wrote:
>>> On 05/09/2024 4:42 pm, Jan Beulich wrote:
>>>> On 05.09.2024 15:06, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>>> @@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(unsigned long delta)
>>>>>      }
>>>>>  }
>>>>>  
>>>>> -extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
>>>>> -extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
>>>> I'd prefer if these stayed here, leaving the 4 symbols as minimally exposed as
>>>> possible. Recall that efi-boot.h isn't really a header in that sense, but
>>>> rather a .c file. Elsewhere we keep decls in .c files when they're used in just
>>>> one CU.
>>> See Frediano's RFC series, which needs to change this in order to move
>>> the 32bit relocation logic from asm to C.
>> And it moves the declarations to the new .c file. Visibility still limited
>> to that one file. And (afaics) no Misra violation, contrary to what your
>> later reply to Frediano suggests.
> 
> If only there were an easy way to answer the question.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7766305370
> 
> Failure: 4 regressions found for clean guidelines
>   service MC3R1.R8.5: (required) An external object or function shall be
> declared once in one and only one file:
>    violation: 4

I'm afraid I'm having trouble locating, in that .log file, where the actual
regressions are pointed out. I guess I'm simply not used to reading such
logs yet, and hence I just don't know what to search for. In any event, I
think there's a set of issues here:
- Eclair apparently considered efi-boot.h a header file, which (as said
  earlier) isn't quite right.
- Declarations there are thus deemed okay (when they shouldn't, unless
  deviated).
- Movement to a proper .c file points out that those decls may have been
  missing "asmlinkage" already before.

>>> The only reason efi-boot.h can get away with this right now is because
>>> the other logic is written entirely in asm.
>>>
>>>
>>> Scope-limiting linker section boundaries more than regular variables is
>>> weird to me.  It's not as if they magically take more care to use than
>>> regular variables, and trampoline.h is not a wide scope by any means.
>> It's not "more than", it's "like" (i.e. no matter whether a linker script
>> or assembly is the origin of the symbol).
> 
> I'm asking why linker-section-boundary symbols should be treated
> specially, and not seeing an answer.

IOW you're not taking "they're no different from symbols defined in .S
files, and hence shouldn't be treated differently" as a possible position
to take? See __page_tables_{start,end}, cpu0_stack[], or multiboot_ptr as
examples.

> I assert they do not warrant special treatment, and should live in
> header files like every other extern symbol we use.

Then the same would also apply to symbols coming from .S files. Which in
turn were deliberately deviated (rather than moved) in the course of
dealing with the Misra rule relevant here.

Jan

