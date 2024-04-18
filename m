Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09878A9B32
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708370.1107239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRl2-0006vI-Ko; Thu, 18 Apr 2024 13:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708370.1107239; Thu, 18 Apr 2024 13:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRl2-0006sK-IF; Thu, 18 Apr 2024 13:24:56 +0000
Received: by outflank-mailman (input) for mailman id 708370;
 Thu, 18 Apr 2024 13:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxRl0-0006mS-I0
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:24:54 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09bfb86d-fd87-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:24:52 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so10613421fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 06:24:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o28-20020a05600c511c00b0041898fc168bsm6505145wms.36.2024.04.18.06.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 06:24:51 -0700 (PDT)
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
X-Inumbo-ID: 09bfb86d-fd87-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713446691; x=1714051491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2uk6Zn/0XFrvhpMxLaOkbeffdLU3ofoA9Ddr+FMBzc=;
        b=L6TGU6VXcZZKbpBAqAK3kLjHU9mLtfncYcUhQUiyQnC77gWLbuSORh/MewA9cktxY8
         S5+hD1PuwZwHyn3vxVQU8iWMj+K87al8NEu+mKlnpIT/yiiUc4FlEUDFf8MnSMUbh9vB
         sKA+X8WjVnwyt682iHLpU1YRXCUzJVq2c3wyiNFpV+VOUd+VZp1QPtYjgO5Cn+NJgyF3
         1Ymm3ix+zDomv9arPMuEjRvcyyMCv3Y1ZsOeORv2sJB4p/OYoyOgSJ6mgOqTvTzQEyYT
         XgdkwrxrUTVtDx7aCiBBaAhKhw/Q3sIqdA/yfDJ3GPF9lu78mOOg7ph65kZCUGjyvM6n
         RddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446691; x=1714051491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2uk6Zn/0XFrvhpMxLaOkbeffdLU3ofoA9Ddr+FMBzc=;
        b=j2YoRcOW6IdyXWthKG3c/z1KxdO36f8T5OHzVR9PLjaXfuNpVY/JcQDoPF1Hyn77Pj
         FzTrVctpFDXu9b5gnmqjNQBh4a0dPA5XtC44B1dEOG5L0ZP0/8v/acIvgDxVICKi2yMp
         Gu7yxGXPFsbT6r6C4SJ421lH5gonyOq3/bak5LfNPXORluT2B7L3bAW+DbBvm4T233cO
         cUUyJU+0MtnIVQxmFoCmSCop0URLdS2UFi9r7AvMXlqmZkG+MUWNS2Bmf8sDTaxGJdho
         hon7dxbS//9ER1AtLU6x23nzrAy4fhB2eZxsLHiUvAGpnc+XdDiXfuw4SvJkGeHI0ath
         Of5w==
X-Forwarded-Encrypted: i=1; AJvYcCXHS9wOsXW88q00BXLfRRUwV8w2QQJzyzY18nyJg0MvmYlKPgemDAHdf/9Wb3GqE4gmxmsGsWi4uY+xDJbydxERf1+RifaoZy2EWh4F3t4=
X-Gm-Message-State: AOJu0YyrAp/JGGBhuyHl32VtAMIXjAsfBm4Ea/Z++Khf1KHUVQFG9At+
	sw8rLUe9wdGKpJWjiDBan2nBbl92t2kMv3DJHvTCgHd8xH0t+ouGgW9loyljXw==
X-Google-Smtp-Source: AGHT+IG/D9uN3SDUqODTnTZ7+kiEx+RzOT+uBhOpXhoeaKmtLHpF/zTWTAZd6NezA1PoyO2+W5gz2A==
X-Received: by 2002:a2e:9185:0:b0:2da:4b38:4a28 with SMTP id f5-20020a2e9185000000b002da4b384a28mr1544793ljg.51.1713446691439;
        Thu, 18 Apr 2024 06:24:51 -0700 (PDT)
Message-ID: <9b94935f-b84c-4ede-ac17-4e1c6d032b74@suse.com>
Date: Thu, 18 Apr 2024 15:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/rtc: Avoid UIP flag being set for longer than
 expected
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240408162620.1633551-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20240408162620.1633551-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2024 18:26, Ross Lagerwall wrote:
> In a test, OVMF reported an error initializing the RTC without
> indicating the precise nature of the error. The only plausible
> explanation I can find is as follows:
> 
> As part of the initialization, OVMF reads register C and then reads
> register A repatedly until the UIP flag is not set. If this takes longer
> than 100 ms, OVMF fails and reports an error. This may happen with the
> following sequence of events:
> 
> At guest time=0s, rtc_init() calls check_update_timer() which schedules
> update_timer for t=(1 - 244us).
> 
> At t=1s, the update_timer function happens to have been called >= 244us
> late.

Any theory on why this timer runs so late? (It needs dealing with anyway,
but I'm still curious.)

> In the timer callback, it sets the UIP flag and schedules
> update_timer2 for t=1s.
> 
> Before update_timer2 runs, the guest reads register C which calls
> check_update_timer(). check_update_timer() stops the scheduled
> update_timer2 and since the guest time is now outside of the update
> cycle, it schedules update_timer for t=(2 - 244us).
> 
> The UIP flag will therefore be set for a whole second from t=1 to t=2
> while the guest repeatedly reads register A waiting for the UIP flag to
> clear. Fix it by clearing the UIP flag when scheduling update_timer.

I can accept this as a workaround (perhaps with a tweak, see below), but
I wonder whether we couldn't do this in a less ad hoc way. If stop_timer()
returned whether the timer was actually stopped, couldn't the clearing of
UIP be made conditional upon that?

> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -202,6 +202,7 @@ static void check_update_timer(RTCState *s)
>          }
>          else
>          {
> +            s->hw.cmos_data[RTC_REG_A] &= ~RTC_UIP;
>              next_update_time = (USEC_PER_SEC - guest_usec - 244) * NS_PER_USEC;
>              expire_time = NOW() + next_update_time;
>              s->next_update_time = expire_time;

Is rtc_update_timer2() clearing UIP then still necessary, ahead of calling
here? Hmm, yes, it is; the question is rather why the function calls
check_update_timer() when all that'll do (due to UF now being set) is stop
the other timer (in case it's also running) and clear ->use_timer.

Jan

