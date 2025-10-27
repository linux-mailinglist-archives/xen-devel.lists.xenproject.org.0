Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203EAC0CF19
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 11:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151496.1482026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDKOR-0001MV-1c; Mon, 27 Oct 2025 10:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151496.1482026; Mon, 27 Oct 2025 10:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDKOQ-0001K3-VA; Mon, 27 Oct 2025 10:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1151496;
 Mon, 27 Oct 2025 10:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDKOP-0001Ju-EV
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 10:24:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c791d0a-b31f-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 11:23:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so27392005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 03:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a5cc4sm126784805e9.11.2025.10.27.03.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 03:23:57 -0700 (PDT)
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
X-Inumbo-ID: 0c791d0a-b31f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761560638; x=1762165438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QOacaics3LEeVvEn8gBiaP/TnigQQ9ZBTQK3ngtkuMg=;
        b=fAqsk8syw5SzV9dfYB7qMY/Y9X+Szf4IWcRy1X63mzc41w7q0b9k0WS2Boo3HwUr+7
         gxe0J1pydq/2CR+Qq47doehpIT33UtTQyhGRz25NqESonNhxGx1MoNUtXRwB6ULMJKjs
         fDv/5VE46VnmfXYiBLqppDE4wcpv/Q6JrrAAQvQC4LYzp4YWBMSM23pkxE93bRW5sFMk
         zeHhyBnpbyLTA8qnTtCrKLNNTNyH0ikq1GYKM14JsIQLN5o6cLmOU2lRsxv0ZAmePoBt
         ocAR28AiwVdMTbhQiIR/sY+Q63P3hgDcdJL3QbRGlFVVNkP7Bcuw3oVy9RJs9XcCGyGL
         HVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560638; x=1762165438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOacaics3LEeVvEn8gBiaP/TnigQQ9ZBTQK3ngtkuMg=;
        b=Stno8VHVpDJAJsuz0T2gzuBVCGAdv1MCViQCFSL+7AifglQVXT307q/gNCdIg6A+O/
         0lOpAGXG6B3tJfzvOjxZE8iUe8K8zc61lQIN27FYYN5GFdP615kcxTILn+kwYNfjFvRJ
         QJBO7ZwtDZBEvkxwvAu6NGyT0Q/EtgxZTj4UWrRaG21ecfF13NaoqOtk2eVdTrCLU+nW
         ctgiaQTxBbuHcJ9uUOWJdPqMjRIbbfDyoc8njgoPikrhFlJl7rEDJnwVCltuhIsIGQQM
         hXP7Hf1H9gdQqUhyyoEtwLVy5Oxi1oAUnGJjSgf3g49y3ih8GIWLGEB3XpzX6lShtgug
         O3Ug==
X-Gm-Message-State: AOJu0YwPfWzcUbkaxad+vTHrOMMfEdVRL40JmVLYZo0Op5Uaur5Bl+F5
	Jj84PE/Dwqrf1AIusskYtRNcwbzXrjN3cCL1EtXAWF2W0VhdPEbtGXSOCcw1wDO6HQ==
X-Gm-Gg: ASbGncuLWGvjxy2A+koWiRlDZvBCREw7gJYRtxksgcM8LT6njUfswA4T5IeAJpOmbVF
	Eo2u10GlDQocqWs1eCmlwXr8qFeXhE2tvWHIo3S10QH2E+UsT4jhVyR8SG4iUZp6dNuNWsD/tVy
	J9/SVvsn6IyInt9vi/d/Jx92vQQ5spoxKsaNIUyV74sSOk/32ILxcpK7QnBconJ2pPUqQhzYcxg
	eib53wsZJfSZgCgNDtU2AmMmME8CBUUgs2MVJ2u5IS2QFBzTfqGsOA/eBBuYwKP+dGaF0yof1fJ
	StMLU7yOEp36X51bh9W8a2yQ/muRju2mA9dwAvG1WEORoKso+LLyaewb/isPWxnUgWoIOea8PVC
	CaKJcgYupxDYbUD30be+juVqZ4eRax3LSXjmfiBAQ7wU0s5QGXy04QlebuIkHjxhyZGPLCusPpJ
	JOg0wLr86KuqxsZTPYLZanqmycbZgHfsf+jvt1h+WcG/CfhUtIXt8jqtbcDEKdHnE/1PK6Mxg=
