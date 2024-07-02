Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C49238E8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752055.1160192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYtx-0006h7-RT; Tue, 02 Jul 2024 08:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752055.1160192; Tue, 02 Jul 2024 08:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYtx-0006eo-O3; Tue, 02 Jul 2024 08:30:13 +0000
Received: by outflank-mailman (input) for mailman id 752055;
 Tue, 02 Jul 2024 08:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOYtw-0006eV-LM
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:30:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c35b08d-384d-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 10:30:11 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so66065f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 01:30:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802667401sm7882171b3a.77.2024.07.02.01.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 01:30:10 -0700 (PDT)
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
X-Inumbo-ID: 4c35b08d-384d-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719909011; x=1720513811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eS4922ee9vhdY0Z7W3boei1kzE+VTeOt8yIu/nXjBMY=;
        b=bVN6w1w7sIbH8hU5lNE2qJsqnbwL/vbDQqTbHehwQxtXKFyvfGDHXFBxE6Z7v4GMTJ
         RXxjmWn2GbnODv+Nu/OqmhIAAwJlhIJwVyFlmuzsmmhNhhg51Xs/PgzChncvjWrhuz2R
         D+w9WDgPaBcr+DcH6pcWXDzM8IKAncdDplY9a5vSbRD7QAM3LgqRVs58UwQZzu93NTFl
         nKoWjBV3ANG0IHN04rBQY71+fWU5CxQuqY14hGraB8Q5BnqebySV2y1FeBn+KenTJa0u
         SwY5waRJ6uXYKp5bOZS/vtr4H3EKxL6JV537Z/CMMR+l6KSHt91bkpxx6UOb9Wfc/HuB
         hUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909011; x=1720513811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS4922ee9vhdY0Z7W3boei1kzE+VTeOt8yIu/nXjBMY=;
        b=k8J/SPLXPshHEgvepd7En7qG4HAuNmvYTWZYS2JNrcsv5G9FdyRiRE9Cf0dPNsJOPk
         cZLwRNX05C+MoBrmoUrJLT0gu2ymoucqGMApkt1UZ1yjU7hG2NVsg0YxS59HhQ+Awthp
         esu4kPFRFFSjzF7qUzAW5Y+ub4G040B8d/h+RMf1xD67aa2xNCzVlK2+ZRl00t50kvCK
         n18fvr2zFjdxKXUVlJJhe8SxVO7NfwMrY03/25fw3SK5dKS2P2oRiGhp7PAE7PavkGBq
         +snIPWeBodSTpO19t+34oq8FD9kp/sVgw0Sqpbt9OBXrJF0r4ocyQ5RwT9gvv/g4xSDM
         AUhQ==
X-Gm-Message-State: AOJu0YxrMkWLuQedg8Iln2+vbfAQZ9puKKpZpgN0/ZNZ3l/AzbBohMRP
	OZNSBYcnh/iT8JbAV/5GxjHlV60EKlbcp/DvYA+Vr3zdmPVvvKlwpvHE8n7iXw==
X-Google-Smtp-Source: AGHT+IHzOv/cTLGxzx9/L03mq6fHDKtgfb9hj1R7nbw+63TzEislTA/opcEWL0KRYyR13pZcoXo/oQ==
X-Received: by 2002:a5d:5987:0:b0:363:776:821b with SMTP id ffacd0b85a97d-3676045b4a0mr11365926f8f.0.1719909010965;
        Tue, 02 Jul 2024 01:30:10 -0700 (PDT)
Message-ID: <a7df11bc-ab68-4ee2-9b96-53f3890a9803@suse.com>
Date: Tue, 2 Jul 2024 10:30:03 +0200
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
 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com> <ZoLIpulcC7dqtxYR@macbook>
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
In-Reply-To: <ZoLIpulcC7dqtxYR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2024 17:17, Roger Pau Monné wrote:
> On Mon, Jul 01, 2024 at 05:07:19PM +0200, Jan Beulich wrote:
>> On 01.07.2024 15:29, Roger Pau Monné wrote:
>>> On Mon, Jul 01, 2024 at 12:40:35PM +0200, Jan Beulich wrote:
>>>> On 01.07.2024 11:55, Roger Pau Monné wrote:
>>>>> On Thu, Jul 27, 2023 at 09:38:55AM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
>>>>>>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>>>>>>          else
>>>>>>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
>>>>>> -                                           : arch_hwdom_irqs(domid);
>>>>>> +                                           : arch_hwdom_irqs(d);
>>>>>>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>>>>>>  
>>>>>>          radix_tree_init(&d->pirq_tree);
>>>>>> @@ -819,6 +819,24 @@ void __init setup_system_domains(void)
>>>>>>      if ( IS_ERR(dom_xen) )
>>>>>>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>>>>>>  
>>>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>>> +    /* Bound-check values passed via "extra_guest_irqs=". */
>>>>>> +    {
>>>>>> +        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
>>>>>> +
>>>>>> +        if ( extra_hwdom_irqs > n - nr_static_irqs )
>>>>>> +        {
>>>>>> +            extra_hwdom_irqs = n - nr_static_irqs;
>>>>>> +            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
>>>>>> +        }
>>>>>> +        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
>>>>>> +        {
>>>>>> +            extra_domU_irqs = n - nr_static_irqs;
>>>>>> +            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
>>>>>> +        }
>>>>>> +    }
>>>>>> +#endif
>>>>>
>>>>> IMO this is kind of a weird placement. Wouldn't this be more naturally
>>>>> handled in parse_extra_guest_irqs()?
>>>>
>>>> Indeed it is and yes it would, but no, it can't. We shouldn't rely on
>>>> the particular behavior of arch_hwdom_irqs(), and in the general case
>>>> we can't call it as early as when command line arguments are parsed. I
>>>> couldn't think of a neater way of doing this, and it not being pretty
>>>> is why I'm saying "(ab)use" in the description.
>>>
>>> I see, nr_static_irqs is an alias of nr_irqs_gsi, which is not properly
>>> set by the time we evaluate command line arguments.
>>>
>>> My only possible suggestion would be to do it as a presmp initcall,
>>> and define/register such initcall for x86 only, the only benefit would
>>> be that such inicall could be defined in the same translation unit as
>>> arch_hwdom_irqs() then.
>>
>> Which then would require making extra_{hwdom,domU}_irqs available to
>> x86/io_apic.c, which also wouldn't be very nice. To be honest, I'd prefer
>> to keep the logic where it is, until such time where perhaps we move pIRQ
>> stuff wholesale to x86-only files.
> 
> Fine by me.
> 
> I think we are in agreement about what needs doing.

Hmm, after further thinking I'm not sure splitting would be the way to go.
We should rather properly remove the concept of pIRQ from PVH, i.e. not
only not have them visible to the kernel, but also not use e.g. ->nr_pirqs
and ->pirq_tree internally. Then we could presumably drop the constraining
via this command line option (documenting it as inapplicable to PVH).

>  I can provide:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> With the changes we have agreed to arch_hwdom_irqs().

Thanks; changes done locally.

Jan

