Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEq9DJiPjGlQrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:18:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89926125215
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227702.1534138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqB1Y-0005VL-09; Wed, 11 Feb 2026 14:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227702.1534138; Wed, 11 Feb 2026 14:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqB1X-0005Ub-SV; Wed, 11 Feb 2026 14:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1227702;
 Wed, 11 Feb 2026 14:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqB1V-0005UV-Sw
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:16:58 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5227a5ec-0754-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:16:56 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43622089851so1931108f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 06:16:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d325f7sm4955120f8f.8.2026.02.11.06.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:16:55 -0800 (PST)
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
X-Inumbo-ID: 5227a5ec-0754-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770819416; x=1771424216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C4vFL5KCpONqE19NIo9Oy16WwOLn2UXK02zwP2V/YCI=;
        b=GtPd923Gf8w4Sdd1nrxI+tW5b9aNfD96Fkw6/DPIChJ0irhTpTExFP18IbF4p4hyTp
         5YnDASjdl8AjtfyilfBEM/THuYemSRhKln/BqTWIn6qjUltjFS/zj4uNWwVN3c7PDBAx
         bSnUDJJTJj/darMxawk0x0kqNP+6ZvOjwrAyLcQPuL6ncgBpD1/zRnCYfvxkvyCezGhN
         bnulE3eE1cbCzEsnsIvmrQMMFFa0PMqiPKCToh4tJul9TC89KnF+KdVBRRiDt7EWRvaP
         qtoVeNNlx/Bv4LXNjceQptoWIO+LRlQloodqph9B3M5xCiEnjgu7Y868qmPP/Wxph4HB
         OFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819416; x=1771424216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4vFL5KCpONqE19NIo9Oy16WwOLn2UXK02zwP2V/YCI=;
        b=FXGU0nwr4AFYAKFdDxkUAcGUWiUoO2AxT/idT9mWj1eF+H4Y/tGYpKkuJPBcMcO3g6
         NbBv6UJx0f1/BmBodZ6kPXeUS+ytM+BFFIECqgdiWekEHAQbn1ph56VK7j7XZ8zvfMDF
         lavhHNAWKb5B89ysgtWC5ajF2pplTmkn8Nrc1S9B1Vlmkes20kxAeImkeEHHsTN2XQlg
         yiTAMogXgMw9YT9sU9e688jZyyYt2IwrOwZKr/rv9TZZVAH0PKNfyUkXJU2QylmeM4vn
         krgXavXtK7IaInTrZQRV4GydmErOOdMjnd33nR2qaTU9lkFDVVV0E0hpuFumvDrTNMCB
         0GwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0p78VDnOC+zN1gDDhSt+V0AnUC4E81pS0YA74i0fCvnOEamY+Zo5NkO1R2uMxozfE625DFPZdjbQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYpqJPw1Aq0RJB9K1GGYCwaZwLWxFJDBJmG26QYVcVkx/839CJ
	JFGXt4EYP2Zw65xPtQbM+M8s7mTAQ2DEe8OIZ6SPsSaHfm/Y4BE41qktxgioel6Pfw==
X-Gm-Gg: AZuq6aLcvIiW3MxHPp27dwfcOqOihqY+2z2UTL7SGEN92XHIhVjpLF1r0dKN/DIIzJW
	OMLjfrgks53bZp3o/d4zY2M8rDFEj/JpDZjT9TRzHWWQgaF23hsVOUnONn67psNDN8RYdGHWRKg
	a5OLSiyZbASjTnozj8MCh8bnPle3iWd94VGlazWGx6bkJnhaYWefJBqAfSSyfZ+hfTTWkIobNop
	XrsvAGCsV5oM3Tn9M093IlB3YOZ+QRj2gCazdtGiVZpiSOoPPYNdf6L+YqvKT0GQKFPwxIuq69W
	LK9KjIqaBdejQwq2D4bVFu56C7mKtQDbSqcB9w5RlubfGU8tPtnjpd05s8Qz7iZBNXHzt5zb0Zt
	hg4WP3l8n0oFGmE4phRPMSxHGckZWI8FybREfkyf85HvJdvSkCdAc4t+so2PHxsQuO/tuvjA/SS
	Xqyum/3jt38E1giMAH58mFva8nvbZk4jkvjJfnSe5Si/g3LsPlM0dMvxY2KrBWrRiD7T4eq/D7W
	KRHENIBaWykCkY=
