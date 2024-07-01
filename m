Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A491E248
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751723.1159764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHuk-0000KQ-Ek; Mon, 01 Jul 2024 14:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751723.1159764; Mon, 01 Jul 2024 14:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHuk-0000Gv-Bh; Mon, 01 Jul 2024 14:21:54 +0000
Received: by outflank-mailman (input) for mailman id 751723;
 Mon, 01 Jul 2024 14:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOHui-0000Gp-NP
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:21:52 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 425b681f-37b5-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 16:21:51 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so44704401fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 07:21:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1598576sm64927035ad.278.2024.07.01.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 07:21:50 -0700 (PDT)
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
X-Inumbo-ID: 425b681f-37b5-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719843711; x=1720448511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kyQK9uKtsYeY4iwhdia4uY660USAw70uwNsh3a3JE5I=;
        b=cK6wb2X9hLOgWn32tF0ht1VlMj3Kzgb0KGoCCeXtvswyezTYzMeT4m97gdV4DqwGIq
         Ixb7L7SkerzHX/UB7Un6ydJBEl2PInjGderP5JsmXQoDcIAhqOcL291tbvtFzp4lOWMc
         qiH22C4XG19j4iwYok6O8Kpv3tBdc5bYcpnNWUCibdLb7gt+T5wFD6nxTqBanvdhQoq+
         GYfo+CNGgbjmhRl29Z/NlQ70GlAJRUB4OH30P/7j/7yyxXhvN9cpvm3EJrqtCQ8J9y91
         PhK6kfZDzMgwajtwGw5KMsj+mmH4WcEzsr/NsZApnAccxubIz5ueiUnh9+nmkydoNnaZ
         cVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843711; x=1720448511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyQK9uKtsYeY4iwhdia4uY660USAw70uwNsh3a3JE5I=;
        b=AGJovlO0jgwtSnRVVLhF4hliccoxI0yrEpxEjLVOqdWmYIXXcdwqT6iw53aDWmuLzD
         xcAeU55UiUBsVOjKUa0YucPjBOiojAxCILH4ojNSYeBLF3NhuEX7HFWdfQwasvF8W8hs
         5SQz4TOW63gr2hswoVYDQbLIQ9NpfswC4vejKOI3O1MncKGd8uoh7KOsySHZrkWH8t1z
         FHtJy78/j3KOLdZANnQu+VLrTnhp2kycBJATsdHX0MK5Hpf6t3v6pUgiIX2p48sap/34
         6wyU3aZXmALIpLI0YbCogfHa43FcFfPx1bXSMm86bepjrj6AUnuxaqGRf7AC0BolmrnC
         5ddQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdTyre05IxEannv1AEK6G5WEssS6KMRjECQnvSsTfaI8iYEUreNqg5mDCGorLIRzOicIl5OtE29bWT1dQXIAkcm+nOxa+Yr7mfeX5ByaQ=
X-Gm-Message-State: AOJu0Yx9Fh2JvZyDxDVVF46/dTtKjjBNm835dPIpmk4m2yVj337wtg6h
	6eM85IjK9ab57u6kSRzVHGys9ZXNDk7cuzgWRKObqYOoswrCMM9ErGzcxhg+6A==
X-Google-Smtp-Source: AGHT+IGAUVRyZ3hOWTlXeXVJb/pt+4ap0ReFALCBybTG2QewmF6z20CEDgcwA4zZBxKGvRHFqfnbgQ==
X-Received: by 2002:a05:651c:1186:b0:2ec:72ff:cdf1 with SMTP id 38308e7fff4ca-2ee5e393888mr41671641fa.16.1719843710946;
        Mon, 01 Jul 2024 07:21:50 -0700 (PDT)
Message-ID: <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com>
Date: Mon, 1 Jul 2024 16:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
>  	$(call filechk,asm-macros.h)
>  
>  define filechk_asm-macros.h
> +	guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z);  \

Nit: Hard tab slipped in.

> +    echo '#ifndef $$guard'; \
> +    echo '#define $$guard'; \
>      echo '#if 0'; \
>      echo '.if 0'; \
>      echo '#endif'; \
> -    echo '#ifndef __ASM_MACROS_H__'; \
> -    echo '#define __ASM_MACROS_H__'; \
>      echo 'asm ( ".include \"$@\"" );'; \
> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>      echo '#if 0'; \
>      echo '.endif'; \
>      cat $<; \
> -    echo '#endif'
> +    echo '#endif'; \
> +    echo '#endif /* $$guard */'
>  endef
>  
>  $(obj)/efi.lds: AFLAGS-y += -DEFI
> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -1,3 +1,6 @@
> +#ifndef X86_CPU_CPU_H
> +#define X86_CPU_CPU_H

This, ...

> --- a/xen/arch/x86/x86_64/mmconfig.h
> +++ b/xen/arch/x86/x86_64/mmconfig.h
> @@ -5,6 +5,9 @@
>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>   */
>  
> +#ifndef X86_64_MMCONFIG_H
> +#define X86_64_MMCONFIG_H

... this, and ...

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -6,6 +6,9 @@
>   * Copyright (c) 2005-2007 XenSource Inc.
>   */
>  
> +#ifndef X86_X86_EMULATE_PRIVATE_H
> +#define X86_X86_EMULATE_PRIVATE_H

... this guard can't possibly all follow the same proposed naming scheme
(wherever the final version of that is being recorded; I don't recall it
having gone in, and I didn't spot anything earlier in the series); at
least one must be wrong.

Jan

