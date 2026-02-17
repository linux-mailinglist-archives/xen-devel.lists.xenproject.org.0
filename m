Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNB5JKh+lGmnFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:43:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42F14D3F4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235101.1538145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMIL-00073x-OH; Tue, 17 Feb 2026 14:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235101.1538145; Tue, 17 Feb 2026 14:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMIL-000717-LA; Tue, 17 Feb 2026 14:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1235101;
 Tue, 17 Feb 2026 14:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsMIK-000711-8R
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:43:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fefc4c39-0c0e-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 15:43:17 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so45417995e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:43:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d46sm36002761f8f.32.2026.02.17.06.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:43:16 -0800 (PST)
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
X-Inumbo-ID: fefc4c39-0c0e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771339397; x=1771944197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xPqex+Qa7cGhryCr72V4fQ1JeLnlvnLBWtT1cOg3SrY=;
        b=XljqaBEQz/z4X8x0vj6Z3GGESOAnI3k8GScBBKsFYgN4FTk+bIWvgL7qKaLrdtcens
         ieCWBPHF3HJ8XAt/oLPqTx7SYDzv7RtzwOQbuoURT1uZwKgNw6QLE7qcr7GOWzIaClK3
         FKUt4y6Vj5uzmXkknCjGqtXBh86lcJ/4DuZBcKF1rmrrZuNazRVfzBUHatTNrnWwU/pV
         0LOZLY2bNNysBKNYnBqD6Do6Kc39rYpKuyBF9Kh71yDHJ/HkVSxWAwiqXLDrtu2ZlMMy
         FExmv25fEi1r68lllSGYbqR+A9/fOyfUH1+7lGltxkaXMfzGR2ZHwq2WfDGSYj4eSLNb
         mjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339397; x=1771944197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPqex+Qa7cGhryCr72V4fQ1JeLnlvnLBWtT1cOg3SrY=;
        b=Gl0TZ4kP8685v67tWLwLtpZYXijKiAhBhXkE15ZmB57+z7Dum/iibj1zAK1WNuL/4/
         ggs0J2iAegYvtHI7/b4cXo+yTymYfn831912GeDnOV5ucJHAueHzg5RTYqZie/lDi+nP
         bNmITd7f2xLbjo938HzsasVS1QQnqJ5d23ULboalqOPIhokc5qq+DYZRslxaQpnWG5Ew
         901Z63RMIbjtGFYUYp+WHbyQjiZNy1+4mSpMTfkhEYnSRnosnZD9liXZzC8fB9Ovngw3
         cTTQuMCRgWR6266BUcCZPka50qfUXaIxBBrQ+4f03OMtEzDkXHb5r83hsmnz6MYzvdyb
         EmEA==
X-Forwarded-Encrypted: i=1; AJvYcCXLyOt3E1IogAWL2XcdxfhLnqr7YpLmnlej/9afLt8NnyqylAcwXqQtURbmpxehvVZJ62LTaKTc0D8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/4RG5pZKjt7jAwfj7Nr3ku3fC2BwseuRuvzvixNu+gEROL+Cz
	urtFxXITveB5ZjmR3DAjyTKiTotuah6Q3/ooYMK/AT1ntn7CqZXvo1vQMBEfp93UBQ==
X-Gm-Gg: AZuq6aJqiuCj2xrRO1pxs3/l5AbkJEMvkx3M8aCusjrTCf/E/VXrYZX6KSLK6v6APmI
	da6E9QyhLB5/lN+MOl+b+mMs9n5xmfmBI1p27TJ8uRKxJWwDeWE7AiZwKFBmhQaKzMtu762Te6B
	+7mE5KfnJnn+hxpzCBsCl7k+y6Lm5ve69ojmAKfyMFOX8hUxV8GidIHfbHT3+nkbHToaYqPLnVq
	ik8E8xr1YDr/Qzkq4ur+OZA/QpSHb5H7vjdwddQDD1P54TR5yuUYhUTZgUlkCAmgyCAY6D7K7jx
	0kgsTYb04tVT2dQL3ZzlAHi91r1W9egHmP/KIcWoniI4y4IJwsCOEx79AKqF+/e9w5+0fzbg1L7
	jNq4ioDnht+iglsLKvAZak5ATV8DCOzuj0Cn9A/QdFbu7kw0CK2WI2K5RWgeqfUltQopCJag35P
	uuKZIhxM2ceM2LAcnFZ/MvmR9Rj2hciMeT58V6/YyF7cJhn3BudFfsALW6+HZnEsE5RIgoWZZHl
	VmxlsOlaDIWG5c=
