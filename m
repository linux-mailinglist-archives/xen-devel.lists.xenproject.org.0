Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6478988197
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806180.1217525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Wv-0005W3-6Q; Fri, 27 Sep 2024 09:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806180.1217525; Fri, 27 Sep 2024 09:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Wv-0005Td-2l; Fri, 27 Sep 2024 09:44:53 +0000
Received: by outflank-mailman (input) for mailman id 806180;
 Fri, 27 Sep 2024 09:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su7Wt-0005TT-N9
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:44:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 236d0e2b-7cb5-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:44:49 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso232662766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:44:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777baasm110598866b.25.2024.09.27.02.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 02:44:49 -0700 (PDT)
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
X-Inumbo-ID: 236d0e2b-7cb5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727430289; x=1728035089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mfxkqc4cnCjZrv9fJs1e9eAIBfCw+sqZF5jFObp88p0=;
        b=ar9PUM3aaAYxwZ8bI3QHH+pCmzIDSd7BVOwN/cl2xcqgUIFqdl8BLYxzCcUP9lj4AX
         VgWuNy6GGBJDJ8cqPBUpwP0UUSAx+sOpe4mgpcpJaQFPY+DsdHysSKGnRHkDiYGdN2Xh
         G7G1+VUjWSa1GWOd0LyI7fHSSaODvPesaVphDHOyxb0sDX8/JSPdXuB/StccJW+TuOaS
         qe5qv3mdETY87XnWK9XfHkOgLiztZtWs4St6VAlfcSzuTcVyh61IABiaAWCVcG8BQvle
         Lc9cL6mtve0lgzkGVzEJZ1KWvAvxjsN/MHzESIgd2ABMo000QMVOOjAM4kKxrr+z1idf
         p3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430289; x=1728035089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfxkqc4cnCjZrv9fJs1e9eAIBfCw+sqZF5jFObp88p0=;
        b=HWjm5AKoLgxvnw+t/ei20H5zQhwFCXnaTNuVpVxELIvGY51+PyVQE9LwyLxZTcPGoe
         KfsAHV4ysSysgYIBQXnbVgiEHGfVIFWC85qe4fTn4VVZmbg5bXZwgTBJ7LQ7tiQtOh6V
         SuIB1W4Udr0JvUCJ2IH2Q8Qcu8ZgRWCZEL+j/LBjX1jiaqf092Y3I8XP8hib6kJb7b8w
         uO3aqFUmTsBGWc3lK3EZAGcbZUrsR4iRIXcakgH8k9IZbFkXfi/an30Bum8HWOIhTOYE
         4yt6z2gEp70lxR0kykJRKgmmwHwU8v+TG+384PYpWT5w/zUoTfsrP7istYSt1v88l/5F
         PWCA==
X-Forwarded-Encrypted: i=1; AJvYcCX4amjUpkYS9vhjB7ytj7aRZXxWhuxQtVkKInKLHaqRsQimrpcXXmaW6yZPEwBnJSrs6n+wBerFczc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLYHFwgBLXItsgSlHIeIRdRnfG+a1mEAQLnCXK18TftbuMewAE
	kUNKaVq91Ke5B9ff5hrtcsu8m5iXBwJ8IAN1YJg9w2S7Y4iZsTZ4CgZVJnBUkg==
X-Google-Smtp-Source: AGHT+IHcfNbKVWfnXqzxWl1zsUmSeaul7W+36kMVANYo45f4ng8PAU8EAfz4S1jNlXWA9S//GvgirQ==
X-Received: by 2002:a17:907:9307:b0:a8a:7bed:d327 with SMTP id a640c23a62f3a-a93c4946ce0mr191301866b.36.1727430289200;
        Fri, 27 Sep 2024 02:44:49 -0700 (PDT)
Message-ID: <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
Date: Fri, 27 Sep 2024 11:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
 <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
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
In-Reply-To: <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 11:42, Sergiy Kibrik wrote:
> 23.09.24 13:01, Jan Beulich:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -758,6 +758,9 @@ static bool emulation_flags_ok(const struct domain
>>> *d, uint32_t emflags)
>>>                 (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
>>>                 emflags != X86_EMU_LAPIC )
>>>                return false;
>>> +        if ( !is_hardware_domain(d) &&
>>> +             (emflags & X86_EMU_PM) && !IS_ENABLED(CONFIG_X86_PMTIMER))
>>> +            return false;
>>>        }
>>>        else if ( emflags != 0 && emflags != X86_EMU_PIT )
>>>        {
>> Why the is_hardware_domain() part of the check?
> 
> the idea was that since hardware domain has full hardware access it 
> probably doesn't need emulated timer. But this check will be dropped 
> anyway, as Roger suggested.
> 
>>
>>> (probably with X86_PMTIMER option depending on PV)
>> HVM you mean?
>>
> 
> I wanted to do it like this:
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -386,7 +386,7 @@ config ALTP2M
>            If unsure, stay with defaults.
> 
>   config X86_PMTIMER
> -       bool "ACPI PM timer emulation support" if EXPERT
> +       bool "ACPI PM timer emulation support" if EXPERT && PV
>          default y
>          depends on HVM
>          help
> 
> to allow it to be disabled when PV is on and prevent situation when pvh 
> domain can't be created because !PV and hvm domain can't be created 
> either without emulated timer.

How does PV matter for this "depends on HVM" setting?

Jan

