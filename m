Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BF4B5111
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271705.466333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3W-0007IF-J6; Mon, 14 Feb 2022 13:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271705.466333; Mon, 14 Feb 2022 13:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3W-00076e-5w; Mon, 14 Feb 2022 13:06:14 +0000
Received: by outflank-mailman (input) for mailman id 271705;
 Mon, 14 Feb 2022 13:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3C-00023t-70
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d495ce3a-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:50 +0100 (CET)
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
X-Inumbo-ID: d495ce3a-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DT/FfQl+XmikwzNvldKPzp5Fi1KnEHWZn7DpIm9D+IQ=;
  b=gmymjwTb0Wx6O3gPuzj83RfrT4ii1LAfdW4yCj++kvS/Mhub4cHBjfEe
   o1WlHM/y+2KO4GUmzhXsq45+3P5NCXQRrXJkyJOpT+2OfvMo7QPFxkDQY
   Us4MHyvcz19xUclRCvTX6UT0QJAVBGgfYgHVMmwv6+bpoTipLd8DlaH1K
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MjkvN0rIeBabDS3x7UKhMnVMszo15I42VfqX0sZayQ/G2oner+0AKcDs/QXxW2qZS4qjG49qJo
 neTYnJj6lWTHIpCrjyyYmxlhLFxDofa9lJc+NyxHpo+2YvMyCqh4QOiz9w7pkxp7maQO2RlX+m
 MKtdknqBbTagUDm8V7MsjXuWot6Q/b2oDgCcpHfG1DJhFJL0UZjpRvu5vwDt8n4bFG43VHteZD
 TJzF/drGfYXZakKBhWtRZkv6ugmLPOQ1N39j8zJDRZTzZzTB0mYXJn0M4UW3E3uCcu7VZ01U/w
 YeL/ew0PZ42LsHCTI5g2SNis
X-SBRS: 5.1
X-MesageID: 66374915
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:H+7tV6DFwxEnHRVW/zbkw5YqxClBgxIJ4kV8jS/XYbTApGwqhDQAy
 WFNCGGOM/reamTxfY9zPIS08x4C7JHUzYdgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tDWRjtxOx
 N92iY2AVSJ0Go32ic1eTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgmxv2pEXQJ4yY
 eIEeytwRwjeZCFeP3ERLc4DobbzgGXgJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+alujsPWGhkSFZ8NvN
 2lJ3goUvIFx6xn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid3VqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYxJjOsb1WVMrX/MBofAnqNOv3j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb7lBj+F7nH1irY4RLLiipymaPXOlTCb9Yd843JGmMojVNYuI/1fY9
 chxLcyPx0kNWeHyeHCPo4USMUoLPT4wApWv855bceuKIwxHHmA9CqCOneN9KtI9x6kFxP3V+
 nydW1NDzAatj3PwNgjXOGtob6niXMgjoCtjbzAsJ1uhx1MqfZ2rsPUEb5IycLR+rL5jwPd4Q
 uMrYcKFBvgTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK67JJsr
 aeh2wXXRYs4az5jVMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroI4rIvJiKSDo9v7GudyBBMHTWzS7LLwPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtouCatvwII/+8Dr9u1TwQlTFXnWa0imV+F7KX6c0MgT7qBAy9e1Y+dtt
 p5jLjWCBYi0BQ==
