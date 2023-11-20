Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C17F1681
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636971.992679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hc-0008SR-Vw; Mon, 20 Nov 2023 14:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636971.992679; Mon, 20 Nov 2023 14:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hc-0008QJ-R9; Mon, 20 Nov 2023 14:56:44 +0000
Received: by outflank-mailman (input) for mailman id 636971;
 Mon, 20 Nov 2023 14:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r55hb-0007tb-Ls
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:56:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02967cb8-87b5-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:56:40 +0100 (CET)
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
X-Inumbo-ID: 02967cb8-87b5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700492199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=52aGbe9hxD11kdwDju4bGGiS3h4rYhUSeNqPBgUhvg8=;
  b=CgR4xyaHuZwtxPoQbnirUolFrac2+NbhgeQhx2237Qprkk+hWDo3efTH
   rddsZNRfcgrvKqQuKrzNCbVxdnVDGO3MADFq5+gdZEzYlasRiag30nmHZ
   zR1eqJ6yMNxWfFpCSs0hLejLJ3wFY6OOyaftesRw7bJZjB58T8RYrxqmO
   A=;
X-CSE-ConnectionGUID: YxgkUgEXQvaxEBofcrPFUw==
X-CSE-MsgGUID: jPXUVQxFSqmGn8lpxfeyJA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127427128
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:P8lDIa9vJdzLiiH8nDIsDrUD636TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WcYUWuOa66LZWLxKoggYI+w8klV7JfQmtNrTlRqrCg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksz1BjOkGlA5AdnPKoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/5
 fMbFT8gXimdjvKb6rW1QfNUqPk8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPwRrC+
 TucrwwVBDkYDOyi9wOV3Em1g8DJzSfjSIwfBZ+Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85i8jVf46TvTz1IesX2itk
 nbV9EDSmon/k+Y6x6q4wF/qswuyr4jkZAk77R/vcF+6u1YRiJGeW2C41bTKxa8fdN7FFgjf7
 ChspiSI0AwZ4XiweM2xrAYlRujBCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 xeL5VoBtcINYCHxBUOSX25WI55ypZUM6Py/DqyEBjawSsUZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5DYZmLOAGeHr9HuZdyn3BW+I8mbcyjp/hR+ebENSH9pHZsGAfmU93VG4ve8ViPq
 I4FbJLWo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:NMj0Oal/gd+mWaK0iUqf0yc+EAnpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-Talos-CUID: =?us-ascii?q?9a23=3APv4CJ2gAXeho0ZJThaFyvQPGaTJuQ23Sz0rfDn+?=
 =?us-ascii?q?BF295ZZeSR1SKwI1ZjJ87?=
X-Talos-MUID: 9a23:fHNHeAnT3+POTwiD1OBSdnpgDPdV3Z2+JnsUlLoA682cJSJ9KhW02WE=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127427128"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/treewide: Switch bool_t to bool
Date: Mon, 20 Nov 2023 14:56:21 +0000
Message-ID: <20231120145623.167383-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120145623.167383-1-andrew.cooper3@citrix.com>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... as part of cleaning up the types used.  Minor style cleanup on some
altered lines.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

There's not an obvious way to subdivide this further without getting to a
silly number of patches.
---
 xen/arch/x86/cpu/microcode/core.c        |  4 +--
 xen/arch/x86/cpu/mtrr/generic.c          |  2 +-
 xen/arch/x86/cpu/vpmu.c                  |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c              |  4 +--
 xen/arch/x86/cpu/vpmu_intel.c            |  6 ++--
 xen/arch/x86/hvm/asid.c                  |  4 +--
 xen/arch/x86/hvm/emulate.c               | 28 +++++++++---------
 xen/arch/x86/hvm/hvm.c                   | 36 ++++++++++++------------
 xen/arch/x86/hvm/intercept.c             |  2 +-
 xen/arch/x86/hvm/mtrr.c                  | 12 ++++----
 xen/arch/x86/hvm/nestedhvm.c             |  4 +--
 xen/arch/x86/hvm/stdvga.c                |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 16 +++++------
 xen/arch/x86/hvm/svm/svm.c               |  8 +++---
 xen/arch/x86/hvm/vlapic.c                | 31 ++++++++++----------
 xen/arch/x86/hvm/vmx/vmcs.c              | 29 +++++++++----------
 xen/arch/x86/hvm/vmx/vmx.c               |  6 ++--
 xen/arch/x86/hvm/vmx/vvmx.c              | 20 ++++++-------
 xen/arch/x86/include/asm/acpi.h          |  2 +-
 xen/arch/x86/include/asm/apic.h          |  2 +-
 xen/arch/x86/include/asm/domain.h        | 28 +++++++++---------
 xen/arch/x86/include/asm/hardirq.h       |  2 +-
 xen/arch/x86/include/asm/hvm/asid.h      |  2 +-
 xen/arch/x86/include/asm/hvm/emulate.h   |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h       | 24 ++++++++--------
 xen/arch/x86/include/asm/hvm/io.h        |  6 ++--
 xen/arch/x86/include/asm/hvm/nestedhvm.h |  4 +--
 xen/arch/x86/include/asm/hvm/vcpu.h      | 16 +++++------
 xen/arch/x86/include/asm/hvm/vlapic.h    | 12 ++++----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h  | 10 +++----
 xen/arch/x86/include/asm/hvm/vmx/vmx.h   |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  |  2 +-
 xen/arch/x86/include/asm/mtrr.h          | 16 +++++------
 xen/arch/x86/include/asm/p2m.h           | 20 ++++++-------
 xen/arch/x86/include/asm/page.h          |  2 +-
 xen/arch/x86/include/asm/paging.h        |  2 +-
 xen/arch/x86/include/asm/pci.h           |  8 +++---
 xen/arch/x86/include/asm/psr.h           |  2 +-
 xen/arch/x86/include/asm/vpmu.h          | 12 ++++----
 xen/arch/x86/mm/hap/nested_ept.c         | 12 ++++----
 xen/arch/x86/mm/mem_paging.c             |  2 +-
 xen/arch/x86/mm/p2m-ept.c                | 29 ++++++++++---------
 xen/arch/x86/mm/p2m-pod.c                |  2 +-
 xen/arch/x86/mm/p2m-pt.c                 |  6 ++--
 xen/arch/x86/mm/p2m.c                    |  9 +++---
 xen/arch/x86/mm/paging.c                 |  6 ++--
 xen/arch/x86/x86_64/mmconf-fam10h.c      |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c    |  8 +++---
 xen/arch/x86/x86_64/mmconfig_64.c        |  6 ++--
 49 files changed, 237 insertions(+), 237 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 65ebeb50deea..95bcb52b222d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -58,7 +58,7 @@
 
 static module_t __initdata ucode_mod;
 static signed int __initdata ucode_mod_idx;
-static bool_t __initdata ucode_mod_forced;
+static bool __initdata ucode_mod_forced;
 static unsigned int nr_cores;
 
 /*
@@ -93,7 +93,7 @@ static struct ucode_mod_blob __initdata ucode_blob;
  * By default we will NOT parse the multiboot modules to see if there is
  * cpio image with the microcode images.
  */
-static bool_t __initdata ucode_scan;
+static bool __initdata ucode_scan;
 
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 660ae26c2350..25ae5f5b7d6a 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -120,7 +120,7 @@ void __init get_mtrr_state(void)
 	rdmsrl(MSR_MTRRcap, mtrr_state.mtrr_cap);
 }
 
-static bool_t __initdata mtrr_show;
+static bool __initdata mtrr_show;
 boolean_param("mtrr.show", mtrr_show);
 
 static const char *__init mtrr_attrib_to_str(mtrr_type x)
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index a022126f18fd..ed84372b8001 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -369,7 +369,7 @@ void vpmu_save(struct vcpu *v)
     apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
 }
 
