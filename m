Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994FB16334
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064089.1429833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8AI-0002eP-Gg; Wed, 30 Jul 2025 14:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064089.1429833; Wed, 30 Jul 2025 14:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8AI-0002bI-Bq; Wed, 30 Jul 2025 14:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1064089;
 Wed, 30 Jul 2025 14:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh8AH-0002bC-3A
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:52:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88795a0-6d54-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 16:52:15 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so3058354f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 07:52:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2402ec8a087sm71033125ad.84.2025.07.30.07.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 07:52:14 -0700 (PDT)
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
X-Inumbo-ID: c88795a0-6d54-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753887135; x=1754491935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/lkNIQmW011CFSz5dGz8p6P0ergSp/cswCXu6WG97s=;
        b=DL/JG1XivrXiccxeelfO+nVttVdh3eSJcul35r4CR1VnWke+uPdFoCWVnDwD07umwJ
         S8qoF4I1qdUj+x1kQOnMJgmCvE4Yx8gzGu1obWR1RuAzLTj0zsPPu7SgT0D/gffA1eFA
         ChisYvVvjuu3dSF7W6hdS/pplGiHtFTUlU99vjTLtLOBQRkrIaMIftnTQoFJw5HPLDcN
         IYOKG3XYOgoRf+ciB6fmA26p3SS8ki3KX5EeZHGONwDHXAtx0fPUq9Puu+0IlFHtIR/Z
         1JXOOUPAT3X+5JY0CbvN1spo9Fj6li1IcxAmktBbDs2yQpdtWenJl7qZYILlZilbnzgt
         eD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887135; x=1754491935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/lkNIQmW011CFSz5dGz8p6P0ergSp/cswCXu6WG97s=;
        b=kvB0JOm66IoL/1/ciu0Cp78l/mK0DM7MXV3n4D22RdcUGiWlLXoJGrlleSIrv+L1jy
         WLxE5R8K5EIDTLMDwVls6djrH+Tj+TMQCFly6LFRZ2s+II2VCVSSN6m9b5Vv+FS0DnKX
         fLOJUZyL9uyWI3KQ7AgN9XS5S6Jzt7Exs9M35OEZtvMGqOL/Njja1EgUdfSVRn8m1Zfv
         7pIiFVExqunjH8S4+9AdAPUg9X+A+tF3LW1iy8jDlmMpFzDAGF0Yvglevjqv/zhUo940
         XxVtfd3JHTz2Hw8EUWLqxckINncjGTVo9MJqSscI1iBCwHGxEFJ0v8PGwTvdtWYLJ7q3
         sowg==
X-Forwarded-Encrypted: i=1; AJvYcCXHUQGsVp1hxHCxdh0L3Gr5DqgMQYlzUY+kIha5nVmbOA+WDoquV2c7C4SD5J3/Hv/XJYeulhmzfU4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzusDG+rPl+zoeH8O833UHvHVz36PT3Qpz25vbEsrMVfd9jOVhF
	tqN3BQCrfVuihDBGRX/e3Alf3eC8wnmhqbuqbjaCkQgXGPSzkpq+i6L0QZFz0K2oyg==
X-Gm-Gg: ASbGncsoeDoqAiwJN6gerhlnlOyWrOZHw5//DLuDlbWnlxD7/zo6b7bswh4cd8UaqXN
	YQ+ATMPrQJa7fRp3AdDJNbwg2ai9wyYpN2ND4vaa0sZMYINr8CdLyDU+pc/lo6IJBpqxzBO7bS7
	EMaXRiHSos2pILD6RXsNljo2MDUPfssv2DDn6NTXhLFpzSgKfY9Nf0p8bEGbbm9+jeHeIQSr0lm
	n3Ju7c0tfUSYEK4LMw73XTRoyb6OVwrrrCxQa/odjg5Ao1y/MZbavJ3S8n6XBBJ7hQFPnl9sbMp
	ndAcwn69RNO8OxeknLxKG/yRWA5tUFoHkn8UDYWMDVbrasMI5Rt1UwxhZ6rPLJcC8lhtOH0xDgv
	rHfWLyn8tE2mJm6skJsQECjZcgZGqxpHKU/PNAoTx0JnwtHxV559BWgeGCmSUGsigfIEjnuQqmB
	TQYt2QJsg=
X-Google-Smtp-Source: AGHT+IGdwS1LQOqaiSM1nwkK7rIWsRYGHpmzTB3oRFk2HVAJWURrhRzP2XVh3UOaWaDJf5uMQFpqlw==
X-Received: by 2002:a05:6000:4312:b0:3b6:936:976c with SMTP id ffacd0b85a97d-3b794fecc6cmr2810130f8f.17.1753887135188;
        Wed, 30 Jul 2025 07:52:15 -0700 (PDT)
Message-ID: <2c43aad7-f8a2-4798-867a-d367db1c2bb2@suse.com>
Date: Wed, 30 Jul 2025 16:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair: deviate intentionally unreachable code
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e699179c079df36f6cb4fdc7865a73cb9fe79f8c.1753881652.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <e699179c079df36f6cb4fdc7865a73cb9fe79f8c.1753881652.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 16:06, Dmytro Prokopchuk1 wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> Functions that are non-returning and are not explicitly annotated with
> the `noreturn' attribute are considered a violation of this rule.
> 
> In certain cases, some functions might be non-returning in debug build
> configuration (when `NDEBUG' is not defined), due to calls to
> `__builtin_unreachable' in the expansion of the macro `ASSERT_UNREACHABLE()'.
> 
> Conversely, in non-debug (release) builds (when `NDEBUG' is defined),
> the macro `ASSERT_UNREACHABLE()' expands to an empty construct
> (`do { } while (0)'), which does not affect the execution flow.
> This allows such functions to return normally in release builds,
> avoiding unreachable code.

While this way of putting it is technically correct as long as all we have
is

#ifndef CONFIG_DEBUG
#define NDEBUG
#endif

in xen/config.h, but I think it would be better if "debug builds"
(controlled by CONFIG_DEBUG) were properly separated from assertions
being active (NDEBUG). For quite some time there has been the plan to
decouple the two.

Similarly, throughout: You write ASSERT_UNREACHABLE() (i.e. including
the parentheses), yet oddly you then don't similarly include them when
referring to __builtin_unreachable().

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -124,6 +124,15 @@ maintainers if you want to suggest a change.
>             they are used to generate definitions for asm modules
>           - Declarations without initializer are safe, as they are not
>             executed
> +         - Functions that are noreturn due to calls to `ASSERT_UNREACHABLE`
> +           macro in debug build configurations are not reported as violations::

I find "reported" odd to appear in this file. My take is that here we
describe our intentions, not what some tool may be doing. I'd suggest
"deemed" as replacement.

Jan

> +              static inline bool
> +              arch_vcpu_ioreq_completion(enum vio_completion completion)
> +              {
> +                  ASSERT_UNREACHABLE();
> +                  return false;
> +              }
>  
>     * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
>       - Advisory


