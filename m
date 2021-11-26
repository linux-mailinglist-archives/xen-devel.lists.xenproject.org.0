Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52A45EE9E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232782.403805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawQ-0003zI-PC; Fri, 26 Nov 2021 13:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232782.403805; Fri, 26 Nov 2021 13:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawQ-0003kw-93; Fri, 26 Nov 2021 13:07:02 +0000
Received: by outflank-mailman (input) for mailman id 232782;
 Fri, 26 Nov 2021 13:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavH-0003W9-0F
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92ea1cf3-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:49 +0100 (CET)
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
X-Inumbo-ID: 92ea1cf3-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fjt4FTXRqzsNvO1Bgk1R2D4yNEdp9/3zXUQNGV4mJuY=;
  b=KNJUnG5Ow1g9BDbB/Fw5OUP+iQ43hsgEcDd0Pq65ZW5eGfXu/Vts8BmL
   /2TtO54yeLSowqM2QFZ70hy4m3840c87RMKf3cD6Ls4uOipruC2qAEHJ6
   AlWmNMBKWbUWB96UdMq0xUN649WOe/GXiKJgnkoqBIJLng3bGxPMaFniW
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YGBaZ+vcSFMZpJ7CJMlyA3tJ6oA7fLKQGFXtvt5tYIaUDpjSkNnDfsAt6EcKceRcn90+Vb7Bgd
 vvryaQwtkjvGUJbRH/xDHHQuIuzb/dZN01k+wSCTIo94DHbaJ6SHiyqBlFOdC5FqHnQ0Y4fYgJ
 PeKGAaXA//dEybytppsLE9RUHX6Or6fSz7B0SM3ChxFrBMPsJmPtNF5NVRLtFJJ9KeR2JWmc9h
 lgweT+XwIiypiFA0st6Ilk/ids6/pRdylrJYtXfFTnyr32uj4ycVDisHo1U+Da6bxXzsmFPJuI
 e7iQlWN2n//tRPoELe3Krc02
X-SBRS: 5.1
X-MesageID: 58193841
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IUAnuKMKjHbFzunvrR1okMFynXyQoLVcMsEvi/4bfWQNrUoihjFRn
 TQeWWzTb/uMYmugfY93PYnn80tUscSAmtYxTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozCsleBdm
 I4OicHzSB0jF5Xwk+AcWiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdp15seQa+2i
 8wxMiprajfaby11ZlpUI48fvej3l2ajWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaBmxQsd4oLUNFnqwCXwIPs3w2dB2E9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPsG8jexY1bJpfEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:CIVp8qGjMyjCSUOGpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193841"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 36/65] x86/idle: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:17 +0000
Message-ID: <20211126123446.32324-37-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/acpi/cpu_idle.c                 | 31 +++++++++++++++++++++-------
 xen/arch/x86/acpi/cpuidle_menu.c             |  6 +++---
 xen/arch/x86/cpu/mwait-idle.c                |  2 +-
 xen/arch/x86/domain.c                        |  6 +++---
 xen/arch/x86/hpet.c                          |  4 ++--
 xen/arch/x86/time.c                          |  6 +++---
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 14 ++++++-------
 xen/include/asm-x86/cpuidle.h                |  4 ++--
 xen/include/asm-x86/hpet.h                   |  4 ++--
 xen/include/asm-x86/time.h                   |  6 +++---
 10 files changed, 49 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0142671bb836..557bc6ef8642 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -75,7 +75,7 @@
 #define GET_CC7_RES(val)  GET_HW_RES_IN_NS(0x3FE, val) /* SNB onwards */
 #define PHI_CC6_RES(val)  GET_HW_RES_IN_NS(0x3FF, val) /* Xeon Phi only */
 
-static void lapic_timer_nop(void) { }
+static void cf_check lapic_timer_nop(void) { }
 void (*__read_mostly lapic_timer_off)(void);
 void (*__read_mostly lapic_timer_on)(void);
 
@@ -310,12 +310,27 @@ static char* acpi_cstate_method_name[] =
     "HALT"
 };
 
-static uint64_t get_stime_tick(void) { return (uint64_t)NOW(); }
-static uint64_t stime_ticks_elapsed(uint64_t t1, uint64_t t2) { return t2 - t1; }
-static uint64_t stime_tick_to_ns(uint64_t ticks) { return ticks; }
+static uint64_t cf_check get_stime_tick(void)
+{
+    return NOW();
+}
+
+static uint64_t cf_check stime_ticks_elapsed(uint64_t t1, uint64_t t2)
+{
+    return t2 - t1;
+}
+
+static uint64_t cf_check stime_tick_to_ns(uint64_t ticks)
+{
+    return ticks;
+}
+
+static uint64_t cf_check get_acpi_pm_tick(void)
+{
+    return inl(pmtmr_ioport);
+}
 
