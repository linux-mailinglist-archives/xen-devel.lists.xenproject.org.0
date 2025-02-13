Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F66A33C0B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 11:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887311.1296831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiW78-00057k-N1; Thu, 13 Feb 2025 10:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887311.1296831; Thu, 13 Feb 2025 10:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiW78-00056D-K4; Thu, 13 Feb 2025 10:06:34 +0000
Received: by outflank-mailman (input) for mailman id 887311;
 Thu, 13 Feb 2025 10:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiW77-000567-Ds
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 10:06:33 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31cd2810-e9f2-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 11:06:30 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so48546a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 02:06:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53259517sm100166166b.65.2025.02.13.02.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 02:06:28 -0800 (PST)
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
X-Inumbo-ID: 31cd2810-e9f2-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739441189; x=1740045989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tCVJjulAEt79/ErwIY1yoW7UYTi7RWuYnLngCOlFfFc=;
        b=SPhWGCPCm69RWhCNWCRwDdNpfDeMICf0dslY8pAKtFrFw2ktV+Wln7ytEsLKirm1nW
         CTKFEIxvs0zB4HwQ2UB4NnqTDi5gUEcDaO3G+Y7szNilazu92XBrbSskZiQukm3nB71D
         v+9eb0TedxENzBCIUHcG79WwcLrSYp/vbxu9dB2OIOR+6I0oxMgv48+8PkzUJrPhCO8n
         9DGHSbpvpxlH1yYjkIz5oRlHpdvcRpnmgy+8VYzCBoZbwwCkBzmJIX5Qk0hkPwyxBTzx
         PyXWax8o2wi8LbOUoZCGB/eY1ubfyRV1NudTZsgw+JE4wmypsACxea0gqyTDXm3XDyro
         +Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441189; x=1740045989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCVJjulAEt79/ErwIY1yoW7UYTi7RWuYnLngCOlFfFc=;
        b=wE1VgZ58SteOGWdgG4KBB3A6kX7eC4dBeyvXQAYRcyhutIhHFPee6OyUw1b+Y9nTj0
         pjWwxOi1oTWd9N7PSB8A7aZUqIVzwLq7Hn3v5Q2X61vxjVcPChOP0TejJPBPSkEUPuHd
         5A7jF2WsFw33h3JOdhuKycOg45h2foP9GIjwVYt9oy6e0/3UNe+q9jSRoRPPkV68Lfx2
         pHpim5GzcjSxhI9V6AsoOXC83FmI5pmXWO9mdqstxFb1Ov2TfkNGF6HCQRlzg7JIIFzg
         8vqLqel8vcHyUO59uGaX5Vo9V3sUL57INKuXbMf8F8qQsdaBiIFswqyynxLH10QEHf4y
         ZNHw==
X-Forwarded-Encrypted: i=1; AJvYcCWoXsQNn4EKKReerm5quY/H3yFyltuEVn14vT7ge+Q+7dvqoTniRl/Yvy8LMijxm8KZNo/872myAUg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrModaJx/0yalDwUoBZGTP+Or1x1n0no7V+hqY6rCGerosPuWd
	OhJ7bWsPZb5NtAq4HAJiRSNtmJEgty0pFah7vcWfc9p03X1Kg1KWHqe3Hi8dz6rK6bo651gjZ9k
	=
X-Gm-Gg: ASbGncuHvsxY6gh268CLrlKv8VYF4sjek75Tf8f4y9oksJuG0bI2HXFdWVOtLrz/w2K
	+YEBjriC15MmrZt7JXLCbH8Fy9v6NUJhUnl9M4Md36DMg7jleGP8g4BxJ+Zn9vPZUfCi+r/ATeI
	ZomVw3JWK5L3lmbBdFpR2TzEET7Syh7eQq5ozOzYR0nY0Bcn6IqTJea6Ox61LQSpCd4s+I8G//c
	ajaJBzx9X88dYuqcEjzh84R0SXSz1YO2oNWQHMaJjv4+xJlLlM9nD9L3PmalYv+XEW8Sjf8IGeV
	3DNoIn6FLxjv1SoSLvUl5/w4EPBAeTZ0twav4GXKdopmxuwEVHvhA4GNpN/CL+n7siKogeIEDqW
	6
X-Google-Smtp-Source: AGHT+IHfPcy/YPuIMDzlgjx998P0E/oThi+pwZohwcnHfzz7ta/Yja58NaPnu03h8jpAh7gWJwBPnA==
X-Received: by 2002:a17:907:72c7:b0:ab7:eeae:b23e with SMTP id a640c23a62f3a-ab7f34ab3b5mr628124966b.47.1739441189250;
        Thu, 13 Feb 2025 02:06:29 -0800 (PST)
