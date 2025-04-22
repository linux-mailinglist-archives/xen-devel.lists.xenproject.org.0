Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A66FA9638E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 11:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962291.1353503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79bS-0001KW-FO; Tue, 22 Apr 2025 09:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962291.1353503; Tue, 22 Apr 2025 09:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79bS-0001IE-Cf; Tue, 22 Apr 2025 09:07:42 +0000
Received: by outflank-mailman (input) for mailman id 962291;
 Tue, 22 Apr 2025 09:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u79bQ-0001I8-4d
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 09:07:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4e7448-1f59-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 11:07:37 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso40211805e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 02:07:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4930e4sm14534397f8f.73.2025.04.22.02.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:07:36 -0700 (PDT)
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
X-Inumbo-ID: 3c4e7448-1f59-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745312857; x=1745917657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q83YwY7BjNLqZmGvYnsKuRIjQV/SXdEW6KJv9xbE8oM=;
        b=B2yQjhcw62j6UrqH60RXkN9ZPidmyS6qZJcf/H4ZGbIwNGfFaldomHtnsdp8mqja7F
         jTl6QhEgMtWL3eZI2a45oZfluuEOh3F4bdR95w3R8uB7Ozld62PcFGFAdClfFSBMYh2l
         sS1CkARndtUfu+k5mi/IaC3FxvcR1rDf4yuNZvlXHlWnyUVY6EBaL+eW5tI4Qtk700RL
         BO0ASdlzCX+Xe8wivgwxzBr3V1fHrTAP23yNTvE9ivD3BJQedRxj0nbnKVS55msBnVgY
         J1eOJY3Ek1+LTosqnS6cklWrCfovHyOFRBWkpPByGVg8EeaIpBYXY0Wmeu3PXvZNZK2Y
         QiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312857; x=1745917657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q83YwY7BjNLqZmGvYnsKuRIjQV/SXdEW6KJv9xbE8oM=;
        b=scGbSggSdDSuHhbWQHaCpfdTpF4/Vmz+92Ilq68wtaN5naLGdk+Z9jdLdKTANhsXHd
         xKjxO9P+GO5mFMXYfqgHN11SkP7OXwshJuebOaJiKx2NjmtvgZSF4yxcLv/1KQiLnk0+
         VgirbQR56umIkCufL722y7bNao4zI24x+TL6FTL24FcHWSbPFqxWxQtP4Y92R3qCiMPg
         ZPaDn10U93Qv2gk3UaiS7nftKRsZUiim7Kwko9wF2NUTrhH3/KLuGjr9rt46k9OlQjfA
         y4HGkw+GqtPvuZXtvuHi9Lv6jmovVgXBWc+SUrMEXpsmT1Q2W/MbHBQK3TXb62lwdlGO
         8cYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWpfN4HVAYZP/3ZqYKkPJ91OuzkNfG7nCtkF1YwhO3SDVdACfjneZZqcUZrZ+bI7VyAqMlwaRKiJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAA+gnRUJHNTpK/DkCALx1iuuc3Ec30XremPgqcn+46e078rNF
	+OqPmx0iAEiU2jhQW6mY4RwyhlX444VMmUkeAJNysIAf4XhQ3y+C5RkQCisfsw==
X-Gm-Gg: ASbGncsiqN1Dgkl/5ihb4Anm3EGQ0e19Q07azEbYR78qV+0Bg9rp3mUV9RK26OSDS5X
	UPUPaCo6tYWOKyy+cAZixIPLWM8ACZX9ABeE6gieoMugr/yt1QJgMqZPttQ+GzF7jpix0fq8JWU
	NnnXfoPVWmS/Dd44FmvgoIm32wD9DrGb5QhF3OR4hIRS5qPBsR5D9JdyaJV9t2pVDcfYKJ6b7u/
	dCrshOZSdaSulU41cgYeC1Vw4rPAgUG4yAoJXVXr0jnaLqHeD++kfcRIWdcanspNyudiVmYRXIM
	5KQKKIGaOsj5LlBCCXDxlGxC4evlDOKZj1gXiSNxJEJ5AKBChjPW+igQJEb3o22nqeUlsY7/Bv2
	t6WYJC9N6eO2c5SOO2as5B8KNkOXSw87uCHK1
X-Google-Smtp-Source: AGHT+IE1aAPLWmJMOMYzPAlPrNvW9KoMmrrOHg/u5UnT/szAx1Qfy3n+aKXE6G+pv3GEcMX8vOw29g==
X-Received: by 2002:a05:600c:3c9d:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-4406ab676fdmr129403525e9.4.1745312856840;
        Tue, 22 Apr 2025 02:07:36 -0700 (PDT)
