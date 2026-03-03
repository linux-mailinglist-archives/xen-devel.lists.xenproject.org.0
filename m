Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CDjEpfjpmnpYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:35:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B182A1F05D6
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244765.1544135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPtz-0001k9-3B; Tue, 03 Mar 2026 13:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244765.1544135; Tue, 03 Mar 2026 13:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPtz-0001h1-04; Tue, 03 Mar 2026 13:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1244765;
 Tue, 03 Mar 2026 13:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxPtx-0001gi-HZ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 13:35:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ad0013-1705-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 14:35:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4837634de51so23779425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 05:35:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b3ce8fsm352299085e9.4.2026.03.03.05.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 05:35:02 -0800 (PST)
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
X-Inumbo-ID: c8ad0013-1705-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772544903; x=1773149703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BOScuocRZ/Rl9yggjOBZAfpMkRprvyewmshNYbrzw8A=;
        b=Htvyj5/QpHx2UxtK1YGz918JFsdkdO06nQBCGiMwZnpml8jdUBSq1o+qeQsUFr88DJ
         b+GAJD78GKMJKH3PYFHvUmvuMYq45LlyNcEfhYfKO+C/g+fock9qeWnD5oytxOZKQrL5
         0u95AoOHB8o/1PHqyMJINNQBGTABR48fIPUHdHZihrK6Pf73LD3rga7Mg8WTLA/XZGqV
         2fzt6cnLNtH9v7xM651Df2yQWMLFabQNKUxCIVUxBO/GvVRq/4/5wvLn6kauJVXfl+Ix
         g9uOcMdr0T2Ho7zcQn9hFzfra8khmi+wOzbsB+7Iw4+MMXfo6+/ITupaelMVS+CFW97K
         bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544903; x=1773149703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOScuocRZ/Rl9yggjOBZAfpMkRprvyewmshNYbrzw8A=;
        b=s89rxUEOf1VGWnlDfkl8cb/4bWgabx+esxUvLfQvy6ZgmzUggwyhpXNoZ4CekWC3tW
         Ukd4KW3FLFRWp6/PI59ddf5tafuhU3S8h+cFO2n2aT30vN5yY81BdCALbRY0Popn8SVw
         fT4zgxh+oJrpnVdEfeoZF+s8dzq1inTSnvI2Yh5jqahqX4sp5938109CmFh5hum1lTVL
         Aapqt5IanzmB0c7n/CQHCIyLWsqkt1oaFxnXkRP7E6nnGKioNjh8O9fXNBefDJGbkNDz
         f4aVBS9/r7v/7j+IOGaPf6LpG6l1WgJmuI4HVGSQb7vaWe6DZlYqtbtgjfoIUArzWEqR
         ysuw==
X-Forwarded-Encrypted: i=1; AJvYcCVCfIVd6q6IBgjOpMwRUEXFWIQzsttyLCdDrwGs4XknVtC5G6amNHTn36/tQ4SxBxv429O22Xa9aIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4su3Aww/SugBh7qu3k/0ED5Gk4LBecuU1Jor6Qc9so7CxxXNd
	G11VvpjVWC1DZDHdQAEI7EwO01bxp72Q+oYXcoUhY1k2K+Tq2LvB/LmqkdOgxTtybA==
X-Gm-Gg: ATEYQzw2617Ab3st4wH8NUOqXYEAuYgFH6g0FKTawmqlAo/LkApSdtxRELzt43Nbr4V
	5aZsSvUoRNyB2qXJkVfw2T+2Q96XGLYhs7U7sngqNYOScC+UH6TWVcmIaCtSdg4ZHrho3DjFILB
	GXsRIaTczS8VS6jGwSFoFjGBxpulnPVbTuXpPGF8gQOE0nGIxNa7As/7kdcP1VKYMTZux2p3UMq
	M1dQgUJDnXRqIY4EbseAfVd6hHUhlrTvK/mFHkMlFSE1nZrd3+gPSlADmASCkd+vna1hGI9W+LT
	4fGdXf7bhEhDxvHoaQu62lxrRDRw1wE+coWe8NOCK+MU9fjMG57/aF+25h/Y2u8LR96b4q/spjT
	FnoXdbOp7mMc2MlOoXlFPINKUmCWcL62lsFzQTdFiurz0gAWYwFNXbemqR3iYcvd14x47vrfVA6
	04FjPFRwIoaV3CQBB1If3S1oqfdhmaJ+oqAbmkQAYVY8oULYPwhd4yOlF5wR6ilCJrCuMchfigu
	qlUSr1FmimOcnKGsP/LJ/kfjA==
X-Received: by 2002:a05:600c:4444:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483c9c323d8mr250859045e9.34.1772544902787;
        Tue, 03 Mar 2026 05:35:02 -0800 (PST)
Message-ID: <6357ad3f-85c8-4fe4-a2c8-8b0a0a97f1b3@suse.com>
Date: Tue, 3 Mar 2026 14:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a1954e9a30abace453f4604a47b43ecbcebe350a.1772016457.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a1954e9a30abace453f4604a47b43ecbcebe350a.1772016457.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B182A1F05D6
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 12:51, Oleksii Kurochko wrote:
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
>   Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
>   bits for supervisor-level external interrupts. If implemented, SEIP is
>   read-only in sip, and is set and cleared by the execution environment,
>   typically through a platform-specific interrupt controller.
> 
>   Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
>   bits for supervisor-level timer interrupts. If implemented, STIP is
>   read-only in sip, and is set and cleared by the execution environment
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
> sequentially immediately before VM entry, it is safe to slightly relax
> this ordering rule in vcpu_sync_interrupts().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v6:
>  - Drop for the moment:
>        /* Read current HVIP and VSIE CSRs */
>        v->arch.vsie = csr_read(CSR_VSIE);
>    from vcpu_sync_interrupts() as it isn't used at the moment and will
>    be introduced when a usage will be more clear.

With this, shouldn't the RV32 related #ifdef in vcpu_sync_interrupts() also
go away?

> +void vcpu_sync_interrupts(struct vcpu *v)

The sole caller passes "current". Are other uses of this function planned?
If not either "current" wants directly using here, or minimally the parameter
wants renaming to "curr". In fact ...

> +{
> +    unsigned long hvip = csr_read(CSR_HVIP);

... this suggests it's unlikely for the function to be valid to call with
other than "current".

Jan

