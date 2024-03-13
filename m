Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF787A3C0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 08:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692287.1079259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkJLO-0006S0-78; Wed, 13 Mar 2024 07:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692287.1079259; Wed, 13 Mar 2024 07:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkJLO-0006Om-43; Wed, 13 Mar 2024 07:48:10 +0000
Received: by outflank-mailman (input) for mailman id 692287;
 Wed, 13 Mar 2024 07:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkJLN-0006Og-7s
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 07:48:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072af430-e10e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 08:48:07 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso836441966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 00:48:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j26-20020a170906475a00b00a4588098c5esm4580980ejs.132.2024.03.13.00.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 00:48:05 -0700 (PDT)
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
X-Inumbo-ID: 072af430-e10e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710316086; x=1710920886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2X6AdwEEOjZsYAQBEPXFQYf+g6L/BnTu9raS2RCbc0=;
        b=LZ0/C3l0iHJrIr6yjBdAPq86JDrriLg94PFJGy81UON39v2wwgy9yr+eqIprljtNEo
         +S7v1lyY9U7tb9tsFI/1jNDwReh55Aa7FUCi2pLhZue3B1FprfN5R2Gzxr/wcyugYwnf
         5l3GKQlQvJZ7WV6pPeSxGMychDMMTxoaGQB/2g8fNhHMvt47yRGGpviKRi27Vtszow9y
         M9kDof6XBXoDfu3A25rWMWu4g/XANgMBiqwT8G1Z5ogSRZsvfTZGQhH3G4YW4QGXaFT+
         hU4p+D7A42gDEhPi2+sayxzg0QNti27NTxpFB9IJHoeUlmHHsVSzCSrY5pdJFrT5DdvY
         9EqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710316086; x=1710920886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2X6AdwEEOjZsYAQBEPXFQYf+g6L/BnTu9raS2RCbc0=;
        b=oYvnmVnisYkwQxVXyUrLMT7eiHh64SaA6PCoAMCFIF2AKvgv/kP+hGaHsKLzlqsdHO
         xqtLd+BY8k4+3EJRYQBqld3pNbWHv6Htfo1InKtKFMnlmPd4bkDUhRZC52HYAYkTENGN
         oHiQF1aLLserekXCfjrFVLimgRS3QpJMaBrwr0xQvl0eO0yn00v8QXF8ma77gFol63yO
         +9LJ7E6h9IXSlcYn2SiNBZzbVX9vfaFq0DP9Gp1IEVf2FGbP1ore9bwF5cUn79mrxhbG
         MvbHgPTI7Q4PPAswN/sQtF5lBzAQHhoK/3JAtZx+rEhNs0e8fFl8fDTjl2fgG8NeBrop
         nCsA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzA7klSKU2Nv5R4XVE7eJ/PUiwSMAI8HbF+RZSezMxSWyLiNoKpfPEYBBeTcNh/N+9vIL+XfkIAonUyACRLFHBHoLPtVfitn7Tmdrq9g=
X-Gm-Message-State: AOJu0YxTwM/KSlqwcB5cJfZWIhYhgpMfBRZFu1mtiurcQf/yXUnmkyWt
	t/yLNAAAyaF4l1tDns0Wcbp9oFUyBnpmWAybossYdkofA+/g7OwwL3tUAe6sKw==
X-Google-Smtp-Source: AGHT+IEzmxFlRTQxnKsrZWx4raMgmlpPPLi+zeDgah9wBnQpVYS7Yzss9bVJdnPCSNoarGPVdYCsyA==
X-Received: by 2002:a17:906:6a11:b0:a46:1538:9279 with SMTP id qw17-20020a1709066a1100b00a4615389279mr7325497ejc.16.1710316085676;
        Wed, 13 Mar 2024 00:48:05 -0700 (PDT)
Message-ID: <136e4667-8c6d-45ec-b652-b6b690a16f34@suse.com>
Date: Wed, 13 Mar 2024 08:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add Rule 16.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 01:28, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -478,6 +478,30 @@ maintainers if you want to suggest a change.
>       - In addition to break, also other unconditional flow control statements
>         such as continue, return, goto are allowed.
>  
> +   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_04.c>`_
> +     - Required
> +     - Every switch statement shall have a default label
> +     - Switch statements with enums as controlling expression don't need
> +       a default label as gcc -Wall enables -Wswitch which warns (and
> +       breaks the build)

I think this could do with mentioning -Werror.

> if one of the enum labels is missing from the
> +       switch.
> +
> +       Switch statements with integer types as controlling expression
> +       should have a default label:
> +
> +       - if the switch is expected to handle all possible cases
> +         explicitly, then a default label shall be added to handle
> +         unexpected error conditions, using BUG(), ASSERT(), WARN(),
> +         domain_crash(), or other appropriate methods;
> +
> +       - if the switch is expected to handle a subset of all
> +         possible cases, then a default label shall be added with an
> +         in-code comment as follows::
> +
> +             /* only handle a subset of the possible cases */
> +             default:
> +                 break;

Unless it being made crystal clear that mechanically reproducing this
comment isn't going to do, I'm going to have a hard time picking
between actively vetoing or just accepting if someone else acks this.
At the very least, though, the suggested (or, as requested, example)
comment should match ./CODING_STYLE. And it may need placing
differently if I understood correctly what Misra / Eclair demand
(between default: and break; rather than ahead of both).

The only place I'd accept a pre-cooked comment is to cover the
"notifier pattern".

Jan

