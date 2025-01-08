Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18CA0549A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866909.1278287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQYb-0005Be-9t; Wed, 08 Jan 2025 07:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866909.1278287; Wed, 08 Jan 2025 07:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQYb-00059p-5v; Wed, 08 Jan 2025 07:32:49 +0000
Received: by outflank-mailman (input) for mailman id 866909;
 Wed, 08 Jan 2025 07:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVQYa-00059I-G6
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:32:48 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c8c68f-cd92-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 08:32:47 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so337991f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:32:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm51448705f8f.102.2025.01.07.23.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:32:46 -0800 (PST)
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
X-Inumbo-ID: c1c8c68f-cd92-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736321567; x=1736926367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pkcb3+a5dJ29hweFXCoRH2W/v3k+pj4cykKr3EYZ95k=;
        b=R3WRGpNjGIfch7Xzqo4ekdGDJlR3eQk7vgn5DNbAsa9W2+p9lyWjKKh3bLwXZrXh+4
         2LHFevgOFRhyKZI/Olp8LZwwhCNL8dGQDoCuSAcptwJYeDfVz0goB68U5t69LVHsSj10
         tMHNyvttq/NDjn+9TgEYFv8ygbLOvDxoQo3ePmbXzU6J4m0aIMm2WvP/rxg4zR8snlbP
         bhWl3trD3uBI1kk3kRatP5oPjsOThOLdQCoIoJ3U5Mql/xklZ5/N1DfJWXuVDtLHag/z
         rSZozeeSoOKTqI3Q9TEh3nA032xeRC+ghlCyvzz4gvxzP1RM1N7Oz/JZ1H8ELSyFePLf
         UzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736321567; x=1736926367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkcb3+a5dJ29hweFXCoRH2W/v3k+pj4cykKr3EYZ95k=;
        b=thIQAIweWqPgqufQaAbd8WtRohzif9shrvH1apHjFA9oTDwxZ5LlDp2fR/8815GJre
         XrecORHpSOsFK6ipqCJ7SKu9+WkqPs9Xi6bOty+6ZdqbfBwwinjy0iDE+rEetYBwYKje
         UWviaf9tuLwpioJ5oX0u0BnXG3sOCvXtvJfgIX6xi50TMJEPWndVfZZSEYL4STixr5C6
         YtAMFdo0T/I6aEC5eIvXeay5ySPkoZb7F+3TSkfhLUKkrR1HyOD7sunRm0twpmkJs6ap
         T30NZW0oPHcshc0ZKJIB00m/0DsWPOeS7MM9dnD56E7Q61LmFIveKfZweYzLp/g/yV9S
         HBiQ==
X-Gm-Message-State: AOJu0YwnWd/foXzPxm9/r3ltvo4OLvpJCiS5/PWKMG8OnEWKQj6cuPaH
	8S8PrRnDjVLCMNPaupmEtIntfHc6sMVOoYsVNK7UjXFWa8iXADodc16B2PFKxw==
X-Gm-Gg: ASbGnculIOdauBBlDaZXpORLHW1NKrym9pQvmqfflCBbbylRMk6ND+2/WOFEZUcxuqP
	cJGBbC3suvkCrHRhgF6YBoRjBr5IaaFJTPJLxb4ohX1WUmsx/hcbUbGTiwTqBsPPZeUfIJVdsfB
	76T9jh9uFhClmEgXbmAgTZLAw+S1YEtFEGn1aUphv4xYp+GNLkWiaNHZ5nwXimacbm0r16eS+n0
	arz9RlSKN/pE8h8YOnkQ+MiUHZVsqwY+WlwchyRLLDBQ4R+2E5fvm6+F+NqNTFEl1O1QkvYaaV8
	R1Kyd7/sb4Qw2P/qiSttRpnDAaZXCCY0ePOSZNYMMA==
X-Google-Smtp-Source: AGHT+IExbjFXqZYAf4qQCiviOiPO6MJjjSeFA8OHrLDAA3gHukLDPKYu4JdTxgj1iUvjaU+nw+9cwg==
X-Received: by 2002:a5d:64ac:0:b0:385:ef14:3b55 with SMTP id ffacd0b85a97d-38a85f4eecdmr1385607f8f.19.1736321566661;
        Tue, 07 Jan 2025 23:32:46 -0800 (PST)
