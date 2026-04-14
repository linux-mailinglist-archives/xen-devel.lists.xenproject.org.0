Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DgbCbdl3mmxDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 18:05:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D53FC4F0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 18:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282042.1564733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCgFm-0000K5-RP; Tue, 14 Apr 2026 16:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282042.1564733; Tue, 14 Apr 2026 16:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCgFm-0000H3-O8; Tue, 14 Apr 2026 16:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1282042;
 Tue, 14 Apr 2026 16:04:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCgFl-0000Gx-OV
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 16:04:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCgFj-00BqBd-F0
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 18:04:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de6589-5cb7-0a2a0a5109dd-0a2a4502d0f0-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 18:04:39 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de6597-42fa-0a2a45020019-d155802ca574-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 18:04:39 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so57203285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 09:04:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e46a85sm42868094f8f.24.2026.04.14.09.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 09:04:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776182679; x=1776787479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+aMCWayM4ixlHJG7UsZh7nEeBfMdvI1oSjCQGXA9E8=;
        b=PwqBXoIMuRMDZWBtfoq6F7tin3ryMWQpJB5PWnvAZ+5CvL7YQGMCzFtlWxjsS1vX4f
         jZbIVobbxEr3HwfBkKCNujgM0V3hrt10rfjavEd1cZqQnuIMw5UG5XiKuaAG+Q9IxDxy
         fzLY67mFzH48k+cEf5RxC1Q5o9gyN1ku9g/YPYADFA5xXefATlc1hDqzB/hNUVfmcMx6
         Njb9ukMnwddr/JJTp0QoQLe+IkW/kFnmPHG4RCoUYyZsF9EdDHf11A8djaDZodDGF0u0
         U0/fzbx8H4dDvR3KiD2Wq4NF83JeNd6KbCUihaGorX4RXyuBNnB5e3fOLtgzSBIbj/Ll
         p+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182679; x=1776787479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+aMCWayM4ixlHJG7UsZh7nEeBfMdvI1oSjCQGXA9E8=;
        b=qebUlvGH0ZF9VHQ9BFwCvbjRrDK9O3/NvucGwqeNMEKImIZeb8FTmPOB67hT3EZVyP
         lzJq8megPq728xWQarR6P0Z7RIVcQnZbpuJixuTKcfCDENseISrqz4qT3X5zYNeY0ofl
         hh5t7FMUPA8Rv7xdOTWvGghJM2pFlNq3AhQdZV2BsnhvFyLN2h04BuKgvSjoY9DZhSB6
         V5S49Jx2RBsjDLt5vKSmkpLBuIB3YcKZ2RCgVw8RvKWJM7Nv7gn7kH8oTgnr+3Bbd1s8
         f6eu/+gU7LG3mw994WWfYk1tvwPAFi3CaDuPrFZ2+x7Jnxmpro86AmJfdsr4bUnmvQw3
         k0oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hrNSC0SmxJ3FRbyb/4BTwI2Uo+jyMkomp7DARhaeisJR5YFigs6PVzoLk9TxB45JuHpRA//2VNj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd7bFSlrdNgJGFW0OgoquKksTdaGVfo+EcoXuhkBWzfaq4Gb5k
	6CAPh0kZirKiR/JLTe1D2GGOWdbT8eqC4h7U6EQHTVtSA6YWICTYoqkC