Message-ID: <7794150f-4a43-4ec8-bd9e-ee439cbf722c@suse.com>
Date: Tue, 22 Apr 2025 11:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/AMD: Convert rdmsr_amd_safe() to use asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250407153510.1863243-1-andrew.cooper3@citrix.com>
 <1df6b4c9-7309-49cd-8046-019d94139c57@suse.com>
 <06c64f49-a70e-48c3-8480-f2ed9ac4a001@citrix.com>
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
In-Reply-To: <06c64f49-a70e-48c3-8480-f2ed9ac4a001@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 19:24, Andrew Cooper wrote:
> On 07/04/2025 4:48 pm, Jan Beulich wrote:
>> On 07.04.2025 17:35, Andrew Cooper wrote:
>>> Unlike the WRMSR side, we can't use asm goto() unconditionally, because our
>>> toolchain baseline doesn't support asm goto with outputs.
>> Is there actually a benefit we gain from now needing to maintain two different
>> pieces of logic fulfilling the same purpose?
> 
> IMO, yes.  Besides getting rid of .fixup/unlikely, the code generation
> is better-enough to warrant it, including getting the common path
> correct (the referenced labels are all considered cold).
> 
> e.g. for this change, we go from:
> 
>     xor    %esi,%esi
>     rdmsr
>     test   %esi,%esi
>     jne    <init_amd+0x540>
>     and    $0xfffffffe,%edx
>     wrmsr
> 
> (note the forward branch) to simply:
> 
>     rdmsr
>     and    $0xfffffffe,%edx
>     wrmsr
> 
> because the exception table redirect is directly into init_amd.cold, and
> we don't have to hold `int err` in a register across the asm() block.
> 
> This is an intentionally simple example to get the infrastructure in,
> but vmread() will definitely benefit.
> 
>>
>>> Also, there's a different errata workaround we'll need if we want to use asm
>>> goto() with "+" constraints:
>>>
>>> config CC_HAS_ASM_GOTO_TIED_OUTPUT
>>> 	depends on CC_HAS_ASM_GOTO_OUTPUT
>>> 	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
>>> 	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
>>>
>>> I'm tempted to put it in straight away, lest we forget about it.
>> Perhaps best if we really want to go this route. Yet then - why "TIED"? Isn't
>> "tied" the term they use when referring to an earlier operand by using a
>> digit (or the operand's name in square brackets)?
> 
> This is straight from Linux.  I've not looked at the issue in detail.

So what I see is that Sean in Linux commit 1aa0e8b144b6 uses this term also
in the description. I'm unconvinced it's correct, though. Gcc doc doesn't
call the "+" modifier anything special, and it calls the numeric constraints
(for which "+" can be a shorthand in certain cases) "matching constraint".

We can of course sort the naming in the eventual patch pulling in that
behavior, yet I'd like to suggest already now that we don't blindly follow
Linux'es naming (unless the choice can be backed by some doc reference).

>>> --- a/xen/Kconfig
>>> +++ b/xen/Kconfig
>>> @@ -41,6 +41,20 @@ config CC_SPLIT_SECTIONS
>>>  config CC_HAS_UBSAN
>>>  	def_bool $(cc-option,-fsanitize=undefined)
>>>  
>>> +# Fixed in GCC 14, 13.3, 12.4 and 11.5
>>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
>>> +config GCC_ASM_GOTO_OUTPUT_BROKEN
>>> +	bool
>>> +	depends on CC_IS_GCC
>>> +	default y if GCC_VERSION < 110500
>>> +	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
>>> +	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
>> Unlike for pre-release versions (x.0.y) I view this as problematic. Distros
>> are likely to have backported the fix before the minor releases took place.
>> Or they may have backported without ever meaning to follow later minor
>> releases. We'd needlessly exclude them here. Imo ...
>>
>>> +config CC_HAS_ASM_GOTO_OUTPUT
>>> +	def_bool y
>>> +	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
>>> +	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>> ... the only option is to actually probe for support as well as the (non-)
>> buggy-ness.
> 
> There is no sensible way to probe.  It compiles fine, but (AIUI) fails
> to spill registers correctly on some paths, which also makes it very
> sensitive to other optimisations.

Hmm, okay, Linux commit f2f6a8e88717 kind of suggests that there might have
been more issues in gcc. Really I can't help the impression that the issue
still wasn't fully understood, and hence may re-surface in another context.
In which case I guess I agree the above is the best we can do for the time
being, until we learn of further breakage:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

