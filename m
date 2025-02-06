Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2214A2AE07
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 17:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883046.1293132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4xv-0007Ok-7O; Thu, 06 Feb 2025 16:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883046.1293132; Thu, 06 Feb 2025 16:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4xv-0007Lj-4L; Thu, 06 Feb 2025 16:42:59 +0000
Received: by outflank-mailman (input) for mailman id 883046;
 Thu, 06 Feb 2025 16:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg4xt-0007Lc-7a
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 16:42:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a7dbce6-e4a9-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 17:42:56 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7483b9bf7so165729266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 08:42:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab784d33c59sm21415066b.183.2025.02.06.08.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 08:42:55 -0800 (PST)
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
X-Inumbo-ID: 6a7dbce6-e4a9-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738860175; x=1739464975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2cVdkpZ2F9QYDOhvcsZt7YObcDfPAqcI+3ucQc8CRro=;
        b=QyV2/1vSpq45SW8+iVkq6CsXLZ1ifXllNQVsvZEgtpj5eb7tEivGL5zWzngdq+toI7
         /1I9IW7H96lYUmhOdYLDaSIwggvDUkrIv8tk9BSRcIJFQC3NDy5at++r3ZfASAFTeeiT
         uqxS63Q4KZRVJvZ8N+gyqHcPE4oJ2cLNVHtGFTDnVl2gbcqY/xY2QJ6wNmySzM2SW9ig
         xw+0jNt6JrHUTzQfpyUcXGkIa7Wii/HDS66ZgtVPHuSrXngCwvszOjpcdzVJmXcexgkU
         /93vFwUX1p/JWlj1opMBpJ2qjmtpTUPlKfFwVl8P21nT6tl0cnvHV7EqxvCrgYWFGaMt
         cQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860175; x=1739464975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cVdkpZ2F9QYDOhvcsZt7YObcDfPAqcI+3ucQc8CRro=;
        b=Dz7VPvT8G3T3ecE7PyemO/ALHfZYBA09r6Etyu8XvhBPCf9a4iERkXxlrFc0z5Iyh0
         aACkOuz7i+8oYhxhAW+a7h010t2Xvn+BRxTsxKanRKd5TeLVr5dWSlUHL0JHWMns9e/D
         g5A6st8TxjW2TmZ+ARDla9U9icMkQR2s1CyAZ+MNX816We8feirOXIiWUINBwzMKqfU2
         CUhgIyc5DtXJ4LO435oLnE8m0HXM1+UYjNNNePoIvDBoJ8fKuLmYITPQkC5cTiSNZVyy
         W64z0B5dvuYa10muYbYHojbB1m+eYjOY3P3lIKM+A88Jq2EOsESNqADpqZymGWIqBmHh
         8AbA==
X-Forwarded-Encrypted: i=1; AJvYcCVuElpMOQAvCBlrZY2ZYy93VBxzeA0NJQa9+oODOG9LTu+ojbxhG3olL/NdVg4VS3+5fkaitmElrhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbQQPO/uWcQzP8ZqayiPqTpKPlmd2See0nOkPYEVkN3b9HdjyM
	2TgIC7mRfW61xtYyofSubrkuhQ04GVSdF95PBRpSQWjvdUg3GhXjBz5d7/Dnnw==
X-Gm-Gg: ASbGncvhcRRRGIItGYqLDqqRNruiJ2A3Y1wgbpcw4AJr3yjFH6841V/3nlxcdrNiPqf
	cPsV1LEBuf19qVTRebqa6pxh6ufDroQiO47rAOW1Ufh3V0S8rGMpRYnbkXrBzIcQFHI/sGjr3Z0
	QRl9ruRSBV6L4zAOkvnVMbXTFAK9Pvwg/c3z5gOxJ4N5oUq8mSVyt7HSBURt/U/nKa6WGHpP4P+
	NzH59O074P14A/2VaRgZYeRwwUYmevsckQ+mUg5JoumvNFE1ZIwLfblU2ZZ49olXiQNc0uhAKC4
	6z4nkFc4ZxGFNsgAcexUsLJ4dSUqExyOiaZgwPopl3JSfzuxgVbP31gxuY0N2fprwrJrmDlcFH4
	n
