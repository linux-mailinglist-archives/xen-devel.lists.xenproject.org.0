Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB3630E33
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 12:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446042.701532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008Cv-77; Sat, 19 Nov 2022 11:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446042.701532; Sat, 19 Nov 2022 11:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008AP-0x; Sat, 19 Nov 2022 11:07:10 +0000
Received: by outflank-mailman (input) for mailman id 446042;
 Sat, 19 Nov 2022 09:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TADl=3T=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1owJkC-0003Ee-EZ
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 09:02:36 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ad8afc-67e8-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 10:02:34 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NDndf6QTTzFqQX;
 Sat, 19 Nov 2022 16:59:18 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 17:02:30 +0800
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
X-Inumbo-ID: e6ad8afc-67e8-11ed-91b6-6bf2151ebd3b
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
Date: Sat, 19 Nov 2022 16:59:22 +0800
Message-ID: <20221119085923.114889-2-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119085923.114889-1-xiujianfeng@huawei.com>
References: <20221119085923.114889-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 arch/x86/xen/smp.c    | 16 ++++++++++++----
 arch/x86/xen/smp_pv.c |  8 ++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index c3e1f9a7d43a..6e9426b6b18a 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -71,8 +71,10 @@ int xen_smp_intr_init(unsigned int cpu)
 				    IRQF_PERCPU|IRQF_NOBALANCING,
 				    resched_name,
 				    NULL);
-	if (rc < 0)
+	if (rc < 0) {
+		kfree(resched_name);
 		goto fail;
+	}
 	per_cpu(xen_resched_irq, cpu).irq = rc;
 	per_cpu(xen_resched_irq, cpu).name = resched_name;
 
@@ -83,8 +85,10 @@ int xen_smp_intr_init(unsigned int cpu)
 				    IRQF_PERCPU|IRQF_NOBALANCING,
 				    callfunc_name,
 				    NULL);
-	if (rc < 0)
+	if (rc < 0) {
+		kfree(callfunc_name);
 		goto fail;
+	}
 	per_cpu(xen_callfunc_irq, cpu).irq = rc;
 	per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
 
@@ -94,8 +98,10 @@ int xen_smp_intr_init(unsigned int cpu)
 					     xen_debug_interrupt,
 					     IRQF_PERCPU | IRQF_NOBALANCING,
 					     debug_name, NULL);
-		if (rc < 0)
+		if (rc < 0) {
+			kfree(debug_name);
 			goto fail;
+		}
 		per_cpu(xen_debug_irq, cpu).irq = rc;
 		per_cpu(xen_debug_irq, cpu).name = debug_name;
 	}
@@ -107,8 +113,10 @@ int xen_smp_intr_init(unsigned int cpu)
 				    IRQF_PERCPU|IRQF_NOBALANCING,
 				    callfunc_name,
 				    NULL);
-	if (rc < 0)
+	if (rc < 0) {
+		kfree(callfunc_name);
 		goto fail;
+	}
 	per_cpu(xen_callfuncsingle_irq, cpu).irq = rc;
 	per_cpu(xen_callfuncsingle_irq, cpu).name = callfunc_name;
 
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 480be82e9b7b..228d0207380c 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -124,8 +124,10 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 				    IRQF_PERCPU|IRQF_NOBALANCING,
 				    callfunc_name,
 				    NULL);
-	if (rc < 0)
+	if (rc < 0) {
+		kfree(callfunc_name);
 		goto fail;
+	}
 	per_cpu(xen_irq_work, cpu).irq = rc;
 	per_cpu(xen_irq_work, cpu).name = callfunc_name;
 
@@ -135,8 +137,10 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 					     xen_pmu_irq_handler,
 					     IRQF_PERCPU|IRQF_NOBALANCING,
 					     pmu_name, NULL);
-		if (rc < 0)
+		if (rc < 0) {
+			kfree(pmu_name);
 			goto fail;
+		}
 		per_cpu(xen_pmu_irq, cpu).irq = rc;
 		per_cpu(xen_pmu_irq, cpu).name = pmu_name;
 	}
-- 
2.17.1


