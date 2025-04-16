Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ECA90BEC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 21:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956533.1349914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u584c-00069c-Sn; Wed, 16 Apr 2025 19:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956533.1349914; Wed, 16 Apr 2025 19:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u584c-00067H-NL; Wed, 16 Apr 2025 19:05:26 +0000
Received: by outflank-mailman (input) for mailman id 956533;
 Wed, 16 Apr 2025 19:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Wc4=XC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u584a-00067B-Bt
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 19:05:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd253fe3-1af5-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 21:05:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so1178958666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 12:05:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d1b463csm178027566b.146.2025.04.16.12.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 12:05:17 -0700 (PDT)
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
X-Inumbo-ID: bd253fe3-1af5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744830319; x=1745435119; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6t//aqjEYttnH4Qx86wmujAM4C/jvKc1ymRVlUpPlk=;
        b=XjVdqwqT9ABKtYsnJ4+//zaUn1igk+kN2QMogOg+324OB1lZSL0tCwPSq4AYL5AK5f
         OKSWPrL2qtKU0Y3qMZJCHAIzv9AwUGnLXJ1z/RPSXSc9+w3QEKwUzqyQZf+7DfO0DZv1
         tDM05tWfre+Q7ASAIqzSdoAYSDREzJDnglAqGJzSy/TCAIabpuOPYLuc7kyohUtMEhpN
         OkTGr00K4ba5TtRvTVpkzaPVP8qWZZ1pJxn/29RPq49jM8slCD0+X9vMkg6cNn0zcVHr
         IdN0pduuFTtUh6aZbUvETefY4jWjvHscQxpYNm/UE5JjvRFI23o1WavVK0AApuslGIcW
         /RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744830319; x=1745435119;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6t//aqjEYttnH4Qx86wmujAM4C/jvKc1ymRVlUpPlk=;
        b=AiWdOHfddZyKPYcx2cN7aEuAfdjRYEJ+B5Yt2fXlxcbj4GVGsNH9Y9YUd+sJmLJS1E
         CtcVyPpFJmEKS2kpD+uteVprIZYHzFd7NRFuYV5OWXIxZizP6rST6iemK639VWJfGM4O
         0UP8OQjHKhUDioBTVfEKIhDhs9RvA/5ZaXSIgzlPs0PDTSC0Hc0e3u1IoBcngN02kZPc
         +xbxFQsW6G3+kxZ8nDtRzm8p2tB+hlwD4wnjeTLivCB0FxcUqAmNfpIbwIsBnbmImErP
         d8ZtJJ5w6k7oZQ8EV4J/OACwLA27ZA8+UJjlDmo3eDaP7au8TKsiOgCbjXfdmBT0uWDz
         A5RA==
X-Forwarded-Encrypted: i=1; AJvYcCUtPMNc5UOe+F9KuF668AC3aJqSRUuCzG3HomkXlMXuXrkQU2u5sIJuboCIGn72P9mjihPIRBsAXTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Z8/xmMB9w3m//osJa0NRRYuHVAHr8JoCb9tnRbLkwgLGf7O6
	okAivgjM0IeEOVcneBfFEKTf7LHZNTiYM/aBPmLp7+HgShOg3zRM
X-Gm-Gg: ASbGnct2BowyzoEqzO8f1LDNdKpJsi3j2OSCbC/osSH/0ObVN3MlyE4/mybD15gwPEF
	kf+hY+KvK5qlq5/zMFnDefJ+fePN4fKusl8hRRbGMLiUcvbdA/J68oiNWT/K/FfpcVhuk9g/jpZ
	HM9S3JaBPxZGmic8R8XgoSCc61K0uvYqnNzPlVMn6umsHS+3BzJk9lBLcI6ibgRETVdnrtcP+9B
	eqaqv5fa4yPYrXJXed8thzIkV/dRw/AeJzlCXoqNNZhWVOPR12wDcUKAOx8Wqe6+JeOA8k8ZNUP
	qWqxYJPYki32aNqFqPm/knoW4/8zLNQfYbYkTdwd/yEaucyobxx9jfFM8RzLVBj3330AAGPlEKx
	w1ypi63iLfGsaNN5r
