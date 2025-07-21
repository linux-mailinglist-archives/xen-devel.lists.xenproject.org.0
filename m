Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8EFB0BCD4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051019.1419334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkCx-0004UQ-Ul; Mon, 21 Jul 2025 06:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051019.1419334; Mon, 21 Jul 2025 06:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkCx-0004SY-QF; Mon, 21 Jul 2025 06:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1051019;
 Mon, 21 Jul 2025 06:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udkCv-0004SS-Rh
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:41:05 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab884fa1-65fd-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 08:41:03 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so3033867f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:41:03 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca24219sm9155344f8f.15.2025.07.20.23.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:41:02 -0700 (PDT)
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
X-Inumbo-ID: ab884fa1-65fd-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753080062; x=1753684862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u0uzwHh3vU9xgCR0a4y3Jdj6LI+4GmBiT/45khk9PLA=;
        b=Bjbjy88NXC57UYe1rXhCzIUo5oScje7Z0+h+mbQMNfmNIM4xDvNTM9aJ6ylny1rfPY
         A7sYoPa9usVDDrOrCxmQPfJ04QPiSQwEkijJjaZuIsf83czlO7W+BK3mYMcJP+GVwXeG
         R8ZOXdDAEZR77i5/5UuMN3CXHd3hLUeoHaYttPg9HfZKvtLYkmaut5A7rtXQ5UhD69+N
         Iuo1Km0btubNaUbv4ogIjLCJp777RYprUMx/bBNKHjVwKo7aNOatJhF21b3YvWZAi/rY
         JbxoIdJoWjZs20sQYQK60W4StAnn8EswF4rivG7UoP4VKYQUK/MwkJ1RZgXfOCAHvVoF
         KD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080062; x=1753684862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0uzwHh3vU9xgCR0a4y3Jdj6LI+4GmBiT/45khk9PLA=;
        b=Jq1g8TGrm28N/ClUtu9ytSkGMkaY7noccsKkwLjGnLiBZ6lFjT2pof8oX9T6fNrL6X
         ah2N0CIQkKe/u6IPIosFEpkrHg5KcpCORzD1Fi3zJclYr4vByKAK3A/Z4CWBQdIQklf+
         BljGSYNbm6lmcjS+RMt/L2+XqSjRFUFBzgd8bdk0AZEjY6Y2Du6pPcYEcEZd4ksXbakT
         3ezLOFQnVJS4GJyk4Mq9BUBIjsEE1SfWgoKeYfIhLzjJl/CGtSpJfPLht3C/XSgaRuG6
         m/XUn2HTKEzEgpanWqbgnFUj6zbFPHByzVrhCAOT+x+b3XTWJC2amZeHxLQFq8uGRXOs
         3TXw==
X-Forwarded-Encrypted: i=1; AJvYcCXmToPqY9dlCAqxl2phT4UMhbYvyi/HljiTMI6MrSUx84azVdMhDk5L7AzT185CeimvJ/+b6KLaBVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjZ9xOeZ8zsHrGjHn4ze/h4zfPBIiwntsqmI6VEawVVy5SrUkN
	3P8w8RFLh6+aH4rJgZp6OW32X0nA0KMWu/u587iHjfbRNIrGFoi6PQdbcuIHnla2nA==
X-Gm-Gg: ASbGnctgy0IC9f31fyWWQ2nj/eKpZ0LBQswuSW3j6JQmxJpWZiNfNdfWFMjkS0RIF/9
	2d3W5Hn11Wga2IGb0f9SxuzgWzNXyMQ1JGodul6YU50wq3ga5E7RS2i9TE0D5XfQL7DOkCRqT7/
	HKUUVCcUSoiBcDE7Fely9hHLPjg9eGDUnGECM4SwB22lct4i04Ik46rtneyl0L+LdaEH+GUJg/1
	QnXXhvx9fN26Fhuwpba0r3gU9l8g4O0lnnDXFGax9K3ipC9HjTOVpHg+T6LpWrALm/N/CgtaSBW
	QNj/bz54m0WmHb0HzJcZftW7SP1642ggWS2/7ET2yK6a4SVQhy/GFAv4fHxLshFwajQQJXyqh5a
	XjscokrtxgSInYtOE2N9fegxpauxySBuETqU6S7+ADw1JQyMSPWY5n3ihX+eQvJOpIFBJi8zdAb
	lv6ih64XxKywCCnnhypsEnXE4rKCb6zMQxK7a52omFv53CYDCwgmAlfC9e3yZLJ5rOMIs=
