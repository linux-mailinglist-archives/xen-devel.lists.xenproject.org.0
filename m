Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6EFAA11B9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 18:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972896.1361169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9nzA-0007wk-7M; Tue, 29 Apr 2025 16:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972896.1361169; Tue, 29 Apr 2025 16:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9nzA-0007tc-4V; Tue, 29 Apr 2025 16:39:08 +0000
Received: by outflank-mailman (input) for mailman id 972896;
 Tue, 29 Apr 2025 16:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9nz9-0007tW-5O
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 16:39:07 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7498e5cb-2518-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 18:39:01 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso59706825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 09:39:01 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b42c:b0eb:5c1a:72a5:6973?
 (p200300cab734b42cb0eb5c1a72a56973.dip0.t-ipconnect.de.
 [2003:ca:b734:b42c:b0eb:5c1a:72a5:6973])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a2386sm198311705e9.14.2025.04.29.09.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:39:00 -0700 (PDT)
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
X-Inumbo-ID: 7498e5cb-2518-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745944741; x=1746549541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4VSTdKchaOnkd99iFacTwDbxuXgREURW4VGZubzZaZk=;
        b=R8JyDr09QpnLA6eeIwz8KK4wjkzFQxjWCBlzfiCtjbHuaxHK59OjBk8gv2ZG7hOs9w
         7HJ/UNcYwsQypOWjhnOxRw4O6gzZ++W13YUdv7FZUWlhX/N7Rb/R62frxZZjTmj6ckxR
         zgDZqkOwPaIsxFcgg6xml+76y33uNeNTQvYukMGedD1Z54uS38VAbrsFPtysZKis1Khu
         LF7vzMT/ikiyyAZzLlxxJ3R41qmZzAW3I0ERVKO2c8smB9VlKbtKt0LtoNBm4WwNdLMz
         u8oCzV//GpxdvmZXkLke3CXtRobIXG0v1DW+S3+X4Aj6mgs1LLndcYYuP++TNyR/zCBq
         872Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944741; x=1746549541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VSTdKchaOnkd99iFacTwDbxuXgREURW4VGZubzZaZk=;
        b=hptd7utIDvtJleq6DHigvVyp9K+bdTFw8ld4AVYdGqL9qU17tjIMaMCafzdNCUSovn
         TowPeC7xoVfiQqziI0I6B4jUcmXs5ROHftrkwlkbH6j6HqVMk1iIGuI17jn0gDwSodQC
         paw1sTlAWoPzdiG4hDFvTx5bvyhj2j0ZygZagI5GDGHJS/oFxgrFAdplyIA3rJZLw1Cg
         4QS/WQnIqdD2di3vfB+CvovLZ5Lm5W81UFUGhdhYWIzj7Z4rde4G4XGhq5y1xelEnpXq
         R/Phd8m/+8kzkEa4dEUkzSN+yr6VsZdDlySMJPHM9wQ7X17luuDDeLJyYws3U6MeGWzT
         6KcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU65g1d6/TJgKgo2COGTlud220qwN3TumVK8YmSr8obn2dBLfXIvsyXiJkidOKDtU4QHgueP+E3Cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMb8zmxCv2tPsoGRnW5BUsT27EV1E6n6+S+bw6CkRXjIn2mevg
	bKL97RULdIgT1XdrJlGKkbdXznmqXjjrPUg52tz8uQekNkS/4xAITXSFPsI1Uw==
X-Gm-Gg: ASbGncudIg3ojD+hoQ53Hktq9AYQx2c1uONAbPIDiWWSJ7EKQFiTVGNUTX5CI6teBg7
	Fe5wSYso3E6/evXUfPQPDC5gM0U5405NRjur3Qh8Y3ojj7hgisf0+D2vdWThUHI2CANbaWplW7E
	Bc30JL6XuJaQXwctfWqcmYhuoEdMhDt+4i/4rEa9FIJUjVPr63WXnuOUKLEKLd6qm6eK79Q/lFZ
	GLurAN+I5HFujShiBUSyCnhVxaVvp0eqW26x7f3yTVIx0K8AkWpDiZAOD9fJQVptJJ/ANnJM1YM
	v+H4AeJuunZNogS1yKWyEiCUSHC9IpRXRa217cjgchy+THSEfAQ9qRwzfrrQ5W/YqjgW68TQPlu
	w7bJeERcuYQFv+00s6h0drIJ0s1D3Uku5pF/SOXpTLh8/UZI+iLClLLF+JCUUGWU/GjH2Cg+d6w
	0=
X-Google-Smtp-Source: AGHT+IFUabUl0VmVZLUY9o9lj8+Tv6dPsRx+IEcUAsF8bkCxNHsYnz+brGsoDUCUsbywthXuGYtrTA==
X-Received: by 2002:a05:600c:4e4f:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-441ac88ab91mr34066195e9.23.1745944740935;
        Tue, 29 Apr 2025 09:39:00 -0700 (PDT)
Message-ID: <b56cdeaa-7951-46f9-a558-d8a65bf8b237@suse.com>
Date: Tue, 29 Apr 2025 18:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
>  available support.
>  
>  ### cpufreq
> -> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
> +> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
>  
>  > Default: `xen`
>  
> @@ -537,6 +537,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>  * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
>    on supported AMD hardware to provide finer grained frequency control
>    mechanism. The default is disabled.
> +* `active` is to enable amd-cppc driver in active(autonomous) mode. In this
> +  mode, users could write to energy performance preference register(epp) to
> +  tell hardware if they want to bias toward performance or energy efficiency.
> +  Then built-in CPPC power algorithm will calculate the runtime workload and
> +  adjust cores frequency automatically according to the power supply, thermal,
> +  core voltage and some other hardware conditions.

This section of the cmdline doc may not be of the best quality, but may I
nevertheless ask that for this new sub-option you make explicit what the
default is (and that it's of boolean nature)?

> @@ -434,12 +464,82 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>      amd_cppc_boost_init(policy, data);
>  
> +    return 0;
> +}
> +
> +static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret;
> +
> +    ret = amd_cppc_cpufreq_init_perf(policy);
> +    if ( ret )
> +        return ret;
> +
>      amd_cppc_verbose(policy->cpu,
>                       "CPU initialized with amd-cppc passive mode\n");
>  
>      return 0;
>  }
>  
> +static int cf_check amd_cppc_epp_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret;
> +
> +    ret = amd_cppc_cpufreq_init_perf(policy);
> +    if ( ret )
> +        return ret;
> +
> +    policy->policy = cpufreq_policy_from_governor(policy->governor);

This is the init part, which is fine. What if the governor is being changed,
though? The struct field is new, and there's no other place I can spot where
it would be adjusted.

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -242,6 +242,7 @@
>  #define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
>  #define  AMD_CPPC_ENABLE                    (_AC(1, ULL) <<  0)
>  #define MSR_AMD_CPPC_REQ                    0xc00102b3U
> +#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) <<  24)

Nit: Excess blank after << (there's no such issue with AMD_CPPC_ENABLE,
ftaod).

Jan