X-Google-Smtp-Source: AGHT+IEtQqgzlyLh02lb6WbNbKDVAFS5bEuqgLNYgixLN0BH64wHdCoWupQvTsLY+DAJmu0khQDUzA==
X-Received: by 2002:a17:907:7246:b0:acb:3a0d:852c with SMTP id a640c23a62f3a-acb42aee723mr239861766b.38.1744830318261;
        Wed, 16 Apr 2025 12:05:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------pweA2rQvh53q8HL5NREf4qtQ"
Message-ID: <9bee5d4e-cad1-4fc1-8b4c-b4a4bab4b76c@gmail.com>
Date: Wed, 16 Apr 2025 21:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com>

This is a multi-part message in MIME format.
--------------pweA2rQvh53q8HL5NREf4qtQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/15/25 2:46 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> Introduce interrupt controller descriptor for host APLIC to describe
>> the low-lovel hardare. It includes implementation of the following functions:
>>   - aplic_irq_startup()
>>   - aplic_irq_shutdown()
>>   - aplic_irq_enable()
>>   - aplic_irq_disable()
>>   - aplic_irq_ack()
>>   - aplic_host_irq_end()
>>   - aplic_set_irq_affinity()
>>
>> As APLIC is used in MSI mode it requires to enable/disable interrupts not
>> only for APLIC but also for IMSIC. Thereby for the purpose of
>> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
>>
>> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
>> introduced to get hart id.
>>
>> Also, introduce additional interrupt controller h/w operations and
>> host_irq_type for APLIC:
>>   - aplic_host_irq_type
>>   - aplic_set_irq_priority()
>>   - aplic_set_irq_type()
> Yet these two functions nor the hooks they're used to populate are entirely
> unused here. Since they're also outside of the common IRQ handling machinery,
> it's unclear how one would sanely ack such a change.

They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
the IRQ is setup.

>
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -15,6 +15,7 @@
>>   #include <xen/irq.h>
>>   #include <xen/mm.h>
>>   #include <xen/sections.h>
>> +#include <xen/spinlock.h>
>>   #include <xen/types.h>
>>   #include <xen/vmap.h>
>>   
>> @@ -110,9 +111,173 @@ static int __init aplic_init(void)
>>       return 0;
>>   }
>>   
>> -static const struct intc_hw_operations __ro_after_init aplic_ops = {
>> +static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
>> +{
>> +    unsigned int irq = desc->irq - 1;
> Why this adjustment by 1 (and yet both items being named "irq")?

Interrupt 0 isn't possible based on the spec:
```
Each of an APLIC’s interrupt sources has a fixed unique identity number 
in the range 1 to N, where N is the total number of sources at the 
APLIC. The number zero is not a valid interrupt identity number at an 
APLIC. The maximum number of interrupt sources an APLIC may support is 
1023. ``` and interrupt 1 will correspond to bit 0 in sourcecfg[] register, interrupt 
2 ->sourcecfg[1] and so on. And that is the reason why we need -1.

>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
>> +            break;
>> +        case IRQ_TYPE_LEVEL_HIGH:
>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
>> +            break;
>> +        case IRQ_TYPE_LEVEL_LOW:
>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
>> +            break;
>> +        default:
>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
>> +            break;
> Is the default: label legitimate to be reached?

 From the spec:
```
0 Inactive Inactive in this domain (and not delegated) 1 Detached 
Active, detached from the source wire 2–3 — Reserved 4 Edge1 Active, 
edge-sensitive; interrupt asserted on rising edge 5 Edge0 Active, 
edge-sensitive; interrupt asserted on falling edge 6 Level1 Active, 
level-sensitive; interrupt asserted when high 7 Level0 Active, 
level-sensitive; interrupt asserted when low ``` It seems to me like 
APLIC_SOURCECFG_SM_INACTIVE just covers cases (0-3) and inactive IRQ 
pretty safe to as a default value.

>
>> +    }
>> +    spin_unlock(&aplic.lock);
>> +}
>> +
>> +static void aplic_set_irq_priority(struct irq_desc *desc,
>> +                                   unsigned int priority)
>> +{
>> +    /* No priority, do nothing */
>> +}
> Since the function dopes nothing, wouldn't it be better to omit it and have
> the (future) caller check for a NULL pointer ahead of making the (indirect)
> call? Same remark for other handlers (below) which also do nothing.

