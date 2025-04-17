Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD9A91403
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 08:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956925.1350151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5IhB-0002V8-61; Thu, 17 Apr 2025 06:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956925.1350151; Thu, 17 Apr 2025 06:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5IhB-0002TT-1E; Thu, 17 Apr 2025 06:25:57 +0000
Received: by outflank-mailman (input) for mailman id 956925;
 Thu, 17 Apr 2025 06:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Ih9-0002TN-JB
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 06:25:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08a3e7e-1b54-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 08:25:54 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so1630645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 23:25:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308613b370esm3122291a91.34.2025.04.16.23.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 23:25:52 -0700 (PDT)
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
X-Inumbo-ID: d08a3e7e-1b54-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744871153; x=1745475953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G4XNA7H4yNII7wvOevd5MDRJ0FvGB+cOBtrCxwkQcVk=;
        b=EPfbTt1LSfEILXm2b5oqHqajsJ8JX7IHUHn5ftxXUO72286qmhHrBquBVraTWgTuXY
         sae7mxJJJE3NyGhCdEkdOEUmkzxZ+4pKK2XF4qox3vRdFPETW0YdMwYBFHohO62mi/tc
         imsrv/Q3yXWSYy7Bu9L3ErZAjHwhjohZEyuFPj9QDBCPr7b8TSBWWlgAmR6rFAgqn1li
         OWkB03PT3sxaCz7a2J9N2/J3aizf/dsRb5vEGegaGg/GjTsnTAmgbNiWde+Nr4B4O8vx
         eGqFH07CIEMF0IcCmD1OKH95EJp78vJzklApAVctLAdrKi60uvguQPqhnS3KrY0y/XJ/
         zd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871153; x=1745475953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4XNA7H4yNII7wvOevd5MDRJ0FvGB+cOBtrCxwkQcVk=;
        b=OSFYdQ6NZdMatkd1b1DiGN8tJcJ5r6NDhyN4xiixGv51aRMJ+bZUVs56NJrRl+jbge
         K39lVlXuD/G02UA/OMMAzKs1Hs/9SoWaI0uygWiQ9ugwykzSeP7gC4K5dPUBGtKbnGQk
         aunsUF1fYluzkhWXqYKkh9e/SCMDloWcPQquajpUIW89WkhUGClbuo0Al8fkJfI4pKyk
         jOVG/j8Q7bbp0boWiEpF2b0sfd6kboD3czxsKgOnI4QP9EhDn/33K0cY9919dV1zo7E8
         AvjIAlRXMzIMNRCE7mWX7HRtSx40qaQ6tVQqevZ8vO5vqQggLHU3DOYjQgMY68u47g4s
         CuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi11ck8/3CW10yQvlPcISNpVqOrPRbtYehaVgkD0Z5zlYyGyZSkioGMe0Rp1YRY8nUizWg3bcONi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLiT6wvC0UGwVP86xkvh5oashAYR+A4OMRLt5kRG1+Hh69bswx
	X/qDW6oPJyMO8/ydbH+XYr5StA+OCgG47ImkYeSEZNjckbkEPC7Xc7f5XChh5g==
X-Gm-Gg: ASbGnctibjLqg70m+/j/C0+pK+a/PxdIeTejSKspABCCpZ7CsxSPglSU7pDqqZy21u1
	yQX9GfJo90J68MKsrLnHBBZppMkw1igODXyCZXnVAfW+apNU1AwA+jkybS75EfHWtNhz6Jknp4u
	xMd96zhBHWIoSufO71TDN+IlUIyesHkoz16E/Aq7Q1QreU+X7Hxrfwxs2cUSaMogOtiYxZRYrtT
	9SPDEIqaveGr1G8WkVgycw9dMIyx0ens6V2NTFC3OC5bZyAiigzUsztCy6s3ScznszR0r7VQUCL
	nC9snevzKP3fd3qoG3VRX3ZWRLwCWABDf1QlkZD8WGCXY4qwUE+Xd1I4pyf883qCt263I9tWBad
	NyaCiygLIg48dQqXVIzaoAEDcVA==
