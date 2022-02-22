Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34B4BFC82
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276857.473214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4X-00079Q-8n; Tue, 22 Feb 2022 15:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276857.473214; Tue, 22 Feb 2022 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4W-00072O-VY; Tue, 22 Feb 2022 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 276857;
 Tue, 22 Feb 2022 15:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4U-0006OK-RK
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed7f4077-93f3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:27:21 +0100 (CET)
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
X-Inumbo-ID: ed7f4077-93f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l3vBrs4n2oJ7gLUw9ggixaQ0VXQruT/jeyOhQ2uTkmw=;
  b=fagQPc0U+nl2+kCUk+RSB1Ax8fP/YRoNE8iOdggNL+vI9PlESONBH04B
   uSmsgfkV/f+gQacAQfXH38qVjRfUHf9G7RBj6mpyGuAtRaEqhcAX+tdj3
   +fUcXATz3dZGnLHx3RMgeqrjLL1Hzly2hndiQ0aOpamdnRzPGT+yuc94+
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66981789
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1A3tjqqhn/zkLDuqHRQ4M39iTdVeBmIdZRIvgKrLsJaIsI4StFCzt
 garIBnUaK2NM2Cke9x+bo3g9kkO78SGy4c2GVQ9ri4zRXkRpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBNbTQpLw5dCJhFyxZIrJv9bLEE2KciJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMkWQOkIfaz/7Drpll/fymFP+UgRfrQmFiJUy/FXNyzduhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34Riv/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4qHN/zrBIk8/dzpMT8M5ncI7Rg4w9
 WbcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAYmV8rleMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 RON6F4MvsMKZBNGiJObharrUKzGKoC6SLzYug38NIISMvCdiifdlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhQcyBgXMiu85Y/myzqClMOJVzNwsT5mdsJE7GJVYwP/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:m0j6aKOQR0a/IcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66981789"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/70] x86: Introduce support for CET-IBT
Date: Tue, 22 Feb 2022 15:26:34 +0000
Message-ID: <20220222152645.8844-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET Indirect Branch Tracking is a hardware feature designed to provide
forward-edge control flow integrity, protecting against jump/call oriented
programming.

IBT requires the placement of ENDBR{32,64} instructions at the target of every
indirect call/jmp, and every entrypoint.

However, the default -fcf-protection=branch places an ENDBR on every function
which far more than necessary, and reduces the quantity of protection
afforded.  Therefore, we use manual placement using the cf_check attribute.

It is necessary to check for both compiler and assembler support, as the
notrack prefix can be emitted in certain cases.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Clang/LLVM support for -mmanual-endbr is in progress:
  https://reviews.llvm.org/D118355

v2:
 * Correct CONFIG_HAS_CC_CET_IBT to CONFIG_XEN_IBT in some places
 * Move cf_check compatibility into tools/tests/x86_emulator/x86-emulate.h
v3:
 * Extend commit message
 * Disable IBT for pvshim defconfig
---
 Config.mk                                   |  1 -
 tools/firmware/Makefile                     |  2 ++
 tools/libs/guest/xg_dom_decompress_unsafe.h |  2 ++
 tools/tests/x86_emulator/x86-emulate.h      |  2 ++
 xen/arch/x86/Kconfig                        | 17 +++++++++++++++++
 xen/arch/x86/arch.mk                        |  6 ++++++
 xen/arch/x86/configs/pvshim_defconfig       |  1 +
 xen/arch/x86/include/asm/asm-defns.h        |  6 ++++++
 xen/arch/x86/include/asm/cpufeature.h       |  1 +
 xen/arch/x86/include/asm/cpufeatures.h      |  1 +
 xen/include/xen/compiler.h                  |  6 ++++++
 11 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 95c053212ec3..f56f7dc33468 100644
--- a/Config.mk
+++ b/Config.mk
@@ -190,7 +190,6 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
-EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 345037b93b7f..53ed4f161edb 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -6,6 +6,8 @@ TARGET      := hvmloader/hvmloader
 INST_DIR := $(DESTDIR)$(XENFIRMWAREDIR)
 DEBG_DIR := $(DESTDIR)$(DEBUG_DIR)$(XENFIRMWAREDIR)
 
+EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
+
 SUBDIRS-y :=
 SUBDIRS-$(CONFIG_OVMF) += ovmf-dir
 SUBDIRS-$(CONFIG_SEABIOS) += seabios-dir
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
index 4e0bf23aa587..ac6b94288d5e 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -8,6 +8,8 @@ typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           void (*error)(const char *x));
 #endif
 
+#define cf_check /* No Control Flow Integriy checking */
+
 int xc_dom_decompress_unsafe(
     decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 7f60ef9e89ba..18ae40d01712 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -54,6 +54,8 @@
 #define likely(x)   __builtin_expect(!!(x), true)
 #define unlikely(x) __builtin_expect(!!(x), false)
 
+#define cf_check /* No Control Flow Integriy checking */
+
 #define container_of(ptr, type, member) ({             \
     typeof(((type *)0)->member) *mptr__ = (ptr);       \
     (type *)((char *)mptr__ - offsetof(type, member)); \
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 41198b0f96ed..8e70f9a44847 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -40,6 +40,11 @@ config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
 
+config HAS_CC_CET_IBT
+	# GCC >= 9 and binutils >= 2.29
+	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
+	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
@@ -125,6 +130,18 @@ config XEN_SHSTK
 	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
 	  compatiblity can be provided via the PV Shim mechanism.
 
+config XEN_IBT
+	bool "Supervisor Indirect Branch Tracking"
+	depends on HAS_CC_CET_IBT
+	default y
+	help
+	  Control-flow Enforcement Technology (CET) is a set of features in
+	  hardware designed to combat Return-oriented Programming (ROP, also
+	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
+	  feature designed to provide function pointer protection.
+
+	  This option arranges for Xen to use CET-IBT for its own protection.
+
 config SHADOW_PAGING
 	bool "Shadow Paging"
 	default !PV_SHIM_EXCLUSIVE
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index edfc043dbbaf..f780c912a9cf 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -52,6 +52,12 @@ CFLAGS-$(CONFIG_CC_IS_GCC) += -fno-jump-tables
 CFLAGS-$(CONFIG_CC_IS_CLANG) += -mretpoline-external-thunk
 endif
 
+ifdef CONFIG_XEN_IBT
+CFLAGS += -fcf-protection=branch -mmanual-endbr
+else
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+endif
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 787376df5a27..d0e92c2ded1f 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -8,6 +8,7 @@ CONFIG_NR_CPUS=32
 CONFIG_EXPERT=y
 # Disable features not used by the PV shim
 # CONFIG_XEN_SHSTK is not set
+# CONFIG_XEN_IBT is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_HYPFS is not set
 # CONFIG_BIGMEM is not set
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 505f39ad5f76..8bd9007731d5 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -57,6 +57,12 @@
     INDIRECT_BRANCH jmp \arg
 .endm
 
+#ifdef CONFIG_XEN_IBT
+# define ENDBR64 endbr64
+#else
+# define ENDBR64
+#endif
+
 .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
 #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
     /*
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index a0ab6d7d78ea..f2c6f255ace9 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -152,6 +152,7 @@
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
 #define cpu_has_xen_shstk       boot_cpu_has(X86_FEATURE_XEN_SHSTK)
+#define cpu_has_xen_ibt         boot_cpu_has(X86_FEATURE_XEN_IBT)
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index b10154fc44bb..7413febd7ad8 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -39,6 +39,7 @@ XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* VERW used by Xen for PV */
 XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
+XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 696c7eb89e4c..933aec09a92d 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -37,6 +37,12 @@
 # define nocall
 #endif
 
+#ifdef CONFIG_XEN_IBT
+# define cf_check     __attribute__((__cf_check__))
+#else
+# define cf_check
+#endif
+
 #if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
 #define unreachable() do {} while (1)
 #else
-- 
2.11.0


