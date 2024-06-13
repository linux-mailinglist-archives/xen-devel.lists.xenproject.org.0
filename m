Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B807C9078F4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740137.1147171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm9-0001Ln-3m; Thu, 13 Jun 2024 16:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740137.1147171; Thu, 13 Jun 2024 16:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm9-0001Jo-0Q; Thu, 13 Jun 2024 16:58:13 +0000
Received: by outflank-mailman (input) for mailman id 740137;
 Thu, 13 Jun 2024 16:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHnm7-00013v-BK
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:58:11 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cff2ad8-29a6-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 18:58:10 +0200 (CEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6f97a4c4588so698040a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:58:10 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc037desm66960085a.97.2024.06.13.09.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:58:08 -0700 (PDT)
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
X-Inumbo-ID: 1cff2ad8-29a6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718297889; x=1718902689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OqTsWR9SuIo4uzvIZP/P5NOenHh2rQIF4jI5UgbX64=;
        b=DNVthAALlq9MSTc7XvwOPslvo1Y+ykqZ3BCSR8Wsb5lLhoP0qsVyCKl+oXwf3u6uhR
         MR1K6R/QO4a7rr7mB0K4jGeSKHUPxPzpBMyWml+2pAJTIPig8sQwP40mc3F+FYKPc6/R
         UwORBkvFyuyx91WQoviuKI1wCb5H+Ta2oZrtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297889; x=1718902689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OqTsWR9SuIo4uzvIZP/P5NOenHh2rQIF4jI5UgbX64=;
        b=lNYsWJTrEJ3elRLB9bza0EmkN5lHX35KpAT/uLX/dR7p/I/YWbvqNWmUrB5psaa1m2
         dS3BYnV7BAHGuGfs30wCRV7EoOIRi8PyAJ5zwsQa5p6Twvox74ysIfL8GTSaPL7aqoJM
         bL+VV366RAHIczHDHL803yn4FzgQ/IMH81yrbzbHAIXkdNh3pIxToRnmi7gPvd2XZjSi
         eJ8I6OAyKa7wcWrgJzzx0evhRSoRetlqw5dgnO5Ur1+D+JU4DyrGOMUUc91O/QKD/G0N
         kkyuV5MQ+kpKQFRRRyyh1l1xARTb5tB1ln9Didp4ve/PLyHA2WNPDVmQUDlNqnzS4yAm
         VL7w==
X-Gm-Message-State: AOJu0YxfYnf3N2MKBhLlI4JlwhmPAV2VsKwshIfqE4Y4jeFTbpnxLXIl
	cm+/wkHruX/GFPO9nOINu5rg9bkXnEUOiafvOkc8uuqplxbGhjjvi9nsGWBpZWUs4lLgXGDQyQJ
	w
X-Google-Smtp-Source: AGHT+IH2m9tIxZZ8OzShQsKDG0eFpEjdz4EKdEJZcMSsChf60s3+TVzqkR3vmgdqdLizA1ele7eBXw==
X-Received: by 2002:a05:6830:4429:b0:6f9:74db:5dc4 with SMTP id 46e09a7af769-6fb9376dcdamr409423a34.14.1718297888900;
        Thu, 13 Jun 2024 09:58:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/3] x86/irq: forward pending interrupts to new destination in fixup_irqs()
Date: Thu, 13 Jun 2024 18:56:17 +0200
Message-ID: <20240613165617.42538-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613165617.42538-1-roger.pau@citrix.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
the CPU is to become offline, the normal migration logic used by Xen where the
vector in the previous target(s) is left configured until the interrupt is
received on the new destination is not suitable.

Instead attempt to do as much as possible in order to prevent loosing
interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
currently the case) attempt to forward pending vectors when interrupts that
target the current CPU are migrated to a different destination.

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
Changes since v2:
 - Remove interrupt enabled window from fixup_irqs().
 - Adjust comments and commit message.

Changes since v1:
 - Rename to apic_irr_read().
---
 xen/arch/x86/include/asm/apic.h |  5 ++++
 xen/arch/x86/irq.c              | 42 ++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 6 deletions(-)

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
index f36962fc1dc3..a2b04c793292 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2593,7 +2593,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
-        bool break_affinity = false, set_affinity = true;
+        bool break_affinity = false, set_affinity = true, check_irr = false;
         unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
@@ -2646,6 +2646,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
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
@@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
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
             set_affinity = false;
 
+        if ( check_irr && apic_irr_read(vector) )
+            /*
+             * Forward pending interrupt to the new destination, this CPU is
+             * going offline and otherwise the interrupt would be lost.
+             */
+            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                          desc->arch.vector);
+
         if ( desc->handler->enable )
             desc->handler->enable(desc);
 
@@ -2707,11 +2742,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
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