IronPort-HdrOrdr: A9a23:O8rhhqoHDuk5+g3dL0ydFmYaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374915"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 10/70] xen: CFI hardening for __initcall()
Date: Mon, 14 Feb 2022 12:50:27 +0000
Message-ID: <20220214125127.17985-11-andrew.cooper3@citrix.com>
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
 xen/arch/x86/acpi/cpu_idle.c                 | 4 ++--
 xen/arch/x86/acpi/cpufreq/cpufreq.c          | 2 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c          | 2 +-
 xen/arch/x86/cpu/microcode/core.c            | 2 +-
 xen/arch/x86/cpu/mtrr/main.c                 | 2 +-
 xen/arch/x86/cpu/vpmu.c                      | 2 +-
 xen/arch/x86/domain.c                        | 2 +-
 xen/arch/x86/extable.c                       | 2 +-
 xen/arch/x86/hvm/hvm.c                       | 4 ++--
 xen/arch/x86/hvm/irq.c                       | 2 +-
 xen/arch/x86/hvm/mtrr.c                      | 2 +-
 xen/arch/x86/hvm/nestedhvm.c                 | 3 +--
 xen/arch/x86/hvm/quirks.c                    | 2 +-
 xen/arch/x86/include/asm/hvm/save.h          | 2 +-
 xen/arch/x86/ioport_emulate.c                | 4 ++--
 xen/arch/x86/irq.c                           | 4 ++--
 xen/arch/x86/mm/shadow/common.c              | 4 ++--
 xen/arch/x86/msi.c                           | 2 +-
 xen/arch/x86/nmi.c                           | 2 +-
 xen/arch/x86/numa.c                          | 2 +-
 xen/arch/x86/oprofile/nmi_int.c              | 2 +-
 xen/arch/x86/percpu.c                        | 2 +-
 xen/arch/x86/psr.c                           | 2 +-
 xen/arch/x86/pv/domain.c                     | 2 +-
 xen/arch/x86/shutdown.c                      | 2 +-
 xen/arch/x86/time.c                          | 8 ++++----
 xen/common/core_parking.c                    | 2 +-
 xen/common/debugtrace.c                      | 2 +-
 xen/common/event_channel.c                   | 2 +-
 xen/common/gdbstub.c                         | 2 +-
 xen/common/grant_table.c                     | 2 +-
 xen/common/kernel.c                          | 4 ++--
 xen/common/kexec.c                           | 2 +-
 xen/common/livepatch.c                       | 2 +-
 xen/common/page_alloc.c                      | 4 ++--
 xen/common/radix-tree.c                      | 2 +-
 xen/common/random.c                          | 2 +-
 xen/common/sched/cpupool.c                   | 2 +-
 xen/common/spinlock.c                        | 2 +-
 xen/common/stop_machine.c                    | 2 +-
 xen/drivers/cpufreq/cpufreq.c                | 2 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 6 +++---
 xen/drivers/cpufreq/cpufreq_ondemand.c       | 2 +-
 xen/drivers/passthrough/amd/iommu.h          | 2 +-
 xen/drivers/passthrough/amd/iommu_init.c     | 2 +-
 xen/drivers/passthrough/pci.c                | 2 +-
 xen/drivers/passthrough/vtd/iommu.c          | 2 +-
 xen/drivers/passthrough/x86/hvm.c            | 2 +-
 48 files changed, 60 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 5d73eb5917af..7902ccce6b98 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -410,7 +410,7 @@ static void dump_cx(unsigned char key)
     }
 }
 
-static int __init cpu_idle_key_init(void)
+static int __init cf_check cpu_idle_key_init(void)
 {
     register_keyhandler('c', dump_cx, "dump ACPI Cx structures", 1);
     return 0;
@@ -1655,7 +1655,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
-static int __init cpuidle_presmp_init(void)
+static int __init cf_check cpuidle_presmp_init(void)
 {
     void *cpu = (void *)(long)smp_processor_id();
 
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 029c9398c42a..9510f05340aa 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -630,7 +630,7 @@ static const struct cpufreq_driver __initconstrel acpi_cpufreq_driver = {
     .exit   = acpi_cpufreq_cpu_exit,
 };
 
-static int __init cpufreq_driver_init(void)
+static int __init cf_check cpufreq_driver_init(void)
 {
     int ret = 0;
 
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index ec52d37c96e1..2679c220a8a2 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -86,7 +86,7 @@ static void mce_work_fn(void *data)
 	adjust = 0;
 }
 
-static int __init init_nonfatal_mce_checker(void)
+static int __init cf_check init_nonfatal_mce_checker(void)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 95d35ca0f3f7..46f55fe7f191 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -696,7 +696,7 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
                                      microcode_update_helper, buffer);
 }
 
