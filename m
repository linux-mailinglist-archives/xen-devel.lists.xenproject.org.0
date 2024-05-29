Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4658D3279
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731698.1137416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCn-0000zB-4m; Wed, 29 May 2024 09:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731698.1137416; Wed, 29 May 2024 09:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCm-0000wb-W0; Wed, 29 May 2024 09:02:44 +0000
Received: by outflank-mailman (input) for mailman id 731698;
 Wed, 29 May 2024 09:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCk-0006YK-OZ
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:42 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d8ac75-1d9a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:02:41 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6ab9d9ad0c0so8254406d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:41 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad96fac09esm12093906d6.32.2024.05.29.02.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:38 -0700 (PDT)
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
X-Inumbo-ID: 33d8ac75-1d9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973359; x=1717578159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uM4Rhz8t2QnRPi9kZmp+UEqFUepWlQwqYUfgN8dy9c=;
        b=e+xCEhtAQCp3qNhOk2GTGEcioOcrlflSePRuLPytC8M77bXWqazMR3EvNKNnleqpPT
         FW0I9SDB7h9jMqPvWJxW0WbC3z10gSXLf1a+fwbundu71Ybid3Dwmczc2fOdrau9qSfx
         2He6uiR2e/IH6OQ3HBuioJkRMGko9ScYYt2MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973359; x=1717578159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uM4Rhz8t2QnRPi9kZmp+UEqFUepWlQwqYUfgN8dy9c=;
        b=YzF0yNC3c9zx84sLeqqmeD3nCa2wx5PDxHKHh2bsaGoi1rPGnMfKu/LtKqB2Xmjl3U
         GTHuGlBpj4/KCirArZ6cCZRcbMigCOoHLgpvPgZGwqVsuxtp8aYV7cWVz8HAVs1ZyJDY
         wUT5d9lVaPfvE0HKV7fpqPO8inHmkvS57XNUICcypUKh8OkpTlYfreFLdEY5hqK76Ffq
         r/XuGtyXSndFPMEEE+HuSjBOZQEZwKD7UFGhIrybVl+xdoliooy/lnV8Nb9M3NTHYfx/
         fhpdNPauzrrM81/YugCd6Dzygv3HaXCIC43pTPzRpIWB5EMOMh+Gu4BGFuXtL2TjQPTv
         ddBQ==
X-Gm-Message-State: AOJu0YwQnd1XdBaAmPZ8S5wfbtADgh6Pb4AiukM46rj00leaSrT0pUOT
	NGUrYsXdglJtN1iOuq3OdE7z8SaojuxdH1cUYiIyOmLT9tcxvM7OF25KdYMtY09CXK8jBVoncLN
	C
X-Google-Smtp-Source: AGHT+IFVnbdL74wVKWAekUSIphAYXJzvIYyS86bdPsV32FCEpHOK4om7tjuX8q29tjlykqBQJmATNA==
X-Received: by 2002:a05:6214:3a0a:b0:6ab:71d6:cbd5 with SMTP id 6a1803df08f44-6abcd169caamr175634936d6.53.1716973359026;
        Wed, 29 May 2024 02:02:39 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 9/9] x86/irq: forward pending interrupts to new destination in fixup_irqs()
Date: Wed, 29 May 2024 11:01:31 +0200
Message-ID: <20240529090132.59434-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/apic.c             |  5 +++++
 xen/arch/x86/include/asm/apic.h |  3 +++
 xen/arch/x86/irq.c              | 39 +++++++++++++++++++++++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 6567af685a1b..4d77fba3ed19 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1543,3 +1543,8 @@ void check_for_unexpected_msi(unsigned int vector)
 {
     BUG_ON(apic_isr_read(vector));
 }
+
+bool lapic_check_pending(unsigned int vector)
+{
+    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d1cb001fb4ab..7b5a0832c05e 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -179,6 +179,9 @@ extern void record_boot_APIC_mode(void);
 extern enum apic_mode current_local_apic_mode(void);
 extern void check_for_unexpected_msi(unsigned int vector);
 
+/* Return whether vector is pending in IRR. */
+bool lapic_check_pending(unsigned int vector);
+
 uint64_t calibrate_apic_timer(void);
 uint32_t apic_tmcct_read(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 33979729257e..211ad3bd7cf5 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2591,8 +2591,8 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
-        bool break_affinity = false, set_affinity = true;
-        unsigned int vector;
+        bool break_affinity = false, set_affinity = true, check_irr = false;
+        unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
         if ( irq == 2 )
@@ -2643,6 +2643,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
              !cpumask_test_cpu(cpu, &cpu_online_map) &&
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
+             * Note the difference between move_in_progress or
+             * move_cleanup_count being set.  For the later we know the new
+             * destination has already acked at least one interrupt from this
+             * source, and hence there's no need to forward any stale
+             * interrupts.
+             */
+            if ( lapic_check_pending(desc->arch.old_vector) )
+                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                              desc->arch.vector);
+
             /*
              * This CPU is going offline, remove it from ->arch.old_cpu_mask
              * and possibly release the old vector if the old mask becomes
@@ -2683,11 +2702,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
         if ( desc->handler->disable )
             desc->handler->disable(desc);
 
+        /*
+         * If the current CPU is going offline and is (one of) the target(s) of
+         * the interrupt signal to check whether there are any pending vectors
+         * to be handled in the local APIC after the interrupt has been moved.
+         */
+        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+            check_irr = true;
+
         if ( desc->handler->set_affinity )
             desc->handler->set_affinity(desc, affinity);
         else if ( !(warned++) )
             set_affinity = false;
 
+        if ( check_irr && lapic_check_pending(vector) )
+            /*
+             * Forward pending interrupt to the new destination, this CPU is
+             * going offline and otherwise the interrupt would be lost.
+             */
+            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                          desc->arch.vector);
+
         if ( desc->handler->enable )
             desc->handler->enable(desc);
 
-- 
2.44.0


