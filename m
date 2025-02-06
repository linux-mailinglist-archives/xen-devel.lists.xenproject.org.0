Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD2A2AC1E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882923.1293035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SW-0003cJ-AE; Thu, 06 Feb 2025 15:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882923.1293035; Thu, 06 Feb 2025 15:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SW-0003ZO-1b; Thu, 06 Feb 2025 15:06:28 +0000
Received: by outflank-mailman (input) for mailman id 882923;
 Thu, 06 Feb 2025 15:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SU-0002qa-If
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:26 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eecf43c3-e49b-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 16:06:25 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so2189462a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:25 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf9f952casm1005879a12.81.2025.02.06.07.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:23 -0800 (PST)
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
X-Inumbo-ID: eecf43c3-e49b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854384; x=1739459184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm1F4/LWDRjOr5tGbdwduMf0+aedjlnrUC4bJARj2yg=;
        b=sFfnaEWLqZLkMDbuQovuPTLXpoGdEffy6RW2iqJEWK4maqzmpxNbAXbkHCPoKDX76H
         4JOxWMFk9DKq6y8IGJkhyg7+ztR1CAYHc2+Ur2Cb0eRuG06mxy3iETlnibl8oYKtRbhr
         ehhKIPWq2q7fvwzYvg8eSZgjDpW2RcdiGbdUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854384; x=1739459184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm1F4/LWDRjOr5tGbdwduMf0+aedjlnrUC4bJARj2yg=;
        b=lboFwGo0OaHri52/pWoMXYr4U+CGndHBq1X9GKel60EFu8KpubjiX/Wv1qIgYumzkr
         Q5ZXii49JPN2bYojLDp6XeAwgRb2zg7nAGk6HFDtdd5BoB1tUY6LbvtjIRe5tm4KvrzD
         L22g69M82NDy61uVp7UZ+WJz6DkgQmsSYx5te/7qCIiwxD4jUiWM0XrCVVDsp7wSwRin
         0tnGCnq9o0exP1nR+s837ZIpnNVSnhDYk9i8VOCt11Vhd14hjLTK5HXz9B9b/B8Gfvmw
         lIQ6ndwsbklh4EFM6SNYcIfLX7SWCf2H0PtrjAGA6qSN0w+gFFcyW6Z5rTGrN2ySUbl6
         DkoA==
X-Gm-Message-State: AOJu0YzgBlbHVUMeHYR7mJHzzzOx2Tj0XrUQDchLiWVEm4duzJl03h/R
	sApKW1yvtuguk6xL+rKmu+RL014FcxCPQPUqmqp9N9J0C/fmgzpkYjuOZq7777YcyF+H2TS0RK/
	7
X-Gm-Gg: ASbGnctNbXqdbEFJesdAUc1wniGIHcP2KtuLaf8BWrucf9YSUNHl5VxfMr/dX2QfQ+E
	F0YdyJJPJqo2imTZ8QSmJQm1M2yf3mnGRtfXmunB9ct3/R1vxUBf5RHzQTTd4awYIAcCJAs+iAZ
	S084FtdNMZhPduk0vnr3OygYQHNNrxnVvg0iLD0SHr5vzqSEzD88mBIR2BIQggKxeY1OOKZI3DV
	QOUJAn24K9ip/cXTukRkZu0S899Xt8O3+3KMyy0eM/9qBho5GPoRZsCowudhs2LALC9abUzhCJQ
	ZyatKWYJYHEhFEA+/9QH
X-Google-Smtp-Source: AGHT+IEqfzSJcLtiZZ7Gwzgf0wFdVc5OJNyojfhwDjWLvVeRVXVV3uduhSDKDO3D5BHocMUt9AX07g==
X-Received: by 2002:a05:6402:3707:b0:5db:e7eb:1b4a with SMTP id 4fb4d7f45d1cf-5dcdb732c6amr8066409a12.10.1738854383971;
        Thu, 06 Feb 2025 07:06:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/5] x86/irq: drop fixup_irqs() parameters
Date: Thu,  6 Feb 2025 16:06:12 +0100
Message-ID: <20250206150615.52052-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
References: <20250206150615.52052-1-roger.pau@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