-static uint64_t get_acpi_pm_tick(void) { return (uint64_t)inl(pmtmr_ioport); }
-static uint64_t acpi_pm_ticks_elapsed(uint64_t t1, uint64_t t2)
+static uint64_t cf_check acpi_pm_ticks_elapsed(uint64_t t1, uint64_t t2)
 {
     if ( t2 >= t1 )
         return (t2 - t1);
@@ -664,7 +679,7 @@ void update_idle_stats(struct acpi_processor_power *power,
     spin_unlock(&power->stat_lock);
 }
 
-static void acpi_processor_idle(void)
+static void cf_check acpi_processor_idle(void)
 {
     unsigned int cpu = smp_processor_id();
     struct acpi_processor_power *power = processor_powers[cpu];
@@ -869,7 +884,7 @@ static void acpi_processor_idle(void)
         cpuidle_current_governor->reflect(power);
 }
 
-void acpi_dead_idle(void)
+void cf_check acpi_dead_idle(void)
 {
     struct acpi_processor_power *power;
     struct acpi_processor_cx *cx;
diff --git a/xen/arch/x86/acpi/cpuidle_menu.c b/xen/arch/x86/acpi/cpuidle_menu.c
index 6ff5fb8ff215..a275436d799c 100644
--- a/xen/arch/x86/acpi/cpuidle_menu.c
+++ b/xen/arch/x86/acpi/cpuidle_menu.c
@@ -185,7 +185,7 @@ static unsigned int get_sleep_length_us(void)
     return (us >> 32) ? (unsigned int)-2000 : (unsigned int)us;
 }
 
-static int menu_select(struct acpi_processor_power *power)
+static int cf_check menu_select(struct acpi_processor_power *power)
 {
     struct menu_device *data = &this_cpu(menu_devices);
     int i;
@@ -237,7 +237,7 @@ static int menu_select(struct acpi_processor_power *power)
     return data->last_state_idx;
 }
 
-static void menu_reflect(struct acpi_processor_power *power)
+static void cf_check menu_reflect(struct acpi_processor_power *power)
 {
     struct menu_device *data = &this_cpu(menu_devices);
     u64 new_factor;
@@ -275,7 +275,7 @@ static void menu_reflect(struct acpi_processor_power *power)
     data->correction_factor[data->bucket] = new_factor;
 }
 
-static int menu_enable_device(struct acpi_processor_power *power)
+static int cf_check menu_enable_device(struct acpi_processor_power *power)
 {
     memset(&per_cpu(menu_devices, power->cpu), 0, sizeof(struct menu_device));
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 7a4b0837a01f..cf999070ee28 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -738,7 +738,7 @@ static const struct cpuidle_state dnv_cstates[] = {
 	{}
 };
 
-static void mwait_idle(void)
+static void cf_check mwait_idle(void)
 {
 	unsigned int cpu = smp_processor_id();
 	struct acpi_processor_power *power = processor_powers[cpu];
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1c3a1ec2a080..ae7c88b51af1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -74,11 +74,11 @@
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
-static void default_idle(void);
+static void cf_check default_idle(void);
 void (*pm_idle) (void) __read_mostly = default_idle;
 void (*dead_idle) (void) __read_mostly = default_dead_idle;
 
-static void default_idle(void)
+static void cf_check default_idle(void)
 {
     struct cpu_info *info = get_cpu_info();
 
@@ -93,7 +93,7 @@ static void default_idle(void)
         local_irq_enable();
 }
 
-void default_dead_idle(void)
+void cf_check default_dead_idle(void)
 {
     /*
      * When going into S3, without flushing caches modified data may be
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index c31fd97579dc..20fca839907c 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -709,7 +709,7 @@ void hpet_disable_legacy_broadcast(void)
     smp_send_event_check_mask(&cpu_online_map);
 }
 
-void hpet_broadcast_enter(void)
+void cf_check hpet_broadcast_enter(void)
 {
     unsigned int cpu = smp_processor_id();
     struct hpet_event_channel *ch = per_cpu(cpu_bc_channel, cpu);
@@ -740,7 +740,7 @@ void hpet_broadcast_enter(void)
     spin_unlock(&ch->lock);
 }
 
-void hpet_broadcast_exit(void)
+void cf_check hpet_broadcast_exit(void)
 {
     unsigned int cpu = smp_processor_id();
     struct hpet_event_channel *ch = per_cpu(cpu_bc_channel, cpu);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index dda09f0680b3..ef036a187415 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -535,7 +535,7 @@ static __init int cf_check init_pmtmr_scale(void)
 }
 __initcall(init_pmtmr_scale);
 
-uint64_t acpi_pm_tick_to_ns(uint64_t ticks)
+uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks)
 {
     return scale_delta(ticks, &pmt_scale);
 }
@@ -2232,12 +2232,12 @@ static int __init cf_check disable_pit_irq(void)
 }
 __initcall(disable_pit_irq);
 
-void pit_broadcast_enter(void)
+void cf_check pit_broadcast_enter(void)
 {
     cpumask_set_cpu(smp_processor_id(), &pit_broadcast_mask);
 }
 
-void pit_broadcast_exit(void)
+void cf_check pit_broadcast_exit(void)
 {
     int cpu = smp_processor_id();
 
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index ad79d0f5d246..f5571f5486ab 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -26,8 +26,8 @@
 static unsigned int __read_mostly userspace_cmdline_freq;
 static DEFINE_PER_CPU(unsigned int, cpu_set_freq);
 
-static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
-                                      unsigned int event)
+static int cf_check cpufreq_governor_userspace(
+    struct cpufreq_policy *policy, unsigned int event)
 {
     int ret = 0;
     unsigned int cpu;
@@ -81,7 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
     return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
 }
 
-static bool_t __init
+static bool __init cf_check
 cpufreq_userspace_handle_option(const char *name, const char *val)
 {
     if (!strcmp(name, "speed") && val) {
@@ -131,8 +131,8 @@ __initcall(cpufreq_gov_userspace_init);
 /*
  * cpufreq performance governor
  */
-static int cpufreq_governor_performance(struct cpufreq_policy *policy,
-                                      unsigned int event)
+static int cf_check cpufreq_governor_performance(
+    struct cpufreq_policy *policy, unsigned int event)
 {
     int ret = 0;
 
@@ -170,8 +170,8 @@ __initcall(cpufreq_gov_performance_init);
 /*
  * cpufreq powersave governor
  */
-static int cpufreq_governor_powersave(struct cpufreq_policy *policy,
-                                      unsigned int event)
+static int cf_check cpufreq_governor_powersave(
+    struct cpufreq_policy *policy, unsigned int event)
 {
     int ret = 0;
 
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/asm-x86/cpuidle.h
index 0981a8fd6417..3edd7a75d2ef 100644
--- a/xen/include/asm-x86/cpuidle.h
+++ b/xen/include/asm-x86/cpuidle.h
@@ -17,8 +17,8 @@ extern uint64_t (*cpuidle_get_tick)(void);
 
 int mwait_idle_init(struct notifier_block *);
 int cpuidle_init_cpu(unsigned int cpu);
-void default_dead_idle(void);
-void acpi_dead_idle(void);
+void cf_check default_dead_idle(void);
+void cf_check acpi_dead_idle(void);
 void play_dead(void);
 void trace_exit_reason(u32 *irq_traced);
 void update_idle_stats(struct acpi_processor_power *,
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
index 8f9725a95e21..f343fe4740f1 100644
--- a/xen/include/asm-x86/hpet.h
+++ b/xen/include/asm-x86/hpet.h
@@ -91,8 +91,8 @@ void hpet_disable_legacy_replacement_mode(void);
  */
 void hpet_broadcast_init(void);
 void hpet_broadcast_resume(void);
-void hpet_broadcast_enter(void);
-void hpet_broadcast_exit(void);
+void cf_check hpet_broadcast_enter(void);
+void cf_check hpet_broadcast_exit(void);
 int hpet_broadcast_is_available(void);
 void hpet_disable_legacy_broadcast(void);
 
diff --git a/xen/include/asm-x86/time.h b/xen/include/asm-x86/time.h
index f347311cc429..69742450575c 100644
--- a/xen/include/asm-x86/time.h
+++ b/xen/include/asm-x86/time.h
@@ -43,11 +43,11 @@ int hwdom_pit_access(struct ioreq *ioreq);
 
 int cpu_frequency_change(u64 freq);
 
-void pit_broadcast_enter(void);
-void pit_broadcast_exit(void);
+void cf_check pit_broadcast_enter(void);
+void cf_check pit_broadcast_exit(void);
 int pit_broadcast_is_available(void);
 
-uint64_t acpi_pm_tick_to_ns(uint64_t ticks);
+uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
 uint64_t ns_to_acpi_pm_tick(uint64_t ns);
 
 uint64_t tsc_ticks2ns(uint64_t ticks);
-- 
2.11.0