Message-ID: <736dbd5d-62f7-41aa-a24a-2f08cc2f21fe@suse.com>
Date: Wed, 8 Jan 2025 08:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring
 support for Xen image
To: Andrea Bastoni <andrea.bastoni@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
 <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
 <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
 <6a0a096b-47c2-4568-be9f-9f230bc6df23@suse.com>
 <0231325c-13f2-4b0b-a928-4ba249e4c560@minervasys.tech>
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
In-Reply-To: <0231325c-13f2-4b0b-a928-4ba249e4c560@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 18:13, Andrea Bastoni wrote:
> On 07/01/2025 18:01, Jan Beulich wrote:
>> On 07.01.2025 17:51, Michal Orzel wrote:
>>> On 07/01/2025 17:42, Julien Grall wrote:
>>>> On 16/12/2024 14:36, Jan Beulich wrote:
>>>>> On 16.12.2024 15:28, Carlo Nonato wrote:
>>>>>> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>>>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>>>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>>>>>> @@ -1,6 +1,7 @@
>>>>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>>>
>>>>>>>>   #include <xen/init.h>
>>>>>>>> +#include <xen/llc-coloring.h>
>>>>>>>>   #include <xen/mm.h>
>>>>>>>>   #include <xen/pfn.h>
>>>>>>>>
>>>>>>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>>>>>>   }
>>>>>>>>
>>>>>>>>   extern void switch_ttbr_id(uint64_t ttbr);
>>>>>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>>>>
>>>>>>>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>>>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>>>> +
>>>>>>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>>>>>>> CODING_STYLE: { needs to be on its own line
>>>>>>>
>>>>>>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>>>>>>> be #ifdef protected.
>>>>>>
>>>>>> Here and in other places (patch #8) I'm relying on DCE to remove functions
>>>>>> that are not called. This was a suggestion from Jan in that patch. Can we
>>>>>> adopt the same here?
>>>>>
>>>>> Yet how would the compiler spot that the function is unused? That would only
>>>>> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
>>>>> in question to be static (allowing the compiler to see enough of the whole
>>>>> picture).
>>>>
>>>> Sorry for the late answer. I was away with limited e-mail access. While
>>>> looking what was committing recently, I noticed that a dummy function
>>>> was introduced:
>>>>
>>>> void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
>>>>
>>>> If a function is not supposed to be called, then it should contain a
>>>> BUG_ON() to catch any misusage. Otherwise, this is a recipe for
>>>> disaster. In this case, it would not be trivial to notice the TTBR was
>>>> not switched...
>>>>
>>>> That said I would have actually considered to remove the empty stub. I
>>>> am a bit surprised that DCE wouldn't work in this case because the call
>>>> is protected with "if ( llc_coloring_enabled )". When cache coloring is
>>>> not enabled, this would turn to an "if ( false )" and therefore all the
>>>> code should be removed. What did I miss?
>>>>
>>>> Note that this is what we already rely on for arm32 because there is no
>>>> stub... So if this is problem then we definitely need to fix it on arm32
>>>> as well...
>>>>
>>>> IOW, we either introduce a stub (including the BUG_ON) for both arm32
>>>> and arm64 in the header or we remove the stub completely.
>>>>
>>>> Marco, Michal, can you have a look? Ideally, this should be fixed for 4.20.
>>> I did a test with GCC 13.2 and I can compile it fine with stub removed. That said,
>>> I'm not a compiler expert and I'm not sure if this behavior stays the same with different
>>> compiler options/optimizations. So it's more like a question to Jan. I'm happy either way.
>>
>> We use the same (if(...) func();) in various places, relying on said DCEing
>> of the call when the condition is compile-time-false. I see no reason why
>> it couldn't be used here as well.
> 
> IIRC the point was that his function is extern and DCE as used in other places doesn't necessarily work.

But the called function being extern _is_ the common pattern where merely a
declaration needs to be visible, but no definition (and we specifically have
a Misra deviation to cover this case). If the function was static, no further
provisions would be necessary at all, as then the compiler can DCE not only
the function call, but also the function itself, without any further help by
us.

Jan

