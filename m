Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IR5IfdF5mk+uAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:27:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F442E319
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286227.1567332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqX2-0003vT-J7; Mon, 20 Apr 2026 15:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286227.1567332; Mon, 20 Apr 2026 15:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqX2-0003tA-GX; Mon, 20 Apr 2026 15:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1286227;
 Mon, 20 Apr 2026 15:27:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEqX1-0003t4-6m
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:27:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqX0-000eNK-G4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:27:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e645d0-bab6-0a2a0a5309dd-0a2a4506a18c-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:27:26 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e645de-7371-0a2a45060019-d1558034ed53-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:27:26 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso12810805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:27:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb75ab25sm93382755e9.11.2026.04.20.08.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:27:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776698846; x=1777303646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu0IAZu3imPxO7D2SONGZN+hcdY2ISFg0XgvbiJ22Lo=;
        b=fV28mN1+PIm/eCNQhku4Dq3nhkIDeI0A6f2bLI8+E2qrl70fpax5L+DtDmQaTUxYB1
         wQv4YTimoj0R+yBMXvlXsCNisJgPUwpxjCBr22zHUcZuyb5FxVGn0yoElAy1O6n/Opb0
         pC43tezyXXVmtO4gdrK2+UZds5e8qeF87FUbNvD2gZ+b6W0wyZSsOF+7uayJsc7dCkvi
         Fr8iYphWT1Yr4GOFA/gOX5zDOeVc9hLDpQt8gY6KmcKVnb76YA3GriOjIoDEfS+dNg2Z
         1FCL/Uz7OlP8TBa0UTe808i8psRT7aljDECa4mhwRhudpLe0l2ebzu3X/DiBYoxVt2Ik
         wbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698846; x=1777303646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu0IAZu3imPxO7D2SONGZN+hcdY2ISFg0XgvbiJ22Lo=;
        b=V01J5nRdOvSTYpjsTmDtRX2JvUTP+7Z3yXI+YCPHNiJcQTqKSSd//9B++wgvtjBMhX
         /i0J9DgutqgLI3VjtCpF0BnRV4wvohLQCrK3eS2AnsKjWd/EPcdWyiO7h9qQK0NouoJ/
         w3f6Jp/JoC9gdQxBVphQq++ub3Ggyst6Sbg3+JqqwLXEozYpXAVupqpA/dlSAgykcbLm
         +3r26+PSTuicyrM4gtdYoCfpEXMRv8usEiW36LS3W6SjILDcbHsS0iP3+906z/eUHEfw
         jsveDCQDziu6SzuLpLE3xDASbuECkSBi64W3vPPfD6rEAY7GJWjB5zO19a2KKStSbNz6
         aSuw==
X-Forwarded-Encrypted: i=1; AFNElJ/ja//HVNWdPpZ0UEkuqMDL2RPj8yHCgZ8TnqST5tt43g/rkCI7Zi9MdpgUFtmnFrAdsjQ3wnSbqWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXix7qIeLXy8Wv5ELJGwN7s1WYX9WMLXZN7bCUWhTELDzYVCuk
	M8oycmBs6vHJLy2lEGP2YsjvuYyc/WNYD/FzM0uuIRU1NxubZ95QP3I1e6+KrpE2Qw==
X-Gm-Gg: AeBDieuiHUr8S4bG8QIzo+/hgbLH25sG0ATNV1Ks+oDSPuAUJB4bQL03HcYUJqLcRWv
	D4q+09j6rAqX0Msg2wJ0AiSmdheBKgtEx8Nwfog+q1zKxAqBaq1BH1i39+ADGqHgnpslejNjyE0
	aC1XkC/tabFW3dQIDwGeVYxeSuDemxf4h19QU0c38fZtZW68fYsVLPX1h83LaU1XE36D5ui5ss2
	2DQ3TK8H37RQeLZefdDibapn9xV+CGrnZuB+aT8uw8Mi2xZHtTG/EVDJqTFzWUgo4pyMO2VJDEv
	ygRjrVBp8uStwX6L0aY3/gVJY3XlXbchv32gYNSzyvE+vHRm2mzAqVi9rg0B6vwsbCSB6Yde7fj
	jr8a+MbG7ymAP3ObHfqoQlKojJig8Pd4Co8N6x6I9CRjKK9sH6tWWdJPWRCF76Hx3mhFLnwtNlv
	NDI/qFODCOGiuen4T+45alFA6hJxeeaKraZCseAe7vB9OoGSNq7ZGdxPzNxV3I9VfrNE3FiZX3S
	funFBfoh8TxpL1686Z5EeNzLA==
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488fb793580mr180065915e9.31.1776698845648;
        Mon, 20 Apr 2026 08:27:25 -0700 (PDT)
