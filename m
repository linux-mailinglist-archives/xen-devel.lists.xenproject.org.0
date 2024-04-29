Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAE8B5D37
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714205.1115324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SlP-0001GX-CS; Mon, 29 Apr 2024 15:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714205.1115324; Mon, 29 Apr 2024 15:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SlP-0001EZ-9R; Mon, 29 Apr 2024 15:17:55 +0000
Received: by outflank-mailman (input) for mailman id 714205;
 Mon, 29 Apr 2024 15:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1SlO-0001ER-92
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:17:54 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a57618cb-063b-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:17:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34c90082dd7so1994631f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:17:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4b87000000b0034cf3001104sm3793635wrt.33.2024.04.29.08.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:17:51 -0700 (PDT)
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
X-Inumbo-ID: a57618cb-063b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714403871; x=1715008671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/eP+fRRl8UUnLiR47sXHSzrJa42Vx1Zgp+yaAriLm0=;
        b=Qe68pR20enuLloTc6DkIu1auTo48m1Xyq2XaGPSs9cmcc+LXNLYHOtf/yoE76AZ5Vr
         A7Fmrqjlus84ymWVIF1plHx/wEKX/EPBFEI4O+PGo6i6Ytq9tPjnSJa1a1qjxN2W9lJS
         /yWjcd6uxhVFtYhayB4ztxQhjf3QlUty10DEiWWbReYctGJK9/Q8qDD9b2MeA7nlEZfz
         OirbsOioH2ZKvO3wk9TTL/qWhqXbGzyqZxYS7iX4/1Z41q6jcyab1s1MB2C1P3XEiVio
         gtDymhXu1q552USEGXJLD9U0ZK2/OANQ0jWZmuFAzOmrrqmiaWmf/cW5qIiW7cuAjiAr
         TQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403871; x=1715008671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/eP+fRRl8UUnLiR47sXHSzrJa42Vx1Zgp+yaAriLm0=;
        b=IV4316XHXfb5tR5k651qaZEf0T88o3FJmR9NnTVd4gnmk3TcVw7Xvs/ygGncUKZn4n
         U6qbLH7vxAgBP3D526Ff4iyEgwh5tDNNymDiLO1svyCAmjhGaMKqaGw/2elZ9W2uiY5r
         OlTMfxMuCUxmT33BnkIlyl+SrA0FLhWPVvunU/ZbyaC1xKenhhik+G1NUpj17P0fnsf2
         DX1JygRK3HJzL0neBo9pxjbyGaVlniw9rJgtdrxhJs7nNW8YvJylgxvlEJ9XPyt0jADo
         8wPbZWbldgDuoFoqUfehdfKCg+iqsNYZqVTn0lwT7OWe3TsBIXiy1wXD2kdxNt54KbuY
         oSLg==
X-Forwarded-Encrypted: i=1; AJvYcCXMg2QvU27q5H2C5BzgTKzmZawyqFxYt0o7UZPs6jf0rWuHKIevQKOE55vACepcXZANwabmZNtpD4/HQSaG7Xxcl6hbUYsAOEJ/fz/V3+M=
X-Gm-Message-State: AOJu0YyyU3I0O2ckEofNEi1mtBTyuvhFvysZlmrZkqfRwzht+rqP03Hk
	mc36NyO48Gcd6tNr8c2VxexBZQIDB7iTWthg/6UDN60O9JE1lEZw2om/71+p9w==
X-Google-Smtp-Source: AGHT+IERQe84pJwqUuCVgagW5ajwuCCLZhObe2muya2b4iKV/D3boYcvVZ/rJeJAfKHZfC78vqty5A==
X-Received: by 2002:a5d:51cc:0:b0:34c:719e:6786 with SMTP id n12-20020a5d51cc000000b0034c719e6786mr6906363wrv.4.1714403871582;
        Mon, 29 Apr 2024 08:17:51 -0700 (PDT)
Message-ID: <b7db597f-469c-48b0-ba0a-6a62a1e6de36@suse.com>
Date: Mon, 29 Apr 2024 17:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] gzip: move crc state into gunzip state
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-9-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 18:34, Daniel P. Smith wrote:
> Move the crc and its state into struct gunzip_state. In the process, expand the
> only use of CRC_VALUE as it is hides what is being compared.

Andrew mentioned uint32_t only for the description, but I think you want
(maybe even need) to go further and actually use that type also, e.g.

> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -20,6 +20,9 @@ struct gunzip_state {
>  
>      unsigned long bb;      /* bit buffer */
>      unsigned int  bk;      /* bits in bit buffer */
> +
> +    uint32_t crc_32_tab[256];
> +    uint32_t crc;
>  };

... not just here, but also ...

> @@ -72,7 +75,7 @@ static __init void flush_window(struct gunzip_state *s)
>       * The window is equal to the output buffer therefore only need to
>       * compute the crc.
>       */
> -    unsigned long c = crc;
> +    unsigned int c = s->crc;

... here.

> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -1032,16 +1032,12 @@ static int __init inflate(struct gunzip_state *s)
>   *
>   **********************************************************************/
>  
> -static ulg __initdata crc_32_tab[256];
> -static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
> -#define CRC_VALUE (crc ^ 0xffffffffUL)

Note how this is _not_ same as ~0u, also ...

> @@ -1069,11 +1065,11 @@ static void __init makecrc(void)
>              if (k & 1)
>                  c ^= e;
>          }
> -        crc_32_tab[i] = c;
> +        s->crc_32_tab[i] = c;
>      }
>  
>      /* this is initialized here so this code could reside in ROM */
> -    crc = (ulg)0xffffffffUL; /* shift register contents */
> +    s->crc = (ulg)~0u; /* shift register contents */

... applicable here then: sizeof(int) >= 4, not ==.

As Andrew indicates, the cast previously wasn't needed here. Keeping it is
at best misleading, when s->crc isn't of that type anymore.

Finally please stick to upper-case number suffixes; see all the related Misra
changes, which (iirc) put in place only upper-case ones.

Jan

