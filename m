Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAC95B12E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781625.1191122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nK-0003Hv-Vv; Thu, 22 Aug 2024 09:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781625.1191122; Thu, 22 Aug 2024 09:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nK-0003DN-RV; Thu, 22 Aug 2024 09:07:50 +0000
Received: by outflank-mailman (input) for mailman id 781625;
 Thu, 22 Aug 2024 09:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8+D=PV=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1sh3mE-00031f-CF
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:06:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7cfc6d4-6065-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 11:06:40 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so827532a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 02:06:40 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e6717sm88948266b.96.2024.08.22.02.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 02:06:38 -0700 (PDT)
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
X-Inumbo-ID: d7cfc6d4-6065-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724317599; x=1724922399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWxy1XT9RvB6ymqJ3xYxgfXq+O27Deowe7jItjsgCQc=;
        b=eLnXtIpUkVLwUNxrm0cC/CqdYM60hNNUFIIoPHx9QMVhFCkXWUuO2NBrLQptwd5z4W
         IbTGmhBLXC+2vBXaLjjGEU0Rkm43Mic5/TRuve/Q2ElN5WZvwPRXDt97FQZyQk16aKxs
         u2NevLxqzCOioFvIG2ogNpuAfz/2QUNN0HCvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317599; x=1724922399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWxy1XT9RvB6ymqJ3xYxgfXq+O27Deowe7jItjsgCQc=;
        b=j+0HX7geah8CPiibGCmX8cfQrcTLv3AD1wD+Z1Euq0h7Z1rdROjCojPnmfHci6i56S
         r4BN4yO84wzG/ks2cO+ZvAozbksTSX8JGOgBNZA9nbX2A3aJ0tuYnJlyJ0iZOYo6YBZA
         3yEqexPdgz+jTYL4VeSFb7bLspAw7MCANedFQpMq7NQtAOwzBwjR5d721h4LADkHvJ5L
         cHcuEiNWvEghVmJaZGQG10LTRexbS8NxDpPVpmie2rVMLuM5jaWI+3UeMay+7dJSe8y2
         Yjt/w2tg5GglbEpXlBKz2tzqpav3CSUuxWnSRjhIpY2WHRYBfXiBa8gvdh/URGcDuuyt
         KeQA==
X-Gm-Message-State: AOJu0YzhR78irXWaQs/usbOQcgY4Kzcdu0RSVGYo3v382vZt1so3q/hs
	3busTI07OaRS5PpP+mcmgKngkGIjnz1Nr77AsBR98EhB2qU73qyMlmynxk/JzX7zcVtW0gGVQk3
	wjE0=
X-Google-Smtp-Source: AGHT+IFlLETmcRyIz7ND8jOO3vVUr1MX+pWtVnX6qPCrLgEg16gc99LhCVGWWK8MhMoKIvXaA6IawQ==
X-Received: by 2002:a17:907:9495:b0:a86:8368:860a with SMTP id a640c23a62f3a-a868368886dmr262561766b.35.1724317599189;
        Thu, 22 Aug 2024 02:06:39 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 2/4] ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo
Date: Thu, 22 Aug 2024 10:06:03 +0100
Message-Id: <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724314239.git.andrii.sultanov@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This plugin intends to hide the unstable Xenctrl interface under a
stable one. In case of the change in the interface, a V2 of this plugin
would need to be produced, but V1 with the old interface would
need to be kept (with potential change in the implementation) in the
meantime.

To reduce the need for such changes in the future, this plugin only
provides the absolute minimum functionality that Oxenstored uses - only
four fields of the domaininfo struct are used and presented here.

Oxenstored currently uses the single-domain domain_getinfo function,
whereas Cxenstored uses the more-efficient domain_getinfolist. Both of
these are provided in the plugin to allow a transition from one to the
other without modifying the interface in the future. Both return
identical structures and rely on the same fields in xenctrl, thus if one
of them breaks, both will break, and a new version of the interface would
need to be issued.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/Makefile                          |   1 +
 tools/ocaml/Makefile.rules                    |  17 +-
 tools/ocaml/libs/Makefile                     |   2 +-
 tools/ocaml/libs/xenstoredglue/META.in        |   4 +
 tools/ocaml/libs/xenstoredglue/Makefile       |  39 ++++
 .../domain_getinfo_plugin_v1/META.in          |   5 +
 .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
 .../domain_getinfo_stubs_v1.c                 | 169 ++++++++++++++++++
 .../domain_getinfo_v1.ml                      |  51 ++++++
 .../domain_getinfo_v1.mli                     |   0
 .../libs/xenstoredglue/plugin_interface_v1.ml |  25 +++
 .../xenstoredglue/plugin_interface_v1.mli     |  34 ++++
 12 files changed, 383 insertions(+), 2 deletions(-)
 create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
 create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
 create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
 create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 1557fd6c3c..eb426f2ee5 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -29,6 +29,7 @@ build-tools-oxenstored:
 	$(MAKE) -s -C libs/mmap
 	$(MAKE) -s -C libs/xb
 	$(MAKE) -s -C libs/xc
