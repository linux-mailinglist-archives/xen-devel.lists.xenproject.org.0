Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE2CB0485
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 15:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181778.1504777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSyhd-0006cz-D2; Tue, 09 Dec 2025 14:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181778.1504777; Tue, 09 Dec 2025 14:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSyhd-0006bV-9m; Tue, 09 Dec 2025 14:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1181778;
 Tue, 09 Dec 2025 14:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSyhb-0006b9-MO
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 14:28:31 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55349ccf-d50b-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 15:28:30 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso54424335e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 06:28:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7da2d3e9sm16949845e9.17.2025.12.09.06.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 06:28:28 -0800 (PST)
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
X-Inumbo-ID: 55349ccf-d50b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765290509; x=1765895309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bm/eR9tm4GrPgwE/G1zqJn6VZ+le5rWynby2zeWK9mM=;
        b=Fn1kfn8NAPZ4uSS53pcAKpKR0k8M5SouCoJn/RvAvBv1LVoKIEEQ5FmBTMZtYMBs08
         Up1YWlz9W0Djc4Slst2LoEATmaSpS8lqw/PYTLd+uAjrXZR7t6qIPclRactleaG2wx2N
         8a5fWnqTRGk0WFVNQluCWy91LDE5vZWzat/7ly+6/VfBTetfxRbJAe3coosU/v4uDw9q
         MgFUzGH/zcAUrU9OGzZuxKpoIu+TV8+xcE0Hv/4FBXLneD8P+ohyLe8MZMI2iibArz7q
         cnqB9UTQBBo0GJKijT5ciw5BpVZ/uy6lrkYigbQN6LK/EQ8Yerf0khmr2tuOhRuqQJwj
         FuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290509; x=1765895309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm/eR9tm4GrPgwE/G1zqJn6VZ+le5rWynby2zeWK9mM=;
        b=sRnS5KIcApItt7xDvclxzSVgfgwTjBdMGutwlktGVzjisff5IfwjPHkPBgpDT+5TYC
         /97KOyvPXRYKwrAVDVbtDkinX6fE89Mg7xJfEKtu59/GPC8WKu8/XuXyjo6KngQ90ynj
         Cbnw2W4mVdMoP5JDP5evV23M5f5zAi7MxTgm0AKtZ7d89GIQF+lOiIXSkOul5EQk2ZHr
         sW0ugKXl8LY+qsaQWqWrAhfdBApp5jAtS43nY4iIH0DEXvRszoOktMk0rTMjPuELyZOK
         Xlesj9rVlj/vLiC8TDnYBmL9RGd5eimnykOeXsCw+tBXvWnBHqOwTA9LTbN/rucjOcgv
         uRxw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIwNcbIpFo+oel028/z0x+UWlUOv7G8awOb7tqzzpi2Xf+fJxYzcz9Ipvgacac+LVc7NaKJvO5ZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfK1kCvBQmB1y0lJ5N/x/0luxE2bLZYj2kblXtv/TZgJh93yaQ
	vwhmpY/5w+0DJUCVCNY6qn8B1fXxs7fqCUXnPdpgdcIOdEPxPEcXBE6+q7+dl5JIfQ==
X-Gm-Gg: ASbGncvx2pJZ5EK1tqOxf2oLOJU5/Yayn38uovIdOXAe1I/El6zNE0RtjPcorbxY2uy
	ANrPLd/sLMDY16I+QwgGp1S1JbEMEl9CnFmIKJizn/O13j1pceB9Q1xqxAdnQrTv4MgGkuR3EHH
	3HNQJ/nff5HJQfCzZbSoW9KQXFWNZ5Vo3L04SgfEC8uV4QgvkMCil6STks9yDxrdgW9KSmtZLs/
	eB531R2ITqc9JCC9Eu02JAWDsxAGmQ+Ezn7wzzJ7nxQN6BbdBrkcQgHqpZtDHI3wJXqQDLZpLFE
	sWHbfQ1tGSIUDhM18JM5Sl1CWWg8Ux5+eJEE4tFEXcIOLapx/5hTO7yukFq1MWzsNaMb5NmGQql
	mVo8k+VQyOsvwyTWKpGlVx6GkYEbXBCpxex/EJKQ0ljQqb9HDO7P6jyIrI9O2eDV0CwZKH3YBY9
	I09DyONHGUM1Yx9ozc3mLiH44v50yF3LAu+INNkohnz9rK+YnL+E9XwteyCvnzIT/IOgoZeLazf
	Kg=
