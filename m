Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991CB07A88
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045421.1415535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Xz-0008DM-GM; Wed, 16 Jul 2025 15:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045421.1415535; Wed, 16 Jul 2025 15:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Xz-0008Bv-Dd; Wed, 16 Jul 2025 15:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1045421;
 Wed, 16 Jul 2025 15:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4Xy-0008Bp-Ii
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:59:54 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e940c390-625d-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:59:53 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so1727f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:59:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e67cdsm1605946a91.12.2025.07.16.08.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:59:51 -0700 (PDT)
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
X-Inumbo-ID: e940c390-625d-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752681593; x=1753286393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i9ogxvO3UgcQR9Gwmor9CLR5jVbm97GMCYDlsvq81tU=;
        b=P/uj9LKwDkGJ+f2sXXU52AgOII9FnvKVxtoVwzNbOP6Sc3iR2KNaMD81bGnRsqTLBC
         RBV8wXhxLUd2Ck0SQ/PANwoJtYio4uL8/UHh33dajVDipPKo3QAwC1s2KpLtmfN6CmkW
         TxHEg/vFpMgMNoO1OQoAlQrOx50606ZWqt2gIthqVxZbtIexV2FNSnYSWQiZx9VUCVN+
         G4/0jPrQZR4GxU71p5Msbcj2wW+gdLlSXBFfcfdoYYuxWhhu6UYoTr4NgDFO9hIP3G0Q
         LLZX5FCMpL7PbiEExFRRyxmzCEq+RzlBYR8IgUepobBhvBYGEtTCjrRBiUU0LQ8/2NQO
         C75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681593; x=1753286393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ogxvO3UgcQR9Gwmor9CLR5jVbm97GMCYDlsvq81tU=;
        b=s8255EancErhuYbMv4QG+jrLaODrdq/Dtud1IulrsZKUUjXZQBlxrHiy2nAN3xm6OU
         VmALH57PUvXgJ8s76VNzckwyXf1p2TDWh3mRCJ9kMpLenkq2Q6s94fqGD3SuVQkpL8cl
         J7KvlZAx0wtavzpGde/KIH+ecw1fBwKqYDTY4aU+USL40G3yrXsPBEv5p1V7ELk/0Cm5
         u096bO/7meRBoyc5/yFdCfHwEX8MS6B3Synvc3epDUFBvIwXhyRCgXag9jzPQP/bPj/5
         +r88T6sTv+zv9rFhk0eV4I1KOvBqx+Pj1Kk03IexWWka3z252swpJMAS2FqOU2hWv6V1
         tgmg==
X-Forwarded-Encrypted: i=1; AJvYcCUe9kSTW9zU8goB1h20Gexw/40OwDGlCJLdSSVbp6peat/eYHDePJrVpexB4G8Sh5LEcWm9W7qwZWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpwdFpC1oYPuKXxGOw78kcFdGkT9dHAtJb+/Z3tY/YQFmrw8lp
	HU7rDINuTWhZg8HeIM+d1BVCPCo0B995WjzwTcobo3ZLr7IwAwuM6FGTUdhs05kGBg==
X-Gm-Gg: ASbGnculF+XEDZ9joQkkn+60bhjqXIxAfPFdh/K07F3/FAmCnHsAbs+QCMAfpJKAvNH
	R0nlVlwzPAZX5Fs9lI/CPY4lWf7CFgwuYMOsh3EDM6Z5qIIjE8klTORnBkxViAerG8+4YvOop+a
	o+JMO5DuD2JOPye1hmHqtyr5/eXa79aGw+fBs88JJ1yNWo/w6nHMvXnrjdMu7onFTXL5RPTvTcf
	LmTBJNCffAZH4kLB3iBnrMlToAIRsNep46P11+cpU2TWc3NavA1dUkr56eMwnq9yChuVBj63OWL
	xVShIXMaer5s75Iz9kYbyw8xCZnpnhd3Kk6251tSP1E1REV+DaP7ngH9At3+R4ZaJy19TNZpmwB
	kLnSnAeW28BTd41R5xPN4UK0quLwH48BI99+K7IqBSS3WPj8T2RoCau96dxWWw2qvIlc35rPjP0
	2IAEz3zfo=
