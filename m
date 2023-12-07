Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5180838A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649609.1014326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3G-00054V-WA; Thu, 07 Dec 2023 08:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649609.1014326; Thu, 07 Dec 2023 08:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3G-0004zs-Os; Thu, 07 Dec 2023 08:48:10 +0000
Received: by outflank-mailman (input) for mailman id 649609;
 Thu, 07 Dec 2023 08:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3F-0004QV-08
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56be460f-94dd-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 09:48:06 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id 498F34EE073F;
 Thu,  7 Dec 2023 09:48:05 +0100 (CET)
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
X-Inumbo-ID: 56be460f-94dd-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/5] xen/acpi: address violations of MISRA C:2012 Rule 8.2
Date: Thu,  7 Dec 2023 09:47:51 +0100
Message-Id: <47c08c496a403d60bbf5b18c7a079ac7a575efbc.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701936906.git.federico.serafini@bugseng.com>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - do not add parameters to acpi_pic_sci_set_trigger() (removed).
---
 xen/include/acpi/apei.h                   |  5 +++--
 xen/include/acpi/cpufreq/cpufreq.h        |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 16 ++++++++--------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/include/acpi/apei.h b/xen/include/acpi/apei.h
index eab16e2543..495819e362 100644
--- a/xen/include/acpi/apei.h
+++ b/xen/include/acpi/apei.h
@@ -12,8 +12,9 @@
 
 #define FIX_APEI_RANGE_MAX 64
 
-typedef int (*apei_hest_func_t)(const struct acpi_hest_header *, void *);
-int apei_hest_parse(apei_hest_func_t, void *);
+typedef int (*apei_hest_func_t)(const struct acpi_hest_header *hest_hdr,
+                                void *data);
+int apei_hest_parse(apei_hest_func_t func, void *data);
 
 int erst_write(const struct cper_record_header *record);
 ssize_t erst_get_record_count(void);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3456d4c95f..b4685a9085 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -177,7 +177,7 @@ struct cpufreq_driver {
 
 extern struct cpufreq_driver cpufreq_driver;
 
-int cpufreq_register_driver(const struct cpufreq_driver *);
+int cpufreq_register_driver(const struct cpufreq_driver *driver_data);
 
 static inline
 void cpufreq_verify_within_limits(struct cpufreq_policy *policy,
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 8b5a1b9bde..7cd2400619 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -10,16 +10,16 @@
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
-void cpufreq_residency_update(unsigned int, uint8_t);
-void cpufreq_statistic_update(unsigned int, uint8_t, uint8_t);
-int  cpufreq_statistic_init(unsigned int);
-void cpufreq_statistic_exit(unsigned int);
-void cpufreq_statistic_reset(unsigned int);
+void cpufreq_residency_update(unsigned int cpu, uint8_t state);
+void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
+int  cpufreq_statistic_init(unsigned int cpuid);
+void cpufreq_statistic_exit(unsigned int cpuid);
+void cpufreq_statistic_reset(unsigned int cpuid);
 
-int  cpufreq_limit_change(unsigned int);
+int  cpufreq_limit_change(unsigned int cpu);
 
-int  cpufreq_add_cpu(unsigned int);
-int  cpufreq_del_cpu(unsigned int);
+int  cpufreq_add_cpu(unsigned int cpu);
+int  cpufreq_del_cpu(unsigned int cpu);
 
 struct processor_performance {
     uint32_t state;
-- 
2.34.1


