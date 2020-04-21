Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2401B2C06
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:13:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvW4-0005jq-Lx; Tue, 21 Apr 2020 16:12:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvW2-0005iI-HN
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:54 +0000
X-Inumbo-ID: efada4b8-83ea-11ea-9160-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efada4b8-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQRaVk/v7QW+wcXm5kKKaYVv1dsIzBGEE54VZC5qCQM=;
 b=QFHvQuH5mqQtpreZ1hVn5b2uqsM8V7PIuFDabFGhTUYolK7qdQxVJJSH
 SdBTzdGa3RePi7d2UVPRValm6juA90WjlpuBobAvplnkEF2emrruJRn2z
 X6sSG26lxL50QQb9Zvl05L8ygGszxmWzetc94FCxevhn3ARGdM0+fj+J/ 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RuL8iKNRLtVvNJJ7CxqCEc+OTd+Y44oac2zE58IMbR6GruoGJWHV0RInsFDQ4hqI7mWfLJwTNA
 ux3FkUbeWLwCYIZ45FDlqsB/PUKYenCcQEYILmZJ8u38tb8dOIRt98jE2nkX0rIbcsoUzou9u5
 brt0Ewe0hJp4tUYhfyeE7Rkv0UmjXRw14nA2Jl8GMlHQlgzyfeSk3ULBLxzYqye8qNB8NBYsHs
 ZN1sm5cPVjk3CWXf22VqJkQ0W2O8JO/h0bGIXzTAjpyc/s7JkAmpSfejS3ufPEP9pUR0898zDo
 60Q=
X-SBRS: 2.7
X-MesageID: 15998896
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="15998896"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 11/16] xen/build: factorise generation of the linker
 scripts
Date: Tue, 21 Apr 2020 17:12:03 +0100
Message-ID: <20200421161208.2429539-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In Arm and X86 makefile, generating the linker script is the same, so
we can simply have both call the same macro.

We need to add *.lds files into extra-y so that Rules.mk can find the
.*.cmd dependency file and load it.

Change made to the command line:
- Use of $(CPP) instead of $(CC) -E
- Remove -Ui386.
  We don't compile Xen for i386 anymore, so that macro is never
  defined. Also it doesn't make sense on Arm.
- Use $(cpp_flags) which simply filter -Wa,% options from $(a_flags).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - rename cc_lds_S to cpp_lds_S as the binary runned is now CPP
    - Use new cpp_flags instead of the open-coded filter of a_flags.
    
    v4:
    - fix rebuild by adding FORCE as dependency
    - Use $(CPP)
    - remove -Ui386
    - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
      still mandatory for if_changed (or cmd) macro to work.

 xen/Rules.mk          | 6 ++++++
 xen/arch/arm/Makefile | 8 ++++----
 xen/arch/x86/Makefile | 8 ++++----
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 9150911296de..877f52d871fa 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -236,6 +236,12 @@ cmd_s_S = $(CPP) $(cpp_flags) $< -o $@
 %.s: %.S FORCE
 	$(call if_changed,cpp_s_S)
 
+# Linker scripts, .lds.S -> .lds
+quiet_cmd_cpp_lds_S = LDS     $@
+cmd_cpp_lds_S = $(CPP) -P $(cpp_flags) -o $@ $<; \
+    sed -e 's/.*\.lds\.o:/$(@F):/g' <$(dot-target).d >$(dot-target).d.new; \
+    mv -f $(dot-target).d.new $(dot-target).d
+
 # Add intermediate targets:
 # When building objects with specific suffix patterns, add intermediate
 # targets that the final targets are derived from.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b79ad55646bd..68cb258870eb 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -64,6 +64,8 @@ obj-y += vpsci.o
 obj-y += vuart.o
 extra-y += $(TARGET_SUBARCH)/head.o
 
+extra-y += xen.lds
+
 #obj-bin-y += ....o
 
 ifdef CONFIG_DTB_FILE
@@ -122,10 +124,8 @@ $(TARGET)-syms: prelink.o xen.lds
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
 
-xen.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
-	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
-	mv -f .xen.lds.d.new .xen.lds.d
+xen.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 dtb.o: $(CONFIG_DTB_FILE)
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 44137d919b66..92430192a74e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -72,6 +72,7 @@ obj-y += hpet.o
 obj-y += vm_event.o
 obj-y += xstate.o
 extra-y += asm-macros.i
+extra-y += xen.lds
 
 x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
 
@@ -173,6 +174,7 @@ export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.
 # Check if the linker supports PE.
 XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+extra-$(XEN_BUILD_PE) += efi.lds
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
@@ -240,10 +242,8 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	$(call move-if-changed,$@.new,$@)
 
 efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
-	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
-	mv -f .$(@F).d.new .$(@F).d
+xen.lds efi.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-- 
Anthony PERARD


