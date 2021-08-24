Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A63F5CB6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171059.312348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCB-0007Zd-Jo; Tue, 24 Aug 2021 11:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171059.312348; Tue, 24 Aug 2021 11:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCA-0007H7-LP; Tue, 24 Aug 2021 11:02:18 +0000
Received: by outflank-mailman (input) for mailman id 171059;
 Tue, 24 Aug 2021 11:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3U-0003Ux-DN
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f03605a-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:00 +0000 (UTC)
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
X-Inumbo-ID: 4f03605a-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tyXShWdhRptLb0PMlNJcfYjoy4z6ZbWALAV+zNWtrDI=;
  b=DH5w8fCyFAo+oBF+wcK04t+GG0PnDPNc2cdyvGoTlmXibC9STvWf4aG+
   UFO26C0Ar7I8K6iGDKrcYT72Vd/qWEh1pg0PBf2dMVuBZ3UcTBjroGoJU
   HsMXPQm4ZKQqjVTv6ag3nh6SE6fIkUmm1shZ6/vYIMQnahdBVUJ1pzj3x
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sEc01VfBThFuO0UAc+f5BJqKMOvCxA9LTQ87LdcF7g50tphwRarlTPCiWZ1HcBxnyTmFe73lbw
 fbu8ctAU6HoPp1m8lOmZUzzcIIQgUjPP85BEa/hgCB2zQPT4UiSL0inzxV98AeftDeoM5iwaLl
 TKuPtyhB3ZPNWGGjlF6CjrFH0UEmlNmScZJ6H1G4UAjMbSNmfHLXUMO1LX82MiEjIxMuVCAdjw
 w+uivzNnqTczGGbjxfhF+Rk/1RhljFd7sNbCzvUaFEsl7FBj3/zrACiT8B3ybdyqYnGkf7zIeg
 LbMTc2di2S1emxf2P08r9Pci
X-SBRS: 5.1
X-MesageID: 52875488
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7axdtKmgzsAdnoH/tQq8Zi3QYDjpDfOQimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qXO1z/5ICPoqTM6ftWjdySCVxe5ZnO/fKlHbdREWldQtn5
 uIEZIOb+EYZGIS5aqU3ODSKadC/DDzytHMuQ6o9QYOcegFUcBdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz6+HjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T/M1TiyWsmVM73a4m2OcJ+eEzR/BkTfJlaAkEvzzYJbiJnYfy+Qzd7tvfrGrC2+
 O82yvId/4DkE85OFvF7CcFkjOQqgoG+jvsz0SVjmDkptG8TDUmC9BZjYYcaRfB7VE81esMpp
 6j8ljpw6a/Nymw6xgVJuK4Ji1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02ZfusrMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60e5hAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgfwQl7MkccIDcSRCeI1JbcJ6e
 j8uWJjxB0PkhjVeLCzNbVwg2/waXT4RjLw180b/IR9ttTHNcrWDRE=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875488"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [XEN PATCH v7 25/51] build: rework test/livepatch/Makefile
Date: Tue, 24 Aug 2021 11:50:12 +0100
Message-ID: <20210824105038.1257926-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
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
"multi_depend" macro.

"$(targets)" needs to be updated with the objects listed in the
different *-objs variables to allow make to load the .*.cmd dependency
files.

This patch copies the macro "multi_depend" from Linux 5.12.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/scripts/Kbuild.include  |   9 ++
 xen/test/livepatch/Makefile | 213 ++++++++++++++----------------------
 2 files changed, 91 insertions(+), 131 deletions(-)

diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 83c7e1457baa..563b323f0501 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -151,3 +151,12 @@ why =                                                                        \
 
 echo-why = $(call escsq, $(strip $(why)))
 endif
+
+# Useful for describing the dependency of composite objects
+# Usage:
+#   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
+define multi_depend
+$(foreach m, $(notdir $1), \
+	$(eval $(obj)/$m: \
+	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
+endef
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 148dddb90473..e59245323e92 100644
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
+$(call multi_depend, $(filter %.livepatch,$(extra-y)), .livepatch, -objs)
+targets += $(sort $(foreach m,$(basename $(notdir $(filter %.livepatch,$(extra-y)))), \
+    $($(m)-objs)))
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


