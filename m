Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F8A9EA64
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970265.1359002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Jb3-00084x-Ok; Mon, 28 Apr 2025 08:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970265.1359002; Mon, 28 Apr 2025 08:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Jb3-000823-LB; Mon, 28 Apr 2025 08:12:13 +0000
Received: by outflank-mailman (input) for mailman id 970265;
 Mon, 28 Apr 2025 08:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVdf=XO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u9Jb1-0007XQ-7V
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:12:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aca9d27-2408-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 10:12:08 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so6997997a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 01:12:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7014007f2sm5441666a12.32.2025.04.28.01.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 01:12:07 -0700 (PDT)
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
X-Inumbo-ID: 7aca9d27-2408-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745827928; x=1746432728; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J6ibBKRANgVt4TzfvTSnuHqDdoSNGXNapQU9emDdJ0=;
        b=gyhHGh7T0uUW78znWOJcCmLmBEF+beHjOkHS7GrmPmsPXxF4adIs0shSARadhHaOnQ
         hk4dDiBwIvBawE7pnxRtWm/Pliv2emaNggT+iLaLk0aVMyeW+EofV2ZOvLwxy+vf5ikI
         6seK+zqxr+pEeGDHx3Xj+3SsK/Z8afD9wFGWTmEV8uD80nZm7qFwwi+ZLgJL9CdkMyfZ
         MEo35OlTrvtfu1Hjzj+JVmoEjuJiENrCvgtIkGiwTyiqyxsvWOQxpQe6+Ngb+d7qiNlg
         eCwY31rEqp+ez1fhS9sQ8Q3z4rCZ3XA1z1upNJggCaPOgq9L6Ef0VTlrHibB1Cqq/CRF
         J2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827928; x=1746432728;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5J6ibBKRANgVt4TzfvTSnuHqDdoSNGXNapQU9emDdJ0=;
        b=uhkHbikLmK6I/VcFpgrgRPMYQ7/dtCQm4gHqC2YtOSAiaOBfzCRNHoAooNZ6QHKQLK
         UsXc6VkxdPrn42Ku/xmdPepV9Jq77OZAnatyhRxcxRZ6j3bCzG9Gv6PtGJpoLE77p5yB
         Yp4Up0MeQbJQlhEs7HFoHKxVU2aspP9sDA9JGY/DSPu9QflZC85J8ynx88aKEfM4W3OF
         5+IxFpcnM5dXTVvn3xfuWq8M2nklzRq9SLpmhId6NoefY8NQqpOEi++2pkqyObtDaKp7
         3svC9t4vBiA2KtaZ21eRCpWFZsunJC+y5arKLwxPWnvkNyLgFkoo8faQZBgRHjtz0JR8
         K8mg==
X-Forwarded-Encrypted: i=1; AJvYcCVOM1xD364dQvx9fk4xhEQDIjYgboWhwiUJw71qgKFpN1P2+WPKtYbN79D0OIwSqCaTF5Reh2UVaTA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5DrATaa1Dum6WVJduDc0IdSZldpJNmY5mV+4vmIQBYjsXubQC
	XUqheWmc+CiO8ZSN4BtIRFX9OzE07sfrkcbaGKW1Dpk78aWtBTmO
X-Gm-Gg: ASbGncsY391XETsFGRQBNsj2w5c/3sR09lg+zbLJKBXrIcF593e/E9YFp/Mq6M28f3h
	g9yAlPGzz+KaR8/RnQ0fPBosm++5eQKT64eAsSPFIy7HPZRXGaS50FU8fOZqJfFKD6bqKTcXKS8
	AAtBhs7xTnJBiIvGNcRsPma/7VhR6QwY0Ox8LdM4xMfS13cg+/7zsnULPBx4BWMLkPzcnrXozBi
	HMJerS+dZtCNPWK54PJHawHfZ5QvZWSnBS3ZwSifPe60lR7zeew+ZxSoibhxBq9VZOmH1VrAJl7
	uU60FqzxxigeRvbjCS+J3QPdmOI4sFVgBtWHxTT5cUGOJQ2Q3MkmsKpOrlN3bDTNOIeYfACjDR+
	Kj/jF/53AXQTS5HgP
