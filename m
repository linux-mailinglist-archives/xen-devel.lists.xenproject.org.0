Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCA962213
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 10:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784543.1193913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjDnp-0000b1-D3; Wed, 28 Aug 2024 08:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784543.1193913; Wed, 28 Aug 2024 08:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjDnp-0000YW-9x; Wed, 28 Aug 2024 08:13:17 +0000
Received: by outflank-mailman (input) for mailman id 784543;
 Wed, 28 Aug 2024 08:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjDno-0000YA-Og
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 08:13:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f931227-6515-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 10:13:14 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so808875266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 01:13:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e594a545sm206301166b.205.2024.08.28.01.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 01:13:13 -0700 (PDT)
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
X-Inumbo-ID: 5f931227-6515-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724832794; x=1725437594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fy3lVpWLV/wnb8UcTsEYO/zgSlhGphcsNDPNuSgPzq8=;
        b=bKXrtDx724+9SiS19I6r1QnEfufJnYjXJjgki47Ee54tIoHnN8nc7f4R7dGwlbRddS
         fnTbYlMpxrCxPIzww2Em1s0V7EH2QwFAE3lSGzLIsEFUDOo2vL5x4hsHiPtAFUCisyYl
         tizWHo/NVSh9GNqU0daUlkaYsTogP9VmKy7FKjKIMfJ6jxrPylRJjETRFwA+E+Dvzns9
         YoJIBUe15YleAldvyv1Uzza0S4zCS6VYYekH3sXRXvR8o0dolb7cQwnJZItq0cq+wh8C
         Iwd7hqLsByLRBejq0wglrEZETcZ3U/Ni9NmVrLf5q+ndjd03HU2KNNI25JGuethIQgAN
         faEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724832794; x=1725437594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy3lVpWLV/wnb8UcTsEYO/zgSlhGphcsNDPNuSgPzq8=;
        b=cqMjSGTV7mqIBqAg7EjEoTjVhq9N4Hsq2RtQbHaDnREUTRiwNEoAADOnRM9ojIVFmS
         0IA/kCq7L40cbvS1ACGQASB0d8a2v7XsGEtvxSlHbihq/IXiq4nkQeiJWmMY17DjYNRP
         3dJhVVrOUMxdp83GMciGPZBSbo+aDwip/w4uYtxXn4hwrxY0mJ4ghDMNULajsPy0U44Z
         QWR4DQX+JgPUNWe8zvWBJlUd7K8a6xItnugXqzSJZb2XBvmunc/d1/iZKqZFwTHFhKrx
         IU1DSmBKotklsyUECw3FOQEfHaxMHh5c36EX+PYr5RjJ6T1RGqAt7QavfHKEoruFLTbj
         d3WA==
X-Forwarded-Encrypted: i=1; AJvYcCWCg3MnchUUe2c4iOJEtaP5Lc97Z9JAYJh2SyFE+QClf1W8Y9ZIDa5X/RcRxLlzl3fyHtSEDryuIV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKClV/Ig0lG/w2aMhSM5dP5vXS6ltk0OgcsVDPB/2jfyLJi4jd
	2hRNxA1CMd0Fq+AsBzg3MsnTBU9JVnVaXWx1tyw2iW1q5gLLG43E7NV8A1ySfw==
X-Google-Smtp-Source: AGHT+IEor1Q++j0VuS6BTuFaGvhKH619jyrUfcOczFEQIToEKn67fjOk9/X8zjszsbj+o83yRnvPuQ==
X-Received: by 2002:a17:907:1c1f:b0:a86:941f:49ac with SMTP id a640c23a62f3a-a86a54dfaedmr1178823966b.67.1724832793850;
        Wed, 28 Aug 2024 01:13:13 -0700 (PDT)
Message-ID: <2316ca39-50d4-4311-aeff-30be588245d9@suse.com>
Date: Wed, 28 Aug 2024 10:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/hvm: Rework hpet_write() for improved code
 generation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240827135746.1908070-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 15:57, Andrew Cooper wrote:
> In the HPET_STATUS handling, the use of __clear_bit(i, &new_val) is the only
> thing causing it to be spilled to the stack.  Furthemore we only care about
> the bottom 3 bits, so rewrite it to be a plain for loop.
> 
> For the {start,stop}_timer variables, these are spilled to the stack despite
> the __{set,clear}_bit() calls.

That's an observation from what the compiler happens to do? I don't see any
other reason why they would need spilling; I expect it's merely a matter of
registers better be used for other variables. If we ever meant to build Xen
with APX fully in use, that might change. IOW may I at least ask for
s/are/happen to be/? I'm also a little irritated by "despite", but you're
the native speaker. It would have seemed to me that e.g. "irrespective of"
would better express what (I think) is meant.

>  Again we only care about the bottom 3 bits, so
> shrink the variables from long to int.  Use for_each_set_bit() rather than
> opencoding it at the end which amongst other things means the loop predicate
> is no longer forced to the stack by the loop body.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> All in all, it's modest according to bloat-o-meter:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-29 (-29)
>   Function                                     old     new   delta
>   hpet_write                                  2225    2196     -29
> 
> but we have shrunk the stack frame by 8 bytes; 0x28 as opposed to 0x30 before.

However, on the negative side all the first of the loops you touch now always
takes 3 iterations, when previously we may have got away with as little as
none. Is there a reason not to use

    for_each_set_bit ( i, new_val & ((1U << HPET_TIMER_NUM) - 1) )

there (with the masking of the low bit possibly pulled out)?

> @@ -533,19 +528,11 @@ static int cf_check hpet_write(
>      }
>  
>      /* stop/start timers whos state was changed by this write. */
> -    while (stop_timers)
> -    {
> -        i = ffsl(stop_timers) - 1;
> -        __clear_bit(i, &stop_timers);
> +    for_each_set_bit ( i, stop_timers )
>          hpet_stop_timer(h, i, guest_time);
> -    }
>  
> -    while (start_timers)
> -    {
> -        i = ffsl(start_timers) - 1;
> -        __clear_bit(i, &start_timers);
> +    for_each_set_bit ( i, start_timers )
>          hpet_set_timer(h, i, guest_time);
> -    }

To avoid variable shadowing, I think you don't want to use i in these two
loops. Alternatively the function scope i would need constraining to the
individual loops.

Unrelated to the change you make, but related to the code you touch: Isn't
there a bug there with the length != 8 handling ahead of the switch()? The
bits being write-1-to-clear, using the value read for parts the original
insn didn't write means we might clear ISR bits we weren't asked to clear.
I guess I'll make a patch, which may want to go ahead of yours for ease of
backporting. (Of course guests should have no need to write to other than
the bottom part of the register, but still.)

Jan