I thought about that too, but it could be some cases when the stub is introduced
with temporary BUG_ON("unimplemented") inside just to not miss to implement it
when it will be necessary.
If we will have only the caller check then we could miss to implement such stubs.

>
>> +static void aplic_irq_enable(struct irq_desc *desc)
>> +{
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>> +     *       If APLIC without MSI interrupts is required in the future,
>> +     *       this function will need to be updated accordingly.
>> +     */
>> +    ASSERT(aplic.imsic_cfg->is_used);
> Such an extra field, used only for assertions, is pretty odd. Can't you
> use any of the other fields to achieve the same effect?

in aplic_init() there is:
     /* check for associated imsic node */
     rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
     if ( !rc )
         panic("%s: IDC mode not supported\n", node->full_name);

So we will have panic() anyway if MSI mode isn't supported. As an option we
can just drop the ASSERT.

Or introduce static variable in aplic.c `aplic_mode`, init it in aplic_init()
and use it in ASSERT().

>
>> +    ASSERT(spin_is_locked(&desc->lock));
> If this lock (which is an IRQ-safe one) is necessarily held, ...
>
>> +    spin_lock_irqsave(&aplic.lock, flags);
> ... you can use just spin_lock() here.
>
>> +    clear_bit(_IRQ_DISABLED, &desc->status);
> Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
> question on Arm code also doing so.)

I haven't thought about that. Likely non-atomic bitop could be used here.

>
> I'm uncertain about this bit setting anyway - on x86 we would only fiddle
> with it for IRQs not in use, not while enabling/disabling one.
>
> In any event this can be done outside of the APLIC-locked region, I think.

Considering that we are doing that under desc->lock, agree we can move that outside
the APLIC-locked region.

>> +    imsic_irq_enable(desc->irq);
>> +
>> +    /* enable interrupt in APLIC */
>> +    aplic.regs->setienum = desc->irq;
> Are you sure you want to use plain assignments for MMIO accesses? I'd have
> expected writel() to be used here. (And only later I realized that I didn't
> spot the same already higher up from here.)

Good point. I have to update that with writel()...

>
>  From the vague understanding I've gained so far: Isn't the APLIC closer to
> the CPU and the IMSIC closer to the device? If so, wouldn't you want to
> enable at the APLIC before enabling at the IMSIC? But of course that also
> depends on what exactly happens in the window while one is already enabled
> and the other is still disabled. (Later) From the code you add to imsic.c
> it looks like it's the other way around, as the IMSIC is accessed through
> CSRs.

 From the AIA spec:
```
An Incoming MSI Controller (IMSIC) is an optional RISC-V hardware component
that is closely coupled with a hart, one IMSIC per hart. An IMSIC receives
and records incoming message-signaled interrupts (MSIs) for a hart, and
signals to the hart when there are pending and enabled interrupts to be
serviced.
```

Based on the figure 2 (Interrupt delivery by MSIs when harts have IMSICs for receiving them)
of AIA spechttps://github.com/riscv/riscv-aia/blob/main/src/intrsWithIMSICs.png
IMSIC is more close to CPU and APLIC is more close to the device. The external interrupt
controller is APLIC and it only sends a MSI message for a CPU.

The logical flow of an interrupt to a hart with an IMSIC would be:
1. A physical interrupt signal arrives at the APLIC.
2. The APLIC, if configured for MSI delivery mode (domaincfg.DM = 1) and if the specific
    interrupt source is active and enabled within its domain (controlled by sourcecfg[i]
    and the global Interrupt Enable bit IE in domaincfg), will generate an MSI.
3. This MSI is then sent to the target hart's IMSIC. The APLIC needs to know the MSI
    target address for each hart, which can be hardwired or configured through registers
    like mmsiaddrcfg and mmsiaddrcfgh.
4. The receiving hart's IMSIC records this MSI as a pending interrupt.
5. If the corresponding interrupt identity is enabled within the IMSIC's interrupt file,
    the IMSIC will signal the hart, typically by setting the MEIP or SEIP bit in the mip
    CSR (or sip CSR).

Generally, I think that the order in which enable interrupts doesn't really matter as
if you were to enable the IMSIC to receive a certain interrupt before the APLIC was
configured to send it (or had a pending interrupt from the device), the IMSIC would
simply be waiting for an MSI that wouldn't arrive.
Similarly, if the APLIC sends an MSI for an interrupt that is not enabled in the IMSIC,
the interrupt would remain pending in the IMSIC but wouldn't trigger an interrupt at
the hart.

