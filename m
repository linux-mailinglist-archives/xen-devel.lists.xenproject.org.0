Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFAAD6E0D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012798.1391307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfOH-000414-5X; Thu, 12 Jun 2025 10:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012798.1391307; Thu, 12 Jun 2025 10:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfOH-0003zI-2j; Thu, 12 Jun 2025 10:42:37 +0000
Received: by outflank-mailman (input) for mailman id 1012798;
 Thu, 12 Jun 2025 10:42:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPfOF-0003zC-Qy
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:42:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f30807d1-4779-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 12:42:34 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so13791955e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:42:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74880896268sm1122372b3a.44.2025.06.12.03.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:42:32 -0700 (PDT)
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
X-Inumbo-ID: f30807d1-4779-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749724954; x=1750329754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RuAhpSmRJLYAMPFosLKtVzELzW8u013hIskDY5yVKfI=;
        b=AYg8dDkThDj6De3Gi5VkqFp9OHi0kuwSWW2nEYKIkTbeIfhGQNW5QrocLUNt9+sRyl
         Kfo0GwNUkWrt4PZsMhGD6T59swqJHec7Luv4G9f++N6URjF6xL5AYLCc0yDegIrNCnh/
         4sET17BgZirUrmAm93rWmMF+ATB1osZMAu69FRw5AOcMnLb/1eulLe8WoIKpI59nmfXy
         NyuUy79kDd+YO6p+bo1XVoAsiXxYWgpa+oqA080nU9lllarCPPxlIyetQzAi55bE2/dz
         8pMHyl0OuSdDnAsB51tRt7gBksWEVCZCiIH3R/dyT4M0XxvJF/bMqZWa9d+uG6LoXWHe
         eVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749724954; x=1750329754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuAhpSmRJLYAMPFosLKtVzELzW8u013hIskDY5yVKfI=;
        b=MAEKmBy+pVLM/dcQjQlm2pyczPu/QaC1hcwcdgcoCScFmy8Ze6mInAf/+PTOZzXMZ9
         0Cwh2pHN2IyWUaH3fq/FTwMowZIyBiY2QSKJATFOIhjkqk7JT3YUDDgqjGP4xmMXZMT+
         o5hPSJmmPKuRumWTwzjpDvphfu7qqnhgD2MhpujmAtos/RCQDVX+EbDdagZkWJC7PSxY
         vDvw4PpsU5m+5h4J3RlnVEH2LItEn1GWGhIJv1Jzb1NS0PFiXA0Lmu2LW93h9FaCNZFs
         aA4fNTQBPZH616ZYkUr9K+n5K0eM12RkQgQMynUZed/tc7IZxxmtGG1ovQVsVpG+JlVw
         648A==
X-Forwarded-Encrypted: i=1; AJvYcCU7QwuYRCJkDgtkeEpEtb2wfF+qM79tU898JfWBAtwimp06+hOVgCV66FCbjkZJCfHo/Mt6f9aOJuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxagIUUJ0uGTOP83HGH/0QD/OcG2RvocFF1q4ma5wslVBWMeL0n
	EY+cWYcR+a9RV/o4DvSLimh32etKiQAG7jIFAvHFlT0hsqkxIq56kkFtSnRJPLTjKw==
X-Gm-Gg: ASbGncvQHgnTq3mTq3/YEpSDqCIwJ1PIWSmyXiyH2BRywpLbYa7iReVA+B9+dTQt1Gm
	GM0WwNzKiDpNBC0QHN2N8BnB+DjjYIQyZ8xa9ZreqZRK1XdMi8QfHKi/C4Jn0QcyH4XEY3kL6cK
	H+B/9A8gm2osQnkJftw8ocDVDPM9MeEuPZGmQ/ti92OH67D1KIaVpBdSrLIELpbCyFNBPzzlKXI
	z3UA1phP2AzV7sGa99ZID6hmvVBhxoqwPKsqTymuqpH5uPHQDCFxYLy2ZkbaR/ea0e1tPnzkSAp
	dO4xW+LmPEAnrxzbhfjpCN90gbYQh47jXXrOnh1rklOwczE8dnahFzFRq0qosTMGLXga9ZbFgI+
	FYVqJX/9m0ANbXX8l7sVNMBdLCikpZ4exQBwLsJ0fIV1pQ0g=
