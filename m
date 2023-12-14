Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1B81323B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654595.1021663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDm9O-0004uE-W9; Thu, 14 Dec 2023 13:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654595.1021663; Thu, 14 Dec 2023 13:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDm9O-0004s3-TM; Thu, 14 Dec 2023 13:53:18 +0000
Received: by outflank-mailman (input) for mailman id 654595;
 Thu, 14 Dec 2023 13:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDm9O-0004qi-5t
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:53:18 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219b5a81-9a88-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 14:53:16 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1ec87a7631so723921166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:53:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 uv8-20020a170907cf4800b00a1d232b39b9sm9312703ejc.184.2023.12.14.05.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 05:53:14 -0800 (PST)
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
X-Inumbo-ID: 219b5a81-9a88-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702561996; x=1703166796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HAAm/0A8H11sUiDobV+CCmylODs2FpUb5hnIaxyzKM=;
        b=JZ2o6nJvekEyDIWGROTB3FiJ4vTHUHnQEZBOB256/YYQBHOSvOJCbuoM4XXiud42/z
         xfWjn+AHr4izF+JIfKHqc0al9u3mJeQ9gjglWikbOs9wIaEKT+b8tABpKrToNCZoa+HR
         bSK10J+vSE+6gWnspkgUh0Y6pJBjvDbuU/WuylLx7EluQF07JhJJkEe3PQscHjEJflHR
         jAnqnVsLMFApisD98ISt5WjTUTspEe8lF5xZmapD8BsE8iQtl+N5iwmglOfez5LzLl9q
         SlESd5mFKMqtMhThzr6AO31Ex5s6WcIT6PLEi2m64zvtQPgzDa/Za6BkMepzAi+gUp/l
         dZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561996; x=1703166796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HAAm/0A8H11sUiDobV+CCmylODs2FpUb5hnIaxyzKM=;
        b=FMjOKVr7b8Rp6RACedMhCs1jyMWtV8FVtEZyZnpiFbfVOXXjHPW8rr/G7a1RgOk0ws
         XJhm2yoXxD0JD7cqudsLuV3W2nbjfjV9RDmRPRLHxgmy2otLOnJroARtLhalO4X9wjdJ
         JSy7/HhDSmhfG5N5LKBxyNkvMlDwwz2kcVSGg8QXsUcNBhKEvpLIjl0HhBPx/OJyEoWk
         B0HY+km2qFRa2nQucK1/AVyaU0Lh8nrVgCIm/gOcWCcZQt96e+4WaqE/52+BPRgpKl6Q
         vvjvVd1ObPSBX3raI1t4rUu/B0/6z2HS2balfazzUFfwS2kZzUX/OfIusnjkEgaWpPD6
         xvZA==
X-Gm-Message-State: AOJu0YwsKpkqU/pZC52XbfRLh0h8EWxvfW0cL5Iy6NVpmHmhOjxj7ZEv
	vdzjRW9y4k13fO3u6lisqxwJ
X-Google-Smtp-Source: AGHT+IHNuTjW11VA1yhGqQtf45RPByM4oMyt1YFLFcaCBE/sdldesJPlmL92xH9arYA4Dpx21l4Pmg==
X-Received: by 2002:a17:907:9406:b0:a1d:f1ec:1cf8 with SMTP id dk6-20020a170907940600b00a1df1ec1cf8mr6759627ejc.27.1702561996073;
        Thu, 14 Dec 2023 05:53:16 -0800 (PST)
