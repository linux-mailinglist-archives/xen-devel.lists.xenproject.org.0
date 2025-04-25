Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B96A9CB80
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968166.1357849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Jvj-0001lG-LZ; Fri, 25 Apr 2025 14:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968166.1357849; Fri, 25 Apr 2025 14:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Jvj-0001jm-If; Fri, 25 Apr 2025 14:21:27 +0000
Received: by outflank-mailman (input) for mailman id 968166;
 Fri, 25 Apr 2025 14:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kKSw=XL=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1u8Jvi-0001jg-7V
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:21:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9024dff6-21e0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 16:21:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE37E49BEC;
 Fri, 25 Apr 2025 14:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FA6C4CEE4;
 Fri, 25 Apr 2025 14:21:18 +0000 (UTC)
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
X-Inumbo-ID: 9024dff6-21e0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745590881;
	bh=nmDRxC+knYKh7h47UaJi1RUPn/QPP+Qvi9F5Frj7RDg=;
	h=From:To:Cc:Subject:Date:From;
	b=hTyJrdtwYF87YDIvFLMOFAu2aLHUWkYJOG0CNgwL4gYDxHge1ooHycrGEpDnIYPcl
	 6FnKXxnpeEuu+wghoNCmQuIVIf4HcAZoDbegk+S8xIfZyAWBYY0XqIKFMcvmXeZaII
	 NKkLguLpJstx7yYUrDOgvcpoQO4tKyjNiitZCHTCzH1iUeOT6Q95nFAjM7T2ULK9ST
	 k4rsebaktlzkdpQcX1ZhfgTL9L2GgzBOKPBwb+i2BhHGQ3VKU+sjtWL4LpOxSZL34E
	 R/7vhdj8pztfVag1EXZT9VmI1AzezqZozsoB0ufdP2GiiuJRP6NhUb4WxoRyS6lgGo
	 B8KJzIiKoazMA==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] [RFC] x86/cpu: rework instruction set selection
Date: Fri, 25 Apr 2025 16:15:15 +0200
Message-Id: <20250425141740.734030-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

With cx8 and tsc being mandatory features, the only important
architectural features are now cmov and pae.

Change the large list of target CPUs to no longer pick the instruction set
itself but only the mtune= optimization level and in-kernel optimizations
that remain compatible with all cores.

The CONFIG_X86_CMOV instead becomes user-selectable and is now how
Kconfig picks between 586-class (Pentium, Pentium MMX, K6, C3, GeodeGX)
and 686-class (everything else) targets.

In order to allow running on late 32-bit cores (Athlon, Pentium-M,
Pentium 4, ...), the X86_L1_CACHE_SHIFT can no longer be set to anything
lower than 6 (i.e. 64 byte cache lines).

The optimization options now depend on X86_CMOV and X86_PAE instead
of the other way round, while other compile-time conditionals that
checked for MATOM/MGEODEGX1 instead now check for CPU_SUP_* options
that enable support for a particular CPU family.

Link: https://lore.kernel.org/lkml/dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is what I had in mind as mentioned in the earlier thread on
cx8/tsc removal. I based this on top of the Ingo's [RFC 15/15]
patch.
---
 arch/x86/Kconfig                |   2 +-
 arch/x86/Kconfig.cpu            | 100 ++++++++++++++------------------
 arch/x86/Makefile_32.cpu        |  48 +++++++--------
 arch/x86/include/asm/vermagic.h |  36 +-----------
 arch/x86/kernel/tsc.c           |   2 +-
 arch/x86/xen/Kconfig            |   1 -
 drivers/misc/mei/Kconfig        |   2 +-
 7 files changed, 74 insertions(+), 117 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a9d717558972..1e33f88c9b97 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1438,7 +1438,7 @@ config HIGHMEM
 
 config X86_PAE
 	bool "PAE (Physical Address Extension) Support"
