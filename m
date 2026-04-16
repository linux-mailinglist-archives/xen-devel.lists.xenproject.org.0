Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AbqDXPb4Gk/mwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BB40E63C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283373.1565626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCD-0003ZV-4F; Thu, 16 Apr 2026 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283373.1565626; Thu, 16 Apr 2026 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCD-0003Wc-0T; Thu, 16 Apr 2026 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1283373;
 Thu, 16 Apr 2026 12:51:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMCB-0003Vt-3T
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:51:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMCA-00GoP7-FO
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:51:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0db60-5cb7-0a2a0a5109dd-0a2a4501e7e4-10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:46 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0db62-c1f2-0a2a45010019-d1558032c88f-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:46 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso80670755e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:51:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3e00b3sm12535087f8f.27.2026.04.16.05.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:51:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1776343906; x=1776948706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Te7eclu3Vfc7uQiDT3eQyqbf+4nTfGvhFkekv7OZ1BI=;
        b=LgnRlycflwh1N/wHGL/o7O36zN+tu2DzTnvrvJebzPkSMEkFunnsUsEgdt3xbAAg1f
         IXk/qQeoeFoJ9RPzEzdQ3WuWvRouS13x2CRNXQSchNjeFnwtM6LqvL3dBVSOPq6JfRM+
         TVhJRwQr0l3lk58Hkkv13COO2bwBLe2ZEQoeAYSxX+lY3+rD7S9X1wwKZHNgzjZKUTT6
         rnVoOomPS5+oBQUm34we4x761nZgL4WYuHj/xZIcDRapOs1MyS8CnTIqUaWBJOYwkxGi
         wfY+9n5YQGrdsiS2UcF791Rwdi9N9Tz/+hPnYR2fpFKZ6iVC8eHasdmJL/m/HaBAQPcV
         VvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343906; x=1776948706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te7eclu3Vfc7uQiDT3eQyqbf+4nTfGvhFkekv7OZ1BI=;
        b=lc1HMAHc6dt2jwoJx5rDjZ/K2RE7Bv6itC7tbWqdfBQoRmMndx4scaAUIaDu8cDDUd
         bQ4OVDO4EwfopXE/Lq+p9uMxLpK9Z1dkttQSPMSuVJ5vvWJnplsoUzw04UDHVXcC9Uu9
         IdmxEVI6wbjIQGA3PCUdCUE0hElVPX8q04bN2/xCw9FGig8bN+PVmuCU8nNJlPDshqfo
         BeG8vGbQrdAkFkjSBvcjNu+r1V3XtTjS9vo7ZAiFwxsT6TFoEHP8cEyMVsJl2SPk1CH7
         Uxv8lgrVQAOxZVpKXk523yqCGfgkQsXRbXrgUyx9TDD6ALlk9CnQ4cTSPD2Q6ZjDPZ26
         Y8yQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+5iJhmj2AzqPiG8hCeGmQ/vVKSvATaASJNlkZfK5cTU4FI33vHs/dXNYklbGcGxFY6PVqOcwVjwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyolscPReM1LskjPHbSSK4bMlhtKh3WVpxZIFDRIMWl9UIPu17F
	SFhAym6ydamTqCBFguPtU4x6TIl9T28oWMtn3i8nOkmyeZb7vCPzd+jaOIjzT1N/JLp0+cYWBJB
	cNqxNTQ==
X-Gm-Gg: AeBDiesoCzQoi393Tg/E+ZJSdp7+oAugSsWX12QjDY7iRxwEMxtFGdMe6MnbfPltFAD
	qvt3ZBOpYBh1kf4ff88NUJBLE2nMZ/ILSb0pHTDYG9DuNqWrEXwgXBxTjhnEJY4QeG6qG0IlfaN
	8Up0Mimh4jn4AkgnTg7GXwKoby4qZCnmgMf3YIpD+PSpuL98I5d12kBUH56asGA6Nj/Q1Z93TPO
	FkMNIqSuPrGFmBxJ7OZ/DZeFCkAx+BrB1oLvgcUT8Fyh+WDr1nVWtsbZYsfu05jbI49fbUTjZlS
	EsK2SbyOHX22jJC86S9M0jqAh3qGnqL6m7XJZUWzzKFIU4dB14fxe/lyRyK9hBmcVK+MvUo+fJa
	ZtfoLZzcWic8LzMinJjMhvMQcAOHHUsZP2GY5DYMc4941XErhSABMA8zSk5KqvJWn7yLs0QgmIP
	ATk/ieg8HGa3BbkVEWKhYPMCz6pRMADCTWtGnPWmUhw+RpnNeR8yXGsVGFMy8/l3eA18ER+qWoh
	9fK4Uj2lY/jcC7ydKOvf3pfxNrj4HOr+MEm
X-Received: by 2002:a05:600c:64c4:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488d68c2c56mr319036285e9.22.1776343905675;
        Thu, 16 Apr 2026 05:51:45 -0700 (PDT)
