Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3D45EE00
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232666.403447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRT-0001bI-0W; Fri, 26 Nov 2021 12:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232666.403447; Fri, 26 Nov 2021 12:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRS-0001YX-PB; Fri, 26 Nov 2021 12:35:02 +0000
Received: by outflank-mailman (input) for mailman id 232666;
 Fri, 26 Nov 2021 12:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRR-0001F5-9e
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43b4b394-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:34:59 +0100 (CET)
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
X-Inumbo-ID: 43b4b394-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jk0u+NLjbBn13CendvrV78gP6Sc2KoMbuVoCytP69cs=;
  b=JYW1TivbsqyNb4Ovd5muzYkkxJbZVj9xOB31kO2H00tBYYdzlfuGgWKt
   9dJzSDxutBL0Yu2imuAPmiTPalTLMsWjfzXFrkJ24pJA/sci49rJcMAq5
   c5BN+uQLibecOco1NgZYs5WbfjmnZuOCaYIW2XGAsWEEhSiVWS1Hqg6Vy
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8H2Jlk0IsMH0cIJfrQUi8LpuJgKbPQ002IlxsT+2w4kw4UmkYpuQkj/EDC5pp0R58PejfjNhb0
 dlVWNi3J5yxzWS1I3223LzcapbaxxR8kannHaex9OXEgybQ8T8qCHbLizt7ATkMV2rLES5CFvB
 QUt1dgrGvuGZSVrK3rVrAdmPPH+fQyXnXrApQ7nVjdRe7MJi5C+YBPtL0V8mRVeI/W675hPA5P
 qsBkUQjasB5KEx1oPpcUUbmjljZN9jwcfVVapK461XdBaAeZ7KbVlU9ZRBGmgSXqDPS+kxZN9t
 RSpbV1y73nU7uPoyGHzzIEBJ
X-SBRS: 5.1
X-MesageID: 58633364
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qApO/qqhvOAJv3cQYC6esinx1Q5eBmLtYhIvgKrLsJaIsI4StFCzt
 garIBmDbq2JMDemftEnadiz/UIG7ZWBn9U1QQNkqXoyQXkV9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZytbQYuGPOPocRHTDB5LX9nE5MFwZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ppHMmE0MkiojxtnIGcUEalntrySq2TSdjZStUvWu4cp2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYKdiexDyt4n+qwOjVkkvTQ5kOHbe18vprhly7xWEJDhASE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy19qqwrDSUZ2ssDTUdTA46ExIr3ZraidRm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNf9P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQ8ZJG9eFoSfLkWVsDNdWfxwB3iEsI2KBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YqK1/ZoX4/ORDMhAgBdXTAd4lkY
 v93lu72UB4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnhABIFkwSm2iWcQehIA1g6AI7SsV9EhSpTFUQR0ZyAgRDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:/oTs6q2E1DxZ1fotO3T4iwqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58633364"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/65] xen: Annotate fnptr targets from notifier callbacks
Date: Fri, 26 Nov 2021 12:33:48 +0000
Message-ID: <20211126123446.32324-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
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
index bb9f3a3ff795..343bdb3a22ef 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -921,7 +921,7 @@ static int cpu_mcabank_alloc(unsigned int cpu)
     return -ENOMEM;
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index d1739f6fc3cf..f2444bcff146 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1195,8 +1195,8 @@ static int __init mwait_idle_probe(void)
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
index c23e66d04c02..fec94a00e9a2 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -841,7 +841,7 @@ long cf_check do_xenpmu_op(
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
index 7af11656dcfd..0e935be1d772 100644
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
index 329cfdb6c9f6..2b452dab9e75 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1109,7 +1109,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
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
index a2a389a1c7c3..0886be089bea 100644
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
index ef71c3b92717..fef350ef3a1d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1042,7 +1042,7 @@ static void dpci_softirq(void)
     }
 }
 
-static int cpu_callback(
+static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
-- 
2.11.0


