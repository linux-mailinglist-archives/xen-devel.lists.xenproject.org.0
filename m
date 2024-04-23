Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E07E8AE86F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710644.1109972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGRz-0003C1-JK; Tue, 23 Apr 2024 13:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710644.1109972; Tue, 23 Apr 2024 13:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGRz-00039t-Fp; Tue, 23 Apr 2024 13:44:47 +0000
Received: by outflank-mailman (input) for mailman id 710644;
 Tue, 23 Apr 2024 13:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzGRy-00039n-4D
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:44:46 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4253380-0177-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:44:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so4550621f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:44:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b0041496734318sm24101825wms.24.2024.04.23.06.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 06:44:43 -0700 (PDT)
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
X-Inumbo-ID: a4253380-0177-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713879883; x=1714484683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHX07UmWaEK2UCImlIIvHtvC3mLztTA9n+R0m74EYfo=;
        b=BMVBluBvk3YW7IHZkjZnZGWzIFzK1ZpGd/T8PP1LuYOEVGupJRUYEyvSq6+8LkyUrI
         7ab1XAsPhtYX9ULwLBx/PnLgzLkaXXHOwBWJ1QK0TdsNupPWaVcKomSHG7eTxCRMAUZN
         omfdsnIwxeShxlqM2G669QCb9QsChGNj7YvJJzuKfeNpE0/goooJnFiVtODncDyyEn6G
         MKI1NoKwLby5MxkLnrIqII+R9OiapeeGDGusqeTrQc7JhHBE4xXmVvJch7PLmigg0sHS
         tyytAKcfJq4GCX1eQsR72lXih3gssh2jy/qPPw8D0Bxgg4b3rLeIs1kzFMNehwYYoGsO
         sFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713879883; x=1714484683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHX07UmWaEK2UCImlIIvHtvC3mLztTA9n+R0m74EYfo=;
        b=AfPqdPZsnYVJ55Ls3jMQwocZdUlGr8JjQV0LrR88IQAxqE7U6nwJ8J7uEIeMgKSqzR
         Ct6TmxA9z01IeRmbAhb1wiyCM1SCOyh1QGR3IgDev99eXMk0sUyNoTJemie+oXqxdMy0
         8y5ypWHESQWNBSxWvP7hXsEu7JZIZNtP92p7jIaT0HfumqjSEjhXmtuErAL5O6hy10Fe
         LA1EGQhG4rKi59OkHWbZhJoMXa1t+vqxN30IQrWZj05cD34q95pd2qLSBJFWdgPCFiJb
         9qortNrb6raS3VKtPZDSDRxvOpUyh74Ugf5KKM9leTjeXQzuN/RMaXutMzttMh99dhJt
         H7ug==
X-Forwarded-Encrypted: i=1; AJvYcCU8qRsvw5Ab3QQGRKiGa0HNPVEqd/TZaYkL5zL0r4Ma02XjWNvYlQfr1H1Cts9DoCDCnM7ELwFCy1q9h4Y3iI2CMjS0/Gf/TnO+6maPJj8=
X-Gm-Message-State: AOJu0YwF3bWjI43Nsf3Wg/9WivzlGea1HEJ8ZdukiqFUEe6T3KdwiiTu
	C8Zkn8vS6hX9ajRQYx+1LsefqC3ys5A9Lem+xU72kvx2YEP6r+85m0ZKDdUClw==
X-Google-Smtp-Source: AGHT+IGKu/u9KUet4tm+Oxdi9m0M2zgbZPj0aM6mGGV1spBylQVQmus4KiUzv/xtH9wAfxL1+m620A==
X-Received: by 2002:adf:ed84:0:b0:34a:e69b:494e with SMTP id c4-20020adfed84000000b0034ae69b494emr4934484wro.23.1713879883309;
        Tue, 23 Apr 2024 06:44:43 -0700 (PDT)
Message-ID: <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com>
Date: Tue, 23 Apr 2024 15:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-4-roger.pau@citrix.com>
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
In-Reply-To: <20240423131249.29825-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 15:12, Roger Pau Monne wrote:
> Livepatch payloads containing symbols that belong to init sections can only
> lead to page faults later on, as by the time the livepatch is loaded init
> sections have already been freed.
> 
> Refuse to resolve such symbols and return an error instead.
> 
> Note such resolutions are only relevant for symbols that point to undefined
> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> and hence must either be a Xen or a different livepatch payload symbol.
> 
> Do not allow to resolve symbols that point to __init_begin, as that address is
> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> resolutions against it.
> 
> Since __init_begin can alias other symbols (like _erodata for example)
> allow the force flag to override the check and resolve the symbol anyway.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle, as promised (and just to indicate earlier concerns were
addressed, as this is meaningless for other purposes)
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>                      break;
>                  }
>              }
> +
> +            /*
> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> +             * livepatch payloads don't have init sections or equivalent.
> +             */
> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> +                      st_value <  (uintptr_t)&__init_end && !force )
> +            {
> +                printk(XENLOG_ERR LIVEPATCH
> +                       "%s: symbol %s is in init section, not resolving\n",
> +                       elf->name, elf->sym[i].name);
> +                rc = -ENXIO;
> +                break;
> +            }

... wouldn't it make sense to still warn in this case when "force" is set?

Jan

