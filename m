Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD483A7B0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670937.1044036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbMh-0002KX-DH; Wed, 24 Jan 2024 11:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670937.1044036; Wed, 24 Jan 2024 11:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbMh-0002Hr-9t; Wed, 24 Jan 2024 11:24:19 +0000
Received: by outflank-mailman (input) for mailman id 670937;
 Wed, 24 Jan 2024 11:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSbMf-0002Hj-DQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:24:17 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac1a337-baab-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 12:24:14 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so71166771fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 03:24:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d93c8000000b007bf3754d792sm5805294ioo.19.2024.01.24.03.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 03:24:13 -0800 (PST)
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
X-Inumbo-ID: 1ac1a337-baab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706095454; x=1706700254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJfAhozIe2Qfgu7v5+3FdteMLGp5lcfWvVXRPI2E/EU=;
        b=YgAearmT4r2mkmebg3pgcE9VWvvyfvcFGW68xSZA13ijhil3UDt5x2sR6nwJ92y7w6
         C8RIo0fPDnY+72T/sRZrFpOeseRUduh0sKBp2gLOQ9rWgAj0LMoPHR0UIqAG3abTnAok
         BZMvEf2idGhcu902p5UZ7LlPZDpl8SQr8WDWyFl+3nfvPCUiFWt7AhN/pj9z+2wJisB7
         9s9KgAW4aCC3N2KO4qDmxWanoMFiB6Fs1EYF0XJtsu8Ygl1gqoKAqhMskSuFFx/tDL46
         BWGjMkH6D7cZmEtSaE/Muk+5emBwLvzqt8ngyZDkM5XADuArfjQzd324mHL6axBOScOg
         HEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706095454; x=1706700254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJfAhozIe2Qfgu7v5+3FdteMLGp5lcfWvVXRPI2E/EU=;
        b=luSmfELKTeljqHUU37kEIde1pdekMKyfObAe0Viq+p+oSJjzgNr3N3KZUleHmkCDRs
         ezOGTdPTPCPEWkYY7Ra2zl4lXUvRdvmVM2xticZRcCQse0yTziwUfyjvy0xdifA7MSob
         w8wF0+uZ+cNRTO1nLagsY4m9XhjDpMJsrUL4VuNUwlk9t0hJ9WvOrNsVREBjeCbvWqSE
         mFt239wPMRc0r+LgAEJHEhTfBj2tyhvF6rJ8N+d+Ko8AKu0RKay74CESwYu2aAo4WGIc
         4lHUtBSj3LE6PNZtFIYfaSc/X5HMH348+PzdImR1jhgm1zVSlpsvHAEiFVPnkEtKiKeD
         CSgg==
X-Gm-Message-State: AOJu0YwkqvwQdyvv+e5Hh7zzESokLiVeDz/nHCMoAjukAydQlx1mqfJY
	JE0/oTDGxDt1YmXUSbesMHja1DZOYfFhKcSsMesR7pu7BFMhCBA2TSCY2iUswA==
X-Google-Smtp-Source: AGHT+IG3dNcPGZI83FtLzwlfLj1aaPOlM058dL4mPysFwfmuR7ER+sEnxIInVsuWHXFEIuxRtndU7A==
X-Received: by 2002:a2e:99d1:0:b0:2cf:473:b182 with SMTP id l17-20020a2e99d1000000b002cf0473b182mr832268ljj.0.1706095454245;
        Wed, 24 Jan 2024 03:24:14 -0800 (PST)
Message-ID: <b7c58adb-f3e2-4089-bba4-3f7f0740f111@suse.com>
Date: Wed, 24 Jan 2024 12:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
 <2974faee197b0a60d6e7ac54356639706c2ecb43.camel@gmail.com>
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
In-Reply-To: <2974faee197b0a60d6e7ac54356639706c2ecb43.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 10:34, Oleksii wrote:
> On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
>> On 23.01.2024 13:34, Oleksii wrote:
>>> On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
>>>>>  config GENERIC_BUG_FRAME
>>>>>  	bool
>>>>>  
>>>>> +config GENERIC_FIND_NEXT_BIT
>>>>> +	bool
>>>>
>>>> There's no need for this, as ...
>>>>
>>>>> --- a/xen/lib/Makefile
>>>>> +++ b/xen/lib/Makefile
>>>>> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
>>>>>  lib-y += bsearch.o
>>>>>  lib-y += ctors.o
>>>>>  lib-y += ctype.o
>>>>> +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find-next-bit.o
>>>>
>>>> ... you're moving this to lib/. Or have you encountered any issue
>>>> with building this uniformly, and you forgot to mention this in
>>>> the description?
>>> I didn't check. My intention was to provide opportunity to check if
>>> an
>>> architecture want to use generic version or not. Otherwise, I
>>> expected
>>> that we will have multiple definiotion of the funcion.
>>>
>>> But considering that they are all defined under #ifdef...#endif we
>>> can
>>> remove the declaration of the config GENERIC_FIND_NEXT_BIT.
>>
>> What #ifdef / #endif would matter here? Whats in lib/ is intended to
>> be
>> generic anyway. And what is in the resulting lib.a won't be used by
>> an
>> arch if it has an arch-specific implementation. 
> If what is implemented in lib.a won't be used by an arch if it has an
> arch-specific implementation then, for sure, I have to drop
> CONFIG_GENERIC_FIND_NEXT_BIT.
> But I am not really understand if lib.a is linked with Xen, then it
> should be an issue then if some arch implement find-next-bit function
> we will have to multiple definitions ( one in lib.a and one arch
> specific ). Probably, I have to look at how it is done.

You're aware how linking works? Objects are pulled out of archives only
if there's no other definition for a to-be-resolved symbol provided by
a particular object in the archive.

>> Problems could arise if
>> an arch had an inline function colliding with the out-of-line one.
>> But
>> that's about the old case where I could see a need to make the
>> building
>> of one of the objects conditional. And you'll note that withing this
>> Makefile there are pretty few conditionals.
> Could you please clarify What does it mean "out-of-line" ?

"not inline"

>>>>> --- /dev/null
>>>>> +++ b/xen/lib/find-next-bit.c
>>>>> [...]
>>>>
>>>> I was going to ask that you convince git to actually present a
>>>> proper
>>>> diff, to make visible what changes. But other than the
>>>> description
>>>> says
>>>> you don't really move the file, you copy it. Judging from further
>>>> titles
>>>> there's also nowhere you'd make Arm actually use this now generic
>>>> code.
>>> I wanted to do it separately, outside this patch series to simplify
>>> review and not have Arm specific changes in RISC-V patch series.
>>
>> Then do it the other way around: Make a separate _prereq_ change
>> truly
>> moving the file.
> So this one patch should be separated by 2? One which moves find-next-
> bit.c from Arm to xen/lib, and second where xen/lib/Makefile is
> updated.

No, that would break the Arm build. I suggested breaking out this
patch from the series, and then doing what the description says:
Actually move the file. I don't think I suggested splitting the
patch. Even the breaking out of the series was only because you
said "I wanted to do it separately, outside this patch series".

Jan

