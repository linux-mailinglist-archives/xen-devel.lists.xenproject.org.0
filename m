Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F524B5125
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271783.466521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb49-0007sP-6r; Mon, 14 Feb 2022 13:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271783.466521; Mon, 14 Feb 2022 13:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb48-0007hl-Cw; Mon, 14 Feb 2022 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 271783;
 Mon, 14 Feb 2022 13:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb37-0008IH-Qm
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a3793b-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:48 +0100 (CET)
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
X-Inumbo-ID: d3a3793b-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=wpC7OHZwlbhpO5r1RmqVd6pYMJ/HbdVJ8EUY+L3SZWA=;
  b=XX75n9f6efhcCupVnBRoo2pBpfUuOHA1OLKp+43u023cSUlwvhJo2exj
   0MjZfCGqaD+s0VwwFPbumxxKNrqk69xUbra85iG4A7QvgypnFs1/coDRM
   L4HswO1wxcMecS0rSFA1QaXOlKEYKCTzRDI+VcVOh+47ohiiNP2y8fCJv
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HhFuk9Q+k0qwxzBMTkHd8bbbX5Q0gHPvNI/XfoTIgc1RosQNASyqAu3saeVTLkNCSs8X49+GPB
 MMOagAMcYsHzHyxIET3RzsE+R8AID3U7KIJ9/zrY8mAhrvLFobcGoLY+08W4zHEJYKGk1MDIAc
 FktHzS0k969/2uRf8K+ColRkj8+epMR/eaL6y00L6+/E7CEi9EOL7Jtu9OcrX6zIiqP5W6mWv/
 9OxyBxx5M6QqAEyTbNX4g0t1bqieCqUmTlpPKcws8k3xeOVot7IOnNUGTjMoVCp0TApUMpOsZP
 K0MNQsKo3CyNungrpNxzedF7
X-SBRS: 5.1
X-MesageID: 64149429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pQ9VjKlyetOFyFuDjmbmqVvo5gyfIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCGHTPPzYZjanedt2bom+9x4Cv5bTmoJqTlBo+C40FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N9dssaNFiwVBIbzqMQdQxdyIhtZNLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qHO
 5tFM2sHgBLoUjJmCg4eF6gHnPqYjSLaYj14hVmUuv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTZW4JPOTmrLgw2gTVnzFNTk1NPbemnRWnokSuXIhid
 GcowAERnYgy5EKBf+PaVgLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4c9JRVDA1nJRoHGJ3j
 zdli/usXGUy6+PNFRpx45/J9WvaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JRjO0aTpwmvb9eQSn/hFFBd2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SUc7dxHHQGLxWRtlFAspp1xWG3zZS82QJrWzxqxZPg6gMiN2BGKuZGpldImK4C
 KMikQhQ+IVSLBOXgVxfOOqM5zAR5fG4T7zND6mMBvIXO8QZXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhgmTKNFcijlUzPPHj3TCf9dIrp+WCmNogRhJ5oai2Pm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:tCAOL6BbVakdCkjlHemo55DYdb4zR+YMi2TC1yhKKCC9E/bo7/
 xG885rtiMc5Ax/ZJhko6HlBEDiewKkyXcW2/hyAV7KZmCP0wHEQL2Kr7GSpAEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149429"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 11/70] xen: CFI hardening for notifier callbacks
Date: Mon, 14 Feb 2022 12:50:28 +0000
Message-ID: <20220214125127.17985-12-andrew.cooper3@citrix.com>
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
 xen/arch/x86/acpi/cpu_idle.c                 | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c                | 2 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c          | 2 +-
 xen/arch/x86/cpu/mwait-idle.c                | 4 ++--
 xen/arch/x86/cpu/vpmu.c                      | 2 +-
 xen/arch/x86/genapic/x2apic.c                | 2 +-
 xen/arch/x86/hvm/hvm.c                       | 2 +-
 xen/arch/x86/nmi.c                           | 2 +-
 xen/arch/x86/percpu.c                        | 2 +-
 xen/arch/x86/psr.c                           | 2 +-
 xen/arch/x86/smpboot.c                       | 2 +-
 xen/common/debugtrace.c                      | 4 ++--
 xen/common/kexec.c                           | 2 +-
 xen/common/livepatch.c                       | 2 +-
 xen/common/rcupdate.c                        | 2 +-
 xen/common/sched/core.c                      | 2 +-
 xen/common/sched/cpupool.c                   | 2 +-
 xen/common/stop_machine.c                    | 2 +-
 xen/common/tasklet.c                         | 2 +-
 xen/common/timer.c                           | 2 +-
 xen/common/trace.c                           | 2 +-
 xen/drivers/cpufreq/cpufreq.c                | 2 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 2 +-
 xen/drivers/passthrough/x86/hvm.c            | 2 +-
 24 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 7902ccce6b98..fb47eb9ad68e 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1622,7 +1622,7 @@ bool cpuidle_using_deep_cstate(void)
                                                                : ACPI_STATE_C1);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index ea86d84481b2..a449fa0424ce 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -733,7 +733,7 @@ static int cpu_bank_alloc(unsigned int cpu)
     return 0;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index d63d6083d3a7..b6da8262e662 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -931,7 +931,7 @@ static int cpu_mcabank_alloc(unsigned int cpu)
     return -ENOMEM;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 24d073d315ac..fe1b7af25f01 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1275,8 +1275,8 @@ static int __init mwait_idle_probe(void)
 	return 0;
 }
 