-static int __init microcode_init(void)
+static int __init cf_check microcode_init(void)
 {
     /*
      * At this point, all CPUs should have updated their microcode
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index e9df53f00d61..428133100d46 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -632,7 +632,7 @@ void mtrr_bp_restore(void)
 	mtrr_if->set_all();
 }
 
-static int __init mtrr_init_finialize(void)
+static int __init cf_check mtrr_init_finialize(void)
 {
 	if (!mtrr_if)
 		return 0;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b10d6e2eb458..9fc897dc8403 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -844,7 +844,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
-static int __init vpmu_init(void)
+static int __init cf_check vpmu_init(void)
 {
     int vendor = current_cpu_data.x86_vendor;
     const struct arch_vpmu_ops *ops = NULL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc1402..f943283b2a88 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2532,7 +2532,7 @@ static void vcpu_kick_softirq(void)
      */
 }
 
-static int __init init_vcpu_kick_softirq(void)
+static int __init cf_check init_vcpu_kick_softirq(void)
 {
     open_softirq(VCPU_KICK_SOFTIRQ, vcpu_kick_softirq);
     return 0;
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 78d672722580..51ef863d786c 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -126,7 +126,7 @@ search_exception_table(const struct cpu_user_regs *regs)
 #ifndef NDEBUG
 #include <asm/traps.h>
 
-static int __init stub_selftest(void)
+static int __init cf_check stub_selftest(void)
 {
     static const struct {
         uint8_t opc[4];
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4e685c1b0c1b..2ae1685d0aff 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -164,7 +164,7 @@ static bool __init hap_supported(struct hvm_function_table *fns)
     return true;
 }
 
-static int __init hvm_enable(void)
+static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns = NULL;
 
@@ -1506,7 +1506,7 @@ static int hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
 /* We need variable length data chunks for XSAVE area and MSRs, hence
  * a custom declaration rather than HVM_REGISTER_SAVE_RESTORE.
  */
-static int __init hvm_register_CPU_save_and_restore(void)
+static int __init cf_check hvm_register_CPU_save_and_restore(void)
 {
     hvm_register_savevm(CPU_XSAVE_CODE,
                         "CPU_XSAVE",
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 52aae4565f0c..6045c9149bad 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -650,7 +650,7 @@ static void dump_irq_info(unsigned char key)
     rcu_read_unlock(&domlist_read_lock);
 }
 
-static int __init dump_irq_info_key_init(void)
+static int __init cf_check dump_irq_info_key_init(void)
 {
     register_keyhandler('I', dump_irq_info, "dump HVM irq info", 1);
     return 0;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 4a9f3177edd4..b3ef1bf54133 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -75,7 +75,7 @@ static uint8_t __read_mostly mtrr_epat_tbl[MTRR_NUM_TYPES][MEMORY_NUM_TYPES] =
 static uint8_t __read_mostly pat_entry_tbl[PAT_TYPE_NUMS] =
     { [0 ... PAT_TYPE_NUMS-1] = INVALID_MEM_TYPE };
 
-static int __init hvm_mtrr_pat_init(void)
+static int __init cf_check hvm_mtrr_pat_init(void)
 {
     unsigned int i, j;
 
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 5021da667a47..23516884482b 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -125,8 +125,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
  * iomap[2]      set        set
  */
 
-static int __init
-nestedhvm_setup(void)
+static int __init cf_check nestedhvm_setup(void)
 {
     /* Same format and size as hvm_io_bitmap (Intel needs only 2 pages). */
     unsigned nr = cpu_has_vmx ? 2 : 3;
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 54cc66c382b6..917356b1312c 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -36,7 +36,7 @@ static int __init dmi_hvm_deny_port80(const struct dmi_system_id *id)
     return 0;
 }
 
-static int __init check_port80(void)
+static int __init cf_check check_port80(void)
 {
     /*
      * Quirk table for systems that misbehave (lock up, etc.) if port
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index 4efc53505500..e975011ddb71 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -115,7 +115,7 @@ void hvm_register_savevm(uint16_t typecode,
 /* Syntactic sugar around that function: specify the max number of
  * saves, and this calculates the size of buffer needed */
 #define HVM_REGISTER_SAVE_RESTORE(_x, _save, _load, _num, _k)             \
-static int __init __hvm_register_##_x##_save_and_restore(void)            \
+static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
 {                                                                         \
     hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
                         #_x,                                              \
diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
index cf1f3f922959..6caeb3d470ce 100644
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -11,7 +11,7 @@
 unsigned int (*__read_mostly ioemul_handle_quirk)(
     uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
 
-static unsigned int ioemul_handle_proliant_quirk(
+static unsigned int cf_check ioemul_handle_proliant_quirk(
     u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
 {
     static const char stub[] = {
@@ -100,7 +100,7 @@ static const struct dmi_system_id __initconstrel ioport_quirks_tbl[] = {
     { }
 };
 
-static int __init ioport_quirks_init(void)
+static int __init cf_check ioport_quirks_init(void)
 {
     if ( dmi_check_system(ioport_quirks_tbl) )
         ioemul_handle_quirk = ioemul_handle_proliant_quirk;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 84b174d0f51f..bcf46cd54d16 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -954,7 +954,7 @@ static void irq_ratelimit_timer_fn(void *data)
     spin_unlock_irqrestore(&irq_ratelimit_lock, flags);
 }
 
-static int __init irq_ratelimit_init(void)
+static int __init cf_check irq_ratelimit_init(void)
 {
     if ( irq_ratelimit_threshold )
         init_timer(&irq_ratelimit_timer, irq_ratelimit_timer_fn, NULL, 0);
@@ -2504,7 +2504,7 @@ static void dump_irqs(unsigned char key)
     dump_ioapic_irq_info();
 }
 
-static int __init setup_dump_irqs(void)
+static int __init cf_check setup_dump_irqs(void)
 {
     /* In lieu of being able to live in init_irq_data(). */
     BUILD_BUG_ON(sizeof(irq_max_guests) >
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 6221630fc2dc..b8730a9441ce 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -105,7 +105,7 @@ static void shadow_audit_key(unsigned char key)
            __func__, shadow_audit_enable);
 }
 
-static int __init shadow_audit_key_init(void)
+static int __init cf_check shadow_audit_key_init(void)
 {
     register_keyhandler('O', shadow_audit_key, "toggle shadow audits", 0);
     return 0;
@@ -1057,7 +1057,7 @@ static void shadow_blow_all_tables(unsigned char c)
 }
 
 /* Register this function in the Xen console keypress table */
-static __init int shadow_blow_tables_keyhandler_init(void)
+static int __init cf_check shadow_blow_tables_keyhandler_init(void)
 {
     register_keyhandler('S', shadow_blow_all_tables, "reset shadow pagetables", 1);
     return 0;
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b7c..d1497254b188 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1485,7 +1485,7 @@ static void dump_msi(unsigned char key)
     vpci_dump_msi();
 }
 
-static int __init msi_setup_keyhandler(void)
+static int __init cf_check msi_setup_keyhandler(void)
 {
     register_keyhandler('M', dump_msi, "dump MSI state", 1);
     return 0;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 1a225d499295..21e947a46f24 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -606,7 +606,7 @@ static void do_nmi_stats(unsigned char key)
         printk("%pv: NMI neither pending nor masked\n", v);
 }
 
-static __init int register_nmi_trigger(void)
+static int __init cf_check register_nmi_trigger(void)
 {
     register_keyhandler('N', do_nmi_trigger, "trigger an NMI", 0);
     register_keyhandler('n', do_nmi_stats, "NMI statistics", 1);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 6be5a0c93322..5de9db4e9943 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -504,7 +504,7 @@ static void dump_numa(unsigned char key)
     rcu_read_unlock(&domlist_read_lock);
 }
 
-static __init int register_numa_trigger(void)
+static int __init cf_check register_numa_trigger(void)
 {
     register_keyhandler('u', dump_numa, "dump NUMA info", 1);
     return 0;
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 7842d95b95ea..ba9c4b9804ca 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -388,7 +388,7 @@ static int __init arch_perfmon_init(char **cpu_type)
 	return 1;
 }
 
-static int __init nmi_init(void)
+static int __init cf_check nmi_init(void)
 {
 	__u8 vendor = current_cpu_data.x86_vendor;
 	__u8 family = current_cpu_data.x86;
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 5ea14b6ec312..0e0b6577ca45 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -94,7 +94,7 @@ static struct notifier_block cpu_percpu_nfb = {
     .priority = 100 /* highest priority */
 };
 
-static int __init percpu_presmp_init(void)
+static int __init cf_check percpu_presmp_init(void)
 {
     register_cpu_notifier(&cpu_percpu_nfb);
 
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 56916344cb1d..9a3670afc341 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1675,7 +1675,7 @@ static struct notifier_block cpu_nfb = {
     .priority = -1
 };
 
-static int __init psr_presmp_init(void)
+static int __init cf_check psr_presmp_init(void)
 {
     if ( (opt_psr & PSR_CMT) && opt_rmid_max )
         init_psr_cmt(opt_rmid_max);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 125c4561a7ea..55146c15c853 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -167,7 +167,7 @@ unsigned long pv_fixup_guest_cr4(const struct vcpu *v, unsigned long cr4)
 static int8_t __read_mostly opt_global_pages = -1;
 boolean_runtime_param("global-pages", opt_global_pages);
 
-static int __init pge_init(void)
+static int __init cf_check pge_init(void)
 {
     if ( opt_global_pages == -1 )
         opt_global_pages = !cpu_has_hypervisor ||
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index a01354d93319..ad3e3a76916f 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -533,7 +533,7 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
     { }
 };
 
-static int __init reboot_init(void)
+static int __init cf_check reboot_init(void)
 {
     /*
      * Only do the DMI check if reboot_type hasn't been overridden
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 2da9c7f5c8dd..14f7d3fd635e 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -537,7 +537,7 @@ static struct platform_timesource __initdata plt_pmtimer =
 
 static struct time_scale __read_mostly pmt_scale;
 
-static __init int init_pmtmr_scale(void)
+static __init int cf_check init_pmtmr_scale(void)
 {
     set_time_scale(&pmt_scale, ACPI_PM_FREQUENCY);
     return 0;
@@ -2052,7 +2052,7 @@ static void __init try_platform_timer_tail(void)
 }
 
 /* Late init function, after all cpus have booted */
-static int __init verify_tsc_reliability(void)
+static int __init cf_check verify_tsc_reliability(void)
 {
     if ( boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
     {
@@ -2223,7 +2223,7 @@ static int _disable_pit_irq(void(*hpet_broadcast_setup)(void))
     return ret;
 }
 
-static int __init disable_pit_irq(void)
+static int __init cf_check disable_pit_irq(void)
 {
     if ( !_disable_pit_irq(hpet_broadcast_init) )
     {
@@ -2586,7 +2586,7 @@ static void dump_softtsc(unsigned char key)
             printk("No domains have emulated TSC\n");
 }
 
-static int __init setup_dump_softtsc(void)
+static int __init cf_check setup_dump_softtsc(void)
 {
     register_keyhandler('s', dump_softtsc, "dump softtsc stats", 1);
     return 0;
diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index aa432ed2f57b..44a907abfd7f 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -258,7 +258,7 @@ static int __init register_core_parking_policy(const struct cp_policy *policy)
     return 0;
 }
 
-static int __init core_parking_init(void)
+static int __init cf_check core_parking_init(void)
 {
     int ret = 0;
 
diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index 29b11239f5a5..f3c0fd8aa17b 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -279,7 +279,7 @@ static struct notifier_block debugtrace_nfb = {
     .notifier_call = debugtrace_cpu_callback
 };
 
-static int __init debugtrace_init(void)
+static int __init cf_check debugtrace_init(void)
 {
     unsigned int cpu;
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a5ee8b8ebf76..2026bc30dc95 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1642,7 +1642,7 @@ static void dump_evtchn_info(unsigned char key)
     rcu_read_unlock(&domlist_read_lock);
 }
 
-static int __init dump_evtchn_info_key_init(void)
+static int __init cf_check dump_evtchn_info_key_init(void)
 {
     register_keyhandler('e', dump_evtchn_info, "dump evtchn info", 1);
     return 0;
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 848c1f4327e8..99bfd9a654c9 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -640,7 +640,7 @@ __trap_to_gdb(struct cpu_user_regs *regs, unsigned long cookie)
     return rc;
 }
 
-static int __init initialise_gdb(void)
+static int __init cf_check initialise_gdb(void)
 {
     if ( *opt_gdb == '\0' )
         return 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b663845d9c6c..1078e3e16cda 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4291,7 +4291,7 @@ static void gnttab_usage_print_all(unsigned char key)
     printk("%s ] done\n", __func__);
 }
 
-static int __init gnttab_usage_init(void)
+static int __init cf_check gnttab_usage_init(void)
 {
     register_keyhandler('g', gnttab_usage_print_all,
                         "print grant table usage", 1);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 752c2e0dae44..adff2d2c77f3 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -393,7 +393,7 @@ static HYPFS_STRING_INIT(extra, "extra");
 static HYPFS_STRING_INIT(config, "config");
 #endif
 
-static int __init buildinfo_init(void)
+static int __init cf_check buildinfo_init(void)
 {
     hypfs_add_dir(&hypfs_root, &buildinfo, true);
 
@@ -431,7 +431,7 @@ __initcall(buildinfo_init);
 
 static HYPFS_DIR_INIT(params, "params");
 
-static int __init param_init(void)
+static int __init cf_check param_init(void)
 {
     struct param_hypfs *param;
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 6286c0bbf08b..36384f782db3 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -570,7 +570,7 @@ void __init kexec_early_calculations(void)
         crashinfo_maxaddr_bits = fls64(crashinfo_maxaddr) - 1;
 }
 
-static int __init kexec_init(void)
+static int __init cf_check kexec_init(void)
 {
     void *cpu = (void *)(unsigned long)smp_processor_id();
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7118551b27e2..33708b4e2388 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2139,7 +2139,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
-static int __init livepatch_init(void)
+static int __init cf_check livepatch_init(void)
 {
     unsigned int cpu;
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ad06655158d2..561e238d2d6a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2549,7 +2549,7 @@ static void pagealloc_info(unsigned char key)
     printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
 }
 
-static __init int pagealloc_keyhandler_init(void)
+static __init int cf_check pagealloc_keyhandler_init(void)
 {
     register_keyhandler('m', pagealloc_info, "memory info", 1);
     return 0;
@@ -2597,7 +2597,7 @@ static void dump_heap(unsigned char key)
     }
 }
 
-static __init int register_heap_trigger(void)
+static __init int cf_check register_heap_trigger(void)
 {
     register_keyhandler('H', dump_heap, "dump heap info", 1);
     return 0;
diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
index 2384655a2e90..628a7e06988f 100644
--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -744,7 +744,7 @@ static __init unsigned long __maxindex(unsigned int height)
 	return ~0UL >> shift;
 }
 
-static __init int radix_tree_init_maxindex(void)
+static int __init cf_check radix_tree_init_maxindex(void)
 {
 	unsigned int i;
 
diff --git a/xen/common/random.c b/xen/common/random.c
index fb805b0ecd95..a29f2fcb991a 100644
--- a/xen/common/random.c
+++ b/xen/common/random.c
@@ -31,7 +31,7 @@ unsigned int get_random(void)
     return val;
 }
 
-static int __init init_boot_random(void)
+static int __init cf_check init_boot_random(void)
 {
     boot_random = get_random();
     return 0;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f0dd626054a6..f26c7f289539 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1218,7 +1218,7 @@ static void cpupool_hypfs_init(void)
 
 #endif /* CONFIG_HYPFS */
 
-static int __init cpupool_init(void)
+static int __init cf_check cpupool_init(void)
 {
     unsigned int cpu;
 
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index b90981bb271e..5ce7e3363863 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -508,7 +508,7 @@ void _lock_profile_deregister_struct(
     spin_unlock(&lock_profile_lock);
 }
 
-static int __init lock_prof_init(void)
+static int __init cf_check lock_prof_init(void)
 {
     struct lock_profile **q;
 
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 2d5f6aef61ed..8979d553d677 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -198,7 +198,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
-static int __init cpu_stopmachine_init(void)
+static int __init cf_check cpu_stopmachine_init(void)
 {
     unsigned int cpu;
     for_each_online_cpu ( cpu )
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 36b079296235..e55e202d5a18 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -657,7 +657,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
-static int __init cpufreq_presmp_init(void)
+static int __init cf_check cpufreq_presmp_init(void)
 {
     register_cpu_notifier(&cpu_nfb);
     return 0;
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 746bbcd5ff36..8343f491da87 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -116,7 +116,7 @@ struct cpufreq_governor cpufreq_gov_userspace = {
     .handle_option = cpufreq_userspace_handle_option
 };
 
-static int __init cpufreq_gov_userspace_init(void)
+static int __init cf_check cpufreq_gov_userspace_init(void)
 {
     unsigned int cpu;
 
@@ -160,7 +160,7 @@ struct cpufreq_governor cpufreq_gov_performance = {
     .governor = cpufreq_governor_performance,
 };
 
-static int __init cpufreq_gov_performance_init(void)
+static int __init cf_check cpufreq_gov_performance_init(void)
 {
     return cpufreq_register_governor(&cpufreq_gov_performance);
 }
@@ -199,7 +199,7 @@ struct cpufreq_governor cpufreq_gov_powersave = {
     .governor = cpufreq_governor_powersave,
 };
 
-static int __init cpufreq_gov_powersave_init(void)
+static int __init cf_check cpufreq_gov_powersave_init(void)
 {
     return cpufreq_register_governor(&cpufreq_gov_powersave);
 }
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 6b905d7cfca8..cabd9ffa8886 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -356,7 +356,7 @@ struct cpufreq_governor cpufreq_gov_dbs = {
     .handle_option = cpufreq_dbs_handle_option
 };
 
-static int __init cpufreq_gov_dbs_init(void)
+static int __init cf_check cpufreq_gov_dbs_init(void)
 {
     return cpufreq_register_governor(&cpufreq_gov_dbs);
 }
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 93243424e85d..04517c1a024c 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -234,7 +234,7 @@ int amd_iommu_prepare(bool xt);
 int amd_iommu_init(bool xt);
 int amd_iommu_init_late(void);
 int amd_iommu_update_ivrs_mapping_acpi(void);
-int iov_adjust_irq_affinities(void);
+int cf_check iov_adjust_irq_affinities(void);
 
 int amd_iommu_quarantine_init(struct domain *d);
 
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 559a734bdaa5..f1ed75558227 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -808,7 +808,7 @@ static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
     return 1;
 }
 
-int iov_adjust_irq_affinities(void)
+int cf_check iov_adjust_irq_affinities(void)
 {
     const struct amd_iommu *iommu;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 20cb246598b1..ed459f6409a8 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1358,7 +1358,7 @@ static void dump_pci_devices(unsigned char ch)
     pcidevs_unlock();
 }
 
-static int __init setup_dump_pcidevs(void)
+static int __init cf_check setup_dump_pcidevs(void)
 {
     register_keyhandler('Q', dump_pci_devices, "dump PCI devices", 1);
     return 0;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 34ea5f485de7..9e85016830bf 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2154,7 +2154,7 @@ static void adjust_irq_affinity(struct acpi_drhd_unit *drhd)
     spin_unlock_irqrestore(&desc->lock, flags);
 }
 
-static int adjust_vtd_irq_affinities(void)
+static int cf_check adjust_vtd_irq_affinities(void)
 {
     struct acpi_drhd_unit *drhd;
 
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 0b37cd145b60..e5a2c5830348 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1076,7 +1076,7 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback,
 };
 
-static int __init setup_dpci_softirq(void)
+static int __init cf_check setup_dpci_softirq(void)
 {
     unsigned int cpu;
 
-- 
2.11.0


