Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876011E4E04
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aB-00040L-U9; Wed, 27 May 2020 19:19:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aA-000407-PL
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:18 +0000
X-Inumbo-ID: f267606a-a04e-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f267606a-a04e-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 19:19:12 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PqU4pUb91tB9Qzz3QFZ5kdCgJyyeaIaQRM6P1RfR9bMkxLxj5+zFmOGBmAEaXDS6T9LmWcaiR/
 NznYQ7Ek1SAKgop8OoJXAsDup0hcFx2/qh5n7dSxICCbcOWKmVwtWImqvP+CbZs1q14aVZX8hl
 5omvACdCjxk6j1FDGP6amTVLSx6ufQyG5scC+Xns65sJgWJ+Ioj9Zq51LxH+cMQMtBsKpW0w9x
 s+VKO+5C8cJvfrTjrB055dJH8Po8Js3Dq2IPx3RxeeffSWkFxxl2MViGpCKNFEGgI3v39k2QT0
 Dgw=
X-SBRS: 2.7
X-MesageID: 19333916
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="19333916"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack support
Date: Wed, 27 May 2020 20:18:36 +0100
Message-ID: <20200527191847.17207-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce CONFIG_HAS_AS_CET to determine whether CET instructions are
supported in the assembler, and CONFIG_XEN_SHSTK as the main build option.

Introduce cet={no-,}shstk to for a user to select whether or not to use shadow
stacks at runtime, and X86_FEATURE_XEN_SHSTK to determine Xen's overall
enablement of shadow stacks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

LLVM 6 supports CET-SS instructions while only LLVM 7 supports CET-IBT
instructions.  We'd need to split HAS_AS_CET into two if we want to support
supervisor shadow stacks with LLVM 6.  (This demonstrates exactly why picking
a handful of instructions to test is the right approach.)

v2:
 * Leave a comment identifying minimum toolchain support, to make it easier to
   remove ifdefary in the future when bumping minima.
 * Reindent CONFIG_XEN_SHSTK help text.
 * Rename xen= to cet=.  Add documentation, __init.
---
 docs/misc/xen-command-line.pandoc | 17 +++++++++++++++++
 xen/arch/x86/Kconfig              | 18 ++++++++++++++++++
 xen/arch/x86/setup.c              | 30 ++++++++++++++++++++++++++++++
 xen/include/asm-x86/cpufeature.h  |  1 +
 xen/include/asm-x86/cpufeatures.h |  1 +
 xen/scripts/Kconfig.include       |  4 ++++
 6 files changed, 71 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e16bb90184..d4934eabb7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -270,6 +270,23 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
 enough. Setting this to a high value may cause boot failure, particularly if
 the NMI watchdog is also enabled.
 
+### cet
+    = List of [ shstk=<bool> ]
+
+    Applicability: x86
+
+Controls for the use of Control-flow Enforcement Technology.  CET is group of
+hardware features designed to combat Return-oriented Programming (ROP, also
+call/jmp COP/JOP) attacks.
+
+*   The `shstk=` boolean controls whether Xen uses Shadow Stacks for its own
+    protection.
+
+    The option is available when `CONFIG_XEN_SHSTK` is compiled in, and
+    defaults to `true` on hardware supporting CET-SS.  Specifying
+    `cet=no-shstk` will cause Xen not to use Shadow Stacks even when support
+    is available in hardware.
+
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b565f6831d..304a42ffb2 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -34,6 +34,10 @@ config ARCH_DEFCONFIG
 config INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config HAS_AS_CET
+	# binutils >= 2.29 and LLVM >= 7
+	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
@@ -97,6 +101,20 @@ config HVM
 
 	  If unsure, say Y.
 
+config XEN_SHSTK
+	bool "Supervisor Shadow Stacks"
+	depends on HAS_AS_CET && EXPERT = "y"
+	default y
+	---help---
+	  Control-flow Enforcement Technology (CET) is a set of features in
+	  hardware designed to combat Return-oriented Programming (ROP, also
+	  call/jump COP/JOP) attacks.  Shadow Stacks are one CET feature
+	  designed to provide return address protection.
+
+	  This option arranges for Xen to use CET-SS for its own protection.
+	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
+	  compatiblity can be provided vai the PV Shim mechanism.
+
 config SHADOW_PAGING
         bool "Shadow Paging"
         default y
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2dec7a3fc6..584589baff 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -95,6 +95,36 @@ unsigned long __initdata highmem_start;
 size_param("highmem-start", highmem_start);
 #endif
 
+static bool __initdata opt_xen_shstk = true;
+
+static int __init parse_cet(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
+        {
+#ifdef CONFIG_XEN_SHSTK
+            opt_xen_shstk = val;
+#else
+            no_config_param("XEN_SHSTK", "cet", s, ss);
+#endif
+        }
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("cet", parse_cet);
+
 cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index cadef4e824..b831448eba 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -137,6 +137,7 @@
 #define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
 #define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
+#define cpu_has_xen_shstk       boot_cpu_has(X86_FEATURE_XEN_SHSTK)
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index b9d3cac975..d7e42d9bb6 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -38,6 +38,7 @@ XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL.LBR */
 XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* VERW used by Xen for PV */
 XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
+XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/scripts/Kconfig.include b/xen/scripts/Kconfig.include
index 8221095ca3..e1f13e1720 100644
--- a/xen/scripts/Kconfig.include
+++ b/xen/scripts/Kconfig.include
@@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(success,$(LD) -v $(1))
 
+# $(as-instr,<instr>)
+# Return y if the assembler supports <instr>, n otherwise
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
+
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
-- 
2.11.0


