Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A0B2668B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081686.1441701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXlH-0001nX-Tq; Thu, 14 Aug 2025 13:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081686.1441701; Thu, 14 Aug 2025 13:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXlH-0001lb-R7; Thu, 14 Aug 2025 13:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1081686;
 Thu, 14 Aug 2025 13:12:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umXlG-0001lV-Gu
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:12:54 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6225cba7-7910-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 15:12:52 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7a3b3a9so133174766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:12:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a396fsm2602355866b.42.2025.08.14.06.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 06:12:51 -0700 (PDT)
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
X-Inumbo-ID: 6225cba7-7910-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755177172; x=1755781972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QrH0g3z8vfq5qfd1P0V6MRrlXghDtoggjXJky0P56oM=;
        b=auFLkPlxpAoBv18+whPnRjaRMOG3xK20nyizVGSu/b6e9Y1iakEMFv835QHL6I8Dnk
         +VnIbEJmFQEP0kf2YDMWaVRipk0z2GzZBSBq5SRnGMqCr8Endj1IjjykHQJCZCS+i/4h
         UwWJs8DWI9MGL/CxmixkP03VQE2kGTD1sHF2woM8BldR5yy0xDEOi1xn6HGiGIikf88y
         DD/ZU7uYzqZLYUL/uDkgHABGXZ2nA1W45lb45BcD0izavOL/SF4YHeuOlb7i2btPPZgH
         vKk3j0/vFx4BEt8sLvDDhw8funOHj25WmDajz677Y0mYDIcRwjdKKx1TfIK493wB8hj6
         pXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177172; x=1755781972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrH0g3z8vfq5qfd1P0V6MRrlXghDtoggjXJky0P56oM=;
        b=EiHtbLPraeCzj+tlpNqkc2JY1Bne5EX+Yjrd/BHyCIAo5vDuUm1g7VVRFSnFLbSGYr
         QFeG9a3VoWZXR3gBXryynRdYoqh6CuVKSPFsZ6Q1dfN94ZOZ4XD6y2SPQOcbPYez1ShW
         +/7+MYOJk0V8+ks72fIN055AJgqYIT4ZJFjgAumIIMHTA/nD3MFXB3VGJyN7Mt25Ckul
         Z/hibbC/dJ2Gz9TdkXT09G9TTend2gZjzyfDKTfaAbxeJt0QRcKMh5qfhkSLesmNZH1O
         l7oj1ndGLXUyfzUVvno2pdP9pls1dhJbdsFA1fMPiqgj1YNYGwUfQhzmPqnAuGOGeLTt
         pzAg==
X-Forwarded-Encrypted: i=1; AJvYcCWIHC9Pv9hRH0OPeKd0WQsHcUa5G8E1wD/tLFqX9TwlUkq60/VlDzpu+J19OHm2qxfL4rsObH0NEIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqHzBAPNXuX0wuVgxPzgNNvQEJn0SI5GICyZiiw7Dv1U7xHoCU
	R5VybDyRJyKq8k4P5dC4U1kRDSmsv/ZeayJPFOZkTjYAvHq/wmhlmVSE77IGTtOzqQ==
X-Gm-Gg: ASbGncvrKq00O9tkyTYtM4mTz17TZu5TrJndjSgXVYPEbwpnbZV28g2liG3sk75A8HX
	hD0Wht+V4I0JrF+uQZw78ER1PK54j0zyqaPwwk2GyhBBW9b7/S7kU92wPj+gUauSmOgfUesG/td
	qOepZprDR91BYWKyUsv6TR/JPxNb/A0dIbapfX3ysGBNIoYQ2cH8yrfh+jYgAMo4v3JKBkf9l8P
	v3Opiyw7l/HAKSLPg/qK0T5v36ZJbQEhlPiJDGDHGJC4s2nau6ZsFp1Eo1uuy9qR967dxLn/c4v
	TYD+W72fsOoXPbJI14vs7iILG5USd1kDZUtaSmZU8wPXXaHFvzmiaao4dSucMFURNH4Uu3O+sBa
	tXR2749yNRHWo/E0IvIb5HosbUsKlnhh8rQiNDdhSLbaXsekW8ZdoeFLoILZgSrTCmDupHpx1TW
	IX1lyDIbw=
X-Google-Smtp-Source: AGHT+IGYaE95PZBOPtszuyJ22ZjFRT2+OS5/v7tXpsRSI9qxpARDXDOQmoZ/R1B+n56hnnFHAEY40A==
X-Received: by 2002:a17:907:94c1:b0:af9:116c:61cf with SMTP id a640c23a62f3a-afcb98e90a0mr290064666b.43.1755177171570;
        Thu, 14 Aug 2025 06:12:51 -0700 (PDT)
Message-ID: <a16deee1-de3b-4850-852a-f45aeaa982f2@suse.com>
Date: Thu, 14 Aug 2025 15:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] x86/traps: Extend struct cpu_user_regs/cpu_info
 with FRED fields
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-15-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> @@ -42,17 +46,76 @@ struct cpu_user_regs
>       */
>  
>      union { uint64_t rip;    uint32_t eip;    uint16_t ip; };
> -    uint16_t cs, _pad0[1];
> -    uint8_t  saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
> -    uint8_t  _pad1[3];
> +    union {
> +        struct {
> +            uint16_t      cs;
> +            unsigned long :16;
> +            uint8_t       saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */

Would this better be reproduced ...

> +        };
> +        unsigned long     csx;
> +        struct {
> +            /*
> +             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state of the
> +             * interrupted context.
> +             */
> +            uint16_t      cs;
> +            unsigned int  sl:2;      /* Stack Level */
> +            bool          wfe:1;     /* Wait-for-ENDBRANCH state */

... here as well, just like you reproduce "cs"?

> +        } fred_cs;
> +    };
>      union { uint64_t rflags; uint32_t eflags; uint16_t flags; };
>      union { uint64_t rsp;    uint32_t esp;    uint16_t sp;    uint8_t spl; };
> -    uint16_t ss, _pad2[3];
> +    union {
> +        uint16_t          ss;
> +        unsigned long     ssx;

What use do you foresee for this and "csx"?

> +        struct {
> +            /*
> +             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state about
> +             * the event which occured.
> +             */
> +            uint16_t      ss;
> +            bool          sti:1;     /* Was blocked-by-STI, and not cancelled */
> +            bool          swint:1;   /* Was a SYSCALL/SYSENTER/INT $N */
> +            bool          nmi:1;     /* Was an NMI. */
> +            unsigned long :13;
> +
> +            /*
> +             * Bits 32 thru 63 are ignored by ERET{U,S} and are informative
> +             * only.
> +             */
> +            uint8_t       vector;
> +            unsigned long :8;
> +            unsigned int  type:4;    /* X86_ET_* */
> +            unsigned long :4;
> +            bool          enclave:1; /* Event taken in SGX mode */
> +            bool          lm:1;      /* Was in Long Mode */

The bit indicates 64-bit mode aiui, not long mode (without which FRED isn't even
available).

> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -38,6 +38,8 @@ struct vcpu;
>  
>  struct cpu_info {
>      struct cpu_user_regs guest_cpu_user_regs;
> +    struct fred_info _fred; /* Only used when FRED is active. */

Any particular need for the leading underscore?

Jan

