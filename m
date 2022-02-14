Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBE4B5161
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271923.466679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDX-0002w9-5T; Mon, 14 Feb 2022 13:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271923.466679; Mon, 14 Feb 2022 13:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDX-0002tR-1I; Mon, 14 Feb 2022 13:16:35 +0000
Received: by outflank-mailman (input) for mailman id 271923;
 Mon, 14 Feb 2022 13:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4e-0008IH-R5
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c38c0dc-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:23 +0100 (CET)
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
X-Inumbo-ID: 0c38c0dc-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9/V6nzRZ7VtFwWVXXCLQG4zjWKxi0K/Bd1I6aiIEiw4=;
  b=QwfDrd+KjLriMLTRD8JjDXaV2nHw8a8HueWc/3V+NCVzN7JvAH9/z7fH
   0xfqQffuljFd1DVxeL8XN+x7qPNZvzhm4F5Kw3LgdhWuZN5E/Tv0Vi03a
   QaU8WASpp4R7stoivLdlKqBdK854CMoOTenN8KKhlvrtl8zFHtSagrIO8
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QoVcGhRi2qO89G0mlfsb3z4fJRpxrsWCEmF6IwH+yljjgQ6tmYJwawULIcQxB9vpa1O+JOptVA
 bKotuYX0SADBqbFVQiOG1r3zg9P2auTZSkj8pSLzYuyz4ZKERtSE20w/ElRbN5G+qa20yMck23
 xNHi1dgvhE8BswwY8rc5rUY6kfcp5nHN6UjGAnWQnhHs5zJ15/ShNok35B++zocRrf9hjy8Yqc
 RJm7x70n8A5ocJ6g0Cygzd7AeePFcmWYHMxkiFy0cNWWVVzTnO2/OEWhQMLOMhtNy7N5UbNLvV
 Pc0x15hKmHTsn35tqjzmlU8z
X-SBRS: 5.1
X-MesageID: 64554436
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ylsxfa9MNE57VophY7JdDrUDmXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mQZDW3UPPuOM2ejLYx/O9u+oExSu8PVz983SgVs/H08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhhx
 vUQr56/az4IM53ristGAiZBHSNXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SQKuCO
 5FHAdZpRC+cMjtyJVsZMc8dwbaUonbUTz5yuE3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9GphG7jQdBQC
 XU19xoJv4dppXOyQNvUCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxgmzOJGMyTItbO+eP2WUN5gIwtaDOmBt3VJovd/Fy9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:1Yj2jamh1rf49naRkJgShayoFFjpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554436"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 16/70] xen: CFI hardening for IPIs
Date: Mon, 14 Feb 2022 12:50:33 +0000
Message-ID: <20220214125127.17985-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/cpu_idle.c            |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c     |  8 ++++----
 xen/arch/x86/acpi/cpufreq/powernow.c    |  6 +++---
 xen/arch/x86/acpi/lib.c                 |  2 +-
 xen/arch/x86/cpu/amd.c                  |  2 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c  |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c           |  6 +++---
 xen/arch/x86/cpu/mcheck/mce_intel.c     |  2 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c     |  2 +-
 xen/arch/x86/cpu/microcode/core.c       |  2 +-
 xen/arch/x86/cpu/mtrr/generic.c         |  2 +-
 xen/arch/x86/cpu/mtrr/main.c            |  2 +-
 xen/arch/x86/cpu/mwait-idle.c           |  6 +++---
 xen/arch/x86/cpu/vpmu.c                 |  4 ++--
 xen/arch/x86/guest/xen/xen.c            |  2 +-
 xen/arch/x86/hvm/nestedhvm.c            |  3 +--
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
 xen/arch/x86/include/asm/mtrr.h         |  2 +-
 xen/arch/x86/irq.c                      |  4 ++--
 xen/arch/x86/nmi.c                      |  2 +-
 xen/arch/x86/oprofile/nmi_int.c         | 10 +++++-----
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 xen/arch/x86/platform_hypercall.c       |  4 ++--
 xen/arch/x86/psr.c                      |  2 +-
 xen/arch/x86/shutdown.c                 |  4 ++--
 xen/arch/x86/smp.c                      |  2 +-
 xen/arch/x86/sysctl.c                   |  2 +-
 xen/arch/x86/time.c                     |  8 ++++----
 xen/common/cpu.c                        |  4 ++--
 xen/common/gdbstub.c                    |  2 +-
 xen/common/keyhandler.c                 |  2 +-
 xen/common/page_alloc.c                 |  2 +-
 32 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index fb47eb9ad68e..22c8bb0c2d94 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -145,7 +145,7 @@ struct hw_residencies
     uint64_t cc7;
 };
 
