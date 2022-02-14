Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B574B50FF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271645.466211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2C-0000n3-1F; Mon, 14 Feb 2022 13:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271645.466211; Mon, 14 Feb 2022 13:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2B-0000jP-QA; Mon, 14 Feb 2022 13:04:51 +0000
Received: by outflank-mailman (input) for mailman id 271645;
 Mon, 14 Feb 2022 13:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb29-0008IH-LL
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af782393-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:48 +0100 (CET)
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
X-Inumbo-ID: af782393-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=BEoNz1G1VEb1PvMVHl3dUIUZku1FDM+32RnsoUebuRQ=;
  b=JpfsnV0I4ACv5kyo+ixL2GWs1tBqlly6FtEObKMqncdivA8rw7A0BJ/L
   trlnzdHdD3UziKDVAs1TLv5iUltIfFUTFVKEg0zim8tBSXoEOQh9nJOxM
   fVdk471ds+H3Fx3ciFJ9CEkfuiSUye9SBNabxVQtPb1KL/iAAskQMc+rk
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PmpWHPe03+VbbIE8oS71P1YGSlFsPbH89gQw0QKTwC1T5H0nJ9d2eaFOerhhj1Ah1qQnKJENtV
 MpRBfFGnvfyed4YbBcjHH0BgfNLvImeqtPHMzvTttRCI7rCoIJkHz932whdopODlUl7pG1czdn
 9+AA9t4cqorIciBtMdP9cx57Db7benA5L3uTaylXG57W2QWmOJW6Yg7seuVdSaaGJmougDINAJ
 rH20FV5qvSEvCsesfmGrjG/Zs6Ti0kQ0SsfODw6APf/I0laBbDntFLdv/iBgXpSwkRalj5X/E9
 tgAnKaKKSCEbCQs5QgfSEbhJ
X-SBRS: 5.1
X-MesageID: 64149632
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sJNihKpkBnGbHDq2jI9fCPpKaWdeBmIGYhIvgKrLsJaIsI4StFCzt
 garIBmCa6uPYDbzL98kbo23pBxVsMDVzdMwGlFrris1RCxD9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZK+axwJGaHdorsmdUNCLjN7IY9IxLCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZANWsxN06ojxtnOGcPGpwek8qRn3zeai9mklu8oYQe2j2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16KVGj3qc02hvJnDVVUUBIEwvgyRWktqKgc9xRC
 Vc03SY/l/cJ0haxc8v4Qz+2nHHR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9VTA2iCMlbWd0j
 wHUxrsFERQq6eTIEizFqt94uBvvYXB9EIMUWcMToeLpCfHHqZp7sB/AR80L/EWd3oysQmGYL
 9xnQUEDa1QvYSwjiv/TEbPv2WvESn31oukdvFu/Y45dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM/RyHPdELhQROjyvZ5p1QEwZnY1QfEcG8mFoSb/Lei8HhkiTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKj3GZUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuNGcGln0z/i+L2ibz8Ye5tDWZip9sRtMusyDg5O
 f4GXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:F1g3+asH0y7UsJN15xlOxFFn7skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149632"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 36/70] x86/power: CFI hardening
Date: Mon, 14 Feb 2022 12:50:53 +0000
Message-ID: <20220214125127.17985-37-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

cpufreq_governor_dbs() has no external callers so make it static.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c    | 14 +++++++-------
 xen/arch/x86/acpi/cpufreq/powernow.c   | 15 ++++++++-------
 xen/common/core_parking.c              |  4 ++--
 xen/drivers/cpufreq/cpufreq_ondemand.c |  6 ++++--
 xen/include/acpi/cpufreq/cpufreq.h     |  1 -
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 8133c2dd958c..c27cbb2304f2 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -320,7 +320,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     return policy->cpuinfo.max_freq * perf_percent / 100;
 }
 
-static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
+static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
 {
     struct cpufreq_policy *policy;
     struct acpi_cpufreq_data *data;
@@ -369,8 +369,9 @@ static unsigned int check_freqs(const cpumask_t *mask, unsigned int freq,
     return 0;
 }
 
-static int acpi_cpufreq_target(struct cpufreq_policy *policy,
-                               unsigned int target_freq, unsigned int relation)
+static int cf_check acpi_cpufreq_target(
+    struct cpufreq_policy *policy,
+    unsigned int target_freq, unsigned int relation)
 {
     struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
     struct processor_performance *perf;
@@ -449,7 +450,7 @@ static int acpi_cpufreq_target(struct cpufreq_policy *policy,
     return result;
 }
 
-static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
+static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
     struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
@@ -494,8 +495,7 @@ acpi_cpufreq_guess_freq(struct acpi_cpufreq_data *data, unsigned int cpu)
     }
 }
 
