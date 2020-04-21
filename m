Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716451B2BFE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVp-0005Ur-4V; Tue, 21 Apr 2020 16:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVn-0005Tv-Gp
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:39 +0000
X-Inumbo-ID: e83f201d-83ea-11ea-9160-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e83f201d-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F8hItL4OkCEv1+RcIrGO9a1Vw+sXS9Wwz/XS0OqQdLQ=;
 b=VP+WMdxMjJNQW1gEWwz2OE8lQFYmo7wwj1XXtxJKDaFwAxkqsy9aS+qu
 yeH4rV3TMrYtQTZiKhekl0hNRGRyl0M5kbp3OgiYUuchvCi0XZW1l0gG7
 3JzCY/yVmcOxnlKFz6q4vr/YyucRrJw/jxbQuLmOCkenmvEqQrjoctJuI E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +nqSIIVBZSSpkEP6Qd7q9x7x/7EgFhKIoText7+Xd0qpHQmqoSg0OMdsQCxHCWfb0jeUBPfrQv
 26zjn5qnYVkC2y0LdjM8x7CR9WloPfFgrln3c9ke6fivbAy5jAbqOeVUebADam6zrm0KVs74mX
 eiMt5Xbj06NBDy/JAge0lzkdP6LcIJu40W4/VRNcpkHH0EZ90XzBUZp5m7JhqYncmTXxi1nT3M
 MmxFjCgpxIrIMEzUIrfS4a4hSiVSmNJSVGb94WOPf+HbpF9cXPLhkMsFsw9T+Npuz9xC332+eo
 Qog=
X-SBRS: 2.7
X-MesageID: 16414414
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16414414"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 06/16] xen/build: introduce if_changed and
 if_changed_rule
Date: Tue, 21 Apr 2020 17:11:58 +0100
Message-ID: <20200421161208.2429539-7-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The if_changed macro from Linux, in addition to check if any files
needs an update, check if the command line has changed since the last
invocation. The latter will force a rebuild if any options to the
executable have changed.

if_changed_rule checks dependencies like if_changed, but execute
rule_$(1) instead of cmd_$(1) when a target needs to be rebuilt. A rule_
macro can call more than one cmd_ macro. One of the cmd_ macro in a
rule need to be call using a macro that record the command line, so
cmd_and_record is introduced. It is similar to cmd_and_fixup from
Linux but without a call to fixdep which we don't have yet. (We will
later replace cmd_and_record by cmd_and_fixup.)

Example of a rule_ macro:
define rule_cc_o_c
    $(call cmd_and_record,cc_o_o)
    $(call cmd,objcopy)
endef

This needs one of the call to use cmd_and_record, otherwise no .*.cmd
file will be created, and the target will keep been rebuilt.

In order for if_changed to works correctly, we need to load the .%.cmd
files that the macro generates, this is done by adding targets in to
the $(targets) variable. We use intermediate_targets to add %.init.o
dependency %.o to target since there aren't in obj-y.

We also add $(MAKECMDGOALS) to targets so that when running for
example `make common/memory.i`, make will load the associated .%.cmd
dependency file.

Beside the if_changed*, we import the machinery used for a "beautify
output". The important one is when running make with V=2 which help to
debug the makefiles by printing why a target is been rebuilt, via the
$(echo-why) macro.

if_changed and if_changed_rule aren't used yet.

Most of this code is copied from Linux v5.4, including the
documentation.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v5:
    - In documentation, fix some mix tab/space used for indentation,
      convert to all tab.
    - and fix a "note" in "if_changed" where the paragraph was cut in two.
    
    v4:
    - Use := in make whenever possible (instead of =)
    - insert new string in .gitignore somewhere more plausible.
    - import documentation from Linux

 .gitignore                            |   1 +
 docs/misc/xen-makefiles/makefiles.rst |  98 +++++++++++++++++++++++
 xen/Makefile                          |  53 ++++++++++++-
 xen/Rules.mk                          |  33 +++++++-
 xen/scripts/Kbuild.include            | 107 ++++++++++++++++++++++++++
 5 files changed, 290 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4ca679ddbc9a..bfa53723b38b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 .hg
