Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC3972FA4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795204.1204407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxYl-0002Pp-Gi; Tue, 10 Sep 2024 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795204.1204407; Tue, 10 Sep 2024 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxYl-0002Mo-Df; Tue, 10 Sep 2024 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 795204;
 Tue, 10 Sep 2024 09:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxYk-0002Mi-9U
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:53:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804c72a9-6f5a-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:53:16 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d3e662791so166743666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:53:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41cd7sm4065977a12.3.2024.09.10.02.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:53:15 -0700 (PDT)
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
X-Inumbo-ID: 804c72a9-6f5a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725961996; x=1726566796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=joXS0NkW0y36NaAmN2/+qvbBVpaCn4OA2oPfnyXqlCk=;
        b=KyFZpLqxq405F4V3ovg5tSN/wsdNj7M/BWvBYLRmeCDklhJYcG3SqFOvY2oKQMlaZl
         x8/QuMJ3QT4JivNbQwpOrhExm/AmDArWDRJ6VroWu8S2XosUtNi2FsdcAEY8KsKWztbe
         snvUalIIQ2twEz43eWLrqEG8Fx/4OQl6QCQf/nr6dY388brGm8lHX+lcG+BWs3NfdmcE
         Ib8bvFWVbVmsJoUOf6QLVjOj7J9h/WppFst28+922iygYnU5+RFy4ETilKw/lqKFWN+3
         PQJ8wb+mq00DRGFgyHlJx47hEtOzgJEXwcmMqfpTbZxnHjXCl5dPqEl15/i0gGmVUXy7
         Qftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725961996; x=1726566796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joXS0NkW0y36NaAmN2/+qvbBVpaCn4OA2oPfnyXqlCk=;
        b=mSDo+/yrgKh+DqARywSZOJ1+BLv9h91SWFJmX5pyIsFk8E0Gyf3fQy4ZLmAfiPJB8P
         ZvnV3bt689p812+Zq+0997NxTgh93m96MdlWQhbWXoA59LZ+e4g6QTe9JB8CYc4mGm5r
         gd4qcISdhvLrHRhNEjKEM99elN7H+HVTd2FAV/VHb2B//79DrMOYCByOtAYrIAadTIf4
         kZsw5mZ85J/Hc7YPHA2eWrkq+389FgLAtHu0KiNbNfN/0/D2aSDW9GSpVq4xkLYZi3Mc
         5eEU6gHpkQQ7335eXzOdvPig1tVigpvuwpwncRT+a/Y+w4tIJaYUXUOGu0gaGDIagpIY
         OP8g==
X-Forwarded-Encrypted: i=1; AJvYcCWOTyWQQKYVzc7pdes3IO6lt2CqKING6Tn2WaAhUr/o4UgezLvSeE954xjFfnFTh0TxLzxujoK5TIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCk4syq5NCWNwpH6mG5yQ8LJfUdqD2kZ1A/DMdMsmNA6ydqDDj
	qSpVE/KLVZMdhQODTMpwqq3BHBk6a21gXTVitt9HlgqpRsgdOBU7RGx1pQ+wZw==
X-Google-Smtp-Source: AGHT+IEMiCS6yfDhknvHebyznACo07hm4o3C2A+6XBqOX9/hHd9UMUWvzC8fOVpJ3tl53DT2iX4lCA==
X-Received: by 2002:a05:6402:849:b0:5c4:8b7:d93d with SMTP id 4fb4d7f45d1cf-5c408b7da2bmr481944a12.18.1725961995500;
        Tue, 10 Sep 2024 02:53:15 -0700 (PDT)
Message-ID: <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
Date: Tue, 10 Sep 2024 11:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/atomic.h
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -54,16 +54,16 @@ static always_inline void read_atomic_size(const volatile void *p,
>  })
>  
>  static always_inline void _write_atomic(volatile void *p,
> -                                        unsigned long x,
> +                                        void *x,

Pointer-to-const please, to further aid in easily recognizing which
parameter is what. After all ...

>                                          unsigned int size)
>  {
>      switch ( size )
>      {
> -    case 1: writeb_cpu(x, p); break;
> -    case 2: writew_cpu(x, p); break;
> -    case 4: writel_cpu(x, p); break;

... unhelpfully enough parameters are then swapped, just to confuse
things.

> +    case 1: writeb_cpu(*(uint8_t *)x, p); break;
> +    case 2: writew_cpu(*(uint16_t *)x, p); break;
> +    case 4: writel_cpu(*(uint32_t *)x, p); break;
>  #ifndef CONFIG_RISCV_32
> -    case 8: writeq_cpu(x, p); break;
> +    case 8: writeq_cpu(*(uint64_t *)x, p); break;

With const added to the parameter, please further make sure to then not
cast that away again.

> @@ -72,7 +72,7 @@ static always_inline void _write_atomic(volatile void *p,
>  #define write_atomic(p, x)                              \
>  ({                                                      \
>      typeof(*(p)) x_ = (x);                              \
> -    _write_atomic(p, x_, sizeof(*(p)));                 \
> +    _write_atomic(p, &x_, sizeof(*(p)));                \
>  })
>  
>  static always_inline void _add_sized(volatile void *p,
> @@ -82,27 +82,23 @@ static always_inline void _add_sized(volatile void *p,
>      {
>      case 1:
>      {
> -        volatile uint8_t *ptr = p;
> -        write_atomic(ptr, read_atomic(ptr) + x);
> +        writeb_cpu(readb_cpu(p) + x, p);
>          break;
>      }
>      case 2:
>      {
> -        volatile uint16_t *ptr = p;
> -        write_atomic(ptr, read_atomic(ptr) + x);
> +        writew_cpu(readw_cpu(p) + x, p);
>          break;
>      }
>      case 4:
>      {
> -        volatile uint32_t *ptr = p;
> -        write_atomic(ptr, read_atomic(ptr) + x);
> +        writel_cpu(readl_cpu(p) + x, p);
>          break;
>      }
>  #ifndef CONFIG_RISCV_32
>      case 8:
>      {
> -        volatile uint64_t *ptr = p;
> -        write_atomic(ptr, read_atomic(ptr) + x);
> +        writeq_cpu(readw_cpu(p) + x, p);
>          break;
>      }
>  #endif

I'm afraid I don't understand this part, or more specifically the respective
part of the description. It is the first parameter of write_atomic() which is
volatile qualified. And it is the first argument that's volatile qualified
here. Isn't the problem entirely unrelated to volatile-ness, and instead a
result of the other parameter changing from scalar to pointer type, which
doesn't fit the addition expressions you pass in?

Also you surely mean readq_cpu() in the 8-byte case.

Jan