X-Google-Smtp-Source: AGHT+IFdeTz2fmCyuoV7xx1BtbLfsFs8H2lxpb2Jy7HcXmbpXz6autG5gGzWvlPxrvAxH/xoYRJ5zA==
X-Received: by 2002:a05:600c:3b0a:b0:477:b93:a7af with SMTP id 5b1f17b1804b1-4770b93a9d9mr39276015e9.0.1761560637619;
        Mon, 27 Oct 2025 03:23:57 -0700 (PDT)
Message-ID: <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com>
Date: Mon, 27 Oct 2025 11:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com> <aPt-B5R-FwJpQbZR@Mac.lan>
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
In-Reply-To: <aPt-B5R-FwJpQbZR@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.10.2025 15:24, Roger Pau Monné wrote:
> On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
>> Using dynamically allocated / maintained vectors has several downsides:
>> - possible nesting of IRQs due to the effects of IRQ migration,
>> - reduction of vectors available for devices,
>> - IRQs not moving as intended if there's shortage of vectors,
>> - higher runtime overhead.
>>
>> As the vector also doesn't need to be of any priority (first and foremost
>> it really shouldn't be of higher or same priority as the timer IRQ, as
>> that raises TIMER_SOFTIRQ anyway), simply use the lowest one above the
>> legacy range. The vector needs reserving early, until it is known whether
>> it actually is used. If it isn't, it's made available for general use.
>>
>> With a fixed vector, less updating is now necessary in
>> set_channel_irq_affinity(); in particular channels don't need transiently
>> masking anymore, as the necessary update is now atomic. To fully leverage
>> this, however, we want to stop using hpet_msi_set_affinity() there. With
>> the transient masking dropped, we're no longer at risk of missing events.
>>
>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>                                     ^ space?

Looks like I simply took what was provided; I've added the blank now (also
in patch 1).

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -303,15 +309,13 @@ static void cf_check hpet_msi_set_affini
>>      struct hpet_event_channel *ch = desc->action->dev_id;
>>      struct msi_msg msg = ch->msi.msg;
>>  
>> -    msg.dest32 = set_desc_affinity(desc, mask);
>> -    if ( msg.dest32 == BAD_APICID )
>> -        return;
>> +    /* This really is only for dump_irqs(). */
>> +    cpumask_copy(desc->arch.cpu_mask, mask);
> 
> To add some extra checks here for correctness, do you think it would
> be helpful to add:
> 
> ASSERT(cpumask_weight(mask) == 1);
> ASSERT(cpumask_intersects(mask, &cpu_online_mask));
> 
> Or that's too pedantic?

Imo that would be pretty pointless in particular since the function is to go
away anyway.

>> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
>>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>>  
>> +    clear_irq_vector(ch->msi.irq);
>> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
> 
> By passing cpu_online_map here, it leads to _bind_irq_vector() doing:
> 
> cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
> 
> Which strictly speaking is wrong.  However this is just a cosmetic
> issue until the irq is used for the first time, at which point it will
> be assigned to a concrete CPU.
> 
> You could do:
> 
> cpumask_clear(desc->arch.cpu_mask);
> cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);
> 
> (Or equivalent)
> 
> To assign the interrupt to a concrete CPU and reflex it on the
> cpu_mask after the bind_irq_vector() call, but I can live with it
> being like this.  I have patches to adjust _bind_irq_vector() myself,
> which I hope I will be able to post soon.

Hmm, I wrongly memorized hpet_broadcast_init() as being pre-SMP-init only.
It has three call sites:
- mwait_idle_init(), called from cpuidle_presmp_init(),
- amd_cpuidle_init(), calling in only when invoked the very first time,
  which is again from cpuidle_presmp_init(),
