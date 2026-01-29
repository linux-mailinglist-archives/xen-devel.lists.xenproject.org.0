Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJsnGZSSe2nOGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:02:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409EB293C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216906.1526819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVOv-0004bG-VZ; Thu, 29 Jan 2026 17:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216906.1526819; Thu, 29 Jan 2026 17:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVOv-0004ZI-Ss; Thu, 29 Jan 2026 17:01:49 +0000
Received: by outflank-mailman (input) for mailman id 1216906;
 Thu, 29 Jan 2026 17:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlVOu-0004ZC-L8
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 17:01:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31a00db2-fd34-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 18:01:46 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso973129f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 09:01:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e476dsm15711848f8f.4.2026.01.29.09.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 09:01:45 -0800 (PST)
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
X-Inumbo-ID: 31a00db2-fd34-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769706106; x=1770310906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KGZ//S/eoyd0DV8Ciatjv9y3uqiqnAF8V09hA+6Di3M=;
        b=DtnAw5PydVEfx/Mx8itrCJtKurbFXh7Ze4JCMgjJApTadjI3tTr5TSPCG9xmToyVZ/
         c3qg1LLa5YCZxLg/IuvmrkmhK6ZRH0yjm4shDE++2LG/f2t3PyuwZsoODm8S9n45eEpJ
         /d052IKtEKnadOVAzqaVWSZEtl4NbgqCO9KQ5xKrA2RfEvBkHUlsp+dHTsyyvKPHQvZf
         BtpaM4sVdlvge+bclReD756JZTEZGs7cz5iQ/W7BWKE2JgrL7kateQrO/9JT3lpns92O
         7ktTQ/WvDILHSZyf8m5laE4pFnSTwSPmp0rXlBEsL50xEqsCeR7HjDxUOpUG0nbwfF4/
         YQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769706106; x=1770310906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGZ//S/eoyd0DV8Ciatjv9y3uqiqnAF8V09hA+6Di3M=;
        b=vjiM6hdoxkuwA7LNWoqfRUojV9wPsnJ54q7MlE8l6e78B0rv9LPZnPaKWH7qm94Pqn
         HxKXoVe8MGSRLlFDYmnGy1RI6O01Piw0N9GMaP598nEMQinMciU2uLdN+UuPc7/TPUJF
         gpHVCZjXXWEvoU5Grs07u0i8el4K30UVW2M0oyvPY6s/BSbe4xgaA3BNy2lnnLgYTlxi
         RP89UYQkK+UZ6RITq0xAnVzLdz9ya96dgN/EoGXpslva8SBDDJd5GnwF6XERW2n3nJy7
         yruW2IUs+e1zpMbpAsMOfaL4lDKBkW0yABJ1uKUQLGTjrAu3Qk1px+VHSvN/x0oqAWgb
         vkSA==
X-Forwarded-Encrypted: i=1; AJvYcCX1NbRRMoxHyFE7tIDd1j9ZQPztTt6ZuotGGQKTftfncrnIqUBJefQuVbxxRHQUL4tiEyiqXSgEpPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx83aN0/pQkCrYtPSpUeliZjtVf1kk140jBgOMf/ccKty3CA3A6
	Hh7ZZW+6Kwj/5aYUh+k64l2Et5gvAHh+jnhezWkXXdg+iQ88Kai1nL17aFtN4B1dLw==
X-Gm-Gg: AZuq6aKZVnK+oPEc9t/rQWVPL9tCZljYyNyaY8gaXpEta0Fo0smFIh1gOP+RXgx0Yip
	f8Vv3hOsx8fUxb0UJp1ncSYRriDorLPYjT7pRvQ48NBX54nDMzzZd+3DDRTrxd1BdofrelTG2dm
	wYv3wR6iKfunVIisKCqMHSnGULpS9ZvbY6HITH3V4kilrS3Bct5olLk47jpXfq4dcTt1By2S6h4
	zO/uE+yiBbWfDkg0/0DVBVjMjoKCVyeaxXJK2/orLqabdA5dckFWR+zoF7gKxymnF59RFdct9tv
	wSHL7vLaFUPl9hVp96Pls8k6mD8pQ0CtGzww0yNwDrfRcvFTLE3kE9freXWdCIrpmtnVq6rM4Nc
	TCAtymabT45eheMopB9HjOIKurRZCeKXV7hpGaGSPc9pUEK5a2+V6YGU7zYyhIUlAejir+Oj3AO
	DO+G8Uc58+FeXlr0bNka18rlZtYsMMldHuY3QLNJgB9mn8WP7v0Wcer5bDZ4zDj81ufb2MiiXKm
	3M=
