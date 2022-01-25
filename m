Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3D49B27F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260070.449142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZs-0000Fn-Ry; Tue, 25 Jan 2022 11:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260070.449142; Tue, 25 Jan 2022 11:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZs-0000Cm-NE; Tue, 25 Jan 2022 11:01:32 +0000
Received: by outflank-mailman (input) for mailman id 260070;
 Tue, 25 Jan 2022 11:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZr-0006t5-1h
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24d23da9-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:29 +0100 (CET)
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
X-Inumbo-ID: 24d23da9-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sNl4bPmX9dTS+5YDZmdya9oiB0ABpA/UdxR4bIH2cNY=;
  b=U50OhF7Td8R3dIsR1Bfgiq2WNn94S2QOApmtr1ZCfwWByD1D50KBpORg
   YohDq87B1PZzOfGuoH3cOaTri9pHkXQjdj+zadjd5OuJ0M06HtGySmxKT
   BqzklWY7V+krdZmIqjqEY+a8NO8Sm4bXF+x74kFNuSXyVMs4Ceh+rk4ZP
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DK+UA1nPvpgmZd2q6KdNxUmlG80r+IMo4+HJgNSOX6ZvNfGUhoKjz/HcRDbr2zUlDCAH/BVHmb
 60eub6i1sjFRCPPbnoIlayhOfY1gGcKp/CMBl79EUrdBSqW+Hoal7ZWSAnjxQ8WGTvKFL2qDqr
 LQN5+V6b8uwFNfmsvUxw0idVCYAatb0P+7IKIjpzXkenuxMiKo/oVVw5jLitf+7djdFtu8D3hX
 k7B/1VSvqpbFpZGSUxmwAL+jOcCpUq9c1j0RLoVyAwV1f1m6PO30oK5HTA0BDCshwyDLvz4vqb
 DQbrqZezrDB0x2gp29/WZYWp
X-SBRS: 5.2
X-MesageID: 64860825
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tWSijq+NkRTYF+Int3YCDrUDFHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 jcZUG7TOvaPZGf0e490OoSy9UsPsMWEyNU1GlQ+pCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhX5
 o0Skq68UT43FfXcybkMdTR5TQVHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4STaiGN
 5BEAdZpRCvgOUAfH2olNLAZv+akqFPwKTQDsHvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6F7q+7PdmxkKSwm87DwcfXl+25/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOttIyRDEs/
 k+EmZXuHzMHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby//N+N4UvB7Xd8hISL7k08zTNBCu5
 wnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBZw5D20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBb55sldzBO
 ha7VeZtCHl7ZifCgUhfONrZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9jY
 s/HIJnzUydLUcyLKQZaoc9HjdfHIQhlnQvuqW3TlUz7gdJymlbLIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WOUHqHXooBQlSdxATXMmuw+QOL7LrClc4RAkJVqGAqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3xUr3y3QNCA6AF4uNL4ixU8G0dsEZAbxhCN7MN/xtc/ytfIfJNEayQCq9tYsJ
 9FtRilKKq0npu3v92tPYJ/jgpZlcRj31wuCMzD8OGo0foJ6RhyP8djhJ1O9+C4LByuxlM0/v
 7z/iV+LHctdH1xvXJTMdfai71KtpnxByuh8aFTFf4tIc0L2/Yk0dyGo1q0rI9sBIAnozyeB0
 1rEGg8RoOTA+tdn8NTAia2egZ2uFu9yQhhTE2XBtO7kPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtMlQbhxzK8469/+nJNgz1xpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTf4KhnIEj+4yMrrrOLXV8LYkuJgS1ZarB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxKUpX2jgcLy01ZZc2OAyD715iDdtFQPxR4O
 TSTnqfD2+xRy0eqn6DfzpQRMT6xXagzhS0=
IronPort-HdrOrdr: A9a23:DiU0JqGbxt1IVw+QpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 WTdZUgpHjJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSibcKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860825"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [XEN PATCH v9 06/30] build: rework test/livepatch/Makefile
Date: Tue, 25 Jan 2022 11:00:39 +0000
Message-ID: <20220125110103.3527686-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This rework the livepatch/Makefile to make it less repetitive and make
use of the facilities. All the targets to be built are now listed in
$(extra-y) which will allow Rules.mk to build them without the need of
a local target in a future patch.

There are some changes/fixes in this patch:
- when "xen-syms" is used for a target, it is added to the dependency
  list of the target, which allow to rebuild the target when xen-syms
  changes. But if "xen-syms" is missing, make simply fails.
