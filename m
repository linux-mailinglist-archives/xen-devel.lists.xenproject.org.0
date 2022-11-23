Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EEC636534
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 17:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447671.704189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCS-0007uy-2K; Wed, 23 Nov 2022 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447671.704189; Wed, 23 Nov 2022 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCR-0007rO-Uk; Wed, 23 Nov 2022 16:02:11 +0000
Received: by outflank-mailman (input) for mailman id 447671;
 Wed, 23 Nov 2022 16:02:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFfC=3X=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1oxsCQ-0007Mj-GW
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 16:02:10 +0000
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d18bb36-6b48-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 17:02:07 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NHQq012txz15Mqg;
 Thu, 24 Nov 2022 00:01:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 00:02:03 +0800
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
X-Inumbo-ID: 2d18bb36-6b48-11ed-8fd2-01056ac49cbb
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
Date: Wed, 23 Nov 2022 23:58:57 +0800
Message-ID: <20221123155858.11382-2-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221123155858.11382-1-xiujianfeng@huawei.com>
References: <20221123155858.11382-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

These local variables @{resched|pmu|callfunc...}_name saves the new
string allocated by kasprintf(), and when bind_{v}ipi_to_irqhandler()
fails, it goes to the @fail tag, and calls xen_smp_intr_free{_pv}() to
free resource, however the new string is not saved, which cause a memory
leak issue. fix it.

Fixes: 9702785a747a ("i386: move xen")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/x86/xen/smp.c    | 24 ++++++++++++------------
 arch/x86/xen/smp_pv.c | 12 ++++++------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index c3e1f9a7d43a..4b0d6fff88de 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -32,30 +32,30 @@ static irqreturn_t xen_reschedule_interrupt(int irq, void *dev_id)
 
 void xen_smp_intr_free(unsigned int cpu)
 {
+	kfree(per_cpu(xen_resched_irq, cpu).name);
+	per_cpu(xen_resched_irq, cpu).name = NULL;
 	if (per_cpu(xen_resched_irq, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_resched_irq, cpu).irq, NULL);
 		per_cpu(xen_resched_irq, cpu).irq = -1;
-		kfree(per_cpu(xen_resched_irq, cpu).name);
-		per_cpu(xen_resched_irq, cpu).name = NULL;
 	}
+	kfree(per_cpu(xen_callfunc_irq, cpu).name);
+	per_cpu(xen_callfunc_irq, cpu).name = NULL;
 	if (per_cpu(xen_callfunc_irq, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_callfunc_irq, cpu).irq, NULL);
 		per_cpu(xen_callfunc_irq, cpu).irq = -1;
-		kfree(per_cpu(xen_callfunc_irq, cpu).name);
-		per_cpu(xen_callfunc_irq, cpu).name = NULL;
 	}
+	kfree(per_cpu(xen_debug_irq, cpu).name);
+	per_cpu(xen_debug_irq, cpu).name = NULL;
 	if (per_cpu(xen_debug_irq, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_debug_irq, cpu).irq, NULL);
 		per_cpu(xen_debug_irq, cpu).irq = -1;
-		kfree(per_cpu(xen_debug_irq, cpu).name);
-		per_cpu(xen_debug_irq, cpu).name = NULL;
 	}
+	kfree(per_cpu(xen_callfuncsingle_irq, cpu).name);
+	per_cpu(xen_callfuncsingle_irq, cpu).name = NULL;
 	if (per_cpu(xen_callfuncsingle_irq, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_callfuncsingle_irq, cpu).irq,
 				       NULL);
 		per_cpu(xen_callfuncsingle_irq, cpu).irq = -1;
-		kfree(per_cpu(xen_callfuncsingle_irq, cpu).name);
-		per_cpu(xen_callfuncsingle_irq, cpu).name = NULL;
 	}
 }
 
@@ -65,6 +65,7 @@ int xen_smp_intr_init(unsigned int cpu)
 	char *resched_name, *callfunc_name, *debug_name;
 
 	resched_name = kasprintf(GFP_KERNEL, "resched%d", cpu);
+	per_cpu(xen_resched_irq, cpu).name = resched_name;
 	rc = bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
 				    cpu,
 				    xen_reschedule_interrupt,
@@ -74,9 +75,9 @@ int xen_smp_intr_init(unsigned int cpu)
 	if (rc < 0)
 		goto fail;
 	per_cpu(xen_resched_irq, cpu).irq = rc;
