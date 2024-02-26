Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A602867540
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685512.1066331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaGv-0000jp-8X; Mon, 26 Feb 2024 12:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685512.1066331; Mon, 26 Feb 2024 12:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaGv-0000gp-5e; Mon, 26 Feb 2024 12:39:53 +0000
Received: by outflank-mailman (input) for mailman id 685512;
 Mon, 26 Feb 2024 12:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reaGt-0000fT-Uh
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:39:51 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21e21c97-d4a4-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 13:39:50 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so2158333a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:39:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qo7-20020a170907874700b00a4319de07c6sm1611214ejc.127.2024.02.26.04.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:39:49 -0800 (PST)
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
X-Inumbo-ID: 21e21c97-d4a4-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708951190; x=1709555990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU8B5Gxqw5IaqT1tDZu3OilAULQuRRdjJ1eRYjBRuEM=;
        b=bm7VYIXwiufEBlAOHYGq0Gz6QHbeRp/NW1MA9kc2yfWW/w24omxrTrYajj6KQgOq/F
         tE8kbUS0qhXEFoXEteh55FPeMJEyXvalv3V4k2Dh3HtJzTMPGqLT6nnAUkJIvDTP1LoB
         9YMV/vfuEH3XejDCIcs5qh14aDW8mn9NbY6shy7ycAWwQrwAA/AHJclUtrFkER1LzQx2
         lhVwBdfeINV5f9N7IiAmCzmKGhB3mjiQvUQzd/NIA253X1cgvo2yLoEf/onRIudc3PE6
         hNcgxZpstep4uYGJOKK6zJhRRgS/vy+i3RyPQgHkZ8m9+yTdjHNZ7GNKAV7wTh5tGGFf
         5Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951190; x=1709555990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sU8B5Gxqw5IaqT1tDZu3OilAULQuRRdjJ1eRYjBRuEM=;
        b=NXmeAnyh/OSuRXLVXqjAoh7O6HtkaL8M5BGY8l07RImOyZ5/e9wThXSNJcm7Elq8W3
         f/aqktSkJgVS9GJBCtHw2MHfOYSdXR7iMoOgDSQBa3bB9+drG4Ztw5kPniDA2e7Qnvdd
         ue+14wUBCvHgJ9PpNWhtrCRIhvk+V2WfqUO1bwH3kTBLyw8Jo1ZK85IU9S0zE7uL4YLp
         WkBtUfvJI8U1Nocs4hA/cWD9I0ogzhx/XvxvWM6mysIbwrPMpIjXZLJEwrjGeFkB5oq3
         GencPV0/p9ZGoXvv9WGY+TDMIYOwP9kc6rbmjs5Sq6fhTsxGEem/yVhFl3uKPlz5JRV0
         WxAw==
X-Forwarded-Encrypted: i=1; AJvYcCXEdL7t5P24oDKgxPVky2J3VfhQqrNyTCZdjNRjgAPwCYcCDNLCEF91jAOEQdPsl0sC37QtxfkmpyCLL5OprZgEERPJOdU0jjuKoQw3yfM=
X-Gm-Message-State: AOJu0Yy9jdoucHrwB9rCwZGQR5MOs+ntPHVDd862osLV7V87jLvhua5w
	NXID2GXslAtjaxLjzCXklBntXTN4Gu6ADldlX5BegnhhsD4o3Ild70tP/k/1vQ==
X-Google-Smtp-Source: AGHT+IGviqNAWFMRUy56MLNnBWgnxb+aNO+7/z2Gk30tpKTZPOD5XvM7He51fmZJWW5sOzTy8R8uEA==
X-Received: by 2002:a17:906:e298:b0:a42:f0b6:c2f1 with SMTP id gg24-20020a170906e29800b00a42f0b6c2f1mr5408066ejb.28.1708951190005;
        Mon, 26 Feb 2024 04:39:50 -0800 (PST)
Message-ID: <85fa5e55-27c5-495d-bd7b-857260b1de20@suse.com>
Date: Mon, 26 Feb 2024 13:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/spec: print the built-in SPECULATIVE_HARDEN_*
 options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-2-roger.pau@citrix.com>
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
In-Reply-To: <20240226110748.80254-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:07, Roger Pau Monne wrote:
> Just like it's done for INDIRECT_THUNK and SHADOW_PAGING.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but ...

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -466,13 +466,25 @@ static void __init print_details(enum ind_thunk thunk)
>             (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "");
>  
>      /* Compiled-in support which pertains to mitigations. */
> -    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) )
> +    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) ||
> +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_ARRAY) ||
> +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) ||
> +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS) )
>          printk("  Compiled-in support:"
>  #ifdef CONFIG_INDIRECT_THUNK
>                 " INDIRECT_THUNK"
>  #endif
>  #ifdef CONFIG_SHADOW_PAGING
>                 " SHADOW_PAGING"
> +#endif
> +#ifdef CONFIG_SPECULATIVE_HARDEN_ARRAY
> +               " SPECULATIVE_HARDEN_ARRAY"
> +#endif
> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> +               " SPECULATIVE_HARDEN_BRANCH"
> +#endif
> +#ifdef CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS
> +               " SPECULATIVE_HARDEN_GUEST_ACCESS"
>  #endif

... I'd like to suggest to drop the SPECULATIVE_ from the string literals.
They're relevant in the Kconfig identifiers, but they're imo redundant in
the context of these log messages. (Happy to adjust while committing, if
need be.)

Jan

