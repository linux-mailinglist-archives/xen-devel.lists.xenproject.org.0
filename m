Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84CA049E2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 20:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866774.1278136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVEvq-00064X-16; Tue, 07 Jan 2025 19:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866774.1278136; Tue, 07 Jan 2025 19:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVEvp-00062y-Ug; Tue, 07 Jan 2025 19:08:01 +0000
Received: by outflank-mailman (input) for mailman id 866774;
 Tue, 07 Jan 2025 19:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3tJ=T7=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1tVEvn-00062s-Go
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 19:07:59 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b480b8fc-cd2a-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 20:07:58 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so1844634966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 11:07:58 -0800 (PST)
Received: from ?IPV6:2001:4ca0:0:f293:dc1b:7733:c3ba:a819?
 ([2001:4ca0:0:f293:dc1b:7733:c3ba:a819])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06f942sm2417988166b.200.2025.01.07.11.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 11:07:56 -0800 (PST)
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
X-Inumbo-ID: b480b8fc-cd2a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1736276877; x=1736881677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bkoF/hEVvzmuCx8cR5sDAI5/4lVkCzfNCbXRNqr7pQM=;
        b=XpWy+1d7/MCIDteqy6AiEgDXvU9PWrXlf+txtW0GOdFWFL744jisZgyp064mtLR05Y
         tnpJ7QPVhr2PclGUe9MRtjExjp0PEHmOpTWMqT+aA07UwDc8QqyN+svzM9Ebe2RXyLPE
         v1D3B2+z7OS6yUU//P5ZYa1S/dVb7vmeuLo3meJxn5tkP/8ccET5b+3trm6sh/tumKfR
         X7vDYP2ict7V+treyhZtE3VXa4WYnKXiu2recLi0t47jxiTPeB3COMr/ri8H0nqq75/6
         DmIUg6e+Kw5LSXomGFOnjB/Ugfz3PohoWVDspgfKw86cPNe9tNXxEjcDCKWr2GiQj9YW
         11OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736276877; x=1736881677;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkoF/hEVvzmuCx8cR5sDAI5/4lVkCzfNCbXRNqr7pQM=;
        b=vNQqY3rRn0JPUBfxCW3vhCwwWu8oosobOQCg1BF7Ft1voeQauH2cfERb9Du8etzBlX
         Yo3Zs9RVEMdnKxAbaBAyNFhlkt0lelBI5+2VKfl+bZ2RwWeCFrvvqLD8KVKz+3F25jBV
         eYkmlwl9206DqSABOHYa5/xM3nhlEVxquheC2n+m8OVBfNJn857WzaVC2+cpwTRGUXBz
         WzmRfIIMFDXcpJVns9kWgWWBl99Eui/1xXj0MXBlYKoIhJ3vQYJQEyR+cz0ahQDDClo0
         pl+ZQpFp1HXeaEIw1VmpiUUqqSPUrQwjTJ8b+9x+RLym9Xw8ZWCIsgLmNIeEkGeP3k93
         UN8w==
X-Gm-Message-State: AOJu0YwMCVB9n87wKTlwMi08yL5GuaCRuCwrT4ucAozEgx62hapAeFrq
	XwfvkbGIN/3ATLJ7or4cJDjLXNYv35ehniXJDjuSetYmaNAAZVRD6g4O4+1crao=
X-Gm-Gg: ASbGnctdlxDkqbSnkXPrwr5EGwZLUdlLai7T1ITni6Ok6L549ajHr1he41ge21UKn+u
	dkqeN5Fo59RBDS3w3i71OwRj1+H2qZsYyNPxTrKwPBtJu4fTOt8x8T9F/scPI8LdaGQk+owO+9M
	bBR5GEIjkVTjt6+4t15EXf5amaPIzElVuLaE2wIFz2ZHxPHtYyyICatpw2Uw6GHitdxIRQOXstX
	8HqCnOY/ODiwtnVBmDOW7lH+/e/qy3RuffbiTpavAo0hAE1j/mTwMau1csW/Lxu/poKG6yONyF+
	TYRwv9Hh40+a5w0dqZ4dHkjKkUFEUbvPSNhPXA==
X-Google-Smtp-Source: AGHT+IGxh1pDxjCQCR6bE0+bCWBxBQBcDW2bDkXvRJJRJf/e2Jnlo+GAfEhEz9GE/UVg7DIdr1KuaA==
X-Received: by 2002:a17:906:6a28:b0:aa5:391e:cadf with SMTP id a640c23a62f3a-aac334f637fmr5316228566b.42.1736276876642;
        Tue, 07 Jan 2025 11:07:56 -0800 (PST)
Message-ID: <26a19781-d36c-4f88-8b45-27385d7606a3@minervasys.tech>
Date: Tue, 7 Jan 2025 20:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring
 support for Xen image
Content-Language: en-US
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
 <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
 <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
 <6a0a096b-47c2-4568-be9f-9f230bc6df23@suse.com>
 <0231325c-13f2-4b0b-a928-4ba249e4c560@minervasys.tech>
Autocrypt: addr=andrea.bastoni@minervasys.tech; keydata=
 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
 Id5SuAU=
In-Reply-To: <0231325c-13f2-4b0b-a928-4ba249e4c560@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2025 18:13, Andrea Bastoni wrote:
> On 07/01/2025 18:01, Jan Beulich wrote:
>> On 07.01.2025 17:51, Michal Orzel wrote:
>>>
>>>
>>> On 07/01/2025 17:42, Julien Grall wrote:
>>>>
>>>>
>>>> Hi,
>>>>
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

But in this case I can confirm what Michal reported:

> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 26361c4fe4..c1efa1348a 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -171,8 +171,6 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
>       */
>      update_identity_mapping(false);
>  }
> -#else
> -void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
>  #endif
> 
>  void __init switch_ttbr(uint64_t ttbr)

When compiled (aarch64-linux-gnu-gcc (Debian 10.2.1-6)) without LLC_COLORING: compiles, does not result in undefined symbols, and relocate_and_switch_ttbr() is not present in the object 

Thanks,
Andrea

