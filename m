Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589A49B29C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260091.449224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfd-0005tc-BP; Tue, 25 Jan 2022 11:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260091.449224; Tue, 25 Jan 2022 11:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfd-0005oJ-7U; Tue, 25 Jan 2022 11:07:29 +0000
Received: by outflank-mailman (input) for mailman id 260091;
 Tue, 25 Jan 2022 11:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa2-0006Mn-OZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c9c261e-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:41 +0100 (CET)
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
X-Inumbo-ID: 2c9c261e-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u/90GuRTmjHwZVz8sqoMIeo3eVy02tS9+uGE8H0qFwM=;
  b=htbx53AYwIkhoX2U0pWzgtpf17J9kfcEjdyK1UrsFztkNkW8P1FF9CD7
   A99+ma6n2a39yvBDdQUbxWhEQmRhMgk7iQvHN11pGmFhNqUdZW9ZoCVxT
   YtdMIror061b+d0TRhOb6qsQduNmGv7SlIPtDeLsMCcux1P+SJN1rg+Ts
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pJ1EjnteJlUHJVtjePXu84kOuE2Rt5ziFF5kheHy+RsfuGcbD4QVb2hx9P8E6yE7bDxdpx8Btk
 n+f8AVG59uHFbfrIDXCcc+QEqXCQ5E+PQ4Knse79fPnEbhXA088GNRMQnXx61rHPCxieFuKQFM
 CQVoYE1NVaR7BmgigJeuyu+0DclzA3Un32IpC38NwgJmnO2JJ1za1ydWbz6LMeBACYT1MC607n
 AEpjk6CKbXVIyzzl833n4GmHx9cwemjwvTpqeZ//NAjpmyz3bVZKvuIjqyy1hrlxh1oSLk5gOO
 2DdVb4CyvMtYCHb2846mHcBO
X-SBRS: 5.2
X-MesageID: 64860836
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vUuAE6k1uJRkPOYYeqE0n+Po5gx9IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKDWHXaamPYWf0edh2bIW08UgD7MKGyIQyQFRsri1nFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NkXpMCpbCUQBfXvxM4PYSQJDCJEZLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6qOO
 ZJJMmQHgBLoOEFsHV1HD70Eur2tpmjEcAAb71yejP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJW66/prjVu71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9RSiMqq6xjwqJYQtJB30wWH4bTjFc/Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxl4hPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2TaD/LF7rlxBHkJPm6gKvFmSw28yaq45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYVOsQgK1DZrXA2DaJ144wLuBJw+U3YE
 czDGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3eLmaZOcwFiBSVrVPje9p0MHsbec1UOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Km1SSYcl3bMy46AF4tNL4mxU8G0eUXFQ7A8xAejUyHsM/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:iWhxU6/r971XoMN86OFuk+DkI+orL9Y04lQ7vn2ZLiYlFvBw9v
 re+cjzuiWE6wr5NEtApTniAse9qBHnhPlICOAqVN/JMTUO0FHYSr2KhrGSoQEIdRefygd179
 YYT0AgY+eaMbEBt6nHCaODYq4dKaK8nJyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860836"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v9 10/30] build: introduce if_changed_deps
Date: Tue, 25 Jan 2022 11:00:43 +0000
Message-ID: <20220125110103.3527686-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This macro does compare command line like if_changed, but it also
rewrite the dependencies generated by $(CC) in order to depend on a
CONFIG_* as generated by kconfig instead of depending on autoconf.h.
This allow to make a change in kconfig options and only rebuild the
object that uses that CONFIG_* option.

cmd_and_record isn't needed anymore as it is replace by
cmd_and_fixdep.

There's only one .*.d dependency file left which is explicitly
included as a workound, all the other are been absorb into the .*.cmd
dependency files via `fixdep`. So including .*.d can be removed from
the makefile.

Also adjust "cloc" recipe due to .*.d been replace by .*.cmd files.

This imports fixdep.c and if_changed_deps macro from Linux v5.12.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - reviewd
    - remove "tools_fixdep" prerequisite in xen/Makefile from "$(TARGET)"
      target as the first command of the recipe will build everything in
      tools/ and thus tools/fixdep.
    - adjust "cloc" recipe.

 .gitignore                 |   1 +
 xen/Makefile               |  15 +-
 xen/Rules.mk               |  17 +-
 xen/arch/x86/Makefile      |   8 +-
 xen/build.mk               |   1 +
 xen/scripts/Kbuild.include |  17 +-
 xen/tools/Makefile         |   7 +-
 xen/tools/fixdep.c         | 404 +++++++++++++++++++++++++++++++++++++
 8 files changed, 441 insertions(+), 29 deletions(-)
 create mode 100644 xen/tools/fixdep.c