Message-ID: <89c741b3-9388-412e-87bf-4253e28c7808@suse.com>
Date: Thu, 14 Dec 2023 14:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-2-roger.pau@citrix.com>
 <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com> <ZXsFCSd1xpngciP3@macbook>
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
In-Reply-To: <ZXsFCSd1xpngciP3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14.12.2023 14:37, Roger Pau Monn=C3=A9 wrote:
> On Thu, Dec 14, 2023 at 12:18:13PM +0100, Jan Beulich wrote:
>> On 14.12.2023 11:17, Roger Pau Monne wrote:
>>> The minimal function size requirements for livepatch are either 5 byt=
es (for
>>> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm. =
 Ensure
>>> that distance between functions entry points is always at least of th=
e minimal
>>> required size for livepatch instruction replacement to be successful.=

>>>
>>> Add an additional align directive to the linker script, in order to e=
nsure that
>>> the next section placed after the .text.* (per-function sections) is =
also
>>> aligned to the required boundary, so that the distance of the last fu=
nction
>>> entry point with the next symbol is also of minimal size.
>>>
>>> Note that it's possible for the compiler to end up using a higher fun=
ction
>>> alignment regardless of the passed value, so this change just make su=
re that
>>> the minimum required for livepatch to work is present.
>>
>> That's a possibility which we don't need to be concerned about. Yet is=
n't it
>> also possible that we override a larger, deemed better (e.g. performan=
ce-wise)
>> value?
>=20
> I'm kind of confused, the compiler will always choose the higher
> alignment.

Will it? Before writing the reply I went through gcc's respective doc
section, without finding such a guarantee.

>  For example non-debug builds on my box end up with
> function sections aligned to 16 instead of the 8 passed in the
> -falign-functions=3D parameter:
>=20
> $ clang -MMD -MP -MF arch/x86/.traps.o.d -m64 -DBUILD_ID -fno-strict-al=
iasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variabl=
e -Wno-unused-local-typedefs   -Werror=3Dunknown-warning-option -O2 -fomi=
t-frame-pointer -falign-functions=3D8 -nostdinc -fno-builtin -fno-common =
-Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith -Wdeclaratio=
n-after-statement -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -=
ffunction-sections -fdata-sections -mretpoline-external-thunk  -I./includ=
e -I./arch/x86/include -I./arch/x86/include/generated -I./arch/x86/includ=
e/asm/mach-generic -I./arch/x86/include/asm/mach-default -DXEN_IMG_OFFSET=
=3D0x200000 -msoft-float -fno-pie -fno-stack-protector -fno-exceptions -f=
no-asynchronous-unwind-tables -Wnested-externs -DHAVE_AS_VMX -DHAVE_AS_SS=
E4_2 -DHAVE_AS_EPT -DHAVE_AS_RDRAND -DHAVE_AS_FSGSBASE -DHAVE_AS_XSAVEOPT=
 -DHAVE_AS_RDSEED -DHAVE_AS_CLAC_STAC -DHAVE_AS_CLWB -DHAVE_AS_QUOTED_SYM=
 -DHAVE_AS_INVPCID -DHAVE_AS_MOVDIR -DHAVE_AS_ENQCMD -mno-red-zone -fpic =
-mno-mmx -mno-sse -mskip-rax-setup -fcf-protection=3Dnone -Wa,-I./include=
 -Wa,-I./include '-D__OBJECT_LABEL__=3Darch/x86/traps.o'   -DXEN_BUILD_EF=
I -DBUILD_ID_EFI -c arch/x86/traps.c -o arch/x86/.traps.o.tmp -MQ arch/x8=
6/traps.o
>=20
> $ readelf -WS xen/arch/x86/traps.o
>=20
> There are 107 section headers, starting at offset 0xe2e0:
>=20
> Section Headers:
>   [Nr] Name              Type            Addr             Off    Size  =
 ES Flg Lk Inf Al
>   [ 0]                   NULL            0000000000000000 000000 000000=
 00      0   0  0
>   [ 1] .text             PROGBITS        0000000000000000 000040 000000=
 00  AX  0   0  4
>   [ 2] .text.show_code   PROGBITS        0000000000000000 000040 000287=
 00  AX  0   0 16
>   [ 3] .rela.text.show_code RELA            0000000000000000 008520 000=
450 18   I 104   2  8
>   [ 4] .altinstructions  PROGBITS        0000000000000000 0002c7 00024c=
 00   A  0   0  1
>   [ 5] .rela.altinstructions RELA            0000000000000000 008970 00=
07e0 18   I 104   4  8
>   [ 6] .discard          PROGBITS        0000000000000000 000513 000054=
 00   A  0   0  1
>   [ 7] .altinstr_replacement PROGBITS        0000000000000000 000567 00=
0018 00  AX  0   0  1
>   [ 8] .ex_table         PROGBITS        0000000000000000 000580 000028=
 00   A  0   0  4
>   [ 9] .rela.ex_table    RELA            0000000000000000 009150 0000f0=
 18   I 104   8  8
>   [10] .text.get_stack_trace_bottom PROGBITS        0000000000000000 00=
05b0 000046 00  AX  0   0 16
>   [11] .text.get_stack_dump_bottom PROGBITS        0000000000000000 000=
600 00003d 00  AX  0   0 16
>   [12] .text.show_stack_overflow PROGBITS        0000000000000000 00064=
0 000158 00  AX  0   0 16
> [...]
>=20
>> I'm somewhat concerned of that case. IOW is -falign-functions=3D reall=
y
>> the right option to use here? (There may not be one which we would act=
ually
>> prefer to use.) Specifically -falign-functions (without a value, i.e. =
using a
>> machine dependent default) is implied by -O2 and -O3, as per 13.2 gcc =
doc.
>=20
> Right, and that still works fine AFAICT, see how in the example above
> functions ended up aligned to 16 even when -falign-functions=3D8 was
> provided on the command line.
>=20
>>> --- a/xen/Kconfig
>>> +++ b/xen/Kconfig
>>> @@ -37,6 +37,24 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
>>>  config CC_SPLIT_SECTIONS
>>>  	bool
>>> =20
>>> +# Set function alignment.
>>> +#
>>> +# Allow setting on a boolean basis, and then convert such selection =
to an
>>> +# integer for the build system and code to consume more easily.
>>> +config CC_HAS_FUNCTION_ALIGNMENT
>>> +	def_bool $(cc-option,-falign-functions=3D8)
>>
>> How does this check make sure 4- or 16-byte alignment are also accepte=
d as
>> valid? (Requesting 8-byte alignment would be at least bogus on e.g. IA=
-64.)
>=20
> I was confused and expected the compiler to round up to the next
> supported value by the arch, but that doesn't seem to be written down
> in the GCC manual at least.
>=20
> One option would be to simply test for -falign-functions with no
> specific alignment, and leave Kconfig code to set a suitable value on
> a per-arch basis.

Perhaps; this ...

>>> +config FUNCTION_ALIGNMENT_4B
>>> +	bool
>>> +config FUNCTION_ALIGNMENT_8B
>>> +	bool
>>> +config FUNCTION_ALIGNMENT_16B
>>> +	bool
>>> +config FUNCTION_ALIGNMENT
>>> +	int
>>> +	default 16 if FUNCTION_ALIGNMENT_16B
>>> +	default  8 if  FUNCTION_ALIGNMENT_8B
>>> +	default  4 if  FUNCTION_ALIGNMENT_4B

=2E.. makes sure the highest alignment ever selected from anywhere will b=
e
used (should an arch need to select any of these).

>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -390,6 +390,9 @@ CFLAGS +=3D -fomit-frame-pointer
>>>  endif
>>> =20
>>>  CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) +=3D -ffunction-sections -fdata-s=
ections
>>> +ifdef CONFIG_FUNCTION_ALIGNMENT
>>
>> ... e.g. this meaningless? Or is the lack of a default value leading t=
o
>> the option remaining undefined (rather than assigning some "default"
>> default, e.g. 0)?
>=20
> If no default value the option remain undefined, and -falign-functions
> is not passed on the compiler command line.  This is required in case
> the compiler doesn't support -falign-functions.

