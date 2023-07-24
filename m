Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC475FE83
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569202.889515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjT-0001r7-Ia; Mon, 24 Jul 2023 17:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569202.889515; Mon, 24 Jul 2023 17:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjT-0001np-FM; Mon, 24 Jul 2023 17:52:31 +0000
Received: by outflank-mailman (input) for mailman id 569202;
 Mon, 24 Jul 2023 17:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixEc=DK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qNzjS-0001ku-O2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:52:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbd347fe-2a4a-11ee-b23c-6b7b168915f2;
 Mon, 24 Jul 2023 19:52:30 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.223.75])
 by support.bugseng.com (Postfix) with ESMTPSA id 746694EE0C87;
 Mon, 24 Jul 2023 19:52:28 +0200 (CEST)
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
X-Inumbo-ID: dbd347fe-2a4a-11ee-b23c-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/3] xen/irq: add missing parameter names
Date: Mon, 24 Jul 2023 19:50:27 +0200
Message-Id: <54ce64f3634a19a834cc1ce5ed74527bf8fa9420.1690217195.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690217195.git.federico.serafini@bugseng.com>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names thus addressing violations of MISRA C:2012
Rule 8.2: "Function types shall be in prototype form with named
parameters".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/irq.h     | 59 ++++++++++++++++++++-------------------
 xen/include/xen/softirq.h |  2 +-
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 300625e56d..7cc6917513 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -18,7 +18,7 @@
     ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
 
 struct irqaction {
-    void (*handler)(int, void *, struct cpu_user_regs *);
+    void (*handler)(int irq, void *data, struct cpu_user_regs *regs);
     const char *name;
     void *dev_id;
     bool_t free_on_release;
@@ -58,21 +58,21 @@ struct irq_desc;
 
 /*
  * Interrupt controller descriptor. This is all we need
- * to describe about the low-level hardware. 
+ * to describe about the low-level hardware.
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
@@ -110,22 +110,23 @@ typedef struct irq_desc {
 #define irq_to_desc(irq)    (&irq_desc[irq])
 #endif
 
-int init_one_irq_desc(struct irq_desc *);
-int arch_init_one_irq_desc(struct irq_desc *);
+int init_one_irq_desc(struct irq_desc *desc);
+int arch_init_one_irq_desc(struct irq_desc *desc);
 
 #define irq_desc_initialized(desc) ((desc)->handler != NULL)
 
 extern int setup_irq(unsigned int irq, unsigned int irqflags,
-                     struct irqaction *);
+                     struct irqaction *new);
 extern void release_irq(unsigned int irq, const void *dev_id);
 extern int request_irq(unsigned int irq, unsigned int irqflags,
-               void (*handler)(int, void *, struct cpu_user_regs *),
+               void (*handler)(int irq, void *dev_id,
+                     struct cpu_user_regs *regs),
                const char * devname, void *dev_id);
 
 extern hw_irq_controller no_irq_type;
 void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs);
-unsigned int cf_check irq_startup_none(struct irq_desc *);
-void cf_check irq_actor_none(struct irq_desc *);
+unsigned int cf_check irq_startup_none(struct irq_desc *desc);
+void cf_check irq_actor_none(struct irq_desc *desc);
 #define irq_shutdown_none irq_actor_none
 #define irq_disable_none irq_actor_none
 #define irq_enable_none irq_actor_none
@@ -146,7 +147,7 @@ struct pirq {
 #define pirq_info(d, p) ((struct pirq *)radix_tree_lookup(&(d)->pirq_tree, p))
 
 /* Use this instead of pirq_info() if the structure may need allocating. */
-extern struct pirq *pirq_get_info(struct domain *, int pirq);
+extern struct pirq *pirq_get_info(struct domain *d, int pirq);
 
 #define pirq_field(d, p, f, def) ({ \
     const struct pirq *__pi = pirq_info(d, p); \
@@ -155,30 +156,30 @@ extern struct pirq *pirq_get_info(struct domain *, int pirq);
 #define pirq_to_evtchn(d, pirq) pirq_field(d, pirq, evtchn, 0)
 #define pirq_masked(d, pirq) pirq_field(d, pirq, masked, 0)
 
-void pirq_cleanup_check(struct pirq *, struct domain *);
+void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
 
 #define pirq_cleanup_check(pirq, d) \
     ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
 
-extern void pirq_guest_eoi(struct pirq *);
-extern void desc_guest_eoi(struct irq_desc *, struct pirq *);
+extern void pirq_guest_eoi(struct pirq *pirq);
+extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
-extern int pirq_guest_bind(struct vcpu *, struct pirq *, int will_share);
-extern void pirq_guest_unbind(struct domain *d, struct pirq *);
-extern void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *);
-extern irq_desc_t *domain_spin_lock_irq_desc(
+extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
+extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
+extern void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask);
+extern struct irq_desc *domain_spin_lock_irq_desc(
     struct domain *d, int irq, unsigned long *pflags);
-extern irq_desc_t *pirq_spin_lock_irq_desc(
-    const struct pirq *, unsigned long *pflags);
+extern struct irq_desc *pirq_spin_lock_irq_desc(
+    const struct pirq *pirq, unsigned long *pflags);
 
-unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
+unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask);
 
 #ifndef arch_hwdom_irqs
-unsigned int arch_hwdom_irqs(domid_t);
+unsigned int arch_hwdom_irqs(domid_t domid);
 #endif
 
 #ifndef arch_evtchn_bind_pirq
-void arch_evtchn_bind_pirq(struct domain *, int pirq);
+void arch_evtchn_bind_pirq(struct domain *d, int pirq);
 #endif
 
 #endif /* __XEN_IRQ_H__ */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 1f6c4783da..33d6f2ecd2 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -26,7 +26,7 @@ typedef void (*softirq_handler)(void);
 void do_softirq(void);
 void open_softirq(int nr, softirq_handler handler);
 
-void cpumask_raise_softirq(const cpumask_t *, unsigned int nr);
+void cpumask_raise_softirq(const cpumask_t *mask, unsigned int nr);
 void cpu_raise_softirq(unsigned int cpu, unsigned int nr);
 void raise_softirq(unsigned int nr);
 
-- 
2.34.1


