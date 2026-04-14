Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHVxBk4l3mmMoAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:30:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94B3F95E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281631.1564480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCbxT-0005Ze-Bz; Tue, 14 Apr 2026 11:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281631.1564480; Tue, 14 Apr 2026 11:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCbxT-0005YC-91; Tue, 14 Apr 2026 11:29:31 +0000
Received: by outflank-mailman (input) for mailman id 1281631;
 Tue, 14 Apr 2026 11:29:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCbxR-0005Y6-Fg
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:29:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCbxQ-002Q05-1S
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:29:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de2506-2eae-0a2a0a5409dd-0a2a45019848-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:29:28 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de2517-6fc9-0a2a45010019-d155802edde2-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:29:27 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso66958685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 04:29:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede15694sm70788025e9.3.2026.04.14.04.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:29:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776166167; x=1776770967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVx3Q+BUemHoO8kbvOP/JtWJmUw3Y0X/LMAbzrFyGuw=;
        b=j+FytLlOapLOduFK/BYe7kXdMVzIwgmbFu3axjue34R9vDctHYZKtqeH5/dKR10ex3
         6fA8iJ1TCuZz0qAZ+reCn/EDl0SXhUT/YW4Jt4P0DgxhHZQpLNaGMTfvXoXwwQgEZDyh
         NiyJejmKJryyjbetMbxrsPB6Dn56JzEXQfuiThOM11kdfXHxjd9HC83jAy66usb0ojig
         DKWFopAiQnkQHbS7nx5CpCrO9146/r3eO36g+bPOWVYMehtbSt9aSoDZ92gx9sS5Hwbu
         7l9BYepqOrfTuz0zhu2gWYKrT84Bg/QYJNTza0iEeYjPJjyPwlx3ScoQ7bzg+NcwckLE
         wc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166167; x=1776770967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVx3Q+BUemHoO8kbvOP/JtWJmUw3Y0X/LMAbzrFyGuw=;
        b=qYle6f8KTx21sU3Xyh8nZdI1pB2QtaCvYg36ZJVwq2SuFa3PMGR1g6slDBhDX/wbDu
         /7SKgjDb8yVoLKivT8olUTpBltN5v+uHaRhd3eHxTgQe0ISLnXMiZZbJuR4Vryy2mX8F
         6dz6EpddPgD7jD0lJuPW51jNx6JyMSvyDo54a5Lxtx80i2s4bnNAoYXbXK44gO62Q+Yq
         xYCPH+EkJtbwm9EeOAzSJ+iUfJnw46eGaqHP+wMW8w02fNQ5GXm7CLLXjSyRfQyTYzG8
         A7spLlqE5dEXwDkG0RwvyXQiap1jEMG/G8aGx5b7VCnxd/b3jnamzQWpvm3SOxBQyxaV
         Ri5A==
X-Forwarded-Encrypted: i=1; AFNElJ9eFsuDLKS2xw0xSSXmipN3/iyWS4adrZrH0yT1eeuHblHyIUKvwxUfeuuqgVUEqj4YL3fn2ybsf6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi1ogfwkR1kpo987q8F1eX7VPMJTVPXhu8wCeVwJB/O+2xZP5h
	srUNoQplNEfz4JnQ88ra5xIDmG5KJJASq2KpC1oU7tkl7mtqNI+HqG7w
X-Gm-Gg: AeBDievAYPjdFiw3UpHM+ftaLt4p/yYumpU6H5bdChZKaMzLjPkRcupX0qiFGoLbAH3
	S5O3t0/yQGJ4By/h49oIpt3Q0qoEuFrvAhZHByAAC5YRzg9M0fX5H8V8x3dDPLs0N2fPfe1vRrh
	l8xm2biMc5rSgwqY+BJWNJI5MRELkVEqEGCTMvGfy3sUnUv7zxH6yQE2FzQLyl++R62YnPJjspB
	fdeFMU75vTs9xl7A1nBiMa5iv34FulqDt+ua5sw6zQ/jFEdgsC3JHGmj+cUlLWkvEBiWjYtA+12
	InnGXoRgb8+YT/Qgwlf8vv59H0MA6yo5udF4mmNVNlO1M6mVu8rLmpdxA47HIgvxTKyvEsjfm79
	7d7VH3jcV79wJs2CkasKkjIkx+jSWIQ1+3Th9EEMGXSlboOa/jrc+8dOgTiNV4cAQ2Xisyi5sgA
	7zpQqw5f+9AMUneOz8lE2yPV6iGH0m/Qv8TnOrc+/kFK5bXee5QeBEC8KK8AM7iyX+RBNpkHHkH
	t//uQMiqg9xNw==
X-Received: by 2002:a05:600c:8b30:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488d6657928mr232695635e9.0.1776166167275;
        Tue, 14 Apr 2026 04:29:27 -0700 (PDT)
Message-ID: <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
Date: Tue, 14 Apr 2026 13:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776166167-B68F4185-D9A76C7B/10/73395122804
X-purgate-type: spam
X-purgate-size: 7788
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E94B3F95E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 2:22 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/setup.h
>> +++ b/xen/arch/riscv/include/asm/setup.h
>> @@ -5,6 +5,10 @@
>>   
>>   #include <xen/types.h>
>>   
>> +struct domain;
>> +struct dt_device_node;
>> +struct rangeset;
>> +
>>   #define max_init_domid (0)
>>   
>>   void setup_mm(void);
>> @@ -13,6 +17,19 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>>   
>>   void init_csr_masks(void);
>>   
>> +/* TODO: move somewhere to common header? */
> 
> Counter question: Why ...
> 
>> +/*
>> + * Retrieves the interrupts configuration from a device tree node and maps
>> + * those interrupts to the target domain.
>> + *
>> + * Returns:
>> + *   < 0 error
>> + *   0   success
>> + */
>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>> +                              bool need_mapping,
>> +                              struct rangeset *irq_ranges);
> 
> ... is this not an inline function, when ...
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -79,3 +79,11 @@ int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>>   
>>       return -ENOSYS;
>>   }
>> +
>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>> +                              bool need_mapping,
>> +                              struct rangeset *irq_ranges)
>> +{
>> +    return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>> +                                                         irq_ranges);
>> +}
> 
> ... it's merely a wrapper around an indirect function call? And then the
> function isn't used anywhere anyway.