+.*.cmd
 .*.tmp
 *.orig
 *~
diff --git a/docs/misc/xen-makefiles/makefiles.rst b/docs/misc/xen-makefiles/makefiles.rst
index a86e3a612d61..04bc72601c31 100644
--- a/docs/misc/xen-makefiles/makefiles.rst
+++ b/docs/misc/xen-makefiles/makefiles.rst
@@ -85,3 +85,101 @@ Compilation flags
 
 	CFLAGS-y specifies options for compiling with $(CC).
 	AFLAGS-y specifies assembler options.
+
+
+Build system infrastructure
+===========================
+
+This chapter describe some of the macro used when building Xen.
+
+Macros
+------
+
+
+    if_changed
+	if_changed is the infrastructure used for the following commands.
+
+	Usage::
+
+		target: source(s) FORCE
+			$(call if_changed,ld/objcopy/...)
+
+	When the rule is evaluated, it is checked to see if any files
+	need an update, or the command line has changed since the last
+	invocation. The latter will force a rebuild if any options
+	to the executable have changed.
+	Any target that utilises if_changed must be listed in $(targets),
+	otherwise the command line check will fail, and the target will
+	always be built.
+	if_changed may be used in conjunction with custom commands as
+	defined in "Custom commands".
+
+	Note: It is a typical mistake to forget the FORCE prerequisite.
+	Another common pitfall is that whitespace is sometimes
+	significant; for instance, the below will fail (note the extra space
+	after the comma)::
+
+		target: source(s) FORCE
+
+	**WRONG!**	$(call if_changed, ld/objcopy/...)
+
+	Note:
+		if_changed should not be used more than once per target.
+		It stores the executed command in a corresponding .cmd file
+		and multiple calls would result in overwrites and unwanted
+		results when the target is up to date and only the tests on
+		changed commands trigger execution of commands.
+
+    ld
+	Link target.
+
+	Example::
+
+		targets += setup setup.o bootsect bootsect.o
+		$(obj)/setup $(obj)/bootsect: %: %.o FORCE
+			$(call if_changed,ld)
+
+	$(targets) are assigned all potential targets, by which the build
+	system knows the targets and will:
+
+		1) check for commandline changes
+
+	The ": %: %.o" part of the prerequisite is a shorthand that
+	frees us from listing the setup.o and bootsect.o files.
+
+	Note:
+		It is a common mistake to forget the "targets :=" assignment,
+		resulting in the target file being recompiled for no
+		obvious reason.
+
+    objcopy
+	Copy binary. Uses OBJCOPYFLAGS usually specified in
+	arch/$(ARCH)/Makefile.
+
+Custom commands
+---------------
+
+	When the build system is executing with V=0, then only
+	a shorthand of a command is normally displayed.
+	To enable this behaviour for custom commands, two variables are
+	required to be set::
+
+		quiet_cmd_<command>	- what shall be echoed
+		      cmd_<command>	- the command to execute
+
+	Example::
+
+		# xsm/flask/Makefile
+		mkflask := policy/mkflask.sh
+		quiet_cmd_mkflask = MKFLASK $@
+		cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include \
+			$(FLASK_H_DEPEND)
+
+		include/flask.h: $(FLASK_H_DEPEND) $(mkflask) FORCE
+			$(call if_changed,mkflask)
+
+	When updating the include/flask.h target, the line:
+
+		MKFLASK include/flask.h
+
+	will be displayed with "make V=0". (V=0 is the default)
diff --git a/xen/Makefile b/xen/Makefile
index 2a689b26a2ba..07f8ef808743 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -52,7 +52,57 @@ dist: install
 
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
+
+# Beautify output
+# ---------------------------------------------------------------------------
+#
+# Normally, we echo the whole command before executing it. By making
+# that echo $($(quiet)$(cmd)), we now have the possibility to set
+# $(quiet) to choose other forms of output instead, e.g.
+#
+#         quiet_cmd_cc_o_c = Compiling $(RELDIR)/$@
+#         cmd_cc_o_c       = $(CC) $(c_flags) -c -o $@ $<
+#
+# If $(quiet) is empty, the whole command will be printed.
+# If it is set to "quiet_", only the short version will be printed.
+# If it is set to "silent_", nothing will be printed at all, since
+# the variable $(silent_cmd_cc_o_c) doesn't exist.
+#
+# A simple variant is to prefix commands with $(Q) - that's useful
+# for commands that shall be hidden in non-verbose mode.
 #
