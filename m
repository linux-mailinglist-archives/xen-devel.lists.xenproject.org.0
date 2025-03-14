Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589AA60C01
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914074.1319893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0eM-0007OO-ST; Fri, 14 Mar 2025 08:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914074.1319893; Fri, 14 Mar 2025 08:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0eM-0007LC-Ny; Fri, 14 Mar 2025 08:44:14 +0000
Received: by outflank-mailman (input) for mailman id 914074;
 Fri, 14 Mar 2025 08:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0eL-00078H-IT
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:44:13 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80555e74-00b0-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:44:11 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so18487215e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:44:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e618sm9998115e9.40.2025.03.14.01.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:44:10 -0700 (PDT)
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
X-Inumbo-ID: 80555e74-00b0-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741941851; x=1742546651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F2TzFYQkMyh1r3ab/xmonrYY8vjLg9ESkSpVC/smkf0=;
        b=fvKw/4pLIIeOZZtWB8ssYLciaBNH1s7mdzQIWYalMKG11bWX6BDctp6swwbpAr+peX
         5lK133taGUudL5w86fFdmxEY4r4cMUEwuHtHb45wo7D9QDpF5FXIJMtJOCZaAGAYF0IR
         AMXFc8l1F8jLvq7Vg+hkECLPQt/6mzNop3+rJdUUqDonvl6TF+t/hlL6SoIF8qxH7Gf8
         l0S/firxEssL1rS7AF+2F/R6U7//yi4oAtWdEVc2vXa7IjJaqNgOeXANOg3oobY0YHME
         kYl2rVS1qeobaOG3ow9ihze1AOKrkdAp2E9bqdfmJMhrpvF+suVFKuCGrHDwC0RxXRBm
         /lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941851; x=1742546651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2TzFYQkMyh1r3ab/xmonrYY8vjLg9ESkSpVC/smkf0=;
        b=Jxsm8KLr1rBu/pO+5AWnM8tOY+4HQaWG7O6vTNGg7Ju1xFhTSeUwXWacS5NM48F0sC
         ZE7vZbaYd+NDwLvsE54wcUpOYXAiQtAQUNAtydN/TTopokKBXYWeo00zYeGlUYbGccCr
         +VOftbVWGKLbvbZS7fbqyjTx+7irr9bolAxaP8+D1sd0TBv7fjtv8dUzOf5boR3erUNT
         mVmR58olToZ903941B93yDyKU+FqccjGl2Ei2IZnAf90LLQ1gQbRpCuk9iCiiPhBfZts
         DJpj88+6/ccZHFLeCZYk5DH0ELwy0WCcEKWEgAJCwz+e/OnrF8lIHcW36eqU/VqEFT6p
         ct7w==
X-Forwarded-Encrypted: i=1; AJvYcCWjEv/089ImbTaYpFULgUjv3k8WIDuzYPosvRVFKz9WvxhqLY1xeZ4EAxBZfKxIgcoftXSpQ94DVug=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/I0bd8llYl2+mcSd9XwJWhxe8/yiMyuyKchSCU4TpC2IMBmQH
	/cNt2yJleYToMMQ04vNQhE0t1dN/p6HbvkPoqh4A8gptAZcM8h1x8bxSMf/vFA==
X-Gm-Gg: ASbGnctSoYLzcvq7VcpefHB5+PWqNCRQT1nuJeZ30lVlXdsWP9XG+LleflqkLEwNikH
	7mbj4QL6uOnI9clUm38otZVMvkowVTEe65zPC/V8be3UVg5fBiVUwQ0AVYvdcsD9HfOR9Hhwbx3
	juV4jDb2UXrL3ViQf5jZ/YyFrRDzJVTO7W1DZebk7dYCY2hKGCeqHhe1eSnvnxdDNLm+oYB1zHd
	yQBSlWsD4YgDzROjCA3AgEQrphrbdXz8xwhOvdh9a0dxNDmFv23SDQy9afr2yh7Y6+OtZWYgQDv
	YRLVD8hdI8xt7MV5UFk+hh4BgS8m9d/c4pcpHF3VX44FDsq9HlmUB11eFTr+fwGeRLA/BwFbx5O
	QtR1253qKew11b8dPLuPNwtWmjF+4SY6waKoFhEO4
X-Google-Smtp-Source: AGHT+IG+BbEF00MaUVrJ4cWsUILLXm3xvrajbRLUJP+21BW2uY7N35jsXB5kkQAM5KxuyM5nabz7fA==
X-Received: by 2002:a05:600c:2e49:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43d18077785mr52091545e9.7.1741941851129;
        Fri, 14 Mar 2025 01:44:11 -0700 (PDT)
Message-ID: <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
Date: Fri, 14 Mar 2025 09:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
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
In-Reply-To: <Z9PpI8KQnA_gHy9e@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 09:30, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
>> On 13.03.2025 16:30, Roger Pau Monne wrote:
>>> When enabling UBSAN with clang, the following error is triggered during the
>>> build:
>>>
>>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>       |         ^
>>> <inline asm>:1:121: note: instantiated into assembly here
>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>       |                                                                                                                                ^
>>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>       |         ^
>>> <inline asm>:1:159: note: instantiated into assembly here
>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>       |                                                                                                                                                                      ^
>>> 2 errors generated.
>>>
>>> The inline assembly block in __prepare_to_wait() is duplicated, thus
>>> leading to multiple definitions of the otherwise unique labels inside the
>>> assembly block.  GCC extended-asm documentation notes the possibility of
>>> duplicating asm blocks:
>>>
>>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>>>> your assembly code when optimizing. This can lead to unexpected duplicate
>>>> symbol errors during compilation if your asm code defines symbols or
>>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
>>>
>>> Move the assembly blocks that deal with saving and restoring the current
>>> CPU context into it's own explicitly non-inline functions.  This prevents
>>> clang from duplicating the assembly blocks.  Just using noinline attribute
>>> seems to be enough to prevent assembly duplication, in the future noclone
>>> might also be required if asm block duplication issues arise again.
>>
>> Wouldn't it be a far easier / less intrusive change to simply append %= to
>> the label names?
> 
> That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
> won't be able to make a jump to the .L_wq_resume label defined in the
> __prepare_to_wait() assembly block if the label is declared as
> .L_wq_resume%=.
> 
> Also we want to make sure there's a single .L_wq_resume seeing how
> check_wakeup_from_wait() uses it as the restore entry point?

Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
understanding why there is this duplication? The breaking out of the asm()
that you do isn't going to be reliable, as in principle the compiler is
still permitted to duplicate stuff. Afaict the only reliable way is to move
the code to a separate assembly file (with the asm() merely JMPing there,
providing a pseudo-return-address by some custom means). Or to a file-scope
asm(), as those can't be duplicated.

Jan