X-Received: by 2002:a05:6000:3110:b0:433:1d30:45f with SMTP id ffacd0b85a97d-435f3a6d009mr384971f8f.1.1769706105484;
        Thu, 29 Jan 2026 09:01:45 -0800 (PST)
Message-ID: <1bd0726d-20d8-4506-bb8e-849fd8b091a7@suse.com>
Date: Thu, 29 Jan 2026 18:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <58a7723ec48d84b91fd4730fe3ae653f55a0fd99.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <58a7723ec48d84b91fd4730fe3ae653f55a0fd99.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8409EB293C
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> This patch is based on Linux kernel 6.16.0.
> 
> Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
> interrupt tracking introduced in part 1 (for producers). According, to the
> design only one consumer is possible, and it is vCPU itself.
> vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
> to the lack of functionality) before the hypervisor returns control to the
> guest.
> 
> Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
> irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
> release semantics). The consumer must not write to irqs_pending and must not
> act on bits that are not set in the mask. Otherwise, extra synchronization
> should be provided.
> The worst thing which could happen with such approach is that a new pending
> bit will be set to irqs_pending bitmap during update of hvip variable in
> vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
> be lost and just be proceded during the next flush.
> 
> It is possible a guest could have pending bit not result in the hardware
> register without to be marked pending in irq_pending bitmap as:
>   According to the RISC-V ISA specification:
>     Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
>     interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
>     is an alias (writable) of the same bit in hvip.
>   Additionally:
>     When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
>     zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
>     hie.VSSIE.
> This means the guest may modify vsip.SSIP, which implicitly updates
> hip.VSSIP and the bit being writable with 1 would also trigger an interrupt
> as according to the RISC-V spec:
>   These conditions for an interrupt trap to occur must be evaluated in a
>   bounded   amount of time from when an interrupt becomes, or ceases to be,
>   pending in sip,  and must also be evaluated immediately following the
>   execution of an SRET  instruction or an explicit write to a CSR on which
>   these interrupt trap conditions expressly depend (including sip, sie and
>   sstatus).
> What means that IRQ_VS_SOFT must be synchronized separately, what is done
> in vcpu_sync_interrupts().

And this function is going to be used from where? Exit from guest into the
hypervisor? Whereas vcpu_flush_interrupt() is to be called ahead of re-
entering the guest?

I ask because vcpu_sync_interrupts() very much looks like a producer to me,
yet the patch here supposedly is the consumer side.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -171,3 +171,68 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
>  
>      return 0;
>  }
> +
> +static void vcpu_update_hvip(struct vcpu *v)

Pointer-to-const?

> +{
> +    csr_write(CSR_HVIP, v->arch.hvip);
> +}
> +
> +void vcpu_flush_interrupts(struct vcpu *v)
> +{
> +    register_t *hvip = &v->arch.hvip;
> +
> +    unsigned long mask, val;

These are used ...

> +    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
> +    {
> +        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
> +        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
> +
> +        *hvip &= ~mask;
> +        *hvip |= val;

... solely in this more narrow scope.

> +    }
> +
> +    /*
> +     * Flush AIA high interrupts.
> +     *
> +     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
> +     * now.
> +     */
> +#ifdef CONFIG_RISCV_32
> +#   error "Update hviph"
> +#endif
> +
> +    vcpu_update_hvip(v);

Why would bits for which the mask bit wasn't set be written here?

> +void vcpu_sync_interrupts(struct vcpu *v)
> +{
> +    unsigned long hvip;
> +
> +    /* Read current HVIP and VSIE CSRs */
> +    v->arch.vsie = csr_read(CSR_VSIE);
> +
> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */

Nit: s/does/done/ ?

> +    hvip = csr_read(CSR_HVIP);
> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
> +    {
> +        if ( !test_and_set_bit(IRQ_VS_SOFT,
> +                               &v->arch.irqs_pending_mask) )

Why two separate, nested if()s?

> +        {
> +            if ( hvip & BIT(IRQ_VS_SOFT, UL) )
> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
> +            else
> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
> +        }

In the previous patch you set forth strict ordering rules, with a barrier in
the middle. All of this is violated here. 

> +    }
> +
> +    /*
> +     * Sync-up AIA high interrupts.
> +     *
> +     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
> +     * now.
> +     */
> +#ifdef CONFIG_RISCV_32
> +#   error "Update vsieh"
> +#endif

Here you mean the register or the struct vcpu field? It may be helpful to
disambiguate; assuming it's the latter, simply spell out v->arch.vsieh?
(Same then for the similar code in vcpu_flush_interrupts().)

Jan

