Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE2A20E8C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878624.1288819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRk-0003a1-Gk; Tue, 28 Jan 2025 16:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878624.1288819; Tue, 28 Jan 2025 16:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRk-0003UB-BB; Tue, 28 Jan 2025 16:28:16 +0000
Received: by outflank-mailman (input) for mailman id 878624;
 Tue, 28 Jan 2025 16:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00fH=UU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcoRi-0003Ni-Qd
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:28:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df285eb8-dd94-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:28:14 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso5507860f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:28:14 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0d4sm14883704f8f.69.2025.01.28.08.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:28:12 -0800 (PST)
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
X-Inumbo-ID: df285eb8-dd94-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738081693; x=1738686493; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnHpl/m5AWH7KgOy5WgkrsyIBrkq3GKBbJwmITZKh7E=;
        b=vj7zW69retZetKofy0xJHqUuRg88dw8F6kKZwO9jIIvuojG91IjAP1s74Lk0VLE4OJ
         uV5o+e+YS79WDPfHgBo5dUlFBIQcOVQlnUQHg5pnsml6zChu9XGV4EH/iTn4NoAR5ewx
         5g4NxKxs3zqq7fVP+RSY1zld6P2wkQgQJGg7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738081693; x=1738686493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnHpl/m5AWH7KgOy5WgkrsyIBrkq3GKBbJwmITZKh7E=;
        b=B0Jr8HvnXC7NmVDrD2gQ4Aax4XAgYxGOLHAkP/b/Zbt1z4qOB6fayNrRh+71m06FKx
         xfQQgtNlVlbmWYvD1PSWTXI4Py3XtPdQe/+ocb+uXxRuipaYfD6cAHCEpShuZ+T/C2Nt
         m7VVWcNrSHnaVE8Y0PVNegOTOMu9i6/BjlHedF3QXFI6GlD/vAhS37RDD7LfGLJepFuf
         nRtIhF2syvACeXaaQRKRG4bVJk9xgBK2GRCGIKryMynIgc5oziUA5Wt9WByFEWGfKdrz
         JFFzQNoaak7+xk2X30TLshaFP/+KSSdIgVmnA6X2Gyma5AUO5DraiiicJJ/5fzZ1Rzye
         Gqog==
X-Gm-Message-State: AOJu0Yy6Pzzyw3ffrILNnVaux/LGv7E9CdAp00HvM/kX5c1iW2IgPg1y
	qUWvJ734masV0kkwJEyZzBTeeNEhSwrOw8Ocl6Wa3kFuCyf0YlnviOzD+c5RYChnXj0TwmxwgyC
	1
X-Gm-Gg: ASbGncs68mG/4ZZHghWmE+Q/JZo2NDgLxnApg0X+RxY3lksmDel5910QgiQuje1W1p/
	MoYsNuI6PtlCnA3YxmvmeOWzkhc+Ni2jGwJzGS/AhHxO4PRK5dbo0GE7M7ZVzwJODfECp0E8nG/
	9vIIgsNipQaLjFrsiw5MvtZU9SvLclS+yQtd6oHnLNRvqrjOMuV1gifSx06lJDyEbhujY90N83y
	+0E0eTMf56P2tMcLTTl4Jo/1xxci7aDkmCYiC5zkwzLREvDIWSXuTOIX4Xr127TUwvsE6iXF9xr
	HlpwYVr/jtTtScAoT2VMxoZheKE2Dyg=
X-Google-Smtp-Source: AGHT+IHmQZTZKmzSN4EMPA4+MYUogYUFe6ox8dngn7MLh0/Pc/Sz4zd+ZoG+yXc6EgrOT6lW698cUw==
X-Received: by 2002:a05:6000:186f:b0:385:fa26:f0ac with SMTP id ffacd0b85a97d-38bf564926cmr39771375f8f.7.1738081692812;
        Tue, 28 Jan 2025 08:28:12 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.20 2/2] x86/irq: drop fixup_irqs() parameters
