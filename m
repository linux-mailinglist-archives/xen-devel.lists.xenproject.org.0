Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78D7504D4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562261.878922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDo-0004Pe-M3; Wed, 12 Jul 2023 10:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562261.878922; Wed, 12 Jul 2023 10:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDo-0004L0-DQ; Wed, 12 Jul 2023 10:37:24 +0000
Received: by outflank-mailman (input) for mailman id 562261;
 Wed, 12 Jul 2023 10:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAY-0006Dd-Oc
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:34:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d4106b1-209f-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:34:00 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 413254EE0C89;
 Wed, 12 Jul 2023 12:33:59 +0200 (CEST)
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
X-Inumbo-ID: 9d4106b1-209f-11ee-b239-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 12/15] xen/x86: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:13 +0200
Message-Id: <78717a3ccee0517eab915156fc474394ae1dcf81.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following changes are made:
- add the 'U' suffix to all first macro's arguments in 'mce-apei.c'
- add the 'U' suffix to switch cases in 'cpuid.c'
- add 'U' suffixes to 'mask16' in 'stdvga.c'
- add the 'U' suffix to macros in 'pci.h'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
Changes in v3:
- change 'Signed-off-by' ordering
- change commit message
- add 'UL' in 'extable.c'
- fix indentation in 'cpu-policy.c'
- remove excessive suffixes in 'mce-apei.c'
- add 'UL' in 'x86-defns.h'
- remove changes to 'sr_mask' and 'gr_mask' in 'stdvga.c'
- move 'viridian.c' and 'hyperv-tlfs.h' in a separate commit

Changes in v2:
- minor change to commit title
- change commit message
- remove comments from 'gr_mask' in 'stdvga.c'
- correct code style in 'trace.h'
- add fix in 'extable.c'
- remove changes in 'x86-defns.h', 'msr-index.h' and 'xen-x86_64.h'
---
 xen/arch/x86/apic.c                    |   2 +-
 xen/arch/x86/cpu-policy.c              |  18 +--
 xen/arch/x86/cpu/mcheck/mce-apei.c     |   4 +-
 xen/arch/x86/cpuid.c                   |   8 +-
 xen/arch/x86/efi/efi-boot.h            |   6 +-
 xen/arch/x86/extable.c                 |   2 +-
 xen/arch/x86/hvm/hypercall.c           |   2 +-
 xen/arch/x86/hvm/irq.c                 |   2 +-
 xen/arch/x86/hvm/pmtimer.c             |   4 +-
 xen/arch/x86/hvm/stdvga.c              |  50 +++---
 xen/arch/x86/hvm/vlapic.c              |   6 +-
 xen/arch/x86/include/asm/apicdef.h     |   2 +-
 xen/arch/x86/include/asm/config.h      |   2 +-
 xen/arch/x86/include/asm/hpet.h        |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h   |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h |   2 +-
 xen/arch/x86/include/asm/msi.h         |   2 +-
 xen/arch/x86/include/asm/msr-index.h   | 202 ++++++++++++-------------
 xen/arch/x86/include/asm/pci.h         |   8 +-
 xen/arch/x86/include/asm/x86-defns.h   |   2 +-
 xen/arch/x86/percpu.c                  |   2 +-
 xen/arch/x86/psr.c                     |   2 +-
 xen/arch/x86/spec_ctrl.c               |   8 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c       |   2 +-
 xen/arch/x86/x86_64/pci.c              |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h |   2 +-
 xen/lib/x86/cpuid.c                    |   8 +-
 xen/lib/x86/policy.c                   |   2 +-
 28 files changed, 179 insertions(+), 179 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f71474d47d..03c5c0f2ee 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
      * Setup the APIC counter to maximum. There is no way the lapic
      * can underflow in the 100ms detection time frame.
      */
-    __setup_APIC_LVTT(0xffffffff);
+    __setup_APIC_LVTT(0xffffffffU);
 
     bus_freq = calibrate_apic_timer();
     if ( !bus_freq )
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index f40eeb8be8..5977e21a07 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -321,7 +321,7 @@ static void recalculate_misc(struct cpu_policy *p)
         p->extd.vendor_edx = p->basic.vendor_edx;
 
         p->extd.raw_fms = p->basic.raw_fms;
