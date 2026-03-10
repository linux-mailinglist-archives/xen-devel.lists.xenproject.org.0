Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBlWNabSr2kfcgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:13:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A402247158
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249858.1547240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsDM-0001Cs-1Y; Tue, 10 Mar 2026 08:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249858.1547240; Tue, 10 Mar 2026 08:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsDL-0001AH-Tu; Tue, 10 Mar 2026 08:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1249858;
 Tue, 10 Mar 2026 08:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzsDK-0001AB-52
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 08:13:14 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb19602a-1c58-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 09:13:12 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so18509495e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 01:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48536b5b3absm59710785e9.32.2026.03.10.01.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 01:13:11 -0700 (PDT)
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
X-Inumbo-ID: fb19602a-1c58-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773130391; x=1773735191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6b7G87Vo157IaGbJCatI+989xIlbUVkO1fK/stTSOIA=;
        b=BNL7HLb2TGQS3fWjfvZq3/XttHJGyo+FIjjAxsP4kRL02NKDWV0mDMDBh5hvXn4UYx
         alXJ/44X2HVTvUGK6JxukECSKSE8xXwTVjYNi8y6qiJzzFqWgQzqiWJr7UMF+njbLfLa
         mqtTTz+Qg4iebkn6MYPoasc8qqcozIu+G0+2qlFdLlhHCy7mtNU9bzoieSHXRuzEh31O
         nYHdhUxaybumuuEEH2wSbLDJl/pdoEtkl7oR8iOhBFATMzn/Pw/XJnW5jeOwsNDpZOWs
         H1Y+VvVsHzoztFtkK7dMD9ilM4mTBjxExSPNSyjvDCHQqiMNY2BGJtckELocwPUoQjx1
         eJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130391; x=1773735191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b7G87Vo157IaGbJCatI+989xIlbUVkO1fK/stTSOIA=;
        b=pUSI+Ud45RlsXLfxDQPGQ6fYSLSz6IH7o2HIBSbb/KXkRdbL1qV7ynUnNzKAtqCEBE
         bp/p68SDi2BQ8zj+6Ki11hVu+NO41X007lpOM8TctVMNLfOJ1NxID8WA1bLf/bUu6fWD
         oGATCzvbYjwUxxeXtlJmrDL0nziDtatRXGb7+UlzZTAjtKINH8TtPg+b9d6LNWkji/rk
         DZ3kp8djD8YaxDd9pP9RLUdvl01WYJ1lBttyjzlOarjkN60PrA1bMzRjBiMjxjR8McDi
         QAgpM6c/sKvJqYFAPqAE1bdur8NQBIGctZnN5DiCFhpkx4FospbJBeM5MPAUwI6YCR95
         ubtw==
X-Forwarded-Encrypted: i=1; AJvYcCUYsnXhbra5PgQhdj+lE3f0564L1Ik18n3fh/Ykm4j2MxB86UoQobchOHA+j68j1j55IW19I+2BqJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIESGy4pEHVtmOZFOo4lboJ0T/SuiXFe6DcaYyZHLYgJ5TETXa
	QBQo5JpIxOLbrNyvqyydatzNxGd2MUt1VsSlJZ8KMYs45vorAasuf7MgYZ67WsFBWw==
X-Gm-Gg: ATEYQzxyNsS9b9kM4OO+E3Gaa3T8dUrfDocJZAsLrOWBYWGUnisXwtFAv+XprJ1TFyX
	iRS05GheGfEmX+AiEh0DS9Lr8+USaHFNyGUnSFUSPDF2xpeA2vmzPp0cN73rTzwvrq8YuJK82E8
	YF+Ox9qV2mrlsuS71L3nVzgZVo/OkJAt/eX6RKDGK/1zU4oHPYFC3a3+N0AQJOgbnRnEqNRDSxc
	5fpnDoeGcP/uU/5cmK9mIH9mADRIgLofRSqanBJrBae2j0bJYuL22fQ756cKz8+kyWc9uKfYU0Z
	NcPUS41DCt/18x1EGIPZATgayMdQcHzqOfFXhckptNeyYLPjMAU6tbQoZYqIuWbP0MKV7JUMR5n
	mINdesFn+SkfXsxfddc28Jo3D5pou17ve1fIKLNBH1IbX0NvX0y53LHBgZnHYDpNguVmWao/Sj0
	IUGqgLUuIe0Eg8JSWZTdDQBveErd1Y0UEhttABDBCHs1ah3wKvdlUZd9DGRo1LLG/jb/t6btlL0
	bF6GRRvNDqyZ/oASKSq7wULag==
X-Received: by 2002:a05:600c:811a:b0:485:4535:73d with SMTP id 5b1f17b1804b1-4854535091fmr11150265e9.2.1773130391408;
        Tue, 10 Mar 2026 01:13:11 -0700 (PDT)
Message-ID: <794ecd76-29f3-464e-889b-b3800fda9cd9@suse.com>
Date: Tue, 10 Mar 2026 09:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/14] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <949104bf183688fa0416845fe7e3c19c2c5b2a2d.1772814110.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <949104bf183688fa0416845fe7e3c19c2c5b2a2d.1772814110.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A402247158
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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

On 06.03.2026 17:33, Oleksii Kurochko wrote:
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

Acked-by: Jan Beulich <jbeulich@suse.com>