Message-ID: <a2ef5618-b719-4c7b-ac6c-6861ba146ce2@suse.com>
Date: Thu, 13 Feb 2025 11:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blowfish failure to compile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65338578-dd6c-4f01-807e-da389cc60cb8@citrix.com>
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
In-Reply-To: <65338578-dd6c-4f01-807e-da389cc60cb8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2025 18:20, Andrew Cooper wrote:
> I've noticed the following failure in XenServer's build environment
> 
>> make[6]: Leaving directory
>> '/builddir/build/BUILD/xen-4.19.1/tools/tests/x86_emulator'
>> In file included from /usr/include/features.h:535,
>>                  from /usr/include/bits/libc-header-start.h:33,
>>                  from /usr/include/stdint.h:26,
>>                  from
>> /usr/lib/gcc/x86_64-xenserver-linux/12/include/stdint.h:9,
>>                  from blowfish.c:18:
>> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such
>> file or directory
>>     7 | # include <gnu/stubs-32.h>
>>       |           ^~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[6]: *** [testcase.mk:15: blowfish.bin] Error 1
> 
> It's non-fatal, but it reduces the content in test_x86_emulator which we
> do care about running.

Hmm, yes, I did see such in the past, and solved it by putting the seemingly
missing header in place on the distro.

> Elsewhere in the tree we fix this with -ffreestanding -nostdinc
> -I$(XEN_ROOT)/tools/firmware/include but that isn't an option for
> test_x86_emulator in general which is hosted.
> 
> However, it is an option for blowfish.c specifically which is
> freestanding, and for which we build a 32bit form in an otherwise 64bit
> build.
> 
> Therefore, it stands to reason that:
> 
> diff --git a/tools/tests/x86_emulator/Makefile
> b/tools/tests/x86_emulator/Makefile
> index 294d27ebaa08..e46fd8becb96 100644
> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -33,8 +33,8 @@ HOSTCFLAGS += -m32 -I..
>  
>  else
>  
> -blowfish-cflags := ""
> -blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
> +blowfish-cflags := "-ffreestanding -nostdinc
> -I$(XEN_ROOT)/tools/firmware/include "
> +blowfish-cflags-x86_32 := "$(blowfish-cflags)
> -mno-accumulate-outgoing-args -Dstatic="

What this does is request the shared (between 32- and 64-bit)) flavor to
be built differently, with the options "-ffreestanding -nostdinc
-I$(XEN_ROOT)/tools/firmware/include". And then the (kind of) nested use
of double quotes in blowfish-cflags-x86_32 ends up asking for several
32-bit flavors: One with -ffreestanding, one with -nostdinc, one with
-I$(XEN_ROOT)/tools/firmware/include (which is what causes the
strangeness you saw), and the pre-existing one with
"-mno-accumulate-outgoing-args -Dstatic=".

Every set of options grouped together by double quotes (or any unquoted
option) designates a flavor (while the quotation isn't meaningful to
make aiui, its use is in a shell construct, where those quotes play
their usual role). That is,

blowfish-cflags := ""

designates a flavor without any special options. What I understand you
want, though, is to have these flags passed to all of the blowfish
flavors.

What complicates things slightly is that the first of the options names
the flavor (i.e. prior to your change, but with my APX changes in place,
we have

blowfish_x86_32[]
blowfish_x86_32_mno_accumulate_outgoing_args[]
blowfish_x86_64[]
blowfish_x86_64_DREX2[]
blowfish_x86_64_mapxf[]

resulting from

blowfish-cflags := ""
blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
blowfish-cflags-x86_64 := "-DREX2 -Dstatic=" "-mapxf -Dstatic="

. I think you can see now how the compiler ends up choking on

blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]

.) Surely we could accommodate for the added options by changing the
references from test_x86_emulator.c, but maybe there's a better way
(and also potentially useful for other test blobs going forward),
modifying the .h generator rule(s):

		$(MAKE) -f testcase.mk TESTCASE=$* XEN_TARGET_ARCH=$(arch) $*-cflags="$$cflags $($*-cflags-common)" all; \

and then the needed addition simply being

blowfish-cflags-common := -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include

Entirely untested, though, for now.

However, further: The freestanding-ness does apply to all of the test
blobs, doesn't it? Why don't we alter

CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)

in testcase.mk to become

CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
CFLAGS += -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)

(which doesn't appear to become dependent upon anything we don't already
have available in this file, i.e. in particular $(XEN_ROOT) is already
used elsewhere), seeing that -ffreestanding implies -fno-builtin?

>> blowfish.h:617:99: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or
>> ‘__attribute__’ before ‘/’ token
>>   617 | static const unsigned int __attribute__((section(".test,
>> \"ax\", @progbits #")))
>> blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]
>> = {
>>      
>> |                                                                                                  
>> ^
> 
> and at this point I've got completely lost in this build system.  The .h
> generation seems to loop over each cflag, and while that looks plausible
> for vector generation, I can't see how it works (except by accident) for
> blowfish.
> 
> The problem is the generation of $flavor, but this logic is completely
> opaque.

Can you suggest how to achieve the same in a less opaque way? (Surely it
having grown over time has made quite a bit worse what may have been
okay-ish in the beginning.)

Jan

