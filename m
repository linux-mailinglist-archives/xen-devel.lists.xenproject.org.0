Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421AA45DB64
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231217.400028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEza-0001sH-Ed; Thu, 25 Nov 2021 13:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231217.400028; Thu, 25 Nov 2021 13:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEza-0001oU-7Z; Thu, 25 Nov 2021 13:40:50 +0000
Received: by outflank-mailman (input) for mailman id 231217;
 Thu, 25 Nov 2021 13:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzY-00076i-4K
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a35d60d-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:46 +0100 (CET)
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
X-Inumbo-ID: 4a35d60d-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Qk7QJytYsP1D9c/kGPePeSzFTMWtSOdoBjtTAGXneQ=;
  b=ckLBolWo28cuqFIgMK9D8dLQnlvcTP5HsqnSN0QAqkhaNfUo4V5Sz621
   fURgiE8WsdoCzxp+RogxxQ/XeVtAk7PpPyaik8x5zMr5teIMe0ZpSB2R4
   WCVgnJtkhLuLuj6xp5cfbegIVOssJjzlfT8jMbLDCq1MWgz7LvtF2sCZy
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xHNp3YLKbZ03i7NzjHDCwsRxTS1zoIYGH3M/WEB58jY6Wav6qUK2vg81HijqwWpijSK4vW0Ddp
 tUchtlzQ6Kez0AlMiLCu6IyANiusc/AUTf5++rycOv8odPEowxix3tF86OJQtSATStJjC2CQzz
 jRD3boS4bC8gKOgLuL97l4t8r+B1U+21DKYbidLMgFhDimT9BFPZ+Mf1eeBLm1mzJbEspPChaI
 TOdbtHIFudsahcLeh6hirPZjXfOlpas0rZhK8pISQxLpKR9QZbrGEgVCoZyyeWb+Ey/0462Not
 xgE5hAsPsGbiwBARO/IkBkQ4
X-SBRS: 5.1
X-MesageID: 58135420
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jvw3Vq3wW61z6ozrpPbD5UZ2kn2cJEfYwER7XKvMYLTBsI5bpzEHz
 2JOUWqHbq2LNmTxeo0na9zn9x8AvJOByd41HlRppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpPdYj
 /4XjYyLdEQWM5TcwqM9Vz9eDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t1pkVQKqEP
 6L1bxIsQhD4XDZ3MW4pAbQ8ksaOg2n+WhRh/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SWB2mKhgKnIhyyTcIEVEqex+rh1gVmQ7msJARYSWB2wpvzRokyjX9NSL
 WQE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZj9eavQ2uckuXzso2
 1SV2dTzClRHsreYVHac/be8ti6pNG4eKmpqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMQrX6
 neh9hAuvIhQssMyx//83VThhS358/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnwv67dWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfMoC25SI55zpUQFKTgCfqqJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05l2XpGLZNge5xmHFWKYbvqXfTlUrP7FZjTCTNFedt3KWmMojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTYXZxYA32gid7Ou5CLs43LvMKQFXuz8Q7pdYcc
 hXPU57o7i1nRmuV9jIDQ4P6qYA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOF1Z4EcLbSPOz1Fft73ITr/1/AhnTKd5JdUSyrIUzc37tjuU6Kt0nIAnYwmfIz
 B6fBBoV/LGfo4I8/NTTq7qDqoOlT7l3EkZARjGJ5reqLyjKuGGkxNYYAuqPeDncUkLy+bmjO
 roJn62tbqVfkQ8T4YRmErttwaYv3PfVpudXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZl2WA7fkxJ0mmtiZ78KDeDBdXNhiIzidcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h35IsHBILLixYwzgAQaJPRPSb6/ZWTZogeKUItO
 DKV2PLPirk0KpAuqJbv+awhBdZguKk=
IronPort-HdrOrdr: A9a23:0tvfDaslqpijLddR0KDCMu5x7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135420"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [XEN PATCH v8 09/47] build: rework test/livepatch/Makefile
Date: Thu, 25 Nov 2021 13:39:28 +0000
Message-ID: <20211125134006.1076646-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
---

Notes:
    v8:
    - rename multi_depend to multi-depend
    - use $() for single-letter make variable
    - re-indent one line

 xen/scripts/Kbuild.include  |   9 ++
 xen/test/livepatch/Makefile | 213 ++++++++++++++----------------------
 2 files changed, 91 insertions(+), 131 deletions(-)

diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 83c7e1457baa..21030cfcfbc1 100644
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