-static int 
-acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
     unsigned int i;
     unsigned int valid_states = 0;
@@ -609,7 +609,7 @@ acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
     return result;
 }
 
-static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static int cf_check acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
     struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
 
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index ca71ecf72d67..d4c7dcd5d99d 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -67,8 +67,8 @@ static void cf_check update_cpb(void *data)
     }
 }
 
-static int powernow_cpufreq_update (int cpuid,
-				     struct cpufreq_policy *policy)
+static int cf_check powernow_cpufreq_update(
+    int cpuid, struct cpufreq_policy *policy)
 {
     if (!cpumask_test_cpu(cpuid, &cpu_online_map))
         return -EINVAL;
@@ -78,8 +78,9 @@ static int powernow_cpufreq_update (int cpuid,
     return 0;
 }
 
-static int powernow_cpufreq_target(struct cpufreq_policy *policy,
-                               unsigned int target_freq, unsigned int relation)
+static int cf_check powernow_cpufreq_target(
+    struct cpufreq_policy *policy,
+    unsigned int target_freq, unsigned int relation)
 {
     struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
     struct processor_performance *perf;
@@ -180,7 +181,7 @@ static void cf_check get_cpu_data(void *arg)
         amd_fixup_frequency(&perf->states[i]);
 }
 
-static int powernow_cpufreq_verify(struct cpufreq_policy *policy)
+static int cf_check powernow_cpufreq_verify(struct cpufreq_policy *policy)
 {
     struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
@@ -197,7 +198,7 @@ static int powernow_cpufreq_verify(struct cpufreq_policy *policy)
     return cpufreq_frequency_table_verify(policy, data->freq_table);
 }
 
-static int powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
     unsigned int i;
     unsigned int valid_states = 0;
@@ -303,7 +304,7 @@ static int powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
     return result;
 }
 
-static int powernow_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static int cf_check powernow_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
     struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
 
diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index 4afad04f2f68..c4f01291c0be 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -53,7 +53,7 @@ static int __init cf_check setup_core_parking_option(const char *str)
 }
 custom_param("core_parking", setup_core_parking_option);
 
-static unsigned int core_parking_performance(unsigned int event)
+static unsigned int cf_check core_parking_performance(unsigned int event)
 {
     unsigned int cpu = -1;
 
@@ -111,7 +111,7 @@ static unsigned int core_parking_performance(unsigned int event)
     return cpu;
 }
 
-static unsigned int core_parking_power(unsigned int event)
+static unsigned int cf_check core_parking_power(unsigned int event)
 {
     unsigned int cpu = -1;
 
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index ba03eaa2336d..fbcd14d6c32f 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -215,7 +215,8 @@ static void dbs_timer_exit(struct cpu_dbs_info_s *dbs_info)
     kill_timer(&per_cpu(dbs_timer, dbs_info->cpu));
 }
 
-int cpufreq_governor_dbs(struct cpufreq_policy *policy, unsigned int event)
+static int cf_check cpufreq_governor_dbs(
+    struct cpufreq_policy *policy, unsigned int event)
 {
     unsigned int cpu = policy->cpu;
     struct cpu_dbs_info_s *this_dbs_info;
@@ -307,7 +308,8 @@ int cpufreq_governor_dbs(struct cpufreq_policy *policy, unsigned int event)
     return 0;
 }
 
-static bool_t __init cpufreq_dbs_handle_option(const char *name, const char *val)
+static bool __init cf_check cpufreq_dbs_handle_option(
+    const char *name, const char *val)
 {
     if ( !strcmp(name, "rate") && val )
     {
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 4958d3f7d315..e5e58c6c30ea 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -227,7 +227,6 @@ struct cpu_dbs_info_s {
     int8_t stoppable;
 };
 
-int cpufreq_governor_dbs(struct cpufreq_policy *policy, unsigned int event);
 int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
                               uint32_t *sampling_rate_min,
                               uint32_t *sampling_rate,
-- 
2.11.0