IMO, the order which is used now in the code is pretty logical.

Does it make sense?

>
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +}
>> +
>> +static void aplic_irq_disable(struct irq_desc *desc)
>> +{
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>> +     *       If APLIC without MSI interrupts is required in the future,
>> +     *       this function will need to be updated accordingly.
>> +     */
>> +    ASSERT(aplic.imsic_cfg->is_used);
>> +
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +
>> +    set_bit(_IRQ_DISABLED, &desc->status);
>> +
>> +    /* disable interrupt in APLIC */
>> +    aplic.regs->clrienum = desc->irq;
>> +
>> +    /* disable interrupt in IMSIC */
>> +    imsic_irq_disable(desc->irq);
>> +
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +}
>> +
>> +static unsigned int aplic_irq_startup(struct irq_desc *desc)
>> +{
>> +    aplic_irq_enable(desc);
>> +
>> +    return 0;
>> +}
>> +
>> +static void aplic_irq_shutdown(struct irq_desc *desc)
>> +{
>> +    aplic_irq_disable(desc);
>> +}
> You don't really need a separate hook function here, do you?

With such implementation it is really not needed to have a hook so
I will drop it.

>> +static void aplic_irq_ack(struct irq_desc *desc)
>> +{
>> +    /* nothing to do */
>> +}
>> +
>> +static void aplic_host_irq_end(struct irq_desc *desc)
> What's the "host" in the identifier about?

It was copied that from Arm and my understanding that it means
Xen-related IRQ as they also have:
```
/* XXX different for level vs edge */
static hw_irq_controller gicv2_host_irq_type = {
...
     .end          = gicv2_host_irq_end,
...
};

static hw_irq_controller gicv2_guest_irq_type = {
...
     .end          = gicv2_guest_irq_end,
...
};
```


>
>> +{
>> +    /* nothing to do */
>> +}
>> +
>> +static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
>> +{
>> +    unsigned int cpu;
> No real need for this variable?

Yes, it could be dropped.

>
>> +    cpumask_t possible_mask;
>> +
>> +    cpumask_and(&possible_mask, cpumask, &cpu_possible_map);
>> +    cpu = cpumask_any(&possible_mask);
> Why would you use cpu_possible_map here? That includes any offline CPUs.
> I think you need to use cpu_online_map here.

It makes sense, Ill switch to cpu_online_map.

>
>> +    return cpu;
>> +}
>> +
>> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>> +{
>> +    unsigned int cpu;
>> +    uint64_t group_index, base_ppn;
>> +    uint32_t hhxw, lhxw ,hhxs, value;
>> +    const struct imsic_config *imsic = aplic.imsic_cfg;
>> +
>> +    /*
>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>> +     *       If APLIC without MSI interrupts is required in the future,
>> +     *       this function will need to be updated accordingly.
>> +     */
>> +    ASSERT(aplic.imsic_cfg->is_used);
> Use the local variable you have made yourself?

What do you mean by local here?

>
>> +    ASSERT(!cpumask_empty(mask));
>> +
>> +    spin_lock(&aplic.lock);
> Aiui the lock can be acquired quite a bit later. It ought to be needed only
> around the actual write to the hardware register.
>
>> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>> +    hhxw = imsic->group_index_bits;
>> +    lhxw = imsic->hart_index_bits;
>> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>> +
>> +    /* update hart and EEID in the target register */
>> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
> What's this magic 12 in here? Not IMSIC_MMIO_PAGE_SHIFT I suppose?

In the AIA spec they are using 12 explicitly:https://github.com/riscv/riscv-aia/blob/main/src/AdvPLIC.adoc#AdvPLIC-MSIAddrs

>> +    unsigned long id = base_id, last_id = base_id + num_id;
>> +
>> +    while ( id < last_id )
>> +    {
>> +        isel = id / __riscv_xlen;
>> +        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
>> +        isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
> Nit: Why the parentheses?
>
>> +        ireg = 0;
>> +        for ( i = id & (__riscv_xlen - 1);
>> +              (id < last_id) && (i < __riscv_xlen);
>> +              i++, id++ )
>> +            ireg |= (1 << i);
> I wonder if this calculation really needs a loop. Afaict it's just a
> consecutive set of bits you mean to set.

Good point. I will double-check.

>
>> +        if ( val )
>> +            imsic_csr_set(isel, ireg);
>> +        else
>> +            imsic_csr_clear(isel, ireg);
>> +    }
>> +}
>> +
>> +void imsic_irq_enable(unsigned int hwirq)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
>> +    imsic_local_eix_update(hwirq, 1, false, true);
> No subtraction of 1 here? Also, why "hwirq" and not just "irq"?

 From the spec:
```

When an interrupt file supports distinct interrupt identities, valid identity numbers are between 1
and inclusive. The identity numbers within this range are said to be implemented by the interrupt
file; numbers outside this range are not implemented. The number zero is never a valid interrupt
identity.
...

Bit positions in a valid eiek register that don’t correspond to a 
supported interrupt identity (such as bit 0 of eie0) are read-only zeros.


```

So in EIx registers interrupt i corresponds to bit i in comparison wiht APLIC's sourcecfg which starts from 0.

>
>> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
>> +}
>> +
>> +void imsic_irq_disable(unsigned int hwirq)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
>> +    imsic_local_eix_update(hwirq, 1, false, false);
>> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
>> +}
>> +
>>   const struct imsic_config *imsic_get_config(void)
>>   {
>>       return &imsic_cfg;
>> @@ -277,6 +333,13 @@ int __init imsic_init(struct dt_device_node *node)
>>           goto imsic_init_err;
>>       }
>>   
>> +    spin_lock_init(&imsic_cfg.lock);
>> +
>> +    /* Enable local interrupt delivery */
>> +    imsic_ids_local_delivery(true);
> What's this? I can't find the function/macro here, nor in patch 08, nor in
> staging.

It is defined in imsic.c:
```
void imsic_ids_local_delivery(bool enable)
{
     if ( enable )
     {
         imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
         imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
     }
     else
     {
         imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
         imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
     }
}
```

Thanks for review.

~ Oleksii

--------------pweA2rQvh53q8HL5NREf4qtQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/15/25 2:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce interrupt controller descriptor for host APLIC to describe
the low-lovel hardare. It includes implementation of the following functions:
 - aplic_irq_startup()
 - aplic_irq_shutdown()
 - aplic_irq_enable()
 - aplic_irq_disable()
 - aplic_irq_ack()
 - aplic_host_irq_end()
 - aplic_set_irq_affinity()

As APLIC is used in MSI mode it requires to enable/disable interrupts not
only for APLIC but also for IMSIC. Thereby for the purpose of
aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().

For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
introduced to get hart id.

Also, introduce additional interrupt controller h/w operations and
host_irq_type for APLIC:
 - aplic_host_irq_type
 - aplic_set_irq_priority()
 - aplic_set_irq_type()
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet these two functions nor the hooks they're used to populate are entirely
unused here. Since they're also outside of the common IRQ handling machinery,
it's unclear how one would sanely ack such a change.</pre>
    </blockquote>
    <pre>They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
the IRQ is setup.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -15,6 +15,7 @@
 #include &lt;xen/irq.h&gt;
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/sections.h&gt;
+#include &lt;xen/spinlock.h&gt;
 #include &lt;xen/types.h&gt;
 #include &lt;xen/vmap.h&gt;
 
@@ -110,9 +111,173 @@ static int __init aplic_init(void)
     return 0;
 }
 
