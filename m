Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47472A64E5C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916659.1321711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9NK-0000Jq-Gv; Mon, 17 Mar 2025 12:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916659.1321711; Mon, 17 Mar 2025 12:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9NK-0000Iv-EJ; Mon, 17 Mar 2025 12:15:22 +0000
Received: by outflank-mailman (input) for mailman id 916659;
 Mon, 17 Mar 2025 12:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu9NJ-0000Ip-2a
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:15:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc78427-0329-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:15:18 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso20255915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:15:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3537sm14880293f8f.8.2025.03.17.05.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 05:15:17 -0700 (PDT)
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
X-Inumbo-ID: 7dc78427-0329-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742213718; x=1742818518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+iY/t+aG1F0v/mba54n10zeHBRwBrhrkn1rRM7r+GU=;
        b=S//U63nAvk1bwXhKWitrQkTV7m6fFlGuz6BtD9GuflY9jGLI5JdmlSlxz91mFCDMTO
         Au4zhcngkENHgXN7cQBIGmVNq4qzJCVNRXQ2j/N1VzBtlCQANNC6WveYR47MsMS1IztL
         kZDbHY525SMmh/KOZL83vmsYrZI22GEDZiQfxBBhSajtMyyrxkKOt40q6rqz7AFY9aIg
         2+eyWKFgePlls93e75IG0tlQ3jN0zg9odoXLysQp76FTytMpMf5u9u5VwNdoDi0ieB5P
         /a+NUzC7OsPsEH+ZDxVLQRsC2yGfqzvR/fA5D0NS4Mu2Ump9v0UGjH425W7niPOzOl1c
         V7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213718; x=1742818518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+iY/t+aG1F0v/mba54n10zeHBRwBrhrkn1rRM7r+GU=;
        b=M46FSrejxcQhT+lIDpCtjW6S5P9QJL05zjuFtyhqzkFvCJtUeWvlRg9L0xgDEJjAOV
         c/GGcSYa1c7Y3qAlKqAjZ4qQXw+VvEMdJq9Rj2/l+/Kamd4EGQD9B2588gsooKCz5NDP
         32B9Fd/RDgkYU4sQo4GoQrxtElygHmPJT1XNm0yIXvjV4vFIJdODUcn4pW0r0Wa9n3FF
         9ybfFMIolidilopLLUN5kP51wfOkDmQb7uujrOExZiE4Nq3wKqC4/kAswDdxDnAtarhJ
         9T3bEGz3EtSl8DrZt9qlUFxENOjbn3NOmlCLF7/WF1LhGC8PqsTJ1lA5MCY/VCyFkzAh
         wsvg==
X-Forwarded-Encrypted: i=1; AJvYcCXSEPQlnCH1hCnriG/2yxHlGBQ/OmBCW+kMs9QyzreBRTV7tW7MaUQ5OQp0MV1xCbaaRITM62mnNgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgdB+gC76OSTLFpBbH6tK6teYxwt1ZdrP4HmUNofku2h3TTE1E
	D7V7RNxJYVOVACYbd+VXktwl6Htai9I2QDA/eNPRLw15SxgXnHizLHAJxCVQvg==
X-Gm-Gg: ASbGncsbH3aNp6IxgBqD8U1s9tzAUBOhc+iUcym9aBcWX0cD41bFHZa+a/FCXx/deX9
	1OcJEkBYjRLenhWNkkTyghKCW3O/5B5qKGHWGxmI6Lpmdrf5Fe83py7b8cnnhqBIULNFmJZ62bZ
	KTgyV1KFv9EB0PW/OeyiUrTGiAHdRO6N4s99PrNQg3vXAK95twlVEJK3n2aoX7/dMMREoyLaPxh
	qlbFrXMWIVij5es88Ra0Z87kTjVNcYW5bUBxtP6EzaBKMzmebXVHtfOep4gQCLQaVg8Kj4d0+ED
	EZCv0TTPhI6T1k49oBq+MS2poIGuMKHWtmrw5YZZhAeFJwXZmZKc2l0MSFj50c4TUE2t+n2zo1V
	rji1MsIeoCR4QdLO5awzInuRkM5SKXQ==
