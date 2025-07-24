Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF0B109F3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 14:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055879.1424172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueup6-00026u-Pa; Thu, 24 Jul 2025 12:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055879.1424172; Thu, 24 Jul 2025 12:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueup6-00024v-Mc; Thu, 24 Jul 2025 12:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1055879;
 Thu, 24 Jul 2025 12:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueup5-00024p-VA
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 12:13:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f287dc-6887-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 14:13:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso574173f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 05:13:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc605afsm1979979f8f.9.2025.07.24.05.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 05:13:16 -0700 (PDT)
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
X-Inumbo-ID: 94f287dc-6887-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753359197; x=1753963997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vsXrr7ERgztg7lc98ZtoSZSenfHYb46t1QSq5c6URk0=;
        b=YH+/UCKFbe0YpxVfRiQRLkI6GGU4n5glCqPBFfhTMsm7xb+xr+6XV4ajOd7i0h8A+u
         n4QSIGEROuVCsyqVt9n+17LVOUQDe2UHnSc6pdc0/gr6RmvEq+WjJvRxXoVfBRGw2KKS
         4GVsa3aqCdmwZOumSvaqdLgWY8OU6zdb3SvrNmUc3i76aOfilxdEmjDCeQied31mlore
         YD12UwL+iOnK0hB60InyOXx3cXn41TrX22bLFlgh4xg1eZmFRI1nBS7iboB8E/PoCOrY
         Hm2s5SD3AVuIisJVMoc4ueHiT3SwjAhZCUeoUnO8HgdmIqgwBYK+68wYIsz0VwQIW5De
         hsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359197; x=1753963997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsXrr7ERgztg7lc98ZtoSZSenfHYb46t1QSq5c6URk0=;
        b=T11oN0frrwgxuvmB7WIfWnPFGr+SFNByp9I651qhp5gFV7tD8G/Ugg0aqUCDmeWjFa
         zOkFiPPx4z3pdbF5USQAj6Z8t3Xkxrg+xSnT21/E9A1zft7mHYm7mbE2A6t8XWVSCbEm
         pHgwLcNvwXvDzP9ZKwUf4l1yE+SWAu7no0jaJAmMwbuERTAh8Hte0h5cMdIkyFVcLCob
         VC/4VjJg0bB7MPqjyz7zPXNitRP2eUyP534ixmAWRVamo5PRJCvkRciquo0u11dcBZaH
         RXyabZum/TJsR+7uf0b3XvEsVC7BcHE9f7gHMxp7X8QaETxJx3BuH32apPN79GAj5Mpv
         y+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVeUlTtnQdVDQe/9ChT6q2CAFJz6jRr6+qkLvlaDAnsrVIylvLk1HXlUWcM/x2/rxtQ+SJpXA6LgqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqkPckMSwnGWYD3Ocx+iXaaUGR6gfM8Q/Zk7TpL0DfMk5w/k91
	nHHOoiEnolt0pLQSXwIxaEVOUOiKErXnkK57Bt+Tj+iAP/fJcqCaS1mKks4IgdQYxA==
X-Gm-Gg: ASbGncvQFq474QDbjETaI8HzFWzxstBcr4bJBTrbGtPt/7eIVOgJ2tk6dnU+oZLvlfJ
	whievOixzhDnR0PnRp4ZF76UtQb/AP/Cp+RttcRN2IdojBCLGGo7rkCG4PIeZCk3D/zX3RRs8h0
	G8YpfFEjPQvhfcfGb6wcEYdt0QI2pQ6utsqAryPGAqP/WPy8IChYnf2MMa1rfa3Po1h1u81dUvB
	DycUM7M3U36KCgmNkUhVYgVq4B6u9U52jDJtFHLMaP6yH1ngJ1W2tGSj8m+bv2sJPnO3oCsjApt
	SVAovJAEytRw/MTJctJVCh0gSSxoIY4HRWWqPi/yz6wVojWc5r56miI+2b4JYkrZ2BwdO+s7pmI
	YJekpSWvDWbUlPZC+rBs3W+OuStPRM//GkGUckLkTTJysxUnkbAcOgRYVbSGx8Xq14LG4BX3d7n
	IzB74b6ls=
X-Google-Smtp-Source: AGHT+IEVW7AO/TiUyq2b/ysDkbpU+kWoA76pZTaIhVcBl0qHXYSFEvs1N+IUnpGPq60+AqfJmqcIDg==
X-Received: by 2002:a05:6000:1a85:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3b768c9e9c8mr6130237f8f.5.1753359197197;
        Thu, 24 Jul 2025 05:13:17 -0700 (PDT)
Message-ID: <fcae8366-8f32-4fd1-a2be-e6505a6e9420@suse.com>
Date: Thu, 24 Jul 2025 14:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
 <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
 <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com>
 <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
 <CAGeoDV9+Tdk9S63hegQt=CpLD9Ka16qqGs9fApbG9-Q=jBW8PQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV9+Tdk9S63hegQt=CpLD9Ka16qqGs9fApbG9-Q=jBW8PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 13:41, Mykola Kvach wrote:
> Hi all,
> 
> On Tue, Jun 24, 2025 at 12:32 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> On Tue, Jun 24, 2025 at 11:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 24.06.2025 10:29, Mykola Kvach wrote:
>>>> On Tue, Jun 24, 2025 at 10:53 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 24.06.2025 09:18, Mykola Kvach wrote:
>>>>>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>>>>>>      .start_tx     = scif_uart_start_tx,
>>>>>>      .stop_tx      = scif_uart_stop_tx,
>>>>>>      .vuart_info   = scif_vuart_info,
>>>>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>>>>> +    .suspend      = scif_uart_suspend,
>>>>>> +    .resume       = scif_uart_resume,
>>>>>> +#endif
>>>>>>  };
>>>>>
>>>>> As this being put inside #ifdef was to be expected, imo a prereq change is to
>>>>> also make the struct fields conditional in xen/console.h. I think I did even
>>>>> comment to this effect back at the time.
>>>>
>>>> Would you prefer that I include this change in the current patch
>>>> series, or is it acceptable to address it in a separate patch?
>>>
>>> Either way is fine with me. I expect the header fine change to be able to go
>>> in right away (once submitted), whereas the patch here may take some time for
>>> people to review.
>>
>> Got it, I'll submit a separate patch to make the struct fields and
>> related code wrapped within SYSTEM_SUSPEND.
> 
> Jan’s proposal to conditionally include the 'suspend' and 'resume' fields
> in 'struct uart_driver' under CONFIG_SYSTEM_SUSPEND has already been
> merged -- thanks!
> 
> Could you please take another look at this patch when time permits?

That's an Arm driver, so I don't expect the request was meant to go to me
(as To: having just me was suggesting)?

Jan