Date: Tue, 28 Jan 2025 17:27:42 +0100
Message-ID: <20250128162742.90431-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250128162742.90431-1-roger.pau@citrix.com>
References: <20250128162742.90431-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The solely remaining caller always passes the same globally available
parameters.  Drop the parameters and modify fixup_irqs() to use
cpu_online_map in place of the input mask parameter, and always be verbose
in its output printing.

While there remove some of the checks given the single context where
fixup_irqs() is now called, which should always be in the CPU offline path,
after the CPU going offline has been removed from cpu_online_map.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's more cleanup that can likely be done here, but it's best if such
cleanup is done after the cpu_mask and old_cpu_mask irq_desc fields are
converted from cpu masks to integers, as logic delivery mode should never
be used for external interrupts now.
---
 xen/arch/x86/include/asm/irq.h |  4 ++--
 xen/arch/x86/irq.c             | 30 +++++++++++++-----------------
 xen/arch/x86/smpboot.c         |  2 +-
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index d3bc76806808..354868ba31ab 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -168,8 +168,8 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
-/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
-void fixup_irqs(const cpumask_t *mask, bool verbose);
+/* Evacuate interrupts assigned to CPUs not present in the CPU online map. */
+void fixup_irqs(void);
 void fixup_eoi(void);
 
 int  init_irq_data(void);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index e56bacc88d84..ff3ac832f4b9 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2590,17 +2590,21 @@ static int __init cf_check setup_dump_irqs(void)
 }
 __initcall(setup_dump_irqs);
 
-/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
-void fixup_irqs(const cpumask_t *mask, bool verbose)
+/* Evacuate interrupts assigned to CPUs not present in the CPU online map. */
+void fixup_irqs(void)
 {
+    const unsigned int cpu = smp_processor_id();
     unsigned int irq;
     static int warned;
     struct irq_desc *desc;
 
+    /* Only to be called from the context of a CPU going offline. */
+    ASSERT(!cpu_online(cpu));
+
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
         bool break_affinity = false, set_affinity = true, check_irr = false;
-        unsigned int vector, cpu = smp_processor_id();
+        unsigned int vector;
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
         if ( irq == 2 )
@@ -2644,12 +2648,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
         }
 
         if ( desc->arch.move_in_progress &&
-             /*
-              * Only attempt to adjust the mask if the current CPU is going
-              * offline, otherwise the whole system is going down and leaving
-              * stale data in the masks is fine.
-              */
-             !cpu_online(cpu) &&
              cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
         {
             /*
@@ -2691,16 +2689,17 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
         /*
          * Avoid shuffling the interrupt around as long as current target CPUs
-         * are a subset of the input mask.  What fixup_irqs() cares about is
-         * evacuating interrupts from CPUs not in the input mask.
+         * are a subset of the online mask.  What fixup_irqs() cares about is
+         * evacuating interrupts from CPUs not in the online mask.
          */
-        if ( !desc->action || cpumask_subset(desc->arch.cpu_mask, mask) )
+        if ( !desc->action || cpumask_subset(desc->arch.cpu_mask,
+                                             &cpu_online_map) )
         {
             spin_unlock(&desc->lock);
             continue;
         }
 
-        if ( !cpumask_intersects(mask, desc->affinity) )
+        if ( !cpumask_intersects(&cpu_online_map, desc->affinity) )
         {
             break_affinity = true;
             cpumask_setall(affinity);
@@ -2716,7 +2715,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
          * the interrupt, signal to check whether there are any pending vectors
          * to be handled in the local APIC after the interrupt has been moved.
          */
-        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+        if ( cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
             check_irr = true;
 
         if ( desc->handler->set_affinity )
@@ -2743,9 +2742,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
         spin_unlock(&desc->lock);
 
-        if ( !verbose )
-            continue;
-
         if ( !set_affinity )
             printk("Cannot set affinity for IRQ%u\n", irq);
         else if ( break_affinity )
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 79a79c54c304..891a29fca146 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1282,7 +1282,7 @@ void __cpu_disable(void)
 
     /* It's now safe to remove this processor from the online map */
     cpumask_clear_cpu(cpu, &cpu_online_map);
-    fixup_irqs(&cpu_online_map, 1);
+    fixup_irqs();
     fixup_eoi();
 }
 
-- 
2.46.0


