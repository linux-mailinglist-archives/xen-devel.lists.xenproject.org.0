Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LcbNfYBq2msZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A266224FB4
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247975.1546342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7X-0003gd-LA; Fri, 06 Mar 2026 16:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247975.1546342; Fri, 06 Mar 2026 16:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7X-0003ba-G4; Fri, 06 Mar 2026 16:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1247975;
 Fri, 06 Mar 2026 16:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7V-0003HN-WB
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc3ba86-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:44 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso4299530f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:44 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:42 -0800 (PST)
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
X-Inumbo-ID: 3dc3ba86-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814823; x=1773419623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcWp8tIlICTUgFr+LU+saMi86aGyTwCcvYFlYuFIRRk=;
        b=KRPZG7dZyCZNZGjpBS5IUC7r6ZsyRIZsyuaY7xmyq2EjeZddTAczAlZnTsrp2t2Nek
         nV1ttMciT5mwMEgjdTJAbOidGKv+m8JYqgkHXmN72rY/OugK0Omf7tZTwYCMey9gKaIz
         L9S9N4pOj4gkO6nz7C9uQgTbpLhwZmh2/Cvwh++qqrUPw3B7KqLFeoiUwW92DX4l+uRu
         coFUv2iLTG7JT64Z9KkDTmF4hQ8JSXErV1t6YFeaVW8PtUa5SP20KYUNZrsKFHJEn33N
         I31tWscGFK0mxu/Po9cBdDuSqXoqCbM4BkorOpokZbGOgdcE34BSP1DKoFOGAJkTu1Oe
         SxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814823; x=1773419623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DcWp8tIlICTUgFr+LU+saMi86aGyTwCcvYFlYuFIRRk=;
        b=gVZquIZlFhsWifJfLM3eBPufX0BOT96Pj9LUuSAvJFlEHf3ziTiJj62H6ohGkdOPP1
         0Jgw5ZkiiXD4p+qabVi/6dwS62GArelqRa30vhnwdytkb+3eSS3+NAHCXE5k9LAuUG37
         y/khlb9pc8DW8l6ArIPdC6Kp05DrFwPG/Lq+X2Z0X2D+vrf3qJjgmIwt2sOc+fLLLDTT
         juoZAGPpEzWEPwr9y7O8q83ZQTbR+PTaGOUGKreW801ixdgivtGHo3qQPzu+pm2PE3Ll
         3QUznJ+eyuSCDpaEWQgZyvuxrmZEksn9MJqtgLP5J5c8RqK9sA1ncXk9uaIbz6zlvbrm
         0X6A==
X-Gm-Message-State: AOJu0YwfJ9J0cJmVQXGRNfGbWlQtGXIiZDXMyqkSHD5n2hYxxtexDCx7
	oZnLEUxRBEdeiQP/B+xFOP3HDtvH7raB0lLrGQf/IVtIt42jyHpS38JiDA5cSg==
X-Gm-Gg: ATEYQzya5SeRGt0u28B7xfejCZojsYNKeCSaKz7VGi1/OL/VigQze+3qhDfpmgOH4zz
	LiCyxJtpO+zFqaX2uRLz7Q0STeVqw2qMa7T3Qll+8j4vee0/X01Of+zpDHeb0kjTCBLq2bB4iOZ
	IIpUrBctPpJvIZaUQOtenxZk6tjCk3V9W4bBqIXP91VUeXWaaD4lLqeGdOz5AHzWLc85M6KGXvj
	FM5WL5i1bZsUTEGGKrhCDCNkN00ITGCmXDCXlRMI1qe4cnCk5vMtrn4lJJ7IgiAanWR75b8J13v
	c5P0fKLh5ev7qBn4sV0Q9R/OsjoOVd64RhvWJI5ph2DDzHAJkVqMo+8S3Ifa0aHBhCosuB0c3ou
	/aeMtEAFf8HB4366lCkhdlu3dWzYdWB/UXsrDTl6yK/FNO9fMsnnYRm9yrsRLO8Ig17hcNEKu5t
	v5cs+I8rt8rYigWWWXvwYWuKO01uvbN8guhEIzXvIuY/2laSN8P8feBQrk7vc3e8ppdQ==
