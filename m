Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9083A7C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670946.1044055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbQC-0003yY-3m; Wed, 24 Jan 2024 11:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670946.1044055; Wed, 24 Jan 2024 11:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbQC-0003uV-12; Wed, 24 Jan 2024 11:27:56 +0000
Received: by outflank-mailman (input) for mailman id 670946;
 Wed, 24 Jan 2024 11:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSbQB-0003uB-4Z
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:27:55 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da23fc3-baab-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 12:27:54 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cf1c487235so10460191fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 03:27:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 em21-20020a0566384db500b0046d9e290a74sm3949611jab.7.2024.01.24.03.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 03:27:53 -0800 (PST)
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
X-Inumbo-ID: 9da23fc3-baab-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706095674; x=1706700474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ix1CFNwXPrXlRQ4RQ6NOZvA6LnaUcpMHg46xi+43rcA=;
        b=KBxsfImdFGmL+4sfzB4vX53HotKj8bUz+gM8WjjrhNq6wGRg4AuRyhi1RxK0yZnYaw
         AGT7QOvGlghcXLaeROztIhfwjAAlvUyW1gLK2g8P4YjCPP77DtH0DIsWjz+YVtyALXSA
         CGhxoBUGAqxN9qsWjcN9SPXfWLImXkBDRAcEjE90LWn3aMR9ys4Lp4JYB1SNz3kGwb8I
         7VQGwE8GZJxJ+QaYpTgdT6WBseIJhE3ZmwXG8J0NreJpUXGHU7o1/aWq9IGoHSA8gxug
         szObLYxywxDA+SenKMK+KT11lDvltR53lA6XM39QF812r1EFywKZU41iIA8pTiscs4OI
         TAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706095674; x=1706700474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix1CFNwXPrXlRQ4RQ6NOZvA6LnaUcpMHg46xi+43rcA=;
        b=H9Z5XQdVQqG0Pd0KRyXgLfZUPd985kU91wUt/NNASseQWbOV2KqBDCaxaZrHpzokPQ
         bFdhuWNsEmtxrh5vWYvSlZSWzp6sqhg5xUbrMuPFrkHVblBmwHnE7LsXln5HtUbT1Wi7
         NCQFdgHmzo2SZQx1zXDAfUHDCljYD7/2nyEDGAXK1mdFlPMGa2j+w6Ata1rjSGTV4Ir3
         hzl4v5Sd24qiAx8SGggWUr6TdmpDS4ya5fdy/k72kVPrF8lCOkUSY9JkZRRfG3WqcJ48
         xKJOdOBsn62wkEKxyGektbXUygi4ArpWjqO4ePXwW+GKNWWhelIqLahqyX+yy4aOd+r8
         fidQ==
X-Gm-Message-State: AOJu0Yw9xJILsNrc6VE4gYyeZZriIGpfjSudX/QpzHRrjisW1VdMQstB
	sDaPr/EMCbdphBXsHBeNh+NS3i+ob5zIwavfgrHeDthoSaSNVjXdCJqJn8D/iQ==
X-Google-Smtp-Source: AGHT+IE62pA+AlK6ODZzrN6tx0EnYWfySncSwrG+qjKugOjwjHNerd8PzHaVwzLru/XgVMxnJd0myQ==
X-Received: by 2002:a05:651c:2c9:b0:2cd:9fbc:d3d3 with SMTP id f9-20020a05651c02c900b002cd9fbcd3d3mr619801ljo.69.1706095673809;
        Wed, 24 Jan 2024 03:27:53 -0800 (PST)
Message-ID: <5f6c35ed-de1f-4a47-897d-33ed979b28db@suse.com>
Date: Wed, 24 Jan 2024 12:27:49 +0100
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
 <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
 <22a0c2444201262202cd60d6d5a1cdff62c236bf.camel@gmail.com>
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
In-Reply-To: <22a0c2444201262202cd60d6d5a1cdff62c236bf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 11:12, Oleksii wrote:
> On Wed, 2024-01-24 at 09:19 +0100, Jan Beulich wrote:
>> On 23.01.2024 18:08, Oleksii wrote:
>>> On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>> @@ -53,6 +56,18 @@ struct cpu_user_regs
>>>>>      unsigned long pregs;
>>>>>  };
>>>>>  
>>>>> +/* TODO: need to implement */
>>>>> +#define cpu_to_core(cpu)   (0)
>>>>> +#define cpu_to_socket(cpu) (0)
>>>>> +
>>>>> +static inline void cpu_relax(void)
>>>>> +{
>>>>> +    /* Encoding of the pause instruction */
>>>>> +    __asm__ __volatile__ ( ".insn 0x100000F" );
>>>>
>>>> binutils 2.40 knows "pause" - why use .insn then?
>>> I thought that for this instruction it is needed to have extension
>>> ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and to
>>> cover
>>> older version.
>>
>> Well, of course you'll need to enable the extension then for gas. But
>> as long as you use the insn unconditionally, that's all fine and
>> natural. Another thing would be if you meant to also run on systems
>> not supporting the extension: Then the above use of .insn would need
>> to become conditional anyway.
> Then it makes sense to use "pause". 
> Let's assume that for now we are running only on systems which support
> the extension until we won't face compilation issue for some system.

Gives me the impression that you still don't properly separate the two
aspects: One is what systems Xen is to run on, and other is what's
needed to make Xen build properly. The first needs documenting (and
ideally at some point actually enforcing), while the latter may require
e.g. compiler command line option adjustments.

Jan