X-Google-Smtp-Source: AGHT+IF5JuOcT7UVLeNM78R9awhRkrK0Ox/YhH6lk8PgWa2ixdWvTa1zQU0yCznmo6js3g4PpAX7Sg==
X-Received: by 2002:a17:907:d88:b0:aa6:9176:61ed with SMTP id a640c23a62f3a-ab75e33cea1mr889537366b.48.1738860175370;
        Thu, 06 Feb 2025 08:42:55 -0800 (PST)
Message-ID: <40e0e225-31f9-4668-8d29-90519fd28768@suse.com>
Date: Thu, 6 Feb 2025 17:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
 <6c9baf46-bc0b-49a7-9cdd-bebb0fc71ee7@gmail.com>
 <4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com>
 <9a43296c-d78d-49bf-9a94-0b0699e4259d@gmail.com>
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
In-Reply-To: <9a43296c-d78d-49bf-9a94-0b0699e4259d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 16:00, Oleksii Kurochko wrote:
> 
> On 2/6/25 12:10 PM, Jan Beulich wrote:
>>>>> +        case 's':
>>>>> +            /*
>>>>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
>>>>> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
>>>>> +             *   conversion:
>>>>> +             *https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>>>>> +             *   Additional details of the workaround on Linux kernel side:
>>>>> +             *https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>>>>> +             *
>>>>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>>>>> +             * not valid ISA extensions. It works unless the first
>>>>> +             * multi-letter extension in the ISA string begins with
>>>>> +             * "Su" and is not prefixed with an underscore.
>>>>> +             */
>>>>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>>>>> +            {
>>>>> +                ++isa;
>>>>> +                ext_err = true;
>>>>> +                break;
>>>>> +            }
>>>>> +            fallthrough;
>>>>> +        case 'z':
>>>>> +            /*
>>>>> +             * Before attempting to parse the extension itself, we find its end.
>>>>> +             * As multi-letter extensions must be split from other multi-letter
>>>>> +             * extensions with an "_", the end of a multi-letter extension will
>>>>> +             * either be the null character or the "_" at the start of the next
>>>>> +             * multi-letter extension.
>>>>> +             *
>>>>> +             * Next, as the extensions version is currently ignored, we
>>>>> +             * eliminate that portion. This is done by parsing backwards from
>>>>> +             * the end of the extension, removing any numbers. This may be a
>>>>> +             * major or minor number however, so the process is repeated if a
>>>>> +             * minor number was found.
>>>>> +             *
>>>>> +             * ext_end is intended to represent the first character *after* the
>>>>> +             * name portion of an extension, but will be decremented to the last
>>>>> +             * character itself while eliminating the extensions version number.
>>>>> +             * A simple re-increment solves this problem.
>>>>> +             */
>>>>> +            for ( ; *isa && *isa != '_'; ++isa )
>>>>> +                if ( unlikely(!isalnum(*isa)) )
>>>>> +                    ext_err = true;
>>>>> +
>>>>> +            ext_end = isa;
>>>>> +            if ( unlikely(ext_err) )
>>>>> +                break;
>>>> This, otoh, is an error. Which probably shouldn't go silently.
>>> It is actually not an error, what it means that if version is mentioned or not, so
>>> (1) rv32..._zbb_zbc
>>> (2) rv32..._zbb1p2_zbc
>>>
>>> For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
>>> immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
>>> numbers.
>>> For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.
>> I don't follow. Why would ext_err be true for (1)? That's a well-formed
>> specifier, isn't it? rv32..._zbb.zbc (with the last dot meaning a literal
>> one, unlike the earlier ...) is an example of what would cause ext_err to
>> be true.
> 
> My fault, you are right, ext_err will be false for (1).
> 
> For your example, rv32..._zbb.zbc we have to do panic(), haven't we?

