Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23F91E35C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751774.1159834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIcq-0001vV-B9; Mon, 01 Jul 2024 15:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751774.1159834; Mon, 01 Jul 2024 15:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIcq-0001sj-8E; Mon, 01 Jul 2024 15:07:28 +0000
Received: by outflank-mailman (input) for mailman id 751774;
 Mon, 01 Jul 2024 15:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOIcp-0001FV-2s
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:07:27 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a06fbf57-37bb-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:07:26 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso32688841fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:07:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac11d8c52sm65750745ad.112.2024.07.01.08.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:07:25 -0700 (PDT)
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
X-Inumbo-ID: a06fbf57-37bb-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719846446; x=1720451246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wubt1F8koOluR+s4Dac+btsWfhFN0kpyqeEKNbAtqRM=;
        b=g899cMlOuE/V1B785/HgqSb8Xf7hxfBPi4H96/y77BXedlAgASmm2+CKkMjsdKuO4a
         w4dKeNn5nvZN3il3YBmNSmSrp5eq+IXjfRJiDD0hXvdX8m7zQYARKKWIFcNkGw0+zLrD
         Q/hZqoTG5SFg/s4E9HVyJNP91H4zsH68mOWVBKh6AiWI4VkxJCGb1fwTVTT/SgTAdBWY
         fe2VIWo6DrBReYHdcb/St815oz9yxR+uHFt3+Muj4xfJrnWEuTp0CoK04iierwdZzBD9
         r5PpnrKEAW9NReaOAFa/4gfxY4lm6fQ6ennca03No8JiiJfu1nQB0y2GGC4tD5p6cygX
         DlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846446; x=1720451246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wubt1F8koOluR+s4Dac+btsWfhFN0kpyqeEKNbAtqRM=;
        b=H0qPD+wdaw10RGcoosPRwuV6XMVHoa5xwaomsfEqDJVVYpJ4WanO7K6OOK7STYtyXP
         AAKGjUBFGfJIEnshnhV6Qim5RWgE43Qs39HyOTRkrVKxi3PpLgWk8bQ3kJ1MkiAoh/sa
         qLuU1yhSe5hA52m4FKARwpHIktntt8gj/N8SiJULSXVKTjd2kdRFjehb/vL5egtITWDY
         yDTiOUO6JApXl7RR/8qDvstVxcK3qFCOksexJURAxOrPzcs1VNKNiqxfKnBgfFOvdaVd
         aHymxk3s/s61bZt39zk/mhUlVBvRxiikt3MH1BVnz6NN858omxz4ONTRhWXJaSINQWtC
         /i3g==
X-Gm-Message-State: AOJu0Yyh8OO68NNwsN1e1pIqqKgCww/zzaUs92fBi7wOBoCDnA9OeM69
	fimC6FTjft5l98RPBi7xv1Iim99+WDk4lkOmehnLwSxTk43BUn/skEWraPapIA==
X-Google-Smtp-Source: AGHT+IGbLN4Bm0AgJFWlPAMYbJ7Myoz/BYcjtb6W0Htqmk7n5PdXscjKH/8bRygEzII/+OnXhqzKsg==
X-Received: by 2002:a05:651c:2c6:b0:2ee:5b64:b471 with SMTP id 38308e7fff4ca-2ee5e3b3313mr33655631fa.30.1719846445701;
        Mon, 01 Jul 2024 08:07:25 -0700 (PDT)
