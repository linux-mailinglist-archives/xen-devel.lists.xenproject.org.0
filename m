Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC34BFC87
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276862.473254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4c-0008AZ-0X; Tue, 22 Feb 2022 15:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276862.473254; Tue, 22 Feb 2022 15:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4b-00081v-DO; Tue, 22 Feb 2022 15:27:29 +0000
Received: by outflank-mailman (input) for mailman id 276862;
 Tue, 22 Feb 2022 15:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4X-0006OK-Eo
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4fdfc9-93f3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:27:22 +0100 (CET)
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
X-Inumbo-ID: ee4fdfc9-93f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=e1ULosOfawLcYEINxUPh+g454GPdzkLF1+BQThMlbkY=;
  b=OmmE7qpCDKImuwHJiwzzw68rTuicobvwDU9OfE/rvFbFWtkCQ+Zt34CU
   W84H6arU+XQJKMdnJ/PaYoopKcTwKrkWdaWJHDt5vm6UH8IoUeIvkJZPg
   4QYgjMQ4oWCIT0Q0triG/pAQPRiLXjaWKhaFfgKrskAG6oEgOzmX+4D/p
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66981792
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XIYB2av5haYTNnH91vsJJwe9AOfnVDJeMUV32f8akzHdYApBsoF/q
 tZmKTrQPfyPYDb9eoxxOo6xo0lXuJfUztBjHlBkqC09FCwa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nX4
 4uoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8SB/bppvowdCJgDnB+DapA95XFDHGw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQxPUSZPEwVUrsRIM0+hNiKiCn8TxtRs32r+ptnsnWC7RMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQvw3ELk7Yf03eTU4j9bxq+r1SGkxcTDo84//IB1CmBza/d4gC8D2cCTyJcZNFOiPLaVQDGx
 XfSwYq3WGUHXKm9DCvEq+zK9W/a1T09cDdaDRLoWzfp9DUKTGsbqhvUBuhuH6eu5jEeMWGhm
 mvaxMTSalh6sCLq60lZ1Q2f695PjsKQJuLQ2ukxdjj+hu+eTNT4D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3u6vZbmyB3AQzRsFJG9GRF5iLJ9s4DNZWfhoBDyr5UWWxP
 B+7Vf15vve/w0dGnYcoOtnsWqzGPIDrFMj/V+C8Uza9SsMZSeNzxwk3PRT49zm0yCAEyPhjU
 b/GIZfEJStLUsxPkWvpL9rxJJd2n0jSM0uIHsulp/lmuJLDDEOopUAtagXWNblhtPveyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7djjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:WZ0UMqlz/L4Xwfpl3n0KXtc/+bvpDfIo3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE8Ar5N0tQ+uxoVJPufZqYz+8Q3WBzB8baYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IObuEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66981792"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 08/70] xen: CFI hardening for custom_param()
Date: Tue, 22 Feb 2022 15:26:35 +0000
Message-ID: <20220222152645.8844-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

The "watchdog_timeout" and "cpu_type" handlers were missing __init.

The "numa", "acpi", "irq_vector_map" and "flask" handlers can skip forward
declarations by altering the custom_param() position.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
 * Rebase over recent "vesa" changes.
---
 xen/arch/x86/acpi/cpu_idle.c             |  2 +-
 xen/arch/x86/acpi/power.c                |  2 +-
 xen/arch/x86/apic.c                      |  4 ++--
 xen/arch/x86/cpu/mcheck/mce.c            |  2 +-
 xen/arch/x86/cpu/microcode/core.c        |  2 +-
 xen/arch/x86/cpu/vpmu.c                  |  2 +-
 xen/arch/x86/cpuid.c                     |  8 ++++----
 xen/arch/x86/dom0_build.c                |  8 ++++----
 xen/arch/x86/genapic/probe.c             |  2 +-
 xen/arch/x86/hpet.c                      |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c     |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c              |  8 ++++----
 xen/arch/x86/io_apic.c                   |  2 +-
 xen/arch/x86/irq.c                       |  6 ++----
 xen/arch/x86/mm.c                        |  2 +-
 xen/arch/x86/nmi.c                       |  4 ++--
 xen/arch/x86/numa.c                      |  6 ++----
 xen/arch/x86/oprofile/nmi_int.c          |  2 +-
 xen/arch/x86/psr.c                       |  2 +-
 xen/arch/x86/pv/domain.c                 |  8 ++++----
 xen/arch/x86/pv/shim.c                   |  2 +-
 xen/arch/x86/setup.c                     | 11 +++++------
 xen/arch/x86/shutdown.c                  |  2 +-
 xen/arch/x86/spec_ctrl.c                 |  6 +++---
 xen/arch/x86/time.c                      |  2 +-
 xen/arch/x86/tsx.c                       |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c    |  2 +-
 xen/common/argo.c                        |  2 +-
 xen/common/core_parking.c                |  2 +-
 xen/common/debugtrace.c                  |  2 +-
 xen/common/domain.c                      |  2 +-
 xen/common/efi/boot.c                    |  2 +-
 xen/common/grant_table.c                 | 14 +++++++-------
 xen/common/kexec.c                       |  6 +++---
 xen/common/memory.c                      |  2 +-
 xen/common/page_alloc.c                  |  2 +-
 xen/common/sched/cpupool.c               |  2 +-
 xen/common/sched/credit2.c               |  2 +-
 xen/drivers/acpi/tables.c                |  2 +-
 xen/drivers/char/console.c               | 18 +++++++++---------
 xen/drivers/cpufreq/cpufreq.c            |  2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c |  6 +++---
 xen/drivers/passthrough/iommu.c          |  4 ++--
 xen/drivers/passthrough/pci.c            |  4 ++--
 xen/drivers/passthrough/vtd/dmar.c       |  2 +-
 xen/drivers/passthrough/vtd/quirks.c     |  2 +-
 xen/drivers/video/vesa.c                 |  2 +-
 xen/xsm/flask/flask_op.c                 |  5 ++---
 xen/xsm/xsm_core.c                       |  2 +-
 49 files changed, 92 insertions(+), 98 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index d788c8bffc84..5d73eb5917af 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -106,7 +106,7 @@ void (*__read_mostly pm_idle_save)(void);
 unsigned int max_cstate __read_mostly = UINT_MAX;
 unsigned int max_csubstate __read_mostly = UINT_MAX;
 
