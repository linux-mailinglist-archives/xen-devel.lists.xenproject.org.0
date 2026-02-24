Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G2dLZCDnWlsQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:55:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E8185B39
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239808.1541216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq49-0005Hh-6I; Tue, 24 Feb 2026 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239808.1541216; Tue, 24 Feb 2026 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq49-0005Fr-35; Tue, 24 Feb 2026 10:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1239808;
 Tue, 24 Feb 2026 10:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuq46-0005Fl-Rz
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:54:54 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa699f9-116f-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 11:54:53 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359a302794so4000265f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 02:54:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b890041csm21235205e9.5.2026.02.24.02.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:54:52 -0800 (PST)
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
X-Inumbo-ID: 3fa699f9-116f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771930493; x=1772535293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePOH8A36hkqSfxtQagWaqy54Akj70pytj4oaHD2xBNY=;
        b=XybILxYKpkJVzZkLzwUdyeMpBrLk+od3iQj+3U/hBlGeZiINLDkuc8aKEZ8WqhkbaC
         tLEtJVmeIVQKuQiZNUMuubKU7xUmEufP+MgBpHoitBLr7CPtakQwRXQoi6G68CzQQUtx
         e3sUR2rNc5neMWwoMybDsyPxhV6CebFBEMpEoboA2JHztgYrrHmqWBhj57LouZTfYY/g
         FQPtPVMnx2W+6rgf4SPLhNE2Sbj3TessiFETfICOawPDG6xbRc8XPM34tzkXaEcVeoTX
         zMndRx+ck2iW+HRu04SrY8AiDh39jyTbkioEkUXavgwZpAOM2TSKfLtS3+DpifNnK7Bv
         Qf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930493; x=1772535293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePOH8A36hkqSfxtQagWaqy54Akj70pytj4oaHD2xBNY=;
        b=Dy6jes3u6O4uwBqBCCPQ+5ldQ9DLJ3HK//D6Eem+xSl9yZR7cCgz3BywypbNOBfq/n
         cBre//dvS8na+vBByk3wkNnBztYamlqeitbtHpsV7eOBDDTivdWWmI+CXS0XqHrLi0y9
         n0mSgLxFV7oLaznxAJ//ETm28CPkjRtS3Qq40HUyJdQaq1Kyr5e6jbUZHcCFOMDdLN7T
         2ai6Lqqa29WfYpdMKa5TOZPLzQfmu8gDg1VSX/nrcA60uaZ+cl+LoZ5ttDIMfQ5KsglN
         qNweQrWCY4+fXFy7gpZxZgphJFkDzamREXycXaZM6MEK94VWAMNB9SGUlalLhD82F0iL
         Cqbg==
X-Forwarded-Encrypted: i=1; AJvYcCXvfyyJSOtZ++v2SHbdOIja0WG9YgJwc0U+cNZVGoHpEnwgyI+s7SxyfQI3z6wH7NsZMzaDJtxU1H4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmTdK4tCSFzVTG4m4Jx1YPc1xnyKc9kpUq+f2u8THqLHU+oVv4
	6QdwNq/wyGKAjjNbYp5YxmbWvZIFln0A1Jj9y6wUixmhTjl8icTdYxHAdMbBZ4HPnw==
X-Gm-Gg: AZuq6aL72+YTdU/A8TzpO6kiSYMs8lJlZ5AmwBYEOH+FdyD2wniDdvywez89XTPPMYr
	XES7bipj99ceO6OycVY/LzBiFIBIZchaW4tveT64PUvyysD2ih5TNJD7fVdhUQKdtypYwOl83xh
	q0NPncxtVnM85GHEOcN3aoSEh5EnirVM8KFARfH+uRW1uvWeV0zIicfCKHlUvAKTgwhdnRejHYh
	1Y00SeWrVxhpqkLm/oL7X6y3JFJCy0DUvuaxWxtpCzwQ1MoTShspKDsL6/w1RJnk0qhGBX0XsAs
	e4L04cso+G/OzYY1S/K5OmVnURmm+DnDKMKprWNBeMQsPwN/ZdNyoCB3aIwAa/mW29gCGsm1KFz
	wGL+3lTqIMT9glBU3BfC2hVf7tVAu+QhnwE4uep6Lyy1QWHDmnua1U6r/uiP4aCIr+6Px14GGkm
	8INnFuSoaPAU2GUWlQecVNCmBxE+ALu9xX/2zCR30Gs6r2kyQxP5vOQFuSV390Uru0T9vnVwDpR
	RoY023aUM0I1rQ=
X-Received: by 2002:a05:600c:4744:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-483a9605eb3mr179220745e9.29.1771930492602;
        Tue, 24 Feb 2026 02:54:52 -0800 (PST)
Message-ID: <17c88ded-48cd-4642-91a4-03fc4575a7ea@suse.com>
Date: Tue, 24 Feb 2026 11:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <8c2259991754f219ba030606f39d629eb365b01c.1771590794.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8c2259991754f219ba030606f39d629eb365b01c.1771590794.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.985];
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
X-Rspamd-Queue-Id: 272E8185B39
X-Rspamd-Action: no action

On 20.02.2026 17:18, Oleksii Kurochko wrote:
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
> Changes in v5:
>  - Update the commit message().
>  - Rename c to curr.
>  - Update vcpu_set_interrupt() to use test_and_set_bit() for irqs_pending
>    bitmask too.
>  - Move #ifdef CONFIG_RISCV_32 above the comment in vcpu_sync_interrupts().
> ---
> Changes in v4:
>  - Update the commit message.
>  - Update the comments in vcpu_(un)set_interrupt() and add the the  comment
>    above smp_wmb() barrier.
>  - call vcpu_kick() only if the pending_mask bit going from 0 to 1.
>  - Code style fixes.
>  - Update defintion of RISCV_VCPU_NR_IRQS to cover potential RV128 case and
>    the case if AIA isn't used.
>  - latch current into a local variable in check_for_pcpu_work().
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
>  xen/arch/riscv/domain.c             | 75 +++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/domain.h | 23 +++++++++
>  xen/arch/riscv/traps.c              |  4 ++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index c9494db0fbe7..335c41f3e5a1 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -6,6 +6,7 @@
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/riscv_encoding.h>
> @@ -140,6 +141,80 @@ void arch_vcpu_destroy(struct vcpu *v)
>      vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
>  }
>  
> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
> +{
> +    bool kick_vcpu;
> +
> +    /* We only allow VS-mode software, timer, and external interrupts */
> +    if ( irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;
> +
> +    kick_vcpu = !test_and_set_bit(irq, v->arch.irqs_pending);
> +
> +    /*
> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
> +     * which is used in consumer part (vcpu_flush_interrupts()).
> +     */
> +    smp_wmb();
> +
> +    kick_vcpu |= !test_and_set_bit(irq, v->arch.irqs_pending_mask);
> +
> +    if ( kick_vcpu )
> +        vcpu_kick(v);
> +
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
> +
> +void vcpu_sync_interrupts(struct vcpu *v)
> +{
> +    unsigned long hvip;
> +
> +    /* Read current HVIP and VSIE CSRs */
> +    v->arch.vsie = csr_read(CSR_VSIE);

What is this needed for, btw? There's no consumer of the field, and the register
can change right after re-entering the guest.

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -54,8 +54,26 @@ struct arch_vcpu {
>      register_t hideleg;
>      register_t henvcfg;
>      register_t hstateen0;
> +    register_t hvip;
>  
>      register_t vsatp;
> +    register_t vsie;

Somewhat dependent upon the question above, might hvip and vsie also better
sit close together?

Jan

