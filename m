Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1596079E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783818.1193098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitbe-0004Yx-GW; Tue, 27 Aug 2024 10:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783818.1193098; Tue, 27 Aug 2024 10:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitbe-0004X1-Dd; Tue, 27 Aug 2024 10:39:22 +0000
Received: by outflank-mailman (input) for mailman id 783818;
 Tue, 27 Aug 2024 10:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sitbd-0004Wt-Tf
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:39:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db15f36-6460-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 12:39:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so471384266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 03:39:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549cfa0sm92944166b.86.2024.08.27.03.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 03:39:18 -0700 (PDT)
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
X-Inumbo-ID: 9db15f36-6460-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724755159; x=1725359959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ctrfrExpz+Oj0q1oexd5kxaLdvB/HUnzI4skyoYGtmU=;
        b=LAMs+wnq7M5Toohx2Oy5CxDK+/VpjWO3rysN0iqajJKbB/N/b0cs6t/o9uHfgvZE4P
         7/+GxNGcYFjOHYvsgLRGPwX+u8trHTrnfxt25DUbWp0KVT5GoAC0c7K6J/RxqOZqjjpV
         i0FGlSVJV9Wzl4aQrC6w5SlHktraH3qulKfPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724755159; x=1725359959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctrfrExpz+Oj0q1oexd5kxaLdvB/HUnzI4skyoYGtmU=;
        b=GmQ6FFirRi9K7j2QrSbUpNtH7i75Si/mxswYWR4oWFnrjB08Io/LAKf/EDZXmkIXGx
         vJNmMOzVp8ThcGpfL848v7JlG/lWxBFUjuGQlg1QrETLotfR2616qKfm+Xcq4Z00dKCL
         ERey0xjTSdv04nlp6CmG8vK96Ycdkfds5PPmWkz+MkZSHWAH+cPKgokUVSGVkXPm01O9
         Q48+hNdzv8RAzNbDWNysv/QVWmOycE9vcasPRUSHKXXwS1fJV8O7bn4SWX7axr3ddDUy
         j2uvfOZ69zHI/6qZsg0353tLrvEydSSSM2b1UPxkor2UY0622FMu9vg/rsiUmRWJavnE
         EYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUklBPytW2hH5YBKSW+sY0CWzNt4tJSMirm9ySyF5KUNSXYKNYDSatslmXtQnkeiQTwo6wrmWuNJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCYzYrcB4U8/tEpV0zj7ED5PwEkkZE0Qoc0MniwNGncNPioKpS
	K37IHdz2NEaYYmnEC3GmLtpwM8Qy9RlkUryHG3nX/EAPJ2UQmMGgwByrPKdUOYc=
X-Google-Smtp-Source: AGHT+IEj8i3/oHZmFDGqhAxy04z7QVd6LYfkyUgerv1wHgtxU87NmHxIsXfyOAbCnAMtpuiu6pQDVA==
X-Received: by 2002:a17:907:1b1b:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a86a54a9963mr1004678266b.43.1724755158817;
        Tue, 27 Aug 2024 03:39:18 -0700 (PDT)
Message-ID: <f5bac01b-74d6-41c4-b3c5-ad595d6de378@citrix.com>
Date: Tue, 27 Aug 2024 11:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xen/bitops: Introduce generic_hweightl() and
 hweightl()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-6-andrew.cooper3@citrix.com>
 <14c385ce-c61d-48e3-aa09-7b450af34b6c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14c385ce-c61d-48e3-aa09-7b450af34b6c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2024 12:40 pm, Jan Beulich wrote:
> On 23.08.2024 01:06, Andrew Cooper wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
>  unsigned int __pure generic_ffsl(unsigned long x);
>  unsigned int __pure generic_flsl(unsigned long x);
>  
>> +/*
>> + * Hamming Weight, also called Population Count.  Returns the number of set
>> + * bits in @x.
>> + */
>> +unsigned int __pure generic_hweightl(unsigned long x);
> Aren't this and ...
>
>> @@ -284,6 +290,18 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>>          (_v & (_v - 1)) != 0;                   \
>>      })
>>  
>> +static always_inline __pure unsigned int hweightl(unsigned long x)
> ... this even __attribute_const__?

Hmm.  This is following fls(), but on further consideration, they should
be const too.

I'll do a prep patch fixing that, although I'm going to rename it to
__attr_const for brevity.

Much as I'd prefer __const, I expect that is going too far, making it
too close to regular const.

>
>> +{
>> +    if ( __builtin_constant_p(x) )
>> +        return __builtin_popcountl(x);
> How certain are you that compilers (even old ones) will reliably fold
> constant expressions here, and never emit a libgcc call instead? The
> conditions look to be more tight than just __builtin_constant_p(); a
> pretty absurd example:
>
> unsigned ltest(void) {
>     return __builtin_constant_p("") ? __builtin_popcountl((unsigned long)"") : ~0;
> }

How do you express that in terms of a call to hweightl()?

Again, this is following the layout started with fls() in order to avoid
each arch opencoding different versions of constant folding.

https://godbolt.org/z/r544c49oY

When it's forced through the hweightl() interface, even GCC 4.1 decides
that it's non-constant and falls back to generic_hweightl().


I did spend a *lot* of time with the fls() series checking that all
compilers we supported did what we wanted in this case, so I don't
expect it to be a problem.  But, if a library call is emitted, it will
be very obvious (link failure), and we can re-evaluate.


>
>> --- /dev/null
>> +++ b/xen/lib/generic-hweightl.c
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/init.h>
>> +#include <xen/self-tests.h>
>> +
>> +/* Mask value @b broadcast to every byte in a long */
>> +#if BITS_PER_LONG == 32
>> +# define MASK(b) ((b) * 0x01010101UL)
>> +#elif BITS_PER_LONG == 64
>> +# define MASK(b) ((b) * 0x0101010101010101UL)
>> +#else
>> +# error Extend me please
>> +#endif
>> +
>> +unsigned int generic_hweightl(unsigned long x)
>> +{
>> +    x -= (x >> 1) & MASK(0x55);
>> +    x =  (x & MASK(0x33)) + ((x >> 2) & MASK(0x33));
>> +    x =  (x + (x >> 4)) & MASK(0x0f);
>> +
>> +    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
>> +        return (x * MASK(0x01)) >> (BITS_PER_LONG - 8);
> I realize it's nitpicking, yet especially this use isn't really "mask"-
> like. Could I talk you into naming the macro e.g. BCST()?

Ok - I wasn't overly happy with the name MASK(), and BCST() is better.

>
>> +    x += x >> 8;
>> +    x += x >> 16;
>> +#if BITS_PER_LONG > 32
>> +    x += x >> 32;
>> +#endif
>> +
>> +    return x & 0xff;
>> +}
> Perhaps #undef MASK here, or else ...
>
>> +#ifdef CONFIG_SELF_TESTS
>> +static void __init __constructor test_generic_hweightl(void)
>> +{
>> +    RUNTIME_CHECK(generic_hweightl, 0, 0);
>> +    RUNTIME_CHECK(generic_hweightl, 1, 1);
>> +    RUNTIME_CHECK(generic_hweightl, 3, 2);
>> +    RUNTIME_CHECK(generic_hweightl, 7, 3);
>> +    RUNTIME_CHECK(generic_hweightl, 0xff, 8);
>> +
>> +    RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
>> +    RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
>> +}
> ... actually use it some here, to have a few more cases?

Hmm, why not.

~Andrew