X-Google-Smtp-Source: AGHT+IFOClFM8GwC+og3tm1z//Ca8tzJIV19Ttv+tMbOacBeUyzRD9S2mnc4elzo4fVm7vSyRnx4/g==
X-Received: by 2002:a05:600c:1e88:b0:479:2a78:4a2e with SMTP id 5b1f17b1804b1-47a7fa21c2fmr17817505e9.7.1765290509348;
        Tue, 09 Dec 2025 06:28:29 -0800 (PST)
Message-ID: <c18b4522-e131-495b-bd7f-2eb7e6568a8a@suse.com>
Date: Tue, 9 Dec 2025 15:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
 <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
 <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
 <25069a8e-ef00-4706-bffa-b3b724cca200@citrix.com>
 <4e7e8f25-a658-4e8d-bdce-1e1266ff6339@epam.com>
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
In-Reply-To: <4e7e8f25-a658-4e8d-bdce-1e1266ff6339@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 15:21, Grygorii Strashko wrote:
> 
> 
> On 09.12.25 15:19, Andrew Cooper wrote:
>> On 08/12/2025 6:49 pm, Grygorii Strashko wrote:
>>> Hi Andrew,
>>>
>>> On 06.12.25 16:21, Andrew Cooper wrote:
>>>> On 06/12/2025 2:15 pm, Andrew Cooper wrote:
>>>>> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>>>>>
>>>>>> On 05.12.25 22:00, Andrew Cooper wrote:
>>>>>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>>
>>>>>>>> Extend coverage support on .init and lib code.
>>>>>>>> Add two hidden Kconfig options:
>>>>>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>>>>>> %.init.o
>>>>>>>> files"
>>>>>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>>>>>> end of
>>>>>>>> Xen boot."
>>>>>>>>
>>>>>>>> Both selected selected when COVERAGE=y, as getting coverage
>>>>>>>> report for
>>>>>>>> ".init" code is required:
>>>>>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>>>>>> - the .init code stay in memory after Xen boot.
>>>>>>>>
>>>>>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other
>>>>>>>> debug
>>>>>>>> features in the future.
>>>>>>>>
>>>>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>> ---
>>>>>>>> changes in v2:
>>>>>>>>     - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>>>>>> different things,
>>>>>>>>       both potentially reusable
>>>>>>>>     - enable coverage for libfdt/libelf always
>>>>>>>>     - enable colverage for .init always
>>>>>>> This is a lot nicer (i.e. more simple).
>>>>>>>
>>>>>>> But, I still don't know why we need to avoid freeing init memory
>>>>>>> to make
>>>>>>> this work.  What explodes if we dont?
>>>>>>>
>>>>>> It will just crash when coverage data is collected.
>>>>>>
>>>>>> First I made changes in make file to get .init covered
>>>>>> then I hit a crash
>>>>>> then I checked %.init.o
>>>>>> conclusion was obvious.
>>>>>>
>>>>>> For example:
>>>>>> objdump -x bzimage.init.o | grep gcov
>>>>>>
>>>>>> 0000000000000010 l     O .bss    0000000000000028
>>>>>> __gcov0.bzimage_check
>>>>>> 0000000000000040 l     O .bss    0000000000000040
>>>>>> __gcov0.bzimage_headroom
>>>>>> 0000000000000000 l     O .bss    0000000000000008
>>>>>> __gcov0.output_length
>>>>>> 0000000000000080 l     O .bss    0000000000000060
>>>>>> __gcov0.bzimage_parse
>>>>>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>>>>>> __gcov_.bzimage_parse
>>>>>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>>>>>> __gcov_.bzimage_headroom
>>>>>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>>>>>> __gcov_.bzimage_check
>>>>>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>>>>>> __gcov_.output_length
>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>>>>>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>>>>>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>>>>>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>>>>>
>>>>> Aah, we should exclude the OJBCOPY too.  That's what's moving
>>>>> .data.rel.local amongst other sections we target with attributes
>>>>> directly.
>>>>
>>>> we can't target.
>>>
>>> I've come up with below diff - seems it's working without
>>> DO_NOT_FREE_INIT_MEMORY.
>>> Is this what you have in mind?
>>>
>>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>>> index 8fc201d12c2c..16b1a82db46e 100644
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -40,7 +40,6 @@ config COVERAGE
>>>          depends on SYSCTL && !LIVEPATCH
>>>          select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if
>>> !ENFORCE_UNIQUE_SYMBOLS
>>>          select RELAX_INIT_CHECK
>>> -       select DO_NOT_FREE_INIT_MEMORY
>>>          help
>>>            Enable code coverage support.
>>>   
>>> diff --git a/xen/Rules.mk b/xen/Rules.mk
>>> index 8c4861a427e6..47fdcc1d23b5 100644
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -33,11 +33,15 @@ cov-cflags-y :=
>>>   nocov-y :=
>>>   noubsan-y :=
>>>   
>>> +# when coverage is enabled the gcc internal section should stay in
>>> memory
>>> +# after Xen boot
>>> +ifneq ($(CONFIG_COVERAGE),y)
>>>   SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>>                                               $(foreach w,1 2 4, \
>>>                                                          
>>> rodata.str$(w).$(a)) \
>>>                                               rodata.cst$(a)) \
>>>                            $(foreach r,rel rel.ro,data.$(r).local)
>>> +endif
>>>   
>>>   # The filename build.mk has precedence over Makefile
>>>   include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
>>> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
>>> index 60b3ae40728f..8180c78f1510 100644
>>> --- a/xen/common/libelf/Makefile
>>> +++ b/xen/common/libelf/Makefile
>>> @@ -1,8 +1,10 @@
>>>   obj-bin-y := libelf.o
>>>   libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>>>   
>>> +ifneq ($(CONFIG_COVERAGE),y)
>>>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>>   OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>>> .$(s)=.init.$(s))
>>> +endif
>>>   
>>>   CFLAGS-y += -Wno-pointer-sign
>>>   
>>> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
>>> index ae0f69c01373..fb26e5bff0fd 100644
>>> --- a/xen/common/libfdt/Makefile
>>> +++ b/xen/common/libfdt/Makefile
>>> @@ -4,7 +4,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>>   
>>>   # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed
>>> during runtime.
>>>   ifneq ($(CONFIG_OVERLAY_DTB),y)
>>> -OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>>> .$(s)=.init.$(s))
>>> +       ifneq ($(CONFIG_COVERAGE),y)
>>> +               OBJCOPYFLAGS := $(foreach
>>> s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>>> +       endif
>>>   endif
>>
>> This is the (aforementioned) non-standard way of doing .init.o, which is
>> why it doesn't play nicely.
>>
>> I suggest that we first convert libelf and libfdt to the standard way of
>> doing .init.
> 
> I assume the rest is ok.
> 
>>
>> For libelf this means we need regular __init annotations, but #undef'd
>> outside of __XEN__ (when we're doing the userspace build).
>>
> 
> Need clarification here - this are imported libraries and changing their code
> directly was not welcome before. Therefore there is Xen specific magic in Makefiles.
> :(

I can't and won't speak for libfdt, but for libelf I think we should really
consider this ours (not imported) the latest as of the re-work for XSA-55.

Jan

> Just an idea1, may be ".init" handling can be just dropped from libelf and libfdt
> Makefiles with comment added instead (kinda "TODO") - they will be built-in.
> It doesn't work with CONFIG_CC_SPLIT_SECTIONS any way now.
> 
> Just an idea2, drop libelf and libfdt changes from this patch.
> - they will be not in coverage report (nocov-y += *.obj)
> - will be resolved in the future.
> 
> Trying to avoid blocking on external dependencies :(
> 
>> For libfdt, this will need some init_or_$FOO things (matching
>> init_or_livepatch).
>>
>> Once the custom init has been made standard, this code becomes easier to
>> move into lib, and we no longer have special cases when trying to extend
>> coverage.
> 
> 


