Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814A805398
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647699.1011253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU23-0000MI-LZ; Tue, 05 Dec 2023 11:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647699.1011253; Tue, 05 Dec 2023 11:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU23-0000KA-Gm; Tue, 05 Dec 2023 11:56:07 +0000
Received: by outflank-mailman (input) for mailman id 647699;
 Tue, 05 Dec 2023 11:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU22-0008Co-94
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d20997-9365-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:56:03 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 0AC094EE074A;
 Tue,  5 Dec 2023 12:56:03 +0100 (CET)
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
X-Inumbo-ID: 43d20997-9365-11ee-98e5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/6] xen/acpi: address remaining violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:50 +0100
Message-Id: <6c0fa7c13641c53800c323285275fd58d9989326.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701764980.git.federico.serafini@bugseng.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of MISRA C:2012
Rule 8.2. Furthermore, use C standard types to comply with XEN coding style.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/acpi.h           |  2 +-
 xen/include/acpi/apei.h                   |  5 +++--
 xen/include/acpi/cpufreq/cpufreq.h        |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 16 ++++++++--------
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 0df92d3714..d54c105f61 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -81,7 +81,7 @@ extern bool acpi_lapic, acpi_ioapic, acpi_noirq;
 extern bool acpi_force, acpi_ht, acpi_disabled;
 extern u32 acpi_smi_cmd;
 extern u8 acpi_enable_value, acpi_disable_value;
-void acpi_pic_sci_set_trigger(unsigned int, u16);
+void acpi_pic_sci_set_trigger(unsigned int irq, uint16_t trigger);
 
 static inline void disable_acpi(void)
 {
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


