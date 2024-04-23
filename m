Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A08ADF4F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710369.1109541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzB8T-0007Rc-GJ; Tue, 23 Apr 2024 08:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710369.1109541; Tue, 23 Apr 2024 08:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzB8T-0007PD-DC; Tue, 23 Apr 2024 08:04:17 +0000
Received: by outflank-mailman (input) for mailman id 710369;
 Tue, 23 Apr 2024 08:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzB8S-0007P7-M6
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:04:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 133ce626-0148-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 10:04:14 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41a7820620dso11574325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 01:04:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b00418244d459esm19365023wmo.4.2024.04.23.01.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 01:04:13 -0700 (PDT)
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
X-Inumbo-ID: 133ce626-0148-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713859454; x=1714464254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6R7W9vICzR1GrVkYPLfWjAxFw2T8B7UNwPUNyuJglE=;
        b=R9iAnsnLf/EydypXJ28XzbMn1pJQfjHd+068tE8Gex4N1z2NiDUPJB+oI/XMAZAnq9
         UyoHrQolnBb8qicMSUE0YMBXadS6tkiHna5vgNDY0BEyrPVuJdUwmxl/TvzOA/GwPkm4
         0o73Qqd9KgBRLRT78SC/hbdaQY/sGCfz9njx8BMQPkGRYEztTI2IUd1JAGFe4i1wS4GP
         UfTKW3Xdcc49DztHQiNLLx+tMhU4wG99JWB/Due05jTLoMK2s0SX4U4F4bX57s5WAiTp
         7wd3f5wqxAbcuNPPxYx+XNvYXLyr2Q9Bg7hc4w9Xq6zfGhCKZJfjdr3c7X1fc7hQl/Pa
         6Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713859454; x=1714464254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6R7W9vICzR1GrVkYPLfWjAxFw2T8B7UNwPUNyuJglE=;
        b=orN2Fx1bJvpziSglFufimglv/7okrCpAnOVUanRqF3iWNL8aLK8KZmFwPX9YClz83v
         yFkHf7l1VO1Rq9S2aw/p5aXXtlHvYE9TXW/2shngSLxJjU8xSvx1avwK1o2jFt0y1Qv0
         4agJR0/YC7ChawH3doB4C5O4i8tEDamoBIaMQJ/4lWPANxIIhbc7TR5/FdY9r6XX/T8F
         KigxXVj947M/MhHkr+8eIXYpK9HjknKwAjTjo7wt0AIf8vo8s1JAqPIaw2kcEwJXD0XO
         xCGdgfLadhyKpnZZ3eBK0puQpecVgFLmKI8Q7GTg7N/u69BRrJlwVjC9N5fRIdYVghM0
         uMBw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGznz8nW0MSckJuXq6Ls/ml0pkFK4LX0Ac4KFmlCmmBJ4JfR5CZeTTLtlzLz8dzIUwiDQ9haH7hYLHTnMM/tG7nTLYhY3AffPwMFM1jw=
X-Gm-Message-State: AOJu0YzsnyKdLdSMpHMqsCSkhnBHfyqEGBzrOIGPdUVk7IZKDVO7Snw2
	kwtKciKuOQcMPWQGZ3RVv8t2M/ABbHkD0PAgGSgt8znWJnwnSTr1VZ4EacFzbg==
X-Google-Smtp-Source: AGHT+IFqQ1jFrk/uHf9B5fTK0aK77QhxsZhSIqmrA6LE2PPPQUrJVUo7in6Rn7oFKacFOq2RxNwJpg==
X-Received: by 2002:a05:600c:35c7:b0:418:5e80:a6fa with SMTP id r7-20020a05600c35c700b004185e80a6famr10092557wmq.14.1713859453919;
        Tue, 23 Apr 2024 01:04:13 -0700 (PDT)
Message-ID: <25ed8b89-ea7f-4a2f-ae14-a364da0c6237@suse.com>
Date: Tue, 23 Apr 2024 10:04:12 +0200
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
 <9b94935f-b84c-4ede-ac17-4e1c6d032b74@suse.com>
 <CAG7k0EqNJsdoZkTPkSZAm1rwCBZMrd5qHSYkRi6y48tu==B_GA@mail.gmail.com>
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
In-Reply-To: <CAG7k0EqNJsdoZkTPkSZAm1rwCBZMrd5qHSYkRi6y48tu==B_GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 18:38, Ross Lagerwall wrote:
> On Thu, Apr 18, 2024 at 2:24 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.04.2024 18:26, Ross Lagerwall wrote:
>>> --- a/xen/arch/x86/hvm/rtc.c
>>> +++ b/xen/arch/x86/hvm/rtc.c
>>> @@ -202,6 +202,7 @@ static void check_update_timer(RTCState *s)
>>>          }
>>>          else
>>>          {
>>> +            s->hw.cmos_data[RTC_REG_A] &= ~RTC_UIP;
>>>              next_update_time = (USEC_PER_SEC - guest_usec - 244) * NS_PER_USEC;
>>>              expire_time = NOW() + next_update_time;
>>>              s->next_update_time = expire_time;
>>
>> Is rtc_update_timer2() clearing UIP then still necessary, ahead of calling
>> here? Hmm, yes, it is; the question is rather why the function calls
>> check_update_timer() when all that'll do (due to UF now being set) is stop
>> the other timer (in case it's also running) and clear ->use_timer.
> 
> Are you suggesting something like this?
> 
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 4bb1c7505534..eb4901bf129a 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -240,7 +240,8 @@ static void cf_check rtc_update_timer2(void *opaque)
>          s->hw.cmos_data[RTC_REG_C] |= RTC_UF;
>          s->hw.cmos_data[RTC_REG_A] &= ~RTC_UIP;
>          rtc_update_irq(s);
> -        check_update_timer(s);
> +        stop_timer(&s->update_timer);
> +        s->use_timer = 0;
>      }
>      spin_unlock(&s->lock);
>  }
> 
> That may indeed be an improvement but I'm not sure it is really related
> to this patch?

Well, the connection is the initial question of this part of my earlier
reply. That's not to say the further change needs (or even wants) doing
right here. However, upon looking again I get the impression that I was
mixing up timer and timer2. The code path you alter is one where timer
is set, not timer2.

Overall:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

