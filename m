Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFF947528
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 08:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771785.1182224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sar4y-0007WQ-Gd; Mon, 05 Aug 2024 06:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771785.1182224; Mon, 05 Aug 2024 06:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sar4y-0007U3-Dn; Mon, 05 Aug 2024 06:20:24 +0000
Received: by outflank-mailman (input) for mailman id 771785;
 Mon, 05 Aug 2024 06:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sar4x-0007Tx-4P
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 06:20:23 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb612f87-52f2-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 08:20:22 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso878385266b.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2024 23:20:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8884sm408764166b.193.2024.08.04.23.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Aug 2024 23:20:21 -0700 (PDT)
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
X-Inumbo-ID: cb612f87-52f2-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722838821; x=1723443621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=869kuP4Lnvrx5DEWD5/ojqqEgHTb0oU2mz3m4TNNB6o=;
        b=C/SEXyX7fEv9iiu2QSDHTtEuibEdY9kxTwm4aMvcpB+j4N5rnFc2ILmDKA3U71tuyw
         wWH9pTiCps7zfZLqMRVyz1Bz9cy+Y23nmF8sZveqr9TAPZ1SDUQbcmQfUkU/mTNMOEJl
         8KMBkSXmimoV0cys7bhWUKdXhRfP4ZGyHPmzSnb2tXQUQCoI6dUn4imcDXJq3/m9nTem
         2JD5qKtONXv3CLikdEhKM0oKOBfS8ca2rNkko/wxKCRLBWuQkm+v3l6HiRgMYb9GvAWq
         E7REEymku0K9pb3Z9ywAuB9E4yXIS2ZdbpmOvNOM/YgxuiuGUGpkT4/BspwbiyV/xHkH
         b1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722838821; x=1723443621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=869kuP4Lnvrx5DEWD5/ojqqEgHTb0oU2mz3m4TNNB6o=;
        b=W0QCEQPF8yjCnvG3vh1wXYSq+lDH6/Tz6JKsNxKIUgmkr4yCaA4FDFVgyYMutUCDa5
         wzGowMZvAg14+ChD/v5pRBWukxkK+mYzUmTy10ZTNZlNhTE57yI212yrM8yqbgANuSJu
         asFx9Ztmhn2071KysA6zdFaEvuevtBor5as+IwGltDw8fn9agacz7qhpC4WEhLTTFp1d
         2jaMqEhqKXqxI7qloFZN4raz/l8QVKEOTO7PheIlM6Y3/8qsSX7qDcDQ9KLBQKo7wnQB
         IIMJTbBL0Cn10dDAojqUJQm8c8EW959NrCSGYhmEqYsp6rgwnkuM6PSiBSbjpjl54+H8
         OKkw==
X-Forwarded-Encrypted: i=1; AJvYcCX+4ZQaaZtuIY2NdfGepPlTBTjXptt9sIf1mraB/7G4x4pNvKwZgbOK3k+E44+jKzWjyV92guazb7PbdTRi6S6sPIrt7uWkNYEmnvX/yYI=
X-Gm-Message-State: AOJu0Yz50uV3rK+r7Ips/K+n/R4/veFF1bmGI4ALljV5k+yNs05yI8r9
	Icav3Ej9/GRBLEUhrtRzgNhKvnjYzD1UmrcsY50xKGKOcqAR9N+AS3pSN397tQ==
X-Google-Smtp-Source: AGHT+IFUzIPQY1vXxHwadlUQvYMUkWZjk+hlU4MTFsblcEf6PGBWwImYDY/Lt9jEzWjy2AABNwM4lg==
X-Received: by 2002:a17:906:eec3:b0:a77:d9b5:ad4b with SMTP id a640c23a62f3a-a7dbcbd5b6cmr1185379566b.9.1722838821358;
        Sun, 04 Aug 2024 23:20:21 -0700 (PDT)
Message-ID: <361eb1c3-003b-47d2-bcd9-0f06e91bfd0a@suse.com>
Date: Mon, 5 Aug 2024 08:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] xen/riscv: refactor decode_trap_cause()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
 <88e15908d6ac363934b6da52091443af28bd7291.1722605952.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <88e15908d6ac363934b6da52091443af28bd7291.1722605952.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 15:54, Oleksii Kurochko wrote:
> Use array_access_nospec() to prevent guest speculation.
> 
> Avoid double access of trap_causes[cause].
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> @@ -48,9 +49,10 @@ static const char *decode_trap_cause(unsigned long cause)
>          [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
>      };
>  
> -    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
> -        return trap_causes[cause];
> -    return "UNKNOWN";
> +    const char *res = cause < ARRAY_SIZE(trap_causes) ? array_access_nospec(trap_causes, cause)

... the overly long line here suitably wrapped; commonly we'd do this
as ...

> +                                                      : NULL;

    const char *res = cause < ARRAY_SIZE(trap_causes)
                      ? array_access_nospec(trap_causes, cause)
                      : NULL;

I guess I'll adjust this while committing.

Jan

> +    return res ?: "UNKNOWN";
>  }
>  
>  static const char *decode_reserved_interrupt_cause(unsigned long irq_cause)