X-Received: by 2002:a05:6000:26cc:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-439da8954e4mr4677118f8f.46.1772814823035;
        Fri, 06 Mar 2026 08:33:43 -0800 (PST)
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
Subject: [PATCH v7 03/14] xen/riscv: introduce tracking of pending vCPU interrupts, part 1
Date: Fri,  6 Mar 2026 17:33:20 +0100
Message-ID: <949104bf183688fa0416845fe7e3c19c2c5b2a2d.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A266224FB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
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
sequentially immediately before VM entry, it is safe to slightly relax
this ordering rule in vcpu_sync_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
 - Drop ifdef RV32 in vcpu_sync_interrupts(). It will be introduced later when
   it will be more clear from the context why it is needed in this function.
 - Rename vcpu_sync_interrups()'s argument to curr and add
   ASSERT(curr == current).
---
Changes in v6:
 - Drop for the moment:
       /* Read current HVIP and VSIE CSRs */
       v->arch.vsie = csr_read(CSR_VSIE);
   from vcpu_sync_interrupts() as it isn't used at the moment and will
   be introduced when a usage will be more clear.
---
Changes in v5:
 - Update the commit message().
 - Rename c to curr.
 - Update vcpu_set_interrupt() to use test_and_set_bit() for irqs_pending
   bitmask too.
 - Move #ifdef CONFIG_RISCV_32 above the comment in vcpu_sync_interrupts().
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
 xen/arch/riscv/domain.c             | 63 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h | 22 ++++++++++
 xen/arch/riscv/traps.c              |  4 ++
 3 files changed, 89 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 08b990f7b9f6..5447c17402dd 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -6,6 +6,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
@@ -168,6 +169,68 @@ void arch_vcpu_destroy(struct vcpu *v)
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
 
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
+{
+    bool kick_vcpu;
+
+    /* We only allow VS-mode software, timer, and external interrupts */
+    if ( irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    kick_vcpu = !test_and_set_bit(irq, v->arch.irqs_pending);
+
+    /*
+     * The counterpart of this barrier is the one encoded implicitly in xchg()
+     * which is used in consumer part (vcpu_flush_interrupts()).
+     */
+    smp_wmb();
+
+    kick_vcpu |= !test_and_set_bit(irq, v->arch.irqs_pending_mask);
+
+    if ( kick_vcpu )
+        vcpu_kick(v);
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
+void vcpu_sync_interrupts(struct vcpu *curr)
+{
+    unsigned long hvip = csr_read(CSR_HVIP);
+
+    ASSERT(curr == current);
+
+    /* Sync-up HVIP.VSSIP bit changes done by Guest */
+    if ( ((curr->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL)) &&
+         !test_and_set_bit(IRQ_VS_SOFT, &curr->arch.irqs_pending_mask) )
+    {
+        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
+            set_bit(IRQ_VS_SOFT, &curr->arch.irqs_pending);
+        else
+            clear_bit(IRQ_VS_SOFT, &curr->arch.irqs_pending);
+    }
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 17be792afe7d..1ecfe18c8519 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,8 +54,25 @@ struct arch_vcpu {
     register_t hideleg;
     register_t henvcfg;
     register_t hstateen0;
+    register_t hvip;
 
     register_t vsatp;
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
@@ -94,6 +111,11 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
+
+void vcpu_sync_interrupts(struct vcpu *curr);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 9fca941526f6..551f886e3a69 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -171,6 +171,10 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
 
 static void check_for_pcpu_work(void)
 {
+    struct vcpu *curr = current;
+
+    vcpu_sync_interrupts(curr);
+
     p2m_handle_vmenter();
 }
 
-- 
2.53.0


