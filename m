Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBE881536
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696028.1086543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmySh-0007NK-Te; Wed, 20 Mar 2024 16:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696028.1086543; Wed, 20 Mar 2024 16:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmySh-0007Kr-Qh; Wed, 20 Mar 2024 16:06:43 +0000
Received: by outflank-mailman (input) for mailman id 696028;
 Wed, 20 Mar 2024 16:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmySg-0007Kf-Qk
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:06:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d68f4705-e6d3-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 17:06:41 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56890b533aaso7920428a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:06:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i25-20020a05640200d900b00568803d97d1sm7114018edu.9.2024.03.20.09.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 09:06:40 -0700 (PDT)
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
X-Inumbo-ID: d68f4705-e6d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710950800; x=1711555600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QvQ1Bm2u56fcVPgTr3DjmeZKP5Tnu/+NIWA8hQqe8c=;
        b=ZtFUcZr8RKSeNzEm80CyStWJUUFBMiYisdakOhwYKhpxjNaJ/CZ0LFXqdIHeyT97Xm
         YS9axIrBwvKt05LyziK7ZpFRtkCW4H2C6WXHl4tmxMWRMUa8mozqo5tJqQqPXq9F/3si
         pxfnCqhWKusYyg4wmwQjhdCjhSOIFnsOoHg5n2zdn7KZVEc8vjXahkUJNt6WoHSmEw1R
         gWvCtuYFnx1WxLJ+58oAJvr51fphhH58/cIvkhOg1ptlxrltXlRV7suYLGuxlpjkxRkg
         hnXWldcfNcv3POi6lWZ/YjPaBg4raAmtiQbDDoaanyc9O6V15jv8xuBw+Y2luWs9bIyW
         QcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950800; x=1711555600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QvQ1Bm2u56fcVPgTr3DjmeZKP5Tnu/+NIWA8hQqe8c=;
        b=eMtQw1erh5ITI3euIZKtoQAdWfZhOK66WyWg3vufq6iM4XbnEEffpR6ctI7UXnXYPJ
         90RdRaDGAxwjjdVVe3cIiWVmqFMKRSZZkU5+yD2f1SrVzHIUuyK7Dlv1cbvl0WwXnbee
         swpp3r+4ZVmJe3RDerVK53g51e/Coxiffapvy+iTygoxmWmYKo1Aag4ewzbmVqcos38O
         ZLdKOnKHpSNJuGQyQRQFeVkJUDd9pOM7vX5xj9XzGT175SpFclCZ77HQsZToEsh136Ml
         NxHPc83ZKPTxZbmEsYSjKCQncxAmUXNIYcsHZcRQS68wlsfwwfDPpCLfKxORB/obCnKG
         8ggg==
X-Forwarded-Encrypted: i=1; AJvYcCXlXEbNZwWXgAScB75A6FWtSg4gGDqbxvmEVsTnk6IRojB79PZL3PxfYXxR3Fc2VmpEEaqrrumNfsRYzmNEr8ABVH5WAiJ+TnWZqd52a28=
X-Gm-Message-State: AOJu0YzJiTnu41dOk/swqv/hr+T+8gSVea57ZPn4GUiUkZ1wZm7S9w8X
	6uB6CMMbnQ64jer18RHko6TTfmzlqQq60UjMmHBgHGYzQfzQPn8X/qEHNG0L4A==
X-Google-Smtp-Source: AGHT+IEMxi2HZWx3gKO+FO8X24X73331h3K2FY36+EzK/HwMm2v6ZYi0s5Fpd0+Yh+d9cN1OuiTj8g==
X-Received: by 2002:aa7:dac3:0:b0:56b:b5a2:f8bb with SMTP id x3-20020aa7dac3000000b0056bb5a2f8bbmr1079440eds.3.1710950800355;
        Wed, 20 Mar 2024 09:06:40 -0700 (PDT)
