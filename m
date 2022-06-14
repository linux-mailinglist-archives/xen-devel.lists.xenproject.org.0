Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5154AD81
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348728.574916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1337-0002cu-3Q; Tue, 14 Jun 2022 09:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348728.574916; Tue, 14 Jun 2022 09:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1336-0002al-WC; Tue, 14 Jun 2022 09:41:25 +0000
Received: by outflank-mailman (input) for mailman id 348728;
 Tue, 14 Jun 2022 09:41:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1335-0002aY-HO
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:41:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1335-0003s2-2f; Tue, 14 Jun 2022 09:41:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1334-00040G-QA; Tue, 14 Jun 2022 09:41:23 +0000
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
	Subject:Cc:To:From; bh=ceUU4HToCnfJLUQnb0zPb4pnqugghgbeuw1i+l4yi0k=; b=1teTMS
	y0X5nRBFHGsSMzsYWNOHGKjDbRUETY7iC5lbzr5U38+l1zjLGJOH1LPwVWmszmlZXDPR/QNzR1iJB
	uJUMN3GPJ3kpT+4eXO5Xe0HBuW2bmBIucaaz/xp4blRttFKpzXPkBsQRSZ9XHgD11LifOp39+lSY9
	3RRFn7g+qb4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps while preparing the CPU
Date: Tue, 14 Jun 2022 10:41:19 +0100
Message-Id: <20220614094119.94720-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
xmalloc()" extended the checks in _xmalloc() to catch any use of the
helpers from context with interrupts disabled.

Unfortunately, the rule is not followed when allocating the CPU
sibling/core maps.

(XEN) Xen call trace:
(XEN)    [<00238a5c>] _xmalloc+0xfc/0x314 (PC)
(XEN)    [<00000000>] 00000000 (LR)
(XEN)    [<00238c8c>] _xzalloc+0x18/0x4c
(XEN)    [<00288cb4>] smpboot.c#setup_cpu_sibling_map+0x38/0x138
(XEN)    [<00289024>] start_secondary+0x1b4/0x270
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

This also has the benefit to remove a panic() in the secondary CPU
code.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/smpboot.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 4888bcd78a5a..2b0c92cd369b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -79,15 +79,17 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
 static bool __read_mostly opt_hmp_unsafe = false;
 boolean_param("hmp-unsafe", opt_hmp_unsafe);
 
-static void setup_cpu_sibling_map(int cpu)
+static int setup_cpu_sibling_map(int cpu)
 {
     if ( !zalloc_cpumask_var(&per_cpu(cpu_sibling_mask, cpu)) ||
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
-        panic("No memory for CPU sibling/core maps\n");
+        return -ENOMEM;
 
     /* A CPU is a sibling with itself and is always on its own core. */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
+
+    return 0;
 }
 
 static void remove_cpu_sibling_map(int cpu)
@@ -292,9 +294,14 @@ smp_get_max_cpus (void)
 void __init
 smp_prepare_cpus(void)
 {
+    int rc;
+
     cpumask_copy(&cpu_present_map, &cpu_possible_map);
 
-    setup_cpu_sibling_map(0);
+    rc = setup_cpu_sibling_map(0);
+    if ( rc )
+        panic("Unable to allocate CPU sibling/core maps\n");
+
 }
 
 /* Boot the current CPU */
@@ -361,8 +368,6 @@ void start_secondary(void)
 
     set_current(idle_vcpu[cpuid]);
 
-    setup_cpu_sibling_map(cpuid);
-
     /* Run local notifiers */
     notify_cpu_starting(cpuid);
     /*
@@ -530,9 +535,19 @@ static int cpu_smpboot_callback(struct notifier_block *nfb,
                                 void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
+    unsigned int rc = 0;
 
     switch ( action )
     {
+    case CPU_UP_PREPARE:
+        rc = setup_cpu_sibling_map(cpu);
+        if ( rc )
+            printk(XENLOG_ERR
+                   "Unable to allocate CPU sibling/core map  for CPU%u\n",
+                   cpu);
+
+        break;
+
     case CPU_DEAD:
         remove_cpu_sibling_map(cpu);
         break;
-- 
2.32.0


