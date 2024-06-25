Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67981916B3D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747880.1155400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7bD-0007X2-JY; Tue, 25 Jun 2024 14:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747880.1155400; Tue, 25 Jun 2024 14:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7bD-0007Ts-GK; Tue, 25 Jun 2024 14:56:47 +0000
Received: by outflank-mailman (input) for mailman id 747880;
 Tue, 25 Jun 2024 14:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM7bB-0007Tm-8P
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:56:45 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c38da2-3303-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 16:56:43 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so34139281fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:56:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a623a3sm8848638a91.5.2024.06.25.07.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
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
X-Inumbo-ID: 22c38da2-3303-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719327403; x=1719932203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GHFwsA2HBWd/ihksLPZIEBzulcUQCvnvwxuRXsfjfjs=;
        b=IXNsNlNzBvvmrg4qSa9utaUwC0J+KwsR/PigYMEfOnBuYPklrog1nOxOXlq7dO0xdT
         0LH3nycVNV1dHpVdldC3MRnW2sZQBxYr2fZR9bbZfHZSMLqMgTHttuLCtf3bNnLNNZF/
         T3DV3TmEnk3FkeOXOHmApKNJijMLBsTNRfRoFZ+DTPTccupNiR4majLdoVJYT/6gawSC
         FqNdt52REfwomTcVIXyOOaLn1ko0EmcUHm3ZWwCwFh/9dO4icalul/dMFS10iQcMVAmP
         DwP6MeWnpT9ipLSd8Z+1kUEFtI8SHsWGlcbzzMiVxCopsE2RtRg11sZAnF8uyTipLDvU
         2ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327403; x=1719932203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHFwsA2HBWd/ihksLPZIEBzulcUQCvnvwxuRXsfjfjs=;
        b=XUJjKw1WdHY9PZS0V11vWcQnilpUEPY9HtWzMWEliBUKa3+ByDZS4G4LQRrfizFor4
         wsXyt9qbqruX389Tbn2HmwyzY5mOtsGoQoUKZX3H43Ex3XIXcB40ua1UvBTEms/0oKOJ
         9xuEmfqfXy8TvE+fHGx3FTNjcmRyLAbipcMC3p8RfbALo5mQ/8Wippnvekhbp0VzFGQd
         5EvHlAHIqtCIDUZZ+qbQ3nM0vQQO4VJhl7BQVHThamUqNQRQ69ptqqmR0g+nc8HvEz8q
         dAmw7W72FlSkQWdz1C1DkXA4vEevxG3cnJisZhs9TNhhaauwhlWh57aeRF3BRFvtcxpQ
         oUbg==
X-Forwarded-Encrypted: i=1; AJvYcCUrr/gx/Dgf4rPpWn2tV3dEsviDuY1E9wusb0TTMpV8oTp9IKEZCcI30EUv1ggzHqIHkvS/yc38COte40n8zDfX9p/1OUcu0xfLxoN6hME=
X-Gm-Message-State: AOJu0YxmJe1mhp8LyUbVF7tSNvxcsymL6+dNqHzOgMHsyqNM/iPkdA4v
	yjfSozZ+rc/l+N0RCJC0KHv1R81EYm1VZ5NQHodslOT5ZREC2ViDFvJHZhmVl3xQyr/XQ/f40/c
	=
X-Google-Smtp-Source: AGHT+IHyY6h5AdR2otcts7LbpODbEZERLAhXHgzy8WWhPPZPPR25xdG2qJfEv/T3zZCE40qQix8W/g==
X-Received: by 2002:a2e:9596:0:b0:2ec:55b5:ed50 with SMTP id 38308e7fff4ca-2ec5b2fd2d0mr55937841fa.5.1719327402768;
        Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
