Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB3A10151
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 08:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870966.1282013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXbQI-0000KQ-3a; Tue, 14 Jan 2025 07:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870966.1282013; Tue, 14 Jan 2025 07:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXbQI-0000If-0i; Tue, 14 Jan 2025 07:33:14 +0000
Received: by outflank-mailman (input) for mailman id 870966;
 Tue, 14 Jan 2025 07:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXbQG-0000IZ-JA
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 07:33:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce58ef38-d249-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 08:33:11 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso35417605e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 23:33:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384f2bsm13964255f8f.41.2025.01.13.23.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 23:33:10 -0800 (PST)
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
X-Inumbo-ID: ce58ef38-d249-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736839990; x=1737444790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t6gAc1nzclt8QkVWMOrljaOOgl/BW7FUR1b0XE0EhEQ=;
        b=EgjgG/lgmONZpxQDOP6xrUGTSx+CqYyU5DGNl7FqUu0uHrYIwYKrw221cuxJYPSP5W
         fBxJWIAC2qJanrsZCW/NVUQDmlzbidNJG8t3ZJs+l5aawVc//LK14C+XfIztxJWM0jtP
         ucpIkwfpYnoleo7gRQHmDcD8a4a6X/vx6YxO9YhLV2XUE5VvXOVt5eF6uXF2GB7W7EFY
         ROEoolAp7om7haIILgGLMILDgj+fJmBIQB6ruNr1Tuyefqr1z74qe7yezhPUfhFW3uid
         nebtwKT9da4L6I5JnDNqQzhH6IRBhSfkbqv1Zgv9qi/8MTFu6I6VQYBytKGx1KXlqfRL
         CkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736839990; x=1737444790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6gAc1nzclt8QkVWMOrljaOOgl/BW7FUR1b0XE0EhEQ=;
        b=wP39q9XBXI/YJ3AQDXACtE9azqqVA7yPxxeTIyAbIJeHeHxfg9em3GUzfG7zRLk+yR
         BXByUUQc+XEhHv2uruNV2pMAQ2Ssz/wIWnBvGHgYwJZi7AaQLRGRWr7AAnZmuPzMWVFA
         PFK79SAtRB11QBXZRqTrAy9Mvu9g58ofIEq7VWzDB2Ifu+QDJYyG5KC4zHwD/AnAJK7I
         06jn7MCToKCAe6TqDxqFla9rjRq6i2J6wmE3lPavrdA/6wk4gxcj4VZANElRG8xoztJf
         RTUYWc4qvHKUkWaTpdI5bu67P45cIgyjOXHsDrex8WL5hM4KLTdiaqBZgmEMEsnP38DI
         l0BA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7FOQlbn+ARUb9cXXpHe5TmAgwjYWrMCMZCSarx2JuQSdLAlzVlv1jzR6qf2Vv7bQy2QUmD52PdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFq6G7rL11m4RvopIiqtLKSnEbYBMfBHDlhFpEV3HlFLl49ZEM
	YCP5AFLFjaAhYz8xMzE6GP3/x5G7/qw+fV09MjvDSLGHcfQIsZP4XK5WpTGKIA==
X-Gm-Gg: ASbGncvf/TXjMlP7ImWsql5YvNd57zUmFVE4Us2Nmm5tfH6CUMD1xpcmzAyrzp61fdm
	R0CUxIn91IBhLngrVLEK0NIBJfJga4bJzw/Z/a2ZouTMhLeQyMG1tg7RT69MmPWQv7NJmYXVyO9
	FrQGE6hDa2KesyTEAkC4P4SMCa29fpvH7hNQGJVGPNToNR74KF7ZZzjnLoacQJrSo6wKi7knxJI
	Am3kEIx8vXEvjKRTj9Lqp5ANGQs4MUKeYMuYzIyeQRZy1ju3A0bptkLthimLVbtbRrzdVYvQMTU
	240VcL6zWEJhbHGQhK8zgiYIdQF6L2A+6+KCsCq7vA==
X-Google-Smtp-Source: AGHT+IF0ApxWrg+S83fw00fBEKPKbmp4S6VuffQGwuQp0x/o461SeAZaBdG85GqaIfbClRIDdauwSg==
X-Received: by 2002:a05:6000:144d:b0:38a:615b:9ec0 with SMTP id ffacd0b85a97d-38a873122edmr21740452f8f.54.1736839990481;
        Mon, 13 Jan 2025 23:33:10 -0800 (PST)
