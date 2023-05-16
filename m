Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04407058EF
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 22:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535692.833640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz1Nn-0004Nl-JO; Tue, 16 May 2023 20:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535692.833640; Tue, 16 May 2023 20:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz1Nn-0004LE-Ge; Tue, 16 May 2023 20:34:55 +0000
Received: by outflank-mailman (input) for mailman id 535692;
 Tue, 16 May 2023 20:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pz1Nm-0004Ku-3A
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 20:34:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f26320-f429-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 22:34:49 +0200 (CEST)
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
X-Inumbo-ID: 18f26320-f429-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684269289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rU41Bn/uaEUy8tDCBSZtHKtf7MazUTzw7ubV5C2SHWU=;
  b=eIe0dyPTE+rE9q4UNgjmsN3pddYVpTgacO41Y0IjhpL08Mbdrj7TJben
   E1/YtH5h8sQjPTTL76VLwUxiJ1SShEdb+RNzzDez+/YwISRcatl43OYSk
   ifmL+ML8NlwKXOutefrj2Uc+DoD1gPOSlfONyp1DvC/g7v5qNIiAYEcEJ
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108033431
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:opRnCKJwaMltpXjuFE+RJZUlxSXFcZb7ZxGr2PjKsXjdYENSg2ZVy
 mMcXjiHOq2JMzH1et4lb9/goBkAu5eGndUxSANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5MHCJtx
 awidAxRQRuPmuWJzJGAUM9z05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZUNxR3E/
 TuuE2LRHyoLC97O8ha8rFHrpbDuxRj7Wd4/G+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaYi5eAsAaBq6wadcDAEwfH5
 SJf8ySD0AwQJaqQ1w+9EN9RIO2G7PqYNwLQomV1OYZ0olxB5EWfVYxX5Th/ImJgPcAFZSLlb
 SfvhO9B2HNAFCD0NPEqOupdH+xvlPG9Toq9Cpg4e/IUOvBMmBm7EDaCjKJ690TkiwASnK42I
 v93mu78XC9BWcyLINdbLtrxMIPHJAhknQs/prihlXxLNIZyg1bLIYrpyHPUMogEAFqs+W05C
 ep3OcqQ0Al4W+bjeCTR+oN7BQlUfSRhW8mm9pUMLbXrzu9a9IcJUaS5LVQJKuRYc1l9zL+Ur
 hlRpGcCoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQRALpc4FB6OdzHxP5GJ/MKkUwPqLQLIQhcE
 6NUJK1tw51nFlz6xtjqRcOm9dIyK0vx3lrm0ujMSGFXQqOMjjfhorfMFjYDPgFXZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:+hchpqq6xt1dW6RL6YQECt0aV5oYeYIsimQD101hICG8Sqej5q
 STdZUgpH3JYVMqMxsdcL+7VZVoPkmsjKKdjbN8AV7AZniEhILLFuBfBOLZqlXd8kvFmdK1vp
 0BT0ERMrPN5X8Qt7ee3OGCeOxQp+VuycuT9IHjJn5WPHlXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3Axoa9+GikCCxW4/pkltWSaXrSljJuSWCe70eAGRO?=
 =?us-ascii?q?EVUliRKCSdlOzw7lCjJ87?=
X-Talos-MUID: 9a23:Yye6+QraAMkBCQFkTogezyxZJfhqsp+CMR4u1rZZmpG/NS0sFjjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="108033431"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH RFC] xen: Enable -Wwrite-strings
Date: Tue, 16 May 2023 21:34:28 +0100
Message-ID: <20230516203428.1441365-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Following on from the MISRA discussions.

On x86, most are trivial.  The two slightly suspect cases are __hvm_copy()
where constness is dependent on flags, and kextra in __start_xen() which only
compiles because of laundering the pointer through strstr().

The one case which I can't figure out how to fix is EFI:

  In file included from arch/x86/efi/boot.c:700:
  arch/x86/efi/efi-boot.h: In function ‘efi_arch_handle_cmdline’:
  arch/x86/efi/efi-boot.h:327:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
    327 |         name.s = "xen";
        |                ^
  cc1: all warnings being treated as errors