X-Google-Smtp-Source: AGHT+IFjwDRFYVbxXG7CPq2dfQAJZ9RTJHaFU+ViObYqgiFbxoLe+dPI3VO8/QODjceUDbAyuTT16Q==
X-Received: by 2002:a5d:64c7:0:b0:399:71d4:a2 with SMTP id ffacd0b85a97d-39ee5b16ddbmr3967895f8f.14.1744871153152;
        Wed, 16 Apr 2025 23:25:53 -0700 (PDT)
Message-ID: <c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com>
Date: Thu, 17 Apr 2025 08:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <9bee5d4e-cad1-4fc1-8b4c-b4a4bab4b76c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.04.2025 21:05, Oleksii Kurochko wrote:
> On 4/15/25 2:46 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> Introduce interrupt controller descriptor for host APLIC to describe
>>> the low-lovel hardare. It includes implementation of the following functions:
>>>   - aplic_irq_startup()
>>>   - aplic_irq_shutdown()
>>>   - aplic_irq_enable()
>>>   - aplic_irq_disable()
>>>   - aplic_irq_ack()
>>>   - aplic_host_irq_end()
>>>   - aplic_set_irq_affinity()
>>>
>>> As APLIC is used in MSI mode it requires to enable/disable interrupts not
>>> only for APLIC but also for IMSIC. Thereby for the purpose of
>>> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
>>>
>>> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
>>> introduced to get hart id.
>>>
>>> Also, introduce additional interrupt controller h/w operations and
>>> host_irq_type for APLIC:
>>>   - aplic_host_irq_type
>>>   - aplic_set_irq_priority()
>>>   - aplic_set_irq_type()
>> Yet these two functions nor the hooks they're used to populate are entirely
>> unused here. Since they're also outside of the common IRQ handling machinery,
>> it's unclear how one would sanely ack such a change.
> 
> They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
> the IRQ is setup.

Perhaps move their introduction to there then? We don't do any Misra checking
yet lon RISC-V, but imo it's still good practice to avoid introducing new
violations, even if only temporarily.

