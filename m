Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB245EEAD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232831.403943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawu-0002Kq-Ld; Fri, 26 Nov 2021 13:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232831.403943; Fri, 26 Nov 2021 13:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawu-0002EF-5j; Fri, 26 Nov 2021 13:07:32 +0000
Received: by outflank-mailman (input) for mailman id 232831;
 Fri, 26 Nov 2021 13:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavm-0003W9-0I
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a57716ae-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:20 +0100 (CET)
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
X-Inumbo-ID: a57716ae-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WTIRJTAjCr7fLAVZPwIgCZwnRELjNRnUT72EuTQsn8A=;
  b=GTI0ITRoK/KTNMCGL5ikwqvqc5NedEm+4RfZXgNGb8mGYWQ8oMS6mZqD
   5Hq9+fASZiXWyCFMrBXn61A8bEPO4Hhx+kDziMRYx/HluN+dKKXNKrLlm
   uumVkC6MmoZtkX0gI0j080+def9aYCq8PYAOc0qc2mXOml2Xucyb1poPh
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /9KGlOuy6Tx9M98ey6QNrBzDzYpB52YceVWdKiE4VRJG+h33+wRSnDJeGE3By+kCxjPe50poE4
 EBr90O2Fe3nUR0769x50SUg/TLj1z2CBgGrWkbGqwEP6fF/+uP6Mxl+cbGrr/61qPZiw9QDdFu
 Udm8gTv8bQ6vW+YvjctlMxWhzLzi/miP0m1HDfS3d21y2/BgF+sNcWZYrAqixu6CXMvMGCWt/y
 MqdoVUGNbZzvuv8R+8K8wmCiU9j75Kt0+2zZlNwCWYuZ/Ov4S97RxdXrheT3ltPj+ezcfElveg
 +mxQtNPMwFwgFoB74WrEApfA
X-SBRS: 5.1
X-MesageID: 58696049
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PHFOvarbvgBxPapGai1UZzw75jleBmLVYhIvgKrLsJaIsI4StFCzt
 garIBmOO/aMNzfzLY0gO4ni9UkFuZbVm9FrGQNkqH9jFnsS9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY6VdC04G5fHosYEfV5YPid/Y4RJ1ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ppHOGQ3MEWojxtnGUUqOLRgxt+RvWDccj8Jp1iK+YUp7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUozTyn24/u6Dy7H0ZDThNHaYIPu+IfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHsp6sz67DFzFtW
 UTofeDFt4ji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1bKWG0P
 x6P518KjHO2AJdMRfQsC25WI553pZUM6Py/DqyEBjawSsQZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dJJcA1RcyFkXcueRg4+XrfrHzeK0VoJU5f5qY7NsaQ+90iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:YLOTgqy3ss8Ye9AVETqxKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696049"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 32/65] x86/power: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:13 +0000
Message-ID: <20211126123446.32324-33-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

cpufreq_governor_dbs() has no external callers so make it static.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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


