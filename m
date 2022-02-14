Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBD4B5168
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271967.466744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDx-0005tc-M4; Mon, 14 Feb 2022 13:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271967.466744; Mon, 14 Feb 2022 13:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDx-0005rK-Ha; Mon, 14 Feb 2022 13:17:01 +0000
Received: by outflank-mailman (input) for mailman id 271967;
 Mon, 14 Feb 2022 13:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3X-00023t-Jd
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1f7365e-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:06:13 +0100 (CET)
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
X-Inumbo-ID: e1f7365e-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DvkxBtgSCdVebD4VLLY7NY7aTsNOKJgA8KGiz3D+sSg=;
  b=eJhUdTZvvPYd/WrwQI3bWhTwZ10S20HPK3m9Goxbd4liaygh3v0UwdSm
   /N9g1sH+xQLRNT0/105XjBkOpOKWCwC4H7+P2Sg1qUL6B5MdEmS4+3+ms
   vM8ACionfM6LtMxR1SQD7953sQKAgG0uruCjutHUDIFL+VlQlzuOgtBno
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uFd/8GjHXGZn2dw6P4h4cbueAJDEKi1MZmt9mLEP8k+l6RAKBQXr1MzE9QmMnkkpeDWJ08xksG
 yLK8BxkUldtzrwIthLtrOkRgAhmiwhnLDMysXkT69oarGUuU5/keO05v1LUZNnQd8bg8iwEoN5
 otcgzdMBjBAbDbXOqdEExE8U5R9n6XDqLbbA8bVsQZLWFV8x/TUmFdu5+2GEcS696Ui2MhiGdV
 5vIm+buc0r/Wg9VbRODd1gE7wAP+cKnaFQT3olvbo5a1EFOhvdqnvT0gNNSPQef70cd5gQ6T5U
 412AOROA4hzc2UKKK6WgToDp
X-SBRS: 5.1
X-MesageID: 66374944
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UsFTTKKx31Cik8p2FE+RzpIlxSXFcZb7ZxGr2PjKsXjdYENS1WMDn
 WdLD26FPKuCYjegLY8ga4Wy8hhTv8TQyIBqSlZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Hn9J1l
 e1G5aC9SAYJHpXNvOo5egFxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glu3Z8STKqCD
 yYfQRQ+PRXKfiFBAUoKK40Smuisoyb4YxQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3O1ofu913a1C+5SK
 k002hIviaYW3VSCG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5TBvLBTUMnUz3blrAAx8FaBvajtDdEhqQQ3Q8lJG8qFpxZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1j+N1mHBkmD+7qFKS503P7IdyrUW9Ed8tWGZipMhghE9diAmKo
 dtZKeWQzBBTDL/3biXNqNZBJlEWN3krQ5vxrpUPJOKEJwNnHkAnCuPQnux9K9A0wfwNm7ea5
 Gy5V29Z1EH72S/NJzKVZy0xc7joR5t+8y42ZHR+IVay1nE/So+z96NDJYAvdLwq+bU7n/55R
 vUIYeuaBfFLRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZn+
 u+uzALWR5YHVj9ONseOZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/dSV16CJq4ClT7l3EkZARjSJ6L+3MW/R/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxQ+Rx0KYzx9rzvLsLnA1rEULCY0mvFr49cGKN2tNCt/EVy7JU0edst
 pljJjWO1W21Bf7Y
IronPort-HdrOrdr: A9a23:wU3Gn6DZKqzyMFblHemo55DYdb4zR+YMi2TC1yhKKCC9E/bo7/
 xG885rtiMc5Ax/ZJhko6HlBEDiewKkyXcW2/hyAV7KZmCP0wHEQL2Kr7GSpAEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374944"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 40/70] x86/idle: CFI hardening
Date: Mon, 14 Feb 2022 12:50:57 +0000
Message-ID: <20220214125127.17985-41-andrew.cooper3@citrix.com>
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
 xen/arch/x86/acpi/cpu_idle.c                 | 31 +++++++++++++++++++++-------
 xen/arch/x86/acpi/cpuidle_menu.c             |  6 +++---
 xen/arch/x86/cpu/mwait-idle.c                |  2 +-
 xen/arch/x86/domain.c                        |  6 +++---
 xen/arch/x86/hpet.c                          |  4 ++--
 xen/arch/x86/include/asm/cpuidle.h           |  4 ++--
 xen/arch/x86/include/asm/hpet.h              |  4 ++--
 xen/arch/x86/include/asm/time.h              |  6 +++---
 xen/arch/x86/time.c                          |  6 +++---
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 14 ++++++-------
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
index 927ce1b67aa5..f76c64e04b20 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -773,7 +773,7 @@ static const struct cpuidle_state snr_cstates[] = {
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
diff --git a/xen/arch/x86/include/asm/cpuidle.h b/xen/arch/x86/include/asm/cpuidle.h
index 0981a8fd6417..3edd7a75d2ef 100644
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
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
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index 8f9725a95e21..f343fe4740f1 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
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
 
diff --git a/xen/arch/x86/include/asm/time.h b/xen/arch/x86/include/asm/time.h
index f06f2bfd8b8f..2a57d930ef30 100644
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -43,11 +43,11 @@ int hwdom_pit_access(struct ioreq *ioreq);
 
 int cpu_frequency_change(u64 freq);
 
-void pit_broadcast_enter(void);
-void pit_broadcast_exit(void);
+void cf_check pit_broadcast_enter(void);
+void cf_check pit_broadcast_exit(void);
 int pit_broadcast_is_available(void);
 
-uint64_t acpi_pm_tick_to_ns(uint64_t ticks);
+uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
 
 uint64_t tsc_ticks2ns(uint64_t ticks);
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index b6e690b76fab..043be2a8ec1a 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -545,7 +545,7 @@ static __init int cf_check init_pmtmr_scale(void)
 }
 __initcall(init_pmtmr_scale);
 
-uint64_t acpi_pm_tick_to_ns(uint64_t ticks)
+uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks)
 {
     return scale_delta(ticks, &pmt_scale);
 }
@@ -2237,12 +2237,12 @@ static int __init cf_check disable_pit_irq(void)
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
 
-- 
2.11.0


