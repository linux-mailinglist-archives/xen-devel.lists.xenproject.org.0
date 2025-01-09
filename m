Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB897A0748E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868226.1279759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqdl-0006BS-D4; Thu, 09 Jan 2025 11:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868226.1279759; Thu, 09 Jan 2025 11:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqdl-00068z-AS; Thu, 09 Jan 2025 11:23:53 +0000
Received: by outflank-mailman (input) for mailman id 868226;
 Thu, 09 Jan 2025 11:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVqdj-00068q-Jj
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:23:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32d54d8f-ce7c-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 12:23:49 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so6098825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:23:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6401sm52434755e9.2.2025.01.09.03.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:23:48 -0800 (PST)
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
X-Inumbo-ID: 32d54d8f-ce7c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736421829; x=1737026629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G4kt3o+Yc7LWOWbjd5MTmHjbaASrzqLfQf/updZjo/Q=;
        b=bfVexs5WG66q7AjJq2tNoZKuynSy3XQ2bvwSf0Y/wn8S5uCJyW6AbSWsWnt/oigBVN
         j7xBBXk8vWGpLKWsptU27W8xj3+fm0whGWPh3MT6/jPwJKqrtgTr1g3MQ3+edf8++YXl
         61wCIz79PEqyjqGhDsSCegyjIqjRiqpe3f7T7vZN+eQyIwEPzx+JZn1noFFrFMkaOg41
         Gykbmqxb4aM2mzyJngOWMXZbstIy5INN/sFftg0Z9qIYsKbf0F80vKucmu5v2KGFy94s
         mY8hXEhDnXDTMoUnibEq8iTJMAljRyK8ADbrMngQFVBE7fdKLN3Hj+C/5RTdMrFDNiEd
         RE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421829; x=1737026629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4kt3o+Yc7LWOWbjd5MTmHjbaASrzqLfQf/updZjo/Q=;
        b=Ls2vpwG9wbYTW/R683V2oYqV8aGT0sV0t/Cv5aSnUmCjv5JzMHH52ic1Vde0lrXUIU
         nzMaRveZmwXCWIqC6I9lTx9fkX5Z662Gt+IGPgYUTLC6rD1rPe+2xJWDws7VIi5S/niZ
         kI3exaHkiXdOJtB9NUvQFOn9JyFDfQYfjpzWme7eF38t60tNbOpHSQePb7GJ0KSO/l0w
         55F34jQtu0VMBDEyoTJRtYtSZjWPbbKISnYvwndWDpepmP6WxttmQ6oOULqQch4AHJN+
         KKabByXsQKS5PK3FCWCQoBhZDiQFo+Fjgx8rIkHg5N2rUyJY43DOqm2TqXa9dQ078A5A
         ZUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcHgjtAzpt9Ly/0wmExyQRi7848SXFX5xHq2MuJyAPkmgljInz0+zAmlTtdPvpqFQgnWKXXMBXQcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpXXiLhn/kWcmdzXchXNt/83VIuQJqdOkDwuj1C3g9FkKjQETv
	UhGYr/U/hKeh2us7UKdQwVjmk9/MlZS40j/fQAVBrmP1vr0wY1xyiTjk+Pb+SA==
X-Gm-Gg: ASbGnctP6eYKSCgntUc+C3TmRa4V1bIEXV/IM8sR4IO+nO1jqv5BVO3vlYgagetJQ/1
	GMRa8DD+wmycIfDjvDboCV/cOTk56pDno7iFWCCpkKdxqDWznP92oHzT2431cfDy+ZUhxkbfpBA
	ayNN4gYIWsmPg6pKmswetUkZS2IIJx7mKkPXDBdcShIwyH1uU7Y+sFzrnhlJ0SLGz0aJd7kNNmd
	DWInOVZSAr18/krIH+P7ZApZYjb2++eX3eFisEaKXQTLcfPB45RFpw8CsUe+QjfaJ7nDXe6nWtA
	pbm/MI+y2spg+BuCvumuTosNzTAwkwFLPzDcXqfiFw==
X-Google-Smtp-Source: AGHT+IH/it6L6YNM1tG+YyqSCvlsaPKtoolQy6NeioEKimFwWS/FqtbDh9V8azE4SisIqe517Fsh6g==
X-Received: by 2002:a05:600c:4f4e:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-436e26935cbmr35033925e9.12.1736421828987;
        Thu, 09 Jan 2025 03:23:48 -0800 (PST)
Message-ID: <541ed82a-6cf3-4964-9421-23905b777f9c@suse.com>
Date: Thu, 9 Jan 2025 12:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/11] x86/cpufreq: add "cpufreq=amd-pstate,active"
 para
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@amd.com>
> 
> The amd-pstate driver may support multiple working modes, passive and active.
> 
> Introduce a new variable to keep track of which mode is currently enabled.
> This variable will also help to choose which cpufreq driver to be registered.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  docs/misc/xen-command-line.pandoc      |  9 ++++++++-
>  xen/arch/x86/acpi/cpufreq/amd-pstate.c | 12 +++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 30f855fa18..a9a3e0ef79 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -499,7 +499,8 @@ If set, force use of the performance counters for oprofile, rather than detectin
>  available support.
>  
>  ### cpufreq
> -> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-pstate[:[verbose]]`
> +> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] }
> +[,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-pstate[:[active][,verbose]]`
>  
>  > Default: `xen`
>  
> @@ -522,6 +523,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>    on supported AMD hardware to provide a finer grained frequency control mechanism.
>    The default is disabled. If `amd-pstate` is selected, but hardware support
>    is not available, Xen will fallback to cpufreq=xen.
> +* `active` is a boolean to enable amd-pstate driver in active(autonomous) mode.
> +  In this mode, users could provide a hint with energy performance preference
> +  register to the hardware if they want to bias toward performance(0x0) or
> +  energy efficiency(0xff), then CPPC power algorithm will calculate the runtime
> +  workload and adjust the realtime cores frequency according to the power supply
> +  and themal, core voltage and some other hardware conditions.

Nit: thermal

> --- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
> @@ -27,6 +27,8 @@
>  #define amd_pstate_warn(fmt, args...) \
>      printk(XENLOG_WARNING "AMD_PSTATE: CPU%u warning: " fmt, cpu, ## args)
>  
> +static bool __ro_after_init opt_cpufreq_active = false;

Pointless initializer.

> @@ -398,5 +407,6 @@ int __init amd_pstate_register_driver(void)
>      if ( !cpu_has_cppc )
>          return -ENODEV;
>  
> -    return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
> +    if ( !opt_cpufreq_active )
> +        return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
>  }

I'm afraid the description is of no help in determining why this is a
correct change to make (here). How would the user provided hint (see
cmdline option description) be communicated to hardware when the driver
isn't even registered?

Finally I don't think the change above would build, as it leaves a
return from the function without return value.

Jan

