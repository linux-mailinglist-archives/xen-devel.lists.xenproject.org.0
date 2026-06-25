Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T8gRHtzFPGr9rggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:08:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B656C2E52
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:08:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fbIkWNiX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345258.1604170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdG0-0002eD-At; Thu, 25 Jun 2026 06:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345258.1604170; Thu, 25 Jun 2026 06:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdG0-0002bZ-83; Thu, 25 Jun 2026 06:08:12 +0000
Received: by outflank-mailman (input) for mailman id 1345258;
 Thu, 25 Jun 2026 06:08:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcdFy-0002bT-Hq
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 06:08:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcdFx-004eIh-6F
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 08:08:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc5be-2eae-0a2a0a5409dd-0a2a4506aeaa-48
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:08:09 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc5c8-08de-0a2a45060019-d1558030d94f-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:08:09 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so12000125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:08:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492649695c9sm27619005e9.0.2026.06.24.23.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 23:08:08 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782367688; x=1782972488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p86CVyDleBYKE/sor4M7TJwkOCkw3o6hGenXF85BAeU=;
        b=fbIkWNiX9ggOOQx7+c7gKMuUDTUBQ1iDSGgFEDVSNneMkJijkQcAD64P2vYUdp/3Yw
         3EbMXDPpytlaZq0p9d3o5ccmTiUrH1PKXTBZkK7rolUX1zOG+0uJd6emLQyVIVGL9kN1
         AFnRyVklBxXwZgW6TAOsBxUiUqb0Cw97YFJFETosec6wf/z/n9FMZ/qKBFzasttcByut
         fGXOwGuf24a5U+SC+D5KtuPpLjKqr1gHoTCvO7gXY31RlEBTA4MYI+B4mMRup+ERY+ch
         mGR7qmcY76fG+8KOG1LK0Gmoq4dlKfuUloFf6SA8aQqHDZr1deDkGiWHpNOTsDI2bmxs
         Ns3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782367688; x=1782972488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p86CVyDleBYKE/sor4M7TJwkOCkw3o6hGenXF85BAeU=;
        b=Gw6e6atCWgcKDDqDiB9YwB+pN5AVp8dCXQk32iEUWvk71UQDCN3Ar50j5st9VBysvq
         b8Oz58xXdF+DwIw4w28Zp9/aci4rkbyEMDEtxQAUBden14ijrqdQ6OOk/3a6bNDpFdDV
         0TPyTEIJbNmKtHH07RjycBn2q3MTjYsD3PZ/gDi+Nzv7cZQNSaklmTxLr1SS8uiebl5z
         BmwnIaNLiwcmGAUwSOTImy4bsb/NpUlpCR78pTYak24EIIBxmptldqC+Nc+TCV1lqDRd
         pU5bPgTd88D/x2YvqWaEetGqm2Xaxd73iPb6aUKkmd/vW2AmFryFZUi+eamAV1HdbtKP
         xqqw==
X-Forwarded-Encrypted: i=1; AFNElJ+he0+9k0QPqzRylny+tgi5aRhTB9m37f2awEvbAcxn46/4R72qWQNpdWryzOu1hwT1+Z47v/NHrHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg4vxc/l5H0+l/JydLB+p7HBKWgi+/j2vP16EDIu/XzrMSDqUm
	ohumiCwaq1MtyA2DCR6DqyVXMgEpgffPjF+jvPJgX6hg6/1g4CjZJm3x5DWh1wNyZg==
X-Gm-Gg: AfdE7clUq5yIXlypaXQmvr1gbOheoF0JFyOlf9d7gwWUVCPlScWh84GuaprhwHIjCea
	Q8jHZsmYlwkcQorUEJakxDZnZHq0hho1a0VdiVxgcgtDtC/VtKT9YCrCm3FkzRRegQYUwurbRg8
	Cx8K/897xMfvXgL4bL2Wpt3RCAW0lxAgZmyIA0j7ZO4gp/P49Z8ion/AqtbonmFO6JBUwTKR7ks
	pqjKu5oGZW7pJjRcwNeK4mYalqWiPXN+acAXVyhj8ZH5uamjpcdnhrnL8f5Y7pKXo+tjV9I74B3
	b8zjC7UkQ4n+L7b0cQb7WP3OFS+ur/0gpbIbPncECV48L2/9euP5q4y+ZSp+zKmEaKN2lhgwarW
	k5Hg9Sm4S9HVGHJoude0APTZoa/9KugenKQwQrA1Owb5kY9whuDB1t3T6guIxm1kUJLWCf3eVip
	jOoEL1WbhKtBzrsACorStCMNWzZPqWu7rBj3tAvvTWR6COSGjzXCJHrze8jlfQ50fO/dkHvM3Z5
	bFW
X-Received: by 2002:a05:600d:6452:10b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4926689ac37mr8227105e9.36.1782367688453;
        Wed, 24 Jun 2026 23:08:08 -0700 (PDT)
Message-ID: <d0b60963-6711-44ed-833d-83ac9de50aa9@suse.com>
Date: Thu, 25 Jun 2026 08:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device
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
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
 <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
 <b4770ce2-9456-4dae-a322-c8e3f9239472@gmail.com>
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
In-Reply-To: <b4770ce2-9456-4dae-a322-c8e3f9239472@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782367689-C533668D-32EEB0EA/0/0
X-purgate-type: clean
X-purgate-size: 5281
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2B656C2E52