Why do we have something that looks like this ?

  union string {
      CHAR16 *w;
      char *s;
      const char *cs;
  };

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/Makefile                           |  2 ++
 xen/arch/x86/acpi/cpu_idle.c           |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          |  2 +-
 xen/arch/x86/cpu/mcheck/mce.h          |  2 +-
 xen/arch/x86/dom0_build.c              |  2 +-
 xen/arch/x86/e820.c                    |  2 +-
 xen/arch/x86/hvm/dom0_build.c          |  4 ++--
 xen/arch/x86/hvm/hvm.c                 |  8 ++++----
 xen/arch/x86/hvm/vmx/vmcs.c            |  4 ++--
 xen/arch/x86/include/asm/dom0_build.h  |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 +-
 xen/arch/x86/include/asm/hvm/support.h |  4 ++--
 xen/arch/x86/include/asm/setup.h       |  2 +-
 xen/arch/x86/oprofile/nmi_int.c        |  8 ++++----
 xen/arch/x86/pv/dom0_build.c           |  2 +-
 xen/arch/x86/setup.c                   |  9 +++++----
 xen/arch/x86/time.c                    |  4 ++--
 xen/common/gunzip.c                    |  2 +-
 xen/common/ioreq.c                     |  3 ++-
 xen/common/libelf/libelf-dominfo.c     |  2 +-
 xen/drivers/acpi/tables.c              |  6 +++---
 xen/drivers/acpi/tables/tbfadt.c       |  2 +-
 xen/drivers/acpi/tables/tbutils.c      |  2 +-
 xen/drivers/acpi/tables/tbxface.c      |  2 +-
 xen/drivers/acpi/utilities/utmisc.c    |  6 +++---
 xen/include/acpi/actables.h            |  2 +-
 xen/include/acpi/actypes.h             |  2 +-
 xen/include/acpi/acutils.h             | 12 ++++++------
 xen/include/xen/acpi.h                 |  6 +++---
 xen/include/xen/dmi.h                  |  4 ++--
 30 files changed, 59 insertions(+), 55 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e89fc461fc4b..f5593f992147 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -384,6 +384,8 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+CFLAGS += -Wwrite-strings
+
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 427c8c89c5c4..cfce4cc0408f 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -302,7 +302,7 @@ static void print_hw_residencies(uint32_t cpu)
            hw_res.cc6, hw_res.cc7);
 }
 
-static char* acpi_cstate_method_name[] =
+static const char *const acpi_cstate_method_name[] =
 {
     "NONE",
     "SYSIO",
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 3e93bdd8dab4..1144a91aa444 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1706,7 +1706,7 @@ static void mc_panic_dump(void)
     dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumpped);
 }
 