+#	$(Q)ln $@ :<
+#
+# If KBUILD_VERBOSE equals 0 then the above command will be hidden.
+# If KBUILD_VERBOSE equals 1 then the above command is displayed.
+#
+# To put more focus on warnings, be less verbose as default
+# Use 'make V=1' to see the full commands
+
+ifeq ("$(origin V)", "command line")
+    KBUILD_VERBOSE := $(V)
+endif
+ifndef KBUILD_VERBOSE
+    KBUILD_VERBOSE := 0
+endif
+
+ifeq ($(KBUILD_VERBOSE),1)
+    quiet :=
+    Q :=
+else
+    quiet := quiet_
+    Q := @
+endif
+
+# If the user is running make -s (silent mode), suppress echoing of
+# commands
+
+ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+    quiet := silent_
+endif
+
+export quiet Q KBUILD_VERBOSE
+
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
 
@@ -261,7 +311,8 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) arch/x86
 	$(MAKE) $(clean) test
 	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
-	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" -o -name "*.gcno" \) -exec rm -f {} \;
+	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
+		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f include/asm-*/asm-offsets.h
 	rm -f .banner
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 9d1e1ebf5e44..21cac7f5f51a 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -42,6 +42,7 @@ ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
 
 # Initialise some variables
+targets :=
 CFLAGS-y :=
 AFLAGS-y :=
 
