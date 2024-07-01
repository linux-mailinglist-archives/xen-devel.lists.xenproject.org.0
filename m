Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9D91E07F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751577.1159563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGy8-0007gu-LQ; Mon, 01 Jul 2024 13:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751577.1159563; Mon, 01 Jul 2024 13:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGy8-0007dy-Ia; Mon, 01 Jul 2024 13:21:20 +0000
Received: by outflank-mailman (input) for mailman id 751577;
 Mon, 01 Jul 2024 13:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOGy7-0007dq-E1
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:21:19 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe7d5d6-37ac-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:21:16 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so34458421fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 06:21:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535cc8sm64114565ad.122.2024.07.01.06.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 06:21:15 -0700 (PDT)
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
X-Inumbo-ID: cbe7d5d6-37ac-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719840076; x=1720444876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zA357/1thq8qnsdzOuqvNaZwN61oqv2FZcEQA0Yinh8=;
        b=bD5aqwVXroMQP09jI/VpRPIrqUZEPuLM6QE+2V1jvTpkYp3Y02q8n6mip7AUPIcrGO
         ZpBM8zesodlzZqj/pm+avA/0Q6Z7i+ohmwzNN9tdav4GLmQpy2rMOtmXebRkdlhRlctd
         pzNjZdZFk8b5rIbBHW4YhhWGFRX6um2ehsKAbYGn+yvMGm8jcU22UuHs1LiJvdezPUU2
         rgs8U4NJ4V+Rwlxz5yf/quQibeATzp6q11Lydun/0ap2b+4chmmaHiNfI7NIIfVmcyxS
         DIPnP/Me0E1rCC2j6u0Wes1bIwvNHMRg+KiqnnZWJJD+yuv1+xv10K4d8bwnlhpm8ugC
         HGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840076; x=1720444876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA357/1thq8qnsdzOuqvNaZwN61oqv2FZcEQA0Yinh8=;
        b=K7Xe/lQDzbHo3bG88tvRLm9QnsRjVaZwS3GeQz/Tz72xoBs3946ny3TrAgWh+7aItk
         obzCivX9sPPH+kRc1uq9jvPzXUHSGKMoE0H4cxaf08oAVKknUttcdB3OSTRSpAO3O8Q5
         wOD+OYNSOgMlY3eTDXsKOlWvJpMeixiyqJzEAZzp0b2g77yGKnuoI41R8bsTrcWpgUE+
         Rwp2rYeM1tw2nHVaiNMv+IBbsYvkWn7qBrI5MRnXGt+tg3UuXrLrNHwa/EpJ+OZiaUUW
         CM9p1mBEzDrt5xXNN7BYnGdv9F9eEu7zhRUgW1OXuqugQ0vTnJeTSod48utAurRk41/X
         ccQA==
X-Gm-Message-State: AOJu0YwTCmXQuIa2EGmrA1Af73WF5fCmQuv6v1eeGL5bMQ/12/pvFrsi
	QN4ru4yk5+TiLarkmxWOk683JhsX4V1AX6+Z4lkib2XcF2D47zjP+ZLP9G7t6w==
X-Google-Smtp-Source: AGHT+IELJKPKOyPBjwnGTtAqjFbtIWjaZoRZyJJjQ3Jk3qootecqdqrU4F1n48k/UKnGo3HigL/5YA==
X-Received: by 2002:a05:651c:4d2:b0:2ec:5467:dcb6 with SMTP id 38308e7fff4ca-2ee5e6bd1cfmr34554701fa.52.1719840076135;
        Mon, 01 Jul 2024 06:21:16 -0700 (PDT)