-static const struct intc_hw_operations __ro_after_init aplic_ops = {
+static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    unsigned int irq = desc-&gt;irq - 1;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why this adjustment by 1 (and yet both items being named "irq")?</pre>
    </blockquote>
    <pre>Interrupt 0 isn't possible based on the spec:
```
<span data-teams="true">Each of an APLIC’s interrupt sources has a fixed unique identity number in the range 1 to N,
where N is the total number of sources at the APLIC. The number zero is not a valid interrupt
identity number at an APLIC. The maximum number of interrupt sources an APLIC may support
is 1023.
```
and</span> <span class="Y2IQFc" lang="en">interrupt 1 will correspond to bit 0 in sourcecfg[] register,
interrupt 2 -&gt;sourcecfg[1] and so on.</span> And that is the reason why we need -1.
</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            aplic.regs-&gt;sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
+            break;
+        case IRQ_TYPE_LEVEL_HIGH:
+            aplic.regs-&gt;sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
+            break;
+        case IRQ_TYPE_LEVEL_LOW:
+            aplic.regs-&gt;sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
+            break;
+        default:
+            aplic.regs-&gt;sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
+            break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is the default: label legitimate to be reached?</pre>
    </blockquote>
    <pre>From the spec:
```
<span data-teams="true">0 Inactive Inactive in this domain (and not delegated)
1 Detached Active, detached from the source wire
2–3 — Reserved
4 Edge1 Active, edge-sensitive; interrupt asserted on rising edge
5 Edge0 Active, edge-sensitive; interrupt asserted on falling edge
6 Level1 Active, level-sensitive; interrupt asserted when high
7 Level0 Active, level-sensitive; interrupt asserted when low
```

It seems to me like </span><span data-teams="true">APLIC_SOURCECFG_SM_INACTIVE just covers cases (0-3) and inactive
IRQ pretty safe to as a default value.</span></pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+    spin_unlock(&amp;aplic.lock);
+}
+
+static void aplic_set_irq_priority(struct irq_desc *desc,
+                                   unsigned int priority)
+{
+    /* No priority, do nothing */
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since the function dopes nothing, wouldn't it be better to omit it and have
the (future) caller check for a NULL pointer ahead of making the (indirect)
call? Same remark for other handlers (below) which also do nothing.</pre>
    </blockquote>
    <pre>I thought about that too, but it could be some cases when the stub is introduced
with temporary BUG_ON("unimplemented") inside just to not miss to implement it
when it will be necessary.
If we will have only the caller check then we could miss to implement such stubs.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void aplic_irq_enable(struct irq_desc *desc)
+{
+    unsigned long flags;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(aplic.imsic_cfg-&gt;is_used);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Such an extra field, used only for assertions, is pretty odd. Can't you
use any of the other fields to achieve the same effect?</pre>
    </blockquote>
    <pre>in aplic_init() there is:
    /* check for associated imsic node */
    rc = dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle);
    if ( !rc )
        panic("%s: IDC mode not supported\n", node-&gt;full_name);

So we will have panic() anyway if MSI mode isn't supported. As an option we
can just drop the ASSERT.

Or introduce static variable in aplic.c `aplic_mode`, init it in aplic_init()
and use it in ASSERT().
</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If this lock (which is an IRQ-safe one) is necessarily held, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    spin_lock_irqsave(&amp;aplic.lock, flags);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... you can use just spin_lock() here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    clear_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
question on Arm code also doing so.)</pre>
    </blockquote>
    <pre>I haven't thought about that. Likely non-atomic bitop could be used here.
</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

I'm uncertain about this bit setting anyway - on x86 we would only fiddle
with it for IRQs not in use, not while enabling/disabling one.

In any event this can be done outside of the APLIC-locked region, I think.</pre>
    </blockquote>
    <pre>Considering that we are doing that under desc-&gt;lock, agree we can move that outside
the APLIC-locked region.
</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    imsic_irq_enable(desc-&gt;irq);
+
+    /* enable interrupt in APLIC */
+    aplic.regs-&gt;setienum = desc-&gt;irq;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are you sure you want to use plain assignments for MMIO accesses? I'd have
expected writel() to be used here. (And only later I realized that I didn't
spot the same already higher up from here.)</pre>
    </blockquote>
    <pre>Good point. I have to update that with writel()...</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

From the vague understanding I've gained so far: Isn't the APLIC closer to
the CPU and the IMSIC closer to the device? If so, wouldn't you want to
enable at the APLIC before enabling at the IMSIC? But of course that also
depends on what exactly happens in the window while one is already enabled
and the other is still disabled. (Later) From the code you add to imsic.c
it looks like it's the other way around, as the IMSIC is accessed through
CSRs.</pre>
    </blockquote>
    <pre>From the AIA spec:
```
An Incoming MSI Controller (IMSIC) is an optional RISC-V hardware component
that is closely coupled with a hart, one IMSIC per hart. An IMSIC receives
and records incoming message-signaled interrupts (MSIs) for a hart, and
signals to the hart when there are pending and enabled interrupts to be
serviced.
```