@@ -69,6 +70,10 @@ $(foreach o,$(filter-out %/,$(obj-y) $(obj-bin-y) $(extra-y)),$(eval $(call gend
 subdir-y := $(subdir-y) $(filter %/, $(obj-y))
 obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
 
+# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
+# tell kbuild to descend
+subdir-obj-y := $(filter %/built_in.o, $(obj-y))
+
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
 ifeq ($(CONFIG_COVERAGE),y)
@@ -123,6 +128,10 @@ else
 endif
 endif
 
+targets += built_in.o
+targets += $(filter-out $(subdir-obj-y), $(obj-y)) $(extra-y)
+targets += $(MAKECMDGOALS)
+
 built_in_bin.o: $(obj-bin-y) $(extra-y)
 ifeq ($(obj-bin-y),)
 	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
@@ -131,7 +140,7 @@ else
 endif
 
 # Force execution of pattern rules (for which PHONY cannot be directly used).
-.PHONY: FORCE
+PHONY += FORCE
 FORCE:
 
 %/built_in.o: FORCE
@@ -179,4 +188,26 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o Makefile
 %.s: %.S Makefile
 	$(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
 
+# Add intermediate targets:
+# When building objects with specific suffix patterns, add intermediate
+# targets that the final targets are derived from.
+intermediate_targets = $(foreach sfx, $(2), \
+				$(patsubst %$(strip $(1)),%$(sfx), \
+					$(filter %$(strip $(1)), $(targets))))
+# %.init.o <- %.o
+targets += $(call intermediate_targets, .init.o, .o)
+
 -include $(DEPS_INCLUDE)
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+# Declare the contents of the PHONY variable as phony.  We keep that
+# information in a variable so we can use it in if_changed and friends.
+.PHONY: $(PHONY)
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 806c68824ed5..e62eddc3654c 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -2,11 +2,30 @@
 ####
 # kbuild: Generic definitions
 
+# Convenient variables
+squote  := '
+empty   :=
+space   := $(empty) $(empty)
+space_escape := _-_SPACE_-_
+pound   := \#
+
+###
+# Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
+dot-target = $(@D)/.$(@F)
+
 ###
 # dependencies
 DEPS = .*.d
 DEPS_INCLUDE = $(addsuffix .d2, $(basename $(wildcard $(DEPS))))
 
+###
+# real prerequisites without phony targets
+real-prereqs = $(filter-out $(PHONY), $^)
+
+###
+# Escape single quote for use in echo statements
+escsq = $(subst $(squote),'\$(squote)',$1)
+
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
@@ -32,3 +51,91 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # Usage:
 # $(MAKE) $(clean) dir
 clean := -f $(BASEDIR)/scripts/Makefile.clean clean -C
+
+# echo command.
+# Short version is used, if $(quiet) equals `quiet_', otherwise full one.
+echo-cmd = $(if $($(quiet)cmd_$(1)),\
+        echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
+
+# printing commands
+cmd = @set -e; $(echo-cmd) $(cmd_$(1))
+
+###
+# if_changed      - execute command if any prerequisite is newer than
+#                   target, or command line has changed
+# if_changed_rule - as if_changed but execute rule instead
+
+ifneq ($(KBUILD_NOCMDDEP),1)
+# Check if both commands are the same including their order. Result is empty
+# string if equal. User may override this check using make KBUILD_NOCMDDEP=1
+cmd-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
+                         $(subst $(space),$(space_escape),$(strip $(cmd_$1))))
+else
+cmd-check = $(if $(strip $(cmd_$@)),,1)
+endif
+
+# Replace >$< with >$$< to preserve $ when reloading the .cmd file
+# (needed for make)
+# Replace >#< with >$(pound)< to avoid starting a comment in the .cmd file
+# (needed for make)
+# Replace >'< with >'\''< to be able to enclose the whole string in '...'
+# (needed for the shell)
+make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1)))))
+
+# Find any prerequisites that is newer than target or that does not exist.
+# PHONY targets skipped in both cases.
+any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
+
+# Execute command if command has changed or prerequisite(s) are updated.
+if_changed = $(if $(any-prereq)$(cmd-check),                                 \
+        $(cmd);                                                              \
+        printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
+
+# Usage: $(call if_changed_rule,foo)
+# Will check if $(cmd_foo) or any of the prerequisites changed,
+# and if so will execute $(rule_foo).
+if_changed_rule = $(if $(any-prereq)$(cmd-check),$(rule_$(1)),@:)
+
+cmd_and_record =                                                             \
+        $(cmd);                                                              \
+        printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
+
+###
+# why - tell why a target got built
+#       enabled by make V=2
+#       Output (listed in the order they are checked):
+#          (1) - due to target is PHONY
+#          (2) - due to target missing
+#          (3) - due to: file1.h file2.h
+#          (4) - due to command line change
+#          (5) - due to missing .cmd file
+#          (6) - due to target not in $(targets)
+# (1) PHONY targets are always build
+# (2) No target, so we better build it
+# (3) Prerequisite is newer than target
+# (4) The command line stored in the file named dir/.target.cmd
+#     differed from actual command line. This happens when compiler
+#     options changes
+# (5) No dir/.target.cmd file (used to store command line)
+# (6) No dir/.target.cmd file and target not listed in $(targets)
+#     This is a good hint that there is a bug in the kbuild file
+ifeq ($(KBUILD_VERBOSE),2)
+why =                                                                        \
+    $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
+        $(if $(wildcard $@),                                                 \
+            $(if $(any-prereq),- due to: $(any-prereq),                      \
+                $(if $(cmd-check),                                           \
+                    $(if $(cmd_$@),- due to command line change,             \
+                        $(if $(filter $@, $(targets)),                       \
+                            - due to missing .cmd file,                      \
+                            - due to $(notdir $@) not in $$(targets)         \
+                         )                                                   \
+                     )                                                       \
+                 )                                                           \
+             ),                                                              \
+             - due to target missing                                         \
+         )                                                                   \
+     )
+
+echo-why = $(call escsq, $(strip $(why)))
+endif
-- 
Anthony PERARD


