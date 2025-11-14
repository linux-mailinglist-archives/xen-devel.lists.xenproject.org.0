Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFFC5CE06
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162456.1490126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs39-0002ll-3W; Fri, 14 Nov 2025 11:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162456.1490126; Fri, 14 Nov 2025 11:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs39-0002j8-03; Fri, 14 Nov 2025 11:33:07 +0000
Received: by outflank-mailman (input) for mailman id 1162456;
 Fri, 14 Nov 2025 11:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJs37-0001jd-Dv
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:33:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af2e087d-c14d-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 12:33:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B9331F460;
 Fri, 14 Nov 2025 11:33:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAB383EA61;
 Fri, 14 Nov 2025 11:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GC7fJ28TF2naSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Nov 2025 11:33:03 +0000
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
X-Inumbo-ID: af2e087d-c14d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqrX1vxyYUVBqUz0HLEJ2M0JuWIrU5qpOakfLpsYylE=;
	b=DawyupUTEwG1FdnJn34Gw9rX6M7Mz7Qm7K+YjUS1co3WDIwQmoNm3rjGbuE85VD1u31t74
	OmV6OL6vxBZCcFusXWQOwnoqYqR4SJO4U/jixvoJbI53VbNKQer1ElgychE97AzQmAo8gr
	LVa5n5qoaY21vMQ5HFTCFAmlZKQQDBI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqrX1vxyYUVBqUz0HLEJ2M0JuWIrU5qpOakfLpsYylE=;
	b=DawyupUTEwG1FdnJn34Gw9rX6M7Mz7Qm7K+YjUS1co3WDIwQmoNm3rjGbuE85VD1u31t74
	OmV6OL6vxBZCcFusXWQOwnoqYqR4SJO4U/jixvoJbI53VbNKQer1ElgychE97AzQmAo8gr
	LVa5n5qoaY21vMQ5HFTCFAmlZKQQDBI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 4/4] tools: replace @xxx@ markers at build time
Date: Fri, 14 Nov 2025 12:32:38 +0100
Message-ID: <20251114113238.9279-5-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114113238.9279-1-jgross@suse.com>
References: <20251114113238.9279-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 

Use the apply-build-vars make macro to replace the @xxx@ markers in
most *.in files only at build time.

As some of the markers are local to tools/configure, introduce
config/Tools-paths.mk.in and add the related make variables to it.
Add Tools-paths to the PATH_FILES make variable in order to include
the definitions for replacing them in the *.in files.

Add the generated files to the distclean target.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't rename source files
---
 .gitignore                     |  1 +
 Config.mk                      |  2 +-
 config/Tools-paths.mk.in       | 10 ++++++++++
 tools/configure                | 21 ++-------------------
 tools/configure.ac             | 19 +------------------
 tools/hotplug/FreeBSD/Makefile |  7 ++++++-
 tools/hotplug/Linux/Makefile   | 10 +++++++++-
 tools/hotplug/NetBSD/Makefile  |  7 ++++++-
 tools/hotplug/common/Makefile  |  7 ++++++-
 tools/ocaml/libs/xs/Makefile   |  9 +++++++++
 tools/ocaml/xenstored/Makefile |  9 ++++++++-
 11 files changed, 59 insertions(+), 43 deletions(-)
 create mode 100644 config/Tools-paths.mk.in

diff --git a/.gitignore b/.gitignore
index d83427aba8..57d54f676f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -47,6 +47,7 @@ config.status
 config.cache
 config/Toplevel.mk
 config/Paths.mk
