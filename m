Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12854AD83
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348735.574928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o133i-0003DS-F6; Tue, 14 Jun 2022 09:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348735.574928; Tue, 14 Jun 2022 09:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o133i-0003AO-B5; Tue, 14 Jun 2022 09:42:02 +0000
Received: by outflank-mailman (input) for mailman id 348735;
 Tue, 14 Jun 2022 09:42:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o133h-0003AB-7B
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:42:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o133g-0003st-S3; Tue, 14 Jun 2022 09:42:00 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o133g-00041E-Jf; Tue, 14 Jun 2022 09:42:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=KV7y7Yscv6Q5zqvYArQUIKkkXlBEZv6KbcKb+feLfL8=; b=559BT/
	Xj8vKHcVDGEdbl+hBB3b+o//fa1Um2TLOCZFjkImKoMIZNEovakgFmDfT6hLnmZtArqhMKCkB9bgB
	bAKrGp8YpC5kqszuvgQ1eBX3Wmt9sSdELtXg2B0w2AVbSyS+Jyw6dPG6ZrOvZL5pHDiZyVe6QGOav
	O6hHORYe7C4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing the CPU
Date: Tue, 14 Jun 2022 10:41:57 +0100
Message-Id: <20220614094157.95631-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
xmalloc()" extended the checks in _xmalloc() to catch any use of the
helpers from context with interrupts disabled.

Unfortunately, the rule is not followed when initializing the per-CPU
IRQs:

(XEN) Xen call trace:
(XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
(XEN)    [<00000000>] 00000000 (LR)
(XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
(XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
(XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
(XEN)    [<00288fa4>] start_secondary+0x194/0x274
(XEN)    [<40010170>] 40010170
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
(XEN) ****************************************

This is happening because zalloc_cpumask_var() may allocate memory
if NR_CPUS is > 2 * sizeof(unsigned long).

Avoid the problem by allocate the per-CPU IRQs while preparing the
CPU.

This also has the benefit to remove a BUG_ON() in the secondary CPU
code.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/irq.h |  1 -
 xen/arch/arm/irq.c             | 35 +++++++++++++++++++++++++++-------
 xen/arch/arm/smpboot.c         |  2 --
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index e45d57459899..245f49dcbac5 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -73,7 +73,6 @@ static inline bool is_lpi(unsigned int irq)
 bool is_assignable_irq(unsigned int irq);
 
 void init_IRQ(void);
-void init_secondary_IRQ(void);
 
 int route_irq_to_guest(struct domain *d, unsigned int virq,
                        unsigned int irq, const char *devname);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b761d90c4063..56bdcb95335d 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -17,6 +17,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/cpu.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/irq.h>
@@ -100,7 +101,7 @@ static int __init init_irq_data(void)
     return 0;
 }
 
-static int init_local_irq_data(void)
+static int init_local_irq_data(unsigned int cpu)
 {
     int irq;
 
@@ -108,7 +109,7 @@ static int init_local_irq_data(void)
 
     for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
     {
-        struct irq_desc *desc = irq_to_desc(irq);
+        struct irq_desc *desc = &per_cpu(local_irq_desc, cpu)[irq];
         int rc = init_one_irq_desc(desc);
 
         if ( rc )
@@ -131,6 +132,29 @@ static int init_local_irq_data(void)
     return 0;
 }
 
+static int cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned long cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        rc = init_local_irq_data(cpu);
+        if ( rc )
+            printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%lu\n",
+                   cpu);
+        break;
+    }
+
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 void __init init_IRQ(void)
 {
     int irq;
@@ -140,13 +164,10 @@ void __init init_IRQ(void)
         local_irqs_type[irq] = IRQ_TYPE_INVALID;
     spin_unlock(&local_irqs_type_lock);
 
-    BUG_ON(init_local_irq_data() < 0);
+    BUG_ON(init_local_irq_data(smp_processor_id()) < 0);
     BUG_ON(init_irq_data() < 0);
-}
 
-void init_secondary_IRQ(void)
-{
-    BUG_ON(init_local_irq_data() < 0);
+    register_cpu_notifier(&cpu_nfb);
 }
 
 static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 9bb32a301a70..4888bcd78a5a 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -359,8 +359,6 @@ void start_secondary(void)
 
     gic_init_secondary_cpu();
 
-    init_secondary_IRQ();
-
     set_current(idle_vcpu[cpuid]);
 
     setup_cpu_sibling_map(cpuid);
-- 
2.32.0


