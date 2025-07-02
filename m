Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA0AF15F3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031070.1404771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwoi-0001Ik-6a; Wed, 02 Jul 2025 12:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031070.1404771; Wed, 02 Jul 2025 12:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwoi-0001Go-3E; Wed, 02 Jul 2025 12:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1031070;
 Wed, 02 Jul 2025 12:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwog-0001Gi-OR
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:43:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37defd16-5742-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:43:56 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so25984925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:43:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e244fsm133449895ad.12.2025.07.02.05.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:43:55 -0700 (PDT)
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
X-Inumbo-ID: 37defd16-5742-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751460236; x=1752065036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4D39cKbYFgFmnIsu+aSOImn+PGIwfOpXAE1skjvWKw=;
        b=DEO/4gjgtruO0v6spVgjQ496qacy6wG9e0suia9zWe90pes7LFT4Rp40KQMUJ1qa3X
         //xlDQGvXzSougJaN57jhq9rZ8hUBKv2zaNI6O36EBYNcdse+a5NwyANv8+nw4WJqSst
         xPP1MQjuXBh3tSZkbImXbzRgrHBqpK8bun8iEBr//CD7kDzpel+QbMkPTh3AY3JlRz0U
         SYh+WX6QuSArNLnq5psGNWqlvcIA5WeOW8fo4EUmowlukO6hZy8Qr+eiEkSiyBmSUsdT
         WndKlDgeR8OVVVVvRYLupBGwW6KhzJ03bwXsGHxcmfeohTevDrKn5M+akXcfsqCpuaCm
         hpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460236; x=1752065036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4D39cKbYFgFmnIsu+aSOImn+PGIwfOpXAE1skjvWKw=;
        b=DSvxqLIAnVxD4foiGOkDqO/zJg8wV6atRT5gvci37UR8OfbqWlY7NOZ6rKJxQCN6Oz
         xd5wzIBohoZy9+rlnvYFsaxKQvb5H/vg1MAPw58a8iZWxeco2ddX4Q/uJPb2zJo9ON0K
         IGPmRGNF4DgRbKbi2ty1R6LCStY4T73Yj6ksPolIh01L82G7chlCem6J1vMNquAwgmAm
         7Gc/Prs04RZ4S20OKYaPF1T2066G6bgWAEdpEinZcUZ03qbrhHQV9hJkiO8fa1e1EzL9
         g8YTvMCo8bXH4SHlfWxWOwJ1d0FG6F1M2sBqYK5ep/ekagJA2PSc3lTGRfeuZ3RzInW0
         +H0A==
X-Forwarded-Encrypted: i=1; AJvYcCWX2+3cbluYI/pLa+SO02DnuPnT/CxKpkqzF0E969TuXw8Ek98BPvbIsLwMWDmmw8l4OjQ02R1NFOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS6uJ7sp5Zpc6U/qPJMT0h5GLs7uAld8JZ9BWR9k6LZ3z3zEaW
	GoTzld5tcAR2qoe7P0m9Z8COyIMdL732v9WqF32Kbt77F56a5FpLUbcOYF5oyLiQhA==
X-Gm-Gg: ASbGncuH1JVn3rTo2WlAUAiLXAwojGe0N6ffnnJqz0/KAlblc2U6yAxhBr7gPaYRIdw
	pdJuIW+9Db3LRQhGxR+wRhYC+3KX0mY8EmH/2Gm6HkIZxpbtV4pOX26NCgvuRIyVqqQljiVigLq
	rIVgKNnDwpLKCB4Fm1lTnUeq3+zx65Ag0F0Zkbm+EaxSBozc3G4rgm8Z4dl85uvAsgNMhK/qg0a
	jHJOQm3wCCtKQhogBxg4dpy6ZkKJUWFoQaBbxxKLoQFyI3sXz2LxM9TG23u9a5+yEW2OQE2pyPY
	2rleej2bS6IBTzJsb8UuTxxgYFAjVOZlWCrqdMGoXqR1AozjFn1Vumop8GuXrJFmvgqamiPjIvM
	R1XHr8y1SrnSskaIhuw/xz4qx3XGrHs5Vv/uTU4qfX7XLWbY=
X-Google-Smtp-Source: AGHT+IFzHCM5XEP+xHjqMA54GUR1dWn38YI9XkGDjJPiC3rModbJuGrsy+C0ao1S2v5Z0w5ocb2Lag==
X-Received: by 2002:a05:6000:41c2:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3b1ff244513mr2153721f8f.10.1751460235906;
        Wed, 02 Jul 2025 05:43:55 -0700 (PDT)
Message-ID: <1a2faa5c-9dcd-4d09-a5d5-dc692eef8c8c@suse.com>
Date: Wed, 2 Jul 2025 14:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] x86: Replace arch-specific boot_module with
 common one
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-2-agarciav@amd.com>
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
In-Reply-To: <20250701105706.86133-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 12:56, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent,
> and with "struct boot_module" already in common code it makes perfect
> sense to merge them. In order to do so, add an arch-specific area for
> x86-specific tidbits, and rename identical fields with conflicting
> names.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I'm largely okay with this change, just one question:

> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -7,6 +7,10 @@
>  #include <xen/macros.h>
>  #include <xen/xmalloc.h>
>  
> +#if __has_include(<asm/bootfdt.h>)
> +#include <asm/bootfdt.h>
> +#endif
> +
>  #define MIN_FDT_ALIGN 8
>  
>  #define NR_MEM_BANKS 256
> @@ -108,6 +112,10 @@ struct boot_module {
>      bool domU;
>      paddr_t start;
>      paddr_t size;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_boot_module arch;
> +#endif
>  };

The pre-existing domU field isn't used by x86. Shouldn't that move into Arm's
(to be created) struct arch_boot_module? Or is that intended to become
dependent upon CONFIG_DOM0LESS_BOOT? (While we apparently didn't adopt Misra
rule 2.2, this is imo precisely the situation where we would better follow it:
An unused struct field raises questions.)

Jan