-	depends on X86_32 && X86_HAVE_PAE
+	depends on X86_32 && X86_CMOV
 	select PHYS_ADDR_T_64BIT
 	help
 	  PAE is required for NX support, and furthermore enables
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 6f1e8cc8fe58..0619566de93f 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -1,23 +1,32 @@
 # SPDX-License-Identifier: GPL-2.0
 # Put here option for CPU selection and depending optimization
-choice
-	prompt "x86-32 Processor family"
-	depends on X86_32
-	default M686
+
+config X86_CMOV
+	bool "Require 686-class CMOV instructions" if X86_32
+	default y
 	help
-	  This is the processor type of your CPU. This information is
-	  used for optimizing purposes. In order to compile a kernel
-	  that can run on all supported x86 CPU types (albeit not
-	  optimally fast), you can specify "586" here.
+	  Most x86-32 processor implementations are compatible with
+	  the the CMOV instruction originally added in the Pentium Pro,
+	  and they perform much better when using it.
+
+	  Disable this option to build for 586-class CPUs without this
+	  instruction. This is only required for the original Intel
+	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
+	  CyrixIII/C3 CPUs.
 
 	  Note that the 386 and 486 is no longer supported, this includes
 	  AMD/Cyrix/Intel 386DX/DXL/SL/SLC/SX, Cyrix/TI 486DLC/DLC2,
 	  UMC 486SX-S and the NexGen Nx586, AMD ELAN and all 486 based
 	  CPUs.
 
-	  The kernel will not necessarily run on earlier architectures than
-	  the one you have chosen, e.g. a Pentium optimized kernel will run on
-	  a PPro, but not necessarily on a i486.
+choice
+	prompt "x86-32 Processor optimization"
+	depends on X86_32
+	default X86_GENERIC
+	help
+	  This is the processor type of your CPU. This information is
+	  used for optimizing purposes, but does not change compatibility
+	  with other CPU types.
 
 	  Here are the settings recommended for greatest speed:
 	  - "586" for generic Pentium CPUs lacking the TSC
@@ -45,14 +54,13 @@ choice
 
 config M586TSC
 	bool "Pentium-Classic"
-	depends on X86_32
+	depends on X86_32 && !X86_CMOV
 	help
-	  Select this for a Pentium Classic processor with the RDTSC (Read
-	  Time Stamp Counter) instruction for benchmarking.
+	  Select this for a Pentium Classic processor.
 
 config M586MMX
 	bool "Pentium-MMX"
-	depends on X86_32
+	depends on X86_32 && !X86_CMOV
 	help
 	  Select this for a Pentium with the MMX graphics/multimedia
 	  extended instructions.
@@ -117,7 +125,7 @@ config MPENTIUM4
 
 config MK6
 	bool "K6/K6-II/K6-III"
-	depends on X86_32
+	depends on X86_32 && !X86_CMOV
 	help
 	  Select this for an AMD K6-family processor.  Enables use of
 	  some extended instructions, and passes appropriate optimization
@@ -125,7 +133,7 @@ config MK6
 
 config MK7
 	bool "Athlon/Duron/K7"
-	depends on X86_32
+	depends on X86_32 && !X86_PAE
 	help
 	  Select this for an AMD Athlon K7-family processor.  Enables use of
 	  some extended instructions, and passes appropriate optimization
@@ -147,42 +155,37 @@ config MEFFICEON
 
 config MGEODEGX1
 	bool "GeodeGX1"
-	depends on X86_32
+	depends on X86_32 && !X86_CMOV
 	help
 	  Select this for a Geode GX1 (Cyrix MediaGX) chip.
 
 config MGEODE_LX
 	bool "Geode GX/LX"
-	depends on X86_32
+	depends on X86_32 && !X86_PAE
 	help
 	  Select this for AMD Geode GX and LX processors.
 
 config MCYRIXIII
 	bool "CyrixIII/VIA-C3"