X-Google-Smtp-Source: AGHT+IHyq0wKtTrc0JMmzZ/TTDnCgC5YTAN52J6xj0Dqg4VqUmUWnii/yZGjz5xIMwXEW5/R9andgg==
X-Received: by 2002:a05:6402:3486:b0:5f5:7c7a:94df with SMTP id 4fb4d7f45d1cf-5f739594cc7mr5926222a12.1.1745827927736;
        Mon, 28 Apr 2025 01:12:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yZT03Y0VkaFdViHPEYVhrO5A"
Message-ID: <231e9f4e-a044-49b7-b3a5-26ff2f7f9612@gmail.com>
Date: Mon, 28 Apr 2025 10:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <9bee5d4e-cad1-4fc1-8b4c-b4a4bab4b76c@gmail.com>
 <c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com>
Content-Language: en-US
In-Reply-To: <c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com>

This is a multi-part message in MIME format.
--------------yZT03Y0VkaFdViHPEYVhrO5A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/17/25 8:25 AM, Jan Beulich wrote:
> On 16.04.2025 21:05, Oleksii Kurochko wrote:
>> On 4/15/25 2:46 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> Introduce interrupt controller descriptor for host APLIC to describe
>>>> the low-lovel hardare. It includes implementation of the following functions:
>>>>    - aplic_irq_startup()
>>>>    - aplic_irq_shutdown()
>>>>    - aplic_irq_enable()
>>>>    - aplic_irq_disable()
>>>>    - aplic_irq_ack()
>>>>    - aplic_host_irq_end()
>>>>    - aplic_set_irq_affinity()
>>>>
>>>> As APLIC is used in MSI mode it requires to enable/disable interrupts not
>>>> only for APLIC but also for IMSIC. Thereby for the purpose of
>>>> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
>>>>
>>>> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
>>>> introduced to get hart id.
>>>>
>>>> Also, introduce additional interrupt controller h/w operations and
>>>> host_irq_type for APLIC:
>>>>    - aplic_host_irq_type
>>>>    - aplic_set_irq_priority()
>>>>    - aplic_set_irq_type()
>>> Yet these two functions nor the hooks they're used to populate are entirely
>>> unused here. Since they're also outside of the common IRQ handling machinery,
>>> it's unclear how one would sanely ack such a change.
>> They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
>> the IRQ is setup.
> Perhaps move their introduction to there then? We don't do any Misra checking
> yet lon RISC-V, but imo it's still good practice to avoid introducing new
> violations, even if only temporarily.

Okay, I will move their introduction to there.

Btw, what is needed to add Misra checking for RISC-V? I started to think that, probably,
it will make sense to do that from the start.