-        p->extd.raw[0x1].b &= 0xff00ffff;
+        p->extd.raw[0x1].b &= 0xff00ffffU;
         p->extd.e1d |= p->basic._1d & CPUID_COMMON_1D_FEATURES;
 
         p->extd.raw[0x8].a &= 0x0000ffff; /* GuestMaxPhysAddr hidden. */
@@ -378,10 +378,10 @@ static void __init calculate_host_policy(void)
      * this information.
      */
     if ( cpu_has_lfence_dispatch )
-        max_extd_leaf = max(max_extd_leaf, 0x80000021);
+        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
 
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
+    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf & 0xffffU,
+                                           ARRAY_SIZE(p->extd.raw) - 1);
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
@@ -768,11 +768,11 @@ void recalculate_cpuid_policy(struct domain *d)
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
-    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
-                                           ((p->x86_vendor & (X86_VENDOR_AMD |
-                                                              X86_VENDOR_HYGON))
-                                            ? CPUID_GUEST_NR_EXTD_AMD
-                                            : CPUID_GUEST_NR_EXTD_INTEL) - 1);
+    p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
+                                            ((p->x86_vendor & (X86_VENDOR_AMD |
+                                                               X86_VENDOR_HYGON))
+                                             ? CPUID_GUEST_NR_EXTD_AMD
+                                             : CPUID_GUEST_NR_EXTD_INTEL) - 1);
 
     x86_cpu_policy_to_featureset(p, fs);
     x86_cpu_policy_to_featureset(max, max_fs);
diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
index 53b6735896..b895020882 100644
--- a/xen/arch/x86/cpu/mcheck/mce-apei.c
+++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
@@ -37,10 +37,10 @@
 #include "mce.h"
 
 #define CPER_CREATOR_MCE						\
-	UUID_LE(0x75a574e3, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,	\
+	UUID_LE(0x75a574e3U, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,	\
 		0x64, 0x90, 0xb8, 0x9d)
 #define CPER_SECTION_TYPE_MCE						\
-	UUID_LE(0xfe08ffbe, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,	\
+	UUID_LE(0xfe08ffbeU, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,	\
 		0x04, 0x4a, 0x38, 0xfc)
 
 /*
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd..7290a979c6 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -93,7 +93,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         }
         break;
 
-    case 0x40000000 ... 0x400000ff:
+    case 0x40000000U ... 0x400000ffU:
         if ( is_viridian_domain(d) )
             return cpuid_viridian_leaves(v, leaf, subleaf, res);
 
@@ -103,10 +103,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
          * Intel reserve up until 0x4fffffff for hypervisor use.  AMD reserve
          * only until 0x400000ff, but we already use double that.
          */
-    case 0x40000100 ... 0x400001ff:
+    case 0x40000100U ... 0x400001ffU:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    case 0x80000000U ... 0x80000000U + CPUID_GUEST_NR_EXTD - 1:
         ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
         if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                      ARRAY_SIZE(p->extd.raw) - 1) )
@@ -352,7 +352,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         }
         break;
 
-    case 0x80000001:
+    case 0x80000001U:
         /* SYSCALL is hidden outside of long mode on Intel. */
         if ( p->x86_vendor == X86_VENDOR_INTEL &&
              is_hvm_domain(d) && !hvm_long_mode_active(v) )
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 92f4cfe8bd..eebc54180b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -740,16 +740,16 @@ static void __init efi_arch_handle_module(const struct file *file,
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000);
+    uint32_t eax = cpuid_eax(0x80000000U);
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
     caps[FEATURESET_1c] = cpuid_ecx(1);
 