-	depends on X86_32
+	depends on X86_32 && !X86_CMOV
 	help
 	  Select this for a Cyrix III or C3 chip.  Presently Linux and GCC
 	  treat this chip as a generic 586. Whilst the CPU is 686 class,
 	  it lacks the cmov extension which gcc assumes is present when
 	  generating 686 code.
-	  Note that Nehemiah (Model 9) and above will not boot with this
-	  kernel due to them lacking the 3DNow! instructions used in earlier
-	  incarnations of the CPU.
 
 config MVIAC3_2
 	bool "VIA C3-2 (Nehemiah)"
-	depends on X86_32
+	depends on X86_32 && !X86_PAE
 	help
 	  Select this for a VIA C3 "Nehemiah". Selecting this enables usage
 	  of SSE and tells gcc to treat the CPU as a 686.
-	  Note, this kernel will not boot on older (pre model 9) C3s.
 
 config MVIAC7
 	bool "VIA C7"
-	depends on X86_32
+	depends on X86_32 && !X86_PAE
 	help
-	  Select this for a VIA C7.  Selecting this uses the correct cache
-	  shift and tells gcc to treat the CPU as a 686.
+	  Select this for a VIA C7.
 
 config MATOM
 	bool "Intel Atom"
@@ -192,20 +195,19 @@ config MATOM
 	  accordingly optimized code. Use a recent GCC with specific Atom
 	  support in order to fully benefit from selecting this option.
 
-endchoice
-
 config X86_GENERIC
-	bool "Generic x86 support"
-	depends on X86_32
+	bool "Generic x86"
 	help
-	  Instead of just including optimizations for the selected
+	  Instead of just including optimizations for a particular
 	  x86 variant (e.g. PII, Crusoe or Athlon), include some more
 	  generic optimizations as well. This will make the kernel
-	  perform better on x86 CPUs other than that selected.
+	  perform better on a variety of CPUs.
 
 	  This is really intended for distributors who need more
 	  generic optimizations.
 
+endchoice
+
 #
 # Define implied options from the CPU selection here
 config X86_INTERNODE_CACHE_SHIFT
@@ -216,17 +218,14 @@ config X86_INTERNODE_CACHE_SHIFT
 config X86_L1_CACHE_SHIFT
 	int
 	default "7" if MPENTIUM4
-	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X86_64
-	default "4" if MGEODEGX1
-	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MGEODE_LX
+	default "6"
 
 config X86_F00F_BUG
-	def_bool y
-	depends on M586MMX || M586TSC || M586
+	def_bool !X86_CMOV
 
 config X86_ALIGNMENT_16
 	def_bool y
-	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1
+	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1 || (!X86_CMOV && X86_GENERIC)
 
 config X86_INTEL_USERCOPY
 	def_bool y
@@ -234,34 +233,23 @@ config X86_INTEL_USERCOPY
 
 config X86_USE_PPRO_CHECKSUM
 	def_bool y
-	depends on MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX || MATOM
+	depends on MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX || MATOM || (X86_CMOV && X86_GENERIC)
 
 config X86_TSC
 	def_bool y
 
-config X86_HAVE_PAE
-	def_bool y
-	depends on MCRUSOE || MEFFICEON || MCYRIXIII || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC7 || MATOM || X86_64
-
 config X86_CX8
 	def_bool y
 
-# this should be set for all -march=.. options where the compiler
-# generates cmov.
-config X86_CMOV
-	def_bool y
-	depends on (MK7 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MCRUSOE || MEFFICEON || MATOM || MGEODE_LX || X86_64)
-
 config X86_MINIMUM_CPU_FAMILY
 	int
 	default "64" if X86_64
-	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
-	default "5" if X86_32
-	default "4"
+	default "6" if X86_32 && X86_CMOV
+	default "5"
 
 config X86_DEBUGCTLMSR
 	def_bool y
