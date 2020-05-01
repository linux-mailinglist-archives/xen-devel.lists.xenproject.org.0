Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC61C210B
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUeci-0007x5-Na; Fri, 01 May 2020 22:59:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecg-0007wY-RE
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:10 +0000
X-Inumbo-ID: 5cf8f43f-8bff-11ea-9b6f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf8f43f-8bff-11ea-9b6f-12813bfff9fa;
 Fri, 01 May 2020 22:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/F+D6hsQxodq6rXf+K3jo7CsyQLXckH86K/eAndVO7A=;
 b=W5hPMo+AtKM9SfAZAKucnc7KqAHchiBZ94AOU8K17mfANdY7vZ/eV317
 UAHuQsGMsgW5Wz819HRbTH9lOWCWK1t8DU6yctdQtd7H6DKkEAt0Rgnhr
 l7TDbzlRSgwpPmZxbHpou/50zPz4Jq3vazdVDmqXNeAR6WVCiH7P88OMn c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dPHGxFspW1wRPP49DXo66IYXvO9cK4Bt/EPT0HGBFSsfKiNJZIIvpKskWh2ibiJW+/hd3b0Gpv
 GI8k9lsx5Ne53H5tQcEAflZQetbw4YxwDZs3n/hCxlRoM5I81g4bOPMIaPjIkAs665am6ovBN7
 NIMFIzVQiOuIf6qj3xP4OjemoVDAhEjWiaRPuYpGfnNgoeGG1h63VeWgfvqbyr2emvgiqV1Uy8
 0M4LwaUtCneAYSqpam1lTgIpIanoB4+Bqt3AER3TLXWIarSHOJPm6/2HmyxN/zmpPgtzKZ/Vo/
 N+c=
X-SBRS: 2.7
X-MesageID: 16584683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16584683"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 05/16] x86/shstk: Introduce Supervisor Shadow Stack support
Date: Fri, 1 May 2020 23:58:27 +0100
Message-ID: <20200501225838.9866-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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

Introduce xen={no-,}shstk to for a user to select whether or not to use shadow
stacks at runtime, and X86_FEATURE_XEN_SHSTK to determine Xen's overall
enablement of shadow stacks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig              | 17 +++++++++++++++++
 xen/arch/x86/setup.c              | 30 ++++++++++++++++++++++++++++++
 xen/include/asm-x86/cpufeature.h  |  1 +
 xen/include/asm-x86/cpufeatures.h |  1 +
 xen/scripts/Kconfig.include       |  4 ++++
 5 files changed, 53 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 96432f1f69..ebd01e6893 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -34,6 +34,9 @@ config ARCH_DEFCONFIG
 config INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config HAS_AS_CET
+	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
@@ -97,6 +100,20 @@ config HVM
 
 	  If unsure, say Y.
 
+config XEN_SHSTK
+	bool "Supervisor Shadow Stacks"
+	depends on HAS_AS_CET && EXPERT = "y"
+	default y
+        ---help---
+          Control-flow Enforcement Technology (CET) is a set of features in
+          hardware designed to combat Return-oriented Programming (ROP, also
+          call/jump COP/JOP) attacks.  Shadow Stacks are one CET feature
+          designed to provide return address protection.
+
+          This option arranges for Xen to use CET-SS for its own protection.
+          When CET-SS is active, 32bit PV guests cannot be used.  Backwards
+          compatiblity can be provided vai the PV Shim mechanism.
+
 config SHADOW_PAGING
         bool "Shadow Paging"
         default y
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 9e9576344c..aa21201507 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -95,6 +95,36 @@ unsigned long __initdata highmem_start;
 size_param("highmem-start", highmem_start);
 #endif
 
+static bool __initdata opt_xen_shstk = true;
+
+static int parse_xen(const char *s)
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
+            no_config_param("XEN_SHSTK", "xen", s, ss);
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
+custom_param("xen", parse_xen);
+
 cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 859970570b..6b25f61832 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -136,6 +136,7 @@
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


