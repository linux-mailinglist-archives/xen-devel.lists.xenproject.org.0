Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEAC8C3395
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 21:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720430.1123494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5scF-0002Oj-BE; Sat, 11 May 2024 19:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720430.1123494; Sat, 11 May 2024 19:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5scF-0002M7-8D; Sat, 11 May 2024 19:42:43 +0000
Received: by outflank-mailman (input) for mailman id 720430;
 Sat, 11 May 2024 19:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmPl=MO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5scD-0002M1-7Z
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 19:42:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a02c1680-0fce-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 21:42:39 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso145039066b.2
 for <xen-devel@lists.xenproject.org>; Sat, 11 May 2024 12:42:39 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34fed1sm3751139a12.96.2024.05.11.12.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 12:42:38 -0700 (PDT)
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
X-Inumbo-ID: a02c1680-0fce-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715456559; x=1716061359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqZtZryQor/ppvAR+iR/fgku6YlEtXdshM2WNruV4V4=;
        b=XMhne4QkVm/0Y3MqcyGvhGbDfR9Gk/UwRfhwNbBwtTaGPNmvkSvFV5VmbACad8Imh0
         1DjRYUqPgDd4F67hPkQwlZBHtjDSmvY9EPMevaY9puHKC/uILNaugSskUWcfRb8BDnBv
         3lzga4bge2+ejXLc0fOjmgaYeje25upOfmsX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715456559; x=1716061359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqZtZryQor/ppvAR+iR/fgku6YlEtXdshM2WNruV4V4=;
        b=OjuLNBg0Lu0IJEsS62r13hR4pACtpuVYcxRQr/Ht+na8iRhC1sJme6jZ0Q3FuglZSP
         pF8nBr7cUhr9DyakrICrV3aZZwTznYtZ3dhm8asq3gWt5jRVjC1SBQgQM8gsuRvs2T+5
         kxU/0gc5MeyT6zh3reVnYCAU7lFWszVfUT2lyxid3oWVhlL8rmG55Sf0UEFrNeBnXIyr
         Q3MnLhABzTcXAVdVQiWcz1ycSWs8nNCxPSiSb4CYTN69TqPyLFFtcW72+clhoGzhg3Bj
         TjVcCph/g/UVXP5xyyqIXEKQxOLEp9oNuodxv3ade+zTohjIH1Ef1Y0xoy9FyU/8VSwu
         eKyw==
X-Gm-Message-State: AOJu0YzG0P5deCgf3kFWqTXCmClbBEax8OW5BX8jYvImkvA+Dpee+t6O
	R+t+UYfPLNw8is7HK/knu1aFT95iIOeiq1CG2RstYDK5UvWwUaSOMRiAr4kE0fDmFjPou2QH8U1
	K
X-Google-Smtp-Source: AGHT+IHvW56HBIUibeOV4rBI6uPxDVDXUpS2j7ihhlwFhZHdcW6XWB5QCaydJX8oFiqgVuGb8rcdrw==
X-Received: by 2002:a50:d4c8:0:b0:572:719f:b430 with SMTP id 4fb4d7f45d1cf-5734d6f0080mr5347809a12.32.1715456558918;
        Sat, 11 May 2024 12:42:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/cpufreq: Rename cpuid variable/parameters to cpu
Date: Sat, 11 May 2024 20:42:37 +0100
Message-Id: <20240511194237.2596271-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various functions have a parameter or local variable called cpuid, but this
triggers a MISRA R5.3 violation because we also have a function called cpuid()
which wraps the real CPUID instruction.

In all these cases, it's a Xen cpu index, which is far more commonly named
just cpu in our code.

While adjusting these, fix a couple of other issues:

 * cpufreq_cpu_init() is on the end of a hypercall (with in-memory parameters,
   even), making EFAULT the wrong error to use.  Use EOPNOTSUPP instead.

 * check_est_cpu() is wrong to tie EIST to just Intel, and nowhere else using
   EIST makes this restriction.  Just check the feature itself, which is more
   succinctly done after being folded into its single caller.

 * In powernow_cpufreq_update(), replace an opencoded cpu_online().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

cpu needs to stay signed for now in set_px_pminfo(), because of get_cpu_id().
This can be cleaned up by making better use of BAD_APICID, but that's a much
more involved change.
---
 xen/arch/x86/acpi/cpu_idle.c              | 14 ++++----
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 24 +++----------
 xen/arch/x86/acpi/cpufreq/hwp.c           |  6 ++--
 xen/arch/x86/acpi/cpufreq/powernow.c      |  6 ++--
 xen/drivers/cpufreq/cpufreq.c             | 18 +++++-----
 xen/drivers/cpufreq/utility.c             | 43 +++++++++++------------
 xen/include/acpi/cpufreq/cpufreq.h        |  6 ++--
 xen/include/acpi/cpufreq/processor_perf.h |  8 ++---
 xen/include/xen/pmstat.h                  |  6 ++--
 9 files changed, 57 insertions(+), 74 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index cfce4cc0408f..c8db1aa9913a 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1498,14 +1498,14 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