X-Google-Smtp-Source: AGHT+IGNNlGNGfPeBV6DyJQAz73rllUQWPjm05YwM09BynYpp4xDjMT3rulqdpcupzDWsKbZUeWjeQ==
X-Received: by 2002:a05:600c:190e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d1ec808ebmr131458115e9.13.1742213718186;
        Mon, 17 Mar 2025 05:15:18 -0700 (PDT)
Message-ID: <8edba542-9844-409e-bbf0-5ff1c9287a10@suse.com>
Date: Mon, 17 Mar 2025 13:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/public: Split the struct cpu_user_regs type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> In order to support FRED, we're going to have to remove the {ds..gs} fields
> from struct cpu_user_regs, meaning that it is going to have to become a
> different type to the structure embedded in vcpu_guest_context_u.
> 
> struct cpu_user_regs is a name used in common Xen code (i.e. needs to stay
> using this name), so renaming the public struct to be guest_user_regs in Xen's
> view only.
> 
> Introduce a brand hew cpu-user-regs.h, currently containing a duplicate
> structure.  This removes the need for current.h to include public/xen.h, and
> highlights a case where the emulator was picking up cpu_user_regs
> transitively.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit, besides a few remarks, a suggestion below.

> Jan: Is this what you intended?

Yes.

> cpu_user_regs_t and the guest handle don't seem to be used anywhere.  I'm
> tempted to exclude them from Xen builds.

I concur. We can always re-expose them should they be needed somewhere.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef X86_CPU_USER_REGS_H
> +#define X86_CPU_USER_REGS_H
> +
> +#define DECL_REG_LOHI(which) union { \
> +    uint64_t r ## which ## x; \
> +    uint32_t e ## which ## x; \
> +    uint16_t which ## x; \
> +    struct { \
> +        uint8_t which ## l; \
> +        uint8_t which ## h; \
> +    }; \
> +}
> +#define DECL_REG_LO8(name) union { \
> +    uint64_t r ## name; \
> +    uint32_t e ## name; \
> +    uint16_t name; \
> +    uint8_t name ## l; \
> +}
> +#define DECL_REG_LO16(name) union { \
> +    uint64_t r ## name; \
> +    uint32_t e ## name; \
> +    uint16_t name; \
> +}
> +#define DECL_REG_HI(num) union { \
> +    uint64_t r ## num; \
> +    uint32_t r ## num ## d; \
> +    uint16_t r ## num ## w; \
> +    uint8_t r ## num ## b; \
> +}

Can we try to avoid repeating these here? The #undef-s in the public header are
to keep external consumers' namespaces reasonably tidy. In Xen, since we don't
otherwise use identifiers of these names, can't we simply #ifdef-out those
#undef-s, and then not re-introduce the same (less the two underscores) here?
Granted we then need to include the public header here, but I think that's a
fair price to pay to avoid the redundancy.

> +struct cpu_user_regs
> +{
> +    DECL_REG_HI(15);
> +    DECL_REG_HI(14);
> +    DECL_REG_HI(13);
> +    DECL_REG_HI(12);
> +    DECL_REG_LO8(bp);
> +    DECL_REG_LOHI(b);
> +    DECL_REG_HI(11);
> +    DECL_REG_HI(10);
> +    DECL_REG_HI(9);
> +    DECL_REG_HI(8);
> +    DECL_REG_LOHI(a);
> +    DECL_REG_LOHI(c);
> +    DECL_REG_LOHI(d);
> +    DECL_REG_LO8(si);
> +    DECL_REG_LO8(di);
> +    uint32_t error_code;
> +    uint32_t entry_vector;
> +    DECL_REG_LO16(ip);
> +    uint16_t cs, _pad0[1];
> +    uint8_t  saved_upcall_mask;
> +    uint8_t  _pad1[3];
> +    DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
> +    DECL_REG_LO8(sp);
> +    uint16_t ss, _pad2[3];
> +    uint16_t es, _pad3[3];
> +    uint16_t ds, _pad4[3];
> +    uint16_t fs, _pad5[3];
> +    uint16_t gs, _pad6[3];

I had to peek ahead at the last patch to figure why you introduce these 4 fields
(plus their padding) here, just to remove them again. Personally I think it would
be neater if both were folded; nevertheless I'd like to leave this entirely to
you.

Jan