- modinfo.o wasn't removing it's $@.bin file like the other targets,
  this is now done.
- The command to build *.livepatch targets as been fixed to use
  $(XEN_LDFLAGS) rather than just $(LDFLAGS) which is a fallout from
  2740d96efdd3 ("xen/build: have the root Makefile generates the
  CFLAGS")

make will findout the dependencies of the *.livepatch files and thus
what to built by "looking" at the objects listed in the *-objs
variables. The actual dependencies is generated by the new
"multi-depend" macro.

"$(targets)" needs to be updated with the objects listed in the
different *-objs variables to allow make to load the .*.cmd dependency
files.

This patch copies the macro "multi_depend" from Linux 5.12, and rename
it to "multi-depend".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - half acked, still need "livepatch" maintainer ack.
    
    v8:
    - rename multi_depend to multi-depend
    - use $() for single-letter make variable
    - re-indent one line

 xen/scripts/Kbuild.include  |   9 ++
 xen/test/livepatch/Makefile | 213 ++++++++++++++----------------------
 2 files changed, 91 insertions(+), 131 deletions(-)

diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index f75d724ed7fd..73caf238d42c 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -151,3 +151,12 @@ why =                                                                        \
 
 echo-why = $(call escsq, $(strip $(why)))
 endif
+
+# Useful for describing the dependency of composite objects
+# Usage:
+#   $(call multi-depend, multi-used-targets, suffix-to-remove, suffix-to-add)
+define multi-depend
+$(foreach m, $(notdir $1), \
+	$(eval $(obj)/$(m): \
+	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
+endef
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 148dddb90473..69fadccd01ea 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -12,81 +12,29 @@ CODE_ADDR=$(shell nm --defined $(1) | grep $(2) | awk '{print "0x"$$1}')
 CODE_SZ=$(shell nm --defined -S $(1) | grep $(2) | awk '{ print "0x"$$2}')
 
 .PHONY: default
-
-LIVEPATCH := xen_hello_world.livepatch
-LIVEPATCH_BYE := xen_bye_world.livepatch
-LIVEPATCH_REPLACE := xen_replace_world.livepatch
-LIVEPATCH_NOP := xen_nop.livepatch
-LIVEPATCH_NO_XEN_BUILDID := xen_no_xen_buildid.livepatch
-LIVEPATCH_PREPOST_HOOKS := xen_prepost_hooks.livepatch
-LIVEPATCH_PREPOST_HOOKS_FAIL := xen_prepost_hooks_fail.livepatch
-LIVEPATCH_ACTION_HOOKS := xen_action_hooks.livepatch
-LIVEPATCH_ACTION_HOOKS_NOFUNC := xen_action_hooks_nofunc.livepatch
-LIVEPATCH_ACTION_HOOKS_MARKER:= xen_action_hooks_marker.livepatch
-LIVEPATCH_ACTION_HOOKS_NOAPPLY:= xen_action_hooks_noapply.livepatch
-LIVEPATCH_ACTION_HOOKS_NOREVERT:= xen_action_hooks_norevert.livepatch
-LIVEPATCH_EXPECTATIONS:= xen_expectations.livepatch
-LIVEPATCH_EXPECTATIONS_FAIL:= xen_expectations_fail.livepatch
-
-LIVEPATCHES += $(LIVEPATCH)
-LIVEPATCHES += $(LIVEPATCH_BYE)
-LIVEPATCHES += $(LIVEPATCH_REPLACE)
-LIVEPATCHES += $(LIVEPATCH_NOP)
-LIVEPATCHES += $(LIVEPATCH_NO_XEN_BUILDID)
-LIVEPATCHES += $(LIVEPATCH_PREPOST_HOOKS)
-LIVEPATCHES += $(LIVEPATCH_PREPOST_HOOKS_FAIL)
-LIVEPATCHES += $(LIVEPATCH_ACTION_HOOKS)
-LIVEPATCHES += $(LIVEPATCH_ACTION_HOOKS_NOFUNC)
-LIVEPATCHES += $(LIVEPATCH_ACTION_HOOKS_MARKER)
-LIVEPATCHES += $(LIVEPATCH_ACTION_HOOKS_NOAPPLY)
-LIVEPATCHES += $(LIVEPATCH_ACTION_HOOKS_NOREVERT)
-LIVEPATCHES += $(LIVEPATCH_EXPECTATIONS)
-LIVEPATCHES += $(LIVEPATCH_EXPECTATIONS_FAIL)
-
-LIVEPATCH_DEBUG_DIR ?= $(DEBUG_DIR)/xen-livepatch
-
 build default: livepatch
 
-install: livepatch
-	$(INSTALL_DIR) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
-	$(INSTALL_DATA) $(LIVEPATCHES) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
-
-uninstall:
-	cd $(DESTDIR)$(LIVEPATCH_DEBUG_DIR) && rm -f $(LIVEPATCHES)
-
-.PHONY: clean
-clean::
-	rm -f *.o .*.o.d *.livepatch config.h expect_config.h
+extra-y += xen_hello_world.livepatch
+xen_hello_world-objs := xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
+$(obj)/xen_hello_world.o: $(obj)/config.h
 
 #
 # To compute these values we need the binary files: xen-syms
 # and xen_hello_world_func.o to be already compiled.
 #
-.PHONY: config.h
-config.h: OLD_CODE_SZ=$(call CODE_SZ,$(BASEDIR)/xen-syms,xen_extra_version)
-config.h: NEW_CODE_SZ=$(call CODE_SZ,$<,xen_hello_world)
-config.h: MINOR_VERSION_SZ=$(call CODE_SZ,$(BASEDIR)/xen-syms,xen_minor_version)
-config.h: MINOR_VERSION_ADDR=$(call CODE_ADDR,$(BASEDIR)/xen-syms,xen_minor_version)
-config.h: xen_hello_world_func.o
+$(obj)/config.h: $(obj)/xen_hello_world_func.o
 	(set -e; \
-	 echo "#define NEW_CODE_SZ $(NEW_CODE_SZ)"; \
-	 echo "#define MINOR_VERSION_SZ $(MINOR_VERSION_SZ)"; \
-	 echo "#define MINOR_VERSION_ADDR $(MINOR_VERSION_ADDR)"; \
-	 echo "#define OLD_CODE_SZ $(OLD_CODE_SZ)") > $@
+	 echo "#define NEW_CODE_SZ $(call CODE_SZ,$<,xen_hello_world)"; \
+	 echo "#define MINOR_VERSION_SZ $(call CODE_SZ,$(BASEDIR)/xen-syms,xen_minor_version)"; \
+	 echo "#define MINOR_VERSION_ADDR $(call CODE_ADDR,$(BASEDIR)/xen-syms,xen_minor_version)"; \
+	 echo "#define OLD_CODE_SZ $(call CODE_SZ,$(BASEDIR)/xen-syms,xen_extra_version)") > $@
 
-xen_hello_world.o: config.h
-
-.PHONY: $(LIVEPATCH)
-$(LIVEPATCH): xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH) $^
-
-.PHONY: modinfo.o
-modinfo.o:
+$(obj)/modinfo.o:
 	(set -e; \
 	 printf "LIVEPATCH_RULEZ\0") > $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.modinfo,alloc,load,readonly,data,contents -S $@.bin $@
-	#rm -f $@.bin
+	rm -f $@.bin
 
 #
 # This target is only accessible if CONFIG_LIVEPATCH is defined, which
@@ -97,9 +45,8 @@ modinfo.o:
 # not be built (it is for EFI builds), and that we do not have
 # the note.o.bin to muck with (as it gets deleted)
 #
-.PHONY: note.o
-note.o:
-	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $(BASEDIR)/xen-syms $@.bin
+$(obj)/note.o: $(BASEDIR)/xen-syms
+	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.livepatch.depends,alloc,load,readonly,data,contents -S $@.bin $@
 	rm -f $@.bin
@@ -108,9 +55,8 @@ note.o:
 # Append .livepatch.xen_depends section
 # with Xen build-id derived from xen-syms.
 #
-.PHONY: xen_note.o
-xen_note.o:
-	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $(BASEDIR)/xen-syms $@.bin
+$(obj)/xen_note.o: $(BASEDIR)/xen-syms
+	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.livepatch.xen_depends,alloc,load,readonly,data,contents -S $@.bin $@
 	rm -f $@.bin
@@ -119,102 +65,107 @@ xen_note.o:
 # Extract the build-id of the xen_hello_world.livepatch
 # (which xen_bye_world will depend on).
 #
-.PHONY: hello_world_note.o
-hello_world_note.o: $(LIVEPATCH)
-	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $(LIVEPATCH) $@.bin
+$(obj)/hello_world_note.o: $(obj)/xen_hello_world.livepatch
+	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.livepatch.depends,alloc,load,readonly,data,contents -S $@.bin $@
 	rm -f $@.bin
 
-xen_bye_world.o: config.h
 
-.PHONY: $(LIVEPATCH_BYE)
-$(LIVEPATCH_BYE): xen_bye_world_func.o xen_bye_world.o hello_world_note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_BYE) $^
+extra-y += xen_bye_world.livepatch
+xen_bye_world-objs := xen_bye_world_func.o xen_bye_world.o hello_world_note.o xen_note.o
+$(obj)/xen_bye_world.o: $(obj)/config.h
 
