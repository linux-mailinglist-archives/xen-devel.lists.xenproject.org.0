Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FACF7B5075
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 12:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611416.950969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGIZ-00032p-JX; Mon, 02 Oct 2023 10:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611416.950969; Mon, 02 Oct 2023 10:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGIZ-0002zS-G2; Mon, 02 Oct 2023 10:37:11 +0000
Received: by outflank-mailman (input) for mailman id 611416;
 Mon, 02 Oct 2023 10:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUzD=FQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qnGIX-0002y9-BH
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 10:37:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a22bce0d-610f-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 12:37:07 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.133.43])
 by support.bugseng.com (Postfix) with ESMTPSA id 1741D4EE0739;
 Mon,  2 Oct 2023 12:37:04 +0200 (CEST)
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
X-Inumbo-ID: a22bce0d-610f-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Date: Mon,  2 Oct 2023 12:36:57 +0200
Message-Id: <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/irq.c             |  3 ++-
 xen/arch/x86/include/asm/irq.h |  4 ++--
 xen/arch/x86/irq.c             |  8 ++++----
 xen/include/xen/irq.h          | 21 +++++++++++----------
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 09648db17a..1f05ecdee5 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 }
 
 int request_irq(unsigned int irq, unsigned int irqflags,
-                void (*handler)(int, void *, struct cpu_user_regs *),
+                void (*handler)(int irq, void *dev_id,
+                                struct cpu_user_regs *regs),
                 const char *devname, void *dev_id)
 {
     struct irqaction *action;
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index ad907fc97f..a87af47ece 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -101,9 +101,9 @@ void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
 uint8_t alloc_hipriority_vector(void);
 
 void set_direct_apic_vector(
-    uint8_t vector, void (*handler)(struct cpu_user_regs *));
+    uint8_t vector, void (*handler)(struct cpu_user_regs *regs));
 void alloc_direct_apic_vector(
-    uint8_t *vector, void (*handler)(struct cpu_user_regs *));
+    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs));
 
 void do_IRQ(struct cpu_user_regs *regs);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6abfd81621..f42ad539dc 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -915,16 +915,16 @@ uint8_t alloc_hipriority_vector(void)
     return next++;
 }
 
-static void (*direct_apic_vector[X86_NR_VECTORS])(struct cpu_user_regs *);
+static void (*direct_apic_vector[X86_NR_VECTORS])(struct cpu_user_regs *regs);
 void set_direct_apic_vector(
-    uint8_t vector, void (*handler)(struct cpu_user_regs *))
+    uint8_t vector, void (*handler)(struct cpu_user_regs *regs))
 {
     BUG_ON(direct_apic_vector[vector] != NULL);
     direct_apic_vector[vector] = handler;
 }
 
 void alloc_direct_apic_vector(
-    uint8_t *vector, void (*handler)(struct cpu_user_regs *))
+    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs))
 {
     static DEFINE_SPINLOCK(lock);
 
@@ -964,7 +964,7 @@ static int __init cf_check irq_ratelimit_init(void)
 __initcall(irq_ratelimit_init);
 
 int __init request_irq(unsigned int irq, unsigned int irqflags,
-        void (*handler)(int, void *, struct cpu_user_regs *),
+        void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs),
         const char * devname, void *dev_id)
 {
     struct irqaction * action;
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 9747e818f7..58d462e8e6 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -18,7 +18,7 @@
     ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
 
 struct irqaction {
-    void (*handler)(int, void *, struct cpu_user_regs *);
+    void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs);
     const char *name;
     void *dev_id;
     bool_t free_on_release;
@@ -62,17 +62,17 @@ struct irq_desc;
  */
 struct hw_interrupt_type {
     const char *typename;
-    unsigned int (*startup)(struct irq_desc *);
-    void (*shutdown)(struct irq_desc *);
-    void (*enable)(struct irq_desc *);
-    void (*disable)(struct irq_desc *);
-    void (*ack)(struct irq_desc *);
+    unsigned int (*startup)(struct irq_desc *desc);
+    void (*shutdown)(struct irq_desc *desc);
+    void (*enable)(struct irq_desc *desc);
+    void (*disable)(struct irq_desc *desc);
+    void (*ack)(struct irq_desc *desc);
 #ifdef CONFIG_X86
-    void (*end)(struct irq_desc *, u8 vector);
+    void (*end)(struct irq_desc *desc, u8 vector);
 #else
-    void (*end)(struct irq_desc *);
+    void (*end)(struct irq_desc *desc);
 #endif
-    void (*set_affinity)(struct irq_desc *, const cpumask_t *);
+    void (*set_affinity)(struct irq_desc *desc, const cpumask_t *mask);
 };
 
 typedef const struct hw_interrupt_type hw_irq_controller;
@@ -119,7 +119,8 @@ extern int setup_irq(unsigned int irq, unsigned int irqflags,
                      struct irqaction *new);
 extern void release_irq(unsigned int irq, const void *dev_id);
 extern int request_irq(unsigned int irq, unsigned int irqflags,
-               void (*handler)(int, void *, struct cpu_user_regs *),
+               void (*handler)(int irq, void *dev_id,
+                     struct cpu_user_regs *regs),
                const char *devname, void *dev_id);
 
 extern hw_irq_controller no_irq_type;
-- 
2.34.1