Message-ID: <2d5e700c-22a1-47ad-912f-d242c9fe122f@suse.com>
Date: Mon, 1 Jul 2024 15:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.19 2/3] pirq_cleanup_check() leaks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com> <ZoJu3jcsiCWwOhBl@macbook>
 <7d51b6b7-affb-46fd-98dc-b54d3842f6c2@suse.com> <ZoKPUotSg4HOlRzJ@macbook>
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
In-Reply-To: <ZoKPUotSg4HOlRzJ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2024 13:13, Roger Pau Monné wrote:
> On Mon, Jul 01, 2024 at 11:47:34AM +0200, Jan Beulich wrote:
>> On 01.07.2024 10:55, Roger Pau Monné wrote:
>>> On Thu, Jul 27, 2023 at 09:38:29AM +0200, Jan Beulich wrote:
>>>> Its original introduction had two issues: For one the "common" part of
>>>> the checks (carried out in the macro) was inverted.
>>>
>>> Is the current logic in evtchn_close() really malfunctioning?
>>
>> First: I'm getting the impression that this entire comment doesn't relate
>> to the part of the description above, but to the 2nd paragraph further
>> down. Otherwise I'm afraid I may not properly understand your question,
>> and hence my response below may not make any sense at all.
>>
>>> pirq->evtchn = 0;
>>> pirq_cleanup_check(pirq, d1); <- cleanup for PV domains
>>> if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
>>>     unmap_domain_pirq_emuirq(d1, pirq->pirq); <- cleanup for HVM domains
>>>
>>> It would seem to me the pirq_cleanup_check() call just after setting
>>> evtchn = 0 was done to account for PV domains, while the second
>>> (hidden) pirq_cleanup_check() call in unmap_domain_pirq_emuirq() would
>>> do the cleanup for HVM domains.
>>>
>>> Maybe there's something that I'm missing, I have to admit the PIRQ
>>> logic is awfully complicated, even more when we mix the HVM PIRQ
>>> stuff.
>>
>> If you look at pirq_cleanup_check() you'll notice that it takes care
>> of one HVM case as well (the not emuirq one, i.e. particularly PVH,
>> but note also how physdev_hvm_map_pirq() calls map_domain_emuirq_pirq()
>> only conditionally). Plus the crucial aspect of the 2nd paragraph of
>> the description is that past calling pirq_cleanup_check() it is not
>> really valid anymore to (blindly) de-reference the struct pirq pointer
>> we hold in hands. The is_hvm_domain() qualification wasn't enough,
>> since - as said - it's only one of the possibilities that would allow
>> the pirq to remain legal to use past the call, when having taken the
>> function's
>>
>>         if ( pirq->arch.hvm.emuirq != IRQ_UNBOUND )
>>             return;
>>
>> path. A 2nd would be taking the
>>
>>         if ( !pt_pirq_cleanup_check(&pirq->arch.hvm.dpci) )
>>             return;
>>
>> path (i.e. a still in use pass-through IRQ), but the 3rd would still
>> end in the struct pirq being purged even for HVM.
> 
> Right, I was missing that if pirq is properly freed then further
> usages of it after the pirq_cleanup_check() would be use after free.
> 
>>>> And then after
>>>> removal from the radix tree the structure wasn't scheduled for freeing.
>>>> (All structures still left in the radix tree would be freed upon domain
>>>> destruction, though.)
>>>
>>> So if my understanding is correct, we didn't have a leak due to the
>>> missing free_pirq_struct() because the inverted check in
>>> pirq_cleanup_check() macro prevented the removal from the radix tree,
>>> and so stale entries would be left there and freed at domain
>>> destruction?
>>
>> That's the understanding I had come to, yes. What I wasn't entirely
>> sure about (see the 2nd post-commit-message remark) is why the entry
>> being left in the radix tree never caused any problems. Presumably
>> that's a result of pirq_get_info() first checking whether an entry is
>> already there, allocating a new one only for previously empty slots.
> 
> Yes, I came to the same conclusion, that not freeing wasn't an issue
> as Xen would re-use the old entry.  Hopefully it's clean enough to not
> cause issues when re-using.
> 
>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
>>>>              if ( !is_hvm_domain(d1) )
>>>>                  pirq_guest_unbind(d1, pirq);
>>>>              pirq->evtchn = 0;
>>>> -            pirq_cleanup_check(pirq, d1);
>>>> -            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
>>>> -                unmap_domain_pirq_emuirq(d1, pirq->pirq);
>>>> +            if ( !is_hvm_domain(d1) ||
>>>> +                 domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
>>>> +                 unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
>>>
>>> pirq_cleanup_check() already calls pirq_cleanup_check() itself.  Could
>>> you please add a comment to note that unmap_domain_pirq_emuirq()
>>> succeeding implies the call to pirq_cleanup_check() has already been
>>> done?
>>>
>>> Otherwise the logic here looks unbalanced by skipping the
>>> pirq_cleanup_check() when unmap_domain_pirq_emuirq() succeeds.
>>
>> Sure, added:
>>
>>                 /*
>>                  * The successful path of unmap_domain_pirq_emuirq() will have
>>                  * called pirq_cleanup_check() already.
>>                  */
> 
> With that added:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks Roger.

Oleksii - would you please consider giving this long-standing bug fix a
release ack?

Thanks, Jan

