Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4BA07250
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867958.1279495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpJT-0003Vv-8g; Thu, 09 Jan 2025 09:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867958.1279495; Thu, 09 Jan 2025 09:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpJT-0003TZ-63; Thu, 09 Jan 2025 09:58:51 +0000
Received: by outflank-mailman (input) for mailman id 867958;
 Thu, 09 Jan 2025 09:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVpJS-0003TT-7p
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:58:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5233914a-ce70-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 10:58:48 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso512972f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:58:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1ce5sm1359236f8f.94.2025.01.09.01.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 01:58:47 -0800 (PST)
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
X-Inumbo-ID: 5233914a-ce70-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736416728; x=1737021528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/VXpPq3krtPPpdfZOOaixS4Qtjl5Z/mwSZquK/DB4c0=;
        b=D8YxmWSHSTMPI7zhfK2FtwtcXIPzKJeIZkHSwsJlK/uNGpmyanD0z0WA+WSSSp9j5s
         5Mra8WwpVhsxZ2n/K71WheScCXAQsD8Qer02mLWx18JILGgKe4PMZ8Y/Sw59VKEVgdLW
         nCkUeplWtHcdOGn7ws13fL+I8+O3HVcs6jB/Rt2Dt9jS3kqL5lJvGef4T3aVzOZmdqn2
         4cj6MBXG0wqUt+/nfvJcWqjbxaYRB6YnzAv644xvOFM4DrjtNt7NwOwkY2hwVh6e2uwf
         8uDwfk0ppTWG/47CNH5zReaNVqYpQclN3g4JmzTU5s7f2XAKu5CGZoXRzNW8BQpAZncC
         lzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736416728; x=1737021528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VXpPq3krtPPpdfZOOaixS4Qtjl5Z/mwSZquK/DB4c0=;
        b=tTlaodfpbpBBAR8HMKt4+PITvrY+vFuhE3Em9UH0hch8l32LmMI/2awA98G8XNUYuR
         MVR0QBIN1LY2CRyMPIPFza1Rb+2dO2y9YSEBHEtuDjKldgC46xh1EUK7Jc6lFiMmWnNN
         q+1pNiWFl7ePgmdIsKOUqPJ4EGAQiRrekgITZcW2ywqxPQgT1uIrFysI1X9tR/unwKUe
         GwVlrIGtf9BnZ5VccDIUYQfav4co6JWD3+9N2X3wbFrJ/JmQZipxvFJ4U2I98+fSJBPE
         lYQmAARQ4kesRqyp2jFr+AGe7pm6BlCOnbCVPfIzaA87QKpYkeohCRaEawC9ZWfFObt5
         Nc/w==
X-Forwarded-Encrypted: i=1; AJvYcCUtbt22kCPKTmiK9hwiTYq4/ghAI5pM8ybW/wSPAqWDgzToX/YeCqyULuSoq8s48T7APXEAGuhJnoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+iwYmFWMjj5dIPwbQTD/Vm3SlSHCYF9/8Ay30Nlfw5RBnEeBA
	Xjg6BSpqaMsn8miO7xmQMb/5bcXxhxV3LKLXHn1CZbJwYldIiORDcgp53OqWQA==
X-Gm-Gg: ASbGncu57qqOJOEY7VZa1eDnwgztobUrkrRyQsn42B2rbYKGnDzxw2ngARbc3dRYAjX
	lNRrRbZvoPBnGTWRcIGAji786KdcpkkA52N8V1lcYkU8bFemx6grLgRsNqZ/xNccgoLngT3/nhy
	CUM3mRbYNnyusHKyg8sR1pNKvsRShEUJvPwq0x8XpDBiRsc8hsKLRbUS3+sOqvVQzvxfPQKL4hi
	cylOIuE9/vhmNRkHOt6Msn6y1TrE2TM5+Zkp7AdnL9zlzwqPJn/QdDVRTbwA1MfrAAtM/AQjLhR
	nKApBsbUrvwvB2E/EVw8aFCb8Er7uqijl+Tc97Qlkw==
X-Google-Smtp-Source: AGHT+IGPK+cWw7vQ8luY1gE9h5jdoX6r83TrmJpgCSoLbkiqEYsCNZx0f1whShgo+ZYGiJ60LUljmw==
X-Received: by 2002:a05:6000:1acb:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-38a87316a81mr4935048f8f.50.1736416727696;
        Thu, 09 Jan 2025 01:58:47 -0800 (PST)