Message-ID: <7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com>
Date: Tue, 14 Jan 2025 08:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v1 1/1] xen/riscv: identify specific ISA
 supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734957957.git.oleksii.kurochko@gmail.com>
 <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
 <bc636259-5586-428c-8a57-f97ba16a14b8@suse.com>
 <255b0079-4516-404c-81c1-a49e6f7bf5b4@gmail.com>
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
In-Reply-To: <255b0079-4516-404c-81c1-a49e6f7bf5b4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2025 18:11, Oleksii Kurochko wrote:
> On 1/8/25 4:21 PM, Jan Beulich wrote:
>> On 23.12.2024 13:55, Oleksii Kurochko wrote:
>>> +struct riscv_isa_ext_data {
>>> +    const unsigned int id;
>>> +    const char *name;
>>> +};
>> This is odd - why would the id be const, but not the name? Thus you
>> require all instances of the struct to have an initializer. The more
>> conventional approach is to apply the const on the instances of the
>> structure (e.g. as you already have it for riscv_isa_ext[]).
> 
> Agree, not too much sense to have const id, but not the name. Then it should be also "const char * const name".
> 
> Lets follow conventional approach and declare riscv_isa_ext_data structure as:
>    struct riscv_isa_ext_data {
>        unsigned int id;
>        const char *name;
>    };

Yes, this is what I'd have expected. I'm afraid ...

> name member of riscv_isa_ext_data structure still should be "const char *" to avoid compilation error:
>    discarding of `const' qualifier from pointer target type.
> 
> An option could be to have a case in macros RISCV_ISA_EXT_DATA():
>    #define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
>    {                                               \
>        .id = ext_id,                               \
>        .name = (char *)#ext_name,                  \
>    }
> But IMO it is better just to declare riscv_isa_ext_data as suggested above.

... I don't really follow all of this. It's clear though that the (char *)
cast is a Misra violation, and hence anything like this is out of question
anyway.

>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> Isn't it kind of implied that with the presence of Zbb, B should also be
>> present?
> 
> My interpretation of the RISC-V Bitmanip Extension spec is that the 'B' extension is essentially a collection of
> the Zba, Zbb, Zbs, and other extensions, but it isn't an extension by itself.
> The following is mentioned in the spec:
>    The bit-manipulation (bitmanip) extension collection is comprised of several component extensions to the base
>    RISC-V architecture that are intended to provide some combination of code size reduction, performance
>    improvement, and energy reduction. While the instructions are intended to have general use, some instructions
>    are more useful in some domains than others. Hence, several smaller bitmanip extensions are provided, rather
>    than one large extension. Each of these smaller extensions is grouped by common function and use case, and
>    each of which has its own Zb*-extension name.

Still the doc has '"B" Extension for Bit Manipulation' as the title of the
chapter. And gas accepts B as an extension (e.g. ".option arch, +b").

>>> +            /*
>>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU).
>>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>>> +             * not valid ISA extensions. It works unless the first
>>> +             * multi-letter extension in the ISA string begins with
>>> +             * "Su" and is not prefixed with an underscore.
>>> +             */
>>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>>> +            {
>>> +                ++isa;
>>> +                ext_err = true;
>>> +                break;
>>> +            }
>> I'm afraid I don't understand this; the comment raises more questions
>> than it answers.
> 
> Some details could be found here about these QEMU workaround from LK view:
> https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
> 
> This leads to the following fix in QEMU:
> https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
> 
> Considering QEMU's patch, these workaround isn't needed anymore since QEMU 7.1 ( it has been released30 Aug 2022 ) probably we could update the
> QEMU version on our CI and just drop these changes.
> Or, at least, update the comment with the links mentioned above and add a message that these changes are needed only for QEMU < 7.1.
> Am I right that we don't have something like GCC_VERSION in Xen but for QEMU?

How could there be? At the time of building Xen we know what compiler
version is in use, but we clearly don't know under what qemu versions
it might later be run.

>>> +        riscv_isa_parse_string(isa, this_isa);
>>> +
>>> +        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
>>> +            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>>> +        else
>>> +            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> What if the first instance had no extensions at all? You'll then copy what
>> the second instance say, ending up with extensions not supported by one of
>> the CPUs.
> 
> I think that it's impossible that there is no extensions at all and it should be
> considered as a bug of provided riscv,isa property. Thereby it should be enough to
> add BUG_ON(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) before if-condition.

Well, you can of course make such an assumption. I don't think though that
it's technically impossible to have an extension-less environment. Xen
won't be able to run there, though (we'll require H at the very least aiui,
and I'm sure we really also require Zicsr).

Jan

