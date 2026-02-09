Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF6ICfgQimnUGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10C112B34
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225790.1532415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVE-0000Q6-BI; Mon, 09 Feb 2026 16:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225790.1532415; Mon, 09 Feb 2026 16:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVE-0000LF-4L; Mon, 09 Feb 2026 16:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1225790;
 Mon, 09 Feb 2026 16:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVB-0007Zd-UZ
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:45 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c109f96a-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:44 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8871718b05so750093466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:44 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:42 -0800 (PST)
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
X-Inumbo-ID: c109f96a-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655963; x=1771260763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzY4hdexyuBIJK3FnsuLFLVzhScz5N5GsSrSydDkBvI=;
        b=SbZrHIzIey+5pW5ALuvACrTCue2E67SCBmgQefYcjFBFlO3S2n89bkdRAoFD/vdRiM
         1LU1UiYTh1kCwoMVm4j5kV7Dj1uKv1zVY9h183nRwlSWIfYOSaxyT2RMwcwZB0nGeHro
         Ymir2PJD0yHO8InUrkiNXk9Thq7PvcP2Hu1ZiyF3gr+jkaSGaEBo6quMtONSDvDI5eCZ
         Y6sfOzSNZLHLhItfdPzjRIRMRFZaKCBwLF26POOrVy0LVsXinHDOft+gYo2eqkNigoB5
         NV5Jc8u6DbUIc/pu5ZCAwruBoYsk3kbMsf4EzRXWVeqiriS4DBdKRo5SmPUpVLHd3sN/
         kRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655963; x=1771260763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SzY4hdexyuBIJK3FnsuLFLVzhScz5N5GsSrSydDkBvI=;
        b=VNdYFacGm3kqkV3sabQJeSEIE1NmxFLVNo16k5tNgaebF/oCblyNhkXmPqiJtiL0jD
         Utdq77yYVDqyDppDyLKpayKamnVJ4ELKg2kvHliN1hjIbJc2jjjnwBTustCs/XT2Rp20
         5QY3ZGnhqZN/paXjazCYbAUoC3E//l3rebIxMVAG7pJFO2H2Pq1PE+4iQKE6CbjdclIY
         h2KJz8VZdhUsX2q9uniE31Bsa4vkl5o9PNn4L6PWbuKb9N6aKSr8V/IVWw0f5iCasw69
         XyoUd4ihPZ6uIYRgG0k5vFQjzA9Hv3TCEtpdcm6+egHtDSlIz9uE4CF6DJqqyl8vft3U
         IT5A==
X-Gm-Message-State: AOJu0YyqGVcJtEr7EL3VRbnqqpEx6KxepkyguKIhjzoB0e5XqVYoEOVI
	m8t4qw52fSnllAWAXTspJbA/uxRAnSr413uAjYfWOJbtzqthi9lhe04W/FJO93LO
X-Gm-Gg: AZuq6aLbthQF4Z6K74gcG+mFzpXjO5iymuL2Hh2cSA+PBSmvd+60UDv602bFB6sxriN
	OxMzasQQf3WckcE81RefGJcRnLmhVBZqVJATmMBz5AnhS68qVJYH2h4y55gcsDvexFvnFYbKbZn
	X9it3HUjRODu+76m8xjGjw9BfQDxMjch79F5gSgJV8jB9/98x1B+D90Mz3h0gOov0iLSNe3s169
	SmmN7TKaSVbdzNuALCiw7RIQOyfJcgDcWH275/wdcciv8lkUBxeRCzkZ/myDUjcOJH0tjUWf4pM
	/R6i5TywPjBCDyQg3hz6Stxh3x7COZNemEi4p6Y9pZ1zOzBv3dInENIpo5bUU4uu08WndD/Ge4K
	2TTjV5JLWGTQLmQ4whYEURasXlzm7RQ0V1H5kIJMIPYu3sB/yA5Fe/wEo4R9KrLKYXFV1yFyokd
	mnitNlU3ziTyd9TeTY/RdsUY4qdRB9+JgtNXLWIXSwGfwFTbrjXbaLaQ==