-static void do_get_hw_residencies(void *arg)
+static void cf_check do_get_hw_residencies(void *arg)
 {
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 9510f05340aa..8133c2dd958c 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -129,7 +129,7 @@ struct drv_cmd {
     u32 val;
 };
 
-static void do_drv_read(void *drvcmd)
+static void cf_check do_drv_read(void *drvcmd)
 {
     struct drv_cmd *cmd;
 
@@ -148,7 +148,7 @@ static void do_drv_read(void *drvcmd)
     }
 }
 
-static void do_drv_write(void *drvcmd)
+static void cf_check do_drv_write(void *drvcmd)
 {
     struct drv_cmd *cmd;
     uint64_t msr_content;
@@ -244,7 +244,7 @@ struct perf_pair {
 static DEFINE_PER_CPU(struct perf_pair, gov_perf_pair);
 static DEFINE_PER_CPU(struct perf_pair, usr_perf_pair);
 
-static void read_measured_perf_ctrs(void *_readin)
+static void cf_check read_measured_perf_ctrs(void *_readin)
 {
     struct perf_pair *readin = _readin;
 
@@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
-static void feature_detect(void *info)
+static void cf_check feature_detect(void *info)
 {
     struct cpufreq_policy *policy = info;
     unsigned int eax;
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index da8fc40b9a6f..ca71ecf72d67 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -44,12 +44,12 @@
 
 #define ARCH_CPU_FLAG_RESUME	1
 
-static void transition_pstate(void *pstate)
+static void cf_check transition_pstate(void *pstate)
 {
     wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
 }
 
-static void update_cpb(void *data)
+static void cf_check update_cpb(void *data)
 {
     struct cpufreq_policy *policy = data;
 
@@ -165,7 +165,7 @@ struct amd_cpu_data {
     u32 max_hw_pstate;
 };
 
-static void get_cpu_data(void *arg)
+static void cf_check get_cpu_data(void *arg)
 {
     struct amd_cpu_data *data = arg;
     struct processor_performance *perf = data->perf;
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index b66e7338e74d..43831b92d132 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -99,7 +99,7 @@ unsigned int acpi_get_processor_id(unsigned int cpu)
 	return INVALID_ACPIID;
 }
 
-static void get_mwait_ecx(void *info)
+static void cf_check get_mwait_ecx(void *info)
 {
 	*(u32 *)info = cpuid_ecx(CPUID_MWAIT_LEAF);
 }
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a8e37dbb1f5c..2d18223f20ef 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -430,7 +430,7 @@ static void disable_c1_ramping(void)
 	}
 }
 
-static void disable_c1e(void *unused)
+static void cf_check disable_c1e(void *unused)
 {
 	uint64_t msr_content;
 
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index da0bf85f0223..efb45c931e1f 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -79,7 +79,7 @@ static int variable_period = 1;
  * Collects information of correctable errors and notifies
  * Dom0 via an event.
  */
-static void mce_amd_checkregs(void *info)
+static void cf_check mce_amd_checkregs(void *info)
 {
 	mctelem_cookie_t mctc;
 	struct mca_summary bs;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index a449fa0424ce..43f6c8471a90 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -961,7 +961,7 @@ void x86_mcinfo_dump(struct mc_info *mi)
     } while ( 1 );
 }
 
-static void do_mc_get_cpu_info(void *v)
+static void cf_check do_mc_get_cpu_info(void *v)
 {
     int cpu = smp_processor_id();
     int cindex, cpn;
@@ -1242,7 +1242,7 @@ static void x86_mc_hwcr_wren_restore(uint64_t hwcr)
         wrmsrl(MSR_K8_HWCR, hwcr);
 }
 
-static void x86_mc_msrinject(void *data)
+static void cf_check x86_mc_msrinject(void *data)
 {
     struct xen_mc_msrinject *mci = data;
     struct mcinfo_msr *msr;
@@ -1274,7 +1274,7 @@ static void x86_mc_msrinject(void *data)
 }
 
 /*ARGSUSED*/
-static void x86_mc_mceinject(void *data)
+static void cf_check x86_mc_mceinject(void *data)
 {
     printk("Simulating #MC on cpu %d\n", smp_processor_id());
     __asm__ __volatile__("int $0x12");
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index b6da8262e662..a691e10bdcd6 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -599,7 +599,7 @@ static void mce_set_owner(void)
     cmci_discover();
 }
 
-static void __cpu_mcheck_distribute_cmci(void *unused)
+static void cf_check __cpu_mcheck_distribute_cmci(void *unused)
 {
     cmci_discover();
 }
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index f7e411c0870e..1c0c32ba0821 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -32,7 +32,7 @@ static uint64_t period = MCE_PERIOD;
 static int adjust = 0;
 static int variable_period = 1;
 
-static void mce_checkregs (void *info)
+static void cf_check mce_checkregs(void *info)
 {
 	mctelem_cookie_t mctc;
 	struct mca_summary bs;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9631042190ab..841364208053 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -533,7 +533,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
     return ret;
 }
 
-static int do_microcode_update(void *patch)
+static int cf_check do_microcode_update(void *patch)
 {
     unsigned int cpu = smp_processor_id();
     int ret;
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 883e3398ff71..7cf4cd01f3f6 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -84,7 +84,7 @@ bool is_var_mtrr_overlapped(const struct mtrr_state *m)
     return false;
 }
 
-void mtrr_save_fixed_ranges(void *info)
+void cf_check mtrr_save_fixed_ranges(void *info)
 {
 	get_fixed_ranges(mtrr_state.fixed_ranges);
 }
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 428133100d46..4e01c8d6f9df 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -131,7 +131,7 @@ struct set_mtrr_data {
  */
 int hold_mtrr_updates_on_aps;
 
-static void ipi_handler(void *info)
+static void cf_check ipi_handler(void *info)
 /*  [SUMMARY] Synchronisation handler. Executed by "other" CPUs.
     [RETURNS] Nothing.
 */
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index fe1b7af25f01..927ce1b67aa5 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -877,7 +877,7 @@ static void mwait_idle(void)
 		cpuidle_current_governor->reflect(power);
 }
 
-static void auto_demotion_disable(void *dummy)
+static void cf_check auto_demotion_disable(void *dummy)
 {
 	u64 msr_bits;
 
@@ -886,13 +886,13 @@ static void auto_demotion_disable(void *dummy)
 	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
 }
 
-static void byt_auto_demotion_disable(void *dummy)
+static void cf_check byt_auto_demotion_disable(void *dummy)
 {
 	wrmsrl(MSR_CC6_DEMOTION_POLICY_CONFIG, 0);
 	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
 }
 
-static void c1e_promotion_disable(void *dummy)
+static void cf_check c1e_promotion_disable(void *dummy)
 {
 	u64 msr_bits;
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index df3c9201b2c1..4fedc7c57012 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -335,7 +335,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
 #endif
 }
 
-static void vpmu_save_force(void *arg)
+static void cf_check vpmu_save_force(void *arg)
 {
     struct vcpu *v = arg;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -528,7 +528,7 @@ void vpmu_initialise(struct vcpu *v)
         put_vpmu(v);
 }
 
-static void vpmu_clear_last(void *arg)
+static void cf_check vpmu_clear_last(void *arg)
 {
     if ( this_cpu(last_vcpu) == arg )
         this_cpu(last_vcpu) = NULL;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 2ff63d370a8a..b2aa3a009b4a 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -289,7 +289,7 @@ int xg_free_unused_page(mfn_t mfn)
     return rangeset_remove_range(mem, mfn_x(mfn), mfn_x(mfn));
 }
 
-static void ap_resume(void *unused)
+static void cf_check ap_resume(void *unused)
 {
     BUG_ON(map_vcpuinfo());
     BUG_ON(init_evtchn());
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 23516884482b..58370190ffc9 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -82,8 +82,7 @@ nestedhvm_vcpu_destroy(struct vcpu *v)
     alternative_vcall(hvm_funcs.nhvm_vcpu_destroy, v);
 }
 
-static void
-nestedhvm_flushtlb_ipi(void *info)
+static void cf_check nestedhvm_flushtlb_ipi(void *info)
 {
     struct vcpu *v = current;
     struct domain *d = info;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index f72a7db0453d..2b6bafe9d542 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -589,7 +589,7 @@ static void vmx_free_vmcs(paddr_t pa)
     free_domheap_page(maddr_to_page(pa));
 }
 
-static void __vmx_clear_vmcs(void *info)
+static void cf_check __vmx_clear_vmcs(void *info)
 {
     struct vcpu *v = info;
     struct vmx_vcpu *vmx = &v->arch.hvm.vmx;
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index e0fd1005ce72..7733800b798f 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -64,7 +64,7 @@ struct mtrr_state {
 };
 extern struct mtrr_state mtrr_state;
 
-extern void mtrr_save_fixed_ranges(void *);
+extern void cf_check mtrr_save_fixed_ranges(void *);
 extern void mtrr_save_state(void);
 extern int mtrr_add(unsigned long base, unsigned long size,
                     unsigned int type, char increment);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f9c808455535..d9bd355113d7 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1127,7 +1127,7 @@ static inline void clear_pirq_eoi(struct domain *d, unsigned int irq)
     }
 }
 
-static void set_eoi_ready(void *data);
+static void cf_check set_eoi_ready(void *data);
 
 static void cf_check irq_guest_eoi_timer_fn(void *data)
 {
@@ -1398,7 +1398,7 @@ static void __set_eoi_ready(const struct irq_desc *desc)
 }
 
 /* Mark specified IRQ as ready-for-EOI (if it really is) and attempt to EOI. */
-static void set_eoi_ready(void *data)
+static void cf_check set_eoi_ready(void *data)
 {
     struct irq_desc *desc = data;
 
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index c8ae4a5d7460..e20d1393c881 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -149,7 +149,7 @@ int nmi_active;
     (P4_CCCR_OVF_PMI0|P4_CCCR_THRESHOLD(15)|P4_CCCR_COMPLEMENT| \
      P4_CCCR_COMPARE|P4_CCCR_REQUIRED|P4_CCCR_ESCR_SELECT(4)|P4_CCCR_ENABLE)
 
-static void __init wait_for_nmis(void *p)
+static void __init cf_check wait_for_nmis(void *p)
 {
     unsigned int start_count = this_cpu(nmi_count);
     unsigned long ticks = 10 * 1000 * cpu_khz / nmi_hz;
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index ba9c4b9804ca..6ebe20bd1d3e 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -131,7 +131,7 @@ static void nmi_cpu_save_registers(struct op_msrs *msrs)
 }
 
 
-static void nmi_save_registers(void * dummy)
+static void cf_check nmi_save_registers(void *dummy)
 {
 	int cpu = smp_processor_id();
 	struct op_msrs * msrs = &cpu_msrs[cpu];
@@ -179,7 +179,7 @@ static int allocate_msrs(void)
 }
 
 
-static void nmi_cpu_setup(void * dummy)
+static void cf_check nmi_cpu_setup(void *dummy)
 {
 	int cpu = smp_processor_id();
 	struct op_msrs * msrs = &cpu_msrs[cpu];
@@ -245,7 +245,7 @@ static void nmi_restore_registers(struct op_msrs * msrs)
 }
 
 
-static void nmi_cpu_shutdown(void * dummy)
+static void cf_check nmi_cpu_shutdown(void *dummy)
 {
 	int cpu = smp_processor_id();
 	struct op_msrs * msrs = &cpu_msrs[cpu];
@@ -261,7 +261,7 @@ void nmi_release_counters(void)
 }
 
 
-static void nmi_cpu_start(void * dummy)
+static void cf_check nmi_cpu_start(void *dummy)
 {
 	int cpu = smp_processor_id();
 	struct op_msrs const * msrs = &cpu_msrs[cpu];
@@ -278,7 +278,7 @@ int nmi_start(void)
 }
 
 
-static void nmi_cpu_stop(void * dummy)
+static void cf_check nmi_cpu_stop(void *dummy)
 {
 	unsigned int v;
 	int cpu = smp_processor_id();
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index ee6eb0ecae79..2177f02946e2 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -436,7 +436,7 @@ static void athlon_stop(struct op_msrs const * const msrs)
 #define APIC_EILVT_MSG_NMI              0x4
 #define APIC_EILVT_LVTOFF_IBS           1
 #define APIC_EILVTn(n)                  (0x500 + 0x10 * n)
-static inline void __init init_ibs_nmi_per_cpu(void *arg)
+static inline void __init cf_check init_ibs_nmi_per_cpu(void *arg)
 {
 	unsigned long reg;
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index f5d7adc1e802..b91ccff58900 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -47,7 +47,7 @@ struct resource_access {
 
 long cf_check cpu_frequency_change_helper(void *);
 void check_resource_access(struct resource_access *);
-void resource_access(void *);
+void cf_check resource_access(void *);
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -149,7 +149,7 @@ void check_resource_access(struct resource_access *ra)
     ra->nr_done = i;
 }
 
-void resource_access(void *info)
+void cf_check resource_access(void *info)
 {
     struct resource_access *ra = info;
     unsigned int i;
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 5b9991bd5b12..6c9cabf3843d 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1247,7 +1247,7 @@ struct cos_write_info
     const uint32_t *val;
 };
 
-static void do_write_psr_msrs(void *data)
+static void cf_check do_write_psr_msrs(void *data)
 {
     const struct cos_write_info *info = data;
     unsigned int i, index, cos = info->cos;
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index ad3e3a76916f..30985d36a612 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -118,7 +118,7 @@ static inline void kb_wait(void)
             break;
 }
 
-static void noreturn __machine_halt(void *unused)
+static void noreturn cf_check __machine_halt(void *unused)
 {
     local_irq_disable();
 
@@ -548,7 +548,7 @@ static int __init cf_check reboot_init(void)
 }
 __initcall(reboot_init);
 
-static void noreturn __machine_restart(void *pdelay)
+static void cf_check noreturn __machine_restart(void *pdelay)
 {
     machine_restart(*(unsigned int *)pdelay);
 }
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index f4952a6bf9a5..f6fd7f95df58 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -339,7 +339,7 @@ void __stop_this_cpu(void)
     cpumask_clear_cpu(smp_processor_id(), &cpu_online_map);
 }
 
-static void stop_this_cpu(void *dummy)
+static void cf_check stop_this_cpu(void *dummy)
 {
     __stop_this_cpu();
     for ( ; ; )
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1772f51f8f6e..f82abc248885 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -69,7 +69,7 @@ struct l3_cache_info {
     unsigned long size;
 };
 
-static void l3_cache_get(void *arg)
+static void cf_check l3_cache_get(void *arg)
 {
     struct cpuid4_info info;
     struct l3_cache_info *l3_info = arg;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index fac97023bf10..b444d6344e79 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1661,7 +1661,7 @@ static void check_tsc_warp(unsigned long tsc_khz, unsigned long *max_warp)
 static unsigned long tsc_max_warp, tsc_check_count;
 static cpumask_t tsc_check_cpumask;
 
-static void tsc_check_slave(void *unused)
+static void cf_check tsc_check_slave(void *unused)
 {
     unsigned int cpu = smp_processor_id();
     local_irq_disable();
@@ -1809,7 +1809,7 @@ static void time_calibration_tsc_rendezvous(void *_r)
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */
-static void time_calibration_std_rendezvous(void *_r)
+static void cf_check time_calibration_std_rendezvous(void *_r)
 {
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
@@ -1840,7 +1840,7 @@ static void time_calibration_std_rendezvous(void *_r)
  * Rendezvous function used when clocksource is TSC and
  * no CPU hotplug will be performed.
  */
-static void time_calibration_nop_rendezvous(void *rv)
+static void cf_check time_calibration_nop_rendezvous(void *rv)
 {
     const struct calibration_rendezvous *r = rv;
     struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
@@ -2032,7 +2032,7 @@ static void __init tsc_check_writability(void)
     disable_tsc_sync = true;
 }
 
-static void __init reset_percpu_time(void *unused)
+static void __init cf_check reset_percpu_time(void *unused)
 {
     struct cpu_time *t = &this_cpu(cpu_time);
 
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 1f976db0a51f..b0b63cdb3638 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -84,13 +84,13 @@ static int cpu_notifier_call_chain(unsigned int cpu, unsigned long action,
     return ret;
 }
 
-static void _take_cpu_down(void *unused)
+static void cf_check _take_cpu_down(void *unused)
 {
     cpu_notifier_call_chain(smp_processor_id(), CPU_DYING, NULL, true);
     __cpu_disable();
 }
 
-static int take_cpu_down(void *arg)
+static int cf_check take_cpu_down(void *arg)
 {
     _take_cpu_down(arg);
     return 0;
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 99bfd9a654c9..079c3ca9616a 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -660,7 +660,7 @@ static int __init cf_check initialise_gdb(void)
 }
 presmp_initcall(initialise_gdb);
 
-static void gdb_pause_this_cpu(void *unused)
+static void cf_check gdb_pause_this_cpu(void *unused)
 {
     unsigned long flags;
 
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 8b9f37837162..2c916d528ab2 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -360,7 +360,7 @@ static cpumask_t read_clocks_cpumask;
 static DEFINE_PER_CPU(s_time_t, read_clocks_time);
 static DEFINE_PER_CPU(u64, read_cycles_time);
 
-static void read_clocks_slave(void *unused)
+static void cf_check read_clocks_slave(void *unused)
 {
     unsigned int cpu = smp_processor_id();
     local_irq_disable();
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 561e238d2d6a..827617502e35 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1898,7 +1898,7 @@ void __init end_boot_allocator(void)
     printk("\n");
 }
 
-static void __init smp_scrub_heap_pages(void *data)
+static void __init cf_check smp_scrub_heap_pages(void *data)
 {
     unsigned long mfn, start, end;
     struct page_info *pg;
-- 
2.11.0