X-Google-Smtp-Source: AGHT+IEz9ctytOLQjBLYvZ1MCImrzf3LXJMbBUzA47qo9HV5oCOfar0qzj1JnkDlFZIEaEyKY83EnQ==
X-Received: by 2002:a05:6000:40cf:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a5607faa09mr2196242f8f.17.1749724953102;
        Thu, 12 Jun 2025 03:42:33 -0700 (PDT)
Message-ID: <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
Date: Thu, 12 Jun 2025 12:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> Users need to set "cpufreq=amd-cppc" in xen cmdline to enable
> amd-cppc driver, which selects ACPI Collaborative Performance
> and Power Control (CPPC) on supported AMD hardware to provide a
> finer grained frequency control mechanism.
> `verbose` option can also be included to support verbose print.
> 
> When users setting "cpufreq=amd-cppc", a new amd-cppc driver
> shall be registered and used. All hooks for amd-cppc driver are transiently
> missing and will be implemented in the ongoing commits.
> 
> New xen-pm internal flag XEN_PROCESSOR_PM_CPPC is introduced, to be
> differentiated with legacy XEN_PROCESSOR_PM_PX. We define
> XEN_PROCESSOR_PM_CPPC 0x100, as it is the next value to use after 8-bits wide
> public xen-pm options. All xen-pm flag checking involving XEN_PROCESSOR_PM_PX
> shall also be updated to consider XEN_PROCESSOR_PM_CPPC now.
> 
> Xen is not expected to support both or mixed mode (CPPC & legacy PSS, _PCT,
> _PPC) operations, so only one cpufreq driver gets registerd, either amd-cppc
> or legacy P-states driver, which is reflected and asserted by the incompatible
> flags XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - Obey to alphabetic sorting and also strict it with CONFIG_AMD
> - Remove unnecessary empty comment line
> - Use __initconst_cf_clobber for pre-filled structure cpufreq_driver
> - Make new switch-case code apply to Hygon CPUs too
> - Change ENOSYS with EOPNOTSUPP
> - Blanks around binary operator
> - Change all amd_/-pstate defined values to amd_/-cppc
> ---
> v2 -> v3
> - refactor too long lines
> - Make sure XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC incompatible flags
> after cpufreq register registrantion
> ---
> v3 -> v4:
> - introduce XEN_PROCESSOR_PM_CPPC in xen internal header
> - complement "Hygon" in log message
> - remove unnecessary if()
> - grow cpufreq_xen_opts[] array
> ---
> v4 -> v5:
> - remove XEN_PROCESSOR_PM_xxx flag sanitization from individual driver
> - prefer ! over "== 0" in purely boolean contexts
> - Blank line between non-fall-through case blocks
> - add build-time checking between internal and public XEN_PROCESSOR_PM_*
> values
> - define XEN_PROCESSOR_PM_CPPC with 0x100, as it is the next value to use
> after public interface, and public mask SIF_PM_MASK is 8 bits wide.
> - as Dom0 will send the CPPC/Px data whenever it could, the return value shall
> be 0 instead of -ENOSYS/EOPNOTSUP when platform doesn't require these data.
> ---
>  docs/misc/xen-command-line.pandoc         |  7 ++-
>  xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
>  xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 68 +++++++++++++++++++++++
>  xen/arch/x86/acpi/cpufreq/cpufreq.c       | 63 ++++++++++++++++++++-
>  xen/arch/x86/platform_hypercall.c         | 13 ++++-
>  xen/drivers/acpi/pmstat.c                 |  3 +-
>  xen/drivers/cpufreq/cpufreq.c             | 18 +++++-
>  xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
>  xen/include/acpi/cpufreq/processor_perf.h |  3 +
>  xen/include/public/sysctl.h               |  1 +
>  10 files changed, 175 insertions(+), 8 deletions(-)
>  create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

This patch does quite a bit more than what the subject suggests it means to
do; please consider adjusting.

> +int __init amd_cppc_register_driver(void)
> +{
> +    if ( !cpu_has_cppc )
> +    {
> +        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
> +        return -ENODEV;
> +    }
> +
> +    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);