X-Google-Smtp-Source: AGHT+IFEc7C81VtYJn5CmlVYFNwYLSget93hfmcKa09iIfCKnajhMp2p6JahYa0AiIoyRNJBxR1eaQ==
X-Received: by 2002:a5d:64c3:0:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3b60e4d2b7amr2696804f8f.23.1752681592780;
        Wed, 16 Jul 2025 08:59:52 -0700 (PDT)
Message-ID: <a11aa19e-a151-469b-a58d-bc31fc4d7e01@suse.com>
Date: Wed, 16 Jul 2025 17:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -128,12 +128,14 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>      if ( cpufreq_controller == FREQCTL_xen )
>      {
> +        unsigned int i = 0;

Pointless initializer; both for() loops set i to 0. But also see further
down.

> @@ -157,9 +164,70 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>          case X86_VENDOR_AMD:
>          case X86_VENDOR_HYGON:
> -            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
> +            if ( !IS_ENABLED(CONFIG_AMD) )
> +            {
> +                ret = -ENODEV;
> +                break;
> +            }
> +            ret = -ENOENT;

The code structure is sufficiently different from the Intel counterpart for
this to perhaps better move ...

> +            for ( i = 0; i < cpufreq_xen_cnt; i++ )
> +            {
> +                switch ( cpufreq_xen_opts[i] )
> +                {
> +                case CPUFREQ_xen:
> +                    ret = powernow_register_driver();
> +                    break;
> +
> +                case CPUFREQ_amd_cppc:
> +                    ret = amd_cppc_register_driver();
> +                    break;
> +
> +                case CPUFREQ_none:
> +                    ret = 0;
> +                    break;
> +
> +                default:
> +                    printk(XENLOG_WARNING
> +                           "Unsupported cpufreq driver for vendor AMD or Hygon\n");
> +                    break;

... here.

> +                }
> +
> +                if ( !ret || ret == -EBUSY )
> +                    break;
> +            }
> +
>              break;
>          }
> +
> +        /*
> +         * After successful cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
> +         * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
> +         */
> +        if ( !ret )
> +        {
> +            ASSERT(i < cpufreq_xen_cnt);
> +            switch ( cpufreq_xen_opts[i] )

Hmm, this is using the the initializer of i that I commented on. I think there's
another default: case missing, where you simply "return 0" (to retain prior
behavior). But again see also yet further down.

> +            {
> +            case CPUFREQ_amd_cppc:
> +                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
> +                break;
> +
> +            case CPUFREQ_hwp:
> +            case CPUFREQ_xen:
> +                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
> +                break;
> +
> +            default:
> +                break;
> +            }
> +        } else if ( ret != -EBUSY )

Nit (style): Closing brace wants to be on its own line.

> +            /*
> +             * No cpufreq driver gets registered, clear both
> +             * XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX
> +             */
> +             xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_CPPC |
> +                                       XEN_PROCESSOR_PM_PX);

Yet more hmm - this path you want to get through for the case mentioned above.
But only this code; specifically not the "switch ( cpufreq_xen_opts[i] )",
which really is "switch ( cpufreq_xen_opts[0] )" in that case, and that's
pretty clearly wrong to evaluate in then.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -107,6 +107,9 @@ int cpufreq_statistic_init(unsigned int cpu)
>      if ( !pmpt )
>          return -EINVAL;
>  
> +    if ( !(pmpt->init & XEN_PX_INIT) )
> +        return 0;
> +
>      spin_lock(cpufreq_statistic_lock);
>  
>      pxpt = per_cpu(cpufreq_statistic_data, cpu);

This change could do with a code comment, I think.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -98,6 +98,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>      cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
>      switch ( option )
>      {
> +    case CPUFREQ_amd_cppc:
> +        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
> +        break;
> +
>      case CPUFREQ_hwp:
>      case CPUFREQ_xen:
>          xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;

Unless they're clearly "more important" (tm), please can insertions like
this not be done at the top of a switch() (or whatever else it is)? You
don't do so ...

> @@ -166,6 +170,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>              if ( !ret && arg[0] && arg[1] )
>                  ret = hwp_cmdline_parse(arg + 1, end);
>          }
> +        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
> +                  !cmdline_strcmp(str, "amd-cppc") )
> +        {
> +            ret = handle_cpufreq_cmdline(CPUFREQ_amd_cppc);
> +            if ( !ret && arg[0] && arg[1] )
> +                ret = amd_cppc_cmdline_parse(arg + 1, end);
> +        }
>          else
>              ret = -EINVAL;

... here, for example.

Jan