-    if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
+    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
     {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
+        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
 
         /*
          * This check purposefully doesn't use cpu_has_nx because
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index c3771c2e39..0e8694c188 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -141,7 +141,7 @@ static int __init cf_check stub_selftest(void)
           .rax = 0x0123456789abcdef,
           .res.fields.trapnr = X86_EXC_GP },
         { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
-          .rax = 0xfedcba9876543210,
+          .rax = 0xfedcba9876543210UL,
           .res.fields.trapnr = X86_EXC_SS },
         { .opc = { endbr64, 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
           .res.fields.trapnr = X86_EXC_BP },
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 20d266ffd5..eeb73e1aa5 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -129,7 +129,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         break;
     }
 
-    if ( (eax & 0x80000000) && is_viridian_domain(currd) )
+    if ( (eax & 0x80000000U) && is_viridian_domain(currd) )
     {
         int ret;
 
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 1258371eb0..5c00127cfc 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 
     if ( !vector )
     {
-        int pirq = ((addr >> 32) & 0xffffff00) | dest;
+        int pirq = ((addr >> 32) & 0xffffff00U) | dest;
 
         if ( pirq > 0 )
         {
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 2145c531b6..eb4a455763 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -40,8 +40,8 @@
 #define SCI_IRQ 9
 
 /* We provide a 32-bit counter (must match the TMR_VAL_EXT bit in the FADT) */
-#define TMR_VAL_MASK  (0xffffffff)
-#define TMR_VAL_MSB   (0x80000000)
+#define TMR_VAL_MASK  (0xffffffffU)
+#define TMR_VAL_MSB   (0x80000000U)
 
 /* Dispatch SCIs based on the PM1a_STS and PM1a_EN registers */
 static void pmt_update_sci(PMTState *s)
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 798a9a0549..d3dfb9b689 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -39,22 +39,22 @@
 
 #define PAT(x) (x)
 static const uint32_t mask16[16] = {
-    PAT(0x00000000),
-    PAT(0x000000ff),
-    PAT(0x0000ff00),
-    PAT(0x0000ffff),
-    PAT(0x00ff0000),
-    PAT(0x00ff00ff),
-    PAT(0x00ffff00),
-    PAT(0x00ffffff),
-    PAT(0xff000000),
-    PAT(0xff0000ff),
-    PAT(0xff00ff00),
-    PAT(0xff00ffff),
-    PAT(0xffff0000),
-    PAT(0xffff00ff),
-    PAT(0xffffff00),
-    PAT(0xffffffff),
+    PAT(0x00000000U),
+    PAT(0x000000ffU),
+    PAT(0x0000ff00U),
+    PAT(0x0000ffffU),
+    PAT(0x00ff0000U),
+    PAT(0x00ff00ffU),
+    PAT(0x00ffff00U),
+    PAT(0x00ffffffU),
+    PAT(0xff000000U),
+    PAT(0xff0000ffU),
+    PAT(0xff00ff00U),
+    PAT(0xff00ffffU),
+    PAT(0xffff0000U),
+    PAT(0xffff00ffU),
+    PAT(0xffffff00U),
+    PAT(0xffffffffU),
 };
 
 /* force some bits to zero */
@@ -70,15 +70,15 @@ static const uint8_t sr_mask[8] = {
 };
 
 static const uint8_t gr_mask[9] = {
-    (uint8_t)~0xf0, /* 0x00 */
-    (uint8_t)~0xf0, /* 0x01 */
-    (uint8_t)~0xf0, /* 0x02 */
-    (uint8_t)~0xe0, /* 0x03 */
-    (uint8_t)~0xfc, /* 0x04 */
-    (uint8_t)~0x84, /* 0x05 */
-    (uint8_t)~0xf0, /* 0x06 */
-    (uint8_t)~0xf0, /* 0x07 */
-    (uint8_t)~0x00, /* 0x08 */
+    (uint8_t)~0xf0,
+    (uint8_t)~0xf0,
+    (uint8_t)~0xf0,
+    (uint8_t)~0xe0,
+    (uint8_t)~0xfc,
+    (uint8_t)~0x84,
+    (uint8_t)~0xf0,
+    (uint8_t)~0xf0,
+    (uint8_t)~0x00,
 };
 
 static uint8_t *vram_getb(struct hvm_hw_stdvga *s, unsigned int a)
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index c7ce82d064..a8e87c4446 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -237,7 +237,7 @@ bool_t vlapic_match_dest(
     case APIC_DEST_NOSHORT:
         if ( dest_mode )
             return vlapic_match_logical_addr(target, dest);
-        return (dest == _VLAPIC_ID(target, 0xffffffff)) ||
+        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
                (dest == VLAPIC_ID(target));
 
     case APIC_DEST_SELF:
@@ -467,7 +467,7 @@ static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
         return short_hand != APIC_DEST_SELF;
 
     if ( vlapic_x2apic_mode(vlapic) )
-        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffff;
+        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffffU;
 
     if ( dest_mode )
         return hweight8(dest &
@@ -831,7 +831,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         break;
 
     case APIC_ICR2:
-        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000);
+        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
         break;
 
     case APIC_LVTT:         /* LVT Timer Reg */
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 2440d83c8d..7f21d3f49c 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -8,7 +8,7 @@
  * Ingo Molnar <mingo@redhat.com>, 1999, 2000
  */
 
-#define		APIC_DEFAULT_PHYS_BASE	0xfee00000
+#define		APIC_DEFAULT_PHYS_BASE	0xfee00000U
  
 #define		APIC_ID		0x20
 #define			APIC_ID_MASK		(0xFFu<<24)
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index fbc4bb3416..bbced338be 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -257,7 +257,7 @@ extern unsigned char boot_edid_info[128];
 #endif /* CONFIG_PV32 */
 
 #define MACH2PHYS_COMPAT_VIRT_START    HYPERVISOR_COMPAT_VIRT_START
-#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000
+#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000U
 #define MACH2PHYS_COMPAT_NR_ENTRIES(d) \
     ((MACH2PHYS_COMPAT_VIRT_END-MACH2PHYS_COMPAT_VIRT_START(d))>>2)
 
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index 9919f74730..c5e8e9c8db 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -41,7 +41,7 @@
 #define HPET_TN_ROUTE		0x3e00
 #define HPET_TN_FSB		0x4000
 #define HPET_TN_FSB_CAP		0x8000
-#define HPET_TN_RESERVED	0xffff0081
+#define HPET_TN_RESERVED	0xffff0081U
 #define HPET_TN_INT_ROUTE_CAP	(0xffffffffULL << 32)
 
 
diff --git a/xen/arch/x86/include/asm/hvm/trace.h b/xen/arch/x86/include/asm/hvm/trace.h
index 696e42eb94..0437966d1f 100644
--- a/xen/arch/x86/include/asm/hvm/trace.h
+++ b/xen/arch/x86/include/asm/hvm/trace.h
@@ -58,7 +58,7 @@
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
 
 
-#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
+#define TRC_PAR_LONG(par) ((par) & 0xFFFFFFFFU), ((par) >> 32)
 
 #define TRACE_2_LONG_2D(_e, d1, d2, ...) \
     TRACE_4D(_e, d1, d2)
@@ -93,7 +93,7 @@
     HVMTRACE_ND(evt, 0, 0)
 
 #define HVMTRACE_LONG_1D(evt, d1)                  \
-                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
+                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFFU, (d1) >> 32)
 #define HVMTRACE_LONG_2D(evt, d1, d2, ...)              \
                    HVMTRACE_3D(evt ## 64, d1, d2)
 #define HVMTRACE_LONG_3D(evt, d1, d2, d3, ...)      \
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 2944ec20dd..68af6dce79 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -32,7 +32,7 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
 
-#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000
+#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
 
 /* Direct registers. */
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9..d89723d009 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -37,7 +37,7 @@
  */
 
 #define MSI_ADDR_BASE_HI            0
-#define MSI_ADDR_BASE_LO            0xfee00000
+#define MSI_ADDR_BASE_LO            0xfee00000U
 #define MSI_ADDR_BASE_MASK          (~0xfffff)
 #define MSI_ADDR_HEADER             MSI_ADDR_BASE_LO
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 4f861c0bb4..69ca8677c0 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -30,7 +30,7 @@
 
 #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
 #define  MSR_CTC_THREAD_MASK                0x0000ffff
-#define  MSR_CTC_CORE_MASK                  0xffff0000
+#define  MSR_CTC_CORE_MASK                  0xffff0000U
 
 #define MSR_SPEC_CTRL                       0x00000048
 #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
@@ -181,35 +181,35 @@
     (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
      EFER_AIBRSE)
 
-#define MSR_STAR                            0xc0000081 /* legacy mode SYSCALL target */
-#define MSR_LSTAR                           0xc0000082 /* long mode SYSCALL target */
-#define MSR_CSTAR                           0xc0000083 /* compat mode SYSCALL target */
-#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS mask for syscall */
-#define MSR_FS_BASE                         0xc0000100 /* 64bit FS base */
-#define MSR_GS_BASE                         0xc0000101 /* 64bit GS base */
-#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS GS shadow */
-#define MSR_TSC_AUX                         0xc0000103 /* Auxiliary TSC */
+#define MSR_STAR                            0xc0000081U /* legacy mode SYSCALL target */
+#define MSR_LSTAR                           0xc0000082U /* long mode SYSCALL target */
+#define MSR_CSTAR                           0xc0000083U /* compat mode SYSCALL target */
+#define MSR_SYSCALL_MASK                    0xc0000084U /* EFLAGS mask for syscall */
+#define MSR_FS_BASE                         0xc0000100U /* 64bit FS base */
+#define MSR_GS_BASE                         0xc0000101U /* 64bit GS base */
+#define MSR_SHADOW_GS_BASE                  0xc0000102U /* SwapGS GS shadow */
+#define MSR_TSC_AUX                         0xc0000103U /* Auxiliary TSC */
 
-#define MSR_K8_SYSCFG                       0xc0010010
+#define MSR_K8_SYSCFG                       0xc0010010U
 #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
 #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
 #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
 #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
 #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
 
-#define MSR_K8_IORR_BASE0                   0xc0010016
-#define MSR_K8_IORR_MASK0                   0xc0010017
-#define MSR_K8_IORR_BASE1                   0xc0010018
-#define MSR_K8_IORR_MASK1                   0xc0010019
+#define MSR_K8_IORR_BASE0                   0xc0010016U
+#define MSR_K8_IORR_MASK0                   0xc0010017U
+#define MSR_K8_IORR_BASE1                   0xc0010018U
+#define MSR_K8_IORR_MASK1                   0xc0010019U
 
-#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc: SMMAddr */
-#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc: SMMMask */
+#define MSR_K8_TSEG_BASE                    0xc0010112U /* AMD doc: SMMAddr */
+#define MSR_K8_TSEG_MASK                    0xc0010113U /* AMD doc: SMMMask */
 
-#define MSR_K8_VM_CR                        0xc0010114
+#define MSR_K8_VM_CR                        0xc0010114U
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
 
-#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
+#define MSR_VIRT_SPEC_CTRL                  0xc001011fU /* Layout matches MSR_SPEC_CTRL */
 
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
@@ -293,7 +293,7 @@
 #define CMCI_EN 			(1UL<<30)
 #define CMCI_THRESHOLD_MASK		0x7FFF
 
-#define MSR_AMD64_MC0_MASK		0xc0010044
+#define MSR_AMD64_MC0_MASK		0xc0010044U
 
 #define MSR_IA32_MCx_CTL(x)		(MSR_IA32_MC0_CTL + 4*(x))
 #define MSR_IA32_MCx_STATUS(x)		(MSR_IA32_MC0_STATUS + 4*(x))
@@ -325,83 +325,83 @@
 
 /* K7/K8 MSRs. Not complete. See the architecture manual for a more
    complete list. */
-#define MSR_K7_EVNTSEL0			0xc0010000
-#define MSR_K7_PERFCTR0			0xc0010004
-#define MSR_K7_EVNTSEL1			0xc0010001
-#define MSR_K7_PERFCTR1			0xc0010005
-#define MSR_K7_EVNTSEL2			0xc0010002
-#define MSR_K7_PERFCTR2			0xc0010006
-#define MSR_K7_EVNTSEL3			0xc0010003
-#define MSR_K7_PERFCTR3			0xc0010007
-#define MSR_K8_TOP_MEM1			0xc001001a
-#define MSR_K7_CLK_CTL			0xc001001b
-#define MSR_K8_TOP_MEM2			0xc001001d
-
-#define MSR_K8_HWCR			0xc0010015
+#define MSR_K7_EVNTSEL0			0xc0010000U
+#define MSR_K7_PERFCTR0			0xc0010004U
+#define MSR_K7_EVNTSEL1			0xc0010001U
+#define MSR_K7_PERFCTR1			0xc0010005U
+#define MSR_K7_EVNTSEL2			0xc0010002U
+#define MSR_K7_PERFCTR2			0xc0010006U
+#define MSR_K7_EVNTSEL3			0xc0010003U
+#define MSR_K7_PERFCTR3			0xc0010007U
+#define MSR_K8_TOP_MEM1			0xc001001aU
+#define MSR_K7_CLK_CTL			0xc001001bU
+#define MSR_K8_TOP_MEM2			0xc001001dU
+
+#define MSR_K8_HWCR			0xc0010015U
 #define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
 #define K8_HWCR_CPUID_USER_DIS		(1ULL << 35)
 
-#define MSR_K7_FID_VID_CTL		0xc0010041
-#define MSR_K7_FID_VID_STATUS		0xc0010042
-#define MSR_K8_PSTATE_LIMIT		0xc0010061
-#define MSR_K8_PSTATE_CTRL		0xc0010062
-#define MSR_K8_PSTATE_STATUS		0xc0010063
-#define MSR_K8_PSTATE0			0xc0010064
-#define MSR_K8_PSTATE1			0xc0010065
-#define MSR_K8_PSTATE2			0xc0010066
-#define MSR_K8_PSTATE3			0xc0010067
-#define MSR_K8_PSTATE4			0xc0010068
-#define MSR_K8_PSTATE5			0xc0010069
-#define MSR_K8_PSTATE6			0xc001006A
-#define MSR_K8_PSTATE7			0xc001006B
-#define MSR_K8_ENABLE_C1E		0xc0010055
-#define MSR_K8_VM_HSAVE_PA		0xc0010117
-
-#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200
-#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201
-#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202
-#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203
-#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204
-#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205
-#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206
-#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207
-#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208
-#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209
-#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020a
-#define MSR_AMD_FAM15H_PERFCTR5		0xc001020b
-
-#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002
-#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003
-#define MSR_K8_FEATURE_MASK		0xc0011004
-#define MSR_K8_EXT_FEATURE_MASK		0xc0011005
+#define MSR_K7_FID_VID_CTL		0xc0010041U
+#define MSR_K7_FID_VID_STATUS		0xc0010042U
+#define MSR_K8_PSTATE_LIMIT		0xc0010061U
+#define MSR_K8_PSTATE_CTRL		0xc0010062U
+#define MSR_K8_PSTATE_STATUS		0xc0010063U
+#define MSR_K8_PSTATE0			0xc0010064U
+#define MSR_K8_PSTATE1			0xc0010065U
+#define MSR_K8_PSTATE2			0xc0010066U
+#define MSR_K8_PSTATE3			0xc0010067U
+#define MSR_K8_PSTATE4			0xc0010068U
+#define MSR_K8_PSTATE5			0xc0010069U
+#define MSR_K8_PSTATE6			0xc001006AU
+#define MSR_K8_PSTATE7			0xc001006BU
+#define MSR_K8_ENABLE_C1E		0xc0010055U
+#define MSR_K8_VM_HSAVE_PA		0xc0010117U
+
+#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200U
+#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201U
+#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202U
+#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203U
+#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204U
+#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205U
+#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206U
+#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207U
+#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208U
+#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209U
+#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020aU
+#define MSR_AMD_FAM15H_PERFCTR5		0xc001020bU
+
+#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002U
+#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003U
+#define MSR_K8_FEATURE_MASK			0xc0011004U
+#define MSR_K8_EXT_FEATURE_MASK		0xc0011005U
 
 /* AMD64 MSRs */
-#define MSR_AMD64_NB_CFG		0xc001001f
+#define MSR_AMD64_NB_CFG		0xc001001fU
 #define AMD64_NB_CFG_CF8_EXT_ENABLE_BIT	46
-#define MSR_AMD64_LS_CFG		0xc0011020
-#define MSR_AMD64_IC_CFG		0xc0011021
-#define MSR_AMD64_DC_CFG		0xc0011022
-#define MSR_AMD64_DE_CFG		0xc0011029
+#define MSR_AMD64_LS_CFG		0xc0011020U
+#define MSR_AMD64_IC_CFG		0xc0011021U
+#define MSR_AMD64_DC_CFG		0xc0011022U
+#define MSR_AMD64_DE_CFG		0xc0011029U
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
-#define MSR_AMD64_EX_CFG		0xc001102c
-#define MSR_AMD64_DE_CFG2		0xc00110e3
+#define MSR_AMD64_EX_CFG		0xc001102cU
+#define MSR_AMD64_DE_CFG2		0xc00110e3U
 
-#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
-#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019
-#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101a
-#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101b
+#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027U
+#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019U
+#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101aU
+#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101bU
 
 /* AMD Family10h machine check MSRs */
-#define MSR_F10_MC4_MISC1		0xc0000408
-#define MSR_F10_MC4_MISC2		0xc0000409
-#define MSR_F10_MC4_MISC3		0xc000040A
+#define MSR_F10_MC4_MISC1		0xc0000408U
+#define MSR_F10_MC4_MISC2		0xc0000409U
+#define MSR_F10_MC4_MISC3		0xc000040AU
 
 /* AMD Family10h Bus Unit MSRs */
-#define MSR_F10_BU_CFG 		0xc0011023
-#define MSR_F10_BU_CFG2		0xc001102a
+#define MSR_F10_BU_CFG 		0xc0011023U
+#define MSR_F10_BU_CFG2		0xc001102aU
 
 /* Other AMD Fam10h MSRs */
-#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058
+#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058U
 #define FAM10H_MMIO_CONF_ENABLE         (1<<0)
 #define FAM10H_MMIO_CONF_BUSRANGE_MASK	0xf
 #define FAM10H_MMIO_CONF_BUSRANGE_SHIFT 2
@@ -410,31 +410,31 @@
 
 /* AMD Microcode MSRs */
 #define MSR_AMD_PATCHLEVEL		0x0000008b
-#define MSR_AMD_PATCHLOADER		0xc0010020
+#define MSR_AMD_PATCHLOADER		0xc0010020U
 
 /* AMD TSC RATE MSR */
-#define MSR_AMD64_TSC_RATIO		0xc0000104
+#define MSR_AMD64_TSC_RATIO		0xc0000104U
 
 /* AMD Lightweight Profiling MSRs */
-#define MSR_AMD64_LWP_CFG		0xc0000105
-#define MSR_AMD64_LWP_CBADDR		0xc0000106
+#define MSR_AMD64_LWP_CFG		0xc0000105U
+#define MSR_AMD64_LWP_CBADDR		0xc0000106U
 
 /* AMD OS Visible Workaround MSRs */
-#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140
-#define MSR_AMD_OSVW_STATUS             0xc0010141
+#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140U
+#define MSR_AMD_OSVW_STATUS             0xc0010141U
 
 /* AMD Protected Processor Inventory Number */
-#define MSR_AMD_PPIN_CTL                0xc00102f0
-#define MSR_AMD_PPIN                    0xc00102f1
+#define MSR_AMD_PPIN_CTL                0xc00102f0U
+#define MSR_AMD_PPIN                    0xc00102f1U
 
 /* K6 MSRs */
-#define MSR_K6_EFER			0xc0000080
-#define MSR_K6_STAR			0xc0000081
-#define MSR_K6_WHCR			0xc0000082
-#define MSR_K6_UWCCR			0xc0000085
-#define MSR_K6_EPMR			0xc0000086
-#define MSR_K6_PSOR			0xc0000087
-#define MSR_K6_PFIR			0xc0000088
+#define MSR_K6_EFER			0xc0000080U
+#define MSR_K6_STAR			0xc0000081U
+#define MSR_K6_WHCR			0xc0000082U
+#define MSR_K6_UWCCR			0xc0000085U
+#define MSR_K6_EPMR			0xc0000086U
+#define MSR_K6_PSOR			0xc0000087U
+#define MSR_K6_PFIR			0xc0000088U
 
 /* Centaur-Hauls/IDT defined MSRs. */
 #define MSR_IDT_FCR1			0x00000107
@@ -459,10 +459,10 @@
 #define MSR_VIA_BCR2			0x00001147
 
 /* Transmeta defined MSRs */
-#define MSR_TMTA_LONGRUN_CTRL		0x80868010
-#define MSR_TMTA_LONGRUN_FLAGS		0x80868011
-#define MSR_TMTA_LRTI_READOUT		0x80868018
-#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801a
+#define MSR_TMTA_LONGRUN_CTRL		0x80868010U
+#define MSR_TMTA_LONGRUN_FLAGS		0x80868011U
+#define MSR_TMTA_LRTI_READOUT		0x80868018U
+#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801aU
 
 /* Intel defined MSRs. */
 #define MSR_IA32_P5_MC_ADDR		0x00000000
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..e1dd12eb19 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -3,10 +3,10 @@
 
 #include <xen/mm.h>
 
-#define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
-#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
-#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
-#define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
+#define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00U) >> 8)
+#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fcU)
+#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000U) >> 16)
+#define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000U))
 
 #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
                         || id == 0x01268086 || id == 0x01028086 \
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index e350227e57..f091bc9cf2 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -103,7 +103,7 @@
 /*
  * Debug status flags in DR6.
  */
-#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
+#define X86_DR6_DEFAULT         0xffff0ff0UL  /* Default %dr6 value. */
 
 /*
  * Debug control flags in DR7.
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 288050cdba..1ebeb65ad6 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
  * possible #PF at (NULL + a little) which has security implications in the
  * context of PV guests.
  */
-#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
+#define INVALID_PERCPU_AREA (0x8000000000000000UL - (long)__per_cpu_start)
 #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
 
 void __init percpu_init_areas(void)
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index a1e0af27c5..5581b4717a 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -191,7 +191,7 @@ static struct feat_node *feat_l2_cat;
 static struct feat_node *feat_mba;
 
 /* Common functions */
-#define cat_default_val(len) (0xffffffff >> (32 - (len)))
+#define cat_default_val(len) (0xffffffffU >> (32 - (len)))
 
 /*
  * get_cdp_data - get DATA COS register value from input COS ID.
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4081cef200..b030ad8a5b 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -398,8 +398,8 @@ static void __init print_details(enum ind_thunk thunk)
         cpuid_count(7, 0, &max, &tmp, &tmp, &_7d0);
     if ( max >= 2 )
         cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
-    if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
-        cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
+    if ( boot_cpu_data.extended_cpuid_level >= 0x80000008U )
+        cpuid(0x80000008U, &tmp, &e8b, &tmp, &tmp);
     if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
@@ -1337,8 +1337,8 @@ void __init init_speculation_mitigations(void)
          * TODO: Adjust cpu_has_svm_spec_ctrl to be usable earlier on boot.
          */
         if ( opt_msr_sc_hvm &&
-             (boot_cpu_data.extended_cpuid_level >= 0x8000000a) &&
-             (cpuid_edx(0x8000000a) & (1u << SVM_FEATURE_SPEC_CTRL)) )
+             (boot_cpu_data.extended_cpuid_level >= 0x8000000aU) &&
+             (cpuid_edx(0x8000000aU) & (1u << SVM_FEATURE_SPEC_CTRL)) )
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
diff --git a/xen/arch/x86/x86_64/acpi_mmcfg.c b/xen/arch/x86/x86_64/acpi_mmcfg.c
index 2159c68189..cdde7e453c 100644
--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -50,7 +50,7 @@ static int __init acpi_mcfg_check_entry(struct acpi_table_mcfg *mcfg,
 {
     int year;
 
-    if (cfg->address < 0xFFFFFFFF)
+    if (cfg->address < 0xFFFFFFFFU)
         return 0;
 
     if (!strncmp(mcfg->header.oem_id, "SGI", 3))
diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
index aad1c3f7cf..8d33429103 100644
--- a/xen/arch/x86/x86_64/pci.c
+++ b/xen/arch/x86/x86_64/pci.c
@@ -9,7 +9,7 @@
 #include <asm/io.h>
 
 #define PCI_CONF_ADDRESS(sbdf, reg) \
-    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & ~3))
+    (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a..d92be69d84 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -620,7 +620,7 @@ struct x86_emulate_ctxt
  * below).
  * Hence no separate #define-s get added.
  */
-#define X86EMUL_OPC_EXT_MASK         0xffff0000
+#define X86EMUL_OPC_EXT_MASK         0xffff0000U
 #define X86EMUL_OPC(ext, byte)       ((uint8_t)(byte) | \
                                       MASK_INSR((ext), X86EMUL_OPC_EXT_MASK))
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 07e5501914..a4ea579ebe 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -217,10 +217,10 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
     }
 
     /* Extended leaves. */
-    cpuid_leaf(0x80000000, &p->extd.raw[0]);
+    cpuid_leaf(0x80000000U, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
                           ARRAY_SIZE(p->extd.raw) - 1); ++i )
-        cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
+        cpuid_leaf(0x80000000U + i, &p->extd.raw[i]);
 
     /* Don't report leaves from possible lower level hypervisor, for now. */
     p->hv_limit = 0;
@@ -421,7 +421,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
     /* Extended leaves. */
     for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xfffful,
                                 ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
-        COPY_LEAF(0x80000000 | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
+        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
 
 #undef COPY_LEAF
 
@@ -521,7 +521,7 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
             p->hv2_limit = l.a;
             break;
 
-        case 0x80000000 ... 0x80000000 + ARRAY_SIZE(p->extd.raw) - 1:
+        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
             if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                 goto out_of_range;
 
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index a9c60000af..f033d22785 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -22,7 +22,7 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
         FAIL_CPUID(7, 0);
 
     if ( guest->extd.max_leaf > host->extd.max_leaf )
-        FAIL_CPUID(0x80000000, NA);
+        FAIL_CPUID(0x80000000U, NA);
 
     /* TODO: Audit more CPUID data. */
 
-- 
2.41.0


