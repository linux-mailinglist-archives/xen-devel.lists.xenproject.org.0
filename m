Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B396939B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788616.1198036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMxi-0001o0-Cg; Tue, 03 Sep 2024 06:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788616.1198036; Tue, 03 Sep 2024 06:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMxi-0001lm-9n; Tue, 03 Sep 2024 06:24:22 +0000
Received: by outflank-mailman (input) for mailman id 788616;
 Tue, 03 Sep 2024 06:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slMxh-0001lg-0C
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 06:24:21 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 272f1313-69bd-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 08:24:20 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso784375066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 23:24:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922276asm641683366b.204.2024.09.02.23.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 23:24:19 -0700 (PDT)
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
X-Inumbo-ID: 272f1313-69bd-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725344659; x=1725949459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F7VSiCgaWeik6zuVVdpdnzYhh8M7jpBZFD4gtxa9WF4=;
        b=InyPLI1xt3GyCbiiGvlrQ1DFnx4jcbQC+/6nzbIdYe5ODit2lGoCuz7aMClUH4tJ/S
         fVnYCj+zy3hxJ+tiOxLUeWP44eO7ex/yQP6wcyl74fw3NFH2RscTH4BetCWPa6QFlZd4
         /lbLDzsCYpTIJ8YfuTzFLTtPzGBuWuEK+5NU78dWjw91PHlJdyiaybpyJLzU51n06ru9
         7S0oqEzNWSFL7UiGnjvMNiGMYJrO5y7I4f8mc10QS8/R1lVRSk5uely5VFwdGVfU8L+y
         2CuduzZdrwy8QOV7Fp3h9U4TfDCnKM10C5+fYFYKXHVmXeduYH5tI8K7ZpMsb7/w9/LQ
         2G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725344659; x=1725949459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7VSiCgaWeik6zuVVdpdnzYhh8M7jpBZFD4gtxa9WF4=;
        b=GNcrUCwSfmyu+w+AiY89HhUVfVfOellS2VrlpyiD+ZS+tCcApDhppegv3+5wgolAUe
         YKi0VpmGgf4Rcdn2YlTqzlBwJoTq6+GvFuUNwQwsrRwqBULTXm8rT6HX4F+xXG09Dizq
         SOivHahqZ2BZ7Pmy7dP3HnfFdZxY7o84GqOB0IqFWBpqdvixHABfe5vIRLeHm4hGb+/e
         fAlbQAmQG4V7qsi/msjGEJ9isN5wocDyPT2E3pJBstttCPhQVovk1XKgA8CvTeE6mi3j
         +hmN5MiKiw+WgztDCM4amU+3UrVJ7/sH2dVcR6NYtnynh5bS8B0dCacGb1WEvZS4jZqb
         fzkA==
X-Forwarded-Encrypted: i=1; AJvYcCW92NXbibfzGf+EMWn27NusjXoueZfQQodefrBLCFpSN5ytmkTqzS8x2MO0Ad60G1NipxMhTFUSPaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBzBykGcbPoFRcyiGCDMZlPgqoTpSe6g5BG9Pl4OPJRBXtEl6o
	9UISNBEcP096x4N0JUNVMRnruSuYYy9BaZpz/Y4f9Za0yTmnEZHFr4sSN+BPKg==
X-Google-Smtp-Source: AGHT+IHVDxYClmgGFx1jE4MZs9+COjLBjG3LgBitzzYBzwzs2e7v6f1Qbh49VzJY+eFMo3UlpzQ6Iw==
X-Received: by 2002:a17:907:968e:b0:a86:8ef6:dc3d with SMTP id a640c23a62f3a-a89823c9d42mr1520668466b.8.1725344659391;
        Mon, 02 Sep 2024 23:24:19 -0700 (PDT)
Message-ID: <f193e088-18fb-4e68-a935-720cc65f3947@suse.com>
Date: Tue, 3 Sep 2024 08:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/time: split CMOS time fetching into wrapper
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-2-roger.pau@citrix.com>
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
In-Reply-To: <20240830095220.49473-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 11:52, Roger Pau Monne wrote:
> @@ -1285,33 +1270,56 @@ static unsigned long get_cmos_time(void)
>          } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
>                    t2 < MILLISECS(3) );
>  
> -        __get_cmos_time(&rtc);
> +        __get_cmos_time(rtc);
>  
>          spin_unlock_irqrestore(&rtc_lock, flags);
>  
> -        if ( likely(!cmos_rtc_probe) ||
> -             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> -             rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
> -             !rtc.day || rtc.day > 31 ||
> -             !rtc.mon || rtc.mon > 12 )
> -            break;
> +        if ( likely(!cmos_rtc_probe) )
> +            return true;
> +
> +        if ( t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> +             rtc->sec >= 60 || rtc->min >= 60 || rtc->hour >= 24 ||
> +             !rtc->day || rtc->day > 31 ||
> +             !rtc->mon || rtc->mon > 12 )
> +            return false;
>  
>          if ( seconds < 60 )
>          {
> -            if ( rtc.sec != seconds )
> -            {
> -                cmos_rtc_probe = false;

This clearing of the variable is lost, which looks wrong to me.

Jan

> +            if ( rtc->sec != seconds )
>                  acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> -            }
> -            break;
> +            return true;
>          }
>  
>          process_pending_softirqs();
>  
> -        seconds = rtc.sec;
> +        seconds = rtc->sec;
>      }
>  
> -    if ( unlikely(cmos_rtc_probe) )
> +    ASSERT_UNREACHABLE();
> +    return false;
> +}
> +
> +static unsigned long get_cmos_time(void)
> +{
> +    struct rtc_time rtc;
> +    static bool __read_mostly cmos_rtc_probe;
> +    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> +
> +    if ( efi_enabled(EFI_RS) )
> +    {
> +        unsigned long res = efi_get_time();
> +
> +        if ( res )
> +            return res;
> +    }
> +
> +    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> +        cmos_rtc_probe = false;
> +    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> +        panic("System with no CMOS RTC advertised must be booted from EFI"
> +              " (or with command line option \"cmos-rtc-probe\")\n");
> +
> +    if ( unlikely(!read_cmos_time(&rtc, cmos_rtc_probe)) )
>          panic("No CMOS RTC found - system must be booted from EFI\n");
>  
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);