-void mc_panic(char *s)
+void mc_panic(const char *s)
 {
     is_mc_panic = true;
     console_force_unlock();
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index bea08bdc7464..4046e5123268 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -58,7 +58,7 @@ struct mcinfo_extended *intel_get_extended_msrs(
 bool mce_available(const struct cpuinfo_x86 *c);
 unsigned int mce_firstbank(struct cpuinfo_x86 *c);
 /* Helper functions used for collecting error telemetry */
-void noreturn mc_panic(char *s);
+void noreturn mc_panic(const char *s);
 void x86_mc_get_cpu_info(unsigned, uint32_t *, uint16_t *, uint16_t *,
                          uint32_t *, uint32_t *, uint32_t *, uint32_t *);
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 79234f18ff01..ac252adac706 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -576,7 +576,7 @@ int __init dom0_setup_permissions(struct domain *d)
 
 int __init construct_dom0(struct domain *d, const module_t *image,
                           unsigned long image_headroom, module_t *initrd,
-                          char *cmdline)
+                          const char *cmdline)
 {
     int rc;
 
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index c5911cf48dc4..0b89935510ae 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -363,7 +363,7 @@ static unsigned long __init find_max_pfn(void)
     return max_pfn;
 }
 
-static void __init clip_to_limit(uint64_t limit, char *warnmsg)
+static void __init clip_to_limit(uint64_t limit, const char *warnmsg)
 {
     unsigned int i;
     char _warnmsg[160];
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc62..a7ae9c3b046e 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -532,7 +532,7 @@ static paddr_t __init find_memory(
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
-                                  char *cmdline, paddr_t *entry,
+                                  const char *cmdline, paddr_t *entry,
                                   paddr_t *start_info_addr)
 {
     void *image_start = image_base + image_headroom;
@@ -1177,7 +1177,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
 int __init dom0_construct_pvh(struct domain *d, const module_t *image,
                               unsigned long image_headroom,
                               module_t *initrd,
-                              char *cmdline)
+                              const char *cmdline)
 {
     paddr_t entry, start_info;
     int rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d7d31b53937a..709d08768f71 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3398,9 +3398,9 @@ static enum hvm_translation_result __hvm_copy(
 }
 
 enum hvm_translation_result hvm_copy_to_guest_phys(
-    paddr_t paddr, void *buf, unsigned int size, struct vcpu *v)
+    paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
 {
-    return __hvm_copy(buf, paddr, size, v,
+    return __hvm_copy((void *)buf /* to_guest doesn't modify */, paddr, size, v,
                       HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
 }
 
@@ -3412,10 +3412,10 @@ enum hvm_translation_result hvm_copy_from_guest_phys(
 }
 
 enum hvm_translation_result hvm_copy_to_guest_linear(
-    unsigned long addr, void *buf, unsigned int size, uint32_t pfec,
+    unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo)
 {
-    return __hvm_copy(buf, addr, size, current,
+    return __hvm_copy((void *)buf, addr, size, current,
                       HVMCOPY_to_guest | HVMCOPY_linear,
                       PFEC_page_present | PFEC_write_access | pfec, pfinfo);
 }
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index b2095636250c..13719cc923d9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1949,7 +1949,7 @@ static inline unsigned long vmr(unsigned long field)
     (uint32_t)vmr(fld);                       \
 })
 
-static void vmx_dump_sel(char *name, uint32_t selector)
+static void vmx_dump_sel(const char *name, uint32_t selector)
 {
     uint32_t sel, attr, limit;
     uint64_t base;
@@ -1960,7 +1960,7 @@ static void vmx_dump_sel(char *name, uint32_t selector)
     printk("%s: %04x %05x %08x %016"PRIx64"\n", name, sel, attr, limit, base);
 }
 
-static void vmx_dump_sel2(char *name, uint32_t lim)
+static void vmx_dump_sel2(const char *name, uint32_t lim)
 {
     uint32_t limit;
     uint64_t base;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index a5f8c9e67f68..107c1ff98367 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -16,12 +16,12 @@ int dom0_setup_permissions(struct domain *d);
 int dom0_construct_pv(struct domain *d, const module_t *image,
                       unsigned long image_headroom,
                       module_t *initrd,
-                      char *cmdline);
+                      const char *cmdline);
 
 int dom0_construct_pvh(struct domain *d, const module_t *image,
                        unsigned long image_headroom,
                        module_t *initrd,
-                       char *cmdline);
+                       const char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 04cbd4ff24bd..169af541b720 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -92,7 +92,7 @@ struct hvm_vcpu_nonreg_state {
  * supports Intel's VT-x and AMD's SVM extensions.
  */
 struct hvm_function_table {
-    char *name;
+    const char *name;
 
     /* Support Hardware-Assisted Paging? */
     bool_t hap_supported;
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 8d4707e58c9c..142e5985642d 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -59,7 +59,7 @@ enum hvm_translation_result {
  * address range does not map entirely onto ordinary machine memory.
  */
 enum hvm_translation_result hvm_copy_to_guest_phys(
-    paddr_t paddr, void *buf, unsigned int size, struct vcpu *v);
+    paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v);
 enum hvm_translation_result hvm_copy_from_guest_phys(
     void *buf, paddr_t paddr, unsigned int size);
 
@@ -85,7 +85,7 @@ typedef struct pagefault_info
 } pagefault_info_t;
 
 enum hvm_translation_result hvm_copy_to_guest_linear(
-    unsigned long addr, void *buf, unsigned int size, uint32_t pfec,
+    unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo);
 enum hvm_translation_result hvm_copy_from_guest_linear(
     void *buf, unsigned long addr, unsigned int size, uint32_t pfec,
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ae0dd3915a61..51fce66607dc 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -35,7 +35,7 @@ int construct_dom0(
     struct domain *d,
     const module_t *kernel, unsigned long kernel_headroom,
     module_t *initrd,
-    char *cmdline);
+    const char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 17bf3135f86f..faf75106f747 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -36,7 +36,7 @@ struct op_x86_model_spec const *__read_mostly model;
 static struct op_msrs cpu_msrs[NR_CPUS];
 static unsigned long saved_lvtpc[NR_CPUS];
 
-static char *cpu_type;
+static const char *cpu_type;
 
 static DEFINE_PER_CPU(struct vcpu *, nmi_cont_vcpu);
 
@@ -309,7 +309,7 @@ void nmi_stop(void)
 }
 
 
-static int __init p4_init(char ** cpu_type)
+static int __init p4_init(const char ** cpu_type)
 {
 	unsigned int cpu_model = current_cpu_data.x86_model;
 
@@ -353,7 +353,7 @@ static int __init cf_check force_cpu_type(const char *str)
 }
 custom_param("cpu_type", force_cpu_type);
 
-static int __init ppro_init(char ** cpu_type)
+static int __init ppro_init(const char ** cpu_type)
 {
 	if (force_arch_perfmon && cpu_has_arch_perfmon)
 		return 0;
@@ -375,7 +375,7 @@ static int __init ppro_init(char ** cpu_type)
 	return 1;
 }
 
-static int __init arch_perfmon_init(char **cpu_type)
+static int __init arch_perfmon_init(const char **cpu_type)
 {
 	if (!cpu_has_arch_perfmon)
 		return 0;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c99135a5522f..909ee9a899a4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -358,7 +358,7 @@ int __init dom0_construct_pv(struct domain *d,
                              const module_t *image,
                              unsigned long image_headroom,
                              module_t *initrd,
-                             char *cmdline)
+                             const char *cmdline)
 {
     int i, rc, order, machine;
     bool compatible, compat;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4dce..b77f86e75b3d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -835,7 +835,7 @@ static bool __init loader_is_grub2(const char *loader_name)
     return (p != NULL) && (p[5] != '0');
 }
 
-static char * __init cmdline_cook(char *p, const char *loader_name)
+static const char * __init cmdline_cook(const char *p, const char *loader_name)
 {
     p = p ? : "";
 
@@ -883,7 +883,7 @@ static struct domain *__init create_dom0(const module_t *image,
         },
     };
     struct domain *d;
-    char *cmdline;
+    const char *cmdline;
     domid_t domid;
 
     if ( opt_dom0_pvh )
@@ -968,8 +968,9 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
-    char *memmap_type = NULL;
-    char *cmdline, *kextra, *loader;
+    const char *memmap_type = NULL;
+    const char *cmdline, *loader;
+    char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index bc75e1ae7d42..290ddb7e6f81 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -64,8 +64,8 @@ struct cpu_time {
 };
 
 struct platform_timesource {
-    char *id;
-    char *name;
+    const char *id;
+    const char *name;
     u64 frequency;
     /* Post-init this hook may only be invoked via the read_counter() wrapper! */
     u64 (*read_counter)(void);
diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index 71ec5f26bea0..f3d0250ff2fd 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -52,7 +52,7 @@ typedef unsigned long   ulg;
 static long __initdata bytes_out;
 static void flush_window(void);
 
-static __init void error(char *x)
+static __init void error(const char *x)
 {
     panic("%s\n", x);
 }
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ecb8f545e1c4..7cb717f7a2a4 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -501,7 +501,8 @@ static int ioreq_server_alloc_rangesets(struct ioreq_server *s,
 
     for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
     {
-        char *name, *type;
+        const char *type;
+        char *name;
 
         switch ( i )
         {
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index e5644f6c7fa6..3ca1c3530ef1 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -100,7 +100,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
 {
 /* *INDENT-OFF* */
     static const struct {
-        char *name;
+        const char *name;
         bool str;
     } note_desc[] = {
         [XEN_ELFNOTE_ENTRY] = { "ENTRY", 0},
diff --git a/xen/drivers/acpi/tables.c b/xen/drivers/acpi/tables.c
index 96ff96b84c66..20aed8929b86 100644
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -300,7 +300,7 @@ acpi_table_get_entry_madt(enum acpi_madt_type entry_id,
 }
 
 int __init
-acpi_parse_entries(char *id, unsigned long table_size,
+acpi_parse_entries(const char *id, unsigned long table_size,
 		   acpi_table_entry_handler handler,
 		   struct acpi_table_header *table_header,
 		   int entry_id, unsigned int max_entries)
@@ -359,7 +359,7 @@ acpi_parse_entries(char *id, unsigned long table_size,
 }
 
 int __init
-acpi_table_parse_entries(char *id,
+acpi_table_parse_entries(const char *id,
 			 unsigned long table_size,
 			 int entry_id,
 			 acpi_table_entry_handler handler,
@@ -405,7 +405,7 @@ acpi_table_parse_madt(enum acpi_madt_type id,
  * Scan the ACPI System Descriptor Table (STD) for a table matching @id,
  * run @handler on it.
  */
-int __init acpi_table_parse(char *id, acpi_table_handler handler)
+int __init acpi_table_parse(const char *id, acpi_table_handler handler)
 {
 	struct acpi_table_header *table = NULL;
 
diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
index d8fcc50deca5..a03836e0dc8a 100644
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -60,7 +60,7 @@ static void acpi_tb_validate_fadt(void);
 /* Table for conversion of FADT to common internal format and FADT validation */
 
 typedef struct acpi_fadt_info {
-	char *name;
+	const char *name;
 	u16 target;
 	u16 source;
 	u16 length;
diff --git a/xen/drivers/acpi/tables/tbutils.c b/xen/drivers/acpi/tables/tbutils.c
index 11412c47deb4..458989abea99 100644
--- a/xen/drivers/acpi/tables/tbutils.c
+++ b/xen/drivers/acpi/tables/tbutils.c
@@ -243,7 +243,7 @@ u8 acpi_tb_checksum(u8 * buffer, acpi_native_uint length)
 
 void __init
 acpi_tb_install_table(acpi_physical_address address,
-		      u8 flags, char *signature, acpi_native_uint table_index)
+		      u8 flags, const char *signature, acpi_native_uint table_index)
 {
 	struct acpi_table_header *table;
 
diff --git a/xen/drivers/acpi/tables/tbxface.c b/xen/drivers/acpi/tables/tbxface.c
index 21b2e5eae1c7..ae66ce2db0d5 100644
--- a/xen/drivers/acpi/tables/tbxface.c
+++ b/xen/drivers/acpi/tables/tbxface.c
@@ -164,7 +164,7 @@ acpi_initialize_tables(struct acpi_table_desc * initial_table_array,
  *
  *****************************************************************************/
 acpi_status __init
-acpi_get_table(char *signature,
+acpi_get_table(const char *signature,
 	       acpi_native_uint instance, struct acpi_table_header **out_table)
 {
 	acpi_native_uint i;
diff --git a/xen/drivers/acpi/utilities/utmisc.c b/xen/drivers/acpi/utilities/utmisc.c
index 4e1497ad0fae..ee22c83e3842 100644
--- a/xen/drivers/acpi/utilities/utmisc.c
+++ b/xen/drivers/acpi/utilities/utmisc.c
@@ -134,7 +134,7 @@ const char *__init acpi_ut_validate_exception(acpi_status status)
  ******************************************************************************/
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_error(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_error(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
@@ -147,7 +147,7 @@ acpi_ut_error(const char *module_name, u32 line_number, char *format, ...)
 }
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_warning(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_warning(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
@@ -161,7 +161,7 @@ acpi_ut_warning(const char *module_name, u32 line_number, char *format, ...)
 }
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_info(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_info(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
diff --git a/xen/include/acpi/actables.h b/xen/include/acpi/actables.h
index d4cad35f41c0..527e1c9f9b9d 100644
--- a/xen/include/acpi/actables.h
+++ b/xen/include/acpi/actables.h
@@ -99,7 +99,7 @@ acpi_tb_verify_checksum(struct acpi_table_header *table, u32 length);
 
 void
 acpi_tb_install_table(acpi_physical_address address,
-		      u8 flags, char *signature, acpi_native_uint table_index);
+		      u8 flags, const char *signature, acpi_native_uint table_index);
 
 acpi_status
 acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags);
diff --git a/xen/include/acpi/actypes.h b/xen/include/acpi/actypes.h
index f3e95abc3ab3..a237216903fd 100644
--- a/xen/include/acpi/actypes.h
+++ b/xen/include/acpi/actypes.h
@@ -281,7 +281,7 @@ typedef acpi_native_uint acpi_size;
  */
 typedef u32 acpi_status;	/* All ACPI Exceptions */
 typedef u32 acpi_name;		/* 4-byte ACPI name */
-typedef char *acpi_string;	/* Null terminated ASCII string */
+typedef const char *acpi_string;	/* Null terminated ASCII string */
 typedef void *acpi_handle;	/* Actually a ptr to a NS Node */
 
 struct uint64_struct {
diff --git a/xen/include/acpi/acutils.h b/xen/include/acpi/acutils.h
index b1b0df758bd6..ac54adaa8c23 100644
--- a/xen/include/acpi/acutils.h
+++ b/xen/include/acpi/acutils.h
@@ -164,7 +164,7 @@ acpi_ut_debug_print(u32 requested_debug_level,
 		    u32 line_number,
 		    const char *function_name,
 		    const char *module_name,
-		    u32 component_id, char *format, ...) ACPI_PRINTF_LIKE(6);
+		    u32 component_id, const char *format, ...) ACPI_PRINTF_LIKE(6);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_debug_print_raw(u32 requested_debug_level,
@@ -172,24 +172,24 @@ acpi_ut_debug_print_raw(u32 requested_debug_level,
 			const char *function_name,
 			const char *module_name,
 			u32 component_id,
-			char *format, ...) ACPI_PRINTF_LIKE(6);
+			const char *format, ...) ACPI_PRINTF_LIKE(6);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_error(const char *module_name,
-	      u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+	      u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_exception(const char *module_name,
 		  u32 line_number,
-		  acpi_status status, char *format, ...) ACPI_PRINTF_LIKE(4);
+		  acpi_status status, const char *format, ...) ACPI_PRINTF_LIKE(4);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_warning(const char *module_name,
-		u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+		u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_info(const char *module_name,
-	     u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+	     u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 /*
  * utmisc
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 352f27f6a723..8ec95791726e 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -81,12 +81,12 @@ int erst_init(void);
 void acpi_hest_init(void);
 
 int acpi_table_init (void);
-int acpi_table_parse(char *id, acpi_table_handler handler);
-int acpi_parse_entries(char *id, unsigned long table_size,
+int acpi_table_parse(const char *id, acpi_table_handler handler);
+int acpi_parse_entries(const char *id, unsigned long table_size,
 		       acpi_table_entry_handler handler,
 		       struct acpi_table_header *table_header,
 		       int entry_id, unsigned int max_entries);
-int acpi_table_parse_entries(char *id, unsigned long table_size,
+int acpi_table_parse_entries(const char *id, unsigned long table_size,
 	int entry_id, acpi_table_entry_handler handler, unsigned int max_entries);
 struct acpi_subtable_header *acpi_table_get_entry_madt(enum acpi_madt_type id,
 						      unsigned int entry_index);
diff --git a/xen/include/xen/dmi.h b/xen/include/xen/dmi.h
index fa25f6cd3816..71a5c46dc6ea 100644
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -20,12 +20,12 @@ enum dmi_field {
  */
 struct dmi_strmatch {
 	u8 slot;
-	char *substr;
+	const char *substr;
 };
 
 struct dmi_system_id {
 	int (*callback)(const struct dmi_system_id *);
-	char *ident;
+	const char *ident;
 	struct dmi_strmatch matches[4];
 	void *driver_data;
 };
-- 
2.30.2