+	$(MAKE) -s -C libs/xenstoredglue
 	$(MAKE) -C xenstored
 
 .PHONY: format
diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0d3c6ac839..0444e95f17 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -50,12 +50,13 @@ ifneq ($(MAKECMDGOALS),clean)
 endif
 
 clean: $(CLEAN_HOOKS)
-	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
+	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
 
 distclean: clean
 
 quiet-command = $(if $(V),$1,@printf " %-8s %s\n" "$2" "$3" && $1)
 
+mk-caml-shared-lib-native = $(call quiet-command, $(OCAMLOPT) $(OCAMLOPTFLAGS) -shared -linkall -o $1 $2 $3,MLA,$1)
 mk-caml-lib-native = $(call quiet-command, $(OCAMLOPT) $(OCAMLOPTFLAGS) -a -o $1 $2 $3,MLA,$1)
 mk-caml-lib-bytecode = $(call quiet-command, $(OCAMLC) $(OCAMLCFLAGS) -a -o $1 $2 $3,MLA,$1)
 
@@ -75,6 +76,19 @@ define OCAML_LIBRARY_template
 	$(call mk-caml-lib-stubs,$$@, $$+)
 endef
 
+# Dynamically linked OCaml libraries ("plugins" in Dynlink parlance)
+# need to compile an .cmxs file
+define OCAML_DYN_LIBRARY_template
+ $(1).cmxs: $(1).cmxa
+	$(call mk-caml-shared-lib-native,$$@, $(1).cmxa)
+ $(1).cmxa: lib$(1)_stubs.a $(foreach obj,$($(1)_OBJS),$(obj).cmx)
+	$(call mk-caml-lib-native,$$@, -cclib -l$(1)_stubs $(foreach lib,$(LIBS_$(1)),-cclib $(lib)), $(foreach obj,$($(1)_OBJS),$(obj).cmx))
+ $(1)_stubs.a: $(foreach obj,$$($(1)_C_OBJS),$(obj).o)
+	$(call mk-caml-stubs,$$@, $$+)
+ lib$(1)_stubs.a: $(foreach obj,$($(1)_C_OBJS),$(obj).o)
+	$(call mk-caml-lib-stubs,$$@, $$+)
+endef
+
 define OCAML_NOC_LIBRARY_template
  $(1).cmxa: $(foreach obj,$($(1)_OBJS),$(obj).cmx)
 	$(call mk-caml-lib-native,$$@, , $(foreach obj,$($(1)_OBJS),$(obj).cmx))
@@ -97,6 +111,7 @@ endef
 -include .ocamldep.make
 
 $(foreach lib,$(OCAML_LIBRARY),$(eval $(call OCAML_LIBRARY_template,$(lib))))
+$(foreach lib,$(OCAML_DYN_LIBRARY),$(eval $(call OCAML_DYN_LIBRARY_template,$(lib))))
 $(foreach lib,$(OCAML_NOC_LIBRARY),$(eval $(call OCAML_NOC_LIBRARY_template,$(lib))))
 $(foreach p,$(OCAML_PROGRAM),$(eval $(call OCAML_PROGRAM_template,$(p))))
 $(foreach p,$(C_PROGRAM),$(eval $(call C_PROGRAM_template,$(p))))
diff --git a/tools/ocaml/libs/Makefile b/tools/ocaml/libs/Makefile
index 89350aa12f..828fbf859d 100644
--- a/tools/ocaml/libs/Makefile
+++ b/tools/ocaml/libs/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS= \
 	mmap \
 	eventchn xc \
-	xb xs
+	xb xs xenstoredglue
 
 .PHONY: all
 all: subdirs-all