Based on the figure 2 (Interrupt delivery by MSIs when harts have IMSICs for receiving them)
of AIA spec <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-aia/blob/main/src/intrsWithIMSICs.png">https://github.com/riscv/riscv-aia/blob/main/src/intrsWithIMSICs.png</a>
IMSIC is more close to CPU and APLIC is more close to the device. The external interrupt
controller is APLIC and it only sends a MSI message for a CPU.

The logical flow of an interrupt to a hart with an IMSIC would be:
1. A physical interrupt signal arrives at the APLIC.
2. The APLIC, if configured for MSI delivery mode (domaincfg.DM = 1) and if the specific
   interrupt source is active and enabled within its domain (controlled by sourcecfg[i]
   and the global Interrupt Enable bit IE in domaincfg), will generate an MSI.
3. This MSI is then sent to the target hart's IMSIC. The APLIC needs to know the MSI
   target address for each hart, which can be hardwired or configured through registers
   like mmsiaddrcfg and mmsiaddrcfgh.
4. The receiving hart's IMSIC records this MSI as a pending interrupt.
5. If the corresponding interrupt identity is enabled within the IMSIC's interrupt file,
   the IMSIC will signal the hart, typically by setting the MEIP or SEIP bit in the mip
   CSR (or sip CSR).

Generally, I think that the order in which enable interrupts doesn't really matter as
if you were to enable the IMSIC to receive a certain interrupt before the APLIC was
configured to send it (or had a pending interrupt from the device), the IMSIC would
simply be waiting for an MSI that wouldn't arrive.
Similarly, if the APLIC sends an MSI for an interrupt that is not enabled in the IMSIC,
the interrupt would remain pending in the IMSIC but wouldn't trigger an interrupt at
the hart.

IMO, the order which is used now in the code is pretty logical.

