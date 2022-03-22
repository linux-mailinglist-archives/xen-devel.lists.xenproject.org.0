Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073614E3D77
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293376.498388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbD-000296-6W; Tue, 22 Mar 2022 11:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293376.498388; Tue, 22 Mar 2022 11:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbD-00026Z-2J; Tue, 22 Mar 2022 11:22:51 +0000
Received: by outflank-mailman (input) for mailman id 293376;
 Tue, 22 Mar 2022 11:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbB-0001wJ-EA
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66106b03-a9d2-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 12:22:47 +0100 (CET)
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
X-Inumbo-ID: 66106b03-a9d2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CTFDMVJ9UQNI3tpTHwdI+DnHPvju2Tgd9bnCsFPvWRo=;
  b=WrnEp+u/M+gs3w/mV+a/0LMx20rQ7P9s1kgG8roCpY/RKM/iO5n4Od5M
   0UM9kjL/RPOaRLRuc2LQsYSpdkGLoBQl0S04ZjnI3tkdLxzAFEypvDxz5
   kJ5q+Sq+X0Bn/6YOgrI2rnyABipWB+3Ai1i+EwIeRtwwqzwgFbviVQshv
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69219496
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SCGlsK4/KuIB993FtBwsNAxRtOPHchMFZxGqfqrLsTDasY5as4F+v
 jFOWG2GafeKYGfyft5waYrn/EIC7MfRy9UyTQc6ryo9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTrWToSEYTAhtgcXgt6GBNUBYRt0r3YdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RIM2M+MEWeC/FJElg5C7Qdrc75vFviWjhKknisrvEl4UGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyPtGF1SCM9H7qg+bVhD76Q6obDrj+/flv6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa71e3R9PwWxm5pn+svRMGXddUVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1QvXvgmDj5TXcg849CfcbEidxyhTZpHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJN7KigbArLWdrGR2Cg2bKhAgBd2B2zckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bBNC7KFOhUagXTBgzc0E9iiF+Jm
 zq4H5HXoyizrcWkOnWHmWLtBQ5iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6JcKpvaXagXFGivFvZ0RcCVkbGOvS+D3WqmVxdJqhBmF3K8b2QlIuPZQzY=
IronPort-HdrOrdr: A9a23:553kS6zma+xs4wBx6yPBKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="69219496"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v10 1/7] build: grab common EFI source files in arch specific dir
Date: Tue, 22 Mar 2022 11:22:32 +0000
Message-ID: <20220322112238.1117737-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rather than preparing the efi source file, we will make the symbolic
link as needed from the build location.

The `ln` command is run every time to allow to update the link in case
the source tree change location.

This patch also introduce "efi-common.mk" which allow to reuse the
common make instructions without having to duplicate them into each
arch.

And now that we have a list of common source file, we can start to
remove the links to the source files on clean.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v10:
    - acked
    - small change to comment in efi_common.mk
    - rebased, removed change "subdir- += efi" in xen/arch/x86/Makefile as
      it isn't needed anymore.
    
    v9:
    - rename efi_common.mk to efi-common.mk
    - generalize comment about cleaning "efi" and "boot" subdir in x86.
    - add a space after the other comma of $(patsubst )
    - create a relative symlink instead of an absolute one
    - with the above, we don't need to use $(abs_srctree) anymore in the
      prerequisite of the link to the efi source file, use $(srctree).
    
    v8:
    - use symbolic link instead of making a copy of the source
    - introduce efi_common.mk
    - remove links to source file on clean
    - use -iquote for "efi.h" headers in common/efi

 xen/Makefile                 |  5 -----
 xen/arch/arm/efi/Makefile    |  4 ++--
 xen/arch/x86/efi/Makefile    |  5 +----
 xen/common/efi/efi-common.mk | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 xen/common/efi/efi-common.mk

diff --git a/xen/Makefile b/xen/Makefile
index 18a4f7e1015a..dec489f2a909 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -441,11 +441,6 @@ $(TARGET).gz: $(TARGET)
 $(TARGET): FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
-	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
-		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
-		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
-		done; \
-		true
 	$(Q)$(MAKE) $(build)=include all
 	$(Q)$(MAKE) $(build)=arch/$(TARGET_ARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 1b1ed06feddc..4313c390665f 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi-common.mk
 
-obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
+obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index e08b4d8e4808..034ec87895df 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi-common.mk
 
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
@@ -8,9 +8,6 @@ $(obj)/%.o: $(src)/%.ihex FORCE
 
 $(obj)/boot.init.o: $(obj)/buildid.o
 
-EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
-EFIOBJ-$(CONFIG_COMPAT) += compat.o
-
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
new file mode 100644
index 000000000000..960d44a6d55b
--- /dev/null
+++ b/xen/common/efi/efi-common.mk
@@ -0,0 +1,15 @@
+EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-$(CONFIG_COMPAT) += compat.o
+
+CFLAGS-y += -fshort-wchar
+CFLAGS-y += -iquote $(srctree)/common/efi
+
+# Part of the command line transforms $(obj)
+# e.g.: It transforms "dir/foo/bar" into successively
+#       "dir foo bar", ".. .. ..", "../../.."
+$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
+
+clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
+
+.PRECIOUS: $(obj)/%.c
-- 
Anthony PERARD