Oh, sorry, I meant to delete that comment, which really was only the 2nd
half of something I had before actually deciding to try it out (see the
unmotivated ... at the beginning).

>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -44,6 +44,10 @@ SECTIONS
>>>  #ifdef CONFIG_CC_SPLIT_SECTIONS
>>>         *(.text.*)
>>>  #endif
>>> +#ifdef CONFIG_FUNCTION_ALIGNMENT
>>> +       /* Ensure enough distance with the next placed section. */
>>> +       . =3D ALIGN(CONFIG_FUNCTION_ALIGNMENT);
>>> +#endif
>>> =20
>>>         *(.fixup)
>>
>> Seeing .fixup nicely in context - can't that (and other specialized
>> sections containing code) also be patched?
>=20
> The current livepatch-build-tools logic doesn't seem to detect changes
> to .fixup, so I've added this to my list of stuff to fix for
> livepatch.  I do see the livepatch code in the hypervisor has support
> for loading extra .ex_table sections, so I assume at some point it was
> considered to add support for .fixup.  My current thinking is that
> .fixup itself won't be changed, and that instead a new .fixup will be
> loaded, and the newly loaded .ex_table will reference such section.

Hmm, yes, that's a fair explanation for .fixup not needing special
handling. Yet then I would still be worried of other snippets, e.g.
stuff ending up in e.g. .text.cold or .text.unlikely. Would they all
also be dealt with in similar ways?

Jan

