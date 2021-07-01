Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF073B92ED
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148714.274898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOz-0000Mf-B0; Thu, 01 Jul 2021 14:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148714.274898; Thu, 01 Jul 2021 14:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOz-0000HI-67; Thu, 01 Jul 2021 14:10:49 +0000
Received: by outflank-mailman (input) for mailman id 148714;
 Thu, 01 Jul 2021 14:10:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOx-0005F9-JU
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13833227-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:25 +0000 (UTC)
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
X-Inumbo-ID: 13833227-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uuyAZES2mXpdo7RpfZEYfJQS/0KceaGe4Dk4hEnlg9Y=;
  b=OorIn9AQhSLuRrI7wKdJAjWWVd2dGx264u+hA7yjIbS8MgJL89TB9SW8
   vDjmdvlFK2LMcB4rRHns/WgBNJtjNobiUN8r1Akta/SI/9oRADIL6NhGJ
   MG+GArcMDN3GjYVAJDcGWweOYTkBiz9ByKfIyz56CMp1dPxAdA6YFKVB3
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UlKbJEVjkqdCitesAqRIdhA8VQWWfhTd7M/0fsiuU0CO2T4g9F0Ctuf7n35sXw7vU/LXF4tKlM
 B0Ue5Zn3H4PMY98To+f9RmB369r56t7ttJBaYJwh20kxxE51o6BO6jNHd/RG/9czYtKYEjskkq
 mwLIaNv/SKjHgzFywA4Xmjkg9/UH35ps0I08xVhxpcTlRFnWdtqF0OfD5X73p+ChcH676VTUcP
 xdinlcsmcByDfuTKArF5Ju2WzVt474neclk7Wedw1gPAWNIomnOOwErYPFr93UJE+LOqT51n+P
 wVs=
X-SBRS: 5.1
X-MesageID: 47755333
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+QPBhaMw/wec98BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755333"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v6 05/31] build: factorise generation of the linker scripts
Date: Thu, 1 Jul 2021 15:09:45 +0100
Message-ID: <20210701141011.785641-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
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
index 4adc90eec80d..f05b2d3f0399 100644
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
index 2ec883456e48..08a4ec1944d3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,6 +79,7 @@ obj-y += sysctl.o
 endif
 
 extra-y += asm-macros.i
+extra-y += xen.lds
 
 ifneq ($(CONFIG_HVM),y)
 x86_emulate.o: CFLAGS-y += -Wno-unused-label
@@ -240,6 +241,7 @@ endif
 note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
+extra-y += efi.lds
 $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
@@ -292,8 +294,8 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	$(call move-if-changed,$@.new,$@)
 
 efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S
-	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
+xen.lds efi.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-- 
Anthony PERARD