Message-ID: <e7f1b3c3-dce4-4a0e-b1cf-c6ba8af95290@suse.com>
Date: Thu, 9 Jan 2025 10:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/Makefile
> +++ b/xen/arch/x86/acpi/cpufreq/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_INTEL) += acpi.o
>  obj-y += cpufreq.o
> +obj-y += amd-pstate.o
>  obj-$(CONFIG_INTEL) += hwp.o
>  obj-$(CONFIG_AMD) += powernow.o

Please obey to alphabetic sorting.

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * amd-pstate.c - AMD Processor P-state Frequency Driver
> + *
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Penny Zheng <penny.zheng@amd.com>
> + *
> + * AMD P-State introduces a new CPU performance scaling design for AMD
> + * processors using the ACPI Collaborative Performance and Power Control (CPPC)
> + * feature which provides a finer grained frequency control range.
> + *
> + */

Nit: Unnecessary empty comment line at the end.

> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +uint16_t __read_mostly dmi_max_speed_mhz;
> +
> +static bool __init amd_pstate_handle_option(const char *s, const char *end)
> +{
> +    int ret;
> +
> +    ret = parse_boolean("verbose", s, end);
> +    if ( ret >= 0 )
> +    {
> +        cpufreq_verbose = ret;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int __init amd_pstate_cmdline_parse(const char *s, const char *e)
> +{
> +    do
> +    {
> +        const char *end = strpbrk(s, ",;");
> +
> +        if ( !amd_pstate_handle_option(s, end) )
> +        {
> +            printk(XENLOG_WARNING "cpufreq/amd-pstate: option '%.*s' not recognized\n",
> +                   (int)((end ?: e) - s), s);
> +
> +            return -EINVAL;
> +        }
> +
> +        s = end ? ++end : end;
> +    } while ( s && s < e );
> +
> +    return 0;
> +}
> +
> +static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =

__initconst_cf_clobber

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -148,6 +148,9 @@ static int __init cf_check cpufreq_driver_init(void)
>                  case CPUFREQ_none:
>                      ret = 0;
>                      break;
> +                default:
> +                    printk(XENLOG_WARNING "Unsupported cpufreq driver for vendor Intel\n");

Too long line (the format string itself shall be kept all on one line, but
the XENLOG_WARNING doesn't need to).

> @@ -156,6 +159,31 @@ static int __init cf_check cpufreq_driver_init(void)
>              break;
>  
>          case X86_VENDOR_AMD:
> +            ret = -ENOENT;
> +
> +            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
> +            {
> +                switch ( cpufreq_xen_opts[i] )
> +                {
> +                case CPUFREQ_xen:
> +                    ret = powernow_register_driver();
> +                    break;
> +                case CPUFREQ_amd_pstate:
> +                    ret = amd_pstate_register_driver();
> +                    break;
> +                case CPUFREQ_none:
> +                    ret = 0;
> +                    break;
> +                default:
> +                    printk(XENLOG_WARNING "Unsupported cpufreq driver for vendor AMD\n");
> +                    break;
> +                }
> +
> +                if ( ret != -ENODEV )
> +                    break;
> +            }
> +            break;
> +
>          case X86_VENDOR_HYGON:
>              ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>              break;

Is the code to handle CPPC not applicable to Hygon CPUs?

What about the IS_ENABLED(CONFIG_AMD) that the original code had? Don't
you need to mirror this in some way?

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -574,6 +574,12 @@ ret_t do_platform_op(
>  
>          case XEN_PM_CPPC:
>          {
> +            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
> +            {
> +                ret = -ENOSYS;

ENOSYS isn't appropriate for such a situation.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -84,7 +84,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>  
>      if ( choice < 0 && !cmdline_strcmp(str, "dom0-kernel") )
>      {
> -        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
> +        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX|XEN_PROCESSOR_PM_CPPC);
>          cpufreq_controller = FREQCTL_dom0_kernel;
>          opt_dom0_vcpus_pin = 1;
>          return 0;
> @@ -92,7 +92,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>  
>      if ( choice == 0 || !cmdline_strcmp(str, "none") )
>      {
> -        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
> +        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX|XEN_PROCESSOR_PM_CPPC);

Nit (style): Blanks please around binary operators.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
>      CPUFREQ_none,
>      CPUFREQ_xen,
>      CPUFREQ_hwp,
> +    CPUFREQ_amd_pstate,

Might this better be CPUFREQ_amd_cppc? "pstate" may mean various methods.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -424,6 +424,7 @@ struct xen_set_cppc_para {
>  };
>  
>  #define XEN_HWP_DRIVER_NAME "hwp"
> +#define XEN_AMD_PSTATE_DRIVER_NAME "amd-pstate"

Similarly here.

Jan

