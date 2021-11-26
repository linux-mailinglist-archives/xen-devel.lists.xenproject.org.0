Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94B45EE08
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232671.403495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRX-0002mD-EF; Fri, 26 Nov 2021 12:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232671.403495; Fri, 26 Nov 2021 12:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRX-0002cX-1D; Fri, 26 Nov 2021 12:35:07 +0000
Received: by outflank-mailman (input) for mailman id 232671;
 Fri, 26 Nov 2021 12:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRU-0001F5-3e
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45cd3548-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:35:01 +0100 (CET)
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
X-Inumbo-ID: 45cd3548-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MRvQuR5PkwmyOOXBQLS3qS6dnN5OluVhP58XPt+R230=;
  b=SGVlUNARuo/dPMWI+G9v1KX3BkGcyQPSefAo4bhCBVPD9aNKaW7cpjs0
   hrkEPHGjc3wluJMGCjx136PltSPPw+keAIASF3hBnrprM3jyKujjXvgDS
   17Z1iDKEa7x1u7VEUxzXIKK7nIXkPG9W9s+MdHvoPEOCGYdYwvUP3X2pg
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VE3q6VryEGH8aQ8yMt4cbipRP0cNMImm9YPQVoWboiN6RzYrcabAz8nM4AX0kXj6PC6F/e1ngE
 tf2RVP8cMz+YNyIdHp6gufUHoAHbPs227+piE6fq28Au4rY/pd38PQXuhILKC9Zj2GIArNHMDi
 ZZA6fidqeQXlJwqRwJdIxhQa+rM+bjpOoaEQ0SObXna8VvnzitVyjNhh9as8EEiNl5PxPmQclB
 S43toWCZkODFyfsChP1EI6iEVoPqV5AETv9VvNGkHcfniIInKl2l8DtvSb8sFHYNyWotqaLACi
 KeYhHkOf8SHeGdCMx4w4VH2F
X-SBRS: 5.1
X-MesageID: 58633367
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ELX1nKh0W3VTQh66nrIfkZlvX161lRcKZh0ujC45NGQN5FlHY01je
 htvW2qGPfiOYzCgeIh0bt7ko0pUsMLTy4BhTwBopClnHyIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1NqLixTiF3fZTswvs0cicGCg9AfpRvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauOO
 ZFCMmQwBPjGSzJxIU4wF8skp+6TjyPmVAxGl32Ku7VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAAweNdGZ4SqI9DSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXKA0raTi23xAAhPMkYjW3EdYzVG2vC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysgPNb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQIwd3XC3270k5JGQWy2yGolTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQOcchKlLYrX0wORX4M4XRfK4EyvpX1
 XCzK5vEMJrnIf4/kGreqxk1jdfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgo
 ivgBxQGkQWn3hUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:oD45rKiXL1nAAjSnXh+wneUJyXBQXuAji2hC6mlwRA09TySZ//
 rOoB19726NtN9xYgBYpTnuAtjifZqxz/FICMwqTNOftWrdyQ2VxeNZnOnfKlTbckWUnIMw6U
 4jSdkYNDSZNykAsS+Q2mmF+rgbruVviJrY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58633367"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/65] xen: Annotate fnptr targets from custom_param()
Date: Fri, 26 Nov 2021 12:33:46 +0000
Message-ID: <20211126123446.32324-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The "watchdog_timeout" and "cpu_type" handlers were missing __init.

The "numa", "acpi", "irq_vector_map" and "flask" handlers can skip forward
declarations by altering the custom_param() position.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c             |  2 +-
 xen/arch/x86/acpi/power.c                |  2 +-
 xen/arch/x86/apic.c                      |  4 ++--
 xen/arch/x86/cpu/mcheck/mce.c            |  2 +-
 xen/arch/x86/cpu/microcode/core.c        |  2 +-
 xen/arch/x86/cpu/vpmu.c                  |  2 +-
 xen/arch/x86/cpuid.c                     |  2 +-
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
 49 files changed, 89 insertions(+), 95 deletions(-)

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
index 31a56f02d083..0f2c87c096c7 100644
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
index 55c103aaffbb..dd6cf1529f1e 100644
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
index 4ada29670469..9875143cac0e 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -55,7 +55,7 @@ static unsigned vpmu_count;
 
 static DEFINE_PER_CPU(struct vcpu *, last_vcpu);
 