-static int __init parse_cstate(const char *s)
+static int __init cf_check parse_cstate(const char *s)
 {
     max_cstate = simple_strtoul(s, &s, 0);
     if ( *s == ',' )
diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 5eaa77f66a28..912d4c4d62f4 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -35,7 +35,7 @@
 
 uint32_t system_reset_counter = 1;
 
-static int __init parse_acpi_sleep(const char *s)
+static int __init cf_check parse_acpi_sleep(const char *s)
 {
     const char *ss;
     unsigned int flag = 0;
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 583656158532..68e4d870c749 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -775,7 +775,7 @@ int lapic_resume(void)
  * Original code written by Keir Fraser.
  */
 
-static int __init lapic_disable(const char *str)
+static int __init cf_check lapic_disable(const char *str)
 {
     enable_local_apic = -1;
     setup_clear_cpu_cap(X86_FEATURE_APIC);
@@ -784,7 +784,7 @@ static int __init lapic_disable(const char *str)
 custom_param("nolapic", lapic_disable);
 boolean_param("lapic", enable_local_apic);
 
-static int __init apic_set_verbosity(const char *str)
+static int __init cf_check apic_set_verbosity(const char *str)
 {
     if (strcmp("debug", str) == 0)
         apic_verbosity = APIC_DEBUG;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index eae08caa07cd..ea86d84481b2 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -63,7 +63,7 @@ struct mca_banks *mca_allbanks;
 #endif
 
 int mce_verbosity;
-static int __init mce_set_verbosity(const char *str)
+static int __init cf_check mce_set_verbosity(const char *str)
 {
     if ( strcmp("verbose", str) == 0 )
         mce_verbosity = MCE_VERBOSE;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ac3ceb567c41..95d35ca0f3f7 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -111,7 +111,7 @@ void __init microcode_set_module(unsigned int idx)
  * optional. If the EFI has forced which of the multiboot payloads is to be
  * used, only nmi=<bool> is parsed.
  */
-static int __init parse_ucode(const char *s)
+static int __init cf_check parse_ucode(const char *s)
 {
     const char *ss;
     int val, rc = 0;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 598291f4ece9..b10d6e2eb458 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -56,7 +56,7 @@ static unsigned vpmu_count;
 
 static DEFINE_PER_CPU(struct vcpu *, last_vcpu);
 
-static int __init parse_vpmu_params(const char *s)
+static int __init cf_check parse_vpmu_params(const char *s)
 {
     const char *ss;
     int rc = 0, val;
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7c638eff2bf4..bb554b06a73f 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -101,7 +101,7 @@ static int __init always_inline parse_cpuid(
     return rc;
 }
 
-static void __init _parse_xen_cpuid(unsigned int feat, bool val)
+static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
 {
     if ( !val )
         setup_clear_cpu_cap(feat);
@@ -110,7 +110,7 @@ static void __init _parse_xen_cpuid(unsigned int feat, bool val)
         setup_force_cpu_cap(X86_FEATURE_RDRAND);
 }
 
-static int __init parse_xen_cpuid(const char *s)
+static int __init cf_check parse_xen_cpuid(const char *s)
 {
     return parse_cpuid(s, _parse_xen_cpuid);
 }
@@ -120,13 +120,13 @@ static bool __initdata dom0_cpuid_cmdline;
 static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
 static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
 
-static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
+static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
 {
     __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
     __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
 }
 
-static int __init parse_dom0_cpuid(const char *s)
+static int __init cf_check parse_dom0_cpuid(const char *s)
 {
     dom0_cpuid_cmdline = true;
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index a7fec05956c1..4d1c5c60e407 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -115,7 +115,7 @@ static int __init parse_amt(const char *s, const char **ps, struct memsize *sz)
     return 0;
 }
 
-static int __init parse_dom0_mem(const char *s)
+static int __init cf_check parse_dom0_mem(const char *s)
 {
     int ret;
 
@@ -144,7 +144,7 @@ custom_param("dom0_mem", parse_dom0_mem);
 static unsigned int __initdata opt_dom0_max_vcpus_min = 1;
 static unsigned int __initdata opt_dom0_max_vcpus_max = UINT_MAX;
 
-static int __init parse_dom0_max_vcpus(const char *s)
+static int __init cf_check parse_dom0_max_vcpus(const char *s)
 {
     if ( *s == '-' )                   /* -M */
         opt_dom0_max_vcpus_max = simple_strtoul(s + 1, &s, 0);
@@ -168,7 +168,7 @@ static __initdata unsigned int dom0_pxms[MAX_NUMNODES] =
     { [0 ... MAX_NUMNODES - 1] = ~0 };
 bool __initdata dom0_affinity_relaxed;
 
-static int __init parse_dom0_nodes(const char *s)
+static int __init cf_check parse_dom0_nodes(const char *s)
 {
     const char *ss;
     int rc = 0;
@@ -266,7 +266,7 @@ bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
 bool __initdata opt_dom0_verbose = IS_ENABLED(CONFIG_VERBOSE_DEBUG);
 bool __initdata opt_dom0_msr_relaxed;
 
-static int __init parse_dom0_param(const char *s)
+static int __init cf_check parse_dom0_param(const char *s)
 {
     const char *ss;
     int rc = 0;
diff --git a/xen/arch/x86/genapic/probe.c b/xen/arch/x86/genapic/probe.c
index 66bc5ce072dc..ad57912f506b 100644
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -43,7 +43,7 @@ void __init generic_bigsmp_probe(void)
 		}
 }
 
-static int __init genapic_apic_force(const char *str)
+static int __init cf_check genapic_apic_force(const char *str)
 {
 	int i, rc = -EINVAL;
 
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 2fe8b005a513..7a810e4e7171 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -65,7 +65,7 @@ u8 __initdata hpet_flags;
 static bool __initdata force_hpet_broadcast;
 boolean_param("hpetbroadcast", force_hpet_broadcast);
 
-static int __init parse_hpet_param(const char *s)
+static int __init cf_check parse_hpet_param(const char *s)
 {
     const char *ss;
     int val, rc = 0;
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 8986b8e03c2e..7ebcaa1c899f 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1186,7 +1186,7 @@ static int viridian_load_vcpu_ctxt(struct domain *d,
 HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 
-static int __init parse_viridian_version(const char *arg)
+static int __init cf_check parse_viridian_version(const char *arg)
 {
     const char *t;
     unsigned int n[3];
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 7ab15e07a0b2..f72a7db0453d 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -71,7 +71,7 @@ static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
 
-static int __init parse_ept_param(const char *s)
+static int __init cf_check parse_ept_param(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -107,16 +107,16 @@ static void update_ept_param(void)
                  opt_ept_exec_sp);
 }
 
-static void __init init_ept_param(struct param_hypfs *par)
+static void __init cf_check init_ept_param(struct param_hypfs *par)
 {
     update_ept_param();
     custom_runtime_set_var(par, opt_ept_setting);
 }
 
-static int parse_ept_param_runtime(const char *s);
+static int cf_check parse_ept_param_runtime(const char *s);
 custom_runtime_only_param("ept", parse_ept_param_runtime, init_ept_param);
 
-static int parse_ept_param_runtime(const char *s)
+static int cf_check parse_ept_param_runtime(const char *s)
 {
     struct domain *d;
     int val;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 1c49a0fe1478..4135a9c06052 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1601,7 +1601,7 @@ static unsigned int startup_level_ioapic_irq(struct irq_desc *desc)
     return 0; /* don't check for pending */
 }
 
-static int __init setup_ioapic_ack(const char *s)
+static int __init cf_check setup_ioapic_ack(const char *s)
 {
     if ( !strcmp(s, "old") )
     {
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 67cbf6b979dc..84b174d0f51f 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -28,8 +28,6 @@
 #include <irq_vectors.h>
 #include <public/physdev.h>
 
-static int parse_irq_vector_map_param(const char *s);
-
 /* opt_noirqbalance: If true, software IRQ balancing/affinity is disabled. */
 bool __read_mostly opt_noirqbalance;
 boolean_param("noirqbalance", opt_noirqbalance);
@@ -40,7 +38,6 @@ integer_param("nr_irqs", nr_irqs);
 
 /* This default may be changed by the AMD IOMMU code */
 int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
-custom_param("irq_vector_map", parse_irq_vector_map_param);
 
 /* Max number of guests IRQ could be shared with */
 static unsigned char __read_mostly irq_max_guests;
@@ -66,7 +63,7 @@ static struct timer irq_ratelimit_timer;
 static unsigned int __read_mostly irq_ratelimit_threshold = 10000;
 integer_param("irq_ratelimit", irq_ratelimit_threshold);
 
-static int __init parse_irq_vector_map_param(const char *s)
+static int __init cf_check parse_irq_vector_map_param(const char *s)
 {
     const char *ss;
     int rc = 0;
@@ -90,6 +87,7 @@ static int __init parse_irq_vector_map_param(const char *s)
 
     return rc;
 }
+custom_param("irq_vector_map", parse_irq_vector_map_param);
 
 /* Must be called when irq disabled */
 void lock_vector_lock(void)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index cdbd04e19752..a1b8737096c4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -189,7 +189,7 @@ static uint32_t base_disallow_mask;
 
 static s8 __read_mostly opt_mmio_relax;
 
-static int __init parse_mmio_relax(const char *s)
+static int __init cf_check parse_mmio_relax(const char *s)
 {
     if ( !*s )
         opt_mmio_relax = 1;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index c515de63365a..515a3633e5aa 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -48,7 +48,7 @@ bool __initdata opt_watchdog;
 /* watchdog_force: If true, process unknown NMIs when running the watchdog. */
 bool watchdog_force;
 
-static int __init parse_watchdog(const char *s)
+static int __init cf_check parse_watchdog(const char *s)
 {
     if ( !*s )
     {
@@ -78,7 +78,7 @@ custom_param("watchdog", parse_watchdog);
 /* opt_watchdog_timeout: Number of seconds to wait before panic. */
 static unsigned int opt_watchdog_timeout = 5;
 
-static int parse_watchdog_timeout(const char *s)
+static int __init cf_check parse_watchdog_timeout(const char *s)
 {
     const char *q;
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index ce79ee44cefe..6be5a0c93322 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -19,9 +19,6 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
-static int numa_setup(const char *s);
-custom_param("numa", numa_setup);
-
 #ifndef Dprintk
 #define Dprintk(x...)
 #endif
@@ -294,7 +291,7 @@ void numa_set_node(int cpu, nodeid_t node)
 }
 
 /* [numa=off] */
-static __init int numa_setup(const char *opt)
+static int __init cf_check numa_setup(const char *opt)
 {
     if ( !strncmp(opt,"off",3) )
         numa_off = true;
@@ -321,6 +318,7 @@ static __init int numa_setup(const char *opt)
 
     return 0;
 } 
+custom_param("numa", numa_setup);
 
 /*
  * Setup early cpu_to_node.
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index a13bd82915ac..7842d95b95ea 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -340,7 +340,7 @@ static int __init p4_init(char ** cpu_type)
 
 static int force_arch_perfmon;
 
-static int force_cpu_type(const char *str)
+static int __init cf_check force_cpu_type(const char *str)
 {
 	if (!strcmp(str, "arch_perfmon")) {
 		force_arch_perfmon = 1;
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index d805b85dc60b..56916344cb1d 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -573,7 +573,7 @@ static bool __init parse_psr_bool(const char *s, const char *delim,
     return false;
 }
 
-static int __init parse_psr_param(const char *s)
+static int __init cf_check parse_psr_param(const char *s)
 {
     const char *ss, *val_delim;
     const char *q;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 6ad533183bcd..125c4561a7ea 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -20,7 +20,7 @@
 int8_t __read_mostly opt_pv32 = -1;
 #endif
 
-static __init int parse_pv(const char *s)
+static int __init cf_check parse_pv(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -63,16 +63,16 @@ static const char opt_pcid_2_string[][7] = {
     [PCID_NOXPTI] = "noxpti",
 };
 
-static void __init opt_pcid_init(struct param_hypfs *par)
+static void __init cf_check opt_pcid_init(struct param_hypfs *par)
 {
     custom_runtime_set_var(par, opt_pcid_2_string[opt_pcid]);
 }
 #endif
 
-static int parse_pcid(const char *s);
+static int cf_check parse_pcid(const char *s);
 custom_runtime_param("pcid", parse_pcid, opt_pcid_init);
 
-static int parse_pcid(const char *s)
+static int cf_check parse_pcid(const char *s)
 {
     int rc = 0;
 
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 4c710ad8913f..ae4d8913faa1 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -73,7 +73,7 @@ static uint64_t __initdata shim_nrpages;
 static uint64_t __initdata shim_min_nrpages;
 static uint64_t __initdata shim_max_nrpages;
 
-static int __init parse_shim_mem(const char *s)
+static int __init cf_check parse_shim_mem(const char *s)
 {
     do {
         if ( !strncmp(s, "min:", 4) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2f6e10d0cf77..3a4ec1fcfd04 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -81,8 +81,6 @@ unsigned long __read_mostly cr4_pv32_mask;
 /* "acpi=ht":     Limit ACPI just to boot-time to enable HT.        */
 /* "acpi=noirq":  Disables ACPI interrupt routing.                  */
 /* "acpi=verbose": Enables more verbose ACPI boot time logging.     */
-static int parse_acpi_param(const char *s);
-custom_param("acpi", parse_acpi_param);
 
 /* **** Linux config option: propagated to domain0. */
 /* noapic: Disable IOAPIC setup. */
@@ -104,7 +102,7 @@ static bool __initdata opt_xen_shstk = true;
 #define opt_xen_shstk false
 #endif
 
-static int __init parse_cet(const char *s)
+static int __init cf_check parse_cet(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -159,7 +157,7 @@ static s8 __initdata opt_smep = -1;
  */
 static struct domain *__initdata dom0;
 
-static int __init parse_smep_param(const char *s)
+static int __init cf_check parse_smep_param(const char *s)
 {
     if ( !*s )
     {
@@ -190,7 +188,7 @@ custom_param("smep", parse_smep_param);
 #define SMAP_HVM_ONLY (-2)
 static s8 __initdata opt_smap = -1;
 
-static int __init parse_smap_param(const char *s)
+static int __init cf_check parse_smap_param(const char *s)
 {
     if ( !*s )
     {
@@ -221,7 +219,7 @@ bool __read_mostly acpi_disabled;
 bool __initdata acpi_force;
 static char __initdata acpi_param[10] = "";
 
-static int __init parse_acpi_param(const char *s)
+static int __init cf_check parse_acpi_param(const char *s)
 {
     /* Interpret the parameter for use within Xen. */
     if ( !parse_bool(s, NULL) )
@@ -257,6 +255,7 @@ static int __init parse_acpi_param(const char *s)
 
     return 0;
 }
+custom_param("acpi", parse_acpi_param);
 
 static const module_t *__initdata initial_images;
 static unsigned int __initdata nr_initial_images;
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index acef03314372..a01354d93319 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -56,7 +56,7 @@ static int reboot_mode;
  */
 static enum reboot_type reboot_type = BOOT_INVALID;
 
-static int __init set_reboot_type(const char *str)
+static int __init cf_check set_reboot_type(const char *str)
 {
     int rc = 0;
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index db27bc3f6451..2d4cf5c7ef80 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -68,7 +68,7 @@ static bool __initdata cpu_has_bug_mds; /* Any other M{LP,SB,FB}DS combination.
 
 static int8_t __initdata opt_srb_lock = -1;
 
-static int __init parse_spec_ctrl(const char *s)
+static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -218,7 +218,7 @@ static __init void xpti_init_default(uint64_t caps)
     }
 }
 
-static __init int parse_xpti(const char *s)
+static int __init cf_check parse_xpti(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -264,7 +264,7 @@ custom_param("xpti", parse_xpti);
 int8_t __read_mostly opt_pv_l1tf_hwdom = -1;
 int8_t __read_mostly opt_pv_l1tf_domu = -1;
 
-static __init int parse_pv_l1tf(const char *s)
+static int __init cf_check parse_pv_l1tf(const char *s)
 {
     const char *ss;
     int val, rc = 0;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index bc41a3aa37b2..818a42a406c5 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2354,7 +2354,7 @@ int hwdom_pit_access(struct ioreq *ioreq)
  * tsc=skewed: Assume TSCs are individually reliable, but skewed across CPUs.
  * tsc=stable:socket: Assume TSCs are reliable across sockets.
  */
-static int __init tsc_parse(const char *s)
+static int __init cf_check tsc_parse(const char *s)
 {
     if ( !strcmp(s, "unstable") )
     {
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index be89741a2f6d..b156844cdec1 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -22,7 +22,7 @@ int8_t __read_mostly opt_tsx = -1;
 int8_t __read_mostly cpu_has_tsx_ctrl = -1;
 bool __read_mostly rtm_disabled;
 
-static int __init parse_tsx(const char *s)
+static int __init cf_check parse_tsx(const char *s)
 {
     int rc = 0, val = parse_bool(s, NULL);
 
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index 7c3ed64b4c6c..2fa7f3f0bc4b 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -29,7 +29,7 @@
 
 unsigned int pci_probe = PCI_PROBE_CONF1 | PCI_PROBE_MMCONF;
 
-static int __init parse_mmcfg(const char *s)
+static int __init cf_check parse_mmcfg(const char *s)
 {
     const char *ss;
     int rc = 0;
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 1448faf65731..297f6d11f04d 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -78,7 +78,7 @@ DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
 static bool __read_mostly opt_argo;
 static bool __read_mostly opt_argo_mac_permissive;
 
-static int __init parse_argo(const char *s)
+static int __init cf_check parse_argo(const char *s)
 {
     const char *ss;
     int val, rc = 0;
diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index 411106c675c9..aa432ed2f57b 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -40,7 +40,7 @@ static enum core_parking_controller {
     PERFORMANCE_FIRST
 } core_parking_controller __initdata = POWER_FIRST;
 
-static int __init setup_core_parking_option(const char *str)
+static int __init cf_check setup_core_parking_option(const char *str)
 {
     if ( !strcmp(str, "power") )
         core_parking_controller = POWER_FIRST;
diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index f3794b945376..29b11239f5a5 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -38,7 +38,7 @@ static bool debugtrace_buf_empty = true;
 static bool debugtrace_used;
 static DEFINE_SPINLOCK(debugtrace_lock);
 
-static int __init debugtrace_parse_param(const char *s)
+static int __init cf_check debugtrace_parse_param(const char *s)
 {
     unsigned long bytes;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ac2746d0d69a..dacd03254cb2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -354,7 +354,7 @@ static int late_hwdom_init(struct domain *d)
 static unsigned int __read_mostly extra_hwdom_irqs;
 static unsigned int __read_mostly extra_domU_irqs = 32;
 
-static int __init parse_extra_guest_irqs(const char *s)
+static int __init cf_check parse_extra_guest_irqs(const char *s)
 {
     if ( isdigit(*s) )
         extra_domU_irqs = simple_strtoul(s, &s, 0);
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 12fd0844bd55..f31f68fd4cd1 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1417,7 +1417,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
 static bool __initdata efi_map_uc;
 
-static int __init parse_efi_param(const char *s)
+static int __init cf_check parse_efi_param(const char *s)
 {
     const char *ss;
     int rc = 0, val;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 153332b7bfbe..b663845d9c6c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -117,12 +117,12 @@ static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
     custom_runtime_set_var_sz(par, parval, GRANT_CUSTOM_VAL_SZ);
 }
 
-static void __init gnttab_max_frames_init(struct param_hypfs *par)
+static void __init cf_check gnttab_max_frames_init(struct param_hypfs *par)
 {
     update_gnttab_par(opt_max_grant_frames, par, opt_max_grant_frames_val);
 }
 
-static void __init max_maptrack_frames_init(struct param_hypfs *par)
+static void __init cf_check max_maptrack_frames_init(struct param_hypfs *par)
 {
     update_gnttab_par(opt_max_maptrack_frames, par,
                       opt_max_maptrack_frames_val);
@@ -156,23 +156,23 @@ static int parse_gnttab_limit(const char *arg, unsigned int *valp,
     return 0;
 }
 
-static int parse_gnttab_max_frames(const char *arg);
+static int cf_check parse_gnttab_max_frames(const char *arg);
 custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames,
                      gnttab_max_frames_init);
 
-static int parse_gnttab_max_frames(const char *arg)
+static int cf_check parse_gnttab_max_frames(const char *arg)
 {
     return parse_gnttab_limit(arg, &opt_max_grant_frames,
                               param_2_parfs(parse_gnttab_max_frames),
                               opt_max_grant_frames_val);
 }
 
-static int parse_gnttab_max_maptrack_frames(const char *arg);
+static int cf_check parse_gnttab_max_maptrack_frames(const char *arg);
 custom_runtime_param("gnttab_max_maptrack_frames",
                      parse_gnttab_max_maptrack_frames,
                      max_maptrack_frames_init);
 
-static int parse_gnttab_max_maptrack_frames(const char *arg)
+static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
 {
     return parse_gnttab_limit(arg, &opt_max_maptrack_frames,
                               param_2_parfs(parse_gnttab_max_maptrack_frames),
@@ -191,7 +191,7 @@ static bool __ro_after_init opt_grant_transfer = true;
 #define opt_grant_transfer false
 #endif
 
-static int __init parse_gnttab(const char *s)
+static int __init cf_check parse_gnttab(const char *s)
 {
     const char *ss, *e;
     int val, rc = 0;
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 8471590aeea2..6286c0bbf08b 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -104,7 +104,7 @@ static void *crash_heap_current = NULL, *crash_heap_end = NULL;
  * < and below are synonyomous, the latter being useful for grub2 systems
  * which would otherwise require escaping of the < option
  */
-static int __init parse_crashkernel(const char *str)
+static int __init cf_check parse_crashkernel(const char *str)
 {
     const char *cur;
     int rc = 0;
@@ -201,7 +201,7 @@ custom_param("crashkernel", parse_crashkernel);
  * - all will allocate additional structures such as domain and vcpu structs
  *       low so the crash kernel can perform an extended analysis of state.
  */
-static int __init parse_low_crashinfo(const char *str)
+static int __init cf_check parse_low_crashinfo(const char *str)
 {
 
     if ( !strlen(str) )
@@ -230,7 +230,7 @@ custom_param("low_crashinfo", parse_low_crashinfo);
  *
  * <addr> will be rounded down to the nearest power of two.  Defaults to 64G
  */
-static int __init parse_crashinfo_maxaddr(const char *str)
+static int __init cf_check parse_crashinfo_maxaddr(const char *str)
 {
     u64 addr;
     const char *q;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 38732dde6fd7..ede45c4af9db 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -62,7 +62,7 @@ static unsigned int __read_mostly hwdom_max_order = CONFIG_HWDOM_MAX_ORDER;
 static unsigned int __read_mostly ptdom_max_order = CONFIG_PTDOM_MAX_ORDER;
 #endif
 
-static int __init parse_max_order(const char *s)
+static int __init cf_check parse_max_order(const char *s)
 {
     if ( *s != ',' )
         domu_max_order = simple_strtoul(s, &s, 0);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f8749b0787a6..ad06655158d2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -179,7 +179,7 @@ enum bootscrub_mode {
  * https://bugs.llvm.org/show_bug.cgi?id=39707
  */
 static enum bootscrub_mode __read_mostly opt_bootscrub = BOOTSCRUB_IDLE;
-static int __init parse_bootscrub_param(const char *s)
+static int __init cf_check parse_bootscrub_param(const char *s)
 {
     /* Interpret 'bootscrub' alone in its positive boolean form */
     if ( *s == '\0' )
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 8c6e6eb9ccd5..f0dd626054a6 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -93,7 +93,7 @@ static int sched_gran_get(const char *str, enum sched_gran *mode)
     return -EINVAL;
 }
 
-static int __init sched_select_granularity(const char *str)
+static int __init cf_check sched_select_granularity(const char *str)
 {
     return sched_gran_get(str, &opt_sched_granularity);
 }
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 6396b38e044c..a5f073cda51e 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -456,7 +456,7 @@ static const char *const opt_runqueue_str[] = {
 };
 static int __read_mostly opt_runqueue = OPT_RUNQUEUE_SOCKET;
 
-static int __init parse_credit2_runqueue(const char *s)
+static int __init cf_check parse_credit2_runqueue(const char *s)
 {
     unsigned int i;
 
diff --git a/xen/drivers/acpi/tables.c b/xen/drivers/acpi/tables.c
index f39cd5eaac89..96ff96b84c66 100644
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -472,7 +472,7 @@ int __init acpi_table_init(void)
 	return 0;
 }
 
-static int __init acpi_parse_apic_instance(const char *str)
+static int __init cf_check acpi_parse_apic_instance(const char *str)
 {
 	const char *q;
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a043e9521afd..4694be83db45 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -88,7 +88,7 @@ static const char con_timestamp_mode_2_string[][7] = {
     [TSM_RAW] = "raw",
 };
 
-static void con_timestamp_mode_upd(struct param_hypfs *par)
+static void cf_check con_timestamp_mode_upd(struct param_hypfs *par)
 {
     const char *val = con_timestamp_mode_2_string[opt_con_timestamp_mode];
 
@@ -98,7 +98,7 @@ static void con_timestamp_mode_upd(struct param_hypfs *par)
 #define con_timestamp_mode_upd(par)
 #endif
 
-static int parse_console_timestamps(const char *s);
+static int cf_check parse_console_timestamps(const char *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
 
@@ -160,8 +160,8 @@ static int __read_mostly xenlog_guest_upper_thresh =
 static int __read_mostly xenlog_guest_lower_thresh =
     XENLOG_GUEST_LOWER_THRESHOLD;
 
-static int parse_loglvl(const char *s);
-static int parse_guest_loglvl(const char *s);
+static int cf_check parse_loglvl(const char *s);
+static int cf_check parse_guest_loglvl(const char *s);
 
 #ifdef CONFIG_HYPFS
 #define LOGLVL_VAL_SZ 16
@@ -176,13 +176,13 @@ static void xenlog_update_val(int lower, int upper, char *val)
     snprintf(val, LOGLVL_VAL_SZ, "%s/%s", lvl2opt[lower], lvl2opt[upper]);
 }
 
-static void __init xenlog_init(struct param_hypfs *par)
+static void __init cf_check xenlog_init(struct param_hypfs *par)
 {
     xenlog_update_val(xenlog_lower_thresh, xenlog_upper_thresh, xenlog_val);
     custom_runtime_set_var(par, xenlog_val);
 }
 
-static void __init xenlog_guest_init(struct param_hypfs *par)
+static void __init cf_check xenlog_guest_init(struct param_hypfs *par)
 {
     xenlog_update_val(xenlog_guest_lower_thresh, xenlog_guest_upper_thresh,
                       xenlog_guest_val);
@@ -240,7 +240,7 @@ static int _parse_loglvl(const char *s, int *lower, int *upper, char *val)
     return *s ? -EINVAL : 0;
 }
 
-static int parse_loglvl(const char *s)
+static int cf_check parse_loglvl(const char *s)
 {
     int ret;
 
@@ -251,7 +251,7 @@ static int parse_loglvl(const char *s)
     return ret;
 }
 
-static int parse_guest_loglvl(const char *s)
+static int cf_check parse_guest_loglvl(const char *s)
 {
     int ret;
 
@@ -793,7 +793,7 @@ static int printk_prefix_check(char *p, char **pp)
             ((loglvl < upper_thresh) && printk_ratelimit()));
 } 
 
-static int parse_console_timestamps(const char *s)
+static int cf_check parse_console_timestamps(const char *s)
 {
     switch ( parse_bool(s, NULL) )
     {
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 419aae83eea6..36b079296235 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -65,7 +65,7 @@ enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
 static int __init cpufreq_cmdline_parse(const char *s);
 
-static int __init setup_cpufreq_option(const char *str)
+static int __init cf_check setup_cpufreq_option(const char *str)
 {
     const char *arg = strpbrk(str, ",:");
     int choice;
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index b07fa4c40124..5ea227732821 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -704,7 +704,7 @@ static u16 __init parse_ivhd_device_extended_range(
     return dev_length;
 }
 
-static int __init parse_ivrs_ioapic(const char *str)
+static int __init cf_check parse_ivrs_ioapic(const char *str)
 {
     const char *s = str;
     unsigned long id;
@@ -742,7 +742,7 @@ static int __init parse_ivrs_ioapic(const char *str)
 }
 custom_param("ivrs_ioapic[", parse_ivrs_ioapic);
 
-static int __init parse_ivrs_hpet(const char *str)
+static int __init cf_check parse_ivrs_hpet(const char *str)
 {
     const char *s = str;
     unsigned long id;
@@ -1369,7 +1369,7 @@ int __init amd_iommu_get_supported_ivhd_type(void)
  * Format:
  * ivmd=<start>[-<end>][=<bdf1>[-<bdf1>'][,<bdf2>[-<bdf2>'][,...]]][;<start>...]
  */
-static int __init parse_ivmd_param(const char *s)
+static int __init cf_check parse_ivmd_param(const char *s)
 {
     do {
         unsigned long start, end;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index fc18f63bd4ac..6ee267d2bfd4 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -64,7 +64,7 @@ bool_t __read_mostly amd_iommu_perdev_intremap = 1;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
-static int __init parse_iommu_param(const char *s)
+static int __init cf_check parse_iommu_param(const char *s)
 {
     const char *ss;
     int val, rc = 0;
@@ -135,7 +135,7 @@ static int __init parse_iommu_param(const char *s)
 }
 custom_param("iommu", parse_iommu_param);
 
-static int __init parse_dom0_iommu_param(const char *s)
+static int __init cf_check parse_dom0_iommu_param(const char *s)
 {
     const char *ss;
     int rc = 0;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 70b6684981c1..4b59b332f01f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -146,7 +146,7 @@ static struct phantom_dev {
 } phantom_devs[8];
 static unsigned int nr_phantom_devs;
 
-static int __init parse_phantom_dev(const char *str)
+static int __init cf_check parse_phantom_dev(const char *str)
 {
     const char *s;
     unsigned int seg, bus, slot;
@@ -182,7 +182,7 @@ custom_param("pci-phantom", parse_phantom_dev);
 static u16 __read_mostly command_mask;
 static u16 __read_mostly bridge_ctl_mask;
 
-static int __init parse_pci_param(const char *s)
+static int __init cf_check parse_pci_param(const char *s)
 {
     const char *ss;
     int rc = 0;
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 33a12b2ae976..b152f3da916b 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -1084,7 +1084,7 @@ int intel_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
  * If a segment is specified for other than the first device, and it does not
  * match the one specified for the first one, an error will be reported.
  */
-static int __init parse_rmrr_param(const char *str)
+static int __init cf_check parse_rmrr_param(const char *str)
 {
     const char *s = str, *cur, *stmp;
     unsigned int seg, bus, dev, func, dev_count;
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 52b47dd89325..0590ddeea7c4 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -308,7 +308,7 @@ void vtd_ops_postamble_quirk(struct vtd_iommu *iommu)
     }
 }
 
-static int __init parse_snb_timeout(const char *s)
+static int __init cf_check parse_snb_timeout(const char *s)
 {
     int t;
     const char *q = NULL;
diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
index 0342a3dedef0..c8f81a5cc5fc 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -29,7 +29,7 @@ integer_param("vesa-ram", vram_total);
 static unsigned int __initdata vram_remap;
 
 static unsigned int __initdata font_height;
-static int __init parse_font_height(const char *s)
+static int __init cf_check parse_font_height(const char *s)
 {
     if ( simple_strtoul(s, &s, 10) == 8 && (*s++ == 'x') )
         font_height = simple_strtoul(s, &s, 10);
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index bb3bebc30e01..2d7ca3abaecd 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -28,8 +28,6 @@
 #define _copy_from_guest copy_from_guest
 
 enum flask_bootparam_t __read_mostly flask_bootparam = FLASK_BOOTPARAM_ENFORCING;
-static int parse_flask_param(const char *s);
-custom_param("flask", parse_flask_param);
 
 bool __read_mostly flask_enforcing = true;
 
@@ -60,7 +58,7 @@ static int flask_security_make_bools(void);
 
 extern int ss_initialized;
 
-static int __init parse_flask_param(const char *s)
+static int __init cf_check parse_flask_param(const char *s)
 {
     if ( !strcmp(s, "enforcing") )
         flask_bootparam = FLASK_BOOTPARAM_ENFORCING;
@@ -75,6 +73,7 @@ static int __init parse_flask_param(const char *s)
 
     return (flask_bootparam == FLASK_BOOTPARAM_INVALID) ? -EINVAL : 0;
 }
+custom_param("flask", parse_flask_param);
 
 static int domain_has_security(struct domain *d, u32 perms)
 {
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 5fc3a5f75478..2286a502e3e8 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -55,7 +55,7 @@ static enum xsm_bootparam __initdata xsm_bootparam =
     XSM_BOOTPARAM_DUMMY;
 #endif
 
-static int __init parse_xsm_param(const char *s)
+static int __init cf_check parse_xsm_param(const char *s)
 {
     int rc = 0;
 
-- 
2.11.0