>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -15,6 +15,7 @@
>>>   #include <xen/irq.h>
>>>   #include <xen/mm.h>
>>>   #include <xen/sections.h>
>>> +#include <xen/spinlock.h>
>>>   #include <xen/types.h>
>>>   #include <xen/vmap.h>
>>>   
>>> @@ -110,9 +111,173 @@ static int __init aplic_init(void)
>>>       return 0;
>>>   }
>>>   
>>> -static const struct intc_hw_operations __ro_after_init aplic_ops = {
>>> +static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
>>> +{
>>> +    unsigned int irq = desc->irq - 1;
>> Why this adjustment by 1 (and yet both items being named "irq")?
> 
> Interrupt 0 isn't possible based on the spec:
> ```
> Each of an APLIC’s interrupt sources has a fixed unique identity number 
> in the range 1 to N, where N is the total number of sources at the 
> APLIC. The number zero is not a valid interrupt identity number at an 
> APLIC. The maximum number of interrupt sources an APLIC may support is 
> 1023. ``` and interrupt 1 will correspond to bit 0 in sourcecfg[] register, interrupt 
> 2 ->sourcecfg[1] and so on. And that is the reason why we need -1.

Okay, fine. But what about the part of the question in parentheses?

>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
>>> +            break;
>>> +        case IRQ_TYPE_LEVEL_HIGH:
>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
>>> +            break;
>>> +        case IRQ_TYPE_LEVEL_LOW:
>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
>>> +            break;
>>> +        default:
>>> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
>>> +            break;
>> Is the default: label legitimate to be reached?
> 
>  From the spec:
> ```
> 0 Inactive Inactive in this domain (and not delegated) 1 Detached 
> Active, detached from the source wire 2–3 — Reserved 4 Edge1 Active, 
> edge-sensitive; interrupt asserted on rising edge 5 Edge0 Active, 
> edge-sensitive; interrupt asserted on falling edge 6 Level1 Active, 
> level-sensitive; interrupt asserted when high 7 Level0 Active, 
> level-sensitive; interrupt asserted when low ``` It seems to me like 
> APLIC_SOURCECFG_SM_INACTIVE just covers cases (0-3) and inactive IRQ 
> pretty safe to as a default value.

I fear this doesn't answer my question, which is to a large part related
to the Xen code, and only to some degree to the spec.

>>> +static void aplic_set_irq_priority(struct irq_desc *desc,
>>> +                                   unsigned int priority)
>>> +{
>>> +    /* No priority, do nothing */
>>> +}
>> Since the function dopes nothing, wouldn't it be better to omit it and have
>> the (future) caller check for a NULL pointer ahead of making the (indirect)
>> call? Same remark for other handlers (below) which also do nothing.
> 
> I thought about that too, but it could be some cases when the stub is introduced
> with temporary BUG_ON("unimplemented") inside just to not miss to implement it
> when it will be necessary.
> If we will have only the caller check then we could miss to implement such stubs.

I guess I don't understand the concern.

>>> +static void aplic_irq_enable(struct irq_desc *desc)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    /*
>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>> +     *       If APLIC without MSI interrupts is required in the future,
>>> +     *       this function will need to be updated accordingly.
>>> +     */
>>> +    ASSERT(aplic.imsic_cfg->is_used);
>> Such an extra field, used only for assertions, is pretty odd. Can't you
>> use any of the other fields to achieve the same effect?
> 
> in aplic_init() there is:
>      /* check for associated imsic node */
>      rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>      if ( !rc )
>          panic("%s: IDC mode not supported\n", node->full_name);
> 
> So we will have panic() anyway if MSI mode isn't supported. As an option we
> can just drop the ASSERT.

Since they serve primarily as a reminder where changes would need making,
I'd prefer if they could be kept.

> Or introduce static variable in aplic.c `aplic_mode`, init it in aplic_init()
> and use it in ASSERT().

This would then again be used solely for assertions, aiui? As said, I
think it would be preferable if some already existing indicator could be
used for this purpose.

>>> +    ASSERT(spin_is_locked(&desc->lock));
>> If this lock (which is an IRQ-safe one) is necessarily held, ...
>>
>>> +    spin_lock_irqsave(&aplic.lock, flags);
>> ... you can use just spin_lock() here.
>>
>>> +    clear_bit(_IRQ_DISABLED, &desc->status);
>> Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
>> question on Arm code also doing so.)
> 
> I haven't thought about that. Likely non-atomic bitop could be used here.

And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
doesn't. And I see no reason to use other than plain C operators here. If
Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
constants could go away, with just the IRQ_* ones left.

>> I'm uncertain about this bit setting anyway - on x86 we would only fiddle
>> with it for IRQs not in use, not while enabling/disabling one.

What about this part?

>> In any event this can be done outside of the APLIC-locked region, I think.
> 
> Considering that we are doing that under desc->lock, agree we can move that outside
> the APLIC-locked region.
> 
>>> +    imsic_irq_enable(desc->irq);
>>> +
>>> +    /* enable interrupt in APLIC */
>>> +    aplic.regs->setienum = desc->irq;
>> Are you sure you want to use plain assignments for MMIO accesses? I'd have
>> expected writel() to be used here. (And only later I realized that I didn't
>> spot the same already higher up from here.)
> 
> Good point. I have to update that with writel()...
> 
>>
>>  From the vague understanding I've gained so far: Isn't the APLIC closer to
>> the CPU and the IMSIC closer to the device? If so, wouldn't you want to
>> enable at the APLIC before enabling at the IMSIC? But of course that also
>> depends on what exactly happens in the window while one is already enabled
>> and the other is still disabled. (Later) From the code you add to imsic.c
>> it looks like it's the other way around, as the IMSIC is accessed through
>> CSRs.
> 
>  From the AIA spec:
> ```
> An Incoming MSI Controller (IMSIC) is an optional RISC-V hardware component
> that is closely coupled with a hart, one IMSIC per hart. An IMSIC receives
> and records incoming message-signaled interrupts (MSIs) for a hart, and
> signals to the hart when there are pending and enabled interrupts to be
> serviced.
> ```
> 
> Based on the figure 2 (Interrupt delivery by MSIs when harts have IMSICs for receiving them)
> of AIA spechttps://github.com/riscv/riscv-aia/blob/main/src/intrsWithIMSICs.png
> IMSIC is more close to CPU and APLIC is more close to the device. The external interrupt
> controller is APLIC and it only sends a MSI message for a CPU.
> 
> The logical flow of an interrupt to a hart with an IMSIC would be:
> 1. A physical interrupt signal arrives at the APLIC.
> 2. The APLIC, if configured for MSI delivery mode (domaincfg.DM = 1) and if the specific
>     interrupt source is active and enabled within its domain (controlled by sourcecfg[i]
>     and the global Interrupt Enable bit IE in domaincfg), will generate an MSI.
> 3. This MSI is then sent to the target hart's IMSIC. The APLIC needs to know the MSI
>     target address for each hart, which can be hardwired or configured through registers
>     like mmsiaddrcfg and mmsiaddrcfgh.
> 4. The receiving hart's IMSIC records this MSI as a pending interrupt.
> 5. If the corresponding interrupt identity is enabled within the IMSIC's interrupt file,
>     the IMSIC will signal the hart, typically by setting the MEIP or SEIP bit in the mip
>     CSR (or sip CSR).
> 
> Generally, I think that the order in which enable interrupts doesn't really matter as
> if you were to enable the IMSIC to receive a certain interrupt before the APLIC was
> configured to send it (or had a pending interrupt from the device), the IMSIC would
> simply be waiting for an MSI that wouldn't arrive.
> Similarly, if the APLIC sends an MSI for an interrupt that is not enabled in the IMSIC,
> the interrupt would remain pending in the IMSIC but wouldn't trigger an interrupt at
> the hart.
> 
> IMO, the order which is used now in the code is pretty logical.
> 
> Does it make sense?

Except for the "doesn't really matter" - yes. In a reply to a later patch I
indicated I realized that IMSIC is what's closer to the CPU (and hence later
in the chain of interrupt delivery actions).

