Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E894812D1C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654435.1021343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDj4I-0006UB-3g; Thu, 14 Dec 2023 10:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654435.1021343; Thu, 14 Dec 2023 10:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDj4I-0006S5-12; Thu, 14 Dec 2023 10:35:50 +0000
Received: by outflank-mailman (input) for mailman id 654435;
 Thu, 14 Dec 2023 10:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDj4G-0006Rz-WB
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:35:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b25507e-9a6c-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 11:35:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1d2f89ddabso957301066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:35:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 th18-20020a1709078e1200b00a2300127f26sm2185401ejc.185.2023.12.14.02.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:35:47 -0800 (PST)
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
X-Inumbo-ID: 8b25507e-9a6c-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702550147; x=1703154947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xd6ELtNY1fP4tjupBg2EdYAIEhiUlLKkCCl94oPfec=;
        b=UINWyjM8kRiwXPpfdgx03IvuA6uR32t/iR0oxbmsZoNhZcAJIthtLW/Iggo33yRL2N
         ScRfTUD5j1TOi4QlGs7qEWhcbqaKpKl9WreFZmR9OmrMBYAac3MjkzH5ORP5Ddd29bEb
         5tLjdhsX3KdxjH+zAi9CF0RnAbhqJaYEDLTnl5UfhJlsUdKY2Gk10kXWWIlDNJDWIjqD
         YnevmkdSQAgR8K4c+FWJOUBb68z7PS/0Z2MI04H2q8sEA08S2JPT3c16PO3tCh/yJ4Gp
         2tMdYl2IlCm4tSgIEbECjromY/OTJpSY9Q7gMfjCszI0bdL/tdnTiTOnd7llgloid3KF
         eMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550147; x=1703154947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xd6ELtNY1fP4tjupBg2EdYAIEhiUlLKkCCl94oPfec=;
        b=F8t7nlDFMu0CqpH6sLsF7yMBM0iF2EX9p+i32LoDbNPwmiGhrrb5GLoi+O3IYiDiTt
         b/cLEp6e/taUwfMszP7mZQqYyTCWaxuU4GqvxG329RDCty3K0XYLUX0drRkXUnq4F499
         NYMuBaq+fsPqAOYIPfFczptFhCcjU05Kx6N/fmcfgTEYqXGmdzw7V2PqlErSnIr1VXqM
         +4zMllfERablnV4nr+825swtCOEX+pmcogicKWvKHe1CL4DvSB0TgXoJZu9gnSYzmQE6
         AVykX6eTG1HrzAynXx3lVkSrCP64au8/z7PqRehPlV2aakJQ0osz2/9AfxSZXgqChJR4
         zcJg==
X-Gm-Message-State: AOJu0YzgR7Z2y5ED4p+RtoHfuW2EDMoG+gwM50u2LaiOVVOZ3tWrK7eI
	AOFFYCbYIau66Z8UjTr4mltt
X-Google-Smtp-Source: AGHT+IGv8XCPixdiDMlXR181jXH6l9BfHwSx0UdEzTH6sIy1RMXRCe7KjyzRcDroZlYeQ/AvuNAc7w==
X-Received: by 2002:a17:906:10c7:b0:a1d:2e32:d284 with SMTP id v7-20020a17090610c700b00a1d2e32d284mr4263610ejv.23.1702550147275;
        Thu, 14 Dec 2023 02:35:47 -0800 (PST)
Message-ID: <b74f1f28-58da-4604-a7ef-370aeb0522ce@suse.com>
Date: Thu, 14 Dec 2023 11:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
 <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
 <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
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
In-Reply-To: <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 11:14, Julien Grall wrote:
> On 14/12/2023 10:10, Jan Beulich wrote:
>> On 11.12.2023 13:23, Julien Grall wrote:
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>>>   int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>>>   int __read_mostly nr_ioapics;
>>>   
>>> +/*
>>> + * The logic to check if the timer is working is expensive. So allow
>>> + * the admin to bypass it if they know their platform doesn't have
>>> + * a buggy timer.
>>> + */
>>> +static bool __initdata pit_irq_works;
>>> +boolean_param("pit-irq-works", pit_irq_works);
>>> +
>>>   /*
>>>    * Rough estimation of how many shared IRQs there are, can
>>>    * be changed anytime.
>>> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
>>>   {
>>>       unsigned long t1, flags;
>>>   
>>> +    if ( pit_irq_works )
>>> +        return 1;
>>
>> When the check is placed here, what exactly use of the option means is
>> system dependent. I consider this somewhat risky, so I'd prefer if the
>> check was put on the "normal" path in check_timer(). That way it'll
>> affect only the one case which we can generally consider "known good",
>> but not the cases where the virtual wire setups are being probed. I.e.
> 
> I am not against restricting when we allow skipping the timer check. But 
> in that case, I wonder why Linux is doing it differently?

Sadly Linux'es git history doesn't go back far enough (begins only at past
2.6.11), so I can't (easily) find the patch (and description) for the x86-64
change. The later i386 change is justified mainly by paravirt needs, so
isn't applicable here. I wouldn't therefore exclude that my point above
wasn't even taken into consideration. Furthermore their command line option
is "no_timer_check", which to me firmly says "don't check" without regard to
whether the source (PIT) is actually okay. That's different with the option
name you (imo validly) chose.

Jan

