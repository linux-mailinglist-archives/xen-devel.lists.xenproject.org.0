Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A8A6DE8E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925781.1328664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjh2-0005e1-DF; Mon, 24 Mar 2025 15:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925781.1328664; Mon, 24 Mar 2025 15:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjh2-0005bn-Ad; Mon, 24 Mar 2025 15:26:24 +0000
Received: by outflank-mailman (input) for mailman id 925781;
 Mon, 24 Mar 2025 15:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twjh0-0005bh-9P
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:26:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56a5b708-08c4-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:26:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so36590135e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:26:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdaca8sm177255605e9.28.2025.03.24.08.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:26:20 -0700 (PDT)
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
X-Inumbo-ID: 56a5b708-08c4-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742829980; x=1743434780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rWdPRhU46orMge+R7VA13roLeqydimtZ2Fd67A06kDI=;
        b=dJ8vwUHC+rYuakf2UtmlkUrRZ17yBOQHWMD5V1hwRXBXOI3No1ig7YlBgYkErVDxWC
         Thoe8cB2NB61/g0dTYvDT2yMuZJRbCSbZ4Dq280HgxHCEYGsXAIhNMavpo7lyoCQmG3+
         4arQ9YUPBmh7GKkO6qFfbeljI+9S+jY9uHLUELxsm2hszdcf4SDI5Ld3ozYPsvlRGaJ6
         aDbJE0dJ62lJRfH4la2VZBNzrTl6q1feoGeESHT3NTEypD63SfvR7BU6wtLF/jDJkqh5
         ZRN6Y2SesK51YVwWjq1VzCIgvLgBhRNhJP3j5rvAce3cB4LpNSFZxy+IAIE+uc95LJ5J
         70fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742829980; x=1743434780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWdPRhU46orMge+R7VA13roLeqydimtZ2Fd67A06kDI=;
        b=WmeosHjZorCM1FJt/8tQxQ0Udda62XlroZFKu1QbfMRvoDiZDLEaPStTMFyuNQ7aR+
         Zoc1BCd8cJ2K/OeL6s4cA5SZNDqMcoQgslVCCdPi9ooObQjMlUabRShHIViJ6QBlx3hF
         dniflq61D7bbg64eAMdFNxvyD6t+mxzwotITrZLOTqbOzHENphd6dsGcMwBnzSCnupu9
         5K8+x7cBwzMvfRAn5FqOX/fW7p37MngMvBXcEe9dhxI4IOdwFPnpVe01WDxON0ak3IpH
         JhDj2VCKO3cIqycaa/YzCiAwromW2rg9WpDeuctwgVozry4EL1ri17fzEfpP/2kpnRDd
         n7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9SNzucPikUbDkb+HWKTgTMVtRD/cfxGoQY7H1ORz4qNPnBUL6/IEHMUwlQTGpbX+q3K5jqAgpyvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwASox/A8+eXHhxzewVt8tfwc05o3sJdy4JOuXLBWZvYNMVRJfi
	S5z3HQlaiczwqu1zeLdq2iqRsNeC5SUW22Fq4A2MNh/HyK6zw3p7fxi0nFyBxg==
X-Gm-Gg: ASbGnctY6nydgf7Zyj25Us9+IB2yO1lZ5bhFuraDI+XvQlDzivhU2WlFwDT4BRu7LWE
	LaptL3oX+fTBdkckIkLdbqY4Br3v0WZYZAT8P7XxKCFmp/EMGfl6fHQgZZC+SCPrGaq2iF9UZw3
	kBFGOfyLqVBdett9JG5ZNrKi8BJvget9oQ6MFlLC+xCvHXRYLpnCbZJ2+2Y4Ckt5ScQCDvqLI7z
	J+k+uBU5B++56kNW7dOhx/+GFoC4B/JLs2uYB4WFI7prXwp2SxqsmWdR6vFbJ0hplEICKx8ZxQB
	nZdcXHxQ/Uzyp6CF8zkhjYfVUHNRlx9cIUMmILUT2NEqyeCv1PajnDXdo5C/TMlo2O4eytwG4JR
	6+z+YDpzy33Qvzbm8nL5PKuMyq36C1w==
X-Google-Smtp-Source: AGHT+IGyMQC31kLHa3kmrL1TIvG+4f6tz2GZPm1V/IDuheE/NMYV5BUXAzgJu1YJ+hKGInga3rrlBg==
X-Received: by 2002:a05:600c:190e:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-43d509e0514mr123829205e9.2.1742829980383;
        Mon, 24 Mar 2025 08:26:20 -0700 (PDT)
Message-ID: <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
Date: Mon, 24 Mar 2025 16:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> @@ -514,5 +515,14 @@ acpi_cpufreq_driver = {
>  
>  int __init acpi_cpufreq_register(void)
>  {
> -    return cpufreq_register_driver(&acpi_cpufreq_driver);
> +    int ret;
> +
> +    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +    if ( ret )
> +        return ret;
> +
> +    if ( IS_ENABLED(CONFIG_AMD) )
> +        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;

What's the purpose of the if() here?

> @@ -157,7 +161,35 @@ static int __init cf_check cpufreq_driver_init(void)
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
> +
> +            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
> +            {
> +                switch ( cpufreq_xen_opts[i] )
> +                {
> +                case CPUFREQ_xen:
> +                    ret = powernow_register_driver();
> +                    break;
> +                case CPUFREQ_amd_cppc:
> +                    ret = amd_cppc_register_driver();
> +                    break;
> +                case CPUFREQ_none:
> +                    ret = 0;
> +                    break;
> +                default:
> +                    printk(XENLOG_WARNING
> +                           "Unsupported cpufreq driver for vendor AMD\n");

What about Hygon?

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
>      CPUFREQ_none,
>      CPUFREQ_xen,
>      CPUFREQ_hwp,
> +    CPUFREQ_amd_cppc,
>  };
>  extern enum cpufreq_xen_opt cpufreq_xen_opts[2];

I'm pretty sure I pointed out before that this array needs to grow, now that
you add a 3rd kind of handling.

Jan