>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>> +}
>>> +
>>> +static void aplic_irq_disable(struct irq_desc *desc)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    /*
>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>> +     *       If APLIC without MSI interrupts is required in the future,
>>> +     *       this function will need to be updated accordingly.
>>> +     */
>>> +    ASSERT(aplic.imsic_cfg->is_used);
>>> +
>>> +    ASSERT(spin_is_locked(&desc->lock));
>>> +
>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>> +
>>> +    set_bit(_IRQ_DISABLED, &desc->status);
>>> +
>>> +    /* disable interrupt in APLIC */
>>> +    aplic.regs->clrienum = desc->irq;
>>> +
>>> +    /* disable interrupt in IMSIC */
>>> +    imsic_irq_disable(desc->irq);
>>> +
>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>> +}
>>> +
>>> +static unsigned int aplic_irq_startup(struct irq_desc *desc)
>>> +{
>>> +    aplic_irq_enable(desc);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void aplic_irq_shutdown(struct irq_desc *desc)
>>> +{
>>> +    aplic_irq_disable(desc);
>>> +}
>> You don't really need a separate hook function here, do you?
> 
> With such implementation it is really not needed to have a hook so
> I will drop it.
> 
>>> +static void aplic_irq_ack(struct irq_desc *desc)
>>> +{
>>> +    /* nothing to do */
>>> +}
>>> +
>>> +static void aplic_host_irq_end(struct irq_desc *desc)
>> What's the "host" in the identifier about?
> 
> It was copied that from Arm and my understanding that it means
> Xen-related IRQ as they also have:
> ```
> /* XXX different for level vs edge */
> static hw_irq_controller gicv2_host_irq_type = {
> ...
>      .end          = gicv2_host_irq_end,
> ...
> };
> 
> static hw_irq_controller gicv2_guest_irq_type = {
> ...
>      .end          = gicv2_guest_irq_end,
> ...
> };
> ```

And you expect to end up with a similar distinction on RISC-V? There's
nothing like that on x86, just to mention it.

>>> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>>> +{
>>> +    unsigned int cpu;
>>> +    uint64_t group_index, base_ppn;
>>> +    uint32_t hhxw, lhxw ,hhxs, value;
>>> +    const struct imsic_config *imsic = aplic.imsic_cfg;
>>> +
>>> +    /*
>>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>>> +     *       If APLIC without MSI interrupts is required in the future,
>>> +     *       this function will need to be updated accordingly.
>>> +     */
>>> +    ASSERT(aplic.imsic_cfg->is_used);
>> Use the local variable you have made yourself?
> 
> What do you mean by local here?

Just a few lines up you latch aplic.imsic_cfg into the local "imsic".

>>> +    ASSERT(!cpumask_empty(mask));
>>> +
>>> +    spin_lock(&aplic.lock);
>> Aiui the lock can be acquired quite a bit later. It ought to be needed only
>> around the actual write to the hardware register.
>>
>>> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>>> +    hhxw = imsic->group_index_bits;
>>> +    lhxw = imsic->hart_index_bits;
>>> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>> +
>>> +    /* update hart and EEID in the target register */
>>> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
>> What's this magic 12 in here? Not IMSIC_MMIO_PAGE_SHIFT I suppose?
> 
> In the AIA spec they are using 12 explicitly:https://github.com/riscv/riscv-aia/blob/main/src/AdvPLIC.adoc#AdvPLIC-MSIAddrs

In the spec that's fine, but please make yourself a constant with a suitable
name then, to be used here. Just consider what would happen if we used literal
12 everywhere PAGE_SHIFT was meant.

>>> +void imsic_irq_enable(unsigned int hwirq)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
>>> +    imsic_local_eix_update(hwirq, 1, false, true);
>> No subtraction of 1 here? Also, why "hwirq" and not just "irq"?
> 
>  From the spec:
> ```
> 
> When an interrupt file supports distinct interrupt identities, valid identity numbers are between 1
> and inclusive. The identity numbers within this range are said to be implemented by the interrupt
> file; numbers outside this range are not implemented. The number zero is never a valid interrupt
> identity.
> ...
> 
> Bit positions in a valid eiek register that don’t correspond to a 
> supported interrupt identity (such as bit 0 of eie0) are read-only zeros.
> 
> 
> ```
> 
> So in EIx registers interrupt i corresponds to bit i in comparison wiht APLIC's sourcecfg which starts from 0.

Confusing, but what do you do.

>>> @@ -277,6 +333,13 @@ int __init imsic_init(struct dt_device_node *node)
>>>           goto imsic_init_err;
>>>       }
>>>   
>>> +    spin_lock_init(&imsic_cfg.lock);
>>> +
>>> +    /* Enable local interrupt delivery */
>>> +    imsic_ids_local_delivery(true);
>> What's this? I can't find the function/macro here, nor in patch 08, nor in
>> staging.
> 
> It is defined in imsic.c:
> ```
> void imsic_ids_local_delivery(bool enable)
> {
>      if ( enable )
>      {
>          imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
>          imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
>      }
>      else
>      {
>          imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
>          imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
>      }
> }
> ```

No, it's not. As noted in the reply to a later patch, it's only introduced
there. Hence the build will break between the two patches.

Jan

