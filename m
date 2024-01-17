Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FEE830740
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 14:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668476.1040724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ6Bf-0000M8-9c; Wed, 17 Jan 2024 13:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668476.1040724; Wed, 17 Jan 2024 13:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ6Bf-0000It-6e; Wed, 17 Jan 2024 13:42:35 +0000
Received: by outflank-mailman (input) for mailman id 668476;
 Wed, 17 Jan 2024 13:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ6Be-0000In-IM
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 13:42:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 434dd71a-b53e-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 14:42:31 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337c5bcf79fso283650f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 05:42:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b0040e77ce8768sm10678109wmr.16.2024.01.17.05.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 05:42:31 -0800 (PST)
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
X-Inumbo-ID: 434dd71a-b53e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705498951; x=1706103751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxbF+vzCDpdp6J+pw4BlS9ANgujZV7xOr5VIt/PUDYU=;
        b=YX61Za6F1oglIQllVMQIkFXJ5r2qtJBJDEoSLSiXs08ODuP43jzMnRLaY8YY+PxKGn
         f15VYhxOhEycL+3DnS5HWBM0CAUNRvIQrsEanKwnnnY53BBy+n+RO9uwii1nhTJ3zDeh
         JOP2P5ReUDgdpwDMvCwMAtVdDKuw9VxUYaQ1I/jTOCp/6v1607BSVKffidYrR7ZHG54t
         diGi/u+Dg+lmCws9gNXLQcfmBHFLA3YET6l39KY+n3nbxMBXtAoy0Svh6eFT62BePyTW
         nnsWMa4K+i+iI/e5TY23MBSGmFEZzUvG6IIkE0OkGltyiqbMddgTaqrR0iSB0nzR7oL1
         aUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705498951; x=1706103751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxbF+vzCDpdp6J+pw4BlS9ANgujZV7xOr5VIt/PUDYU=;
        b=XObPXNVKQRHI2I4OTQraW4yTbb4EhuXAGQnLbpkeG+GWesIl4F8wMq026UfCsHU+AN
         u3v2BJXuPGaeOQc0WtiV/fjF5Fu/XCRo9tk+U37YT+pCZA6Kf696BKShPLVl5Kvry73j
         6XpsiEAdNP+e0dz/vl9tnrLBU1X1ZVyYpnqTJhWvNuXIua7mOOvBeIievR2rzzVD9r+y
         M5CKB0b0j4IN8vtUhoHyIqpKMht545ly2Ps1XeCLMBWFJnTRBMoAHl0zp+XTvZDCZjMS
         ffZMKQhmPLvwQjMYLV4Rdua+5KLpG0yVEN0EyYNnUR56eTBdJ2wyotlWKvQrY8yY96lW
         fF0Q==
X-Gm-Message-State: AOJu0YwJJXyzEBXiUIHprx0u6fb+xNiFVhDeK4pzj95fhE/6+1MFwRCT
	FSbGCpGD2sLZykFmK8lxy6vF+prQ2+va
X-Google-Smtp-Source: AGHT+IEhUjVp2QrYjG59Dp4SEUEFGhrcUwxBeZ+1czrqIiNCBhvpUYchHJXbYi0jsMlrW7TopkBVyg==
X-Received: by 2002:a05:600c:4583:b0:40e:4656:dc2b with SMTP id r3-20020a05600c458300b0040e4656dc2bmr4507412wmo.168.1705498951325;
        Wed, 17 Jan 2024 05:42:31 -0800 (PST)
Message-ID: <23955665-8bd8-4872-a1a5-e3a3711c9512@suse.com>
Date: Wed, 17 Jan 2024 14:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
 <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
 <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
 <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
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
In-Reply-To: <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 12:37, Oleksii wrote:
>>>>
>>>>>> Also you want to make sure asm-generic/bitops/bitops-bits.h
>>>>>> is
>>>>>> really in use here, or else an arch overriding / not using
>>>>>> that
>>>>>> header may end up screwed.
>>>>> I am not really understand what do you mean. Could you please
>>>>> explain a
>>>>> little bit more.
>>>>
>>>> Whichever type you use here, it needs to be in sync with
>>>> BITOP_BITS_PER_WORD. Hence you want to include the _local_
>>>> bitops-
>>>> bits.h
>>>> here, such that in case of an inconsistent override by an arch
>>>> the
>>>> compiler would complain about the two differring #define-s. (IOW
>>>> an
>>>> arch overriding BITOP_BITS_PER_WORD cannot re-use this header as-
>>>> is.)
>>>>
>>>> The same may, btw, be true for others of the new headers you add
>>>> -
>>>> the
>>>> same #include would therefore be needed there as well.
>>> Now it clear to me.
>>>
>>>
>>> It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
>>> BITS_PER_BYTE are defined in {arm, ppc,
>>> riscv}/include/asm/bitops.h.
>>> I expected that any architecture planning to use asm-
>>> generic/bitops/bitops-bits.h would include it at the beginning of
>>> <arch>/include/asm/bitops.h, similar to what is done for RISC-V:
>>>    #ifndef _ASM_RISCV_BITOPS_H
>>>    #define _ASM_RISCV_BITOPS_H
>>>    
>>>    #include <asm/system.h>
>>>    
>>>    #include <asm-generic/bitops/bitops-bits.h>
>>>    ...
>>>
>>> But in this case, to allow architecture overrides macros, it is
>>> necessary to update asm-generic/bitops/bitops-bits.h:
>>>     #ifndef BITOP_BITS_PER_WORD
>>>     #define BITOP_BITS_PER_WORD     32
>>>     #endif
>>>    ...
>>> Therefore,  if an architecture needs to override something, it will
>>> add
>>> #define ... before #include <asm-generic/bitops/bitops-bits.h>.
>>>
>>> Does it make sense?
>>
>> Sure. But then the arch also needs to provide a corresponding typedef
>> (and bitops-bits.h the fallback one), for use wherever you use any of
>> those #define-s.
> Which one typedef is needed to provide?
> <asm-generic/bitops/bitops-bits.h> contains only macros.

A new one, to replace where right now you use "unsigned int" and I
initially said you need to use "uint32_t" instead. With what you said
earlier, uint32_t won't work there (anymore).

Jan

