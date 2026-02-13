Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPl1GXRRj2kMQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA46138071
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231314.1536537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2i-0006l0-IH; Fri, 13 Feb 2026 16:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231314.1536537; Fri, 13 Feb 2026 16:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2i-0006iH-8Q; Fri, 13 Feb 2026 16:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1231314;
 Fri, 13 Feb 2026 16:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2f-0005Ws-Ol
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:17 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c4483a-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:16 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48375f10628so4521565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:16 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:15 -0800 (PST)
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
X-Inumbo-ID: 23c4483a-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000156; x=1771604956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSuBk7TI30cXJIpgNCEsqaHVmHcq8p/6dX92gviZ8wo=;
        b=jFH7i9OnD+Lstg9QEOG//TA/TpHomfPwH7xXeLEM42/BpxP0U+oJvxQjps76xpdhvd
         Mu0zNbTvSC4NmICiaDpfli+43rB6JBRv5lMEe6JEJMuduj6lKneTTVOqI/SuTn7yi9OM
         QATCqsuUCc93v2gf5zzA/KLrmQ2zU0mEXh7e1yKFK3i3r4HMfGZ9zWJbWVFz9YrLwu7s
         6Ez7Atc12sjb6FewD1tXY8oax1ZLicdXJNRM25qkQXaNWQWO0T4uufl8AWGxeeZvIlNZ
         VoCUMBLuVQuZyzHH75/gaQmCXw80xtqLESFC9OQ1MPE4YjX2Levqp5rpNT0eCldBTyAn
         7A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000156; x=1771604956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSuBk7TI30cXJIpgNCEsqaHVmHcq8p/6dX92gviZ8wo=;
        b=SVostE+gOn6AJ67IQ3I5uMXM2hb143CpESlJBEb7OacER3MBQ0XKqQHRJIKZRm4vqj
         ATJmrpnmJ9j39GkYk2hcyYx+VsDaOZmdji804b6RWFv3NfFJuT8ficzhR+PM4MHS9wTM
         gtwAjr4bN+rxB9VMMgeOVg8dhSY59KPsmyjh4Gokib7LYjf/ywl8usSa37gB9mdkkuY1
         fJdG8R7KNB1OuaNJObmb4g3VA5Pt+Gd50u3V1lpSpt5Hu73kYzX0jz5P3xMFMGhXs5Zm
         IZvLK7AKC6DGq70uj8BqqV3g3fsJRLQFut8bQDwOwQ0ik+CFzo0Cz/FNO09pFLC29EJF
         wfGQ==
X-Gm-Message-State: AOJu0Yzl/twVhIJptFVWzAzIDopY6R8u834TdEXdi+DyjjEuXz2U50HB
	rX6CCdj+Ug/DaEUIe5+lOidH2Iz5566ZCZsLz6Zv8iIUvryPscW3fY/NuXAWiDeW
X-Gm-Gg: AZuq6aJ40ZHMF5Tl0vRc1nV+UNZ+wX3KtrOsJNv/e05qZROTAZlIwd8zh6FKI4A30L0
	1GJxhMPpKSzWZ5A4lCZH8ltfYniYU7p/QArdBRpqZSEu4Q2NkD50rZl/Y9mHM50fUOPl6ecg6qq
	/OfCpXx+aVW1Mtb6lgZzvkqtSS/afpVFK/aZWrF56nkusUZ+r/ZgIA1v+ExE8YXYFwws6DHcTvH
	oN/iebCXaTvz5nzV7uPsKp5/Wx8msUS9Q5Vn4b606vT5d63KaKH/qZviUSaqa/7cxhDzU81KuFv
	5zeUPaDF4n39qZTHe64/eZW/ZMGebV9b8zgHJzK8LrqIDLvC9l7WaZCUNCE4VLHREgpNu9fvQuy
	J+/D1UBMJLHo5eDq3X7ct+UclPe7ned9+VgHWZPOvXTlJdudGaACy7Z5I/ENFjQlKAKeTChLa/Z
	NI4mqlN0FJbYXBIzJ1lgOp5Xg/dDX2yuDEuOfs2QB6S8RLx8QtKLTIztiA4JPJYbBhTmFA/NOmQ
	Z8A