-uint32_t pmstat_get_cx_nr(uint32_t cpuid)
+uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
-    return processor_powers[cpuid] ? processor_powers[cpuid]->count : 0;
+    return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
 }
 
-int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
+int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat)
 {
-    struct acpi_processor_power *power = processor_powers[cpuid];
+    struct acpi_processor_power *power = processor_powers[cpu];
     uint64_t idle_usage = 0, idle_res = 0;
     uint64_t last_state_update_tick, current_stime, current_tick;
     uint64_t usage[ACPI_PROCESSOR_MAX_POWER] = { 0 };
@@ -1522,7 +1522,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
         return 0;
     }
 
-    stat->idle_time = get_cpu_idle_time(cpuid);
+    stat->idle_time = get_cpu_idle_time(cpu);
     nr = min(stat->nr, power->count);
 
     /* mimic the stat when detail info hasn't been registered by dom0 */
@@ -1572,7 +1572,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
             idle_res += res[i];
         }
 
-        get_hw_residencies(cpuid, &hw_res);
+        get_hw_residencies(cpu, &hw_res);
 
 #define PUT_xC(what, n) do { \
         if ( stat->nr_##what >= n && \
@@ -1613,7 +1613,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
     return 0;
 }
 
-int pmstat_reset_cx_stat(uint32_t cpuid)
+int pmstat_reset_cx_stat(unsigned int cpu)
 {
     return 0;
 }
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 2b6ef99678ae..a341f2f02063 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -55,17 +55,6 @@ struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
 static bool __read_mostly acpi_pstate_strict;
 boolean_param("acpi_pstate_strict", acpi_pstate_strict);
 
-static int check_est_cpu(unsigned int cpuid)
-{
-    struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
-
-    if (cpu->x86_vendor != X86_VENDOR_INTEL ||
-        !cpu_has(cpu, X86_FEATURE_EIST))
-        return 0;
-
-    return 1;
-}
-
 static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
 {
     struct processor_performance *perf;
@@ -530,7 +519,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
         if (cpufreq_verbose)
             printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
                    "HARDWARE addr space\n");
-        if (!check_est_cpu(cpu)) {
+        if (!cpu_has(c, X86_FEATURE_EIST)) {
             result = -ENODEV;
             goto err_unreg;
         }
@@ -690,15 +679,12 @@ static int __init cf_check cpufreq_driver_late_init(void)
 }
 __initcall(cpufreq_driver_late_init);
 
-int cpufreq_cpu_init(unsigned int cpuid)
+int cpufreq_cpu_init(unsigned int cpu)
 {
-    int ret;
-
     /* Currently we only handle Intel, AMD and Hygon processor */
     if ( boot_cpu_data.x86_vendor &
          (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
-        ret = cpufreq_add_cpu(cpuid);
-    else
-        ret = -EFAULT;
-    return ret;
+        return cpufreq_add_cpu(cpu);
+
+    return -EOPNOTSUPP;
 }
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index e61212803e71..59b57a4cef86 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -506,11 +506,11 @@ static void cf_check hwp_set_misc_turbo(void *info)
     }
 }
 
-static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
+static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *policy)
 {
-    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);
+    on_selected_cpus(cpumask_of(cpu), hwp_set_misc_turbo, policy, 1);
 
-    return per_cpu(hwp_drv_data, cpuid)->ret;
+    return per_cpu(hwp_drv_data, cpu)->ret;
 }
 
 static const struct cpufreq_driver __initconst_cf_clobber
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 8a27ee82a5b0..69364e185562 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -68,12 +68,12 @@ static void cf_check update_cpb(void *data)
 }
 
 static int cf_check powernow_cpufreq_update(
-    int cpuid, struct cpufreq_policy *policy)
+    unsigned int cpu, struct cpufreq_policy *policy)
 {
-    if (!cpumask_test_cpu(cpuid, &cpu_online_map))
+    if ( !cpu_online(cpu) )
         return -EINVAL;
 
-    on_selected_cpus(cpumask_of(cpuid), update_cpb, policy, 1);
+    on_selected_cpus(cpumask_of(cpu), update_cpb, policy, 1);
 
     return 0;
 }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 36c800f4fa39..a74593b70577 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -459,21 +459,21 @@ static void print_PPC(unsigned int platform_limit)
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
-    int ret=0, cpuid;
+    int ret=0, cpu;
     struct processor_pminfo *pmpt;
     struct processor_performance *pxpt;
 
