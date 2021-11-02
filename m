Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE554439EA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 00:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220526.381823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi3Pv-0004SE-9Y; Tue, 02 Nov 2021 23:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220526.381823; Tue, 02 Nov 2021 23:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi3Pv-0004QR-4K; Tue, 02 Nov 2021 23:42:11 +0000
Received: by outflank-mailman (input) for mailman id 220526;
 Tue, 02 Nov 2021 23:42:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXs8=PV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mi3Pt-0004QL-LM
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 23:42:09 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e231714-3c36-11ec-855e-12813bfff9fa;
 Tue, 02 Nov 2021 23:42:08 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2Mw62d018099; 
 Tue, 2 Nov 2021 23:41:50 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c26e8jvdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Nov 2021 23:41:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2Nfckv139773;
 Tue, 2 Nov 2021 23:41:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 3c0v3emhae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Nov 2021 23:41:49 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1A2NfmIJ140417;
 Tue, 2 Nov 2021 23:41:48 GMT
Received: from bostrovs-us.us.oracle.com (bostrovs-us.us.oracle.com
 [10.152.12.19]) by aserp3030.oracle.com with ESMTP id 3c0v3emh9e-1;
 Tue, 02 Nov 2021 23:41:48 +0000
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
X-Inumbo-ID: 7e231714-3c36-11ec-855e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2021-07-09;
 bh=36cvZLG7nzHy1WDDbHNdPAkMG0X5CWKjGmksL7YL9Ck=;
 b=cdHeWhcWQEx3+OqXNNn1Bq0pXuqN0xSNagsgNji4dM5zc+14KoDBjLvoF8Cli3QK7Rnu
 GLosNY/1p8fmskQVa/r3mxVUU2to5cgrY2xEx70YZ/es+BFJWtfOugEi8bvDEtokJq+1
 dejn/gd6ODGFPiXl1ZWWVLgye7e8K6tbH/ZxVgrbbKhk9CiXmsnhdDwHjbFJGq9ZF4XQ
 YTNpTZ3ZlcPa5jkRDK0RbqeV+5LnyKxBHVMf9X178ApW/9y/sz0g7m2UFz/5xLX9le9s
 5wEHa+S/BZ/tOlJm7rDYBv0LWbksfHe0BPtUAMXbiSKUoZiQI59pg9jlcShCx1WwyQAp 6w== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, jgross@suse.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Date: Tue,  2 Nov 2021 19:36:36 -0400
Message-Id: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-GUID: IfvjVT_LMOgDHkf0XLPcHexo-rinRMka
X-Proofpoint-ORIG-GUID: IfvjVT_LMOgDHkf0XLPcHexo-rinRMka

Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
introduced cpu_l2c_shared_map mask which is expected to be initialized
by smp_op.smp_prepare_cpus(). That commit only updated
native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().
As result Xen PV guests crash in set_cpu_sibling_map().

While the new mask can be allocated in xen_pv_smp_prepare_cpus() one can
see that both versions of smp_prepare_cpus ops share a number of common
operations that can be factored out. So do that instead.

Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/include/asm/smp.h |  1 +
 arch/x86/kernel/smpboot.c  | 19 +++++++++++++------
 arch/x86/xen/smp_pv.c      | 11 ++---------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 08b0e90623ad..81a0211a372d 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -126,6 +126,7 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 
 void cpu_disable_common(void);
 void native_smp_prepare_boot_cpu(void);
+void smp_prepare_cpus_common(void);
 void native_smp_prepare_cpus(unsigned int max_cpus);
 void calculate_max_logical_packages(void);
 void native_smp_cpus_done(unsigned int max_cpus);
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 8241927addff..d7429198c22f 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1350,12 +1350,7 @@ static void __init smp_get_logical_apicid(void)
 		cpu0_logical_apicid = GET_APIC_LOGICAL_ID(apic_read(APIC_LDR));
 }
 
-/*
- * Prepare for SMP bootup.
- * @max_cpus: configured maximum number of CPUs, It is a legacy parameter
- *            for common interface support.
- */
-void __init native_smp_prepare_cpus(unsigned int max_cpus)
+void __init smp_prepare_cpus_common(void)
 {
 	unsigned int i;
 
@@ -1386,6 +1381,18 @@ void __init native_smp_prepare_cpus(unsigned int max_cpus)
 	set_sched_topology(x86_topology);
 
 	set_cpu_sibling_map(0);
+}
+
+/*
+ * Prepare for SMP bootup.
+ * @max_cpus: configured maximum number of CPUs, It is a legacy parameter
+ *            for common interface support.
+ */
+void __init native_smp_prepare_cpus(unsigned int max_cpus)
+{
+
+	smp_prepare_cpus_common();
+
 	init_freq_invariance(false, false);
 	smp_sanity_check();
 
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 9e55bcbfcd33..69e91d0d3ca4 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -238,16 +238,9 @@ static void __init xen_pv_smp_prepare_cpus(unsigned int max_cpus)
 	}
 	xen_init_lock_cpu(0);
 
-	smp_store_boot_cpu_info();
-	cpu_data(0).x86_max_cores = 1;
+	smp_prepare_cpus_common();
 
-	for_each_possible_cpu(i) {
-		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
-		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
-		zalloc_cpumask_var(&per_cpu(cpu_die_map, i), GFP_KERNEL);
-		zalloc_cpumask_var(&per_cpu(cpu_llc_shared_map, i), GFP_KERNEL);
-	}
-	set_cpu_sibling_map(0);
+	cpu_data(0).x86_max_cores = 1;
 
 	speculative_store_bypass_ht_init();
 
-- 
1.8.3.1


