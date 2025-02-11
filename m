Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F63A3095A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885347.1295164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho29-0005eW-Vt; Tue, 11 Feb 2025 11:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885347.1295164; Tue, 11 Feb 2025 11:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho29-0005cQ-SL; Tue, 11 Feb 2025 11:02:29 +0000
Received: by outflank-mailman (input) for mailman id 885347;
 Tue, 11 Feb 2025 11:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho28-0005b1-Ca
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:28 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad723bf9-e867-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:02:26 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38dd93a4e8eso2084910f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:26 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7a7829d4csm645870866b.9.2025.02.11.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:24 -0800 (PST)
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
X-Inumbo-ID: ad723bf9-e867-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271745; x=1739876545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm1F4/LWDRjOr5tGbdwduMf0+aedjlnrUC4bJARj2yg=;
        b=P5/4XsRVZRcB1OyMZgYEyvjfLBOmnHmERtfsyrqGJKfB23mK/zlepEvLDIQb0UmwGR
         6QTqlhlbtkwo0QQF/ysZhqd7upyBLoLlU9tKwal8G8GNumuu0MDJ/z/uYtzWoaUp7PwV
         TrwsRZ8uKGnNUqeRuksEDK/rLcKAlFW1YG4rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271745; x=1739876545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm1F4/LWDRjOr5tGbdwduMf0+aedjlnrUC4bJARj2yg=;
        b=TMynutw1rXk2FweYQrjtee9bYMZj54x6KRpoR33MXMO+vkIYHG4SsvFhXsOMMI0EL7
         SiX3iXXI3+Uj50XmmJTRSp5N6iC0gNwpkLDJ1jeSyrdQGjB7DAO0AGT697iXu5FZPGB5
         7JbZDV9cf2NtkC79d12hu6xw5GaTfTc8/ga6xkew4X9/Zsjkas6wkkhcTF/sz+xZODHb
         tf4AbJWQ2GsombKGhAfz2XI+8AydERpDL11np2nmQedpYDEDzXFH3Nw5iyJLL5uD7734
         mgPv8jepWyY81/hRENkefXc2lU0TFWghcbPGIiqncL3xHVjrwwmynwYt3SqZ/d77K2NL
         6Mtw==
X-Gm-Message-State: AOJu0Yx2xhtxS6U3SrCCSw083iwZTp3aSQvvJB/6m331ZxKXeP1bUHWJ
	5+oqhZIBdvaG8SQvRLken2oIQA3OQ0yO1PSD9v1L1AocVarKwaJ8f8xCE2bRnB9LJSst9Zdw5N3
	0
X-Gm-Gg: ASbGncsV+81TJMofhHK8SEKDJv+ZheX4Z7d0n5tJa/DntNS/6L/77sPZiAkqx5CBk9Q
	bqn2W3X9qZk7RHPQP6tb1joPTFImhkcWl4gmkWcyzb8hP9qJcg1nfbNbZ4e/SktAQKO44JnvII7
	2fGnKiyERK/mpLnahN07px/ae9k3ltu/27aLRkaDugbJntEWEpKVqJjdcuEncYIvyWfA9xdDMEU
	haOriDOdh13WF4fW50qCGQUfkqi3LDAAUa3x8eKjUoILDZdVYLe46SkLsdOUzYSlAqaSz+nlSWG
	i1yVLZA1OiZo+DyULwLk
X-Google-Smtp-Source: AGHT+IFRf2jmgiUE8z1ItqEeZ+88FruhyR5Z+iCXHYTmzbTBggA3HeeCpC/GIxLHFe4bgiY+sHk4nQ==
X-Received: by 2002:a5d:6d0c:0:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-38ddf29e276mr7467246f8f.43.1739271745153;
        Tue, 11 Feb 2025 03:02:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.20 v3 2/5] x86/irq: drop fixup_irqs() parameters
Date: Tue, 11 Feb 2025 12:02:06 +0100
Message-ID: <20250211110209.86974-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
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