-	depends on !(MK6 || MCYRIXIII || M586MMX || M586TSC || M586) && !UML
+	depends on X86_CMOV && !UML
 
 config IA32_FEAT_CTL
 	def_bool y
@@ -297,7 +285,7 @@ config CPU_SUP_INTEL
 config CPU_SUP_CYRIX_32
 	default y
 	bool "Support Cyrix processors" if PROCESSOR_SELECT
-	depends on M586 || M586TSC || M586MMX || (EXPERT && !64BIT)
+	depends on !64BIT
 	help
 	  This enables detection, tunings and quirks for Cyrix processors
 
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index f5e933077bf4..ebd7ec6eaf34 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -10,30 +10,32 @@ else
 align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
 endif
 
-cflags-$(CONFIG_M586TSC)	+= -march=i586
-cflags-$(CONFIG_M586MMX)	+= -march=pentium-mmx
-cflags-$(CONFIG_M686)		+= -march=i686
-cflags-$(CONFIG_MPENTIUMII)	+= -march=i686 $(call tune,pentium2)
-cflags-$(CONFIG_MPENTIUMIII)	+= -march=i686 $(call tune,pentium3)
-cflags-$(CONFIG_MPENTIUMM)	+= -march=i686 $(call tune,pentium3)
-cflags-$(CONFIG_MPENTIUM4)	+= -march=i686 $(call tune,pentium4)
-cflags-$(CONFIG_MK6)		+= -march=k6
-# Please note, that patches that add -march=athlon-xp and friends are pointless.
-# They make zero difference whatsosever to performance at this time.
-cflags-$(CONFIG_MK7)		+= -march=athlon
-cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
-cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
-cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
-cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
-cflags-$(CONFIG_MVIAC7)		+= -march=i686
-cflags-$(CONFIG_MATOM)		+= -march=atom
+ifdef CONFIG_X86_CMOV
+cflags-y			+= -march=i686
+else
+cflags-y			+= -march=i586
+endif
 
-# Geode GX1 support
-cflags-$(CONFIG_MGEODEGX1)	+= -march=pentium-mmx
-cflags-$(CONFIG_MGEODE_LX)	+= $(call cc-option,-march=geode,-march=pentium-mmx)
-# add at the end to overwrite eventual tuning options from earlier
-# cpu entries
-cflags-$(CONFIG_X86_GENERIC) 	+= $(call tune,generic,$(call tune,i686))
+cflags-$(CONFIG_M586TSC)	+= -mtune=i586
+cflags-$(CONFIG_M586MMX)	+= -mtune=pentium-mmx
+cflags-$(CONFIG_M686)		+= -mtune=i686
+cflags-$(CONFIG_MPENTIUMII)	+= -mtune=pentium2
+cflags-$(CONFIG_MPENTIUMIII)	+= -mtune=pentium3
+cflags-$(CONFIG_MPENTIUMM)	+= -mtune=pentium3
+cflags-$(CONFIG_MPENTIUM4)	+= -mtune=pentium4
+cflags-$(CONFIG_MK6)		+= -mtune=k6
+# Please note, that patches that add -mtune=athlon-xp and friends are pointless.
+# They make zero difference whatsosever to performance at this time.
+cflags-$(CONFIG_MK7)		+= -mtune=athlon
+cflags-$(CONFIG_MCRUSOE)	+= -mtune=i686 $(align)
+cflags-$(CONFIG_MEFFICEON)	+= -mtune=pentium3 $(align)
+cflags-$(CONFIG_MCYRIXIII)	+= -mtune=c3 $(align)
+cflags-$(CONFIG_MVIAC3_2)	+= -mtune=c3-2
+cflags-$(CONFIG_MVIAC7)		+= -mtune=i686
+cflags-$(CONFIG_MATOM)		+= -mtune=atom
+cflags-$(CONFIG_MGEODEGX1)	+= -mtune=pentium-mmx
+cflags-$(CONFIG_MGEODE_LX)	+= -mtune=geode
+cflags-$(CONFIG_X86_GENERIC) 	+= -mtune=generic
 
 # Bug fix for binutils: this option is required in order to keep
 # binutils from generating NOPL instructions against our will.