X-Received: by 2002:a05:600c:1e89:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-48373a0cd0bmr44764105e9.16.1771000155622;
        Fri, 13 Feb 2026 08:29:15 -0800 (PST)
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
Subject: [PATCH v4 05/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 1
Date: Fri, 13 Feb 2026 17:28:51 +0100
Message-ID: <63661b60f5e1678c93f7ea34e5cf479ca28bc80d.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 1AA46138071
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
performed only by the consumer via xchg(). The consumer must not write
to irqs_pending and must not act on bits that are not set in the mask.
Otherwise, extra synchronization should be provided.

On RISC-V interrupts are not injected via guest registers, so pending
interrupts must be recorded in irqs_pending (using the new
vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
HVIP before returning control to the guest. The consumer side is
implemented in a follow-up patch.

A barrier between updating irqs_pending and setting the corresponding
mask bit in vcpu_set_interrupt()/vcpu_unset_interrupt() guarantees
that if the consumer observes a mask bit set, the corresponding pending
bit is also visible. This prevents missed interrupts during the flush.

It is possible that a guest could have pending bit in the hardware
register without being marked pending in irq_pending bitmap as:
  According to the RISC-V ISA specification:
    Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
    interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
    is an alias (writable) of the same bit in hvip.
  Additionally:
    When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
    zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
    hie.VSSIE.
This means the guest may modify vsip.SSIP, which implicitly updates
hip.VSSIP and the bit being written with 1 would also trigger an interrupt
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
and are read-only because of:
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
and
  When bit 10 of hideleg is zero, vsip.SEIP and vsie.SEIE are read-only zeros.
  Else, vsip.SEIP and vsie.SEIE are aliases of hip.VSEIP and hie.VSEIE.

  When bit 6 of hideleg is zero, vsip.STIP and vsie.STIE are read-only zeros.
  Else, vsip.STIP and vsie.STIE are aliases of hip.VSTIP and hie.VSTIE.
and also,
  Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
  bits for supervisor-level external interrupts. If implemented, SEIP is
  read-only in sip, and is set and cleared by the execution environment,
  typically through a platform-specific interrupt controller.

  Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
  bits for supervisor-level timer interrupts. If implemented, STIP is
  read-only in sip, and is set and cleared by the execution environment
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
Changes in v4:
 - Update the commit message.
 - Update the comments in vcpu_(un)set_interrupt() and add the the  comment
   above smp_wmb() barrier.
 - call vcpu_kick() only if the pending_mask bit going from 0 to 1.
 - Code style fixes.
 - Update defintion of RISCV_VCPU_NR_IRQS to cover potential RV128 case and
   the case if AIA isn't used.
 - latch current into a local variable in check_for_pcpu_work().
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
 xen/arch/riscv/domain.c             | 71 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h | 24 ++++++++++
 xen/arch/riscv/traps.c              | 10 ++++
 3 files changed, 105 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 6c8a6269d791..edbac39a0b18 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -6,6 +6,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
@@ -127,3 +128,73 @@ void arch_vcpu_destroy(struct vcpu *v)
 {
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
+
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /* We only allow VS-mode software, timer, and external interrupts */
+    if ( irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    set_bit(irq, v->arch.irqs_pending);
+    /*
+     * The counterpart of this barrier is the one encoded implicitly in xchg()
+     * which is used in consumer part (vcpu_flush_interrupts()).
+     */
+    smp_wmb();
+    set_bit(irq, v->arch.irqs_pending_mask);
+
+    if ( !test_and_set_bit(irq, v->arch.irqs_pending_mask) )
+      vcpu_kick(v);
+
+    return 0;
+}
+
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /* We only allow VS-mode software, timer, external interrupts */
+    if ( irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    clear_bit(irq, v->arch.irqs_pending);
+    /*
+     * The counterpart of this barrier is the one encoded implicitly in xchg()
+     * which is used in consumer part (vcpu_flush_interrupts()).
+     */
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
+    if ( ((v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL)) &&
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
index 6bb06a50c6ab..2793f694d36f 100644
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
+#define RISCV_VCPU_NR_IRQS MAX(BITS_PER_LONG, 64)
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
index c81a4f79a0d2..366c3ff23e76 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -169,6 +169,13 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+static void check_for_pcpu_work(void)
+{
+    struct vcpu *c = current;
+
+    vcpu_sync_interrupts(c);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -222,6 +229,9 @@ void do_trap(struct cpu_user_regs *cpu_regs)
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


