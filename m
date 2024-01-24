Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E823983A3F6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670754.1043725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYU4-0002aQ-Qn; Wed, 24 Jan 2024 08:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670754.1043725; Wed, 24 Jan 2024 08:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYU4-0002Xf-Na; Wed, 24 Jan 2024 08:19:44 +0000
Received: by outflank-mailman (input) for mailman id 670754;
 Wed, 24 Jan 2024 08:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYU3-0002WM-1j
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:19:43 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5205350e-ba91-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:19:40 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf19f65271so15144491fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:19:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a056e02238300b003628d0476eesm908814ilb.26.2024.01.24.00.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:19:39 -0800 (PST)
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
X-Inumbo-ID: 5205350e-ba91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706084380; x=1706689180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58+NCikL/bQyJl0QckgCyYqs5+fQvIdlAVkDfEwnz6Q=;
        b=KCTA5aWb6cPzZ6HQ9wXhMxket9h9yhqaYIQ+1Ts7vP7E9p2RPVRng8xwE6INWJbtGG
         n6vPkwqLcTOID4T5ym2rkiBRaZYpSuh9vn2WyuzX0EO55TVkTHwi7BOrvmmZckCYl0Cc
         wGEOah7MRn/9lYAupperKuUU5mBoLmRcFshhKd6vtC7wNwRDkRccvHUFJwbw2wIdsB6p
         rDiJEDsos4rqZr5STWU2cEKlszmXjomakzX/9CFAwA9B9pX8Ivr6t1dPQ1PW4vTSxhoh
         kFZe6PM+Jjzp9gZhkOguXReiVdg9gWzRyIw7nyCFw/cgzvofvY+CiiXBAefublDR8OCp
         nq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084380; x=1706689180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58+NCikL/bQyJl0QckgCyYqs5+fQvIdlAVkDfEwnz6Q=;
        b=LAteiyYS36vbmIb6ajZTzjZUKX6VSTwrfyqzAbllC3YUBbME91Yg+g8YeCy8Vnly/J
         T+ueAmrWyYL0CLMuXQ850B7h/upYXiBeE1OKrT+agxmpfaOuN/2qAEM7WzAF22uKH5Fw
         Ivfe3u99n2f3CpIlMwb2jwwDuI33gzKN6/v0woAIvpdRdFDW9F8wbVE3jyL6fPIwjCP1
         nRXb7QD7egRFvLLPaCiIfQnIg/eJTg+bibSyXQvZU0q0XYWuGUMqYzA+abgtKmCQzx7m
         xXardnkRQ4VhI9Yg+8nt0Ldk7fdVMXLkwygsOkPl3JO2TQEf7p0V/Gya8kZrB5KnT958
         kszw==
X-Gm-Message-State: AOJu0YzIVMXc8p8VZYODWggVi3u0CAdns08vA0ZCFGfqTOP85GozISCV
	idlZGCCtmvzFG4xnGVxfDnNJzXSz6Qy3AVqeBGdNFJF8eWDgy/GwOT6CC93tqg==
X-Google-Smtp-Source: AGHT+IGjVjzhcgct+KVK1uT5HXAz901I0B9Ziif64Uhol1niDNB07qUss5SwfKlOicfmYDz+LE2eqw==
X-Received: by 2002:a2e:9c96:0:b0:2cd:ac43:b1e7 with SMTP id x22-20020a2e9c96000000b002cdac43b1e7mr569300lji.106.1706084380007;
        Wed, 24 Jan 2024 00:19:40 -0800 (PST)
Message-ID: <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
Date: Wed, 24 Jan 2024 09:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
 <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
 <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
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
In-Reply-To: <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 18:08, Oleksii wrote:
> On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V3:
>>>  - Update the commit message
>>
>> ??? (again)
> The same as with previous. asm/processor.h was changed to processor.h
> 
>>
>>> @@ -53,6 +56,18 @@ struct cpu_user_regs
>>>      unsigned long pregs;
>>>  };
>>>  
>>> +/* TODO: need to implement */
>>> +#define cpu_to_core(cpu)   (0)
>>> +#define cpu_to_socket(cpu) (0)
>>> +
>>> +static inline void cpu_relax(void)
>>> +{
>>> +    /* Encoding of the pause instruction */
>>> +    __asm__ __volatile__ ( ".insn 0x100000F" );
>>
>> binutils 2.40 knows "pause" - why use .insn then?
> I thought that for this instruction it is needed to have extension
> ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and to cover
> older version.

Well, of course you'll need to enable the extension then for gas. But
as long as you use the insn unconditionally, that's all fine and
natural. Another thing would be if you meant to also run on systems
not supporting the extension: Then the above use of .insn would need
to become conditional anyway.

>>> +    barrier();
>>
>> Why?
> Just to be aligned with Linux kernel implemetation from where this
> function was taken.

Hmm, looking more closely we have an (open-coded) barrier even on x86.
So I suppose it's really wanted (to keep the compiler from moving
memory accesses around this construct), but then you may want to
consider using

    __asm__ __volatile__ ( "pause" ::: "memory" );

here. First and foremost because at least in the general case two
separate asm()s aren't the same as one combined one (volatile ones
are more restricted, but I'd always err on the safe side, even if
just to avoid giving bad examples which later on may be taken as a
basis for deriving other code).

Jan