diff --git a/.gitignore b/.gitignore
index 3f9d55ba87f0..cc87a7dfae7b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -332,6 +332,7 @@ xen/include/xen/lib/x86/cpuid-autogen.h
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
+xen/tools/fixdep
 xen/tools/kconfig/.tmp_gtkcheck
 xen/tools/kconfig/.tmp_qtcheck
 xen/tools/symbols
diff --git a/xen/Makefile b/xen/Makefile
index 780d555e8620..3dc7b4da10fb 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -196,6 +196,13 @@ export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xe
 export root-make-done := y
 endif # root-make-done
 
+# ===========================================================================
+# Rules shared between *config targets and build targets
+
+PHONY += tools_fixdep
+tools_fixdep:
+	$(MAKE) -C tools fixdep
+
 # Shorthand for kconfig
 kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
 
@@ -471,18 +478,18 @@ cscope:
 _MAP:
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
-%.o %.i %.s: %.c FORCE
+%.o %.i %.s: %.c tools_fixdep FORCE
 	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
-%.o %.s: %.S FORCE
+%.o %.s: %.S tools_fixdep FORCE
 	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
-%/: FORCE
+%/: tools_fixdep FORCE
 	$(Q)$(MAKE) $(build)=$* need-builtin=1
 
 .PHONY: cloc
 cloc:
-	find . -name tools -prune -o -name '*.o.d' -print | while read f; do \
+	find . -name tools -prune -o -name '*.o.cmd' -print | while read f; do \
 	    for sf in $$(grep -o "[a-zA-Z0-9_/-]*\.[cS]" $$f); do \
 		test -f "$$sf" && echo "$$sf"; \
 	    done; \
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 67112e00773f..567a23a54cd9 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -147,8 +147,8 @@ cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
 # Calculation of flags, first the generic flags, then the arch specific flags,
 # and last the flags modified for a target or a directory.
 
-c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS)
-a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
+c_flags = -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
+a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
@@ -205,7 +205,7 @@ else
 endif
 
 define rule_cc_o_c
-    $(call cmd_and_record,cc_o_c)
+    $(call cmd_and_fixdep,cc_o_c)
     $(call cmd,objcopy_fix_sym)
 endef
 
@@ -216,7 +216,7 @@ quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
 $(obj)/%.o: $(src)/%.S FORCE
-	$(call if_changed,cc_o_S)
+	$(call if_changed_dep,cc_o_S)
 
 
 quiet_cmd_obj_init_o = INIT_O  $@
@@ -246,13 +246,13 @@ quiet_cmd_cpp_s_S = CPP     $@
 cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
 $(obj)/%.i: $(src)/%.c FORCE
-	$(call if_changed,cpp_i_c)
+	$(call if_changed_dep,cpp_i_c)
 
 $(obj)/%.s: $(src)/%.c FORCE
-	$(call if_changed,cc_s_c)
+	$(call if_changed_dep,cc_s_c)
 
 $(obj)/%.s: $(src)/%.S FORCE
-	$(call if_changed,cpp_s_S)
+	$(call if_changed_dep,cpp_s_S)
 
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
@@ -291,9 +291,6 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-DEPS := $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).d)
--include $(DEPS_INCLUDE)
-
 # Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8fe54ba137ca..9494e4a3df79 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -245,7 +245,7 @@ $(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