That's what I was trying to suggest earlier on. From anything we can't parse
we can't possibly infer whether we're able to run with the properties the
system has.

>>>>> +        default:
>>>>> +            /*
>>>>> +             * Things are a little easier for single-letter extensions, as they
>>>>> +             * are parsed forwards.
>>>>> +             *
>>>>> +             * After checking that our starting position is valid, we need to
>>>>> +             * ensure that, when isa was incremented at the start of the loop,
>>>>> +             * that it arrived at the start of the next extension.
>>>>> +             *
>>>>> +             * If we are already on a non-digit, there is nothing to do. Either
>>>>> +             * we have a multi-letter extension's _, or the start of an
>>>>> +             * extension.
>>>>> +             *
>>>>> +             * Otherwise we have found the current extension's major version
>>>>> +             * number. Parse past it, and a subsequent p/minor version number
>>>>> +             * if present. The `p` extension must not appear immediately after
>>>>> +             * a number, so there is no fear of missing it.
>>>>> +             */
>>>>> +            if ( unlikely(!isalpha(*ext)) )
>>>>> +            {
>>>>> +                ext_err = true;
>>>>> +                break;
>>>>> +            }
>>>> Like above this also looks to be a situation that maybe better would be
>>>> left go entirely silently. I even wonder whether you can safely continue
>>>> the parsing in that case: How do you know whether what follows is indeed
>>>> the start of an extension name?
>>> Lets consider examples:
>>> (1) riscv,isa=im
>>> (2) riscv,isa=i1p2m
>>> (3) riscv,isa=i1m
>>>
>>> (4) riscv,isa=i1_m1
>>>
>>> Note: Underscores "_" may be used to separate ISA extensions to improve readability
>>> and to provide disambiguation, e.g., "RV32I2_M2_A2".
>>>
>>> (1) isa="i" so ext = "m" => no minor and major version between "i" and "m" => `ext` contains the name
>>>       of the next extension name, thereby we will break a loop and go for parsing of the next extension
>>>       which is "m" in this example
>>> (2) isa="i" => ext="1" => algorithm will go further and will just skip minor and major version for
>>>       this extension (1p2 => 1.2 version of extension "i")
>>> (3) just the same as (2) but will stop earlier as minor version isn't set.
>>>
>>> Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
>>>         extension from device tree binding point of view.
>>> (4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
>>>       after "_" is an extension name again.
>>>
>>> Considering that "_" is illegal from device tree point of view between single letter extensions we should have
>>> ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
>>> Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
>>> in this array.
>>>
>>> Interesting that device tree binding doesn't cover this case:
>>> ```
>>> Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
>>> it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
>>> 2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
>>> ```
>>> if I correctly interpreted the pattern:pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
>>> And it also doesn't support versions for single letter extensions.
>>> So "rv32i2_m2_a2" or with using "p" is impossible?
>>> Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
>>> just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).
>> All fine, but what about e.g.
>>
>> (5) riscv,isa=i?m1
> 
> It is impossible from device tree point of view:
> 1. According to DT's patter after single letter extension couldn't be version.
> 2. Between "ima" can't be anything.
> 
> But it shouldn't break an algorithm because:
> (1) parse "i" and nothing wrong with that.
> (2) "?" will be ignored because we have a check at the start of single letter extension case:
>         if ( unlikely(!isalpha(*ext)) )
>      so ext_err will be set to true
> (3) "?" will be ignored and go just to "m" because of set ext_err=true at the step (2).
> (4) Then "m" will be parsed successfully and 1 will be just ignored.
> 
> Does it make sense?

See above - I don't think we should continue to run if parsing fails. Of
course we might, after tainting the system, in a best effort manner.

Jan