It is used by dom0less common code and it is a wrapper because Arm has 
different implementation and Arm doesn't have 
map_device_irqs_to_domain() in its virtual interrupt controller operations.

> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -9,6 +9,7 @@
>>    */
>>   
>>   #include <xen/errno.h>
>> +#include <xen/iocap.h>
>>   #include <xen/sched.h>
>>   #include <xen/xvmalloc.h>
>>   
>> @@ -19,6 +20,113 @@
>>   
>>   #include "aplic-priv.h"
>>   
>> +struct vaplic_priv {
>> +    /* Contains a legal interrupts for a domain */
>> +    uint32_t auth_irq_bmp[APLIC_NUM_REGS];
>> +};
> 
> With it apparently plural that is correct, the first "a" wants dropping
> from the comment.
> 
>> +static bool is_irq_shared_among_domains(const struct domain *d,
>> +                                        const unsigned int irq_num)
>> +{
>> +    struct domain *tmp;
> 
> const
> 
>> +    unsigned int reg_num = irq_num / APLIC_NUM_REGS;
>> +    unsigned int bit_pos = irq_num % APLIC_NUM_REGS;
>> +
>> +    for_each_domain ( tmp )
> 
> See other uses of the construct for how this needs synchronizing. But looping
> over all domains looks pretty inefficient anyway for ...
> 
>> +    {
>> +        uint32_t *auth_irq_bmp;
>> +
>> +        if ( tmp == d )
>> +            continue;
>> +
>> +        auth_irq_bmp = tmp->arch.vintc->private;
>> +
>> +        if ( auth_irq_bmp[reg_num] & BIT(bit_pos, U) )
>> +        {
>> +            printk("%s: irq%d is shared between %pd and %pd\n", __func__,
>> +                   irq_num, tmp, d);
>> +
>> +            return true;
>> +        }
> 
> ... the intended purpose. If IRQs can't be shared, can't you maintain global
> state of which ones are in use _somewhere_?

Makes sense. I will create a static array inside 
vaplic_map_device_irqs_to_domain() and maintain global state there.

> 
>> +    }
>> +
>> +    return false;
>> +}
> 
> This together with ...
> 
>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>> +                                     struct dt_device_node *dev,
>> +                                     bool need_mapping,
>> +                                     struct rangeset *irq_ranges)
>> +{
>> +    unsigned int i, nirq;
>> +    int res, irq;
>> +    struct dt_raw_irq rirq;
>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>> +    unsigned int reg_num;
>> +
>> +    nirq = dt_number_of_irq(dev);
>> +
>> +    /* Give permission and map IRQs */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        /*
>> +         * Don't map IRQ that have no physical meaning
>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>> +         */
>> +        if ( rirq.controller != dt_interrupt_controller )
>> +        {
>> +            dt_dprintk("irq %u not connected to primary controller."
>> +                       "Connected to %s\n", i,
>> +                       dt_node_full_name(rirq.controller));
>> +            continue;
>> +        }
>> +
>> +        irq = platform_get_irq(dev, i);
>> +        if ( irq < 0 )
>> +        {
>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>> +            return irq;
>> +        }
>> +
>> +        res = irq_permit_access(d, irq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>> +                   irq);
> 
> This time the other way around: %d please with plain int. (Again at least
> once further down.)
> 
>> +            return res;
>> +        }
>> +
>> +        reg_num = irq / APLIC_NUM_REGS;
>> +
>> +        if ( is_irq_shared_among_domains(d, irq) )
>> +        {
>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>> +            return -EINVAL;
>> +        }
>> +
>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
> 
> ... all of this leaves me with the impression that IRQ numbering isn't really
> virtualized. IRQs are merely split into groups, one group per domain (and
> maybe some unused). How are you going to fit in truly virtual IRQs?

What do you mean by truly virtual IRQs?

I can't totally agree that the current approach isn't use virtual IRQs, 
yes, they are 1:1 mapped but on the other side Xen is responsible to 
give an IRQ number for guest's device and Xen is responsible that guest 
isn't trying to reach IRQ which not belongs to it.


> 
>> +        dt_dprintk("  - IRQ: %u\n", irq);
>> +
>> +        if ( irq_ranges )
>> +        {
>> +            res = rangeset_add_singleton(irq_ranges, irq);
>> +            if ( res )
>> +                return res;
>> +        }
> 
> What is irq_ranges?

IIUC based on Arm code irq_ranges is an optional output accumulator, the 
caller allocates and passes it in when it needs to track which IRQs were 
mapped (overlay use case), or passes NULL when that tracking is not needed.

I added here as map_device_irqs_to_domain() is called from the common 
code and so maybe one day someone will decide to pass irq_ranges to this 
functions. At the moment, for RISC-V it is the only one user of 
map_device_irqs_to_domain() and it passes NULL.

> 
>> @@ -34,6 +142,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>>   
>>   static const struct vintc_ops vaplic_ops = {
>>       .vcpu_init = vcpu_vaplic_init,
>> +    .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
>>   };
> 
> What about the inverse function, needed for domain cleanup?

I planned to add it when it will be really needed. At the momemnt, I 
don't have such use cases.

Thanks.

~ Oleksii

