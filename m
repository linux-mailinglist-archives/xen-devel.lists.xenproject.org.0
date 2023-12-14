Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E963E812F81
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654511.1021454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkJL-0006Dm-Jd; Thu, 14 Dec 2023 11:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654511.1021454; Thu, 14 Dec 2023 11:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkJL-0006AZ-Gj; Thu, 14 Dec 2023 11:55:27 +0000
Received: by outflank-mailman (input) for mailman id 654511;
 Thu, 14 Dec 2023 11:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDkJJ-0006AT-Nl
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:55:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa4f154e-9a77-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:55:24 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a22eba5a290so366990766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 03:55:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ci13-20020a170906c34d00b00a0988d69549sm9184421ejb.189.2023.12.14.03.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 03:55:23 -0800 (PST)
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
X-Inumbo-ID: aa4f154e-9a77-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702554924; x=1703159724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=frIWyUhYo0oHbOzv9NBBMa8IQEpBKv17gm4P7VxxLl0=;
        b=ATWLJXBRDAH2XPe6W/3CJfeLmcaGRFa4jv3pU3sdva/YPAVVJmQsbrPSybuS1yO/Pj
         +VjZDZfhQalrirpUX7oH81Qgqt1HljTTzNdguIGMqP/yG6NtlJAKsvlA8WFn+029QT2K
         Ja612DKFqA8zA3lxuSQsxznd7C6fj70hvc3OZTevUai4JaCvhQSiPyFuL0W5iKNbV0XP
         /lJAdZNmND3yiIYyIllFBvIlXN1drUDcshU7p4LU4Ru2FdyLgT228gHuyP1reQP2rAue
         PGUTR2SgHkd/IwevDBqPNcI0M/uFnuZR3mNqnEvZJ404PuJLw+hk/lFb9F7SPWrsZ/3L
         m+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554924; x=1703159724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frIWyUhYo0oHbOzv9NBBMa8IQEpBKv17gm4P7VxxLl0=;
        b=uG2vio2LGvcDm87Ir/4PTUVGdYgcrmFw+MiXjBQzhc1TXp+s+V2p98RAglrdiebzJs
         2+B91MngUeI+8nHbtJZMRuKHtn6VURWLpzekmRKgIKtPuy16u0cadKTozLgO2XDWvCp/
         pBqnK8/V29rpHPay9bxDnQUMUQg8AJhoFOUkMTCdbDZQQKDwA+eiaNaBXeklN7hcs68z
         cl6cxyQJd2i6w32eq1o9iZqSUveYZnYGb0krrFsW4iAIS8diXlgdg+fP7+dKN5A+mpEB
         3o7nXMVnE/B4WCOIcgLp90PkvXIRYbBhy/Df3R7WmKOZ5GIB6q9NgO7gbfnOB8GOVai6
         688g==
X-Gm-Message-State: AOJu0YwZPUlrUY0/xxMJG5Sp4KVVFF0mYwdApKfc1y6+TdYdDoKkW+Jw
	NJ0ZVxjEIKqBL2f9UtxH4QF3
X-Google-Smtp-Source: AGHT+IFQGzlkE514oCN8swImk7xNoTAIPF3f2XvEWEwzPxfb0DxdE/B4TFNB+y9RCiQIohDZ5wc1dQ==
X-Received: by 2002:a17:907:c30b:b0:a0d:ac30:4963 with SMTP id tl11-20020a170907c30b00b00a0dac304963mr6722513ejc.76.1702554924093;
        Thu, 14 Dec 2023 03:55:24 -0800 (PST)
Message-ID: <6226aa5e-c87f-48bf-b793-96aa04498c5e@suse.com>
Date: Thu, 14 Dec 2023 12:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-3-roger.pau@citrix.com>
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
In-Reply-To: <20231214101719.18770-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 11:17, Roger Pau Monne wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -58,6 +58,7 @@
>  #include <asm/microcode.h>
>  #include <asm/prot-key.h>
>  #include <asm/pv/domain.h>
> +#include <asm/test-smoc.h>
>  
>  /* opt_nosmp: If true, secondary processors are ignored. */
>  static bool __initdata opt_nosmp;
> @@ -1951,6 +1952,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>  
>      alternative_branches();
>  
> +    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL, NULL);

I realize I'm at risk of causing scope creep, but I'd still like to at
least ask: As further self-tests are added, we likely don't want to
alter __start_xen() every time. Should there perhaps better be a wrapper
(going forward: multiple ones, depending on the time tests want invoking),
together with a Kconfig control to allow suppressing all of these tests in
at least release builds?

> --- /dev/null
> +++ b/xen/arch/x86/test/smoc.c
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/errno.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cpufeature.h>
> +#include <asm/test-smoc.h>
> +
> +static bool cf_check test_insn_replacement(void)
> +{
> +#define EXPECTED_VALUE 2
> +    unsigned int r = ~EXPECTED_VALUE;
> +
> +    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
> +                   "+r" (r), "i" (EXPECTED_VALUE));
> +
> +    return r == EXPECTED_VALUE;
> +#undef EXPECTED_VALUE
> +}
> +
> +int test_smoc(uint32_t selection, uint32_t *results)
> +{
> +    struct {
> +        unsigned int mask;
> +        bool (*test)(void);
> +        const char *name;
> +    } static const tests[] = {
> +        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
> +          "alternative instruction replacement" },
> +    };
> +    unsigned int i;
> +
> +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
> +        return -EINVAL;
> +
> +    if ( results )
> +        *results = 0;
> +
> +    printk(XENLOG_INFO "Checking Self Modify Code\n");
> +
> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> +    {
> +        if ( !(selection & tests[i].mask) )
> +            continue;
> +
> +        if ( tests[i].test() )
> +        {
> +            if ( results )
> +                *results |= tests[i].mask;
> +            continue;
> +        }
> +
> +        add_taint(TAINT_ERROR_SMOC);
> +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);

Do we really want both of these even when coming here from the sysctl?

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -386,13 +386,14 @@ char *print_tainted(char *str)
>  {
>      if ( tainted )
>      {
> -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
> +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
>                   tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
>                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
>                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
>                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
>                   tainted & TAINT_HVM_FEP ? 'H' : ' ',
> -                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
> +                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
> +                 tainted & TAINT_ERROR_SMOC ? 'A' : ' ');

How well is this going to scale as other selftests are added? IOW should
this taint really be self-modifying-code-specific?

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1180,6 +1180,7 @@ struct xen_sysctl_cpu_policy {
>  };
>  typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
> +
>  #endif
>  
>  #if defined(__arm__) || defined (__aarch64__)

Stray change (perhaps leftover from moving code around)?

Jan