-    cpuid = get_cpu_id(acpi_id);
-    if ( cpuid < 0 || !perf )
+    cpu = get_cpu_id(acpi_id);
+    if ( cpu < 0 || !perf )
     {
         ret = -EINVAL;
         goto out;
     }
     if ( cpufreq_verbose )
-        printk("Set CPU acpi_id(%d) cpuid(%d) Px State info:\n",
+        printk("Set CPU acpi_id(%d) cpu(%d) Px State info:\n",
                acpi_id, cpuid);
 
-    pmpt = processor_pminfo[cpuid];
+    pmpt = processor_pminfo[cpu];
     if ( !pmpt )
     {
         pmpt = xzalloc(struct processor_pminfo);
@@ -482,11 +482,11 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
             ret = -ENOMEM;
             goto out;
         }
-        processor_pminfo[cpuid] = pmpt;
+        processor_pminfo[cpu] = pmpt;
     }
     pxpt = &pmpt->perf;
     pmpt->acpi_id = acpi_id;
-    pmpt->id = cpuid;
+    pmpt->id = cpu;
 
     if ( perf->flags & XEN_PX_PCT )
     {
@@ -564,7 +564,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
         if ( pxpt->init == XEN_PX_INIT )
         {
-            ret = cpufreq_limit_change(cpuid);
+            ret = cpufreq_limit_change(cpu);
             goto out;
         }
     }
@@ -573,7 +573,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
     {
         pxpt->init = XEN_PX_INIT;
 
-        ret = cpufreq_cpu_init(cpuid);
+        ret = cpufreq_cpu_init(cpu);
         goto out;
     }
 
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index dbf8985969b2..6d2413b32a55 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -86,13 +86,12 @@ void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
     spin_unlock(cpufreq_statistic_lock);
 }
 
-int cpufreq_statistic_init(unsigned int cpuid)
+int cpufreq_statistic_init(unsigned int cpu)
 {
     uint32_t i, count;
     struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpuid];
-    spinlock_t *cpufreq_statistic_lock = 
-                          &per_cpu(cpufreq_statistic_lock, cpuid);
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
 
     spin_lock_init(cpufreq_statistic_lock);
 
@@ -101,7 +100,7 @@ int cpufreq_statistic_init(unsigned int cpuid)
 
     spin_lock(cpufreq_statistic_lock);
 
-    pxpt = per_cpu(cpufreq_statistic_data, cpuid);
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
     if ( pxpt ) {
         spin_unlock(cpufreq_statistic_lock);
         return 0;
@@ -114,7 +113,7 @@ int cpufreq_statistic_init(unsigned int cpuid)
         spin_unlock(cpufreq_statistic_lock);
         return -ENOMEM;
     }
-    per_cpu(cpufreq_statistic_data, cpuid) = pxpt;
+    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
 
     pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
     if (!pxpt->u.trans_pt) {
@@ -138,22 +137,21 @@ int cpufreq_statistic_init(unsigned int cpuid)
         pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
 
     pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpuid);
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
 
     spin_unlock(cpufreq_statistic_lock);
 
     return 0;
 }
 
-void cpufreq_statistic_exit(unsigned int cpuid)
+void cpufreq_statistic_exit(unsigned int cpu)
 {
     struct pm_px *pxpt;
-    spinlock_t *cpufreq_statistic_lock = 
-               &per_cpu(cpufreq_statistic_lock, cpuid);
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
 
     spin_lock(cpufreq_statistic_lock);
 
-    pxpt = per_cpu(cpufreq_statistic_data, cpuid);
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
     if (!pxpt) {
         spin_unlock(cpufreq_statistic_lock);
         return;
@@ -162,22 +160,21 @@ void cpufreq_statistic_exit(unsigned int cpuid)
     xfree(pxpt->u.trans_pt);
     xfree(pxpt->u.pt);
     xfree(pxpt);
-    per_cpu(cpufreq_statistic_data, cpuid) = NULL;
+    per_cpu(cpufreq_statistic_data, cpu) = NULL;
 
     spin_unlock(cpufreq_statistic_lock);
 }
 
-void cpufreq_statistic_reset(unsigned int cpuid)
+void cpufreq_statistic_reset(unsigned int cpu)
 {
     uint32_t i, j, count;
     struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpuid];
-    spinlock_t *cpufreq_statistic_lock = 
-               &per_cpu(cpufreq_statistic_lock, cpuid);
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
 
     spin_lock(cpufreq_statistic_lock);
 
-    pxpt = per_cpu(cpufreq_statistic_data, cpuid);
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
     if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt ) {
         spin_unlock(cpufreq_statistic_lock);
         return;
@@ -194,7 +191,7 @@ void cpufreq_statistic_reset(unsigned int cpuid)
     }
 
     pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpuid);
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
 
     spin_unlock(cpufreq_statistic_lock);
 }
