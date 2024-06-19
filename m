Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FED90E7B1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 12:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743600.1150521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJs5p-0008Nb-4n; Wed, 19 Jun 2024 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743600.1150521; Wed, 19 Jun 2024 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJs5p-0008M6-27; Wed, 19 Jun 2024 09:59:05 +0000
Received: by outflank-mailman (input) for mailman id 743600;
 Wed, 19 Jun 2024 09:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri0R=NV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJs5n-0008M0-D5
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 09:59:03 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dcb7ace-2e22-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 11:59:02 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7965d034cedso408170685a.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 02:59:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b4ff61dbb4sm11091936d6.16.2024.06.19.02.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:58:59 -0700 (PDT)
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
X-Inumbo-ID: 8dcb7ace-2e22-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718791140; x=1719395940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNA11vszOHr0gqENa0+ArGVJGYF6xj3lss6+Js7NKHg=;
        b=jFUYHaeUKR6ZY/w+YNf5/F+HwvFRXWcKoCuxR5XAJWJ3x4Yg5df16O/i0lgFiqsJdd
         jrdmqa6L1JXx32DGkGW6n/Bmk2tw20mjD6YMQiyl32/CGmRieE8V4LRTj9gMhQViTSmX
         JL0oBkTVNxGH6Ree554FkxT3TamvGqO0eCIpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718791140; x=1719395940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNA11vszOHr0gqENa0+ArGVJGYF6xj3lss6+Js7NKHg=;
        b=YD/GmMbXqbgjTuQ5DHIoratzNOz+x9c1pKE3RLevwrVbpFyeb99dHal+hf/MD1kBKj
         q44rrnRVvVFHn+SCHWtPr+98DHFlEgWsRqjDyn13z+p9Scf5qmn2U/bpZNfda6hVaYGW
         OXhrkZr7Ihd6L29otfhcGVrL34thbGTJfecTEr9+gv305LKkkjqfP/Lchk9vLoCS+To4
         iRUdBWETXoBE/BNKHFuwENTgdbbUbSm4+ev4U7CNFXOiAMFFJxqi10KYolNikI8kJcIm
         qWLXdvPF3XJDDRMR5NJaq0ya72+o7EO15msGmuob3lvqqxdxr4fpA8QpmSQcAa5EYBzi
         /Grw==
X-Gm-Message-State: AOJu0YxG6M43zGFkNf4aiOQhDz+ngOIzpk4fBNuQaaFkXMZ4awovJ2O0
	Tdye1Z2XV907N15EIGU9n6l5gvWQQeNmEJp1xDcuuhZzTv5hzu9j9Uee4NUIq2BVAFhB9gbfuWm
	q
X-Google-Smtp-Source: AGHT+IHxwpCtkIs2uOxiy5Q8zIcV+byxyDFHi3RfQcUTFFHCPqN8yjyVfpmRZThxJnmLkwJTB39T0Q==
X-Received: by 2002:a0c:9d0b:0:b0:6b0:66d3:3b50 with SMTP id 6a1803df08f44-6b501ea53f4mr24694446d6.51.1718791139925;
        Wed, 19 Jun 2024 02:58:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v4] x86/irq: forward pending interrupts to new destination in fixup_irqs()
Date: Wed, 19 Jun 2024 11:58:33 +0200
Message-ID: <20240619095833.76271-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
the CPU is to become offline, the normal migration logic used by Xen where the
vector in the previous target(s) is left configured until the interrupt is
received on the new destination is not suitable.

Instead attempt to do as much as possible in order to prevent loosing
interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
currently the case for CPU hot unplug) attempt to forward pending vectors when
interrupts that target the current CPU are migrated to a different destination.

Additionally, for interrupts that have already been moved from the current CPU
prior to the call to fixup_irqs() but that haven't been delivered to the new
destination (iow: interrupts with move_in_progress set and the current CPU set
in ->arch.old_cpu_mask) also check whether the previous vector is pending and
forward it to the new destination.

This allows us to remove the window with interrupts enabled at the bottom of
fixup_irqs().  Such window wasn't safe anyway: references to the CPU to become
offline are removed from interrupts masks, but the per-CPU vector_irq[] array
is not updated to reflect those changes (as the CPU is going offline anyway).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Move the IRR check after the cpumask_copy().

Changes since v2:
 - Remove interrupt enabled window from fixup_irqs().
 - Adjust comments and commit message.

Changes since v1:
 - Rename to apic_irr_read().
---
 xen/arch/x86/include/asm/apic.h |  5 ++++
 xen/arch/x86/irq.c              | 46 ++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d1cb001fb4ab..7bd66dc6e151 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -132,6 +132,11 @@ static inline bool apic_isr_read(uint8_t vector)
             (vector & 0x1f)) & 1;
 }
 
+static inline bool apic_irr_read(unsigned int vector)
+{
+    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
+
 static inline u32 get_apic_id(void)
 {
     u32 id = apic_read(APIC_ID);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index d7f15c38af22..9a611c79e024 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2591,7 +2591,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
-        bool break_affinity = false, set_affinity = true;
+        bool break_affinity = false, set_affinity = true, check_irr = false;
         unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
@@ -2644,6 +2644,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
              !cpu_online(cpu) &&
              cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
         {
+            /*
+             * This to be offlined CPU was the target of an interrupt that's
+             * been moved, and the new destination target hasn't yet
+             * acknowledged any interrupt from it.
+             *
+             * We know the interrupt is configured to target the new CPU at
+             * this point, so we can check IRR for any pending vectors and
+             * forward them to the new destination.
+             *
+             * Note that for the other case of an interrupt movement being in
+             * progress (move_cleanup_count being non-zero) we know the new
+             * destination has already acked at least one interrupt from this
+             * source, and hence there's no need to forward any stale
+             * interrupts.
+             */
+            if ( apic_irr_read(desc->arch.old_vector) )
+                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                              desc->arch.vector);
+
             /*
              * This CPU is going offline, remove it from ->arch.old_cpu_mask
              * and possibly release the old vector if the old mask becomes
@@ -2684,6 +2703,14 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
         if ( desc->handler->disable )
             desc->handler->disable(desc);
 
+        /*
+         * If the current CPU is going offline and is (one of) the target(s) of
+         * the interrupt, signal to check whether there are any pending vectors
+         * to be handled in the local APIC after the interrupt has been moved.
+         */
+        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+            check_irr = true;
+
         if ( desc->handler->set_affinity )
             desc->handler->set_affinity(desc, affinity);
         else if ( !(warned++) )
@@ -2694,6 +2721,18 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
         cpumask_copy(affinity, desc->affinity);
 
+        if ( check_irr && apic_irr_read(vector) )
+            /*
+             * Forward pending interrupt to the new destination, this CPU is
+             * going offline and otherwise the interrupt would be lost.
+             *
+             * Do the IRR check as late as possible before releasing the irq
+             * desc in order for any in-flight interrupts to be delivered to
+             * the lapic.
+             */
+            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                          desc->arch.vector);
+
         spin_unlock(&desc->lock);
 
         if ( !verbose )
@@ -2705,11 +2744,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
             printk("Broke affinity for IRQ%u, new: {%*pbl}\n",
                    irq, CPUMASK_PR(affinity));
     }
-
-    /* That doesn't seem sufficient.  Give it 1ms. */
-    local_irq_enable();
-    mdelay(1);
-    local_irq_disable();
 }
 
 void fixup_eoi(void)
-- 
2.45.2


