Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A796A1F1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789358.1198959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVGy-0001xM-VY; Tue, 03 Sep 2024 15:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789358.1198959; Tue, 03 Sep 2024 15:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVGy-0001vi-Sf; Tue, 03 Sep 2024 15:16:48 +0000
Received: by outflank-mailman (input) for mailman id 789358;
 Tue, 03 Sep 2024 15:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slVGx-0001tn-Nx
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:16:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88a2e214-6a07-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 17:16:46 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a86883231b4so651458366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:16:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989222588sm686929266b.200.2024.09.03.08.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:16:45 -0700 (PDT)
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
X-Inumbo-ID: 88a2e214-6a07-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725376606; x=1725981406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IOMU6dJcjVulfuG8ycLz7B4UXlvxXFk0oymciEyGaxA=;
        b=OEs8E/xD+XTw4gaP+cFd1OKkntlTpj7cV5cq6gH0dmlyyeLTfgZkHQEkki1OemstnA
         TTJlWUpMonaHTwjSR8CxYwwEOYd4Bxew+rrp3BoImH7us2U5auUp/IOfFH3HI1WflnvD
         t7iDEKGlk/w10Sajr04OHgpHdAp7fBj8vov6zcuOJ9Rpj1/s+wNf0wiReYchSNEPfCJ+
         15oljo+Z4huIgbcRU9vPw8nWJEWOeANiUmCAFkwpyzPqE2KlKKozdBYyEKYTeN7XOzjO
         dAYBuezh1m2ScHLmvdn1osYQtO00cRu9umgNjNYM9TdCDKYIlMZXFhcUNSfGDRk06CRu
         TxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376606; x=1725981406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOMU6dJcjVulfuG8ycLz7B4UXlvxXFk0oymciEyGaxA=;
        b=fJV7UlSPLlmFGhA8U4VNVJBk3LNbEG7RQN0WlF3fDEH3KK641UrZYmUF3lunbpog4R
         KtUhDkBAUmTVsXkH7iTTgd4E5QwDpssoH4/S07B2L0B6oyCIZX3j8+Pl5uCHrYAQ416m
         dEZTWbn6mYY+SAoGy16QPatuJl7K+6rrmPsc03l5pSQFZDYrj0iy13i8H8Gj4O90KsDI
         7ep0qkFjt2DSpX0Khu+jmXEkio/3Iq/AiqRSNjhFTfLSmgXE4ifcDetqSj3hErf1RotJ
         egmiS1F6OMM/mlNgH/U06tLRnEa7MzKtk20KGdMaviP1tXjX1mxCgxcDQnV/+V5g7rTY
         JJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnUGejzXRkWX4qFulQ6z54XCvdXdB5CtR2WXUDLgLOpS5nWE16+YK/6kYsOVftsxa9O+U+3bggCLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYdHJ9Up4v5Xi2tz+2UOJstfuLI9WPT9CMFys09A2Z5PbT/xfp
	yUq4sO2VQHskNOc5waxMdAbUPBCS6pQ+9CxRvFm92j++xtSQamvFRLTYmngG7g==
X-Google-Smtp-Source: AGHT+IFnPYxLHiZF4+yESEcgm4X/WqqMQ714GQhKWGxTKlfodY88zoB4fUQnIcT3qw356Q55FfBDOw==
X-Received: by 2002:a17:906:6a21:b0:a7a:9e11:e87c with SMTP id a640c23a62f3a-a89d8724415mr748404566b.9.1725376605552;
        Tue, 03 Sep 2024 08:16:45 -0700 (PDT)
