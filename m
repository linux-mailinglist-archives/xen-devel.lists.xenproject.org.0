Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F75823DF4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 09:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661116.1030804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJUg-00061X-Jv; Thu, 04 Jan 2024 08:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661116.1030804; Thu, 04 Jan 2024 08:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJUg-0005zH-HA; Thu, 04 Jan 2024 08:54:26 +0000
Received: by outflank-mailman (input) for mailman id 661116;
 Thu, 04 Jan 2024 08:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLJUe-0005zA-S1
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 08:54:24 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db3de34a-aade-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 09:54:23 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso3108071fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 00:54:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a056e02310b00b0035faf00c555sm8980889ilb.31.2024.01.04.00.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 00:54:22 -0800 (PST)
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
X-Inumbo-ID: db3de34a-aade-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704358463; x=1704963263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eqeZzEvc5/VJZVlCnrJsCnmNWfBylCL5wi1ctFiICk=;
        b=I4UpuZby4L0Ol3y5fichf4LN+KsSv4lAD1QDIC7lG2+Kv3VUcC2xDADg+EO9QjskRJ
         6b6pDwhzCTZ7S56w7tdXACmEOGPFph+xRAc6JKncHxpWhpjVkZNMHBLRrZYqMVbwlGOO
         rhS7BA6CL7vdvoYS35jF8FRFr+T2rdvv2Q52b62+fwwYeiAxbm9ZeOftlNFMGB+8WrLj
         vgX22Id2UYodv8PqLjFJJZ6hfqD69tJ5/vYIM7W5ENkNlRW7APfuLF71X8+nJvAd2SZT
         vJs4Qfa1+0/dJiYq80IIfV+m31/QzgoLKGL4fBDdI5JCFcjY7rbwWZ6HRN2wc4/N4gAm
         pfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704358463; x=1704963263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eqeZzEvc5/VJZVlCnrJsCnmNWfBylCL5wi1ctFiICk=;
        b=VgIyYL6e8ntGKZ0tshc8c4yKZwTvCOyGsF5woNIbkYm5PefHaJh0rv+LE66yUsx9bL
         CBjLpT4gHVvnXjpYLte4C9TaqW/1nq0Pt2LqFYtnhJsEGskVITH2GTPV2fo52ieT5n8J
         vPfKH3EU/0eZ8mQaXAYIYSW0R0aqoUXS7861228vXhSa/6ZKCVzI3vhfpJwi/e79Q627
         ANblnVhVLmLADHrvderOL/KzysPyto00c66tejmj2kLJciYanxIiPmXZad1BjJUAkyKT
         AKhZJjXvZ7a+g30rZ/1AHeE9qrUnRkh26JuUIGUvGFPnXfM9Zgp6bVZfjETIRzWKEPfE
         DFwA==
X-Gm-Message-State: AOJu0Ywvqkd7qRk62oKq83eH8FnkNLlAWGpvQn47CB9q9DQlYaPfGUtC
	wpUNK3gpf24k5KvMU+Sv6vl4+xacsNyv
X-Google-Smtp-Source: AGHT+IFycV3qyEiC6pmNePQERjtxcUwQvvitgBlmsNTDdB8+wmoRlF/dBa2fzoLWYtKFzezQkJ+qWw==
X-Received: by 2002:a05:651c:1a06:b0:2cc:769e:723d with SMTP id by6-20020a05651c1a0600b002cc769e723dmr201118ljb.87.1704358462874;
        Thu, 04 Jan 2024 00:54:22 -0800 (PST)
Message-ID: <3a0b6d8a-d9f3-41d0-9acc-e84b5d9d3e33@suse.com>
Date: Thu, 4 Jan 2024 09:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Content-Language: en-US
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
 <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
 <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
 <b74f1f28-58da-4604-a7ef-370aeb0522ce@suse.com>
 <d0daf858-eda8-4b2a-9cfe-82fff834df8f@xen.org>
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
In-Reply-To: <d0daf858-eda8-4b2a-9cfe-82fff834df8f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 20:09, Julien Grall wrote:
> Hi Jan,
> 
> On 14/12/2023 10:35, Jan Beulich wrote:
>> On 14.12.2023 11:14, Julien Grall wrote:
>>> On 14/12/2023 10:10, Jan Beulich wrote:
>>>> On 11.12.2023 13:23, Julien Grall wrote:
>>>>> --- a/xen/arch/x86/io_apic.c
>>>>> +++ b/xen/arch/x86/io_apic.c
>>>>> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>>>>>    int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>>>>>    int __read_mostly nr_ioapics;
>>>>>    
>>>>> +/*
>>>>> + * The logic to check if the timer is working is expensive. So allow
>>>>> + * the admin to bypass it if they know their platform doesn't have
>>>>> + * a buggy timer.
>>>>> + */
>>>>> +static bool __initdata pit_irq_works;
>>>>> +boolean_param("pit-irq-works", pit_irq_works);
>>>>> +
>>>>>    /*
>>>>>     * Rough estimation of how many shared IRQs there are, can
>>>>>     * be changed anytime.
>>>>> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
>>>>>    {
>>>>>        unsigned long t1, flags;
>>>>>    
>>>>> +    if ( pit_irq_works )
>>>>> +        return 1;
>>>>
>>>> When the check is placed here, what exactly use of the option means is
>>>> system dependent. I consider this somewhat risky, so I'd prefer if the
>>>> check was put on the "normal" path in check_timer(). That way it'll
>>>> affect only the one case which we can generally consider "known good",
>>>> but not the cases where the virtual wire setups are being probed. I.e.
> 
> By "known good", do you mean the following:
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c89fbed8d675..c39d39ee951a 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1960,7 +1959,8 @@ static void __init check_timer(void)
>            * Ok, does IRQ0 through the IOAPIC work?
>            */
>           unmask_IO_APIC_irq(irq_to_desc(0));
> -        if (timer_irq_works()) {
> +        if (pit_irq_works || timer_irq_works()) {
> +            printk("====== pirq_irq_works %d =====\n", pit_irq_works);
>               local_irq_restore(flags);
>               return;
>           }

Yes.

>>> I am not against restricting when we allow skipping the timer check. But
>>> in that case, I wonder why Linux is doing it differently?
>>
>> Sadly Linux'es git history doesn't go back far enough (begins only at past
>> 2.6.11), so I can't (easily) find the patch (and description) for the x86-64
>> change. The later i386 change is justified mainly by paravirt needs, so
>> isn't applicable here. I wouldn't therefore exclude that my point above
>> wasn't even taken into consideration. Furthermore their command line option
>> is "no_timer_check", which to me firmly says "don't check" without regard to
>> whether the source (PIT) is actually okay. That's different with the option
>> name you (imo validly) chose.
> 
> Just to note that the name was suggested by Roger. I have to admit that 
> I didn't check if this made sense for the existing placement.

Roger, thoughts?

Jan

> Anyway, I tested the change on the HW where I wanted to skip the timer 
> check. And I can confirm this is still skipping the timer check.
> 
> So I will send a new version with the diff above and some updated comments.
> 
> Cheers,
> 