Message-ID: <bed6509b-d292-478d-a039-16c927515d35@suse.com>
Date: Wed, 20 Mar 2024 17:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] xen: Switch to new TRACE() API
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-6-andrew.cooper3@citrix.com>
 <dd9fb309-d89b-4658-8a1d-1c22758a6a95@suse.com>
 <CA+zSX=bFwRULcO-M6BPev4CnUN1YNQazZBN+=3vXc+RJ0=ULEQ@mail.gmail.com>
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
In-Reply-To: <CA+zSX=bFwRULcO-M6BPev4CnUN1YNQazZBN+=3vXc+RJ0=ULEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 16:46, George Dunlap wrote:
> On Wed, Mar 20, 2024 at 1:45 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 18.03.2024 17:35, Andrew Cooper wrote:
>>> @@ -736,9 +736,19 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
>>>              delta = delta * vlapic->hw.timer_divisor / old_divisor;
>>>          }
>>>
>>> -        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
>>> -                        TRC_PAR_LONG(is_periodic ? period : 0),
>>> -                        vlapic->pt.irq);
>>> +        if ( unlikely(tb_init_done) )
>>> +        {
>>> +            struct {
>>> +                uint64_t delta, period;
>>> +                uint32_t irq;
>>> +            } __packed d = {
>>> +                .delta = delta,
>>> +                .period = is_periodic ? period : 0,
>>> +                .irq = vlapic->pt.irq,
>>> +            };
>>> +
>>> +            trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
>>> +        }
>>
>> Instead of this open-coding, how about
>>
>>         if ( is_periodic )
>>             TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
>>                        period, period >> 32, vlapic->pt.irq);
>>         else
>>             TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
>>                        0, 0, vlapic->pt.irq);
>>
>> thus improving similarity / grep-ability with ...
> 
> Yuck -- I'm not keen on breaking the similarity, but I'm *really* not
> a fan of duplicating code.

Neither am I, just that ...

>  Both are kind of "code smell"-y to me, but I think the second seems worse.

... it was the other way around to me.

> It sort of looks to me like the source of the problem is that the
> `period` variable is overloaded somehow; in that it's used to update
> some calculation even if !is_periodic, and so the two places it's used
> as an actual period (the trace code, and the call to
> `create_periodic_time()`) need to figure out if `periodic` is for them
> to use or not.
> 
> What about adding a variable, "timer_period" for that purpose?
> Something like the following?

Yeah, why not.

Jan

> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index dcbcf4a1fe..ea14fc1587 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -729,6 +729,8 @@ static void vlapic_update_timer(struct vlapic
> *vlapic, uint32_t lvtt,
> 
>      if ( delta && (is_oneshot || is_periodic) )
>      {
> +        uint64_t timer_period = 0;
> +
>          if ( vlapic->hw.timer_divisor != old_divisor )
>          {
>              period = (uint64_t)vlapic_get_reg(vlapic, APIC_TMICT)
> @@ -736,12 +738,15 @@ static void vlapic_update_timer(struct vlapic
> *vlapic, uint32_t lvtt,
>              delta = delta * vlapic->hw.timer_divisor / old_divisor;
>          }
> 
> -        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
> -                        TRC_PAR_LONG(is_periodic ? period : 0),
> -                        vlapic->pt.irq);
> +        if ( is_periodic )
> +            timer_period = period;
> +
> +        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
> +                   timer_period, timer_period >> 32,
> +                   vlapic->pt.irq);
> 
>          create_periodic_time(current, &vlapic->pt, delta,
> -                             is_periodic ? period : 0, vlapic->pt.irq,
> +                             timer_period, vlapic->pt.irq,
>                               is_periodic ? vlapic_pt_cb : NULL,
>                               &vlapic->timer_last_update, false);
> 
> 
> As with Jan, I'd be OK with checking it in the way it is if you prefer, so:
> 
> Reviewed-by: George Dunlap <george.dunlap@cloud.com>