-xen_replace_world.o: config.h
 
-.PHONY: $(LIVEPATCH_REPLACE)
-$(LIVEPATCH_REPLACE): xen_replace_world_func.o xen_replace_world.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_REPLACE) $^
+extra-y += xen_replace_world.livepatch
+xen_replace_world-objs := xen_replace_world_func.o xen_replace_world.o note.o xen_note.o
+$(obj)/xen_replace_world.o: $(obj)/config.h
 
-xen_nop.o: config.h
 
-.PHONY: $(LIVEPATCH_NOP)
-$(LIVEPATCH_NOP): xen_nop.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_NOP) $^
+extra-y += xen_nop.livepatch
+xen_nop-objs := xen_nop.o note.o xen_note.o
+$(obj)/xen_nop.o: $(obj)/config.h
 
 # This one always fails upon upload, because it deliberately
 # does not have a .livepatch.xen_depends (xen_note.o) section.
-xen_no_xen_buildid.o: config.h
-
-.PHONY: $(LIVEPATCH_NO_XEN_BUILDID)
-$(LIVEPATCH_NO_XEN_BUILDID): xen_nop.o note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_NO_XEN_BUILDID) $^
+extra-y += xen_no_xen_buildid.livepatch
+xen_no_xen_buildid-objs := xen_nop.o note.o
 