>>>> --- a/xen/arch/riscv/aplic.c
>>>> +++ b/xen/arch/riscv/aplic.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <xen/irq.h>
>>>>    #include <xen/mm.h>
>>>>    #include <xen/sections.h>
>>>> +#include <xen/spinlock.h>
>>>>    #include <xen/types.h>
>>>>    #include <xen/vmap.h>
>>>>    
>>>> @@ -110,9 +111,173 @@ static int __init aplic_init(void)
>>>>        return 0;
>>>>    }
>>>>    
>>>> -static const struct intc_hw_operations __ro_after_init aplic_ops = {
>>>> +static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
>>>> +{
>>>> +    unsigned int irq = desc->irq - 1;
>>> Why this adjustment by 1 (and yet both items being named "irq")?
>> Interrupt 0 isn't possible based on the spec:
>> ```
>> Each of an APLIC’s interrupt sources has a fixed unique identity number
>> in the range 1 to N, where N is the total number of sources at the
>> APLIC. The number zero is not a valid interrupt identity number at an
>> APLIC. The maximum number of interrupt sources an APLIC may support is
>> 1023. ``` and interrupt 1 will correspond to bit 0 in sourcecfg[] register, interrupt
>> 2 ->sourcecfg[1] and so on. And that is the reason why we need -1.
> Okay, fine. But what about the part of the question in parentheses?

Sorry, missed to write that I'll change irq to irq_bit or something like that.

>>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
>>>> +            break;
>>>> +        case IRQ_TYPE_LEVEL_HIGH:
>>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
>>>> +            break;
>>>> +        case IRQ_TYPE_LEVEL_LOW:
>>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
>>>> +            break;
>>>> +        default:
>>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
>>>> +            break;
>>> Is the default: label legitimate to be reached?
>>   From the spec:
>> ```
>> 0 Inactive Inactive in this domain (and not delegated) 1 Detached
>> Active, detached from the source wire 2–3 — Reserved 4 Edge1 Active,
>> edge-sensitive; interrupt asserted on rising edge 5 Edge0 Active,
>> edge-sensitive; interrupt asserted on falling edge 6 Level1 Active,
>> level-sensitive; interrupt asserted when high 7 Level0 Active,
>> level-sensitive; interrupt asserted when low ``` It seems to me like
>> APLIC_SOURCECFG_SM_INACTIVE just covers cases (0-3) and inactive IRQ
>> pretty safe to as a default value.
> I fear this doesn't answer my question, which is to a large part related
> to the Xen code, and only to some degree to the spec.

 From Xen code point of view, I am not sure if it legitimate or not. I've not any
issue, at the moment, with such implementation, but to be on a safe side I'll
implement default case as panic("...").

>>>> +static void aplic_set_irq_priority(struct irq_desc *desc,
>>>> +                                   unsigned int priority)
>>>> +{
>>>> +    /* No priority, do nothing */
>>>> +}
>>> Since the function dopes nothing, wouldn't it be better to omit it and have
>>> the (future) caller check for a NULL pointer ahead of making the (indirect)
>>> call? Same remark for other handlers (below) which also do nothing.
>> I thought about that too, but it could be some cases when the stub is introduced
>> with temporary BUG_ON("unimplemented") inside just to not miss to implement it
>> when it will be necessary.
>> If we will have only the caller check then we could miss to implement such stubs.
> I guess I don't understand the concern.

for example, if we will have the following code:
   void some_caller(struct irq_desc *desc)
   {
       if ( desc->handler->set_affinity )
           desc->handler->set_affinity(desc, cpu_mask);
   }

Then we will skip the call of handler->set_affinity() (if it was just initialized with
.set_affinity = NULL) without any notification. And it is fine specifically in this
case as aplic_set_irq_priority() does nothing.

But what about the cases if it is a function which will have some implementation in the
future but doesn't have implementation for now. Then without notification that this
function is unimplemented we could skip something what really matters.

But I think that your initial comment was just about the function which basically
does nothing. Am i right?

>>>> +static void aplic_irq_enable(struct irq_desc *desc)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    /*
>>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>>> +     *       If APLIC without MSI interrupts is required in the future,
>>>> +     *       this function will need to be updated accordingly.
>>>> +     */
>>>> +    ASSERT(aplic.imsic_cfg->is_used);
>>> Such an extra field, used only for assertions, is pretty odd. Can't you
>>> use any of the other fields to achieve the same effect?
>> in aplic_init() there is:
>>       /* check for associated imsic node */
>>       rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>       if ( !rc )
>>           panic("%s: IDC mode not supported\n", node->full_name);
>>
>> So we will have panic() anyway if MSI mode isn't supported. As an option we
>> can just drop the ASSERT.
> Since they serve primarily as a reminder where changes would need making,
> I'd prefer if they could be kept.
>
>> Or introduce static variable in aplic.c `aplic_mode`, init it in aplic_init()
>> and use it in ASSERT().
> This would then again be used solely for assertions, aiui? As said, I
> think it would be preferable if some already existing indicator could be
> used for this purpose.

I think that not solely, for example, if IMSIC isn't available then we should skip
the calls of imsic_irq_enable(), at least, and this variable could be used for that
purpose.

But I will double check if we have better indicator. At the moment, I don't think
we have better, probably, except checking of aplic.regs->domaincfg if bit APLIC_DOMAINCFG_DM
is set.

>>>> +    ASSERT(spin_is_locked(&desc->lock));
>>> If this lock (which is an IRQ-safe one) is necessarily held, ...
>>>
>>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>> ... you can use just spin_lock() here.
>>>
>>>> +    clear_bit(_IRQ_DISABLED, &desc->status);
>>> Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
>>> question on Arm code also doing so.)
>> I haven't thought about that. Likely non-atomic bitop could be used here.
> And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
> doesn't. And I see no reason to use other than plain C operators here. If
> Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
> constants could go away, with just the IRQ_* ones left.

The reason for a bitop in Arm is explained in this commithttps://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473
but all the places where plain C operators were changed to bitops are actually executed under|spin_lock_irqsave(&desc->lock, flags). By quick look I found only two 
places one in __setup_irq() but it is called by the functions which do ||spin_lock_irqsave(&desc->lock, flags) and in vgic_v2_fold_lr_state(). 
Maybe, I'm missing something.|
|RISC-V won't have something similar to ||vgic_v2_fold_lr_state|(), but __setup_irq() is used in a similar way. It can be added ASSERT(spin_is_lock(&desc->lock))
and then it will also safe to use non-bitop function.
Probably, it is a little bit safer to use always bitops for desc->status.
||

>>> I'm uncertain about this bit setting anyway - on x86 we would only fiddle
>>> with it for IRQs not in use, not while enabling/disabling one.
> What about this part?

As I understand, based on Arm, code then Xen enables interrupts corresponding to devices assigned
to dom0/domU before booting dom0/domU, resulting in the possibility of receiving an interrupt
and not knowing what to do with it. So it is needed for enablement of IRQs when the guest
requests it and not unconditionally at boot time.

>>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>>> +}
>>>> +
>>>> +static void aplic_irq_disable(struct irq_desc *desc)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    /*
>>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>>> +     *       If APLIC without MSI interrupts is required in the future,
>>>> +     *       this function will need to be updated accordingly.
>>>> +     */
>>>> +    ASSERT(aplic.imsic_cfg->is_used);
>>>> +
>>>> +    ASSERT(spin_is_locked(&desc->lock));
>>>> +
>>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>>> +
>>>> +    set_bit(_IRQ_DISABLED, &desc->status);
>>>> +
>>>> +    /* disable interrupt in APLIC */
>>>> +    aplic.regs->clrienum = desc->irq;
>>>> +
>>>> +    /* disable interrupt in IMSIC */
>>>> +    imsic_irq_disable(desc->irq);
>>>> +
>>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>>> +}
>>>> +
>>>> +static unsigned int aplic_irq_startup(struct irq_desc *desc)
>>>> +{
>>>> +    aplic_irq_enable(desc);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void aplic_irq_shutdown(struct irq_desc *desc)
>>>> +{
>>>> +    aplic_irq_disable(desc);
>>>> +}
>>> You don't really need a separate hook function here, do you?
>> With such implementation it is really not needed to have a hook so
>> I will drop it.
>>
>>>> +static void aplic_irq_ack(struct irq_desc *desc)
>>>> +{
>>>> +    /* nothing to do */
>>>> +}
>>>> +
>>>> +static void aplic_host_irq_end(struct irq_desc *desc)
>>> What's the "host" in the identifier about?
>> It was copied that from Arm and my understanding that it means
>> Xen-related IRQ as they also have:
>> ```
>> /* XXX different for level vs edge */
>> static hw_irq_controller gicv2_host_irq_type = {
>> ...
>>       .end          = gicv2_host_irq_end,
>> ...
>> };
>>
>> static hw_irq_controller gicv2_guest_irq_type = {
>> ...
>>       .end          = gicv2_guest_irq_end,
>> ...
>> };
>> ```
> And you expect to end up with a similar distinction on RISC-V? There's
> nothing like that on x86, just to mention it.

Yes, if one day support for guest interrupts without IMSIC support will be added for APLIC.
(at the moment, we are planning only to have APLIC+IMSIC support as this way is hypervisor-aware)

>>>> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>>>> +{
>>>> +    unsigned int cpu;
>>>> +    uint64_t group_index, base_ppn;
>>>> +    uint32_t hhxw, lhxw ,hhxs, value;
>>>> +    const struct imsic_config *imsic = aplic.imsic_cfg;
>>>> +
>>>> +    /*
>>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>>> +     *       If APLIC without MSI interrupts is required in the future,
>>>> +     *       this function will need to be updated accordingly.
>>>> +     */
>>>> +    ASSERT(aplic.imsic_cfg->is_used);
>>> Use the local variable you have made yourself?
>> What do you mean by local here?
> Just a few lines up you latch aplic.imsic_cfg into the local "imsic".

Oh, sure, if *->is_used will still present in the next patch series then I'll re-use here "imsic".

~ Oleksii

--------------yZT03Y0VkaFdViHPEYVhrO5A
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
    <div class="moz-cite-prefix">On 4/17/25 8:25 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 16.04.2025 21:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 4/15/25 2:46 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Yet these two functions nor the hooks they're used to populate are entirely
unused here. Since they're also outside of the common IRQ handling machinery,
it's unclear how one would sanely ack such a change.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
the IRQ is setup.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Perhaps move their introduction to there then? We don't do any Misra checking
yet lon RISC-V, but imo it's still good practice to avoid introducing new
violations, even if only temporarily.</pre>
    </blockquote>
    <pre>Okay, I will move their introduction to there.

Btw, what is needed to add Misra checking for RISC-V? I started to think that, probably,
it will make sense to do that from the start.

</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Why this adjustment by 1 (and yet both items being named "irq")?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Interrupt 0 isn't possible based on the spec:
```
Each of an APLIC’s interrupt sources has a fixed unique identity number 
in the range 1 to N, where N is the total number of sources at the 
APLIC. The number zero is not a valid interrupt identity number at an 
APLIC. The maximum number of interrupt sources an APLIC may support is 
1023. ``` and interrupt 1 will correspond to bit 0 in sourcecfg[] register, interrupt 
2 -&gt;sourcecfg[1] and so on. And that is the reason why we need -1.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Okay, fine. But what about the part of the question in parentheses?</pre>
    </blockquote>
    <pre>Sorry, missed to write that I'll change irq to irq_bit or something like that.

</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Is the default: label legitimate to be reached?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre"> From the spec:
```
0 Inactive Inactive in this domain (and not delegated) 1 Detached 
Active, detached from the source wire 2–3 — Reserved 4 Edge1 Active, 
edge-sensitive; interrupt asserted on rising edge 5 Edge0 Active, 
edge-sensitive; interrupt asserted on falling edge 6 Level1 Active, 
level-sensitive; interrupt asserted when high 7 Level0 Active, 
level-sensitive; interrupt asserted when low ``` It seems to me like 
APLIC_SOURCECFG_SM_INACTIVE just covers cases (0-3) and inactive IRQ 
pretty safe to as a default value.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I fear this doesn't answer my question, which is to a large part related
to the Xen code, and only to some degree to the spec.</pre>
    </blockquote>
    <pre>From Xen code point of view, I am not sure if it legitimate or not. I've not any
issue, at the moment, with such implementation, but to be on a safe side I'll
implement default case as panic("...").
</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static void aplic_set_irq_priority(struct irq_desc *desc,
+                                   unsigned int priority)
+{
+    /* No priority, do nothing */
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Since the function dopes nothing, wouldn't it be better to omit it and have
the (future) caller check for a NULL pointer ahead of making the (indirect)
call? Same remark for other handlers (below) which also do nothing.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I thought about that too, but it could be some cases when the stub is introduced
with temporary BUG_ON("unimplemented") inside just to not miss to implement it
when it will be necessary.
If we will have only the caller check then we could miss to implement such stubs.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I guess I don't understand the concern.</pre>
    </blockquote>
    <pre>for example, if we will have the following code:
  void some_caller(struct irq_desc *desc)
  {
      if ( desc-&gt;handler-&gt;set_affinity )
          desc-&gt;handler-&gt;set_affinity(desc, cpu_mask);
  }

Then we will skip the call of handler-&gt;set_affinity() (if it was just initialized with
.set_affinity = NULL) without any notification. And it is fine specifically in this
case as aplic_set_irq_priority() does nothing.

But what about the cases if it is a function which will have some implementation in the
future but doesn't have implementation for now. Then without notification that this
function is unimplemented we could skip something what really matters.

But I think that your initial comment was just about the function which basically
does nothing. Am i right?</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Such an extra field, used only for assertions, is pretty odd. Can't you
use any of the other fields to achieve the same effect?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">in aplic_init() there is:
     /* check for associated imsic node */
     rc = dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle);
     if ( !rc )
         panic("%s: IDC mode not supported\n", node-&gt;full_name);

So we will have panic() anyway if MSI mode isn't supported. As an option we
can just drop the ASSERT.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Since they serve primarily as a reminder where changes would need making,
I'd prefer if they could be kept.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Or introduce static variable in aplic.c `aplic_mode`, init it in aplic_init()
and use it in ASSERT().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This would then again be used solely for assertions, aiui? As said, I
think it would be preferable if some already existing indicator could be
used for this purpose.</pre>
    </blockquote>
    <pre>I think that not solely, for example, if IMSIC isn't available then we should skip
the calls of imsic_irq_enable(), at least, and this variable could be used for that
purpose.

But I will double check if we have better indicator. At the moment, I don't think
we have better, probably, except checking of aplic.regs-&gt;domaincfg if bit APLIC_DOMAINCFG_DM
is set.

</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If this lock (which is an IRQ-safe one) is necessarily held, ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    spin_lock_irqsave(&amp;aplic.lock, flags);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... you can use just spin_lock() here.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    clear_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
question on Arm code also doing so.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I haven't thought about that. Likely non-atomic bitop could be used here.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
doesn't. And I see no reason to use other than plain C operators here. If
Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
constants could go away, with just the IRQ_* ones left.</pre>
    </blockquote>
    <pre>The reason for a bitop in Arm is explained in this commit <a
    class="moz-txt-link-freetext"
href="https://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473">https://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473</a>
but all the places where plain C operators were changed to bitops are actually executed under <code><span
    class="n">spin_lock_irqsave</span><span class="p">(</span><span
    class="o">&amp;</span><span class="n">desc</span><span class="o">-&gt;</span><span
    class="n">lock</span><span class="p">,</span> <span class="n">flags</span><span
    class="p">).
By quick look I found only two places one in __setup_irq() but it is called by the functions which do </span></code><code><span
    class="n">spin_lock_irqsave</span><span class="p">(</span><span
    class="o">&amp;</span><span class="n">desc</span><span class="o">-&gt;</span><span
    class="n">lock</span><span class="p">,</span> <span class="n">flags</span><span
    class="p">)
and in vgic_v2_fold_lr_state(). Maybe, I'm missing something.</span></code>
<code><span class="p">
RISC-V won't have something similar to </span></code><code><span
    class="p">vgic_v2_fold_lr_state</span></code>(), but __setup_irq() is used in a similar way. It can be added ASSERT(spin_is_lock(&amp;desc-&gt;lock))
and then it will also safe to use non-bitop function.
Probably, it is a little bit safer to use always bitops for desc-&gt;status.
<code><span class="p">
</span></code>
</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I'm uncertain about this bit setting anyway - on x86 we would only fiddle
with it for IRQs not in use, not while enabling/disabling one.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What about this part?</pre>
    </blockquote>
    <pre>As I understand, based on Arm, code then Xen enables interrupts corresponding to devices assigned
to dom0/domU before booting dom0/domU, resulting in the possibility of receiving an interrupt
and not knowing what to do with it. So it is needed for enablement of IRQs when the guest
requests it and not unconditionally at boot time.

</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">You don't really need a separate hook function here, do you?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">With such implementation it is really not needed to have a hook so
I will drop it.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static void aplic_irq_ack(struct irq_desc *desc)
+{
+    /* nothing to do */
+}
+
+static void aplic_host_irq_end(struct irq_desc *desc)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What's the "host" in the identifier about?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">It was copied that from Arm and my understanding that it means
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
      </blockquote>
      <pre wrap="" class="moz-quote-pre">And you expect to end up with a similar distinction on RISC-V? There's
nothing like that on x86, just to mention it.</pre>
    </blockquote>
    <pre>Yes, if one day support for guest interrupts without IMSIC support will be added for APLIC.
(at the moment, we are planning only to have APLIC+IMSIC support as this way is hypervisor-aware)

</pre>
    <blockquote type="cite"
      cite="mid:c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
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
          <pre wrap="" class="moz-quote-pre">Use the local variable you have made yourself?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">What do you mean by local here?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Just a few lines up you latch aplic.imsic_cfg into the local "imsic".</pre>
    </blockquote>
    <pre>Oh, sure, if *-&gt;is_used will still present in the next patch series then I'll re-use here "imsic".

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------yZT03Y0VkaFdViHPEYVhrO5A--

