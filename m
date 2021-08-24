Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691E3F5CBC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171091.312406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCS-0002tC-47; Tue, 24 Aug 2021 11:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171091.312406; Tue, 24 Aug 2021 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCR-0002al-8F; Tue, 24 Aug 2021 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 171091;
 Tue, 24 Aug 2021 11:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3t-0003Ux-Do
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:45 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5691fed0-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:13 +0000 (UTC)
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
X-Inumbo-ID: 5691fed0-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JKae5i6vI6z84xnZFSIGHO3fodNWP34RAROxD/VJljA=;
  b=gu5SXIibA4VPLzV9BWYDCmDhM64u3BEQpHkPFZScFirSFm78SCtIrH/j
   oslytFuhHf2OnvtkDkoYFIwbHmZgTHe+7BBGSTH11PmGyLyracHHO8ZwU
   Fs0scFX0U7zXE5JK+L28bJoRl3u0M06HmkuEVYPKqwQmN3P1vuo9WyDD3
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sBd9LM/q+xd6T31KeR1NTNpwbKnsYI8CEIgHeVqYZUvX+P4xEF0szHPATeiBiwnZDdBC6UdAqq
 LsNqzL7J/Zgj/Eq0DX/z+wmM9zhdnKevPqh7Q8Bx9K2AnS+UFG9WnY/B+OqQFr2wENvaGmYm9I
 d/b/cMi0J+v8oZxcRBxHBzowIWWLG1H5y94HAkf1k5mu9SInwVVJA6DwC7TBnc98Av+Ve77IKT
 WYDPu0SdRjpaDHvtfyXXDIur3rUC+2nI3pMSSuGpuYYUJ3y0MVZSIdYC3mURJLPdlRcHW6iJiQ
 0T/KDwrxSHPps9A1vM1emIoW
X-SBRS: 5.1
X-MesageID: 51166408
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zHusYqHDoOblToX6pLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166408"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v7 42/51] build: grab common EFI source files in arch specific dir
Date: Tue, 24 Aug 2021 11:50:29 +0100
Message-ID: <20210824105038.1257926-43-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rather than preparing the efi source file, we will copy them as needed
from the build location.

Avoid the links as they seems fragile in out-of-tree builds. Also by
making a copy, we don't need to figure out the relative path or we
don't need to use absolute path.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile              | 5 -----
 xen/arch/arm/efi/Makefile | 6 ++++++
 xen/arch/x86/efi/Makefile | 6 ++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 950bee10ba38..4c1dd9ce2ea1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -425,11 +425,6 @@ $(TARGET).gz: $(TARGET)
 $(TARGET): tools_fixdep FORCE
 	$(MAKE) $(build)=tools
 	$(MAKE) $(build)=. include/xen/compile.h
-	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
-		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
-		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
-		done; \
-		true
 	$(MAKE) $(build)=include all
 	$(MAKE) $(build)=arch/$(TARGET_ARCH) include
 	$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 1b1ed06feddc..36e15ac280cd 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,10 @@
 CFLAGS-y += -fshort-wchar
+CFLAGS-y += -I$(srctree)/common/efi
 
 obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
+
+$(obj)/%.c: common/efi/%.c
+	$(Q)cp -f $< $@
+
+.PRECIOUS: $(obj)/%.c
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index ac815f02cb5e..da05935a9348 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,4 +1,5 @@
 CFLAGS-y += -fshort-wchar
+CFLAGS-y += -I$(srctree)/common/efi
 
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
@@ -19,3 +20,8 @@ obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
+
+$(obj)/%.c: common/efi/%.c
+	$(Q)cp -f $< $@
+
+.PRECIOUS: $(obj)/%.c
-- 
Anthony PERARD