-xen_prepost_hooks.o: config.h
+$(obj)/xen_prepost_hooks.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_PREPOST_HOOKS)
-$(LIVEPATCH_PREPOST_HOOKS): xen_prepost_hooks.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_PREPOST_HOOKS) $^
+extra-y += xen_prepost_hooks.livepatch
+xen_prepost_hooks-objs := xen_prepost_hooks.o xen_hello_world_func.o note.o xen_note.o
 
-xen_prepost_hooks_fail.o: config.h
+$(obj)/xen_prepost_hooks_fail.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_PREPOST_HOOKS_FAIL)
-$(LIVEPATCH_PREPOST_HOOKS_FAIL): xen_prepost_hooks_fail.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_PREPOST_HOOKS_FAIL) $^
+extra-y += xen_prepost_hooks_fail.livepatch
+xen_prepost_hooks_fail-objs := xen_prepost_hooks_fail.o xen_hello_world_func.o note.o xen_note.o
 
-xen_action_hooks.o: config.h
+$(obj)/xen_action_hooks.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_ACTION_HOOKS)
-$(LIVEPATCH_ACTION_HOOKS): xen_action_hooks.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_ACTION_HOOKS) $^
+extra-y += xen_action_hooks.livepatch
+xen_action_hooks-objs := xen_action_hooks.o xen_hello_world_func.o note.o xen_note.o
 
-xen_action_hooks_nofunc.o: config.h
+$(obj)/xen_action_hooks_nofunc.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_ACTION_HOOKS_NOFUNC)
-$(LIVEPATCH_ACTION_HOOKS_NOFUNC): xen_action_hooks_nofunc.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_ACTION_HOOKS_NOFUNC) $^
+extra-y += xen_action_hooks_nofunc.livepatch
+xen_action_hooks_nofunc-objs := xen_action_hooks_nofunc.o note.o xen_note.o
 
-xen_action_hooks_marker.o: config.h
+$(obj)/xen_action_hooks_marker.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_ACTION_HOOKS_MARKER)
-$(LIVEPATCH_ACTION_HOOKS_MARKER): xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_ACTION_HOOKS_MARKER) $^
+extra-y += xen_action_hooks_marker.livepatch
+xen_action_hooks_marker-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
 
-xen_action_hooks_noapply.o: config.h
+$(obj)/xen_action_hooks_noapply.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_ACTION_HOOKS_NOAPPLY)
-$(LIVEPATCH_ACTION_HOOKS_NOAPPLY): xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_ACTION_HOOKS_NOAPPLY) $^
+extra-y += xen_action_hooks_noapply.livepatch
+xen_action_hooks_noapply-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
 