-static int __init parse_vpmu_params(const char *s)
+static int __init cf_check parse_vpmu_params(const char *s)
 {
     const char *ss;
     int rc = 0, val;
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 151944f65702..f33c6ed76872 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -26,7 +26,7 @@ static const uint32_t __initconst hvm_hap_def_featuremask[] =
     INIT_HVM_HAP_DEF_FEATURES;
 static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
 
-static int __init parse_xen_cpuid(const char *s)
+static int __init cf_check parse_xen_cpuid(const char *s)
 {
     const char *ss;
     int val, rc = 0;
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 5a7441ed5b79..7c2ad03ac647 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -114,7 +114,7 @@ static int __init parse_amt(const char *s, const char **ps, struct memsize *sz)
     return 0;
 }
 
-static int __init parse_dom0_mem(const char *s)
+static int __init cf_check parse_dom0_mem(const char *s)
 {
     int ret;
 
@@ -143,7 +143,7 @@ custom_param("dom0_mem", parse_dom0_mem);
 static unsigned int __initdata opt_dom0_max_vcpus_min = 1;
 static unsigned int __initdata opt_dom0_max_vcpus_max = UINT_MAX;
 
-static int __init parse_dom0_max_vcpus(const char *s)
+static int __init cf_check parse_dom0_max_vcpus(const char *s)
 {
     if ( *s == '-' )                   /* -M */
         opt_dom0_max_vcpus_max = simple_strtoul(s + 1, &s, 0);
@@ -167,7 +167,7 @@ static __initdata unsigned int dom0_pxms[MAX_NUMNODES] =
     { [0 ... MAX_NUMNODES - 1] = ~0 };
 bool __initdata dom0_affinity_relaxed;
 
-static int __init parse_dom0_nodes(const char *s)
+static int __init cf_check parse_dom0_nodes(const char *s)
 {
     const char *ss;
     int rc = 0;
@@ -265,7 +265,7 @@ bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
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
index afe104dc93c2..7b009a930498 100644
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
index 9e1363207f80..ad32b09725d5 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1207,7 +1207,7 @@ static int viridian_load_vcpu_ctxt(struct domain *d,
 HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 
-static int __init parse_viridian_version(const char *arg)
+static int __init cf_check parse_viridian_version(const char *arg)
 {
     const char *t;
     unsigned int n[3];
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index f9f9bc18cdbc..3d1ca248ffde 100644
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
index 25f44a161c65..35d000921795 100644
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
index ab94a96c4d03..1a225d499295 100644
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
index da47cdea14a1..f35f3cb899ab 100644
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
@@ -155,7 +153,7 @@ static s8 __initdata opt_smep = -1;
  */
 static struct domain *__initdata dom0;
 
-static int __init parse_smep_param(const char *s)
+static int __init cf_check parse_smep_param(const char *s)
 {
     if ( !*s )
     {
@@ -186,7 +184,7 @@ custom_param("smep", parse_smep_param);
 #define SMAP_HVM_ONLY (-2)
 static s8 __initdata opt_smap = -1;
 
-static int __init parse_smap_param(const char *s)
+static int __init cf_check parse_smap_param(const char *s)
 {
     if ( !*s )
     {
@@ -217,7 +215,7 @@ bool __read_mostly acpi_disabled;
 bool __initdata acpi_force;
 static char __initdata acpi_param[10] = "";
 
-static int __init parse_acpi_param(const char *s)
+static int __init cf_check parse_acpi_param(const char *s)
 {
     /* Interpret the parameter for use within Xen. */
     if ( !parse_bool(s, NULL) )
@@ -253,6 +251,7 @@ static int __init parse_acpi_param(const char *s)
 
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
index a5569c7f2b3f..ac0f776b53cc 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -68,7 +68,7 @@ static bool __initdata cpu_has_bug_mds; /* Any other M{LP,SB,FB}DS combination.
 static int8_t __initdata opt_srb_lock = -1;
 uint64_t __read_mostly default_xen_mcu_opt_ctrl;
 
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
index a290aba3e8c4..4b12f494604d 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2351,7 +2351,7 @@ int hwdom_pit_access(struct ioreq *ioreq)
  * tsc=skewed: Assume TSCs are individually reliable, but skewed across CPUs.
  * tsc=stable:socket: Assume TSCs are reliable across sockets.
  */
-static int __init tsc_parse(const char *s)
+static int __init cf_check tsc_parse(const char *s)
 {
     if ( !strcmp(s, "unstable") )
     {
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 88adf08c4973..265ab0231188 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -19,7 +19,7 @@ int8_t __read_mostly opt_tsx = -1;
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
index 03debb2ea161..2698dbda1398 100644
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
index 8fd5e2d0780a..56f44f86c2c4 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1424,7 +1424,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
 static bool __initdata efi_map_uc;
 
-static int __init parse_efi_param(const char *s)
+static int __init cf_check parse_efi_param(const char *s)
 {
     const char *ss;
     int rc = 0, val;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index c92dc1d6fd78..d477f334659b 100644
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
@@ -186,7 +186,7 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
 
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
index 5a0462f97013..fbd2ebb3ba75 100644
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
index d0baaa2ecd20..615ae7fe12fc 100644
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
index 6334370109fc..4eea296c8c7c 100644
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
index 0d8ab2e716b8..e3105f90b7fe 100644
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
index 2c1bbd927806..cb0e443be4dd 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -30,7 +30,7 @@ static unsigned int vram_remap;
 integer_param("vesa-map", vram_remap);
 
 static int font_height;
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
index 74d0ef89c12d..302c08f7265e 100644
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


