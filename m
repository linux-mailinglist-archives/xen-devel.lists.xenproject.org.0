Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A39842789
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673542.1047924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfp-000470-5B; Tue, 30 Jan 2024 15:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673542.1047924; Tue, 30 Jan 2024 15:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfp-000445-2V; Tue, 30 Jan 2024 15:05:17 +0000
Received: by outflank-mailman (input) for mailman id 673542;
 Tue, 30 Jan 2024 15:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUpfn-0003Gj-AX
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:05:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87d09b9-bf80-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 16:05:14 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33ae6dfa923so1743369f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:05:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw7-20020a056000090700b0033afcb5b5d2sm1523155wrb.80.2024.01.30.07.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 07:05:13 -0800 (PST)
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
X-Inumbo-ID: f87d09b9-bf80-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706627114; x=1707231914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLG0RfwlMKwrfS+NMbvHMbiGZR989lBlU3VKUG3C9Aw=;
        b=ZDRRoiW/HAt9AfWvcKHwra0vEFKhEWdlsY1/xlczFmIYQwaxjJ8BJsbBsn3TFcQhAr
         BERXnZGVlEY1YfSgdjYn0E2pBuvBGDNcla/teYsCc7KDg6uYSDwxtJp4wU1x7tRnnDns
         28dRiJCWQSOw6N0WCdKcfM9dmLt5WEsFZvmGhKNw2F0fEm8AISWMiYAnjil37s4ExVjd
         ReAzebPNmvqkQVhOgN2VTwWsFK6JsoJ5exwKajFd3G1tRvuIdZSMOkiz49lUDxQCY3jr
         WFZAXlEIvMcYSYISKYnmorkwikUbuovRfCPOstq+YC81nk8p17Go2n3AQT3wxpYTFRtU
         4u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627114; x=1707231914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLG0RfwlMKwrfS+NMbvHMbiGZR989lBlU3VKUG3C9Aw=;
        b=PEWaeKf4YS6hAQFxlQoK+k6lcyLog6TsekW+wEcskThAP8bn6zx/BEUKEfFDRC8pCu
         L/PsULMp0th+iyTDWj9pDO5O9S/dBICgLglaWkC5TpVKi341bXAcJOVWl+BtQIDHAgii
         JdNwJqa1L98z+jU/TGltkJSaq7kdRKw3/sz0+mUlNi0EQUAFYsfwh0EflPKAjgqip1FM
         bN8HKoil8vFrC71iNHgHY6+PQ5q/XQ5uZTVGg2Gi9tSx1HoNZnhEButF2lDcBzPTMDUl
         N91V6Pb/Y460Awls8ksWm19Rj7GQ2qFz/XgNpeAH3sg5r48FkRBYDbg0rqkb0r+xxVq6
         eIdg==
X-Gm-Message-State: AOJu0YydA8wveqlB9U8gWp2paMRcZxe8GcSnbXQn27wSu1Ta4SEL3gxU
	tkmmu7gIJXwU1YnA+ouBfOLiwrLFVpxKOu4ADLgLMGqnywhzUzLPQ9Jtihu0lg==
X-Google-Smtp-Source: AGHT+IFAp5kXLF/q/5Z5piri9DuA+Hqcl8glhuByjpY81wbSf/dr1mfOsZK2iNre9GAYgDsftf9eZA==
X-Received: by 2002:a5d:64c9:0:b0:337:2e16:218d with SMTP id f9-20020a5d64c9000000b003372e16218dmr6999587wri.68.1706627113694;
        Tue, 30 Jan 2024 07:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW1B/MDq15HNKaHCDX49ZYacTtEZL5BSRQoSDHcd4jXWHFxLv18uybrJFBlGkrGGhBwCEca7ncHLKowpM315OZVlzWAK6pnJzvaoMimTE+bNqcldUZZU0/YQFMoGiSb3ly84yZ4L++O9sbcYVTpsvNiykpuJK+Ic9ERex9g1ALgR4DcWE5vkFqD4iYWxF2zSinjGTRe7v/QFpAAumbk5BRk5kZiamnxg80+4CZ4pAdRt0LpXmX6qp6yazyCzDWWDMX2f+JtIoVUoQ/VEaFLwCny+nI1xwR2po1GmD/wcu7YqCu27GNHO34=
Message-ID: <9e604a3e-fac7-49dd-8f84-744e72ba71b7@suse.com>
Date: Tue, 30 Jan 2024 16:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
 <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
 <848bcb2d7e5357ca6d3672bef52ac57c5b1f7f95.camel@gmail.com>
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
In-Reply-To: <848bcb2d7e5357ca6d3672bef52ac57c5b1f7f95.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2024 15:57, Oleksii wrote:
> On Mon, 2024-01-22 at 17:27 +0100, Jan Beulich wrote:
>>> +#define __xchg_acquire(ptr, new, size) \
>>> +({ \
>>> +    __typeof__(ptr) ptr__ = (ptr); \
>>> +    __typeof__(new) new__ = (new); \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    switch (size) \
>>> +	{ \
>>> +    case 4: \
>>> +        asm volatile( \
>>> +            "	amoswap.w %0, %2, %1\n" \
>>> +            RISCV_ACQUIRE_BARRIER \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    case 8: \
>>> +        asm volatile( \
>>> +            "	amoswap.d %0, %2, %1\n" \
>>> +            RISCV_ACQUIRE_BARRIER \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    default: \
>>> +        ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>
>> If I'm not mistaken this differs from __xchg_relaxed() only in the
>> use
>> of RISCV_ACQUIRE_BARRIER, and ...
>>
>>> +#define xchg_acquire(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr))) __xchg_acquire((ptr), x_,
>>> sizeof(*(ptr))); \
>>> +})
>>> +
>>> +#define __xchg_release(ptr, new, size) \
>>> +({ \
>>> +    __typeof__(ptr) ptr__ = (ptr); \
>>> +    __typeof__(new) new__ = (new); \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    switch (size) \
>>> +	{ \
>>> +    case 4: \
>>> +        asm volatile ( \
>>> +            RISCV_RELEASE_BARRIER \
>>> +            "	amoswap.w %0, %2, %1\n" \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory"); \
>>> +        break; \
>>> +    case 8: \
>>> +        asm volatile ( \
>>> +            RISCV_RELEASE_BARRIER \
>>> +            "	amoswap.d %0, %2, %1\n" \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory"); \
>>> +        break; \
>>> +    default: \
>>> +        ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>
>> this only in the use of RISCV_RELEASE_BARRIER. If so they likely want
>> folding, to limit redundancy and make eventual updating easier. (Same
>> for the cmpxchg helper further down, as it seems.)
> Also the difference is in where to place barrier before or after atomic
> instruction. I am not sure that we can easily folded this macros.

The folded macro would have two barrier parameters - on for acquire, one
for release.

Jan