X-Received: by 2002:a17:906:c154:b0:b87:6953:9d5e with SMTP id a640c23a62f3a-b8edf3411bdmr674611966b.33.1770655962985;
        Mon, 09 Feb 2026 08:52:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 1
Date: Mon,  9 Feb 2026 17:52:18 +0100
Message-ID: <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CC10C112B34
X-Rspamd-Action: no action

Based on Linux kernel v6.16.0.
Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
we want to guarantee that if a bit in irqs_pending_mask is obversable
that the correspondent bit in irqs_pending is observable too.

Add lockless tracking of pending vCPU interrupts using atomic bitops.
Two bitmaps are introduced:
 - irqs_pending — interrupts currently pending for the vCPU
 - irqs_pending_mask — bits that have changed in irqs_pending

The design follows a multi-producer, single-consumer model, where the
consumer is the vCPU itself. Producers may set bits in
irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
performed only by the consumer via xchg_acquire(). The consumer must not
write to irqs_pending and must not act on bits that are not set in the
mask. Otherwise, extra synchronization should be provided.

On RISC-V interrupts are not injected via guest registers, so pending
interrupts must be recorded in irqs_pending (using the new
vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
HVIP before returning control to the guest. The consumer side is
implemented in a follow-up patch.

A barrier between updating irqs_pending and setting the corresponding
mask bit in vcpu_set_interrupt()/vcpu_unset_interrupt() guarantees
that if the consumer observes a mask bit set, the corresponding pending
bit is also visible. This prevents missed interrupts during the flush.

It is possible a guest could have pending bit not result in the hardware
register without to be marked pending in irq_pending bitmap as:
  According to the RISC-V ISA specification:
    Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
    interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
    is an alias (writable) of the same bit in hvip.
  Additionally:
    When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
    zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
    hie.VSSIE.
This means the guest may modify vsip.SSIP, which implicitly updates
hip.VSSIP and the bit being writable with 1 would also trigger an interrupt
as according to the RISC-V spec:
  These conditions for an interrupt trap to occur must be evaluated in a
  bounded   amount of time from when an interrupt becomes, or ceases to be,
  pending in sip,  and must also be evaluated immediately following the
  execution of an SRET  instruction or an explicit write to a CSR on which
  these interrupt trap conditions expressly depend (including sip, sie and
  sstatus).
What means that IRQ_VS_SOFT must be synchronized separately, what is done
in vcpu_sync_interrupts(). Note, also, that IRQ_PMU_OVF would want to be
synced for the similar reason as IRQ_VS_SOFT, but isn't sync-ed now as
PMU isn't supported now.

For the remaining VS-level interrupt types (IRQ_VS_TIMER and
IRQ_VS_EXT), the specification states they cannot be modified by the guest
and are read-only:
  Bits hip.VSEIP and hie.VSEIE are the interrupt-pending and interrupt-enable
  bits for VS-level external interrupts. VSEIP is read-only in hip, and is
  the logical-OR of these interrupt sources:
    • bit VSEIP of hvip;
    • the bit of hgeip selected by hstatus.VGEIN; and
    • any other platform-specific external interrupt signal directed to
      VS-level.
  Bits hip.VSTIP and hie.VSTIE are the interrupt-pending and interrupt-enable
  bits for VS-level timer interrupts. VSTIP is read-only in hip, and is the
  logical-OR of hvip.VSTIP and any other platform-specific timer interrupt
  signal directed to VS-level.
Thus, for these interrupt types, it is sufficient to use vcpu_set_interrupt()
and vcpu_unset_interrupt(), and flush them during the call of
vcpu_flush_interrupts() (which is introduced in follow up patch).

vcpu_sync_interrupts(), which is called just before entering the VM,
slightly bends the rule that the irqs_pending bit must be written
first, followed by updating the corresponding bit in irqs_pending_mask.
However, it still respects the core guarantee that the producer never
clears the mask and only writes to irqs_pending if it is the one that
flipped the corresponding mask bit from 0 to 1.
Moreover, since the consumer won't run concurrently because
vcpu_sync_interrupts() and the consumer path are going to be invoked
equentially immediately before VM entry, it is safe to slightly relax
this ordering rule in vcpu_sync_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Use smp_wb() instead of smp_mb__before_atomic().
 - Add explanation of the change above in the commit message.
 - Move vcpu_sync_interrupts() here to producers side.
 - Introduce check_for_pcpu_work() to be clear from where vcpu_sync_interrupts()
   is called.
---
Changes in V2:
 - Move the patch before an introduction of vtimer.
 - Drop bitmap_zero() of irqs_pending and irqs_pending_mask bitmaps as
   vcpu structure starts out all zeros.
 - Drop const for irq argument of vcpu_{un}set_interrupt().
 - Drop check "irq < IRQ_LOCAL_MAX" in vcpu_{un}set_interrupt() as it
   could lead to overrun of irqs_pending and irqs_pending_mask bitmaps.
 - Drop IRQ_LOCAL_MAX as there is no usage for it now.
---
 xen/arch/riscv/domain.c             | 70 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h | 24 ++++++++++
 xen/arch/riscv/traps.c              |  8 ++++
 3 files changed, 102 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index af9586a4eb0d..4513f778cdc4 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -5,6 +5,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
@@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
 {
     vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
 }
+
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, and external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    set_bit(irq, v->arch.irqs_pending);
+    smp_wmb();
+    set_bit(irq, v->arch.irqs_pending_mask);
+
+    vcpu_kick(v);
+
+    return 0;
+}
+
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    clear_bit(irq, v->arch.irqs_pending);
+    smp_wmb();
+    set_bit(irq, v->arch.irqs_pending_mask);
+
+    return 0;
+}
+
+void vcpu_sync_interrupts(struct vcpu *v)
+{
+    unsigned long hvip;
+
+    /* Read current HVIP and VSIE CSRs */
+    v->arch.vsie = csr_read(CSR_VSIE);
+
+    /* Sync-up HVIP.VSSIP bit changes done by Guest */
+    hvip = csr_read(CSR_HVIP);
+    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) &&
+         !test_and_set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending_mask) )
+    {
+        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
+            set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+        else
+            clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+    }
+
+    /*
+     * Sync-up AIA high interrupts.
+     *
+     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
+     * now.
+     */
+#ifdef CONFIG_RISCV_32
+#   error "Update v->arch.vsieh"
+#endif
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6bb06a50c6ab..8d9432ec5a8b 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,6 +54,25 @@ struct arch_vcpu {
     register_t henvcfg;
     register_t hideleg;
     register_t hstateen0;
+    register_t hvip;
+
+    register_t vsie;
+
+    /*
+     * VCPU interrupts
+     *
+     * We have a lockless approach for tracking pending VCPU interrupts
+     * implemented using atomic bitops. The irqs_pending bitmap represent
+     * pending interrupts whereas irqs_pending_mask represent bits changed
+     * in irqs_pending. Our approach is modeled around multiple producer
+     * and single consumer problem where the consumer is the VCPU itself.
+     *
+     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
+     * on RV32 host.
+     */
+#define RISCV_VCPU_NR_IRQS 64
+    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
+    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
 };
 
 struct paging_domain {
@@ -92,6 +111,11 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
+
+void vcpu_sync_interrupts(struct vcpu *v);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index c81a4f79a0d2..82e1dc59cdea 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -169,6 +169,11 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+static void check_for_pcpu_work(void)
+{
+    vcpu_sync_interrupts(current);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -222,6 +227,9 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         do_unexpected_trap(cpu_regs);
         break;
     }
+
+    if ( cpu_regs->hstatus & HSTATUS_SPV )
+        check_for_pcpu_work();
 }
 
 void vcpu_show_execution_state(struct vcpu *v)
-- 
2.52.0