-xen_action_hooks_norevert.o: config.h
+$(obj)/xen_action_hooks_norevert.o: $(obj)/config.h
 
-.PHONY: $(LIVEPATCH_ACTION_HOOKS_NOREVERT)
-$(LIVEPATCH_ACTION_HOOKS_NOREVERT): xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_ACTION_HOOKS_NOREVERT) $^
+extra-y += xen_action_hooks_norevert.livepatch
+xen_action_hooks_norevert-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
 
 EXPECT_BYTES_COUNT := 8
 CODE_GET_EXPECT=$(shell $(OBJDUMP) -d --insn-width=1 $(1) | sed -n -e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | awk '{$$0=$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' | sed 's/^/{/;s/,$$/}/g')
-.PHONY: expect_config.h
-expect_config.h: EXPECT_BYTES=$(call CODE_GET_EXPECT,$(BASEDIR)/xen-syms,xen_extra_version)
-expect_config.h:
+$(obj)/expect_config.h: $(BASEDIR)/xen-syms
 	(set -e; \
-	 echo "#define EXPECT_BYTES $(EXPECT_BYTES)"; \
+	 echo "#define EXPECT_BYTES $(call CODE_GET_EXPECT,$<,xen_extra_version)"; \
          echo "#define EXPECT_BYTES_COUNT $(EXPECT_BYTES_COUNT)") > $@
 
-xen_expectations.o: expect_config.h
+$(obj)/xen_expectations.o: $(obj)/expect_config.h
 
-.PHONY: $(LIVEPATCH_EXPECTATIONS)
-$(LIVEPATCH_EXPECTATIONS): xen_expectations.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_EXPECTATIONS) $^
+extra-y += xen_expectations.livepatch
+xen_expectations-objs := xen_expectations.o xen_hello_world_func.o note.o xen_note.o
 
-.PHONY: $(LIVEPATCH_EXPECTATIONS_FAIL)
-$(LIVEPATCH_EXPECTATIONS_FAIL): xen_expectations_fail.o xen_hello_world_func.o note.o xen_note.o
-	$(LD) $(LDFLAGS) $(build_id_linker) -r -o $(LIVEPATCH_EXPECTATIONS_FAIL) $^
+extra-y += xen_expectations_fail.livepatch
+xen_expectations_fail-objs := xen_expectations_fail.o xen_hello_world_func.o note.o xen_note.o
+
+
+quiet_cmd_livepatch = LD      $@
+cmd_livepatch = $(LD) $(XEN_LDFLAGS) $(build_id_linker) -r -o $@ $(real-prereqs)
+
+$(obj)/%.livepatch: FORCE
+	$(call if_changed,livepatch)
+
+$(call multi-depend, $(filter %.livepatch,$(extra-y)), .livepatch, -objs)
+targets += $(sort $(foreach m,$(basename $(notdir $(filter %.livepatch,$(extra-y)))), \
+                    $($(m)-objs)))
+
+LIVEPATCHES := $(filter %.livepatch,$(extra-y))
+
+LIVEPATCH_DEBUG_DIR ?= $(DEBUG_DIR)/xen-livepatch
 
 .PHONY: livepatch
-livepatch: $(LIVEPATCH) $(LIVEPATCH_BYE) $(LIVEPATCH_REPLACE) $(LIVEPATCH_NOP) $(LIVEPATCH_NO_XEN_BUILDID) \
-           $(LIVEPATCH_PREPOST_HOOKS) $(LIVEPATCH_PREPOST_HOOKS_FAIL) $(LIVEPATCH_ACTION_HOOKS) \
-           $(LIVEPATCH_ACTION_HOOKS_NOFUNC) $(LIVEPATCH_ACTION_HOOKS_MARKER) $(LIVEPATCH_ACTION_HOOKS_NOAPPLY) \
-           $(LIVEPATCH_ACTION_HOOKS_NOREVERT) $(LIVEPATCH_EXPECTATIONS) $(LIVEPATCH_EXPECTATIONS_FAIL)
+livepatch: $(LIVEPATCHES)
+
+install: $(addprefix $(obj)/,$(LIVEPATCHES))
+	$(INSTALL_DIR) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
+	$(INSTALL_DATA) $(addprefix $(obj)/,$(LIVEPATCHES)) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
+
+uninstall:
+	cd $(DESTDIR)$(LIVEPATCH_DEBUG_DIR) && rm -f $(LIVEPATCHES)
+
+.PHONY: clean
+clean::
+	rm -f *.o .*.o.d *.livepatch config.h expect_config.h
-- 
Anthony PERARD