-int vpmu_load(struct vcpu *v, bool_t from_guest)
+int vpmu_load(struct vcpu *v, bool from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     int ret;
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 18266b9521a9..c28a7e3c4719 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -31,7 +31,7 @@
 static unsigned int __read_mostly num_counters;
 static const u32 __read_mostly *counters;
 static const u32 __read_mostly *ctrls;
-static bool_t __read_mostly k7_counters_mirrored;
+static bool __read_mostly k7_counters_mirrored;
 
 #define F10H_NUM_COUNTERS   4
 #define F15H_NUM_COUNTERS   6
@@ -217,7 +217,7 @@ static int cf_check amd_vpmu_load(struct vcpu *v, bool from_guest)
 
     if ( from_guest )
     {
-        bool_t is_running = 0;
+        bool is_running = false;
         struct xen_pmu_amd_ctxt *guest_ctxt = &vpmu->xenpmu_data->pmu.c.amd;
 
         ASSERT(!has_vlapic(v->domain));
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 6330c89b47be..0a73ae27a4cb 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -52,7 +52,7 @@
 
 /* Alias registers (0x4c1) for full-width writes to PMCs */
 #define MSR_PMC_ALIAS_MASK       (~(MSR_IA32_PERFCTR0 ^ MSR_IA32_A_PERFCTR0))
-static bool_t __read_mostly full_width_write;
+static bool __read_mostly full_width_write;
 
 /*
  * MSR_CORE_PERF_FIXED_CTR_CTRL contains the configuration of all fixed
@@ -607,7 +607,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
         tmp = msr - MSR_P6_EVNTSEL(0);
         if ( tmp >= 0 && tmp < arch_pmc_cnt )
         {
-            bool_t blocked = 0;
+            bool blocked = false;
             uint64_t umaskevent = msr_content & MSR_IA32_CMT_EVTSEL_UE_MASK;
             struct xen_pmu_cntr_pair *xen_pmu_cntr_pair =
                 vpmu_reg_pointer(core2_vpmu_cxt, arch_counters);
@@ -818,7 +818,7 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     u64 msr_content;
-    static bool_t ds_warned;
+    static bool ds_warned;
 
     if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
          v->domain->arch.cpuid->basic.pmu_version >= 6 )
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 0faaa24a8f6e..8d27b7dba17b 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -43,7 +43,7 @@ struct hvm_asid_data {
    uint64_t core_asid_generation;
    uint32_t next_asid;
    uint32_t max_asid;
-   bool_t disabled;
+   bool disabled;
 };
 
 static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
@@ -100,7 +100,7 @@ void hvm_asid_flush_core(void)
     data->disabled = 1;
 }
 
-bool_t hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
+bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
 {
     struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
 
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 254716c76670..15d9962f3a2c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -150,8 +150,8 @@ void hvmemul_cancel(struct vcpu *v)
 }
 
 static int hvmemul_do_io(
-    bool_t is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
-    uint8_t dir, bool_t df, bool_t data_is_addr, uintptr_t data)
+    bool is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
+    uint8_t dir, bool df, bool data_is_addr, uintptr_t data)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
@@ -363,8 +363,8 @@ static int hvmemul_do_io(
 }
 
 static int hvmemul_do_io_buffer(
-    bool_t is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
-    uint8_t dir, bool_t df, void *buffer)
+    bool is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
+    uint8_t dir, bool df, void *buffer)
 {
     int rc;
 
@@ -421,8 +421,8 @@ static inline void hvmemul_release_page(struct page_info *page)
 }
 
 static int hvmemul_do_io_addr(
-    bool_t is_mmio, paddr_t addr, unsigned long *reps,
-    unsigned int size, uint8_t dir, bool_t df, paddr_t ram_gpa)
+    bool is_mmio, paddr_t addr, unsigned long *reps,
+    unsigned int size, uint8_t dir, bool df, paddr_t ram_gpa)
 {
     struct vcpu *v = current;
     unsigned long ram_gmfn = paddr_to_pfn(ram_gpa);
@@ -510,7 +510,7 @@ static int hvmemul_do_pio_addr(uint16_t port,
                                unsigned long *reps,
                                unsigned int size,
                                uint8_t dir,
-                               bool_t df,
+                               bool df,
                                paddr_t ram_addr)
 {
     return hvmemul_do_io_addr(0, port, reps, size, dir, df, ram_addr);
@@ -534,7 +534,7 @@ static int hvmemul_do_mmio_buffer(paddr_t mmio_gpa,
                                   unsigned long *reps,
                                   unsigned int size,
                                   uint8_t dir,
-                                  bool_t df,
+                                  bool df,
                                   void *buffer)
 {
     return hvmemul_do_io_buffer(1, mmio_gpa, reps, size, dir, df, buffer);
@@ -554,7 +554,7 @@ static int hvmemul_do_mmio_addr(paddr_t mmio_gpa,
                                 unsigned long *reps,
                                 unsigned int size,
                                 uint8_t dir,
-                                bool_t df,
+                                bool df,
                                 paddr_t ram_gpa)
 {
     return hvmemul_do_io_addr(1, mmio_gpa, reps, size, dir, df, ram_gpa);
@@ -1034,7 +1034,7 @@ static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
 }
 
 static void latch_linear_to_phys(struct hvm_vcpu_io *hvio, unsigned long gla,
-                                 unsigned long gpa, bool_t write)
+                                 unsigned long gpa, bool write)
 {
     if ( hvio->mmio_access.gla_valid )
         return;
@@ -1048,7 +1048,7 @@ static void latch_linear_to_phys(struct hvm_vcpu_io *hvio, unsigned long gla,
 
 static int hvmemul_linear_mmio_access(
     unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
-    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool_t known_gpfn)
+    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool known_gpfn)
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned long offset = gla & ~PAGE_MASK;
@@ -1101,7 +1101,7 @@ static int hvmemul_linear_mmio_access(
 static inline int hvmemul_linear_mmio_read(
     unsigned long gla, unsigned int size, void *buffer,
     uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
-    bool_t translate)
+    bool translate)
 {
     return hvmemul_linear_mmio_access(gla, size, IOREQ_READ, buffer,
                                       pfec, hvmemul_ctxt, translate);
@@ -1110,7 +1110,7 @@ static inline int hvmemul_linear_mmio_read(
 static inline int hvmemul_linear_mmio_write(
     unsigned long gla, unsigned int size, void *buffer,
     uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
-    bool_t translate)
+    bool translate)
 {
     return hvmemul_linear_mmio_access(gla, size, IOREQ_WRITE, buffer,
                                       pfec, hvmemul_ctxt, translate);
@@ -1990,7 +1990,7 @@ static int cf_check hvmemul_rep_stos(
     unsigned long addr;
     paddr_t gpa;
     p2m_type_t p2mt;
-    bool_t df = !!(ctxt->regs->eflags & X86_EFLAGS_DF);
+    bool df = ctxt->regs->eflags & X86_EFLAGS_DF;
     int rc = hvmemul_virtual_to_linear(seg, offset, bytes_per_rep, reps,
                                        hvm_access_write, hvmemul_ctxt, &addr);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 482eebbabf7f..35a30df3b1b4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -69,7 +69,7 @@
 
 #include <compat/hvm/hvm_op.h>
 
-bool_t __read_mostly hvm_enabled;
+bool __read_mostly hvm_enabled;
 
 #ifdef DBG_LEVEL_0
 unsigned int opt_hvm_debug_level __read_mostly;
@@ -87,12 +87,12 @@ unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
 
 /* Xen command-line option to enable HAP */
-static bool_t __initdata opt_hap_enabled = 1;
+static bool __initdata opt_hap_enabled = true;
 boolean_param("hap", opt_hap_enabled);
 
 #ifndef opt_hvm_fep
 /* Permit use of the Forced Emulation Prefix in HVM guests */
-bool_t __read_mostly opt_hvm_fep;
+bool __read_mostly opt_hvm_fep;
 boolean_param("hvm_fep", opt_hvm_fep);
 #endif
 static const char __initconst warning_hvm_fep[] =
@@ -102,7 +102,7 @@ static const char __initconst warning_hvm_fep[] =
     "Please *DO NOT* use this in production.\n";
 
 /* Xen command-line option to enable altp2m */
-static bool_t __initdata opt_altp2m_enabled = 0;
+static bool __initdata opt_altp2m_enabled;
 boolean_param("altp2m", opt_altp2m_enabled);
 
 static int cf_check cpu_callback(
@@ -1857,7 +1857,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
     /* Check access permissions first, then handle faults */
     if ( !mfn_eq(mfn, INVALID_MFN) )
     {
-        bool_t violation;
+        bool violation;
 
         /* If the access is against the permissions, then send to vm_event */
         switch (p2ma)
@@ -1914,7 +1914,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             /* Should #VE be emulated for this fault? */
             if ( p2m_is_altp2m(p2m) && !cpu_has_vmx_virt_exceptions )
             {
-                bool_t sve;
+                bool sve;
 
                 p2m->get_entry(p2m, _gfn(gfn), &p2mt, &p2ma, 0, NULL, &sve);
 
@@ -2125,7 +2125,7 @@ int hvm_set_efer(uint64_t value)
 }
 
 /* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
-static bool_t domain_exit_uc_mode(struct vcpu *v)
+static bool domain_exit_uc_mode(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct vcpu *vs;
@@ -2142,7 +2142,7 @@ static bool_t domain_exit_uc_mode(struct vcpu *v)
     return 1;
 }
 
-static void hvm_set_uc_mode(struct vcpu *v, bool_t is_in_uc_mode)
+static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
 {
     v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
     shadow_blow_tables_per_domain(v->domain);
@@ -2705,8 +2705,8 @@ struct hvm_write_map {
 
 /* On non-NULL return, we leave this function holding an additional 
  * ref on the underlying mfn, if any */
-static void *_hvm_map_guest_frame(unsigned long gfn, bool_t permanent,
-                                  bool_t *writable)
+static void *_hvm_map_guest_frame(unsigned long gfn, bool permanent,
+                                  bool *writable)
 {
     void *map;
     p2m_type_t p2mt;
@@ -2750,19 +2750,19 @@ static void *_hvm_map_guest_frame(unsigned long gfn, bool_t permanent,
     return map;
 }
 
-void *hvm_map_guest_frame_rw(unsigned long gfn, bool_t permanent,
-                             bool_t *writable)
+void *hvm_map_guest_frame_rw(unsigned long gfn, bool permanent,
+                             bool *writable)
 {
     *writable = 1;
     return _hvm_map_guest_frame(gfn, permanent, writable);
 }
 
-void *hvm_map_guest_frame_ro(unsigned long gfn, bool_t permanent)
+void *hvm_map_guest_frame_ro(unsigned long gfn, bool permanent)
 {
     return _hvm_map_guest_frame(gfn, permanent, NULL);
 }
 
-void hvm_unmap_guest_frame(void *p, bool_t permanent)
+void hvm_unmap_guest_frame(void *p, bool permanent)
 {
     mfn_t mfn;
     struct page_info *page;
@@ -2806,7 +2806,7 @@ void hvm_mapped_guest_frames_mark_dirty(struct domain *d)
     spin_unlock(&d->arch.hvm.write_map.lock);
 }
 
-static void *hvm_map_entry(unsigned long va, bool_t *writable)
+static void *hvm_map_entry(unsigned long va, bool *writable)
 {
     unsigned long gfn;
     uint32_t pfec;
@@ -2851,7 +2851,7 @@ static int task_switch_load_seg(
     struct segment_register desctab, segr;
     seg_desc_t *pdesc = NULL, desc;
     u8 dpl, rpl;
-    bool_t writable;
+    bool writable;
     int fault_type = X86_EXC_TS;
     struct vcpu *v = current;
 
@@ -3030,7 +3030,7 @@ void hvm_task_switch(
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct segment_register gdt, tr, prev_tr, segr;
     seg_desc_t *optss_desc = NULL, *nptss_desc = NULL, tss_desc;
-    bool_t otd_writable, ntd_writable;
+    bool otd_writable, ntd_writable;
     unsigned int eflags, new_cpl;
     pagefault_info_t pfinfo;
     int exn_raised, rc;
@@ -4642,7 +4642,7 @@ static int do_altp2m_op(
     case HVMOP_altp2m_set_domain_state:
     {
         struct vcpu *v;
-        bool_t ostate;
+        bool ostate;
 
         if ( nestedhvm_enabled(d) )
         {
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index 61664c0ad13f..a949419cbebb 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -324,7 +324,7 @@ bool relocate_portio_handler(struct domain *d, unsigned int old_port,
     return false;
 }
 
-bool_t hvm_mmio_internal(paddr_t gpa)
+bool hvm_mmio_internal(paddr_t gpa)
 {
     const struct hvm_io_handler *handler;
     const struct hvm_io_ops *ops;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 7f486358b1ba..52df34a6de03 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -359,7 +359,7 @@ uint32_t get_pat_flags(struct vcpu *v,
     return pat_type_2_pte_flags(pat_entry_value);
 }
 
-static inline bool_t valid_mtrr_type(uint8_t type)
+static inline bool valid_mtrr_type(uint8_t type)
 {
     switch ( type )
     {
@@ -373,8 +373,8 @@ static inline bool_t valid_mtrr_type(uint8_t type)
     return 0;
 }
 
-bool_t mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
-                             uint64_t msr_content)
+bool mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
+                           uint64_t msr_content)
 {
     uint8_t def_type = msr_content & 0xff;
     bool fixed_enabled = MASK_EXTR(msr_content, MTRRdefType_FE);
@@ -405,8 +405,8 @@ bool_t mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
     return 1;
 }
 
-bool_t mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
-                              uint32_t row, uint64_t msr_content)
+bool mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
+                            uint32_t row, uint64_t msr_content)
 {
     uint64_t *fixed_range_base = (uint64_t *)m->fixed_ranges;
 
@@ -428,7 +428,7 @@ bool_t mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
     return 1;
 }
 
-bool_t mtrr_var_range_msr_set(
+bool mtrr_var_range_msr_set(
     struct domain *d, struct mtrr_state *m, uint32_t msr, uint64_t msr_content)
 {
     uint32_t index, phys_addr;
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 64d7eec9a1de..12bf7172b873 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -16,7 +16,7 @@
 static unsigned long *shadow_io_bitmap[3];
 
 /* Nested VCPU */
-bool_t
+bool
 nestedhvm_vcpu_in_guestmode(struct vcpu *v)
 {
     return vcpu_nestedhvm(v).nv_guestmode;
@@ -155,7 +155,7 @@ static int __init cf_check nestedhvm_setup(void)
 __initcall(nestedhvm_setup);
 
 unsigned long *
-nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed)
+nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
 {
     int i;
 
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 8da07ff8a23b..b16c59f77270 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -126,7 +126,7 @@ static void stdvga_cache_disable(struct hvm_hw_stdvga *s)
     s->cache = STDVGA_CACHE_DISABLED;
 }
 
-static bool_t stdvga_cache_is_enabled(const struct hvm_hw_stdvga *s)
+static bool stdvga_cache_is_enabled(const struct hvm_hw_stdvga *s)
 {
     return s->cache == STDVGA_CACHE_ENABLED;
 }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a09b6abaaeaf..4073c317ecc2 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -50,7 +50,7 @@ int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 
     if ( !nv->nv_vvmcx )
     {
-        bool_t writable;
+        bool writable;
         void *vvmcx = hvm_map_guest_frame_rw(paddr_to_pfn(vmcbaddr), 1,
                                              &writable);
 
@@ -346,7 +346,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-static int nsvm_vmrun_permissionmap(struct vcpu *v, bool_t viopm)
+static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
 {
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -357,7 +357,7 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool_t viopm)
     unsigned int i;
     enum hvm_translation_result ret;
     unsigned long *ns_viomap;
-    bool_t ioport_80 = 1, ioport_ed = 1;
+    bool ioport_80 = true, ioport_ed = true;
 
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
@@ -853,9 +853,9 @@ uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v)
 
 static int
 nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bitmap,
-    uint32_t msr, bool_t write)
+    uint32_t msr, bool write)
 {
-    bool_t enabled;
+    bool enabled;
     unsigned long *msr_bit;
 
     msr_bit = svm_msrbit(msr_bitmap, msr);
@@ -887,7 +887,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
     ioio_info_t ioinfo;
     uint16_t port;
     unsigned int size;
-    bool_t enabled;
+    bool enabled;
 
     ioinfo.bytes = exitinfo1;
     port = ioinfo.fields.port;
@@ -926,7 +926,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
     return NESTEDHVM_VMEXIT_INJECT;
 }
 
-static bool_t
+static bool
 nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     struct cpu_user_regs *regs, uint64_t exitcode)
 {
@@ -1289,7 +1289,7 @@ enum nestedhvm_vmexits
 nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode)
 {
-    bool_t is_intercepted;
+    bool is_intercepted;
 
     ASSERT(vcpu_nestedhvm(v).nv_vmexit_pending == 0);
     is_intercepted = nsvm_vmcb_guest_intercepts_exitcode(v, regs, exitcode);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 674e54e04a1c..df4cb3fd335f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -59,7 +59,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);
 static DEFINE_PER_CPU(struct vmcb_struct *, host_vmcb_va);
 #endif
 
-static bool_t amd_erratum383_found __read_mostly;
+static bool amd_erratum383_found __read_mostly;
 
 /* OSVW bits */
 static uint64_t osvw_length, osvw_status;
@@ -1014,7 +1014,7 @@ static void noreturn cf_check svm_do_resume(void)
     bool debug_state = (v->domain->debugger_attached ||
                         v->domain->arch.monitor.software_breakpoint_enabled ||
                         v->domain->arch.monitor.debug_exception_enabled);
-    bool_t vcpu_guestmode = 0;
+    bool vcpu_guestmode = false;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
     if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
@@ -2537,7 +2537,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
 
 const struct hvm_function_table * __init start_svm(void)
 {
-    bool_t printed = 0;
+    bool printed = false;
 
     svm_host_osvw_reset();
 
@@ -2594,7 +2594,7 @@ void svm_vmexit_handler(void)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int insn_len, rc;
     vintr_t intr;
-    bool_t vcpu_guestmode = 0;
+    bool vcpu_guestmode = false;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
     regs->rax = vmcb->rax;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index a8e87c444627..a54010d71ea1 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -191,10 +191,10 @@ uint32_t vlapic_set_ppr(struct vlapic *vlapic)
    return ppr;
 }
 
-static bool_t vlapic_match_logical_addr(const struct vlapic *vlapic,
-                                        uint32_t mda)
+static bool vlapic_match_logical_addr(const struct vlapic *vlapic,
+                                      uint32_t mda)
 {
-    bool_t result = 0;
+    bool result = false;
     uint32_t logical_id = vlapic_get_reg(vlapic, APIC_LDR);
 
     if ( vlapic_x2apic_mode(vlapic) )
@@ -224,9 +224,9 @@ static bool_t vlapic_match_logical_addr(const struct vlapic *vlapic,
     return result;
 }
 
-bool_t vlapic_match_dest(
+bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool_t dest_mode)
+    int short_hand, uint32_t dest, bool dest_mode)
 {
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "target %p, source %p, dest %#x, "
                 "dest_mode %#x, short_hand %#x",
@@ -264,7 +264,7 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
     switch ( icr & APIC_MODE_MASK )
     {
     case APIC_DM_INIT: {
-        bool_t fpu_initialised;
+        bool fpu_initialised;
         int rc;
 
         /* No work on INIT de-assert for P4-type APIC. */
@@ -307,7 +307,7 @@ static void cf_check vlapic_init_sipi_action(void *data)
     uint32_t icr = vcpu_vlapic(origin)->init_sipi.icr;
     uint32_t dest = vcpu_vlapic(origin)->init_sipi.dest;
     uint32_t short_hand = icr & APIC_SHORT_MASK;
-    bool_t dest_mode = !!(icr & APIC_DEST_MASK);
+    bool dest_mode = icr & APIC_DEST_MASK;
     struct vcpu *v;
 
     if ( icr == 0 )
@@ -349,7 +349,8 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
     case APIC_DM_NMI:
         if ( !test_and_set_bool(v->arch.nmi_pending) )
         {
-            bool_t wake = 0;
+            bool wake = false;
+
             domain_lock(v->domain);
             if ( v->is_initialised )
                 wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
@@ -373,7 +374,7 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
 
 struct vlapic *vlapic_lowest_prio(
     struct domain *d, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool_t dest_mode)
+    int short_hand, uint32_t dest, bool dest_mode)
 {
     int old = hvm_domain_irq(d)->round_robin_prev_vcpu;
     uint32_t ppr, target_ppr = UINT_MAX;
@@ -457,8 +458,8 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     hvm_dpci_msi_eoi(d, vector);
 }
 
-static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
-                                uint32_t dest, bool_t dest_mode)
+static bool is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
+                              uint32_t dest, bool dest_mode)
 {
     if ( vlapic_domain(vlapic)->max_vcpus <= 2 )
         return 0;
@@ -482,7 +483,7 @@ void vlapic_ipi(
 {
     unsigned int dest;
     unsigned int short_hand = icr_low & APIC_SHORT_MASK;
-    bool_t dest_mode = !!(icr_low & APIC_DEST_MASK);
+    bool dest_mode = icr_low & APIC_DEST_MASK;
 
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "icr = 0x%08x:%08x", icr_high, icr_low);
 
@@ -523,7 +524,7 @@ void vlapic_ipi(
         /* fall through */
     default: {
         struct vcpu *v;
-        bool_t batch = is_multicast_dest(vlapic, short_hand, dest, dest_mode);
+        bool batch = is_multicast_dest(vlapic, short_hand, dest, dest_mode);
 
         if ( batch )
             cpu_raise_softirq_batch_begin();
@@ -1342,7 +1343,7 @@ int vlapic_has_pending_irq(struct vcpu *v)
     return irr;
 }
 
-int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack)
+int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     int isr;
@@ -1377,7 +1378,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack)
     return 1;
 }
 
-bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic)
+bool is_vlapic_lvtpc_enabled(struct vlapic *vlapic)
 {
     return (vlapic_enabled(vlapic) &&
             !(vlapic_get_reg(vlapic, APIC_LVTPC) & APIC_LVT_MASKED));
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 6cefb88aec29..6711697ff6ea 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -32,13 +32,13 @@
 #include <asm/tboot.h>
 #include <asm/apic.h>
 
-static bool_t __read_mostly opt_vpid_enabled = 1;
+static bool __read_mostly opt_vpid_enabled = true;
 boolean_param("vpid", opt_vpid_enabled);
 
-static bool_t __read_mostly opt_unrestricted_guest_enabled = 1;
+static bool __read_mostly opt_unrestricted_guest_enabled = true;
 boolean_param("unrestricted_guest", opt_unrestricted_guest_enabled);
 
-static bool_t __read_mostly opt_apicv_enabled = 1;
+static bool __read_mostly opt_apicv_enabled = true;
 boolean_param("apicv", opt_apicv_enabled);
 
 /*
@@ -168,12 +168,12 @@ u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 u64 vmx_vmfunc __read_mostly;
-bool_t vmx_virt_exception __read_mostly;
+bool vmx_virt_exception __read_mostly;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
 static DEFINE_PER_CPU(paddr_t, current_vmcs);
 static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
-DEFINE_PER_CPU(bool_t, vmxon);
+DEFINE_PER_CPU(bool, vmxon);
 
 static u32 vmcs_revision_id __read_mostly;
 u64 __read_mostly vmx_basic_msr;
@@ -209,7 +209,7 @@ static void __init vmx_display_features(void)
 }
 
 static u32 adjust_vmx_controls(
-    const char *name, u32 ctl_min, u32 ctl_opt, u32 msr, bool_t *mismatch)
+    const char *name, u32 ctl_min, u32 ctl_opt, u32 msr, bool *mismatch)
 {
     u32 vmx_msr_low, vmx_msr_high, ctl = ctl_min | ctl_opt;
 
@@ -229,7 +229,7 @@ static u32 adjust_vmx_controls(
     return ctl;
 }
 
-static bool_t cap_check(const char *name, u32 expected, u32 saw)
+static bool cap_check(const char *name, u32 expected, u32 saw)
 {
     if ( saw != expected )
         printk("VMX %s: saw %#x expected %#x\n", name, saw, expected);
@@ -247,7 +247,7 @@ static int vmx_init_vmcs_config(bool bsp)
     u32 _vmx_vmexit_control;
     u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
-    bool_t mismatch = 0;
+    bool mismatch = false;
 
     rdmsr(MSR_IA32_VMX_BASIC, vmx_basic_msr_low, vmx_basic_msr_high);
 
@@ -802,7 +802,7 @@ struct foreign_vmcs {
 };
 static DEFINE_PER_CPU(struct foreign_vmcs, foreign_vmcs);
 
-bool_t vmx_vmcs_try_enter(struct vcpu *v)
+bool vmx_vmcs_try_enter(struct vcpu *v)
 {
     struct foreign_vmcs *fv;
 
@@ -840,7 +840,7 @@ bool_t vmx_vmcs_try_enter(struct vcpu *v)
 
 void vmx_vmcs_enter(struct vcpu *v)
 {
-    bool_t okay = vmx_vmcs_try_enter(v);
+    bool okay = vmx_vmcs_try_enter(v);
 
     ASSERT(okay);
 }
@@ -1599,10 +1599,9 @@ void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector)
                 &v->arch.hvm.vmx.eoi_exitmap_changed);
 }
 
-bool_t vmx_vcpu_pml_enabled(const struct vcpu *v)
+bool vmx_vcpu_pml_enabled(const struct vcpu *v)
 {
-    return !!(v->arch.hvm.vmx.secondary_exec_control &
-              SECONDARY_EXEC_ENABLE_PML);
+    return v->arch.hvm.vmx.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML;
 }
 
 int vmx_vcpu_enable_pml(struct vcpu *v)
@@ -1704,7 +1703,7 @@ void vmx_vcpu_flush_pml_buffer(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-bool_t vmx_domain_pml_enabled(const struct domain *d)
+bool vmx_domain_pml_enabled(const struct domain *d)
 {
     return d->arch.hvm.vmx.status & VMX_DOMAIN_PML_ENABLED;
 }
@@ -1872,7 +1871,7 @@ static void vmx_update_debug_state(struct vcpu *v)
 void cf_check vmx_do_resume(void)
 {
     struct vcpu *v = current;
-    bool_t debug_state;
+    bool debug_state;
     unsigned long host_cr4;
 
     if ( v->arch.hvm.vmx.active_cpu == smp_processor_id() )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e919f..b99770d588fb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -50,7 +50,7 @@
 #include <asm/prot-key.h>
 #include <public/arch-x86/cpuid.h>
 
-static bool_t __initdata opt_force_ept;
+static bool __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
 static void cf_check vmx_ctxt_switch_from(struct vcpu *v);
@@ -2196,7 +2196,7 @@ static void cf_check vmx_process_isr(int isr, struct vcpu *v)
 
 static void __vmx_deliver_posted_interrupt(struct vcpu *v)
 {
-    bool_t running = v->is_running;
+    bool running = v->is_running;
 
     vcpu_unblock(v);
     /*
@@ -4793,7 +4793,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
     struct domain *currd = curr->domain;
     u32 new_asid, old_asid;
     struct hvm_vcpu_asid *p_asid;
-    bool_t need_flush;
+    bool need_flush;
 
     ASSERT(hvmemul_cache_disabled(curr));
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index b7be424afbca..e2bb71b0ab58 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -811,7 +811,7 @@ static void unmap_io_bitmap(struct vcpu *v, unsigned int idx)
     }
 }
 
-static bool_t __must_check _map_io_bitmap(struct vcpu *v, u64 vmcs_reg)
+static bool __must_check _map_io_bitmap(struct vcpu *v, u64 vmcs_reg)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long gpa;
@@ -825,7 +825,7 @@ static bool_t __must_check _map_io_bitmap(struct vcpu *v, u64 vmcs_reg)
     return nvmx->iobitmap[index] != NULL;
 }
 
-static inline bool_t __must_check map_io_bitmap_all(struct vcpu *v)
+static inline bool __must_check map_io_bitmap_all(struct vcpu *v)
 {
    return _map_io_bitmap(v, IO_BITMAP_A) &&
           _map_io_bitmap(v, IO_BITMAP_B);
@@ -1148,7 +1148,7 @@ static uint64_t get_host_eptp(struct vcpu *v)
     return p2m_get_hostp2m(v->domain)->ept.eptp;
 }
 
-static bool_t nvmx_vpid_enabled(const struct vcpu *v)
+static bool nvmx_vpid_enabled(const struct vcpu *v)
 {
     uint32_t second_cntl;
 
@@ -1591,12 +1591,12 @@ static int nvmx_handle_vmxoff(struct cpu_user_regs *regs)
     return X86EMUL_OKAY;
 }
 
-static bool_t vvmcs_launched(struct list_head *launched_list,
-                             unsigned long vvmcs_mfn)
+static bool vvmcs_launched(struct list_head *launched_list,
+                           unsigned long vvmcs_mfn)
 {
     struct vvmcs_list *vvmcs;
     struct list_head *pos;
-    bool_t launched = 0;
+    bool launched = false;
 
     list_for_each(pos, launched_list)
     {
@@ -1679,7 +1679,7 @@ static enum vmx_insn_errno nvmx_vmresume(struct vcpu *v)
 
 static int nvmx_handle_vmresume(struct cpu_user_regs *regs)
 {
-    bool_t launched;
+    bool launched;
     struct vcpu *v = current;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long intr_shadow;
@@ -1715,7 +1715,7 @@ static int nvmx_handle_vmresume(struct cpu_user_regs *regs)
 
 static int nvmx_handle_vmlaunch(struct cpu_user_regs *regs)
 {
-    bool_t launched;
+    bool launched;
     struct vcpu *v = current;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long intr_shadow;
@@ -1785,7 +1785,7 @@ static int nvmx_handle_vmptrld(struct cpu_user_regs *regs)
 
     if ( !vvmcx_valid(v) )
     {
-        bool_t writable;
+        bool writable;
         void *vvmcx = hvm_map_guest_frame_rw(paddr_to_pfn(gpa), 1, &writable);
 
         if ( vvmcx )
@@ -1894,7 +1894,7 @@ static int nvmx_handle_vmclear(struct cpu_user_regs *regs)
     else 
     {
         /* Even if this VMCS isn't the current one, we must clear it. */
-        bool_t writable;
+        bool writable;
 
         vvmcs = hvm_map_guest_frame_rw(paddr_to_pfn(gpa), 0, &writable);
 
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 6ce79ce465b4..6d94f822d476 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -127,7 +127,7 @@ struct acpi_sleep_info {
     uint32_t sleep_state;
     uint64_t wakeup_vector;
     uint32_t vector_width;
-    bool_t sleep_extended;
+    bool sleep_extended;
 };
 
 #define MAX_MADT_ENTRIES	MAX(256, 2 * NR_CPUS)
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 7625c0ecd66b..8459e43ded57 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -139,7 +139,7 @@ static __inline void apic_icr_write(u32 low, u32 dest)
     }
 }
 
-static __inline bool_t apic_isr_read(u8 vector)
+static __inline bool apic_isr_read(u8 vector)
 {
     return (apic_read(APIC_ISR + ((vector & ~0x1f) >> 1)) >>
             (vector & 0x1f)) & 1;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index d033224d2b1a..4b6b7ceab1ed 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -106,17 +106,17 @@ struct shadow_domain {
 
     /* Shadow hashtable */
     struct page_info **hash_table;
-    bool_t hash_walking;  /* Some function is walking the hash table */
+    bool hash_walking;  /* Some function is walking the hash table */
 
     /* Fast MMIO path heuristic */
     bool has_fast_mmio_entries;
 
 #ifdef CONFIG_HVM
     /* OOS */
-    bool_t oos_active;
+    bool oos_active;
 
     /* Has this domain ever used HVMOP_pagetable_dying? */
-    bool_t pagetable_dying_op;
+    bool pagetable_dying_op;
 #endif
 
 #ifdef CONFIG_PV
@@ -160,7 +160,7 @@ struct shadow_vcpu {
         unsigned long off[SHADOW_OOS_FIXUPS];
     } oos_fixup[SHADOW_OOS_PAGES];
 
-    bool_t pagetable_dying;
+    bool pagetable_dying;
 #endif
 #endif
 };
@@ -199,7 +199,7 @@ struct paging_domain {
     /* flags to control paging operation */
     u32                     mode;
     /* Has that pool ever run out of memory? */
-    bool_t                  p2m_alloc_failed;
+    bool                    p2m_alloc_failed;
     /* extension for shadow paging support */
     struct shadow_domain    shadow;
     /* extension for hardware-assited paging */
@@ -353,7 +353,7 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
 
     /* altp2m: allow multiple copies of host p2m */
-    bool_t altp2m_active;
+    bool altp2m_active;
     struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
@@ -364,10 +364,10 @@ struct arch_domain
     struct radix_tree_root irq_pirq;
 
     /* Is shared-info page in 32-bit format? */
-    bool_t has_32bit_shinfo;
+    bool has_32bit_shinfo;
 
     /* Is PHYSDEVOP_eoi to automatically unmask the event channel? */
-    bool_t auto_unmask;
+    bool auto_unmask;
 
     /*
      * The width of the FIP/FDP register in the FPU that needs to be
@@ -399,7 +399,7 @@ struct arch_domain
 
     /* TSC management (emulation, pv, scaling, stats) */
     int tsc_mode;            /* see asm/time.h */
-    bool_t vtsc;             /* tsc is emulated (may change after migrate) */
+    bool vtsc;               /* tsc is emulated (may change after migrate) */
     s_time_t vtsc_last;      /* previous TSC value (guarantee monotonicity) */
     uint64_t vtsc_offset;    /* adjustment for save/restore/migrate */
     uint32_t tsc_khz;        /* cached guest khz for certain emulated or
@@ -452,7 +452,7 @@ struct arch_domain
     } monitor;
 
     /* Mem_access emulation control */
-    bool_t mem_access_emulate_each_rep;
+    bool mem_access_emulate_each_rep;
 
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
@@ -544,8 +544,8 @@ struct pv_vcpu
     unsigned long sysenter_callback_eip;
     unsigned short syscall32_callback_cs;
     unsigned short sysenter_callback_cs;
-    bool_t syscall32_disables_events;
-    bool_t sysenter_disables_events;
+    bool syscall32_disables_events;
+    bool sysenter_disables_events;
 
     /*
      * 64bit segment bases.
@@ -586,7 +586,7 @@ struct pv_vcpu
     uint32_t dr7_emul;
 
     /* Deferred VA-based update state. */
-    bool_t need_update_runstate_area;
+    bool need_update_runstate_area;
     struct vcpu_time_info pending_system_time;
 };
 
@@ -656,7 +656,7 @@ struct arch_vcpu
     uint64_t xcr0_accum;
     /* This variable determines whether nonlazy extended state has been used,
      * and thus should be saved/restored. */
-    bool_t nonlazy_xstate_used;
+    bool nonlazy_xstate_used;
 
     /* Restore all FPU state (lazy and non-lazy state) on context switch? */
     bool fully_eager_fpu;
diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
index 276e3419d778..342361cb6fdd 100644
--- a/xen/arch/x86/include/asm/hardirq.h
+++ b/xen/arch/x86/include/asm/hardirq.h
@@ -9,7 +9,7 @@ typedef struct {
 	unsigned int __local_irq_count;
 	unsigned int nmi_count;
 	unsigned int mce_count;
-	bool_t __mwait_wakeup;
+	bool __mwait_wakeup;
 } __cacheline_aligned irq_cpustat_t;
 
 #include <xen/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t above */
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 0207f8fc29db..17c58353d139 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -26,7 +26,7 @@ void hvm_asid_flush_core(void);
 
 /* Called before entry to guest context. Checks ASID allocation, returns a
  * boolean indicating whether all ASIDs must be flushed. */
-bool_t hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
+bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
 
 #endif /* __ASM_X86_HVM_ASID_H__ */
 
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 398d0db0781b..29d679442e10 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -50,7 +50,7 @@ struct hvm_emulate_ctxt {
 
     bool is_mem_access;
 
-    bool_t set_context;
+    bool set_context;
 };
 
 enum emul_kind {
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6d53713fc3a9..a4c1af19acd6 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -21,7 +21,7 @@ struct pirq; /* needed by pi_update_irte */
 
 #ifdef CONFIG_HVM_FEP
 /* Permit use of the Forced Emulation Prefix in HVM guests */
-extern bool_t opt_hvm_fep;
+extern bool opt_hvm_fep;
 #else
 #define opt_hvm_fep 0
 #endif
@@ -95,7 +95,7 @@ struct hvm_function_table {
     const char *name;
 
     /* Support Hardware-Assisted Paging? */
-    bool_t hap_supported;
+    bool hap_supported;
 
     /* Necessary hardware support for alternate p2m's? */
     bool altp2m_supported;
@@ -189,10 +189,10 @@ struct hvm_function_table {
     int (*nhvm_vcpu_reset)(struct vcpu *v);
     int (*nhvm_vcpu_vmexit_event)(struct vcpu *v, const struct x86_event *event);
     uint64_t (*nhvm_vcpu_p2m_base)(struct vcpu *v);
-    bool_t (*nhvm_vmcx_guest_intercepts_event)(
+    bool (*nhvm_vmcx_guest_intercepts_event)(
         struct vcpu *v, unsigned int vector, int errcode);
 
-    bool_t (*nhvm_vmcx_hap_enabled)(struct vcpu *v);
+    bool (*nhvm_vmcx_hap_enabled)(struct vcpu *v);
 
     enum hvm_intblk (*nhvm_intr_blocked)(struct vcpu *v);
     void (*nhvm_domain_relinquish_resources)(struct domain *d);
@@ -218,7 +218,7 @@ struct hvm_function_table {
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
     void (*altp2m_vcpu_update_vmfunc_ve)(struct vcpu *v);
-    bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
+    bool (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
     /* vmtrace */
@@ -247,7 +247,7 @@ struct hvm_function_table {
 };
 
 extern struct hvm_function_table hvm_funcs;
-extern bool_t hvm_enabled;
+extern bool hvm_enabled;
 extern s8 hvm_port80_allowed;
 
 extern const struct hvm_function_table *start_svm(void);
@@ -346,10 +346,10 @@ static inline bool hvm_virtual_to_linear_addr(
                                       access_type, active_cs, linear);
 }
 
-void *hvm_map_guest_frame_rw(unsigned long gfn, bool_t permanent,
-                             bool_t *writable);
-void *hvm_map_guest_frame_ro(unsigned long gfn, bool_t permanent);
-void hvm_unmap_guest_frame(void *p, bool_t permanent);
+void *hvm_map_guest_frame_rw(unsigned long gfn, bool permanent,
+                             bool *writable);
+void *hvm_map_guest_frame_ro(unsigned long gfn, bool permanent);
+void hvm_unmap_guest_frame(void *p, bool permanent);
 void hvm_mapped_guest_frames_mark_dirty(struct domain *d);
 
 int hvm_debug_op(struct vcpu *v, int32_t op);
@@ -616,7 +616,7 @@ static inline uint64_t nhvm_vcpu_p2m_base(struct vcpu *v)
 }
 
 /* returns true, when l1 guest intercepts the specified trap */
-static inline bool_t nhvm_vmcx_guest_intercepts_event(
+static inline bool nhvm_vmcx_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode)
 {
     return alternative_call(hvm_funcs.nhvm_vmcx_guest_intercepts_event, v,
@@ -624,7 +624,7 @@ static inline bool_t nhvm_vmcx_guest_intercepts_event(
 }
 
 /* returns true when l1 guest wants to use hap to run l2 guest */
-static inline bool_t nhvm_vmcx_hap_enabled(struct vcpu *v)
+static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
 {
     return alternative_call(hvm_funcs.nhvm_vmcx_hap_enabled, v);
 }
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index e5225e75ef26..54de84185fb3 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -54,7 +54,7 @@ typedef int (*hvm_io_write_t)(const struct hvm_io_handler *handler,
                               uint64_t addr,
                               uint32_t size,
                               uint64_t data);
-typedef bool_t (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
+typedef bool (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
                                   const ioreq_t *p);
 typedef void (*hvm_io_complete_t)(const struct hvm_io_handler *handler);
 
@@ -72,7 +72,7 @@ int hvm_io_intercept(ioreq_t *p);
 
 struct hvm_io_handler *hvm_next_io_handler(struct domain *d);
 
-bool_t hvm_mmio_internal(paddr_t gpa);
+bool hvm_mmio_internal(paddr_t gpa);
 
 void register_mmio_handler(struct domain *d,
                            const struct hvm_mmio_ops *ops);
@@ -121,7 +121,7 @@ struct hvm_hw_stdvga {
     uint8_t sr[8];
     uint8_t gr_index;
     uint8_t gr[9];
-    bool_t stdvga;
+    bool stdvga;
     enum stdvga_cache_state cache;
     uint32_t latch;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 3d1ec53a6ff9..56a2019e1bae 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -32,7 +32,7 @@ static inline bool nestedhvm_enabled(const struct domain *d)
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
 void nestedhvm_vcpu_reset(struct vcpu *v);
-bool_t nestedhvm_vcpu_in_guestmode(struct vcpu *v);
+bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define nestedhvm_vcpu_enter_guestmode(v) \
     vcpu_nestedhvm(v).nv_guestmode = 1
 #define nestedhvm_vcpu_exit_guestmode(v)  \
@@ -50,7 +50,7 @@ int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
 /* IO permission map */
-unsigned long *nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed);
+unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
 
 /* Misc */
 #define nestedhvm_paging_mode_hap(v) (!!nhvm_vmcx_hap_enabled(v))
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index c9ef2b325bd4..64c7a6fedea9 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -60,7 +60,7 @@ struct hvm_vcpu_io {
      * For string instruction emulation we need to be able to signal a
      * necessary retry through other than function return codes.
      */
-    bool_t mmio_retry;
+    bool mmio_retry;
 
     unsigned long msix_unmask_address;
     unsigned long msix_snoop_address;
@@ -70,7 +70,7 @@ struct hvm_vcpu_io {
 };
 
 struct nestedvcpu {
-    bool_t nv_guestmode; /* vcpu in guestmode? */
+    bool nv_guestmode; /* vcpu in guestmode? */
     void *nv_vvmcx; /* l1 guest virtual VMCB/VMCS */
     void *nv_n1vmcx; /* VMCB/VMCS used to run l1 guest */
     void *nv_n2vmcx; /* shadow VMCB/VMCS used to run l2 guest */
@@ -85,22 +85,22 @@ struct nestedvcpu {
         struct nestedvmx nvmx;
     } u;
 
-    bool_t nv_flushp2m; /* True, when p2m table must be flushed */
+    bool nv_flushp2m; /* True, when p2m table must be flushed */
     struct p2m_domain *nv_p2m; /* used p2m table for this vcpu */
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
     uint64_t np2m_generation;
 
     struct hvm_vcpu_asid nv_n2asid;
 
-    bool_t nv_vmentry_pending;
-    bool_t nv_vmexit_pending;
-    bool_t nv_vmswitch_in_progress; /* true during vmentry/vmexit emulation */
+    bool nv_vmentry_pending;
+    bool nv_vmexit_pending;
+    bool nv_vmswitch_in_progress; /* true during vmentry/vmexit emulation */
 
     /* Does l1 guest intercept io ports 0x80 and/or 0xED ?
      * Useful to optimize io permission handling.
      */
-    bool_t nv_ioport80;
-    bool_t nv_ioportED;
+    bool nv_ioport80;
+    bool nv_ioportED;
 
     /* L2's control-resgister, just as the L2 sees them. */
     unsigned long       guest_cr[5];
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index f27454a13698..88ef94524339 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -66,7 +66,7 @@ struct vlapic {
     struct hvm_hw_lapic      hw;
     struct hvm_hw_lapic_regs *regs;
     struct {
-        bool_t               hw, regs;
+        bool                 hw, regs;
         uint32_t             id, ldr;
     }                        loaded;
     spinlock_t               esr_lock;
@@ -97,13 +97,13 @@ static inline void vlapic_set_reg(
 
 void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
 
-bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
+bool is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
 void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
 
 int vlapic_has_pending_irq(struct vcpu *v);
-int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack);
+int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
 
 int  vlapic_init(struct vcpu *v);
 void vlapic_destroy(struct vcpu *v);
@@ -131,11 +131,11 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int offset);
 
 struct vlapic *vlapic_lowest_prio(
     struct domain *d, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool_t dest_mode);
+    int short_hand, uint32_t dest, bool dest_mode);
 
-bool_t vlapic_match_dest(
+bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool_t dest_mode);
+    int short_hand, uint32_t dest, bool dest_mode);
 
 static inline void vlapic_sync_pir_to_irr(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index e05664399309..a9afdffae547 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -143,7 +143,7 @@ struct vmx_vcpu {
     unsigned long        host_cr0;
 
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
-    bool_t               ept_spurious_misconfig;
+    bool                 ept_spurious_misconfig;
 
     /* Processor Trace configured and enabled for the vcpu. */
     bool                 ipt_active;
@@ -183,7 +183,7 @@ struct vmx_vcpu {
 int vmx_create_vmcs(struct vcpu *v);
 void vmx_destroy_vmcs(struct vcpu *v);
 void vmx_vmcs_enter(struct vcpu *v);
-bool_t __must_check vmx_vmcs_try_enter(struct vcpu *v);
+bool __must_check vmx_vmcs_try_enter(struct vcpu *v);
 void vmx_vmcs_exit(struct vcpu *v);
 void vmx_vmcs_reload(struct vcpu *v);
 
@@ -663,13 +663,13 @@ void virtual_vmcs_vmwrite(const struct vcpu *, u32 encoding, u64 val);
 enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
                                               u32 vmcs_encoding, u64 val);
 
-DECLARE_PER_CPU(bool_t, vmxon);
+DECLARE_PER_CPU(bool, vmxon);
 
-bool_t vmx_vcpu_pml_enabled(const struct vcpu *v);
+bool vmx_vcpu_pml_enabled(const struct vcpu *v);
 int vmx_vcpu_enable_pml(struct vcpu *v);
 void vmx_vcpu_disable_pml(struct vcpu *v);
 void vmx_vcpu_flush_pml_buffer(struct vcpu *v);
-bool_t vmx_domain_pml_enabled(const struct domain *d);
+bool vmx_domain_pml_enabled(const struct domain *d);
 int vmx_domain_enable_pml(struct domain *d);
 void vmx_domain_disable_pml(struct domain *d);
 void vmx_domain_flush_pml_buffers(struct domain *d);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index d4b335a2bca9..31643ed48103 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -585,7 +585,7 @@ void vmx_inject_extint(int trap, uint8_t source);
 void vmx_inject_nmi(void);
 
 void ept_walk_table(struct domain *d, unsigned long gfn);
-bool_t ept_handle_misconfig(uint64_t gpa);
+bool ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order, bool *ipat, p2m_type_t type);
 void setup_ept_dump(void);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index dc9db69258d2..da10d3fa9617 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -35,7 +35,7 @@ struct nestedvmx {
         u8            source;
     } intr;
     struct {
-        bool_t   enabled;
+        bool     enabled;
         uint32_t exit_reason;
         uint32_t exit_qual;
     } ept;
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 1d2744eceb9e..36dac0a775a3 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -44,7 +44,7 @@ struct mtrr_state {
 
 	u64       mtrr_cap;
 	/* ranges in var MSRs are overlapped or not:0(no overlapped) */
-	bool_t    overlapped;
+	bool      overlapped;
 };
 extern struct mtrr_state mtrr_state;
 
@@ -68,19 +68,19 @@ extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
 extern void mtrr_bp_restore(void);
 
-extern bool_t mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
-                                     uint32_t msr, uint64_t msr_content);
-extern bool_t mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
-                                     uint32_t row, uint64_t msr_content);
-extern bool_t mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
-                                    uint64_t msr_content);
+extern bool mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
+                                   uint32_t msr, uint64_t msr_content);
+extern bool mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
+                                   uint32_t row, uint64_t msr_content);
+extern bool mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
+                                  uint64_t msr_content);
 #ifdef CONFIG_HVM
 extern void memory_type_changed(struct domain *d);
 #else
 static inline void memory_type_changed(struct domain *d) {}
 #endif
 
-extern bool_t pat_msr_set(uint64_t *pat, uint64_t msr);
+extern bool pat_msr_set(uint64_t *pat, uint64_t msr);
 
 bool is_var_mtrr_overlapped(const struct mtrr_state *m);
 bool mtrr_pat_not_equal(const struct vcpu *vd, const struct vcpu *vs);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index f2c7d58b5999..32f3f394b05a 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -27,7 +27,7 @@
 #endif
 #define P2M_DEBUGGING 0
 
-extern bool_t opt_hap_1gb, opt_hap_2mb;
+extern bool opt_hap_1gb, opt_hap_2mb;
 
 /*
  * The upper levels of the p2m pagetable always contain full rights; all 
@@ -245,7 +245,7 @@ struct p2m_domain {
                                     p2m_access_t *p2ma,
                                     p2m_query_t q,
                                     unsigned int *page_order,
-                                    bool_t *sve);
+                                    bool *sve);
     int                (*recalc)(struct p2m_domain *p2m,
                                  unsigned long gfn);
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
@@ -284,11 +284,11 @@ struct p2m_domain {
      */
     void (*tlb_flush)(struct p2m_domain *p2m);
     unsigned int defer_flush;
-    bool_t need_flush;
+    bool need_flush;
 
     /* If true, and an access fault comes in and there is no vm_event listener, 
      * pause domain.  Otherwise, remove access restrictions. */
-    bool_t       access_required;
+    bool         access_required;
 
     /* Highest guest frame that's ever been mapped in the p2m */
     unsigned long max_mapped_pfn;
@@ -420,17 +420,17 @@ void np2m_schedule(int dir);
 static inline void np2m_schedule(int dir) {}
 #endif
 
-static inline bool_t p2m_is_hostp2m(const struct p2m_domain *p2m)
+static inline bool p2m_is_hostp2m(const struct p2m_domain *p2m)
 {
     return p2m->p2m_class == p2m_host;
 }
 
-static inline bool_t p2m_is_nestedp2m(const struct p2m_domain *p2m)
+static inline bool p2m_is_nestedp2m(const struct p2m_domain *p2m)
 {
     return p2m->p2m_class == p2m_nested;
 }
 
-static inline bool_t p2m_is_altp2m(const struct p2m_domain *p2m)
+static inline bool p2m_is_altp2m(const struct p2m_domain *p2m)
 {
     return p2m->p2m_class == p2m_alternate;
 }
@@ -450,11 +450,11 @@ void p2m_unlock_and_tlb_flush(struct p2m_domain *p2m);
 
 mfn_t __nonnull(3, 4) p2m_get_gfn_type_access(
     struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
-    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked);
+    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool locked);
 
 static inline mfn_t __nonnull(3, 4) _get_gfn_type_access(
     struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
-    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked)
+    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool locked)
 {
     if ( !p2m || !paging_mode_translate(p2m->domain) )
     {
@@ -888,7 +888,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 }
 
 /* Switch alternate p2m for a single vcpu */
-bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
+bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
 
 /* Check to see if vcpu should be switched to a different p2m. */
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index c9466172ba3f..93a7b368ac0b 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -378,7 +378,7 @@ static inline unsigned int cacheattr_to_pte_flags(unsigned int cacheattr)
 }
 
 /* return true if permission increased */
-static inline bool_t
+static inline bool
 perms_strictly_increased(uint32_t old_flags, uint32_t new_flags)
 /* Given the flags of two entries, are the new flags a strict
  * increase in rights over the old ones? */
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 62605d7697bc..76162a9429ce 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -210,7 +210,7 @@ int paging_domain_init(struct domain *d);
  * manipulate the log-dirty bitmap. */
 int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
-                  bool_t resuming);
+                  bool resuming);
 
 /* Call when destroying a vcpu/domain */
 void paging_vcpu_teardown(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd981de9de35..6bfe87e2780b 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -39,11 +39,11 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                              uint32_t *data);
 int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data);
-bool_t pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
-                        unsigned int *bdf);
+bool pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
+                      unsigned int *bdf);
 
-bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
-                           unsigned int *bdf);
+bool pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
+                         unsigned int *bdf);
 
 /* MMCFG external variable defines */
 extern int pci_mmcfg_config_num;
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
index 8ecb7a0eea70..51df78794cd0 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -67,7 +67,7 @@ enum psr_type {
 
 extern struct psr_cmt *psr_cmt;
 
-static inline bool_t psr_cmt_enabled(void)
+static inline bool psr_cmt_enabled(void)
 {
     return !!psr_cmt;
 }
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 7858aec6cae6..6629093197c3 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -33,8 +33,8 @@ struct arch_vpmu_ops {
     int (*do_rdmsr)(unsigned int msr, uint64_t *msr_content);
     int (*do_interrupt)(struct cpu_user_regs *regs);
     void (*arch_vpmu_destroy)(struct vcpu *v);
-    int (*arch_vpmu_save)(struct vcpu *v, bool_t to_guest);
-    int (*arch_vpmu_load)(struct vcpu *v, bool_t from_guest);
+    int (*arch_vpmu_save)(struct vcpu *v, bool to_guest);
+    int (*arch_vpmu_load)(struct vcpu *v, bool from_guest);
     void (*arch_vpmu_dump)(const struct vcpu *v);
 
 #ifdef CONFIG_MEM_SHARING
@@ -87,12 +87,12 @@ static inline void vpmu_clear(struct vpmu_struct *vpmu)
     /* VPMU_AVAILABLE should be altered by get/put_vpmu(). */
     vpmu->flags &= VPMU_AVAILABLE;
 }
-static inline bool_t vpmu_is_set(const struct vpmu_struct *vpmu, const u32 mask)
+static inline bool vpmu_is_set(const struct vpmu_struct *vpmu, const u32 mask)
 {
     return !!(vpmu->flags & mask);
 }
-static inline bool_t vpmu_are_all_set(const struct vpmu_struct *vpmu,
-                                      const u32 mask)
+static inline bool vpmu_are_all_set(const struct vpmu_struct *vpmu,
+                                    const u32 mask)
 {
     return !!((vpmu->flags & mask) == mask);
 }
@@ -104,7 +104,7 @@ void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);
 void cf_check vpmu_save_force(void *arg);
-int vpmu_load(struct vcpu *v, bool_t from_guest);
+int vpmu_load(struct vcpu *v, bool from_guest);
 void vpmu_dump(struct vcpu *v);
 
 static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index d6df48af5427..d88d677825f1 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -42,7 +42,7 @@
 #define NEPT_2M_ENTRY_FLAG (1 << 10)
 #define NEPT_4K_ENTRY_FLAG (1 << 9)
 
-static bool_t nept_rsv_bits_check(ept_entry_t e, uint32_t level)
+static bool nept_rsv_bits_check(ept_entry_t e, uint32_t level)
 {
     uint64_t rsv_bits = EPT_MUST_RSV_BITS;
 
@@ -68,7 +68,7 @@ static bool_t nept_rsv_bits_check(ept_entry_t e, uint32_t level)
 }
 
 /* EMT checking*/
-static bool_t nept_emt_bits_check(ept_entry_t e, uint32_t level)
+static bool nept_emt_bits_check(ept_entry_t e, uint32_t level)
 {
     if ( e.sp || level == 1 )
     {
@@ -79,13 +79,13 @@ static bool_t nept_emt_bits_check(ept_entry_t e, uint32_t level)
     return 0;
 }
 
-static bool_t nept_permission_check(uint32_t rwx_acc, uint32_t rwx_bits)
+static bool nept_permission_check(uint32_t rwx_acc, uint32_t rwx_bits)
 {
     return !(EPTE_RWX_MASK & rwx_acc & ~rwx_bits);
 }
 
 /* nept's non-present check */
-static bool_t nept_non_present_check(ept_entry_t e)
+static bool nept_non_present_check(ept_entry_t e)
 {
     if ( e.epte & EPTE_RWX_MASK )
         return 0;
@@ -106,7 +106,7 @@ uint64_t nept_get_ept_vpid_cap(void)
     return caps;
 }
 
-static bool_t nept_rwx_bits_check(ept_entry_t e)
+static bool nept_rwx_bits_check(ept_entry_t e)
 {
     /*write only or write/execute only*/
     uint8_t rwx_bits = e.epte & EPTE_RWX_MASK;
@@ -122,7 +122,7 @@ static bool_t nept_rwx_bits_check(ept_entry_t e)
 }
 
 /* nept's misconfiguration check */
-static bool_t nept_misconfiguration_check(ept_entry_t e, uint32_t level)
+static bool nept_misconfiguration_check(ept_entry_t e, uint32_t level)
 {
     return nept_rsv_bits_check(e, level) ||
            nept_emt_bits_check(e, level) ||
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 2c2b34ccf60a..541ecbeeb001 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -431,7 +431,7 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg)
     int rc;
     xen_mem_paging_op_t mpo;
     struct domain *d;
-    bool_t copyback = 0;
+    bool copyback = false;
 
     if ( copy_from_guest(&mpo, arg, 1) )
         return -EFAULT;
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 85c4e8e54f66..227bdf7c2433 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -30,7 +30,8 @@
 
 #define is_epte_present(ept_entry)      ((ept_entry)->epte & 0x7)
 #define is_epte_superpage(ept_entry)    ((ept_entry)->sp)
-static inline bool_t is_epte_valid(ept_entry_t *e)
+
+static bool is_epte_valid(const ept_entry_t *e)
 {
     /* suppress_ve alone is not considered valid, so mask it off */
     return ((e->epte & ~(1ul << 63)) != 0 && e->sa_p2mt != p2m_invalid);
@@ -239,14 +240,14 @@ static void ept_free_entry(struct p2m_domain *p2m, ept_entry_t *ept_entry, int l
     p2m_free_ptp(p2m, mfn_to_page(_mfn(ept_entry->mfn)));
 }
 
-static bool_t ept_split_super_page(struct p2m_domain *p2m,
-                                   ept_entry_t *ept_entry,
-                                   unsigned int level, unsigned int target)
+static bool ept_split_super_page(
+    struct p2m_domain *p2m, ept_entry_t *ept_entry,
+    unsigned int level, unsigned int target)
 {
     ept_entry_t new_ept, *table;
     uint64_t trunk;
     unsigned int i;
-    bool_t rv = 1;
+    bool rv = true;
 
     /* End if the entry is a leaf entry or reaches the target level. */
     if ( level <= target )
@@ -305,7 +306,7 @@ static bool_t ept_split_super_page(struct p2m_domain *p2m,
  *  GUEST_TABLE_POD:
  *   The next entry is marked populate-on-demand.
  */
-static int ept_next_level(struct p2m_domain *p2m, bool_t read_only,
+static int ept_next_level(struct p2m_domain *p2m, bool read_only,
                           ept_entry_t **table, unsigned long *gfn_remainder,
                           int next_level)
 {
@@ -678,7 +679,7 @@ static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
                                              _mfn(e.mfn),
                                              level * EPT_TABLE_ORDER, &ipat,
                                              e.sa_p2mt);
-                bool_t recalc = e.recalc;
+                bool recalc = e.recalc;
 
                 if ( recalc && p2m_is_changeable(e.sa_p2mt) )
                 {
@@ -760,11 +761,11 @@ static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
     return rc;
 }
 
-bool_t ept_handle_misconfig(uint64_t gpa)
+bool ept_handle_misconfig(uint64_t gpa)
 {
     struct vcpu *curr = current;
     struct p2m_domain *p2m = p2m_get_hostp2m(curr->domain);
-    bool_t spurious;
+    bool spurious;
     int rc;
 
     if ( altp2m_active(curr->domain) )
@@ -798,11 +799,11 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     unsigned int i, target = order / EPT_TABLE_ORDER;
     unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? (gfn | mfn_x(mfn)) : gfn;
     int ret, rc = 0;
-    bool_t entry_written = 0;
-    bool_t need_modify_vtd_table = 1;
-    bool_t vtd_pte_present = 0;
+    bool entry_written = false;
+    bool need_modify_vtd_table = true;
+    bool vtd_pte_present = false;
     unsigned int iommu_flags = p2m_get_iommu_flags(p2mt, p2ma, mfn);
-    bool_t needs_sync = 1;
+    bool needs_sync = false;
     ept_entry_t old_entry = { .epte = 0 };
     ept_entry_t new_entry = { .epte = 0 };
     struct ept_data *ept = &p2m->ept;
@@ -1007,7 +1008,7 @@ static mfn_t cf_check ept_get_entry(
     ept_entry_t *ept_entry;
     u32 index;
     int i;
-    bool_t recalc = 0;
+    bool recalc = false;
     mfn_t mfn = INVALID_MFN;
     struct ept_data *ept = &p2m->ept;
 
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 9969eb45fa8c..9e5ad68df27c 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -522,7 +522,7 @@ decrease_reservation(struct domain *d, gfn_t gfn, unsigned int order)
 {
     unsigned long ret = 0, i, n;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    bool_t steal_for_cache;
+    bool steal_for_cache;
     long pod = 0, ram = 0;
 
     gfn_lock(p2m, gfn, order);
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index b2b14746c1c1..640a11f5647f 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -213,7 +213,7 @@ p2m_free_entry(struct p2m_domain *p2m, l1_pgentry_t *p2m_entry, int page_order)
 static int
 p2m_next_level(struct p2m_domain *p2m, void **table,
                unsigned long *gfn_remainder, unsigned long gfn, u32 shift,
-               u32 max, unsigned int level, bool_t unmap)
+               u32 max, unsigned int level, bool unmap)
 {
     l1_pgentry_t *p2m_entry, new_entry;
     void *next;
@@ -765,7 +765,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 static mfn_t cf_check
 p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
                  p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
-                 unsigned int *page_order, bool_t *sve)
+                 unsigned int *page_order, bool *sve)
 {
     mfn_t mfn;
     unsigned long gfn = gfn_x(gfn_);
@@ -774,7 +774,7 @@ p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
     l1_pgentry_t *l1e;
     unsigned int flags;
     p2m_type_t l1t;
-    bool_t recalc;
+    bool recalc;
 
     ASSERT(paging_mode_translate(p2m->domain));
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 0983bd71d9a9..fe9ccabb8702 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -39,7 +39,8 @@
 DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
 
 /* Turn on/off host superpage page table support for hap, default on. */
-bool_t __initdata opt_hap_1gb = 1, __initdata opt_hap_2mb = 1;
+bool __initdata opt_hap_1gb = true;
+bool __initdata opt_hap_2mb = true;
 boolean_param("hap_1gb", opt_hap_1gb);
 boolean_param("hap_2mb", opt_hap_2mb);
 
@@ -272,7 +273,7 @@ void p2m_unlock_and_tlb_flush(struct p2m_domain *p2m)
 
 mfn_t p2m_get_gfn_type_access(struct p2m_domain *p2m, gfn_t gfn,
                               p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
-                              unsigned int *page_order, bool_t locked)
+                              unsigned int *page_order, bool locked)
 {
     mfn_t mfn;
 
@@ -1765,10 +1766,10 @@ void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
         p2m_switch_vcpu_altp2m_by_id(v, idx);
 }
 
-bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
+bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
 {
     struct domain *d = v->domain;
-    bool_t rc = 0;
+    bool rc = false;
 
     if ( idx >= MAX_ALTP2M )
         return rc;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 34d833251b78..541c2ea9b225 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -224,7 +224,7 @@ static int paging_log_dirty_enable(struct domain *d)
     return ret;
 }
 
-static int paging_log_dirty_disable(struct domain *d, bool_t resuming)
+static int paging_log_dirty_disable(struct domain *d, bool resuming)
 {
     int ret = 1;
 
@@ -394,7 +394,7 @@ bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn)
  * clear the bitmap and stats as well. */
 static int paging_log_dirty_op(struct domain *d,
                                struct xen_domctl_shadow_op *sc,
-                               bool_t resuming)
+                               bool resuming)
 {
     int rv = 0, clean = 0, peek = 1;
     unsigned long pages = 0;
@@ -672,7 +672,7 @@ void paging_vcpu_init(struct vcpu *v)
 #if PG_log_dirty
 int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
-                  bool_t resuming)
+                  bool resuming)
 {
     int rc;
 
diff --git a/xen/arch/x86/x86_64/mmconf-fam10h.c b/xen/arch/x86/x86_64/mmconf-fam10h.c
index 36b32eb769e1..270dd97b6a31 100644
--- a/xen/arch/x86/x86_64/mmconf-fam10h.c
+++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
@@ -142,7 +142,7 @@ static void __init get_fam10h_pci_mmconf_base(void)
 void fam10h_check_enable_mmcfg(void)
 {
 	u64 val;
-	bool_t print = opt_cpu_info;
+	bool print = opt_cpu_info;
 
 	if (!(pci_probe & PCI_CHECK_ENABLE_AMD_MMCONF))
 		return;
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index 5dee20fe9ddf..b3b2da73626f 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -192,7 +192,7 @@ static const char *__init cf_check pci_mmcfg_amd_fam10h(void)
 
 static const char *__init cf_check pci_mmcfg_nvidia_mcp55(void)
 {
-    static bool_t __initdata mcp55_checked;
+    static bool __initdata mcp55_checked;
     int bus, i;
 
     static const u32 extcfg_regnum      = 0x90;
@@ -361,11 +361,11 @@ static int __init is_mmconf_reserved(
     return valid;
 }
 
-static bool_t __init pci_mmcfg_reject_broken(void)
+static bool __init pci_mmcfg_reject_broken(void)
 {
     typeof(pci_mmcfg_config[0]) *cfg;
     int i;
-    bool_t valid = 1;
+    bool valid = true;
 
     if ((pci_mmcfg_config_num == 0) ||
         (pci_mmcfg_config == NULL) ||
@@ -399,7 +399,7 @@ static bool_t __init pci_mmcfg_reject_broken(void)
 
 void __init acpi_mmcfg_init(void)
 {
-    bool_t valid = 1;
+    bool valid = true;
 
     pci_segments_init();
 
diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconfig_64.c
index 2b3085931ed3..ffdc62700dba 100644
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -175,8 +175,7 @@ void pci_mmcfg_arch_disable(unsigned int idx)
            cfg->pci_segment, cfg->start_bus_number, cfg->end_bus_number);
 }
 
-bool_t pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
-                        unsigned int *bdf)
+bool pci_mmcfg_decode(unsigned long mfn, unsigned int *seg, unsigned int *bdf)
 {
     unsigned int idx;
 
@@ -197,8 +196,7 @@ bool_t pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
     return 0;
 }
 
-bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
-                           unsigned int *bdf)
+bool pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg, unsigned int *bdf)
 {
     const unsigned long *ro_map;
 
-- 
2.30.2