Message-ID: <4bab3cff-93c0-497c-b0ad-8d2df26124d2@suse.com>
Date: Tue, 25 Jun 2024 16:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
 <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
 <80d0578d-26c0-4650-9edf-6926c055d415@suse.com>
 <CABfawhk3RyR-ACq-mBk=F1-SCKJPiiS_yhU1=A_jR8Js3=fQyA@mail.gmail.com>
 <8d32db90-8bd0-4a8f-82d9-938e36d3f181@suse.com>
 <CABfawhnYFS97U1F4CuacbNWzLVoKXFxTSpG-Ddb-VL7di=7XDw@mail.gmail.com>
 <243e34fc-57a2-464c-8a11-2cfee7e9cda3@suse.com>
 <CABfawh=6d+F1tYLmfC-NyMn80NROFf_0HL-WkKzu-r5vjfScaw@mail.gmail.com>
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
In-Reply-To: <CABfawh=6d+F1tYLmfC-NyMn80NROFf_0HL-WkKzu-r5vjfScaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 15:40, Tamas K Lengyel wrote:
> On Tue, Jun 25, 2024 at 9:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.06.2024 14:40, Tamas K Lengyel wrote:
>>> On Tue, Jun 25, 2024 at 7:52 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 25.06.2024 13:12, Tamas K Lengyel wrote:
>>>>> On Tue, Jun 25, 2024 at 2:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 24.06.2024 23:23, Tamas K Lengyel wrote:
>>>>>>> On Mon, Jun 24, 2024 at 11:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>
>>>>>>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
>>>>>>>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>>>>>>>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>>>>>>>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>>>>>>>>
>>>>>>>>> +libfuzzer-harness: $(OBJS) cpuid.o
>>>>>>>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $^ -o $@
>>>>>>>>
>>>>>>>> What is LIB_FUZZING_ENGINE? I don't think we have any use of that in the
>>>>>>>> tree anywhere.
>>>>>>>
>>>>>>> It's used by oss-fuzz, otherwise it's not doing anything.
>>>>>>>
>>>>>>>>
>>>>>>>> I'm further surprised you get away here without wrappers.o.
>>>>>>>
>>>>>>> Wrappers.o was actually breaking the build for oss-fuzz at the linking
>>>>>>> stage. It works just fine without it.
>>>>>>
>>>>>> I'm worried here, to be honest. The wrappers serve a pretty important
>>>>>> role, and I'm having a hard time seeing why they shouldn't be needed
>>>>>> here when they're needed both for the test and afl harnesses. Could
>>>>>> you add some more detail on the build issues you encountered?
>>>>>
>>>>> With wrappers.o included doing the build in the oss-fuzz docker
>>>>> (ubuntu 20.04 base) fails with:
>>>>>
>>>>> ...
>>>>> clang -O1 -fno-omit-frame-pointer -gline-tables-only
>>>>> -Wno-error=enum-constexpr-conversion
>>>>> -Wno-error=incompatible-function-pointer-types
>>>>> -Wno-error=int-conversion -Wno-error=deprecated-declarations
>>>>> -Wno-error=implicit-function-declaration -Wno-error=implicit-int
>>>>> -DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION -fsanitize=address
>>>>> -fsanitize-address-use-after-scope -fsanitize=fuzzer-no-link -m64
>>>>> -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes
>>>>> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Werror
>>>>> -Og -fno-omit-frame-pointer
>>>>> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP
>>>>> -MF .libfuzzer-harness.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>>>>> -I/src/xen/tools/fuzz/x86_instruction_emulator/../../../tools/include
>>>>> -D__XEN_TOOLS__ -iquote . -fsanitize=fuzzer -fsanitize=fuzzer
>>>>> -Wl,--wrap=fwrite -Wl,--wrap=memcmp -Wl,--wrap=memcpy
>>>>> -Wl,--wrap=memset -Wl,--wrap=printf -Wl,--wrap=putchar -Wl,--wrap=puts
>>>>> -Wl,--wrap=snprintf -Wl,--wrap=strstr -Wl,--wrap=vprintf
>>>>> -Wl,--wrap=vsnprintf fuzz-emul.o x86-emulate.o x86_emulate/0f01.o
>>>>> x86_emulate/0fae.o x86_emulate/0fc7.o x86_emulate/decode.o
>>>>> x86_emulate/fpu.o cpuid.o wrappers.o -o libfuzzer-harness
>>>>> /usr/bin/ld: /usr/bin/ld: DWARF error: invalid or unhandled FORM value: 0x25
>>>>> /usr/local/lib/clang/18/lib/x86_64-unknown-linux-gnu/libclang_rt.fuzzer.a(fuzzer.o):
>>>>> in function `std::__Fuzzer::__libcpp_snprintf_l(char*, unsigned long,
>>>>> __locale_struct*, char const*, ...)':
>>>>> cxa_noexception.cpp:(.text._ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__locale_structPKcz[_ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__locale_structPKcz]+0x9a):
>>>>> undefined reference to `__wrap_vsnprintf'
>>>>> clang: error: linker command failed with exit code 1 (use -v to see invocation)
>>>>> make: *** [Makefile:62: libfuzzer-harness] Error 1
>>>>> rm x86-emulate.c wrappers.c cpuid.c
>>>>> make: Leaving directory '/src/xen/tools/fuzz/x86_instruction_emulator'
>>>>> ERROR:__main__:Building fuzzers failed.
>>>>
>>>> Hmm, yes, means we'll need an actual vsnprintf() wrapper, not just a
>>>> declaration thereof.
>>>
>>> I don't really get what this wrapper accomplishes
>>
>> They guard against clobbering of in-register state (SIMD registers in
>> particular, but going forward maybe also eGRP-s as introduced by APX)
>> by library functions called between emulation of individual insns (or,
>> especially possible for fuzzing instrumented code, I think) even from
>> in the middle of emulating an insn. (Something as simple as the
>> compiler inserting a call to memcpy() or memset() somewhere in the
>> translation of the emulator source code could also clobber state.)
>>
>>> and as I said, fuzzing works with oss-fuzz just fine without it.
>>
>> I'm inclined to take this as "it appears to work just fine". Fuzzed
>> input register state may be lost by doing a library call somewhere,
>> rendering the fuzzing results less useful. This would pretty
>> certainly stop being tolerable the moment you compared results of
>> native execution of a sequence of instructions with the emulated
>> counterpart.
> 
> Yea, that may be. Any suggested way to fix the linking issue though?

As said before, we need to gain a real wrapper for vsnprintf(). Right
now we only have a declaration thereof, for use by the wrapper for
snprintf().

> I'm not even sure why the problem only appears in the oss-fuzz build,
> when I just run make normally it seems to work.

Sounds a little odd indeed. Yet I have no idea towards the differences
between the two.

Jan

