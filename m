Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827EB860E16
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684707.1064755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRyD-0006US-F9; Fri, 23 Feb 2024 09:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684707.1064755; Fri, 23 Feb 2024 09:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRyD-0006RL-Bl; Fri, 23 Feb 2024 09:35:53 +0000
Received: by outflank-mailman (input) for mailman id 684707;
 Fri, 23 Feb 2024 09:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hL0v=KA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdRyC-0006BX-2n
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:35:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeee753b-d22e-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 10:35:51 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 4FDB34EE0C8A;
 Fri, 23 Feb 2024 10:35:50 +0100 (CET)
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
X-Inumbo-ID: eeee753b-d22e-11ee-8a57-1f161083a0e0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Date: Fri, 23 Feb 2024 10:35:37 +0100
Message-Id: <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708680104.git.nicola.vetrini@bugseng.com>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor cpu_notifier_call_chain into two functions:
- the variant that is allowed to fail loses the nofail flag
- the variant that shouldn't fail is encapsulated in a call
  to the failing variant, with an additional check.

This prevents uses of the function that are not supposed to
fail from ignoring the return value, thus violating Rule 17.7:
"The value returned by a function having non-void return type shall
be used".

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/cpu.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 8709db4d2957..0b7cf54c4264 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -78,20 +78,27 @@ void __init register_cpu_notifier(struct notifier_block *nb)
 }
 
 static int cpu_notifier_call_chain(unsigned int cpu, unsigned long action,
-                                   struct notifier_block **nb, bool nofail)
+                                   struct notifier_block **nb)
 {
     void *hcpu = (void *)(long)cpu;
     int notifier_rc = notifier_call_chain(&cpu_chain, action, hcpu, nb);
     int ret =  notifier_to_errno(notifier_rc);
 
-    BUG_ON(ret && nofail);
-
     return ret;
 }
 
+static void cpu_notifier_call_chain_nofail(unsigned int cpu,
+                                           unsigned long action,
+                                           struct notifier_block **nb)
+{
+    int ret = cpu_notifier_call_chain(cpu, action, nb);
+
+    BUG_ON(ret);
+}
+
 static void cf_check _take_cpu_down(void *unused)
 {
-    cpu_notifier_call_chain(smp_processor_id(), CPU_DYING, NULL, true);
+    cpu_notifier_call_chain_nofail(smp_processor_id(), CPU_DYING, NULL);
     __cpu_disable();
 }
 
@@ -116,7 +123,7 @@ int cpu_down(unsigned int cpu)
     if ( !cpu_online(cpu) )
         goto out;
 
-    err = cpu_notifier_call_chain(cpu, CPU_DOWN_PREPARE, &nb, false);
+    err = cpu_notifier_call_chain(cpu, CPU_DOWN_PREPARE, &nb);
     if ( err )
         goto fail;
 
@@ -129,14 +136,14 @@ int cpu_down(unsigned int cpu)
     err = cpu_online(cpu);
     BUG_ON(err);
 
-    cpu_notifier_call_chain(cpu, CPU_DEAD, NULL, true);
+    cpu_notifier_call_chain_nofail(cpu, CPU_DEAD, NULL);
 
     send_global_virq(VIRQ_PCPU_STATE);
     cpu_hotplug_done();
     return 0;
 
  fail:
-    cpu_notifier_call_chain(cpu, CPU_DOWN_FAILED, &nb, true);
+    cpu_notifier_call_chain_nofail(cpu, CPU_DOWN_FAILED, &nb);
  out:
     cpu_hotplug_done();
     return err;
@@ -157,7 +164,7 @@ int cpu_up(unsigned int cpu)
     if ( cpu_online(cpu) )
         goto out;
 
-    err = cpu_notifier_call_chain(cpu, CPU_UP_PREPARE, &nb, false);
+    err = cpu_notifier_call_chain(cpu, CPU_UP_PREPARE, &nb);
     if ( err )
         goto fail;
 
@@ -165,7 +172,7 @@ int cpu_up(unsigned int cpu)
     if ( err < 0 )
         goto fail;
 
-    cpu_notifier_call_chain(cpu, CPU_ONLINE, NULL, true);
+    cpu_notifier_call_chain_nofail(cpu, CPU_ONLINE, NULL);
 
     send_global_virq(VIRQ_PCPU_STATE);
 
@@ -173,7 +180,7 @@ int cpu_up(unsigned int cpu)
     return 0;
 
  fail:
-    cpu_notifier_call_chain(cpu, CPU_UP_CANCELED, &nb, true);
+    cpu_notifier_call_chain_nofail(cpu, CPU_UP_CANCELED, &nb);
  out:
     cpu_hotplug_done();
     return err;
@@ -181,7 +188,7 @@ int cpu_up(unsigned int cpu)
 
 void notify_cpu_starting(unsigned int cpu)
 {
-    cpu_notifier_call_chain(cpu, CPU_STARTING, NULL, true);
+    cpu_notifier_call_chain_nofail(cpu, CPU_STARTING, NULL);
 }
 
 static cpumask_t frozen_cpus;
@@ -237,7 +244,7 @@ void enable_nonboot_cpus(void)
     }
 
     for_each_cpu ( cpu, &frozen_cpus )
-        cpu_notifier_call_chain(cpu, CPU_RESUME_FAILED, NULL, true);
+        cpu_notifier_call_chain_nofail(cpu, CPU_RESUME_FAILED, NULL);
 
     cpumask_clear(&frozen_cpus);
 }
-- 
2.34.1