On 24.06.2026 17:21, Oleksii Kurochko wrote:
> On 6/22/26 5:57 PM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/intc.h
>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>> @@ -13,6 +13,7 @@ enum intc_version {
>>>   };
>>>   
>>>   struct cpu_user_regs;
>>> +struct domain;
>>>   struct irq_desc;
>>>   struct kernel_info;
>>>   struct vcpu;
>>> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>>>       /* hw_irq_controller to enable/disable/eoi host irq */
>>>       const struct hw_interrupt_type *host_irq_type;
>>>   
>>> +    /* hw_irq_controller to enable/disable/eoi guest irq */
>>> +    const struct hw_interrupt_type *guest_irq_type;
>>
>> It's likely my limited RISC-V knowledge that I find this extremely odd:
>> Separate struct hw_interrupt_type-s for host and guest?
> 
> The guest and host interrupt controllers may handle some 
> hw_irq_controller operations differently, even though the operations 
> themselves are conceptually the same. The hw_irq_controller interface 
> provides fairly abstract interrupt controller operations, but the 
> underlying implementation may differ depending on whether the controller 
> is used by the host or a guest.
> 
> As an example, the Arm code already follows this approach:
> 
> /* XXX different for level vs edge */
> static hw_irq_controller gicv2_host_irq_type = {
>      .typename     = "gic-v2",
>      .startup      = gicv2_irq_startup,
>      .shutdown     = gicv2_irq_shutdown,
>      .enable       = gicv2_irq_enable,
>      .disable      = gicv2_irq_disable,
>      .ack          = gicv2_irq_ack,
>      .end          = gicv2_host_irq_end,
>      .set_affinity = gicv2_irq_set_affinity,
> };
> 
> static hw_irq_controller gicv2_guest_irq_type = {
>      .typename     = "gic-v2",
>      .startup      = gicv2_irq_startup,
>      .shutdown     = gicv2_irq_shutdown,
>      .enable       = gicv2_irq_enable,
>      .disable      = gicv2_irq_disable,
>      .ack          = gicv2_irq_ack,
>      .end          = gicv2_guest_irq_end,
>      .set_affinity = gicv2_irq_set_affinity,
> };
> 
> These implementations reuse almost all interrupt controller operations, 
> differing only in the .end callback.

Which I'm having trouble with as well. Interrupts are handled by Xen. What
guests get to see are virtualized interrupts (no matter how much HW
acceleration may be in use). Hence I'm having difficulty to see such a
split justified.

>>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>>> +    for ( ;; )
>>> +    {
>>> +        action = *action_ptr;
>>> +        if ( !action )
>>> +        {
>>> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
>>> +            spin_unlock_irqrestore(&desc->lock, flags);
>>> +            return;
>>> +        }
>>> +
>>> +        if ( action->dev_id == dev_id )
>>> +            break;
>>> +
>>> +        action_ptr = &action->next;
>>> +    }
>>> +
>>> +    /* Found it - remove it from the action list */
>>> +    *action_ptr = action->next;
>>> +#else
>>> +    action = *action_ptr;
>>> +    *action_ptr = NULL;
>>> +#endif
>>> +
>>> +    /* If this was the last action, shut down the IRQ */
>>> +    if ( !desc->action )
>>> +    {
>>> +        desc->handler->shutdown(desc);
>>> +        __clear_bit(_IRQ_GUEST, &desc->status);
>>> +    }
>>> +
>>> +    spin_unlock_irqrestore(&desc->lock,flags);
>>> +
>>> +    /* Wait to make sure it's not being used on another CPU */
>>> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
>>
>> Can you explain to me what the purpose of this barrier is?
> 
> if  do_IRQ() was called and:
>      desc->status |= IRQ_INPROGRESS;
> was called we have to wait while irq will be handled to avoid NULL 
> pointer derefenece caused by in do_IRQ():
>      action = desc->action;
> 
> So if release_irq() and do_irq() are called on different CPUs we want to 
> be sure that do_IRQ() make desc->status visiable for all CPUs.

For that you need smp_rmb(), not smp_mb(). And then it needs to be clear what
the write-side counterpart is (presumably the spin-unlock in do_IRQ()).

>>> +int release_guest_irq(struct domain *d, unsigned int virq)
>>> +{
>>> +    struct irq_desc *desc = irq_to_desc(virq);
>>> +    struct irq_guest *info;
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&desc->lock, flags);
>>> +
>>> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
>>> +        goto unlock_err;
>>> +
>>> +    info = irq_get_guest_info(desc);
>>> +    if ( d != info->d )
>>> +        goto unlock_err;
>>> +
>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>> +
>>> +    release_irq(desc->irq, info);
>>> +    xvfree(info);
>>
>> So you drop the lock keeping the info associated with desc in place. How
>> do you know what you free here is the correct thing, and isn't in use
>> elsewhere?
> 
> The object freed is captured under desc->lock (info = 
> irq_get_guest_info(desc)), so it is by construction the dev_id of the 
> action attached to this desc, it can't be a stale or wrong pointer.

Why would this be? Another request_irq() (or whatever it is) can race this,
can't it?

Jan