diff --git a/arch/x86/include/asm/vermagic.h b/arch/x86/include/asm/vermagic.h
index e26061df0c9b..6554dbdfd719 100644
--- a/arch/x86/include/asm/vermagic.h
+++ b/arch/x86/include/asm/vermagic.h
@@ -5,42 +5,10 @@
 
 #ifdef CONFIG_X86_64
 /* X86_64 does not define MODULE_PROC_FAMILY */
-#elif defined CONFIG_M586TSC
-#define MODULE_PROC_FAMILY "586TSC "
-#elif defined CONFIG_M586MMX
-#define MODULE_PROC_FAMILY "586MMX "
-#elif defined CONFIG_MATOM
-#define MODULE_PROC_FAMILY "ATOM "
-#elif defined CONFIG_M686
+#elif defined CONFIG_X86_CMOV
 #define MODULE_PROC_FAMILY "686 "
-#elif defined CONFIG_MPENTIUMII
-#define MODULE_PROC_FAMILY "PENTIUMII "
-#elif defined CONFIG_MPENTIUMIII
-#define MODULE_PROC_FAMILY "PENTIUMIII "
-#elif defined CONFIG_MPENTIUMM
-#define MODULE_PROC_FAMILY "PENTIUMM "
-#elif defined CONFIG_MPENTIUM4
-#define MODULE_PROC_FAMILY "PENTIUM4 "
-#elif defined CONFIG_MK6
-#define MODULE_PROC_FAMILY "K6 "
-#elif defined CONFIG_MK7
-#define MODULE_PROC_FAMILY "K7 "
-#elif defined CONFIG_MCRUSOE
-#define MODULE_PROC_FAMILY "CRUSOE "
-#elif defined CONFIG_MEFFICEON
-#define MODULE_PROC_FAMILY "EFFICEON "
-#elif defined CONFIG_MCYRIXIII
-#define MODULE_PROC_FAMILY "CYRIXIII "
-#elif defined CONFIG_MVIAC3_2
-#define MODULE_PROC_FAMILY "VIAC3-2 "
-#elif defined CONFIG_MVIAC7
-#define MODULE_PROC_FAMILY "VIAC7 "
-#elif defined CONFIG_MGEODEGX1
-#define MODULE_PROC_FAMILY "GEODEGX1 "
-#elif defined CONFIG_MGEODE_LX
-#define MODULE_PROC_FAMILY "GEODE "
 #else
-#error unknown processor family
+#define MODULE_PROC_FAMILY "586 "
 #endif
 
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 489c779ef3ef..76b15ef8c85f 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1221,7 +1221,7 @@ bool tsc_clocksource_watchdog_disabled(void)
 
 static void __init check_system_tsc_reliable(void)
 {
-#if defined(CONFIG_MGEODEGX1) || defined(CONFIG_MGEODE_LX) || defined(CONFIG_X86_GENERIC)
+#if defined(CONFIG_CPU_SUP_CYRIX)
 	if (is_geode_lx()) {
 		/* RTSC counts during suspend */
 #define RTSC_SUSP 0x100
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 222b6fdad313..2648459b8e8f 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -9,7 +9,6 @@ config XEN
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
 	depends on X86_64 || (X86_32 && X86_PAE)
-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 7575fee96cc6..4deb17ed0a62 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -3,7 +3,7 @@
 config INTEL_MEI
 	tristate "Intel Management Engine Interface"
 	depends on X86 && PCI
-	default X86_64 || MATOM
+	default X86_64 || CPU_SUP_INTEL
 	help
 	  The Intel Management Engine (Intel ME) provides Manageability,
 	  Security and Media services for system containing Intel chipsets.
-- 
2.39.5


