Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE8496A187
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789343.1198940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slV35-0006fB-FV; Tue, 03 Sep 2024 15:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789343.1198940; Tue, 03 Sep 2024 15:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slV35-0006cF-Bn; Tue, 03 Sep 2024 15:02:27 +0000
Received: by outflank-mailman (input) for mailman id 789343;
 Tue, 03 Sep 2024 15:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slV34-0006c7-06
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:02:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a86861-6a05-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 17:02:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c26b5f1ea6so1186023a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:02:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891da22bsm691252066b.182.2024.09.03.08.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:02:22 -0700 (PDT)
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
X-Inumbo-ID: 86a86861-6a05-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725375743; x=1725980543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YbhhFd70QPVCp45xzzY5AkP9J+WqvxMXYokMUEk1h04=;
        b=LPNqbvDp+0BYa1e5OuB2Yp0jqvBomL7xiU484MULjgR6Pir2gqQA6lvLKClq1Fs7xD
         U4LSWHFt5tZsUwM+vAKg7IKAaA+WR7/2GgeAwnXoc9O3qYsapHznk1t88cKFFtOiCKUd
         sQkDkDLRGtHjijZb65BcVdiMUIOKHlL2WwwfEdagNF7MiyfS5WlLW2D41YAqtHzDH80W
         XelhDbW4+Fts7gv0fC1FixUazSR/HenKLXv7DOHO9q7WyuXMQVYQunMta3OjHZxosPPD
         q/dDhB6iIfUJerNTQJcAfpk53CZnUlf+FKdJc4bJxeGE8K9RLcP84KTvG80KuSO3w09X
         vcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375743; x=1725980543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbhhFd70QPVCp45xzzY5AkP9J+WqvxMXYokMUEk1h04=;
        b=qwcivlbXoaza7GEVYivntWmUTghVjx+8Bn8WwXTWm8EARCgWqgwXnmYw+3aN+6x2on
         aqETSrdd8F+t9E6uXnmIRS55wQ0RRjoXLMNHReFLPBouOpaW4MWhEKG/27IkmcBcnkKH
         YiiKZYr2KC5UMC53BTTVV3rb4amn1NEMizxmEuSN+tnGw1kbb4SzYlHleu06wQDfOJ8m
         yE4qS+0Esz3FuikphC5RrdIXoZfNf8Dgj4nd19uvCwPEsBKVWE0rSps67ke91meFpMC0
         LaZGzXT+0YRf2rXQKnSnNOTyYPGrIZZdvQiOQI+7tV28rPRDiCgh0LVP/vKyXi4gEtQl
         VO3A==
X-Forwarded-Encrypted: i=1; AJvYcCVwguNI+hiJIr0TrfYs6DJsXSDis5JoiE7IaR1W+9yrylYwodglh5OC6GnYCea5HmVdosvChi2fv1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpWv3o5KJmfb1Ppg7fkAeqpstf6IJq7mQsTH+GJg6u1AaxI+8y
	5QTva/HjP1IMHRbxfdpJEk2NBH+6ij5pYIu+W+n6T7t0moFksiHvy13Lto800A==
X-Google-Smtp-Source: AGHT+IEbEhdhhfcAlOkzl+2w1rhMhTLP6fvkT1JnMneAr77mv3fMyhWBT4fTsGiMEDx30W0beiy08w==
X-Received: by 2002:a17:907:3e09:b0:a7a:b620:aa2f with SMTP id a640c23a62f3a-a89fadb7a4cmr626796466b.15.1725375742643;
        Tue, 03 Sep 2024 08:02:22 -0700 (PDT)
Message-ID: <5695338e-3543-4611-a6a4-0b42e0727e1d@suse.com>
Date: Tue, 3 Sep 2024 17:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] x86/time: move CMOS edge detection into read
 helper
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-3-roger.pau@citrix.com>
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
In-Reply-To: <20240903130303.71334-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 15:02, Roger Pau Monne wrote:
> Move the logic that ensures the CMOS RTC data is read just after it's been
> updated into the __get_cmos_time() function that does the register reads.  This
> requires returning a boolean from __get_cmos_time() to signal whether the read
> has been successfully performed after an update.

Considering the limited use of both function, that's probably fine a change
to make, despite me otherwise thinking that this is the slightly wrong move.
I'd generally expect __get_cmos_time() to be usable without that checking,
so long as the results are interpreted appropriately.

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1247,8 +1247,26 @@ struct rtc_time {
>      unsigned int year, mon, day, hour, min, sec;
>  };
>  
> -static void __get_cmos_time(struct rtc_time *rtc)
> +static bool __get_cmos_time(struct rtc_time *rtc)
>  {
> +    s_time_t start, t1, t2;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&rtc_lock, flags);
> +
> +    /* read RTC exactly on falling edge of update flag */
> +    start = NOW();
> +    do { /* may take up to 1 second... */
> +        t1 = NOW() - start;
> +    } while ( !(CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> +              t1 <= SECONDS(1) );
> +
> +    start = NOW();
> +    do { /* must try at least 2.228 ms */
> +        t2 = NOW() - start;
> +    } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> +              t2 < MILLISECS(3) );
> +
>      rtc->sec  = CMOS_READ(RTC_SECONDS);
>      rtc->min  = CMOS_READ(RTC_MINUTES);
>      rtc->hour = CMOS_READ(RTC_HOURS);
> @@ -1268,11 +1286,15 @@ static void __get_cmos_time(struct rtc_time *rtc)
>  
>      if ( (rtc->year += 1900) < 1970 )
>          rtc->year += 100;
> +
> +    spin_unlock_irqrestore(&rtc_lock, flags);

Imo this unlock wants placing at least ahead of the if() in context. The
lock needs to protect only the port accesses, not any of the calculations.

Jan