-static int mwait_idle_cpu_init(struct notifier_block *nfb,
-			       unsigned long action, void *hcpu)
+static int cf_check mwait_idle_cpu_init(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
 	unsigned int cpu = (unsigned long)hcpu, cstate;
 	struct acpi_processor_power *dev = processor_powers[cpu];
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 9fc897dc8403..df3c9201b2c1 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -817,7 +817,7 @@ long cf_check do_xenpmu_op(
     return ret;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 9064a0ca4696..bd44bb753995 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -187,7 +187,7 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
     .send_IPI_self = send_IPI_self_x2apic
 };
 
-static int update_clusterinfo(
+static int cf_check update_clusterinfo(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2ae1685d0aff..0a193530680a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -117,7 +117,7 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 21e947a46f24..5c101a9f97b3 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -428,7 +428,7 @@ void setup_apic_nmi_watchdog(void)
     nmi_active = 1;
 }
 
-static int cpu_nmi_callback(
+static int cf_check cpu_nmi_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 0e0b6577ca45..eb3ba7bc8874 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -63,7 +63,7 @@ static void free_percpu_area(unsigned int cpu)
     call_rcu(&info->rcu, _free_percpu_area);
 }
 
-static int cpu_percpu_callback(
+static int cf_check cpu_percpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 9a3670afc341..5b9991bd5b12 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1642,7 +1642,7 @@ static void psr_cpu_fini(unsigned int cpu)
         free_socket_resources(socket);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     int rc = 0;
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 335129a0104d..709704d71ada 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1112,7 +1112,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     return rc;
 }
 
-static int cpu_smpboot_callback(
+static int cf_check cpu_smpboot_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index f3c0fd8aa17b..160d00b79607 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -263,8 +263,8 @@ static void debugtrace_alloc_buffer(struct debugtrace_data **ptr,
     *ptr = data;
 }
 
-static int debugtrace_cpu_callback(struct notifier_block *nfb,
-                                   unsigned long action, void *hcpu)
+static int cf_check debugtrace_cpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 36384f782db3..3b223cd03d75 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -531,7 +531,7 @@ static int kexec_init_cpu_notes(const unsigned long cpu)
     return ret;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned long cpu = (unsigned long)hcpu;
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 33708b4e2388..701efd87a173 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2124,7 +2124,7 @@ static void livepatch_printall(unsigned char key)
     spin_unlock(&payload_lock);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index a5a27af3def0..2ec5606de5dd 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -641,7 +641,7 @@ static void rcu_init_percpu_data(int cpu, struct rcu_ctrlblk *rcp,
     init_timer(&rdp->idle_timer, rcu_idle_timer_handler, rdp, cpu);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0f527024ba2e..4a79971a1d45 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2839,7 +2839,7 @@ void sched_rm_cpu(unsigned int cpu)
     cpu_schedule_down(cpu);
 }
 
-static int cpu_schedule_callback(
+static int cf_check cpu_schedule_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f26c7f289539..e5cfb03b857e 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -985,7 +985,7 @@ void dump_runq(unsigned char key)
     spin_unlock(&cpupool_lock);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 8979d553d677..a122bd4afe09 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -182,7 +182,7 @@ static void stopmachine_action(void *data)
     local_irq_enable();
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
index ac89511a0955..1b16bbcdeb0b 100644
--- a/xen/common/tasklet.c
+++ b/xen/common/tasklet.c
@@ -214,7 +214,7 @@ void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
     t->is_softirq = 1;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/timer.c b/xen/common/timer.c
index 1bb265ceea0e..b788050ea1d8 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -637,7 +637,7 @@ static void free_percpu_timers(unsigned int cpu)
         ASSERT(ts->heap == dummy_heap);
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/common/trace.c b/xen/common/trace.c
index 61fecc2b2bd2..b5358508f804 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -79,7 +79,7 @@ static u32 tb_event_mask = TRC_ALL;
  * i.e., sizeof(_type) * ans >= _x. */
 #define fit_to_type(_type, _x) (((_x)+sizeof(_type)-1) / sizeof(_type))
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index e55e202d5a18..a94520ee57ac 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -632,7 +632,7 @@ static int __init cpufreq_cmdline_parse(const char *s)
     return rc;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 8343f491da87..ad79d0f5d246 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -91,7 +91,7 @@ cpufreq_userspace_handle_option(const char *name, const char *val)
     return 0;
 }
 
-static int cpufreq_userspace_cpu_callback(
+static int cf_check cpufreq_userspace_cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index e5a2c5830348..527bd6a56d83 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1046,7 +1046,7 @@ static void dpci_softirq(void)
     }
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
-- 
2.11.0