Message-ID: <d33708ed-f364-4567-a4d7-117e820f936a@suse.com>
Date: Mon, 20 Apr 2026 17:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/27] xen/riscv: emulate guest writes to virtual APLIC
 MMIO
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
 <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
 <76ea5954-89cd-47a4-872a-239bbc08b785@gmail.com>
 <910f0720-1e83-4b0d-a1bd-09799d6f8264@suse.com>
 <276c68cb-51c0-4775-8b70-3af80d0d0f27@gmail.com>
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
In-Reply-To: <276c68cb-51c0-4775-8b70-3af80d0d0f27@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776698846-51D6AD75-A2455228/0/0
X-purgate-type: clean
X-purgate-size: 6505
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB0F442E319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 17:02, Oleksii Kurochko wrote:
> On 4/16/26 3:19 PM, Jan Beulich wrote:
>> On 14.04.2026 18:04, Oleksii Kurochko wrote:
>>> On 4/2/26 4:18 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
>>>>> +                                         unsigned long addr, uint32_t value)
>>>>> +{
>>>>> +    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>>>> +    struct aplic_priv *priv = vaplic->base.info->private;
>>>>> +    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;
>>>>
>>>> See ./CODING_STYLE as to uses of fixed-width types.
>>>>
>>>>> +    unsigned long aplic_addr = addr - priv->paddr_start;
>>>>> +    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
>>>>> +
>>>>> +    switch ( offset )
>>>>> +    {
>>>>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>>>>
>>>> And (taking this just as example) any misaligned accesses falling in this range
>>>> are fine?
>>>
>>> Do you mean something like 0x1C02 instead of 0x1C00 or 0x1C04?
>>
>> Yes.
>>
>>>>> +        /*
>>>>> +         * As sourcecfg register starts from 1:
>>>>> +         *   0x0000 domaincfg
>>>>> +         *   0x0004 sourcecfg[1]
>>>>> +         *   0x0008 sourcecfg[2]
>>>>> +         *    ...
>>>>> +         *   0x0FFC sourcecfg[1023]
>>>>> +         * It is necessary to calculate an interrupt number by substracting
>>>>
>>>> Nit: subtracting
>>>>
>>>>> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>>>>> +         */
>>>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
>>>>> +            /* interrupt not enabled, ignore it */
>>>>
>>>> Throughout the series: Please adhere to ./CODING_STYLE.
>>>>
>>>>> +            return 0;
>>>>> +
>>>>> +        break;
>>>>
>>>> And any value is okay to write?
>>>
>>> No, it should be in a range
>>> [APLIC_SOURCECFG_SM_INACTIVE,APLIC_SOURCECFG_SM_LEVEL_LOW].
>>>
>>> I will add the check before break:
>>>           if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>>>           {
>>>               gdprintk(XENLOG_WARNING,
>>>                        "value(%u) is incorrect for sourcecfg register\n",
>>> value);
>>>               value = APLIC_SOURCECFG_SM_INACTIVE;
>>>           }
>>
>> And why would writing APLIC_SOURCECFG_SM_INACTIVE be any better, when
>> that's not what the guest wanted? Simply ignore such writes, unless the
>> spec mandates specific behavior for out-of-range avlues?
> 
> The spec doesn't mandate specific behavior for out-of-range values but I 
> thought it would be better to make irq inactive instead of just ignoring 
> so it won't affect somehow potential occurrence of this interrupt.

I'd find it concerning if we did anything not mandated by the spec. Just
doing nothing is imo still the best course of action.

>>>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
>>>>> +            /* interrupt not enabled, ignore it */
>>>>> +            return 0;
>>>>> +
>>>>> +        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )
>>>>
>>>> unsigned int
>>>>
>>>>> +        {
>>>>> +            struct vcpu *v = vcpu->domain->vcpu[i];
>>>>> +
>>>>> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
>>>>> +            {
>>>>> +                target_vcpu = v;
>>>>> +                break;
>>>>> +            }
>>>>> +        }
>>>>> +
>>>>> +        ASSERT(target_vcpu);
>>>>
>>>> What guarantees the pointer to be non-NULL? The incoming value can be
>>>> arbitrary, afaict.
>>>
>>> I didn't understand your point. It is just checking that target_vcpu has
>>> been found. If after for() loop the value of target_vcpu is still NULL
>>> then something wrong in Xen.
>>
>> If that's true, then the assertion is fine to have. I can't help the
>> impression though that a guest could pick a value such that you can't
>> possibly find the target vCPU. Asserting on guest controlled input is
>> not okay, as was said several times before.
> 
> I will then do domain_crash() that as a value is incorrect in case if 
> target_vcpu is NULL, I missed that guest could put wrong value.

Would domain_crash() come close to anything real hardware would do? I
doubt it. Doing nothing (besides perhaps logging a debug message) may
once again the best we can do.

>>>>> +        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
>>>>> +        {
>>>>> +            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
>>>>> +                                    &value);
>>>>> +        }
>>>>> +        else
>>>>> +            vaplic_update_target(priv->imsic_cfg,
>>>>> +                                 vcpu_guest_file_id(target_vcpu),
>>>>> +                                 cpuid_to_hartid(target_vcpu->processor),
>>>>> +                                 &value);
>>>>
>>>> I'm struggling with the naming here: When DM is clear, a function with "dm"
>>>> in the name is called.
>>>
>>> it means direct (delivery) mode. Maybe it is better to put dm at the end
>>> of the function name? Or it is just better to change it to something else?
>>
>> Without a better understanding of what is wanted, all I can say is that
>> calling something with "dm" in its name when the condition says it's not
>> "dm" is confusing.
> 
> Basically it should be the following. If domaincfg.DM (here dm is 
> delivery mode according to spec) is 0 then it means that APLIC works in 
> direct delivery mode, if DM bit is 1 then MSI delivery mode is used.
> 
> So just for clarity I will rename:
> - vaplic_dm_update_target -> vaplic_ddm_update_target
> - vaplic_update_target -> vaplic_mdm_update_target
> 
> Or maybe just s/ddm/direct and s/mdm/msi will be just better in the 
> function names.

Afaic - yes to these latter two names.

>>>>> +    default:
>>>>> +        panic("%s: unsupported register offset: %#x\n", __func__, offset);
>>>>
>>>> Crashing the host for the guest doing something odd? It's odd that the function
>>>> only ever returns 0 anyway - it could simply return an error here (if the
>>>> itention is to not ignore such writes).
>>>
>>> But maybe it is a legal offset and we really want to support it?
>>
>> Still not a reason to crash the entire host?
> 
> Agree, domain crash will be more then enough.

See above as to even that possibly being too harsh.

Jan