X-Received: by 2002:a05:6000:230b:b0:436:1597:7c7c with SMTP id ffacd0b85a97d-4379d5eb3d7mr23003221f8f.13.1771339396500;
        Tue, 17 Feb 2026 06:43:16 -0800 (PST)
Message-ID: <fd62a140-ad87-4886-be8d-836dae298cb1@suse.com>
Date: Tue, 17 Feb 2026 15:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <63661b60f5e1678c93f7ea34e5cf479ca28bc80d.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <63661b60f5e1678c93f7ea34e5cf479ca28bc80d.1770999383.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB42F14D3F4
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> Based on Linux kernel v6.16.0.
> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
> we want to guarantee that if a bit in irqs_pending_mask is obversable
> that the correspondent bit in irqs_pending is observable too.
> 
> Add lockless tracking of pending vCPU interrupts using atomic bitops.
> Two bitmaps are introduced:
>  - irqs_pending — interrupts currently pending for the vCPU
>  - irqs_pending_mask — bits that have changed in irqs_pending
> 
> The design follows a multi-producer, single-consumer model, where the
> consumer is the vCPU itself. Producers may set bits in
> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
> performed only by the consumer via xchg(). The consumer must not write
> to irqs_pending and must not act on bits that are not set in the mask.
> Otherwise, extra synchronization should be provided.
> 
> On RISC-V interrupts are not injected via guest registers, so pending
> interrupts must be recorded in irqs_pending (using the new
> vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
> HVIP before returning control to the guest. The consumer side is
> implemented in a follow-up patch.
> 
> A barrier between updating irqs_pending and setting the corresponding
> mask bit in vcpu_set_interrupt()/vcpu_unset_interrupt() guarantees
> that if the consumer observes a mask bit set, the corresponding pending
> bit is also visible. This prevents missed interrupts during the flush.
> 
> It is possible that a guest could have pending bit in the hardware
> register without being marked pending in irq_pending bitmap as:
>   According to the RISC-V ISA specification:
>     Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
>     interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
>     is an alias (writable) of the same bit in hvip.
>   Additionally:
>     When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
>     zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
>     hie.VSSIE.
> This means the guest may modify vsip.SSIP, which implicitly updates
> hip.VSSIP and the bit being written with 1 would also trigger an interrupt
> as according to the RISC-V spec:
>   These conditions for an interrupt trap to occur must be evaluated in a
>   bounded   amount of time from when an interrupt becomes, or ceases to be,
>   pending in sip,  and must also be evaluated immediately following the
>   execution of an SRET  instruction or an explicit write to a CSR on which
>   these interrupt trap conditions expressly depend (including sip, sie and
>   sstatus).
> What means that IRQ_VS_SOFT must be synchronized separately, what is done
> in vcpu_sync_interrupts(). Note, also, that IRQ_PMU_OVF would want to be
> synced for the similar reason as IRQ_VS_SOFT, but isn't sync-ed now as
> PMU isn't supported now.
> 
> For the remaining VS-level interrupt types (IRQ_VS_TIMER and
> IRQ_VS_EXT), the specification states they cannot be modified by the guest
> and are read-only because of:

"cannot be modified by the guest" is still meaning about anything. Aren't you
intending to merely talk about their pending bits? Then all of ...

>   Bits hip.VSEIP and hie.VSEIE are the interrupt-pending and interrupt-enable
>   bits for VS-level external interrupts. VSEIP is read-only in hip, and is
>   the logical-OR of these interrupt sources:
>     • bit VSEIP of hvip;
>     • the bit of hgeip selected by hstatus.VGEIN; and
>     • any other platform-specific external interrupt signal directed to
>       VS-level.
>   Bits hip.VSTIP and hie.VSTIE are the interrupt-pending and interrupt-enable
>   bits for VS-level timer interrupts. VSTIP is read-only in hip, and is the
>   logical-OR of hvip.VSTIP and any other platform-specific timer interrupt
>   signal directed to VS-level.
> and
>   When bit 10 of hideleg is zero, vsip.SEIP and vsie.SEIE are read-only zeros.
>   Else, vsip.SEIP and vsie.SEIE are aliases of hip.VSEIP and hie.VSEIE.
> 
>   When bit 6 of hideleg is zero, vsip.STIP and vsie.STIE are read-only zeros.
>   Else, vsip.STIP and vsie.STIE are aliases of hip.VSTIP and hie.VSTIE.
> and also,

... this is largely irrelevant, while ...

>   Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
>   bits for supervisor-level external interrupts. If implemented, SEIP is
>   read-only in sip, and is set and cleared by the execution environment,
>   typically through a platform-specific interrupt controller.
> 
>   Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
>   bits for supervisor-level timer interrupts. If implemented, STIP is
>   read-only in sip, and is set and cleared by the execution environment

... this is important.

> Thus, for these interrupt types, it is sufficient to use vcpu_set_interrupt()
> and vcpu_unset_interrupt(), and flush them during the call of
> vcpu_flush_interrupts() (which is introduced in follow up patch).
> 
> vcpu_sync_interrupts(), which is called just before entering the VM,
> slightly bends the rule that the irqs_pending bit must be written
> first, followed by updating the corresponding bit in irqs_pending_mask.
> However, it still respects the core guarantee that the producer never
> clears the mask and only writes to irqs_pending if it is the one that
> flipped the corresponding mask bit from 0 to 1.
> Moreover, since the consumer won't run concurrently because
> vcpu_sync_interrupts() and the consumer path are going to be invoked
> equentially immediately before VM entry, it is safe to slightly relax

Nit: There was an 's' lost at the start of the line.

> @@ -127,3 +128,73 @@ void arch_vcpu_destroy(struct vcpu *v)
>  {
>      vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
>  }
> +
> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
> +{
> +    /* We only allow VS-mode software, timer, and external interrupts */
> +    if ( irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;
> +
> +    set_bit(irq, v->arch.irqs_pending);
> +    /*
> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
> +     * which is used in consumer part (vcpu_flush_interrupts()).
> +     */
> +    smp_wmb();
> +    set_bit(irq, v->arch.irqs_pending_mask);

Wasn't this meant to go away with ...

> +    if ( !test_and_set_bit(irq, v->arch.irqs_pending_mask) )

... the introduction of this?

> +      vcpu_kick(v);

Nit: Bad indentation.

As to the test_and_set_bit(): In isolation here this looks correct, but
when taking ...

> +    return 0;
> +}
> +
> +int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
> +{
> +    /* We only allow VS-mode software, timer, external interrupts */
> +    if ( irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;
> +
> +    clear_bit(irq, v->arch.irqs_pending);
> +    /*
> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
> +     * which is used in consumer part (vcpu_flush_interrupts()).
> +     */
> +    smp_wmb();
> +    set_bit(irq, v->arch.irqs_pending_mask);
> +
> +    return 0;
> +}

... this into account - what about vcpu_unset_interrupt() followed by
vcpu_set_interrupt()? Shouldn't that also result in a kick? I.e.
shouldn't the condition above be whether either of the two bits
transitioned from 0 to 1?

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -54,6 +54,25 @@ struct arch_vcpu {
>      register_t henvcfg;
>      register_t hideleg;
>      register_t hstateen0;
> +    register_t hvip;
> +
> +    register_t vsie;
> +
> +    /*
> +     * VCPU interrupts
> +     *
> +     * We have a lockless approach for tracking pending VCPU interrupts
> +     * implemented using atomic bitops. The irqs_pending bitmap represent
> +     * pending interrupts whereas irqs_pending_mask represent bits changed
> +     * in irqs_pending. Our approach is modeled around multiple producer
> +     * and single consumer problem where the consumer is the VCPU itself.
> +     *
> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
> +     * on RV32 host.
> +     */
> +#define RISCV_VCPU_NR_IRQS MAX(BITS_PER_LONG, 64)

In the revlog you mention also taking care of "the case if AIA isn't used".
I can't spot anything like this here.

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -169,6 +169,13 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +static void check_for_pcpu_work(void)
> +{
> +    struct vcpu *c = current;

As indicated, please try to get used to using conventional variable names.

Jan