Message-ID: <a7a4e8c9-d053-4ca7-ac9c-f43ddccf9151@suse.com>
Date: Thu, 16 Apr 2026 14:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
 passthrough
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
 <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
 <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
 <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
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
In-Reply-To: <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776343906-BDE6BFF4-7F7E20B3/0/0
X-purgate-type: clean
X-purgate-size: 6916
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B35BB40E63C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 13:29, Oleksii Kurochko wrote:
> On 4/2/26 2:22 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/setup.h
>>> +++ b/xen/arch/riscv/include/asm/setup.h
>>> @@ -5,6 +5,10 @@
>>>   
>>>   #include <xen/types.h>
>>>   
>>> +struct domain;
>>> +struct dt_device_node;
>>> +struct rangeset;
>>> +
>>>   #define max_init_domid (0)
>>>   
>>>   void setup_mm(void);
>>> @@ -13,6 +17,19 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>>>   
>>>   void init_csr_masks(void);
>>>   
>>> +/* TODO: move somewhere to common header? */
>>
>> Counter question: Why ...
>>
>>> +/*
>>> + * Retrieves the interrupts configuration from a device tree node and maps
>>> + * those interrupts to the target domain.
>>> + *
>>> + * Returns:
>>> + *   < 0 error
>>> + *   0   success
>>> + */
>>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>> +                              bool need_mapping,
>>> +                              struct rangeset *irq_ranges);
>>
>> ... is this not an inline function, when ...
>>
>>> --- a/xen/arch/riscv/intc.c
>>> +++ b/xen/arch/riscv/intc.c
>>> @@ -79,3 +79,11 @@ int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>>>   
>>>       return -ENOSYS;
>>>   }
>>> +
>>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>> +                              bool need_mapping,
>>> +                              struct rangeset *irq_ranges)
>>> +{
>>> +    return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>>> +                                                         irq_ranges);
>>> +}
>>
>> ... it's merely a wrapper around an indirect function call? And then the
>> function isn't used anywhere anyway.
> 
> It is used by dom0less common code and it is a wrapper because Arm has 
> different implementation and Arm doesn't have 
> map_device_irqs_to_domain() in its virtual interrupt controller operations.

But the question wasn't why this is a wrapper, but why this wrapper isn't an
inline function.

>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>> +                                     struct dt_device_node *dev,
>>> +                                     bool need_mapping,
>>> +                                     struct rangeset *irq_ranges)
>>> +{
>>> +    unsigned int i, nirq;
>>> +    int res, irq;
>>> +    struct dt_raw_irq rirq;
>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>> +    unsigned int reg_num;
>>> +
>>> +    nirq = dt_number_of_irq(dev);
>>> +
>>> +    /* Give permission and map IRQs */
>>> +    for ( i = 0; i < nirq; i++ )
>>> +    {
>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>> +        if ( res )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>> +                   i, dt_node_full_name(dev));
>>> +            return res;
>>> +        }
>>> +
>>> +        /*
>>> +         * Don't map IRQ that have no physical meaning
>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>> +         */
>>> +        if ( rirq.controller != dt_interrupt_controller )
>>> +        {
>>> +            dt_dprintk("irq %u not connected to primary controller."
>>> +                       "Connected to %s\n", i,
>>> +                       dt_node_full_name(rirq.controller));
>>> +            continue;
>>> +        }
>>> +
>>> +        irq = platform_get_irq(dev, i);
>>> +        if ( irq < 0 )
>>> +        {
>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>> +            return irq;
>>> +        }
>>> +
>>> +        res = irq_permit_access(d, irq);
>>> +        if ( res )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>> +                   irq);
>>
>> This time the other way around: %d please with plain int. (Again at least
>> once further down.)
>>
>>> +            return res;
>>> +        }
>>> +
>>> +        reg_num = irq / APLIC_NUM_REGS;
>>> +
>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>> +        {
>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>
>> ... all of this leaves me with the impression that IRQ numbering isn't really
>> virtualized. IRQs are merely split into groups, one group per domain (and
>> maybe some unused). How are you going to fit in truly virtual IRQs?
> 
> What do you mean by truly virtual IRQs?

Ones where no aspects are represented by any piece of hardware.

> I can't totally agree that the current approach isn't use virtual IRQs, 
> yes, they are 1:1 mapped but on the other side Xen is responsible to 
> give an IRQ number for guest's device and Xen is responsible that guest 
> isn't trying to reach IRQ which not belongs to it.

In a non-virtualized environment I expect IRQs are going to be "sparse"
(i.e. with perhaps large blocks of items used elsewhere). If you had
proper translation of IRQ numbers, the same could be true for your
guests.

>>> +        dt_dprintk("  - IRQ: %u\n", irq);
>>> +
>>> +        if ( irq_ranges )
>>> +        {
>>> +            res = rangeset_add_singleton(irq_ranges, irq);
>>> +            if ( res )
>>> +                return res;
>>> +        }
>>
>> What is irq_ranges?
> 
> IIUC based on Arm code irq_ranges is an optional output accumulator, the 
> caller allocates and passes it in when it needs to track which IRQs were 
> mapped (overlay use case), or passes NULL when that tracking is not needed.
> 
> I added here as map_device_irqs_to_domain() is called from the common 
> code and so maybe one day someone will decide to pass irq_ranges to this 
> functions. At the moment, for RISC-V it is the only one user of 
> map_device_irqs_to_domain() and it passes NULL.

Simply assert then that it's NULL?

>>> @@ -34,6 +142,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>>>   
>>>   static const struct vintc_ops vaplic_ops = {
>>>       .vcpu_init = vcpu_vaplic_init,
>>> +    .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
>>>   };
>>
>> What about the inverse function, needed for domain cleanup?
> 
> I planned to add it when it will be really needed. At the momemnt, I 
> don't have such use cases.

I.e. if any domain needs re-starting, the entire system needs rebooting?
Recall that "dom0less" is slightly misleading a name, as it only allows
there to not be a Dom0. One can be there, and hence re-starting a crashed
domain ought to be possible. For that, you need to correctly clean up
after the crashed one.

Jan