Isn't this premature? I fear in particular that some of the hooks, which
are still all NULL, might have a way of getting invoked.

> @@ -157,7 +162,63 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>          case X86_VENDOR_AMD:
>          case X86_VENDOR_HYGON:
> -            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
> +            unsigned int i;
> +
> +            if ( !IS_ENABLED(CONFIG_AMD) )
> +            {
> +                ret = -ENODEV;
> +                break;
> +            }
> +            ret = -ENOENT;
> +
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
> +                }
> +
> +                if ( ret != -ENODEV )
> +                    break;

This, I think, needs some commenting. It's not quite clear why we shouldn't
try the next option if registration failed with other than -ENODEV.

> +            }
> +
> +            /*
> +             * After cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
> +             * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
> +             */
> +            if ( !ret && i < cpufreq_xen_cnt )
> +            {
> +                switch ( cpufreq_xen_opts[i] )
> +                {
> +                case CPUFREQ_amd_cppc:
> +                    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
> +                    break;
> +
> +                case CPUFREQ_xen:
> +                    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
> +                    break;
> +
> +                case CPUFREQ_none:
> +                default:

What's the point of the separate "case" label here?

> +                    break;
> +                }
> +            }

Why does this pruning of xen_processor_pmbits sit in the AMD-only code path?
Iirc earlier on you had it in the *_register_driver() themselves, and my
request was to put it in a central, generic place. It's central now, but not
generic (and this way it could as well have remained in *_register_driver()).

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -539,9 +539,12 @@ ret_t do_platform_op(
>          case XEN_PM_PX:
>              if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
>              {
> -                ret = -ENOSYS;
> +                ret = 0;
>                  break;
>              }
> +            /* Xen doesn't support mixed mode */
> +            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC));
> +
>              ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
>              break;

I don't see how this change relates to the purpose of the patch. From the
description (and in the absence of a code comment) it also doesn't become
clear at all why that change of return value would be needed (and would be
correct to do). From comments I gave on earlier versions of this series, I
think I can guess what this is about, but such shouldn't be slipped in
silently.

> @@ -573,6 +576,14 @@ ret_t do_platform_op(
>          }
>  
>          case XEN_PM_CPPC:
> +            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
> +            {
> +                ret = 0;
> +                break;
> +            }

As per above, this yielding success needs justifying.

> @@ -94,6 +95,8 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>  {
>      int ret = 0;
>  
> +    /* Do not occupy bits reserved for public xen-pm */
> +    BUILD_BUG_ON(MASK_INSR(XEN_PROCESSOR_PM_CPPC, SIF_PM_MASK));

This looks like an abuse of MASK_INSR(). Why not simply

    BUILD_BUG_ON(XEN_PROCESSOR_PM_CPPC & SIF_PM_MASK);

?

Also please separate this by a blank line from what follows, or perhaps
even better ...

> @@ -105,6 +108,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>      cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
>      switch ( option )
>      {
> +    case CPUFREQ_amd_cppc:
> +        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
> +        break;

... move it here.

> @@ -172,6 +179,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>              if ( arg[0] && arg[1] )
>                  ret = hwp_cmdline_parse(arg + 1, end);
>          }
> +        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
> +                  !cmdline_strcmp(str, "amd-cppc") )
> +        {
> +            ret = handle_cpufreq_cmdline(CPUFREQ_amd_cppc);
> +            if ( arg[0] && arg[1] )
> +                ret = amd_cppc_cmdline_parse(arg + 1, end);
> +        }

See Jason's comment on the earlier patch.

> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -5,6 +5,9 @@
>  #include <public/sysctl.h>
>  #include <xen/acpi.h>
>  
> +/* Internal ability bits */
> +#define XEN_PROCESSOR_PM_CPPC   0x100

The comment wants extending, to have a reference to the other XEN_PROCESSOR_PM_*
bits and perhaps also to SIF_PM_MASK. In fact the BUILD_BUG_ON() that I commented
on above could be replaced by

#if XEN_PROCESSOR_PM_CPPC & SIF_PM_MASK
# error "..."
#endif

right here.

Jan