+config/Tools-paths.mk
 
 dist/*
 extras/
diff --git a/Config.mk b/Config.mk
index d21d67945a..8d1368d25b 100644
--- a/Config.mk
+++ b/Config.mk
@@ -159,7 +159,7 @@ define move-if-changed
 	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
 endef
 
-PATH_FILES := Paths
+PATH_FILES := Paths Tools-paths
 INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
 
 include $(INC_FILES)
diff --git a/config/Tools-paths.mk.in b/config/Tools-paths.mk.in
new file mode 100644
index 0000000000..ac6298e761
--- /dev/null
+++ b/config/Tools-paths.mk.in
@@ -0,0 +1,10 @@
+-include $(XEN_ROOT)/config/Paths.mk
+
+XENSTORED                := @XENSTORED@
+XENSTORED_KVA            := @XENSTORED_KVA@
+XENSTORED_PORT           := @XENSTORED_PORT@
+XEN_RUN_STORED           := @XEN_RUN_STORED@
+
+LINUX_BACKEND_MODULES    := @LINUX_BACKEND_MODULES@
+
+qemu_xen_path            := @qemu_xen_path@
diff --git a/tools/configure b/tools/configure
index 3111f5688c..479c7c9a3c 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2742,7 +2742,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk ../config/Tools-paths.mk"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -11268,24 +11268,7 @@ for ac_config_target in $ac_config_targets
 do
   case $ac_config_target in
     "../config/Tools.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools.mk" ;;
-    "hotplug/common/hotplugpath.sh") CONFIG_FILES="$CONFIG_FILES hotplug/common/hotplugpath.sh" ;;
-    "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
-    "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
-    "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
-    "hotplug/Linux/init.d/sysconfig.xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xendomains" ;;
-    "hotplug/Linux/init.d/xen-watchdog") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xen-watchdog" ;;
-    "hotplug/Linux/init.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xencommons" ;;
-    "hotplug/Linux/init.d/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xendomains" ;;
-    "hotplug/Linux/init.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xendriverdomain" ;;
-    "hotplug/Linux/launch-xenstore") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/launch-xenstore" ;;
-    "hotplug/Linux/vif-setup") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/vif-setup" ;;
-    "hotplug/Linux/xen-hotplug-common.sh") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xen-hotplug-common.sh" ;;
-    "hotplug/Linux/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xendomains" ;;
-    "hotplug/NetBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xencommons" ;;
-    "hotplug/NetBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xendriverdomain" ;;
-    "ocaml/libs/xs/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/libs/xs/paths.ml" ;;
-    "ocaml/xenstored/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/paths.ml" ;;
-    "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
+    "../config/Tools-paths.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools-paths.mk" ;;
     "config.h") CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
     "hotplug/Linux/systemd/proc-xen.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/proc-xen.mount" ;;
     "hotplug/Linux/systemd/xen-init-dom0.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xen-init-dom0.service" ;;
diff --git a/tools/configure.ac b/tools/configure.ac
index 285b4ea128..ecd45e782e 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -7,24 +7,7 @@ AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
 AC_CONFIG_SRCDIR([libs/light/libxl.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
-hotplug/common/hotplugpath.sh
-hotplug/FreeBSD/rc.d/xencommons
-hotplug/FreeBSD/rc.d/xendriverdomain
-hotplug/Linux/init.d/sysconfig.xencommons
-hotplug/Linux/init.d/sysconfig.xendomains
-hotplug/Linux/init.d/xen-watchdog
-hotplug/Linux/init.d/xencommons
-hotplug/Linux/init.d/xendomains
-hotplug/Linux/init.d/xendriverdomain
-hotplug/Linux/launch-xenstore
-hotplug/Linux/vif-setup
-hotplug/Linux/xen-hotplug-common.sh
-hotplug/Linux/xendomains
-hotplug/NetBSD/rc.d/xencommons
-hotplug/NetBSD/rc.d/xendriverdomain
-ocaml/libs/xs/paths.ml
-ocaml/xenstored/paths.ml
-ocaml/xenstored/oxenstored.conf
+../config/Tools-paths.mk
 ])
 AC_CONFIG_HEADERS([config.h])
 AC_CONFIG_AUX_DIR([../])
diff --git a/tools/hotplug/FreeBSD/Makefile b/tools/hotplug/FreeBSD/Makefile
index a6552c9884..8de923781c 100644
--- a/tools/hotplug/FreeBSD/Makefile
+++ b/tools/hotplug/FreeBSD/Makefile
@@ -8,9 +8,13 @@ XEN_SCRIPT_DATA :=
 
 XEN_RCD_PROG := rc.d/xencommons rc.d/xendriverdomain
 
+IN_FILES := rc.d/xencommons rc.d/xendriverdomain
+
 .PHONY: all
 all:
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
+
 .PHONY: install
 install: install-scripts install-rcd
 
@@ -35,7 +39,7 @@ uninstall-scripts:
 	rm -f $(addprefix $(DESTDIR)$(XEN_SCRIPT_DIR)/, $(XEN_SCRIPT_DATA))
 
 .PHONY: install-rcd
-install-rcd:
+install-rcd: $(IN_FILES)
 	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
 	set -e; for i in $(XEN_RCD_PROG); \
 	   do \
@@ -51,3 +55,4 @@ clean:
 
 .PHONY: distclean
 distclean: clean
+	rm -rf $(IN_FILES)
diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 9a7b3a3515..6fcf84a6f4 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -26,9 +26,16 @@ XEN_SCRIPT_DATA := xen-script-common.sh locking.sh logging.sh
 XEN_SCRIPT_DATA += xen-hotplug-common.sh xen-network-common.sh vif-common.sh
 XEN_SCRIPT_DATA += block-common.sh
 
+IN_FILES := launch-xenstore vif-setup xendomains xen-hotplug-common.sh
+IN_FILES += init.d/sysconfig.xendomains init.d/xen-watchdog
+IN_FILES += init.d/xencommons init.d/xendomains
+IN_FILES += init.d/xendriverdomain init.d/sysconfig.xencommons
+
 .PHONY: all
 all: subdirs-all
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
+
 .PHONY: install
 install: install-initd install-scripts subdirs-install
 
@@ -37,7 +44,7 @@ uninstall: uninstall-initd uninstall-scripts subdirs-uninstall
 
 # See docs/misc/distro_mapping.txt for INITD_DIR location
 .PHONY: install-initd
-install-initd:
+install-initd: $(IN_FILES)
 	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
@@ -81,3 +88,4 @@ clean: subdirs-clean
 
 .PHONY: distclean
 distclean: clean
+	rm -rf $(IN_FILES)
diff --git a/tools/hotplug/NetBSD/Makefile b/tools/hotplug/NetBSD/Makefile
index 1cd3db2ccb..4ac6bd8fa7 100644
--- a/tools/hotplug/NetBSD/Makefile
+++ b/tools/hotplug/NetBSD/Makefile
@@ -12,9 +12,13 @@ XEN_SCRIPTS += qemu-ifup
 XEN_SCRIPT_DATA :=
 XEN_RCD_PROG := rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
 
+IN_FILES := rc.d/xencommons rc.d/xendriverdomain
+
 .PHONY: all
 all:
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
+
 .PHONY: install
 install: install-scripts install-rcd
 
@@ -39,7 +43,7 @@ uninstall-scripts:
 	rm -f $(addprefix $(DESTDIR)$(XEN_SCRIPT_DIR)/, $(XEN_SCRIPT_DATA))
 
 .PHONY: install-rcd
-install-rcd:
+install-rcd: $(IN_FILES)
 	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
 	set -e; for i in $(XEN_RCD_PROG); \
 	   do \
@@ -57,3 +61,4 @@ clean:
 
 .PHONY: distclean
 distclean: clean
+	rm -rf $(IN_FILES)
diff --git a/tools/hotplug/common/Makefile b/tools/hotplug/common/Makefile
index 62afe1019e..0017332293 100644
--- a/tools/hotplug/common/Makefile
+++ b/tools/hotplug/common/Makefile
@@ -7,9 +7,13 @@ include $(XEN_ROOT)/tools/Rules.mk
 XEN_SCRIPTS :=
 XEN_SCRIPT_DATA := hotplugpath.sh
 
+IN_FILES := hotplugpath.sh
+
 .PHONY: all
 all:
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
+
 .PHONY: install
 install: install-scripts
 
@@ -17,7 +21,7 @@ install: install-scripts
 uninstall: uninstall-scripts
 
 .PHONY: install-scripts
-install-scripts: all
+install-scripts: all $(IN_FILES)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
 	set -e; for i in $(XEN_SCRIPTS); \
 	   do \
@@ -38,3 +42,4 @@ clean:
 
 .PHONY: distclean
 distclean: clean
+	rm -rf $(IN_FILES)
diff --git a/tools/ocaml/libs/xs/Makefile b/tools/ocaml/libs/xs/Makefile
index e160e6a711..7d70d0904c 100644
--- a/tools/ocaml/libs/xs/Makefile
+++ b/tools/ocaml/libs/xs/Makefile
@@ -8,6 +8,8 @@ OCAMLOPTFLAGS += -for-pack Xenstore
 .NOTPARALLEL:
 # Ocaml is such a PITA!
 
+IN_FILES := paths.ml
+
 PREINTF = xsraw.cmi xst.cmi
 PREOBJS = queueop xsraw xst
 PRELIBS = $(foreach obj, $(PREOBJS),$(obj).cmo) $(foreach obj,$(PREOJBS),$(obj).cmx)
@@ -17,6 +19,10 @@ LIBS = xenstore.cma xenstore.cmxa
 
 all: $(PREINTF) $(PRELIBS) $(INTF) $(LIBS) $(PROGRAMS)
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
+
+$(OBJS): $(IN_FILES)
+
 bins: $(PROGRAMS)
 
 libs: $(LIBS)
@@ -43,4 +49,7 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstore
 
+.PHONY: distclean
+	rm -rf $(IN_FILES)
+
 include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index c333394a34..2576991030 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -72,6 +72,8 @@ XENSTOREDLIBS = \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xsd_glue $(OCAML_TOPLEVEL)/libs/xsd_glue/plugin_interface_v1.cmxa \
 	-ccopt -L -ccopt $(XEN_ROOT)/tools/libs/ctrl
 
+IN_FILES := paths.ml oxenstored.conf
+
 PROGRAMS = oxenstored
 
 oxenstored_LIBS = $(XENSTOREDLIBS)
@@ -83,7 +85,9 @@ oxenstored_OBJS = $(oxenstored_MLSORTED:.ml=)
 
 OCAML_PROGRAM = oxenstored
 
-all: $(INTF) $(LIBS) $(PROGRAMS)
+all: $(IN_FILES) $(INTF) $(LIBS) $(PROGRAMS)
+
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
 
 bins: $(PROGRAMS)
 
@@ -99,4 +103,7 @@ uninstall:
 	rm -f $(DESTDIR)$(XEN_CONFIG_DIR)/oxenstored.conf
 	rm -f $(DESTDIR)$(sbindir)/oxenstored
 
+distclean:
+	rm -rf $(IN_FILES)
+
 include $(OCAML_TOPLEVEL)/Makefile.rules
-- 
2.51.0


