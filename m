Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5683C4B8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671568.1044974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0l5-0004dI-M1; Thu, 25 Jan 2024 14:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671568.1044974; Thu, 25 Jan 2024 14:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0l5-0004bN-J8; Thu, 25 Jan 2024 14:31:11 +0000
Received: by outflank-mailman (input) for mailman id 671568;
 Thu, 25 Jan 2024 14:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0l4-0004bH-5u
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:31:10 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6095bccb-bb8e-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 15:31:07 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cf205dc075so22545141fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:31:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056638134f00b0046b6f096e3bsm4200408jad.134.2024.01.25.06.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:31:06 -0800 (PST)
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
X-Inumbo-ID: 6095bccb-bb8e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706193067; x=1706797867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvXwS8XGm0gZ26k92bMdl1h5JsxkeaxXRpPPMNYEY1g=;
        b=YriuM1NbsYYqfo2emOuPoV3LjdOtKJATeKrsO8QHxLx/oMo8HKUSbvjVi6i3GItLiS
         KgJJQrG4SVIZ2NB5pr2T74KwCwk1WlanBeXCAOxqceAlbloktjhXjd4dc8BszZNBuULF
         wI0QPHWGmUpVWwQm1748aVn9a9K0AGfUU4htc2rDmNw0OYXcsU6HmggAW0j36jfvSvCQ
         qLlNxLesmCiUxfdbWaPKz3vLhaML8LMZtG6FBC3oW2FiKPTPNWe1oGM80p8pPUIWQuJR
         Hk2piXuPKRiVUH/USVnawrmRYJ2QNftJdT+JAxrxeP7mzxi9iBs/IaU8bQyycbP5vKfm
         hPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193067; x=1706797867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvXwS8XGm0gZ26k92bMdl1h5JsxkeaxXRpPPMNYEY1g=;
        b=uQCqqHX+XYWXlXI9s7S06QoCjyKENnjamlh/kS/EzDn0BGwIaXcTkjcSzb8pAdM/4Y
         9Sf9ZNwlG8ujF87+ZygnOfaGBGIs3w0oyhZWMCx2syzNgRAvRSNdKDl3f8T5KApR0W41
         v8HkOJ1586WLS3CMFoH6UmJxgwBZ6WEp/qTeyz06YMi7dYtwxX+AbkaJ7rGEZQx7T+xp
         rZRD8LTFxj9bWt3fBF59vYR5sawqK8m+Rt83IkukffQEhPAEeRdmMTnAYq823uCim6Do
         sH5KxCAHk/tRzLB6333sEyd/WA+2CiNRP3X8UGLw4wi7buHIEmf6pqcBDrFx7QIB3Ybn
         07/Q==
X-Gm-Message-State: AOJu0YwAALQ3IDpCtiVVwnWaHjsawQnQBucmQwYBRIPGFbmpY4/CWX4g
	Qay47NfD5Ih5bMSAjVAa8Bf64jpvJiN152scho/r+mq8TfEoEN204k56z18rQQ==
X-Google-Smtp-Source: AGHT+IGVU5sjw8LciQwdI4EXIt1uc2D+ECWTuEtNxLQDhsGnReNkom0aebe+kjdyY3G0icQ1rOAcLw==
X-Received: by 2002:a2e:b1c1:0:b0:2cd:fc1c:a1dd with SMTP id e1-20020a2eb1c1000000b002cdfc1ca1ddmr601535lja.11.1706193067121;
        Thu, 25 Jan 2024 06:31:07 -0800 (PST)
Message-ID: <a9d6efce-8185-4dc8-b1d3-097ec49e3b28@suse.com>
Date: Thu, 25 Jan 2024 15:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xenpm: Print message for disabled commands
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240124205922.67266-1-jandryuk@gmail.com>
 <20240124205922.67266-3-jandryuk@gmail.com>
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
In-Reply-To: <20240124205922.67266-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 21:59, Jason Andryuk wrote:
> xenpm get-cpufreq-states currently just prints no output when cpufreq is
> disabled or HWP is running.  Have it print an appropriate message.  The
> cpufreq disabled one mirros the cpuidle disabled one.
> 
> cpufreq disabled:
> $ xenpm get-cpufreq-states
> Either Xen cpufreq is disabled or no valid information is registered!
> 
> Under HWP:
> $ xenpm get-cpufreq-states
> P-State information not supported.  Try get-cpufreq-average or start.
> 
> Also allow xenpm to handle EOPNOTSUPP from the pmstat hypercalls.
> EOPNOTSUPP is returned when HWP is active in some cases and allows the
> differentiation from cpufreq being disabled.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Largely okay, but a number of cosmetic remarks / nits:

> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -362,7 +362,15 @@ static int show_pxstat_by_cpuid(xc_interface *xc_handle, int cpuid)
>  
>      ret = get_pxstat_by_cpuid(xc_handle, cpuid, &pxstatinfo);
>      if ( ret )
> +    {
> +        if ( ret == -ENODEV )
> +            fprintf(stderr,
> +                    "Either Xen cpufreq is disabled or no valid information is registered!\n");
> +       else if ( ret == -EOPNOTSUPP )

One too few blanks for indentation.

> +            fprintf(stderr,
> +                    "P-State information not supported.  Try get-cpufreq-average or start.\n");

Especially the "or start" part reads odd without any quotation.

> @@ -382,9 +390,11 @@ void pxstat_func(int argc, char *argv[])
>      {
>          /* show pxstates on all cpus */
>          int i;
> -        for ( i = 0; i < max_cpu_nr; i++ )
> -            if ( show_pxstat_by_cpuid(xc_handle, i) == -ENODEV )
> +        for ( i = 0; i < max_cpu_nr; i++ ) {

This file tries to follow hypervisor style, so the brace ought to
go on its own line. While there may I ask that you also add the
missing blank line (separating declaration from statements)? This
then also applies ...

> +            int ret = show_pxstat_by_cpuid(xc_handle, i);
> +            if ( ret == -ENODEV || ret == -EOPNOTSUPP )

... between these two new lines.

>                  break;
> +	}

Hard tab?

> @@ -473,7 +483,8 @@ static void signal_int_handler(int signo)
>                  }
>      }
>  
> -    if ( get_pxstat_by_cpuid(xc_handle, 0, NULL) != -ENODEV )
> +    ret = get_pxstat_by_cpuid(xc_handle, 0, NULL);
> +    if ( ret != -ENODEV && ret != -EOPNOTSUPP )

While looking odd, I can see why it wants to be this way.

Jan