X-Gm-Gg: AeBDieue5HfY1GCE5XGmecJBLKq0WL2Rwca3xWadDDHHG9SnPldgSuOpX+50ZKjprLS
	dc1WhjcwUMMLWK77sOYHyblpwt8toKkK/Wn6F5/AybbCwK+Ozcbs+WPD1niZ8vof69r6p3TGbz/
	XT2zmL6xWYEYm8l3YX1xVT0aCB/IqpU+3yMBDw887yzhvUVRnPt6Jl6BEMtiypQtPYnWPGctmsP
	OLzryXWJwFsW2RDS00uFb8konnXaerpl0eZrM9aOAGoENpD309lgD49HPLOI2QO+0oUuL2yXQtN
	n9n3X5QBqUkD/IC9y6f8nOF5DzyS4ZENgIEqe0sUXZfJthhaiN5a5ckgTLOfM6jQk6CrvZ5OAl4
	LTz9Kgw3LI0rp4E7TZaEG/yHrWTaVPX1IaMHiS4jF550BDwh/zbMYdcnjkuRveu3Ic1CsVv9w3G
	yP/MeSORiV01CeL7rw1ObwlezlEQAgYDAZ4j3mdU/psOe5xAxo5yXnsrJjv1US24BySWyVqxVc1
	kAgbFkKpVOQ5w==
X-Received: by 2002:a05:600c:4a12:b0:488:aac9:7a31 with SMTP id 5b1f17b1804b1-488cd23f39fmr201037065e9.0.1776182678527;
        Tue, 14 Apr 2026 09:04:38 -0700 (PDT)
Message-ID: <76ea5954-89cd-47a4-872a-239bbc08b785@gmail.com>
Date: Tue, 14 Apr 2026 18:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/27] xen/riscv: emulate guest writes to virtual APLIC
 MMIO
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
 <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
 <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776182679-ACD30CD1-EDAE375D/10/73395122804
X-purgate-type: spam
X-purgate-size: 12136
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 873D53FC4F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 4:18 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -20,6 +20,16 @@
>>   
>>   #include "aplic-priv.h"
>>   
>> +#define APLIC_REG_GET(addr, offset) \
>> +    readl((void *)((vaddr_t)(addr) + offset))
>> +#define APLIC_REG_SET(addr, offset, value) \
>> +    writel(value, (void *)((vaddr_t)(addr) + offset))
> 
> Why is addr properly parenthesized, but offset isn't?

Overlooked that. Will fix.

> 
>> +#define AUTH_IRQ_BIT(irqnum) (auth_irq_bmp[(irqnum) / APLIC_NUM_REGS] & \
>> +                              BIT((irqnum) % APLIC_NUM_REGS, U))
>> +
>> +#define regval_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
> 
> I'm trying to make sense of the division here, but I think the main issue
> is with naming: It's not a "register value" which is passed into here, but
> a register index (offset from a range's base register).

register index would be clearer. I will rename s/regval/regindx.
> 
>> @@ -127,6 +137,164 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>>       return 0;
>>   }
>>   
>> +static void vaplic_dm_update_target(const unsigned long hart_id, uint32_t *iprio)
>> +{
>> +    *iprio &= APLIC_TARGET_IPRIO_MASK;
>> +    *iprio |= (hart_id << APLIC_TARGET_HART_IDX_SHIFT);
>> +}
>> +
>> +static void vaplic_update_target(const struct imsic_config *imsic,
>> +                                 const int guest_id,
>> +                                 const unsigned long hart_id, uint32_t *value)
>> +{
>> +    unsigned long group_index;
>> +    unsigned int hhxw = imsic->group_index_bits;
>> +    unsigned int lhxw = imsic->hart_index_bits;
>> +    unsigned int hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>> +    unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>> +
>> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
> 
> And there's no constant available to make this literal 12 more descriptive?

As it was used in aplic_set_irq_affinity() - IMSIC_MMIO_PAGE_SHIFT could 
be used here.

> 
>> +    *value &= APLIC_TARGET_EIID_MASK;
>> +    *value |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
>> +    *value |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
>> +    *value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
>> +}
> 
> Both functions returning void right now, why would they need to return their
> result via indirection?

No specific reason. Do you think it would be better just to return value 
instead? I am okay to rework that.