X-Google-Smtp-Source: AGHT+IHFwqwL3/AjXa6b7N9kQjYtz1vusj5vcGOuC+cr3cooLpvHsx4bPU/OgnswtK6wV3l4YV5btg==
X-Received: by 2002:a05:6000:310d:b0:3b6:c6b:e4e6 with SMTP id ffacd0b85a97d-3b60e4be9b2mr15973918f8f.11.1753080062280;
        Sun, 20 Jul 2025 23:41:02 -0700 (PDT)
Message-ID: <dd20bc85-e5b3-480a-aaeb-4248a427f6ff@suse.com>
Date: Mon, 21 Jul 2025 08:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Rework TRY_LOAD_SEG() to use asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.07.2025 22:25, Andrew Cooper wrote:
> This moves the exception path to being out-of-line within the function, rather
> than in the .fixup section, which improves backtraces.
> 
> Because the macro is used multiple times, the fault label needs declaring as
> local.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Slightly RFC.  I haven't checked if Eclair will be happy with __label__ yet.

Even if it is, I guess you'd need to update the list of extensions we
use (docs/misra/C-language-toolchain.rst)?

> It is disappointing that, unless we retain the xor/mov for the exception path,
> GCC decides to emit worse code, notably duplicating the mov %ds success path
> in mov %es's error path.

Is it the pair of XOR/MOV, or merely the MOV (in which case it might be
nice to try omitting at least the XOR)? Yet then the dual purpose of the
zero is likely getting in the way anyway.

> The "+r" constraint was actually wrong before; the asm only produces
> all_segs_okay and does not consume it.

Yet it only conditionally set it in the old construct. That still needs
expressing with "+r", or else the variable's earlier setting could all
be eliminated. In the new construct using "=r" is okay.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1738,17 +1738,22 @@ static void load_segments(struct vcpu *n)
>       * @all_segs_okay in function scope, and load NUL into @sel.
>       */
>  #define TRY_LOAD_SEG(seg, val)                          \
> -    asm_inline volatile (                               \
> -        "1: mov %k[_val], %%" #seg "\n\t"               \
> -        "2:\n\t"                                        \
> -        ".section .fixup, \"ax\"\n\t"                   \
> -        "3: xor %k[ok], %k[ok]\n\t"                     \
> -        "   mov %k[ok], %%" #seg "\n\t"                 \
> -        "   jmp 2b\n\t"                                 \
> -        ".previous\n\t"                                 \
> -        _ASM_EXTABLE(1b, 3b)                            \
> -        : [ok] "+r" (all_segs_okay)                     \
> -        : [_val] "rm" (val) )
> +    ({                                                  \
> +        __label__ fault;                                \
> +        asm_inline volatile goto (                      \
> +            "1: mov %k[_val], %%" #seg "\n\t"           \
> +            _ASM_EXTABLE(1b, %l[fault])                 \
> +            :: [_val] "rm" (val)                        \

Thoughts on replacing "_val" by "sel" on this occasion?

> +            :: fault );                                 \
> +        if ( 0 )                                        \
> +        {                                               \
> +        fault: __attribute__((cold));                   \
> +            asm_inline volatile (                       \
> +                "xor %k[ok], %k[ok]\n\t"                \
> +                "mov %k[ok], %%" #seg                   \
> +                : [ok] "=r" (all_segs_okay) );          \

Purely formally I think you need "=&r" here now.

Jan