-	per_cpu(xen_resched_irq, cpu).name = resched_name;
 
 	callfunc_name = kasprintf(GFP_KERNEL, "callfunc%d", cpu);
+	per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
 	rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_VECTOR,
 				    cpu,
 				    xen_call_function_interrupt,
@@ -86,10 +87,10 @@ int xen_smp_intr_init(unsigned int cpu)
 	if (rc < 0)
 		goto fail;
 	per_cpu(xen_callfunc_irq, cpu).irq = rc;
-	per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
 
 	if (!xen_fifo_events) {
 		debug_name = kasprintf(GFP_KERNEL, "debug%d", cpu);
+		per_cpu(xen_debug_irq, cpu).name = debug_name;
 		rc = bind_virq_to_irqhandler(VIRQ_DEBUG, cpu,
 					     xen_debug_interrupt,
 					     IRQF_PERCPU | IRQF_NOBALANCING,
@@ -97,10 +98,10 @@ int xen_smp_intr_init(unsigned int cpu)
 		if (rc < 0)
 			goto fail;
 		per_cpu(xen_debug_irq, cpu).irq = rc;
-		per_cpu(xen_debug_irq, cpu).name = debug_name;
 	}
 
 	callfunc_name = kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
+	per_cpu(xen_callfuncsingle_irq, cpu).name = callfunc_name;
 	rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_SINGLE_VECTOR,
 				    cpu,
 				    xen_call_function_single_interrupt,
@@ -110,7 +111,6 @@ int xen_smp_intr_init(unsigned int cpu)
 	if (rc < 0)
 		goto fail;
 	per_cpu(xen_callfuncsingle_irq, cpu).irq = rc;
-	per_cpu(xen_callfuncsingle_irq, cpu).name = callfunc_name;
 
 	return 0;
 
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 480be82e9b7b..6175f2c5c822 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -97,18 +97,18 @@ asmlinkage __visible void cpu_bringup_and_idle(void)
 
 void xen_smp_intr_free_pv(unsigned int cpu)
 {
+	kfree(per_cpu(xen_irq_work, cpu).name);
+	per_cpu(xen_irq_work, cpu).name = NULL;
 	if (per_cpu(xen_irq_work, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_irq_work, cpu).irq, NULL);
 		per_cpu(xen_irq_work, cpu).irq = -1;
-		kfree(per_cpu(xen_irq_work, cpu).name);
-		per_cpu(xen_irq_work, cpu).name = NULL;
 	}
 
+	kfree(per_cpu(xen_pmu_irq, cpu).name);
+	per_cpu(xen_pmu_irq, cpu).name = NULL;
 	if (per_cpu(xen_pmu_irq, cpu).irq >= 0) {
 		unbind_from_irqhandler(per_cpu(xen_pmu_irq, cpu).irq, NULL);
 		per_cpu(xen_pmu_irq, cpu).irq = -1;
-		kfree(per_cpu(xen_pmu_irq, cpu).name);
-		per_cpu(xen_pmu_irq, cpu).name = NULL;
 	}
 }
 
@@ -118,6 +118,7 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 	char *callfunc_name, *pmu_name;
 
 	callfunc_name = kasprintf(GFP_KERNEL, "irqwork%d", cpu);
+	per_cpu(xen_irq_work, cpu).name = callfunc_name;
 	rc = bind_ipi_to_irqhandler(XEN_IRQ_WORK_VECTOR,
 				    cpu,
 				    xen_irq_work_interrupt,
@@ -127,10 +128,10 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 	if (rc < 0)
 		goto fail;
 	per_cpu(xen_irq_work, cpu).irq = rc;
-	per_cpu(xen_irq_work, cpu).name = callfunc_name;
 
 	if (is_xen_pmu) {
 		pmu_name = kasprintf(GFP_KERNEL, "pmu%d", cpu);
+		per_cpu(xen_pmu_irq, cpu).name = pmu_name;
 		rc = bind_virq_to_irqhandler(VIRQ_XENPMU, cpu,
 					     xen_pmu_irq_handler,
 					     IRQF_PERCPU|IRQF_NOBALANCING,
@@ -138,7 +139,6 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 		if (rc < 0)
 			goto fail;
 		per_cpu(xen_pmu_irq, cpu).irq = rc;
-		per_cpu(xen_pmu_irq, cpu).name = pmu_name;
 	}
 
 	return 0;
-- 
2.17.1