diff --git a/tools/ocaml/libs/xenstoredglue/META.in b/tools/ocaml/libs/xenstoredglue/META.in
new file mode 100644
index 0000000000..dbd584ac17
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/META.in
@@ -0,0 +1,4 @@
+version = "@VERSION@"
+description = "A small library on top of unstable Xenctrl interfaces used by Oxenstored"
+archive(byte) = "plugin_interface_v1.cma"
+archive(native) = "plugin_interface_v1.cmxa"
diff --git a/tools/ocaml/libs/xenstoredglue/Makefile b/tools/ocaml/libs/xenstoredglue/Makefile
new file mode 100644
index 0000000000..020acd3bef
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/Makefile
@@ -0,0 +1,39 @@
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
+
+SUBDIRS= domain_getinfo_plugin_v1
+
+CFLAGS += $(CFLAGS_xeninclude)
+OCAMLOPTFLAGS += -opaque
+
+OBJS = plugin_interface_v1
+INTF = $(foreach obj, $(OBJS),$(obj).cmi)
+LIBS = plugin_interface_v1.cma plugin_interface_v1.cmxa
+LIBS_plugin_interface_v1 =
+plugin_interface_v1_OBJS=$(OBJS)
+
+.PHONY: all
+all: $(INTF) $(LIBS) $(PROGRAMS) subdirs-all
+
+bins: $(PROGRAMS)
+
+libs: $(LIBS)
+
+plugin_interface_v1 = $(OBJS)
+
+OCAML_NOC_LIBRARY = plugin_interface_v1
+
+.PHONY: install
+install: $(LIBS) META subdirs-install
+
+.PHONY: uninstall
+uninstall: subdirs-uninstall
+
+.PHONY: clean
+clean: subdirs-clean
+
+.PHONY: distclean
+distclean: subdirs-distclean
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
new file mode 100644
index 0000000000..fb917def62
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
@@ -0,0 +1,5 @@
+version = "@VERSION@"
+description = "Xenstored plugin for Xenctrl.domain_getinfo unstable interface - V1"
+requires = "plugin_interface_v1"
+archive(byte) = "domain_getinfo_v1.cma"
+archive(native) = "domain_getinfo_v1.cmxa"
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
new file mode 100644
index 0000000000..eae44f8326
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
@@ -0,0 +1,38 @@
+OCAML_TOPLEVEL=$(CURDIR)/../../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
+
+CFLAGS += -I $(OCAML_TOPLEVEL)/libs/xenstoredglue $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
+CFLAGS += $(APPEND_CFLAGS)
+OCAMLOPTFLAGS += -opaque
+OCAMLINCLUDE += -I ../ -I ./
+
+OBJS = domain_getinfo_v1
+INTF = $(foreach obj, $(OBJS),$(obj).cmi)
+LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
+
+LIBS_xenstoredglue = $(call xenlibs-ldflags-ldlibs,xenctrl)
+
+all: $(INTF) $(LIBS) $(PROGRAMS)
+
+bins: $(PROGRAMS)
+
+libs: $(LIBS)
+
+domain_getinfo_v1_OBJS = $(OBJS)
+domain_getinfo_v1 = $(OBJS)
+domain_getinfo_v1_C_OBJS = domain_getinfo_stubs_v1
+
+OCAML_DYN_LIBRARY = domain_getinfo_v1
+
+.PHONY: install
+install: $(LIBS) META
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)/xenctrl_plugin
+	$(INSTALL_PROG) domain_getinfo_v1.cmxs $(DESTDIR)$(LIBEXEC_BIN)/xenctrl_plugin
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(LIBEXEC_BIN)/xenctrl_plugin/domain_getinfo_v1.cmxs
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
+
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
new file mode 100644
index 0000000000..a29ac7c877
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
@@ -0,0 +1,169 @@
+#define _XOPEN_SOURCE 600
+#include <stdlib.h>
+#include <errno.h>
+
+#define CAML_NAME_SPACE
+#include <caml/alloc.h>
+#include <caml/memory.h>
+#include <caml/signals.h>
+#include <caml/fail.h>
+#include <caml/callback.h>
+#include <caml/custom.h>
+
+#include <xen-tools/common-macros.h>
+
+#include <string.h>
+
+#define XC_WANT_COMPAT_MAP_FOREIGN_API
+#include <xenctrl.h>
+
+#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
+#define MAX_FUNC_LINE_LEN 64
+#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __LINE__)
+
+// This is a minimal stub to xenctrl for oxenstored's purposes
+// For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c
+
+static inline xc_interface *xsglue_xch_of_val_v1(value v)
+{
+	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
+
+	return xch;
+}
+
+static void xsglue_xenctrl_finalize(value v)
+{
+	xc_interface *xch = xsglue_xch_of_val_v1(v);
+
+	xc_interface_close(xch);
+}
+
+static struct custom_operations xsglue_xenctrl_ops = {
+	.identifier  = "xenctrl",
+	.finalize    = xsglue_xenctrl_finalize,
+	.compare     = custom_compare_default,     /* Can't compare     */
+	.hash        = custom_hash_default,        /* Can't hash        */
+	.serialize   = custom_serialize_default,   /* Can't serialize   */
+	.deserialize = custom_deserialize_default, /* Can't deserialize */
+	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+};
+
+static void Noreturn xsglue_failwith_xc(xc_interface *xch,
+		char const* func,
+		int line)
+{
+	char error_str[ERR_MSG_LEN + MAX_FUNC_LINE_LEN];
+	size_t str_len = 0;
+	if (xch) {
+		const xc_error *error = xc_get_last_error(xch);
+		if (error->code == XC_ERROR_NONE)
+			str_len = snprintf(error_str, ERR_MSG_LEN,
+				           "%d: %s", errno, strerror(errno));
+		else
+			str_len = snprintf(error_str, ERR_MSG_LEN,
+				      	   "%d: %s: %s", error->code,
+					   xc_error_code_to_desc(error->code),
+					   error->message);
+	} else {
+		str_len = snprintf(error_str, ERR_MSG_LEN,
+			           "Unable to open XC interface");
+	}
+	str_len = str_len < ERR_MSG_LEN ? str_len : ERR_MSG_LEN;
+	// Log caller's source code function and line
+	snprintf(error_str+str_len, MAX_FUNC_LINE_LEN,
+                 " - called from %s:%d", func, line);
+	caml_raise_with_string(*caml_named_value("xsg.error"), error_str);
+}
+
+CAMLprim value stub_xsglue_xc_interface_open(value unit)
+{
+	CAMLparam1(unit);
+	CAMLlocal1(result);
+	xc_interface *xch;
+
+	result = caml_alloc_custom(&xsglue_xenctrl_ops, sizeof(xch), 0, 1);
+
+	caml_enter_blocking_section();
+	xch = xc_interface_open(NULL, NULL, 0);
+	caml_leave_blocking_section();
+
+	if ( !xch )
+		failwith_xc_v1(xch);
+
+	*(xc_interface **)Data_custom_val(result) = xch;
+
+	CAMLreturn(result);
+}
+
+static value xsglue_alloc_domaininfo_v1(xc_domaininfo_t * info)
+{
+	CAMLparam0();
+	CAMLlocal1(result);
+	result = caml_alloc_tuple(4);
+
+	Store_field(result,  0, Val_int(info->domain));
+	Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying));
+	Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdown));
+	Store_field(result,  3, Val_int(MASK_EXTR(info->flags, XEN_DOMINF_shutdownmask)));
+
+	CAMLreturn(result);
+}
+
+CAMLprim value stub_xsglue_xc_domain_getinfo(value xch_val, value domid)
+{
+	CAMLparam2(xch_val, domid);
+	CAMLlocal1(result);
+	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
+	xc_domaininfo_t info;
+	int ret;
+
+	ret = xc_domain_getinfo_single(xch, Int_val(domid), &info);
+	if (ret < 0)
+		failwith_xc_v1(xch);
+
+	result = xsglue_alloc_domaininfo_v1(&info);
+
+	CAMLreturn(result);
+}
+
+CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value first_domain, value nb)
+{
+	CAMLparam3(xch_val, first_domain, nb);
+	CAMLlocal2(result, temp);
+	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
+	xc_domaininfo_t * info;
+	int i, ret, toalloc, retval;
+	unsigned int c_max_domains;
+	uint32_t c_first_domain;
+
+	/* get the minimum number of allocate byte we need and bump it up to page boundary */
+	toalloc = (sizeof(xc_domaininfo_t) * Int_val(nb)) | 0xfff;
+	ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);
+	if (ret)
+		caml_raise_out_of_memory();
+
+	result = temp = Val_emptylist;
+
+	c_first_domain = Int_val(first_domain);
+	c_max_domains = Int_val(nb);
+	caml_enter_blocking_section();
+	retval = xc_domain_getinfolist(xch, c_first_domain,
+				       c_max_domains, info);
+	caml_leave_blocking_section();
+
+	if (retval < 0) {
+		free(info);
+		failwith_xc_v1(xch);
+	}
+	for (i = 0; i < retval; i++) {
+		result = caml_alloc_small(2, Tag_cons);
+		Field(result, 0) = Val_int(0);
+		Field(result, 1) = temp;
+		temp = result;
+
+		Store_field(result, 0, xsglue_alloc_domaininfo_v1(info + i));
+	}
+
+	free(info);
+	CAMLreturn(result);
+}
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
new file mode 100644
index 0000000000..d8947b618f
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
@@ -0,0 +1,51 @@
+(** Minimal interface on top of unstable Xenctrl for Oxenstored's usage *)
+
+(** For the full Xenctrl interface, see: tools/ocaml/libs/xc/ *)
+
+module M : Plugin_interface_v1.Domain_getinfo_V1 = struct
+  exception Error of string
+
+  type domid = int
+  type handle
+
+  type domaininfo = {
+    domid : domid;
+    dying : bool;
+    shutdown : bool;
+    shutdown_code : int;
+  }
+
+  external interface_open : unit -> handle = "stub_xsglue_xc_interface_open"
+
+  external domain_getinfo : handle -> domid -> domaininfo
+    = "stub_xsglue_xc_domain_getinfo"
+
+  external __domain_getinfolist : handle -> domid -> int -> domaininfo list
+    = "stub_xsglue_xc_domain_getinfolist"
+
+  let domain_getinfolist handle first_domain =
+    (* [rev_concat lst] is equivalent to [lst |> List.concat |> List.rev]
+     * except it is tail recursive, whereas [List.concat] isn't.
+     * Example:
+     * rev_concat [[10;9;8];[7;6];[5]]] = [5; 6; 7; 8; 9; 10]
+     *)
+    let rev_append_fold acc e = List.rev_append e acc in
+    let rev_concat lst = List.fold_left rev_append_fold [] lst in
+
+    let nb = 1024 in
+    let rec __getlist lst from =
+      (* _domain_getinfolist returns domains in reverse order, largest first *)
+      match __domain_getinfolist handle from nb with
+      | [] -> rev_concat lst
+      | hd :: _ as l -> __getlist (l :: lst) (hd.domid + 1)
+    in
+    __getlist [] first_domain
+
+  let _ = Callback.register_exception "xsg.error" (Error "register_callback")
+end
+
+let () =
+  Printf.printf "Registration of %s plugin started\n%!" __MODULE__;
+  Plugin_interface_v1.register_plugin_v1
+    (module M : Plugin_interface_v1.Domain_getinfo_V1);
+  Printf.printf "Registration of %s plugin successful\n%!" __MODULE__
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
new file mode 100644
index 0000000000..6398b697ed
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
@@ -0,0 +1,25 @@
+module type Domain_getinfo_V1 = sig
+  exception Error of string
+
+  type domid = int
+  type handle
+
+  type domaininfo = {
+    domid : domid;
+    dying : bool;
+    shutdown : bool;
+    shutdown_code : int;
+  }
+
+  val interface_open : unit -> handle
+  val domain_getinfo : handle -> domid -> domaininfo
+  val domain_getinfolist : handle -> domid -> domaininfo list
+end
+
+let plugin_implementation_v1 : (module Domain_getinfo_V1) option ref = ref None
+let register_plugin_v1 m = plugin_implementation_v1 := Some m
+
+let get_plugin_v1 () : (module Domain_getinfo_V1) =
+  match !plugin_implementation_v1 with
+  | Some s -> s
+  | None -> failwith "No plugin loaded"
diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
new file mode 100644
index 0000000000..cf20cc5efa
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
@@ -0,0 +1,34 @@
+(** To avoid breaking the plugin interface, this module needs to be
+    standalone and can't rely on any other Xen library. Even unrelated
+    changes in the interfaces of those modules would change the hash
+    of this interface and break the plugin system.
+    It can only depend on Stdlib, therefore all of the types (domid,
+    domaininfo etc.) are redefined here instead of using alternatives
+    defined elsewhere.
+
+    NOTE: The signature of this interface should not be changed (no
+    functions or types can be added, modified, or removed). If
+    underlying Xenctrl changes require a new interface, a V2 with a
+    corresponding plugin should be created.
+ *)
+
+module type Domain_getinfo_V1 = sig
+  exception Error of string
+
+  type domid = int
+  type handle
+
+  type domaininfo = {
+    domid : domid;
+    dying : bool;
+    shutdown : bool;
+    shutdown_code : int;
+  }
+
+  val interface_open : unit -> handle
+  val domain_getinfo : handle -> domid -> domaininfo
+  val domain_getinfolist : handle -> domid -> domaininfo list
+end
+
+val register_plugin_v1 : (module Domain_getinfo_V1) -> unit
+val get_plugin_v1 : unit -> (module Domain_getinfo_V1)
-- 
2.39.2