Message-ID: <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com>
Date: Mon, 1 Jul 2024 17:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs"
 upper bounds
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com> <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com> <ZoKvP6StEbMTgjrY@macbook>
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
In-Reply-To: <ZoKvP6StEbMTgjrY@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2024 15:29, Roger Pau Monné wrote:
> On Mon, Jul 01, 2024 at 12:40:35PM +0200, Jan Beulich wrote:
>> On 01.07.2024 11:55, Roger Pau Monné wrote:
>>> On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/io_apic.c
>>>> +++ b/xen/arch/x86/io_apic.c
>>>> @@ -2663,18 +2663,21 @@ void __init ioapic_init(void)
>>>>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>>>>  }
>>>>  
>>>> -unsigned int arch_hwdom_irqs(domid_t domid)
>>>> +unsigned int arch_hwdom_irqs(const struct domain *d)
>>>
>>> While at it, should this be __hwdom_init?
>>
>> It indeed can be, so I've done this for v4.
>>
>>> I'm fine with changing the function to take a domain parameter...
>>>
>>>>  {
>>>>      unsigned int n = fls(num_present_cpus());
>>>>  
>>>> -    if ( !domid )
>>>> +    if ( is_system_domain(d) )
>>>> +        return PAGE_SIZE * BITS_PER_BYTE;
>>>
>>> ... but why do we need a function call just to get a constant value?
>>> Wouldn't this better be a define in a header?
>>
>> Would be an option, but would result in parts of the logic living is
>> distinct places.
>>
>>>> +
>>>> +    if ( !d->domain_id )
>>>>          n = min(n, dom0_max_vcpus());
>>>>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
>>>>  
>>>>      /* Bounded by the domain pirq eoi bitmap gfn. */
>>>>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
>>>
>>> So that could also use the same constant here?
> 
> I would have a slight preference for PAGE_SIZE * BITS_PER_BYTE being
> defined inside of this function as:
> 
> /* Bounded by the domain pirq eoi bitmap gfn. */
> const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;
> 
> Or similar for clarity purposes.

Can do, sure.

> While at it, I've noticed that PHYSDEVOP_pirq_eoi_gmfn_v{1,2} is not
> available to HVM guests (not even when exposing PIRQ support) and
> hence I wonder if we should special case PVH dom0, but maybe it's best
> to deal with this properly rather than hacking something special
> just for PVH dom0.  At the end of the day the current limit is high
> enough to not cause issues on current systems I would expect.

Oh, so entirely the other way around than mentioned when we talked, once
again due to the filtering in hvm/hypercall.h that I keep forgetting. So
in principle we could avoid the bounding for HVM. Just that right now
extra_domU_irqs covers both PV and HVM, and would hence need splitting
first.

>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
>>>>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>>>>          else
>>>>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
>>>> -                                           : arch_hwdom_irqs(domid);
>>>> +                                           : arch_hwdom_irqs(d);
>>>>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>>>>  
>>>>          radix_tree_init(&d->pirq_tree);
>>>> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
>>>>      if ( IS_ERR(dom_xen) )
>>>>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>>>>  
>>>> +#ifdef CONFIG_HAS_PIRQ
>>>> +    /* Bound-check values passed via "extra_guest_irqs=". */
>>>> +    {
>>>> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
>>>> +
>>>> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
>>>> +        {
>>>> +            extra_hwdom_irqs = n - nr_static_irqs;
>>>> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
>>>> +        }
>>>> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
>>>> +        {
>>>> +            extra_domU_irqs = n - nr_static_irqs;
>>>> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
>>>> +        }
>>>> +    }
>>>> +#endif
>>>
>>> IMO this is kind of a weird placement. Wouldn't this be more naturally
>>> handled in parse_extra_guest_irqs()?
>>
>> Indeed it is and yes it would, but no, it can't. We shouldn't rely on
>> the particular behavior of arch_hwdom_irqs(), and in the general case
>> we can't call it as early as when command line arguments are parsed. I
>> couldn't think of a neater way of doing this, and it not being pretty
>> is why I'm saying "(ab)use" in the description.
> 
> I see, nr_static_irqs is an alias of nr_irqs_gsi, which is not properly
> set by the time we evaluate command line arguments.
> 
> My only possible suggestion would be to do it as a presmp initcall,
> and define/register such initcall for x86 only, the only benefit would
> be that such inicall could be defined in the same translation unit as
> arch_hwdom_irqs() then.

Which then would require making extra_{hwdom,domU}_irqs available to
x86/io_apic.c, which also wouldn't be very nice. To be honest, I'd prefer
to keep the logic where it is, until such time where perhaps we move pIRQ
stuff wholesale to x86-only files.

Jan