- _disable_pit_irq(), called from the regular initcall disable_pit_irq().
I.e. for the latter you're right that the CPU mask is too broad (in only a
cosmetic way though). Would be you okay if I used cpumask_of(0) in place
of &cpu_online_map?

>> @@ -472,19 +482,50 @@ static struct hpet_event_channel *hpet_g
>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>  {
>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>> +    struct msi_msg msg = ch->msi.msg;
>>  
>>      ASSERT(!local_irq_is_enabled());
>>      spin_lock(&desc->lock);
>> -    hpet_msi_mask(desc);
>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>> -    hpet_msi_unmask(desc);
>> +
>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>> +
>> +    /*
>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>> +     * actual update below (either of the IRTE or of [just] message address;
>> +     * with interrupt remapping message address/data don't change) now being
>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>> +     * keeps setting the new deadline only afterwards).
>> +     */
>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>> +
>>      spin_unlock(&desc->lock);
>>  
>> -    spin_unlock(&ch->lock);
>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>> +    {
>> +        ch->msi.msg = msg;
>>  
>> -    /* We may have missed an interrupt due to the temporary masking. */
>> -    if ( ch->event_handler && ch->next_event < NOW() )
>> -        ch->event_handler(ch);
>> +        if ( iommu_intremap != iommu_intremap_off )
>> +        {
>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>> +
>> +            ASSERT(rc <= 0);
>> +            if ( rc >= 0 )
> 
> I don't think the rc > 0 part of this check is meaningful, as any rc
> value > 0 will trigger the ASSERT(rc <= 0) ahead of it.  The code
> inside of the if block itself only contains ASSERTs, so it's only
> relevant for debug=y builds that will also have the rc <= 0 ASSERT.
> 
> You could possibly use:
> 
> ASSERT(rc <= 0);
> if ( !rc )
> {
>     ASSERT(...
> 
> And achieve the same result?

Yes, except that I'd like to keep the >= to cover the case if the first
assertion was dropped / commented out, as well as to have a doc effect.

>> @@ -991,6 +997,13 @@ void alloc_direct_apic_vector(uint8_t *v
>>      spin_unlock(&lock);
>>  }
>>  
>> +/* This could free any vectors, but is needed only for low-prio ones. */
>> +void __init free_lopriority_vector(uint8_t vector)
>> +{
>> +    ASSERT(vector < FIRST_HIPRIORITY_VECTOR);
>> +    clear_bit(vector, used_vectors);
>> +}
> 
> I'm undecided whether we want to have such helper.  This is all very
> specific to the single use by the HPET vector, and hence might be best
> to simply put the clear_bit() inside of hpet_broadcast_late_init()
> itself.

I wanted to avoid making used_vectors non-static.

> I could see for example other callers wanting to use this also
> requiring cleanup of the per cpu vector_irq arrays.  Given it's (so
> far) very limited usage it might be clearer to open-code the
> clear_bit().

Dealing with vector_irq[] is a separate thing, though, isn't it?

>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>> @@ -551,6 +551,13 @@ int cf_check amd_iommu_msi_msg_update_ir
>>          for ( i = 1; i < nr; ++i )
>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>>          msg->data = data;
>> +        /*
>> +         * While the low address bits don't matter, "canonicalize" the address
>> +         * by zapping the bits that were transferred to the IRTE.  This way
>> +         * callers can check for there actually needing to be an update to
>> +         * wherever the address is put.
>> +         */
>> +        msg->address_lo &= ~(MSI_ADDR_DESTMODE_MASK | MSI_ADDR_DEST_ID_MASK);
> 
> You might want to mention this change on the commit message also, as
> it could look unrelated to the rest of the code?

I thought the comment here provided enough context and detail. I've added
"AMD interrupt remapping code so far didn't "return" a consistent MSI
 address when translating an MSI message. Clear respective fields there, to
 keep the respective assertion in set_channel_irq_affinity() from
 triggering."

Jan

