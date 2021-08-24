Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87EE3F5C61
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170897.311935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1L-0002SA-5A; Tue, 24 Aug 2021 10:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170897.311935; Tue, 24 Aug 2021 10:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1K-0002Nw-WF; Tue, 24 Aug 2021 10:51:07 +0000
Received: by outflank-mailman (input) for mailman id 170897;
 Tue, 24 Aug 2021 10:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1J-0001EC-8G
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba79b65f-1574-4338-8e89-3dc8bd3c0e8d;
 Tue, 24 Aug 2021 10:50:54 +0000 (UTC)
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
X-Inumbo-ID: ba79b65f-1574-4338-8e89-3dc8bd3c0e8d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dpg5dNCI5KoYFV8Mi9Zw+FnUJgLgwOk+tl2lsfCuIpI=;
  b=WxQTo/I68+jj5YzY1gJyYz1ev9mkqdoNEXfujm79XBCj9tZlRJY42LTd
   8yQNd/cpA8WXl6Q1rhw9ynwmNGoVWgEKWdcqSus0dQzrqEtJ7Y+nG9MbV
   c62suEx0bVb33v0UDsPdJKD/8BNk7mMRb+q81NjdKvjSQjZc7cCDOAzXI
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S8yQSeJGRsoRd1pLsohXAez0LXWsoIxiAww9UL1Cn8mi7ctWXmaZ2w5CO45h5BMeDlNTLc6So5
 qdHXXJdFKfxHesppObzaDL4FjKCSGaUQ1HqWZOJcPbn6f0nMTOfBIRJUtdp0gP1Igi/3WW74DT
 nV1Vm49eK2n5It0a5IQU8B0+cxTkEcqXLXxZfv9L9szJ/vIAPeGUFkUD23HUjN6/7bfzQhQVcF
 AgrJKr/CdCDheh23u2gOeybdbcVfuYuEMt0WbMdjJFuhEto/dme14F38+n7w3gtaAUdnkbWRhj
 FTa+aGqnCBo8zqzyVxLFx/VX
X-SBRS: 5.1
X-MesageID: 51540863
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DVxTCqv7YSBWhy7LR4RO3J1L7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540863"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v7 04/51] build: factorise generation of the linker scripts
Date: Tue, 24 Aug 2021 11:49:51 +0100
Message-ID: <20210824105038.1257926-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In Arm and X86 makefile, generating the linker script is the same, so
we can simply have both call the same macro.

We need to add *.lds files into extra-y so that Rules.mk can find the
.*.cmd dependency file and load it.

Change made to the command line:
- Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
- Added -D__LINKER__ even it is only used by Arm's lds.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v6:
    - CPP already used instead of CC -E
    - -Ui386 already removed
    - cpp_flags is now a macro
    - rebased
    
    v5:
    - rename cc_lds_S to cpp_lds_S as the binary runned is now CPP
    - Use new cpp_flags instead of the open-coded filter of a_flags.
    
    v4:
    - fix rebuild by adding FORCE as dependency
    - Use $(CPP)
    - remove -Ui386
    - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
      still mandatory for if_changed (or cmd) macro to work.

 xen/Rules.mk          | 4 ++++
 xen/arch/arm/Makefile | 6 ++++--
 xen/arch/x86/Makefile | 6 ++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index eaf770414305..3f61682ceab7 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -255,6 +255,10 @@ cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 %.s: %.S FORCE
 	$(call if_changed,cpp_s_S)
 
+# Linker scripts, .lds.S -> .lds
+quiet_cmd_cpp_lds_S = LDS     $@
+cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
+
 # Add intermediate targets:
 # When building objects with specific suffix patterns, add intermediate
 # targets that the final targets are derived from.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d3b97b5b440..0edd9dee6f49 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -66,6 +66,8 @@ obj-y += vpsci.o
 obj-y += vuart.o
 extra-y += $(TARGET_SUBARCH)/head.o
 
+extra-y += xen.lds
+
 #obj-bin-y += ....o
 
 ifneq ($(CONFIG_DTB_FILE),"")
@@ -133,8 +135,8 @@ $(TARGET)-syms: prelink.o xen.lds
 .PHONY: include
 include:
 
-xen.lds: xen.lds.S
-	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
+xen.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 462472215c91..929227f5a3ac 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,6 +79,7 @@ obj-y += sysctl.o
 endif
 
 extra-y += asm-macros.i
+extra-y += xen.lds
 
 ifneq ($(CONFIG_HVM),y)
 x86_emulate.o: CFLAGS-y += -Wno-unused-label
@@ -239,6 +240,7 @@ endif
 note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
+extra-y += efi.lds
 $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
@@ -291,8 +293,8 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	$(call move-if-changed,$@.new,$@)
 
 efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S
-	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
+xen.lds efi.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-- 
Anthony PERARD