> 
>> +#define CALC_REG_VALUE(base) \
>> +{ \
>> +    uint32_t index; \
>> +    uint32_t tmp_val; \
> 
> Combine these two, or have the variables have initializers?
> 
>> +    index = regval_to_irqn(offset - base); \
> 
> There's no "offset" declared or passed into here, nor ...
> 
>> +    tmp_val = APLIC_REG_GET(priv->regs, aplic_addr) & ~auth_irq_bmp[index]; \
> 
> ... "priv", nor ...
> 
>> +    value &= auth_irq_bmp[index]; \
>> +    value |= tmp_val; \
> 
> ... "value". It may remain like this, but then it wants putting inside the
> sole function that uses it, and be #undef-ed at the end of the function.
> 
>> +}
> 
> Please wrap in do/while(0), for use sites to be required to have semicolons
> (and hence look like normal statements). Or make it a statement expression
> properly returning the calculated value.

I will put the following inside the function + undef at the end:

#define CALC_REG_VALUE(base) do {                               \ 
                                   \
     uint32_t index = regindx_to_irqn(offset - (base));          \
     uint32_t tmp_val = APLIC_REG_GET(priv->regs, aplic_addr) &  \
                        ~auth_irq_bmp[index];                    \
     value &= auth_irq_bmp[index];                               \
     value |= tmp_val;                                           \
} while ( 0 )

> 
>> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
>> +                                         unsigned long addr, uint32_t value)
>> +{
>> +    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>> +    struct aplic_priv *priv = vaplic->base.info->private;
>> +    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;
> 
> See ./CODING_STYLE as to uses of fixed-width types.
> 
>> +    unsigned long aplic_addr = addr - priv->paddr_start;
>> +    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> 
> And (taking this just as example) any misaligned accesses falling in this range
> are fine?

Do you mean something like 0x1C02 instead of 0x1C00 or 0x1C04? If yes, 
then I don't think. I will add the following between switch():
     if ( offset & 3 )
     {
         gdprintk(XENLOG_WARNING, "Misaligned APLIC access at offset %#x\n",
                  offset);
         return -EINVAL;
     }

> 
>> +        CALC_REG_VALUE(APLIC_SETIP_BASE);
>> +        break;
>> +
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +        CALC_REG_VALUE(APLIC_CLRIP_BASE);
>> +        break;
>> +
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +        CALC_REG_VALUE(APLIC_SETIE_BASE);
>> +        break;
>> +
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +        CALC_REG_VALUE(APLIC_CLRIE_BASE);
>> +        break;
>> +
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        /* We don't suppert delagation, so bit10 if sourcecfg should be 0 */
>> +        ASSERT(!(value & BIT(10, U)));
> 
> And that bit doesn't have a proper #define?

No, at the moment, I will add:
  #define APLIC_SOURCECFG_D   BIT(10, U) to aplic.h.
> 
>> +        /*
>> +         * As sourcecfg register starts from 1:
>> +         *   0x0000 domaincfg
>> +         *   0x0004 sourcecfg[1]
>> +         *   0x0008 sourcecfg[2]
>> +         *    ...
>> +         *   0x0FFC sourcecfg[1023]
>> +         * It is necessary to calculate an interrupt number by substracting
> 
> Nit: subtracting
> 
>> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
>> +            /* interrupt not enabled, ignore it */
> 
> Throughout the series: Please adhere to ./CODING_STYLE.
> 
>> +            return 0;
>> +
>> +        break;
> 
> And any value is okay to write?

No, it should be in a range 
[APLIC_SOURCECFG_SM_INACTIVE,APLIC_SOURCECFG_SM_LEVEL_LOW].

I will add the check before break:
         if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
         {
             gdprintk(XENLOG_WARNING,
                      "value(%u) is incorrect for sourcecfg register\n", 
value);
             value = APLIC_SOURCECFG_SM_INACTIVE;
         }

> 
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +        struct vcpu *target_vcpu = NULL;
>> +
>> +        /*
>> +         * Look at vaplic_emulate_load() for explanation why
>> +         * APLIC_GENMSI is substracted.
>> +         */
> 
> There's no vaplic_emulate_load() - how can I go look there?

It is introduced in the next patch.

> 
> Also same typo again as above.
> 
>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
>> +            /* interrupt not enabled, ignore it */
>> +            return 0;
>> +
>> +        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )
> 
> unsigned int
> 
>> +        {
>> +            struct vcpu *v = vcpu->domain->vcpu[i];
>> +
>> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
>> +            {
>> +                target_vcpu = v;
>> +                break;
>> +            }
>> +        }
>> +
>> +        ASSERT(target_vcpu);
> 
> What guarantees the pointer to be non-NULL? The incoming value can be
> arbitrary, afaict.