Does it make sense?
</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    spin_unlock_irqrestore(&amp;aplic.lock, flags);
+}
+
+static void aplic_irq_disable(struct irq_desc *desc)
+{
+    unsigned long flags;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(aplic.imsic_cfg-&gt;is_used);
+
+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
+
+    spin_lock_irqsave(&amp;aplic.lock, flags);
+
+    set_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
+
+    /* disable interrupt in APLIC */
+    aplic.regs-&gt;clrienum = desc-&gt;irq;
+
+    /* disable interrupt in IMSIC */
+    imsic_irq_disable(desc-&gt;irq);
+
+    spin_unlock_irqrestore(&amp;aplic.lock, flags);
+}
+
+static unsigned int aplic_irq_startup(struct irq_desc *desc)
+{
+    aplic_irq_enable(desc);
+
+    return 0;
+}
+
+static void aplic_irq_shutdown(struct irq_desc *desc)
+{
+    aplic_irq_disable(desc);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You don't really need a separate hook function here, do you?</pre>
    </blockquote>
    <pre>With such implementation it is really not needed to have a hook so
I will drop it.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void aplic_irq_ack(struct irq_desc *desc)
+{
+    /* nothing to do */
+}
+
+static void aplic_host_irq_end(struct irq_desc *desc)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's the "host" in the identifier about?</pre>
    </blockquote>
    <pre>It was copied that from Arm and my understanding that it means
Xen-related IRQ as they also have:
```
/* XXX different for level vs edge */
static hw_irq_controller gicv2_host_irq_type = {
...
    .end          = gicv2_host_irq_end,
...
};

static hw_irq_controller gicv2_guest_irq_type = {
...
    .end          = gicv2_guest_irq_end,
...
};
```


</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    /* nothing to do */
+}
+
+static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
+{
+    unsigned int cpu;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No real need for this variable?</pre>
    </blockquote>
    <pre>Yes, it could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cpumask_t possible_mask;
+
+    cpumask_and(&amp;possible_mask, cpumask, &amp;cpu_possible_map);
+    cpu = cpumask_any(&amp;possible_mask);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would you use cpu_possible_map here? That includes any offline CPUs.
I think you need to use cpu_online_map here.</pre>
    </blockquote>
    <pre>It makes sense, Ill switch to cpu_online_map.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return cpu;
+}
+
+static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
+{
+    unsigned int cpu;
+    uint64_t group_index, base_ppn;
+    uint32_t hhxw, lhxw ,hhxs, value;
+    const struct imsic_config *imsic = aplic.imsic_cfg;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(aplic.imsic_cfg-&gt;is_used);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Use the local variable you have made yourself?</pre>
    </blockquote>
    <pre>What do you mean by local here?

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT(!cpumask_empty(mask));
+
+    spin_lock(&amp;aplic.lock);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Aiui the lock can be acquired quite a bit later. It ought to be needed only
around the actual write to the hardware register.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
+    hhxw = imsic-&gt;group_index_bits;
+    lhxw = imsic-&gt;hart_index_bits;
+    hhxs = imsic-&gt;group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    base_ppn = imsic-&gt;msi[cpu].base_addr &gt;&gt; IMSIC_MMIO_PAGE_SHIFT;
+
+    /* update hart and EEID in the target register */
+    group_index = (base_ppn &gt;&gt; (hhxs + 12)) &amp; (BIT(hhxw, UL) - 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's this magic 12 in here? Not IMSIC_MMIO_PAGE_SHIFT I suppose?</pre>
    </blockquote>
    <pre>In the AIA spec they are using 12 explicitly: <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-aia/blob/main/src/AdvPLIC.adoc#AdvPLIC-MSIAddrs">https://github.com/riscv/riscv-aia/blob/main/src/AdvPLIC.adoc#AdvPLIC-MSIAddrs</a>

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned long id = base_id, last_id = base_id + num_id;
+
+    while ( id &lt; last_id )
+    {
+        isel = id / __riscv_xlen;
+        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+        isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Why the parentheses?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        ireg = 0;
+        for ( i = id &amp; (__riscv_xlen - 1);
+              (id &lt; last_id) &amp;&amp; (i &lt; __riscv_xlen);
+              i++, id++ )
+            ireg |= (1 &lt;&lt; i);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I wonder if this calculation really needs a loop. Afaict it's just a
consecutive set of bits you mean to set.</pre>
    </blockquote>
    <pre>Good point. I will double-check.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( val )
+            imsic_csr_set(isel, ireg);
+        else
+            imsic_csr_clear(isel, ireg);
+    }
+}
+
+void imsic_irq_enable(unsigned int hwirq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&amp;imsic_cfg.lock, flags);
+    imsic_local_eix_update(hwirq, 1, false, true);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No subtraction of 1 here? Also, why "hwirq" and not just "irq"?</pre>
    </blockquote>
    <pre>From the spec:
```

When an interrupt file supports distinct interrupt identities, valid identity numbers are between 1
and inclusive. The identity numbers within this range are said to be implemented by the interrupt
file; numbers outside this range are not implemented. The number zero is never a valid interrupt
identity.
...
<pre><span
style="color: rgb(31, 31, 31); font-family: &quot;Google Sans Text&quot;, &quot;Google Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Bit positions in a valid eiek register that don’t correspond to a supported interrupt identity (such as bit 0 of eie0) are read-only zeros.</span></pre>
```

So in EIx registers interrupt i corresponds to bit i in comparison wiht APLIC's sourcecfg which starts from 0.

</pre>
    <blockquote type="cite"
      cite="mid:35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    spin_unlock_irqrestore(&amp;imsic_cfg.lock, flags);
+}
+
+void imsic_irq_disable(unsigned int hwirq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&amp;imsic_cfg.lock, flags);
+    imsic_local_eix_update(hwirq, 1, false, false);
+    spin_unlock_irqrestore(&amp;imsic_cfg.lock, flags);
+}
+
 const struct imsic_config *imsic_get_config(void)
 {
     return &amp;imsic_cfg;
@@ -277,6 +333,13 @@ int __init imsic_init(struct dt_device_node *node)
         goto imsic_init_err;
     }
 
+    spin_lock_init(&amp;imsic_cfg.lock);
+
+    /* Enable local interrupt delivery */
+    imsic_ids_local_delivery(true);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's this? I can't find the function/macro here, nor in patch 08, nor in
staging.</pre>
    </blockquote>
    <pre>It is defined in imsic.c:
```
void imsic_ids_local_delivery(bool enable)
{
    if ( enable )
    {
        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
    }
    else
    {
        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
    }
}
```

Thanks for review.

~ Oleksii
</pre>
  </body>
</html>

--------------pweA2rQvh53q8HL5NREf4qtQ--