-	$(call if_changed,cpp_lds_S)
+	$(call if_changed_dep,cpp_lds_S)
 
 $(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
@@ -261,9 +261,3 @@ clean::
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
 	rm -f note.o
-
-# Suppress loading of DEPS files for internal, temporary target files.  This
-# then also suppresses re-generation of the respective .*.d2 files.
-ifeq ($(filter-out .xen%.o,$(notdir $(MAKECMDGOALS))),)
-DEPS_INCLUDE:=
-endif
diff --git a/xen/build.mk b/xen/build.mk
index 487db14c5884..e718743ef772 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -40,6 +40,7 @@ include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 
 targets += include/xen/compile.h
 
+-include $(wildcard .asm-offsets.s.d)
 asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index c159136adb20..872adfb456c3 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -15,8 +15,7 @@ dot-target = $(@D)/.$(@F)
 
 ###
 # dependencies
-DEPS = .*.d
-DEPS_INCLUDE = $(addsuffix .d2, $(basename $(wildcard $(DEPS))))
+depfile = $(dot-target).d
 
 ###
 # real prerequisites without phony targets
@@ -83,6 +82,8 @@ cmd = @set -e; $(echo-cmd) $(cmd_$(1))
 ###
 # if_changed      - execute command if any prerequisite is newer than
 #                   target, or command line has changed
+# if_changed_dep  - as if_changed, but uses fixdep to reveal dependencies
+#                   including used config symbols
 # if_changed_rule - as if_changed but execute rule instead
 
 ifneq ($(KBUILD_NOCMDDEP),1)
@@ -111,15 +112,19 @@ if_changed = $(if $(any-prereq)$(cmd-check),                                 \
         $(cmd);                                                              \
         printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
+# Execute the command and also postprocess generated .d dependencies file.
+if_changed_dep = $(if $(any-prereq)$(cmd-check),$(cmd_and_fixdep),@:)
+
+cmd_and_fixdep =                                                             \
+        $(cmd);                                                              \
+        tools/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;        \
+        rm -f $(depfile)
+
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
 if_changed_rule = $(if $(any-prereq)$(cmd-check),$(rule_$(1)),@:)
 
-cmd_and_record =                                                             \
-        $(cmd);                                                              \
-        printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
-
 ###
 # why - tell why a target got built
 #       enabled by make V=2
diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index 4e42163f981c..722f3664549d 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -2,11 +2,14 @@
 include $(XEN_ROOT)/Config.mk
 
 .PHONY: default
-default: symbols
+default: symbols fixdep
 
 .PHONY: clean
 clean:
-	rm -f *.o symbols
+	rm -f *.o symbols fixdep
 
 symbols: symbols.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
+
+fixdep: fixdep.c
+	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
diff --git a/xen/tools/fixdep.c b/xen/tools/fixdep.c
new file mode 100644
index 000000000000..d98540552941
--- /dev/null
+++ b/xen/tools/fixdep.c
@@ -0,0 +1,404 @@
+/*
+ * "Optimize" a list of dependencies as spit out by gcc -MD
+ * for the kernel build
+ * ===========================================================================
+ *
+ * Author       Kai Germaschewski
+ * Copyright    2002 by Kai Germaschewski  <kai.germaschewski@gmx.de>
+ *
+ * This software may be used and distributed according to the terms
+ * of the GNU General Public License, incorporated herein by reference.
+ *
+ *
+ * Introduction:
+ *
+ * gcc produces a very nice and correct list of dependencies which
+ * tells make when to remake a file.
+ *
+ * To use this list as-is however has the drawback that virtually
+ * every file in the kernel includes autoconf.h.
+ *
+ * If the user re-runs make *config, autoconf.h will be
+ * regenerated.  make notices that and will rebuild every file which
+ * includes autoconf.h, i.e. basically all files. This is extremely
+ * annoying if the user just changed CONFIG_HIS_DRIVER from n to m.
+ *
+ * So we play the same trick that "mkdep" played before. We replace
+ * the dependency on autoconf.h by a dependency on every config
+ * option which is mentioned in any of the listed prerequisites.
+ *
+ * kconfig populates a tree in include/config/ with an empty file
+ * for each config symbol and when the configuration is updated
+ * the files representing changed config options are touched
+ * which then let make pick up the changes and the files that use
+ * the config symbols are rebuilt.
+ *
+ * So if the user changes his CONFIG_HIS_DRIVER option, only the objects
+ * which depend on "include/config/his/driver.h" will be rebuilt,
+ * so most likely only his driver ;-)
+ *
+ * The idea above dates, by the way, back to Michael E Chastain, AFAIK.
+ *
+ * So to get dependencies right, there are two issues:
+ * o if any of the files the compiler read changed, we need to rebuild
+ * o if the command line given to the compile the file changed, we
+ *   better rebuild as well.
+ *
+ * The former is handled by using the -MD output, the later by saving
+ * the command line used to compile the old object and comparing it
+ * to the one we would now use.
+ *
+ * Again, also this idea is pretty old and has been discussed on
+ * kbuild-devel a long time ago. I don't have a sensibly working
+ * internet connection right now, so I rather don't mention names
+ * without double checking.
+ *
+ * This code here has been based partially based on mkdep.c, which
+ * says the following about its history:
+ *
+ *   Copyright abandoned, Michael Chastain, <mailto:mec@shout.net>.
+ *   This is a C version of syncdep.pl by Werner Almesberger.
+ *
+ *
+ * It is invoked as
+ *
+ *   fixdep <depfile> <target> <cmdline>
+ *
+ * and will read the dependency file <depfile>
+ *
+ * The transformed dependency snipped is written to stdout.
+ *
+ * It first generates a line
+ *
+ *   cmd_<target> = <cmdline>
+ *
+ * and then basically copies the .<target>.d file to stdout, in the
+ * process filtering out the dependency on autoconf.h and adding
+ * dependencies on include/config/my/option.h for every
+ * CONFIG_MY_OPTION encountered in any of the prerequisites.
+ *
+ * We don't even try to really parse the header files, but
+ * merely grep, i.e. if CONFIG_FOO is mentioned in a comment, it will
+ * be picked up as well. It's not a problem with respect to
+ * correctness, since that can only give too many dependencies, thus
+ * we cannot miss a rebuild. Since people tend to not mention totally
+ * unrelated CONFIG_ options all over the place, it's not an
+ * efficiency problem either.
+ *
+ * (Note: it'd be easy to port over the complete mkdep state machine,
+ *  but I don't think the added complexity is worth it)
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <string.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <ctype.h>
+
+static void usage(void)
+{
+	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
+	exit(1);
+}
+
+/*
+ * In the intended usage of this program, the stdout is redirected to .*.cmd
+ * files. The return value of printf() and putchar() must be checked to catch
+ * any error, e.g. "No space left on device".
+ */
+static void xprintf(const char *format, ...)
+{
+	va_list ap;
+	int ret;
+
+	va_start(ap, format);
+	ret = vprintf(format, ap);
+	if (ret < 0) {
+		perror("fixdep");
+		exit(1);
+	}
+	va_end(ap);
+}
+
+static void xputchar(int c)
+{
+	int ret;
+
+	ret = putchar(c);
+	if (ret == EOF) {
+		perror("fixdep");
+		exit(1);
+	}
+}
+
+/*
+ * Print out a dependency path from a symbol name
+ */
+static void print_dep(const char *m, int slen, const char *dir)
+{
+	int c, prev_c = '/', i;
+
+	xprintf("    $(wildcard %s/", dir);
+	for (i = 0; i < slen; i++) {
+		c = m[i];
+		if (c == '_')
+			c = '/';
+		else
+			c = tolower(c);
+		if (c != '/' || prev_c != '/')
+			xputchar(c);
+		prev_c = c;
+	}
+	xprintf(".h) \\\n");
+}
+
+struct item {
+	struct item	*next;
+	unsigned int	len;
+	unsigned int	hash;
+	char		name[];
+};
+
+#define HASHSZ 256
+static struct item *hashtab[HASHSZ];
+
+static unsigned int strhash(const char *str, unsigned int sz)
+{
+	/* fnv32 hash */
+	unsigned int i, hash = 2166136261U;
+
+	for (i = 0; i < sz; i++)
+		hash = (hash ^ str[i]) * 0x01000193;
+	return hash;
+}
+
+/*
+ * Lookup a value in the configuration string.
+ */
+static int is_defined_config(const char *name, int len, unsigned int hash)
+{
+	struct item *aux;
+
+	for (aux = hashtab[hash % HASHSZ]; aux; aux = aux->next) {
+		if (aux->hash == hash && aux->len == len &&
+		    memcmp(aux->name, name, len) == 0)
+			return 1;
+	}
+	return 0;
+}
+
+/*
+ * Add a new value to the configuration string.
+ */
+static void define_config(const char *name, int len, unsigned int hash)
+{
+	struct item *aux = malloc(sizeof(*aux) + len);
+
+	if (!aux) {
+		perror("fixdep:malloc");
+		exit(1);
+	}
+	memcpy(aux->name, name, len);
+	aux->len = len;
+	aux->hash = hash;
+	aux->next = hashtab[hash % HASHSZ];
+	hashtab[hash % HASHSZ] = aux;
+}
+
+/*
+ * Record the use of a CONFIG_* word.
+ */
+static void use_config(const char *m, int slen)
+{
+	unsigned int hash = strhash(m, slen);
+
+	if (is_defined_config(m, slen, hash))
+	    return;
+
+	define_config(m, slen, hash);
+	print_dep(m, slen, "include/config");
+}
+
+/* test if s ends in sub */
+static int str_ends_with(const char *s, int slen, const char *sub)
+{
+	int sublen = strlen(sub);
+
+	if (sublen > slen)
+		return 0;
+
+	return !memcmp(s + slen - sublen, sub, sublen);
+}
+
+static void parse_config_file(const char *p)
+{
+	const char *q, *r;
+	const char *start = p;
+
+	while ((p = strstr(p, "CONFIG_"))) {
+		if (p > start && (isalnum(p[-1]) || p[-1] == '_')) {
+			p += 7;
+			continue;
+		}
+		p += 7;
+		q = p;
+		while (isalnum(*q) || *q == '_')
+			q++;
+		if (str_ends_with(p, q - p, "_MODULE"))
+			r = q - 7;
+		else
+			r = q;
+		if (r > p)
+			use_config(p, r - p);
+		p = q;
+	}
+}
+
+static void *read_file(const char *filename)
+{
+	struct stat st;
+	int fd;
+	char *buf;
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "fixdep: error opening file: ");
+		perror(filename);
+		exit(2);
+	}
+	if (fstat(fd, &st) < 0) {
+		fprintf(stderr, "fixdep: error fstat'ing file: ");
+		perror(filename);
+		exit(2);
+	}
+	buf = malloc(st.st_size + 1);
+	if (!buf) {
+		perror("fixdep: malloc");
+		exit(2);
+	}
+	if (read(fd, buf, st.st_size) != st.st_size) {
+		perror("fixdep: read");
+		exit(2);
+	}
+	buf[st.st_size] = '\0';
+	close(fd);
+
+	return buf;
+}
+
+/* Ignore certain dependencies */
+static int is_ignored_file(const char *s, int len)
+{
+	return str_ends_with(s, len, "include/generated/autoconf.h") ||
+	       str_ends_with(s, len, "include/generated/autoksyms.h");
+}
+
+/*
+ * Important: The below generated source_foo.o and deps_foo.o variable
+ * assignments are parsed not only by make, but also by the rather simple
+ * parser in scripts/mod/sumversion.c.
+ */
+static void parse_dep_file(char *m, const char *target)
+{
+	char *p;
+	int is_last, is_target;
+	int saw_any_target = 0;
+	int is_first_dep = 0;
+	void *buf;
+
+	while (1) {
+		/* Skip any "white space" */
+		while (*m == ' ' || *m == '\\' || *m == '\n')
+			m++;
+
+		if (!*m)
+			break;
+
+		/* Find next "white space" */
+		p = m;
+		while (*p && *p != ' ' && *p != '\\' && *p != '\n')
+			p++;
+		is_last = (*p == '\0');
+		/* Is the token we found a target name? */
+		is_target = (*(p-1) == ':');
+		/* Don't write any target names into the dependency file */
+		if (is_target) {
+			/* The /next/ file is the first dependency */
+			is_first_dep = 1;
+		} else if (!is_ignored_file(m, p - m)) {
+			*p = '\0';
+
+			/*
+			 * Do not list the source file as dependency, so that
+			 * kbuild is not confused if a .c file is rewritten
+			 * into .S or vice versa. Storing it in source_* is
+			 * needed for modpost to compute srcversions.
+			 */
+			if (is_first_dep) {
+				/*
+				 * If processing the concatenation of multiple
+				 * dependency files, only process the first
+				 * target name, which will be the original
+				 * source name, and ignore any other target
+				 * names, which will be intermediate temporary
+				 * files.
+				 */
+				if (!saw_any_target) {
+					saw_any_target = 1;
+					xprintf("source_%s := %s\n\n",
+						target, m);
+					xprintf("deps_%s := \\\n", target);
+				}
+				is_first_dep = 0;
+			} else {
+				xprintf("  %s \\\n", m);
+			}
+
+			buf = read_file(m);
+			parse_config_file(buf);
+			free(buf);
+		}
+
+		if (is_last)
+			break;
+
+		/*
+		 * Start searching for next token immediately after the first
+		 * "whitespace" character that follows this token.
+		 */
+		m = p + 1;
+	}
+
+	if (!saw_any_target) {
+		fprintf(stderr, "fixdep: parse error; no targets found\n");
+		exit(1);
+	}
+
+	xprintf("\n%s: $(deps_%s)\n\n", target, target);
+	xprintf("$(deps_%s):\n", target);
+}
+
+int main(int argc, char *argv[])
+{
+	const char *depfile, *target, *cmdline;
+	void *buf;
+
+	if (argc != 4)
+		usage();
+
+	depfile = argv[1];
+	target = argv[2];
+	cmdline = argv[3];
+
+	xprintf("cmd_%s := %s\n\n", target, cmdline);
+
+	buf = read_file(depfile);
+	parse_dep_file(buf, target);
+	free(buf);
+
+	return 0;
+}
-- 
Anthony PERARD


