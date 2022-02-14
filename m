Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B284B50A3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271506.466018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapn-0005de-FK; Mon, 14 Feb 2022 12:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271506.466018; Mon, 14 Feb 2022 12:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapn-0005ap-Ap; Mon, 14 Feb 2022 12:52:03 +0000
Received: by outflank-mailman (input) for mailman id 271506;
 Mon, 14 Feb 2022 12:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapl-0003jd-8V
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:52:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4836a4a-8d94-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:51:59 +0100 (CET)
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
X-Inumbo-ID: e4836a4a-8d94-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9InvRPHFIdzqh83XB2chSO1PILFwtwPb/Bgms+iLNm0=;
  b=N3ylDT5YZGajxf+RzUwGQFQ14Xnu7T1R0wE+Sfd9he4MAESlqNtsyPbM
   ut/wOFYnulKp17KRJlj/lDpwoo0DIQ81AWbXrVwWxxNdADjdPnzkYALbt
   DXXrJ84XQr8GDB/24G9Nakwra+IA1TWiLMIfzSKl5JVelikWEIqKp+kVb
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6UWwk60Ynj3vZcjN/RSwXI0H3ofMc4YpZw3PGz2Ob2ypecmVK4fAByPgTJqiGSoYvZQ5jTI0eH
 bqMCvBvJqSWO5eo3ke5Ox0DZWILx6+iC/d+kG48fQeIXqLqAsChUY8BS2Q91zEQFzpKcLTNEBi
 fc8lLYzSV9QMqQdGUp9ELd5+wItaaaJdjpiyPYmAsYrhCY0gLZb1rxOesKJqulwkNNhql05YTN
 JD+9ZRGBrrTEroh/lN60PHSfaMVXasArKdTcoAyyAQu+5BRz4buWpGnORTRI7IUnBkPM3yWOAJ
 5BT5zpVoT8tUbh3c72eKWH+o
X-SBRS: 5.1
X-MesageID: 64148330
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MUR3G6B+1aXM/xVW/xbkw5YqxClBgxIJ4kV8jS/XYbTApDgm0mYPm
 2scWm+HbK2KMzfwLtt1PIq/80NVu8TXx9IwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0BLRgPtQk
 PN0mbOPRggRA4jJsuEGXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgG5s1psVRZ4yY
 eITSAhCVi/4TSZdIwkcD50Bns2smzrwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCWj5gE3eoJ2KsEV1w6C8pfx5iycHWdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtjxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q2v9qyP+JdkLulmSwXuF1e5eJ1fUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD+8zL7T6KLXwN50/8iuT2ib/8YeptDWZimchnsPLa8F2Nq
 Y432gnj40w3bdASqxL/qeY7RW3m51BhbXwvg8AIJOOFPCR8H2QtV63Yzb87ItQ3lKVJjObYu
 Hq6XxYAmlb4gHTGLySMa2xiN+yzDcou8ypjMHx+J0us1lgifZ2rsPUVeawocOR17+dk1/N1E
 aUIIp3SHvRVRz3b0D0Bdp2h/pd6fRGmiFvWbSqoaTQyZbB6QAnN9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aRe4tdYkTh9oRuOhfdtP5vLpFeMwjHyxuby
 x2SXUUSq97SrtJn69LOn62F8dukSrMsAkpAEmDHxr+qLi2GrHG7yIpNXevULzDQUGT4pPera
 elPlqyuNfQGmBBBspZmEqYtxqU7voO9q7hfxwViPXPKc1X0Ve8wfijYhZFC5v9X27tUmQqqQ
 UbeqNBVNIKANN7hDFNMdhEuaf6O1K1MlzTfhRjvzJ4WOMOjEGK7bHhv
IronPort-HdrOrdr: A9a23:J5ECuKOSIEHWEMBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/70] x86: Introduce support for CET-IBT
Date: Mon, 14 Feb 2022 12:50:23 +0000
Message-ID: <20220214125127.17985-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
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

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Clang/LLVM support for -mmanual-endbr is in progress:
  https://reviews.llvm.org/D118355

v2:
 * Correct CONFIG_HAS_CC_CET_IBT to CONFIG_XEN_IBT in some places
 * Move cf_check compatibility into tools/tests/x86_emulator/x86-emulate.h
---
 Config.mk                                   |  1 -
 tools/firmware/Makefile                     |  2 ++
 tools/libs/guest/xg_dom_decompress_unsafe.h |  2 ++
 tools/tests/x86_emulator/x86-emulate.h      |  2 ++
 xen/arch/x86/Kconfig                        | 17 +++++++++++++++++
 xen/arch/x86/arch.mk                        |  6 ++++++
 xen/arch/x86/include/asm/asm-defns.h        |  6 ++++++
 xen/arch/x86/include/asm/cpufeature.h       |  1 +
 xen/arch/x86/include/asm/cpufeatures.h      |  1 +
 xen/include/xen/compiler.h                  |  6 ++++++
 10 files changed, 43 insertions(+), 1 deletion(-)

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
index 4e0bf23aa587..3bce0cfefb88 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -8,6 +8,8 @@ typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           void (*error)(const char *x));
 #endif
 
+#define cf_check
+
 int xc_dom_decompress_unsafe(
     decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 7f60ef9e89ba..c6819a417d05 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -54,6 +54,8 @@
 #define likely(x)   __builtin_expect(!!(x), true)
 #define unlikely(x) __builtin_expect(!!(x), false)
 
+#define cf_check
+
 #define container_of(ptr, type, member) ({             \
     typeof(((type *)0)->member) *mptr__ = (ptr);       \
     (type *)((char *)mptr__ - offsetof(type, member)); \
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b4abfca46f6a..8b7ad0145b29 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -39,6 +39,11 @@ config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
 
+config HAS_CC_CET_IBT
+	# GCC >= 9 and binutils >= 2.29
+	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
+	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
@@ -124,6 +129,18 @@ config XEN_SHSTK
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
index fa7cf3844362..8b88f0240e85 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -47,6 +47,12 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
+ifdef CONFIG_XEN_IBT
+CFLAGS += -fcf-protection=branch -mmanual-endbr
+else
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+endif
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
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


