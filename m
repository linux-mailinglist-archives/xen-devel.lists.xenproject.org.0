Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD44905416
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 15:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739356.1146367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHOJk-00071o-0a; Wed, 12 Jun 2024 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739356.1146367; Wed, 12 Jun 2024 13:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHOJj-0006zN-To; Wed, 12 Jun 2024 13:47:11 +0000
Received: by outflank-mailman (input) for mailman id 739356;
 Wed, 12 Jun 2024 13:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHOJi-0006zH-HM
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 13:47:10 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d4299c-28c2-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 15:47:08 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57ca81533d0so1476665a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 06:47:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f15ffa147sm473861366b.86.2024.06.12.06.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:47:07 -0700 (PDT)
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
X-Inumbo-ID: 42d4299c-28c2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718200028; x=1718804828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwfoME/5wT6WN0woE3J1881dmdAqtMaIqmBYpIhhWBo=;
        b=YlQJSGsy+Ve/OeEap+I09vX63/VYJpoktw80I3hVr3G8VzolW6/6CVMO62NPvldUVN
         nOZADt3TQoYHWF4h3KmCpNFmVZspmSDsW+NmcUtXbrRTeKvd3yLXXSuv3kGcuCPIz+Hm
         +Zh/spmuh6a6RRB8P7TxPP2TSbHAGfyXEZ44W7pA1cYcT118f9V2NHmaGBFi4Q2AzKSW
         qvOvGC/RErmqlSBFa6liAxR3OheoUxO1eN8vTAY/hIkXtKVsTP6DqM8+aVqjES3PthFA
         t+hMKFxZzk7EN+7Dlh2FJbkf/HiHdroMaY46LHtGRioTmXwJ/SYAAiQm5jojTN3O7xnT
         aqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200028; x=1718804828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwfoME/5wT6WN0woE3J1881dmdAqtMaIqmBYpIhhWBo=;
        b=OmFlmoawN78UjXTA+CgHpDyfksraHKFrae1ny4CeWcUnhy8NXhvUEozcezmCzZ+Yfx
         1EAQaPITG00vz749GIx50FsxZTIns1qMFOX6d4c59nxts2ffAEukxjzmF0o5xPtLj5I5
         2lB+c3Tv1yRzge9ugFqhcjFdgwWkDWmZGwEUcp0o1a4ywUptu+2JbsC+cmdEAU0HMFvU
         QoCSwyTkbVEIiFPConqktdh+TSEQb+pg+zL7YEVD6kk6CAeZJFbknP+j60dY8yWEn7bt
         HDKaXQAwUdTlNZm4BxF+sIkntLUMU0LZhWB63ScgUeASl0kihlVyCT0NT5BXzt3kX5EK
         ZMqg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+YL+EytPmN4rq9WY984slhr4C7Y33Yx0+AzN1AvKlgDfk8nxM2+7aAPMuBFzyDa2oZswappBgTgoYgVu6pVy8fgfiuIXHCdMp6gs+BM=
X-Gm-Message-State: AOJu0YyH6rIR7C9Il31vEubcSjPKeq1ISwC2WPr0y/Z4n3ObpT6Ve0sb
	hRT5m9klKUMjB6i5iTPSRBu70+OIlORqMl1Nlnv9l4NhJPerOqT8DcQAkV01I8AEZfLoICfq820
	=
X-Google-Smtp-Source: AGHT+IHyjiikrhL6e98blGm4+3UZLiyW3t4W4n1LrrxA8hGkFVa4mnE24Qz/kS5aUgyXNfipb4Cdfg==
X-Received: by 2002:a17:906:4f0a:b0:a6f:3b3b:b7cb with SMTP id a640c23a62f3a-a6f3b3bb944mr310780166b.7.1718200027835;
        Wed, 12 Jun 2024 06:47:07 -0700 (PDT)
Message-ID: <6e4e04b5-7fa3-4109-b222-8e7b7d75d48f@suse.com>
Date: Wed, 12 Jun 2024 15:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-8-roger.pau@citrix.com>
 <7e090e00-2061-4ef1-a0a4-b45ac86c5ee6@suse.com> <ZmmFGc7TSoKsCH95@macbook>
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
In-Reply-To: <ZmmFGc7TSoKsCH95@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 13:23, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 03:50:42PM +0200, Jan Beulich wrote:
>> On 10.06.2024 16:20, Roger Pau Monne wrote:
>>> @@ -2649,6 +2649,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>               !cpumask_test_cpu(cpu, &cpu_online_map) &&
>>>               cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
>>>          {
>>> +            /*
>>> +             * This to be offlined CPU was the target of an interrupt that's
>>> +             * been moved, and the new destination target hasn't yet
>>> +             * acknowledged any interrupt from it.
>>> +             *
>>> +             * We know the interrupt is configured to target the new CPU at
>>> +             * this point, so we can check IRR for any pending vectors and
>>> +             * forward them to the new destination.
>>> +             *
>>> +             * Note the difference between move_in_progress or
>>> +             * move_cleanup_count being set.  For the later we know the new
>>> +             * destination has already acked at least one interrupt from this
>>> +             * source, and hence there's no need to forward any stale
>>> +             * interrupts.
>>> +             */
>>
>> I'm a little confused by this last paragraph: It talks about a difference,
>> yet ...
>>
>>> +            if ( apic_irr_read(desc->arch.old_vector) )
>>> +                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
>>> +                              desc->arch.vector);
>>
>> ... in the code being commented there's no difference visible. Hmm, I guess
>> this is related to the enclosing if(). Maybe this could be worded a little
>> differently, e.g. starting with "Note that for the other case -
>> move_cleanup_count being non-zero - we know ..."?
> 
> Hm, I see.  Yes, the difference is that for interrupts that have
> move_cleanup_count set we don't forward pending interrupts in IRR on
> this CPU.  I put this here because I think it's more naturally
> arranged with the rest of the comment.  I can pull the whole comment
> ahead if the if() if that's better.

I actually agree with you that the placement right now is "more natural".
I'm really just after making more clear what difference it is that is
being talked about. Assuming of course ...

>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
>>> +            check_irr = true;
>>> +
>>>          if ( desc->handler->set_affinity )
>>>              desc->handler->set_affinity(desc, affinity);
>>>          else if ( !(warned++) )
>>>              set_affinity = false;
>>>  
>>> +        if ( check_irr && apic_irr_read(vector) )
>>> +            /*
>>> +             * Forward pending interrupt to the new destination, this CPU is
>>> +             * going offline and otherwise the interrupt would be lost.
>>> +             */
>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
>>> +                          desc->arch.vector);
>>> +
>>>          if ( desc->handler->enable )
>>>              desc->handler->enable(desc);
>>>  
>>
>> Down from here, after the loop, there's a 1ms window where latched but not
>> yet delivered interrupts can be received. How's that playing together with
>> the changes you're making? Aren't we then liable to get two interrupts, one
>> at the old and one at the new source, in unknown order?
> 
> I was mistakenly thinking that clear_local_APIC() would block
> interrupt delivery, but that's not the case, so yes, interrupts should
> still be delivered in the window below.
> 
> Let me test without this last patch.

... the patch wants / needs retaining in the first place.

Jan

