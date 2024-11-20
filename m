Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8B9D37C1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 11:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840969.1256488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDhV7-0001QN-0l; Wed, 20 Nov 2024 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840969.1256488; Wed, 20 Nov 2024 09:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDhV6-0001NV-TP; Wed, 20 Nov 2024 09:59:56 +0000
Received: by outflank-mailman (input) for mailman id 840969;
 Wed, 20 Nov 2024 09:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDhV5-0001NP-3v
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 09:59:55 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e99242a-a726-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 10:59:50 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38248b810ffso1298022f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 01:59:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825490529fsm1646537f8f.4.2024.11.20.01.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 01:59:49 -0800 (PST)
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
X-Inumbo-ID: 2e99242a-a726-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlOTkyNDJhLWE3MjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDk2NzkwLjYxNzk1OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732096790; x=1732701590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Af2hnQ+JZB567IdlSSYwS6xLyLikGdFms2r2dlJMcSI=;
        b=fAk0BN60xtaZnGaVbTPF22rztsht/zQ3ycjJwdzRjt4FkQkL7h6lu/dZY280wvYQMn
         9L/7dzawFT6u5Z12iDwr2VUAYoJz2cTYEXqTO2x6cox8mNUOSVkXL/ZAou7tfW3qqb8h
         S/VQzqidh/nT2uvaQszcaffzLbqDgFk0f0qNZdCghDiSJTc++MJ3wgwUFZXGeXTjNdW5
         dhTIO3PqxWzQfY4YwZsZbGM3jsMCVo6XRee6CJokwnNFc4G8iYCKVbLdlcQO1a/gJysa
         CKPZo6fKGayOSQ36KvXj2+aqjx6g1eooTyaaZsx4h86iBOGDKeCiWIz6y2S1z2FlafCK
         OAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732096790; x=1732701590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Af2hnQ+JZB567IdlSSYwS6xLyLikGdFms2r2dlJMcSI=;
        b=tHu3vpFtXUq2HEu64ikJsFV8R3wf3GyPx5qPAGIiyHAjxMrGordbyKG1sFiNsthRuv
         aUTggv1TNQcYh4FbdeGQ65Lp0d+aT4Do9NflzP2Z9XSWtcuR4dzh29DTxQ1Tw/mbXbse
         B7p/LPbNIwhV37ufAyxqCVYXuO+IXy+aX/FPV1fOeyWiuCMYKf293LWd4BG0VbzEoD43
         UYDfB6s44LgMasMcOnqIrvN79BKp2reVMSoNg3FyTpo5JhNxXjwAqCixl/x0qUjGwD2l
         Cct3IspbuuAy4Ne13uuBDzcO4mtMZet2zgAmJ6exblg6P8EJ77j4q6C6Kd6CvV740Cxt
         Jh2g==
X-Forwarded-Encrypted: i=1; AJvYcCVN0ZM/y7DWp2BN7+GyDT08g2S0ByDMntrg1zTL/H8aE2b3iEksGOitt6TlExIEdhCZB3aZP24Aj5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJrwCoIE/ZwcXydcOtq0qF+CGLrqzwAUu5L/CuYGOdJQys3Ya+
	Xa/I8pfWDPNoY8NDEXBNntlFq43/7JL0byyTiRfx18Y9XvM1nKV29kWF4r/WKQ==
X-Google-Smtp-Source: AGHT+IF1PyP2rjNDS6BD34lSoKQkj6gHXdrf+S+w/tybg78EacFP3QF65bexwxZ6L4NnKmJWbrm/7w==
X-Received: by 2002:a05:6000:2a83:b0:382:46d2:52ae with SMTP id ffacd0b85a97d-38254af4f9bmr1201201f8f.21.1732096789960;
        Wed, 20 Nov 2024 01:59:49 -0800 (PST)
Message-ID: <a414bde4-54fe-4be3-8ab5-98f04d3eaaa0@suse.com>
Date: Wed, 20 Nov 2024 10:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Compile do_mca() for CONFIG_PV only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119125904.2681402-1-andrew.cooper3@citrix.com>
 <d92cf59a-a798-4223-9439-85ae215b7daa@suse.com>
 <00fa3d65-d598-474f-b9ee-7b63db2d3b40@citrix.com>
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
In-Reply-To: <00fa3d65-d598-474f-b9ee-7b63db2d3b40@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2024 19:22, Andrew Cooper wrote:
> On 19/11/2024 2:34 pm, Jan Beulich wrote:
>> On 19.11.2024 13:59, Andrew Cooper wrote:
>>> Eclair reports a Misra Rule 8.4 violation; that do_mca() can't see it's
>>> declaration.  It turns out that this is a consequence of do_mca() being
>>> PV-only, and the declaration being compiled out in !PV builds.
>>>
>>> Therefore, arrange for do_mca() to be compiled out in !PV builds.  This in
>>> turn requires a number of static functions to become static inline.
>> Which generally we advocate against.
> 
> It's `static inline` or `static __maybe_unused`, but I refer you to to
> the Matrix conversation on June 24th on the matter.

Well, and the outcome was __maybe_unused there. For consistency I'd therefore
like to ask that you use __maybe_unused then here, too.

As an aside, it would have helped if you had said which channel that discussion
had been on. Scrolling back this far sadly doesn't work very nicely on the
element.io interface (or I simply don't know how to make it go to a specific
date), and I ended up trying XenDevel, then the committers channel, and only
then the x86 one.

>>  The #ifdef variant you pointed at on
>> Matrix wasn't all that bad.
> 
> It worked as a test, but ifdefary like that is a maintenance nightmare.
> 
>>  Plus ...
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>>
>>> Bloat-o-meter on a !PV build reports:
>>>
>>>   add/remove: 0/6 grow/shrink: 0/0 up/down: 0/-3717 (-3717)
>>>   Function                                     old     new   delta
>>>   x86_mc_mceinject                              31       -     -31
>>>   do_mca.cold                                  117       -    -117
>>>   x86_mc_msrinject                             147       -    -147
>>>   x86_mc_msrinject.cold                        230       -    -230
>>>   do_mc_get_cpu_info                           500       -    -500
>>>   do_mca                                      2692       -   -2692
>> ... what's the effect of the addition of "inline" on a PV=y build? By
>> using the keyword, we may end up talking the compiler into inlining of
>> code that better wouldn't be inlined.
> 
> xen.git/xen$ ../scripts/bloat-o-meter xen-syms-{before,after}
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=3901801, After=3901801, chg +0.00%
> xen.git/xen$ diff -u dis-{before,after}
> --- dis-before    2024-11-19 18:08:02.284091931 +0000
> +++ dis-after    2024-11-19 18:08:24.491035756 +0000
> @@ -1,5 +1,5 @@
>  
> -xen-syms-before:     file format elf64-x86-64
> +xen-syms-after:     file format elf64-x86-64
>  
>  
>  Disassembly of section .text:
> 
> xen.git/xen$

Good. Preferably with __maybe_unused
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