Message-ID: <077fcf8f-3179-4615-b2d1-69fa9c4d7e56@suse.com>
Date: Tue, 3 Sep 2024 17:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86/time: split CMOS read and probe logic into
 function
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-4-roger.pau@citrix.com>
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
In-Reply-To: <20240903130303.71334-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2024 15:02, Roger Pau Monne wrote:
> The current logic to probe for the CMOS RTC is open-coded in get_cmos_time(),
> move it to a separate function that both serves the purpose of testing for the
> CMOS RTC existence and returning its value.
> 
> The goal is to be able to split the probing and the reading logic into separate
> helpers, and putting the current logic in a separate function helps simplifying
> further changes.
> 
> A transient *rtc_p variable is introduced as a parameter to the function, that
> will be removed by further changes.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This looks like a straight transformation, except - as noted before - for ...

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1292,45 +1292,32 @@ static bool __get_cmos_time(struct rtc_time *rtc)
>      return t1 <= SECONDS(1) && t2 < MILLISECS(3);
>  }
>  
> -static unsigned long get_cmos_time(void)
> +static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
>  {
> -    unsigned long res;
> -    struct rtc_time rtc;
>      unsigned int seconds = 60;
> -    static bool __read_mostly cmos_rtc_probe;
> -    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> -
> -    if ( efi_enabled(EFI_RS) )
> -    {
> -        res = efi_get_time();
> -        if ( res )
> -            return res;
> -    }
> -
> -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> -        cmos_rtc_probe = false;
> -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> -        panic("System with no CMOS RTC advertised must be booted from EFI"
> -              " (or with command line option \"cmos-rtc-probe\")\n");
>  
>      for ( ; ; )
>      {
> -        bool success = __get_cmos_time(&rtc);
> +        bool success = __get_cmos_time(rtc_p);
> +        struct rtc_time rtc = *rtc_p;
>  
> -        if ( likely(!cmos_rtc_probe) || !success ||
> +        if ( likely(!cmos_rtc_probe) )
> +            return true;
> +
> +        if ( !success ||
>               rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
>               !rtc.day || rtc.day > 31 ||
>               !rtc.mon || rtc.mon > 12 )
> -            break;
> +            return false;
>  
>          if ( seconds < 60 )
>          {
>              if ( rtc.sec != seconds )
>              {
> -                cmos_rtc_probe = false;

... the removal of this line. As asked for before, can the somewhat sub-optimal
new behavior (with the static, which now lives in another function, being
cleared only the next time round) please be at least mentioned in the
description?

>                  acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> +                return true;
>              }
> -            break;
> +            return false;
>          }
>  
>          process_pending_softirqs();
> @@ -1338,7 +1325,31 @@ static unsigned long get_cmos_time(void)
>          seconds = rtc.sec;
>      }
>  
> -    if ( unlikely(cmos_rtc_probe) )
> +    ASSERT_UNREACHABLE();
> +    return false;
> +}
> +
> +static unsigned long get_cmos_time(void)
> +{
> +    unsigned long res;
> +    struct rtc_time rtc;
> +    static bool __read_mostly cmos_rtc_probe;
> +    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> +
> +    if ( efi_enabled(EFI_RS) )
> +    {
> +        res = efi_get_time();
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
> +    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
>          panic("No CMOS RTC found - system must be booted from EFI\n");
>  
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);

Having seen the series up to here (and already by the previous patch) I think
I see now where we disagree about the conditional-ness of the probing: I
suppose you deem only the 2nd and possible subsequent iterations of the loop
in (now) cmos_probe() as "probing", whereas I consider all of what that
function now contains as exactly that.

The difference is becoming more pronounced with the subsequent change of
preferring CMOS over EFI time: With EFI (with or without ACPI) there never
was a guarantee that a CMOS clock would exist. Prior to the introduction of
the ACPI_FADT_NO_CMOS_RTC flag the was a de-facto guarantee that PC-like
systems would have one. And vendors abusing the flag made us probe, despite
the port accesses being problematic until we know there actually is a CMOS
(RTC) there. Hence why I was suggesting that there be a way to bypass the
CMOS accesses altogether at least when booted from EFI (as is the case
right now, just without the need for any user override).

Jan

