Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CD819B62
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657517.1026404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsrD-0007uz-Be; Wed, 20 Dec 2023 09:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657517.1026404; Wed, 20 Dec 2023 09:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsrD-0007rz-8z; Wed, 20 Dec 2023 09:27:15 +0000
Received: by outflank-mailman (input) for mailman id 657517;
 Wed, 20 Dec 2023 09:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsrB-0007rq-RV
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:27:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d3e130-9f19-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:27:12 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c69403b3eso54750325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:27:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be8-20020a05600c1e8800b0040b397787d3sm6924381wmb.24.2023.12.20.01.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:27:11 -0800 (PST)
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
X-Inumbo-ID: f4d3e130-9f19-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703064432; x=1703669232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mfmr6IYxkrkStctDq36+a6nwbA62yc61JVfqmS8QJ4s=;
        b=fVkSnGKg5VoP8zJUo95uX2JfnC9l/7M4RITerM8w/0oHpaR8vWf00MvPKQLRQFvLZx
         ywuAH1/U6ZigIpoZF6YGKb4A7XwNPESUxrsQDh0rN0Doptq/oUfedBR1lb8XOTaBC1vH
         xtU6vBOYzO2NyCrww7cbuncp6JTJIDCQ2R3vKlGyKlzzNfwt2mVf3rHQBXt7lOmDAw6C
         RL76yqdg4ziKPVg/tntYqZREdAw2zqRRXCozYjvI5kBUQXN/gQ8lSq4n+KT8STUWXTKM
         hMDbjFKwVDsrV8EM16dYMzRf7xmxnTM1qO/NjZE+8W3MOg+S9WYqwoSLAwRIHe/opWKm
         CVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064432; x=1703669232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfmr6IYxkrkStctDq36+a6nwbA62yc61JVfqmS8QJ4s=;
        b=gFXdiHpcu0KUXxYNZNSR3j/u1gyz+X3+68nrz3eioN65xxpDwa9TU0fAEobxWX/irG
         /hL4IO5SJ73a8B9JUqo+Gzo+KIdh/WJJ+zMkstHcrDB8IfJdRGeiN3C+RjWATjhQXtyn
         DsxRzOa6Yt4s5AfTQvPZv2HIUfPBuKlPPqo8ZsmNgf17oi8f1WYMP5CHDeJsZTcXs9jM
         kSuBt5qyh1PjAs9cyD5JPBqJwyBPdRUelnjVMQsKJ21xmC97lMjm541eGX1XR9O90tbZ
         8lMEqpFM8MkquUd2K0KC4vNz9YtvzhXkHR0h77CYe6CU4cAXSP1Rv0UaYKt7kPWv8Tw4
         b2cg==
X-Gm-Message-State: AOJu0YwxuTfsopzRW6K1C9uI5IU5CNbGlNu1wZp2+mfCMNV7HGRmvFeE
	WywtS+AixlEWHChRToglZj7j
X-Google-Smtp-Source: AGHT+IHBH5fektALSzlEV7JYSw6W87umQaeB+QQl09CpeA6D8PCFKQ1kQEA1sFkKIRc6JHksA55oNA==
X-Received: by 2002:a05:600c:458e:b0:40c:6b61:56b6 with SMTP id r14-20020a05600c458e00b0040c6b6156b6mr4222881wmo.40.1703064432171;
        Wed, 20 Dec 2023 01:27:12 -0800 (PST)
Message-ID: <923ddcfc-2dfd-4639-9e5c-7ad250fa1a21@suse.com>
Date: Wed, 20 Dec 2023 10:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com> <ZYKvFUICQ4pKwH0S@macbook>
 <91390df2-57f7-41b7-a1cc-a050d89e5219@suse.com> <ZYKzJeiOLOW5mcF_@macbook>
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
In-Reply-To: <ZYKzJeiOLOW5mcF_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 10:25, Roger Pau Monné wrote:
> On Wed, Dec 20, 2023 at 10:12:15AM +0100, Jan Beulich wrote:
>> On 20.12.2023 10:08, Roger Pau Monné wrote:
>>> On Tue, Dec 19, 2023 at 08:31:29PM +0000, Andrew Cooper wrote:
>>>> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/include/asm/test.h
>>>>> @@ -0,0 +1,30 @@
>>>>> +#ifndef _ASM_X86_TEST_H_
>>>>> +#define _ASM_X86_TEST_H_
>>>>> +
>>>>> +#include <xen/types.h>
>>>>> +
>>>>> +int test_smoc(uint32_t selection, uint32_t *results);
>>>>> +
>>>>> +static inline void execute_selftests(void)
>>>>
>>>> IMO run_selftests() would be better, but this is already not all of our
>>>> selftests, and this particular function really doesn't warrant being
>>>> static inline.
>>>>
>>>> But I'm also not sure what this is liable to contain other than
>>>> test_smoc() so I'm not sure why we want it.
>>>
>>> This was requested by Jan, he was concerned that more of such tests
>>> would appear.  It's new in v4 IIRC.
>>
>> If the two of you want it without such a wrapper, so be it. I will admit
>> I was a little puzzled to find it implemented as inline function, but I
>> didn't see a strong need to comment on that.
> 
> It felt a bit misplaced to put such generic selftest function in a
> smoc.c file, and I didn't feel like introducing a new test.c file just
> for that.  I don't have a strong opinion however, if you think it's
> better to go in smoc.c I'm happy with that.

My view: smoc.c would be wrong. Then it's better to have no wrapper (for
now).

Jan