X-Received: by 2002:a05:6000:2902:b0:435:a600:2601 with SMTP id ffacd0b85a97d-436293410dbmr28315894f8f.16.1770819415424;
        Wed, 11 Feb 2026 06:16:55 -0800 (PST)
Message-ID: <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
Date: Wed, 11 Feb 2026 15:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 89926125215
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> Based on Linux kernel v6.16.0.
> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
> we want to guarantee that if a bit in irqs_pending_mask is obversable
> that the correspondent bit in irqs_pending is observable too.

And the counterpart of this barrier is the one encoded implicitly in
xchg()? Could do with making more explicit, e.g. by way of adding a
code comment there.

> Add lockless tracking of pending vCPU interrupts using atomic bitops.
> Two bitmaps are introduced:
>  - irqs_pending — interrupts currently pending for the vCPU
>  - irqs_pending_mask — bits that have changed in irqs_pending
> 
> The design follows a multi-producer, single-consumer model, where the
> consumer is the vCPU itself. Producers may set bits in
> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
> performed only by the consumer via xchg_acquire().

What is xchg_acquire() in Xen? I can't spot anything like this.

> The consumer must not
> write to irqs_pending and must not act on bits that are not set in the
> mask. Otherwise, extra synchronization should be provided.
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
> It is possible a guest could have pending bit not result in the hardware
> register without to be marked pending in irq_pending bitmap as:

Are there some words missing in this sentence? I find it hard to follow
the way it is.

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

s/writable/written/ ?

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
> and are read-only:
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

In what you quote there is something being said about bits being r/o in hip,
but I can't conclude the "cannot be modified by the guest" that is being said
ahead of the quotation.

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
> this ordering rule in vcpu_sync_interrupts().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Use smp_wb() instead of smp_mb__before_atomic().
>  - Add explanation of the change above in the commit message.
>  - Move vcpu_sync_interrupts() here to producers side.
>  - Introduce check_for_pcpu_work() to be clear from where vcpu_sync_interrupts()
>    is called.
> ---
> Changes in V2:
>  - Move the patch before an introduction of vtimer.
>  - Drop bitmap_zero() of irqs_pending and irqs_pending_mask bitmaps as
>    vcpu structure starts out all zeros.
>  - Drop const for irq argument of vcpu_{un}set_interrupt().
>  - Drop check "irq < IRQ_LOCAL_MAX" in vcpu_{un}set_interrupt() as it
>    could lead to overrun of irqs_pending and irqs_pending_mask bitmaps.
>  - Drop IRQ_LOCAL_MAX as there is no usage for it now.
> ---
>  xen/arch/riscv/domain.c             | 70 +++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/domain.h | 24 ++++++++++
>  xen/arch/riscv/traps.c              |  8 ++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index af9586a4eb0d..4513f778cdc4 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -5,6 +5,7 @@
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/riscv_encoding.h>
> @@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
>  {
>      vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
>  }
> +
> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
> +{
> +    /*
> +     * We only allow VS-mode software, timer, and external
> +     * interrupts when irq is one of the local interrupts
> +     * defined by RISC-V privilege specification.
> +     */

What is "when irq is one ..." intended to be telling me? There's no ...

> +    if ( irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;

... corresponding code (anymore), afaict.

Further, who are the prospected callers of this function and its sibling
below? If they're all internal (i.e. not reachable via hypercalls or
emulation on behalf of the guest), this may want to be assertions.

> +    set_bit(irq, v->arch.irqs_pending);
> +    smp_wmb();
> +    set_bit(irq, v->arch.irqs_pending_mask);
> +
> +    vcpu_kick(v);

Shouldn't this be conditional upon the pending_mask bit going from 0 to
1?

> +void vcpu_sync_interrupts(struct vcpu *v)
> +{
> +    unsigned long hvip;
> +
> +    /* Read current HVIP and VSIE CSRs */
> +    v->arch.vsie = csr_read(CSR_VSIE);
> +
> +    /* Sync-up HVIP.VSSIP bit changes done by Guest */
> +    hvip = csr_read(CSR_HVIP);
> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) &&

Nit: Parentheses please around an & expression when used in an &&
one.

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
> +#define RISCV_VCPU_NR_IRQS 64

What is this 64 deriving from? IOW - can it be some kind of expression,
helping the reader?

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -169,6 +169,11 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +static void check_for_pcpu_work(void)
> +{
> +    vcpu_sync_interrupts(current);
> +}

Is this really a helpful wrapper? Or is there going to be more stuff in here
later on?

Jan

