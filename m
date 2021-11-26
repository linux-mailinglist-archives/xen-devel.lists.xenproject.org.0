Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B845EE03
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232670.403482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRW-0002QV-1r; Fri, 26 Nov 2021 12:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232670.403482; Fri, 26 Nov 2021 12:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRV-0002J2-O1; Fri, 26 Nov 2021 12:35:05 +0000
Received: by outflank-mailman (input) for mailman id 232670;
 Fri, 26 Nov 2021 12:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRT-0001V1-Bj
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46703287-4eb5-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 13:35:02 +0100 (CET)
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
X-Inumbo-ID: 46703287-4eb5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQYtvEE7popO91dkZaKOY9KOwwyjuGb56VfMJICY5lw=;
  b=VNbcx+E8q9K2fLfplyO7Mr3j4LE1+Q/Zdcam7DGcAIVZPIX9USjYztIo
   sN2Gd8Rd3Bsp45gWxfJT6AjqrRg1rTVP+9vbRm/8EICC/AiISQtoqD2cl
   jsbeYFURmDQEgX5Pb1z4j/JaGXEeEDA41/jQnMgWD2D9fvaZqUKEZw076
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p/3ImIYAQw3Osavz7EyZ3PLUHL28sqDHszVEaLWodjgPmfMPk+AR0rrRlAMxeDhXcDREAZ2xYw
 A8fYJnV2D4AoetVlQWkUIvgjTwR5kJwYftzjeEl2FKW3YWXiZLMKrnhR6afxESEJqgQZ3u/yQ0
 KNWScBdmgMJ8Jg4Nb/xW+Cd012cIk2RQXFO9ewccP9F0mKCjZ4NlhX3dHBzdmEIzayH7uceWkh
 TCF/nWBl3CIcj7Io1TwRUruXcwANIJiiQIDd3RAI5C6sLyWZL5Ktxtjp0d0cHuAwzk4pikWYSD
 3VnIzqhbf2f8vLpwSP243xhM
X-SBRS: 5.1
X-MesageID: 58192114
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Msgwna7qd/bCFvxQr0OlDQxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mtJUDvVa/rcNjbxfdF3PYW18xxQsZOBm4NhSwZkrCBhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 fdM8rDpZS4QHoLyvL49EAEAIyxfFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTa+PP
 ZNANVKDajz6aT9TAgZLBqllp82BmVzRbWwB9HGs8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+tyEqoWsS2k84r73SLDJiscFg5MSfVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:60Fb2aG+eXBUxhYqpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58192114"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 01/65] x86: Introduce support for CET-IBT
Date: Fri, 26 Nov 2021 12:33:42 +0000
Message-ID: <20211126123446.32324-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
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
---
 Config.mk                              |  1 -
 tools/firmware/Makefile                |  2 ++
 xen/arch/x86/Kconfig                   | 17 +++++++++++++++++
 xen/arch/x86/arch.mk                   |  6 ++++++
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 +++++
 xen/include/asm-x86/asm-defns.h        |  6 ++++++
 xen/include/asm-x86/cpufeature.h       |  1 +
 xen/include/asm-x86/cpufeatures.h      |  1 +
 xen/include/xen/compiler.h             |  6 ++++++
 9 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 6587c7d626c9..508261a7dcf4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -199,7 +199,6 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
-EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 1f2711779400..b2fd73248604 100644
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
index ce0c1a0e7fb2..1c8381f7c9d8 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -46,6 +46,12 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
+ifdef CONFIG_HAS_CC_CET_IBT
+CFLAGS += -fcf-protection=branch -mmanual-endbr
+else
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+endif
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d8fb3a990933..4a483a464804 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -35,6 +35,11 @@
 # error Unknown compilation width
 #endif
 
+#ifndef cf_check
+/* Cope with userspace build not knowing about CET-IBT */
+#define cf_check
+#endif
+
 struct x86_emulate_ctxt;
 
 /*
diff --git a/xen/include/asm-x86/asm-defns.h b/xen/include/asm-x86/asm-defns.h
index 505f39ad5f76..8bd9007731d5 100644
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
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
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 4754940e23f3..d9e1cd87f0fb 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -151,6 +151,7 @@
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
 #define cpu_has_xen_shstk       boot_cpu_has(X86_FEATURE_XEN_SHSTK)
+#define cpu_has_xen_ibt         boot_cpu_has(X86_FEATURE_XEN_IBT)
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index b10154fc44bb..7413febd7ad8 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -39,6 +39,7 @@ XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* VERW used by Xen for PV */
 XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
+XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 696c7eb89e4c..575036f44b3b 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -37,6 +37,12 @@
 # define nocall
 #endif
 
+#ifdef CONFIG_HAS_CC_CET_IBT
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