I didn't understand your point. It is just checking that target_vcpu has 
been found. If after for() loop the value of target_vcpu is still NULL 
then something wrong in Xen.

> 
>> +        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
>> +        {
>> +            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
>> +                                    &value);
>> +        }
>> +        else
>> +            vaplic_update_target(priv->imsic_cfg,
>> +                                 vcpu_guest_file_id(target_vcpu),
>> +                                 cpuid_to_hartid(target_vcpu->processor),
>> +                                 &value);
> 
> I'm struggling with the naming here: When DM is clear, a function with "dm"
> in the name is called.

it means direct (delivery) mode. Maybe it is better to put dm at the end 
of the function name? Or it is just better to change it to something else?

> 
> For the latter one, unless other uses are intended speaking against that,
> instead of the middle two arguments simply pass target_vcpu?

Good point. I will update the function accordingly.

> 
> Also please omit the braces consistently from both branches.
> 
>> +        break;
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
> 
> What about APLIC_SETIPNUM_BE?
> 
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +        if ( AUTH_IRQ_BIT(value) )
>> +            break;
> 
> Aren't you easily overrunning auth_irq_bmp[] here?

It makes sense to add instead:
         if ( !value || value >= APLIC_NUM_REGS * APLIC_NUM_REGS ||
              !AUTH_IRQ_BIT(value) )
             return 0;
         break;

> 
>> +        return 0;
>> +
>> +    case APLIC_DOMAINCFG:
>> +        /*
>> +         * TODO:
>> +         * The domaincfg register has this format:
>> +         * bits 31:24 read-only 0x80
>> +         * bit 8      IE
>> +         * bit 7      read-only 0
>> +         * bit 2      DM (WARL)
>> +         * bit 0      BE (WARL)
>> +         *
>> +         * The most interesting bit for us is IE(Interrupt Enable) bit.
>> +         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
>> +         * disable interrupts globally, but if one day someone will use it
>> +         * then extra actions should be done.
>> +         */
>> +
>> +        printk_once("%s: Nothing to do, domaincfg is set by aplic during "
>> +                    "initialization in Xen\n", __func__);
> 
> As per the comment it's not "nothing to do", but your choice to ignore writes
> even if they may be relevant.

I will change "Nothing to do" to "Ignore writes to".

> 
>> +        return 0;
>> +
>> +    default:
>> +        panic("%s: unsupported register offset: %#x\n", __func__, offset);
> 
> Crashing the host for the guest doing something odd? It's odd that the function
> only ever returns 0 anyway - it could simply return an error here (if the
> itention is to not ignore such writes).

But maybe it is a legal offset and we really want to support it?

Even if I will return just error then a caller site will want to do 
something with this error -> for example, kill domain or panic() again. 
Maybe panic is to much and just domain should be crashed here:

default:
     gdprintk(XENLOG_WARNING,
              "Unhandled APLIC write at offset %#x (value %#x)\n",
              offset, value);
     domain_crash(vcpu->domain);
     return 0;
?

> 
> As it's not clear what values other than zero such a function may return, I
> also can't comment on its (and the hook's) return type (may want to be bool
> instead of int).

Maybe, it makes sense to switch to bool. As I mentioned above I'm 
returning -EINVAL in some cases. But it could be really just return 1 
instead. Here:
     if ( offset & 3 )
     {
         gdprintk(XENLOG_WARNING, "Misaligned APLIC access at offset %#x\n",
                  offset);
         return -EINVAL;
     }

Thanks.

~ Oleksii