@@ -389,7 +386,7 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
     return policy->cur;
 }
 
-int cpufreq_update_turbo(int cpuid, int new_state)
+int cpufreq_update_turbo(unsigned int cpu, int new_state)
 {
     struct cpufreq_policy *policy;
     int curr_state;
@@ -399,7 +396,7 @@ int cpufreq_update_turbo(int cpuid, int new_state)
         new_state != CPUFREQ_TURBO_DISABLED)
         return -EINVAL;
 
-    policy = per_cpu(cpufreq_cpu_policy, cpuid);
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
     if (!policy)
         return -EACCES;
 
@@ -413,7 +410,7 @@ int cpufreq_update_turbo(int cpuid, int new_state)
     policy->turbo = new_state;
     if (cpufreq_driver.update)
     {
-        ret = alternative_call(cpufreq_driver.update, cpuid, policy);
+        ret = alternative_call(cpufreq_driver.update, cpu, policy);
         if (ret)
             policy->turbo = curr_state;
     }
@@ -422,11 +419,11 @@ int cpufreq_update_turbo(int cpuid, int new_state)
 }
 
 
-int cpufreq_get_turbo_status(int cpuid)
+int cpufreq_get_turbo_status(unsigned int cpu)
 {
     struct cpufreq_policy *policy;
 
-    policy = per_cpu(cpufreq_cpu_policy, cpuid);
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
     return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
 }
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index b4685a908599..443427153bb6 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -145,8 +145,8 @@ extern int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag);
 #define CPUFREQ_TURBO_UNSUPPORTED   0
 #define CPUFREQ_TURBO_ENABLED       1
 
-extern int cpufreq_update_turbo(int cpuid, int new_state);
-extern int cpufreq_get_turbo_status(int cpuid);
+int cpufreq_update_turbo(unsigned int cpu, int new_state);
+int cpufreq_get_turbo_status(unsigned int cpu);
 
 static inline int
 __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
@@ -167,7 +167,7 @@ struct cpufreq_driver {
     int    (*init)(struct cpufreq_policy *policy);
     int    (*verify)(struct cpufreq_policy *policy);
     int    (*setpolicy)(struct cpufreq_policy *policy);
-    int    (*update)(int cpuid, struct cpufreq_policy *policy);
+    int    (*update)(unsigned int cpu, struct cpufreq_policy *policy);
     int    (*target)(struct cpufreq_policy *policy,
                      unsigned int target_freq,
                      unsigned int relation);
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 7cd240061947..5f48aceadb21 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -12,9 +12,9 @@ unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
 void cpufreq_residency_update(unsigned int cpu, uint8_t state);
 void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
-int  cpufreq_statistic_init(unsigned int cpuid);
-void cpufreq_statistic_exit(unsigned int cpuid);
-void cpufreq_statistic_reset(unsigned int cpuid);
+int  cpufreq_statistic_init(unsigned int cpu);
+void cpufreq_statistic_exit(unsigned int cpu);
+void cpufreq_statistic_reset(unsigned int cpu);
 
 int  cpufreq_limit_change(unsigned int cpu);
 
@@ -59,5 +59,5 @@ struct pm_px {
 
 DECLARE_PER_CPU(struct pm_px *, cpufreq_statistic_data);
 
-int cpufreq_cpu_init(unsigned int cpuid);
+int cpufreq_cpu_init(unsigned int cpu);
 #endif /* __XEN_PROCESSOR_PM_H__ */
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 43b826ad4d37..e6ab1423a9be 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,9 +7,9 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
-uint32_t pmstat_get_cx_nr(uint32_t cpuid);
-int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat);
-int pmstat_reset_cx_stat(uint32_t cpuid);
+uint32_t pmstat_get_cx_nr(unsigned int cpu);
+int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat);
+int pmstat_reset_cx_stat(unsigned int cpu);
 
 int do_get_pm_info(struct xen_sysctl_get_pmstat *op);
 int do_pm_op(struct xen_sysctl_pm_op *op);
-- 
2.30.2


