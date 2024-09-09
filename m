Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35739718E1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794381.1203286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6m-0000tb-23; Mon, 09 Sep 2024 12:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794381.1203286; Mon, 09 Sep 2024 12:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6l-0000r4-UE; Mon, 09 Sep 2024 12:03:03 +0000
Received: by outflank-mailman (input) for mailman id 794381;
 Mon, 09 Sep 2024 12:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/dp=QH=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1snd6k-0000ce-PJ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:03:02 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7627bb3d-6ea3-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:03:01 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so188445666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:03:01 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65742sm331603066b.216.2024.09.09.05.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:02:59 -0700 (PDT)
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
X-Inumbo-ID: 7627bb3d-6ea3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725883380; x=1726488180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS9uEkUj8IaxPFALzgiU7ZUvbzIrHMm09v58rnSZdpg=;
        b=blL3ULlCJqFkdiRwbRbZlJU7f5B9V9xi2bzO3SFizwAwyNiznCT9iel6RO1nb16UA1
         WGFIp6NQrVbfkUOQ3kguC0JUkefCM5njDA8qM3UTDaNfrK9Er8ZvU11zU9e9UzAkH83x
         S99C4viijaNI4OcqRwh6Y4P/fJVpZsRckL7oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883380; x=1726488180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS9uEkUj8IaxPFALzgiU7ZUvbzIrHMm09v58rnSZdpg=;
        b=UZbXqEyrMoDbkc+smhD3w6KOwollYqtO8KbN3rHHLByF+n8+mOS2tmat5z9bcLDH4u
         6BMqpTDj9SqWrdjnBjUWcaw3JA+3v2bMbNlbndzmYpoxO2tLqrm9/INnYx3tbSJQIh+l
         N7rc4UKNZ6UrmvH4GpNQnim/ut+srduehJJZnUhmZsk7QVz9r075gcvRaHU5I6P6RSJH
         03A5N/PouebyEsbBeDcelN/dT3Q7NjbAVkXUjUvXAo+39uxxo3dbv1ZitakJMleYb7Wc
         0UkwLqY70ybBvromtw9Wiyq9nBrihAeXwmUfRDNly2+Qaba5nTslSltBVAi9rnZCwmFF
         2R8Q==
X-Gm-Message-State: AOJu0YwGUSlPGNzezKekHxH6LFMbR+s9VbmmWvvQJXlRxSCbOZdPKvBT
	l5Fa3rqkl1Rg7pSidskdtEVsMdxzJctkCJx1CAUskiS1MznkJoiC42CNBosAwCaOU8j5mh1ugHv
	6
X-Google-Smtp-Source: AGHT+IGA1jOMYQNlgckHldbsJ/pUfv6SI50pdEiSt6HwzBdD8+6zuq2HAyb8AGGqPQMjkcvx64XjvA==
X-Received: by 2002:a17:906:eec7:b0:a86:bb90:93fa with SMTP id a640c23a62f3a-a8a888726c3mr1087075466b.44.1725883380261;
        Mon, 09 Sep 2024 05:03:00 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v3 1/3] ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo
Date: Mon,  9 Sep 2024 13:02:40 +0100
Message-Id: <034c49b1bcfab5fb67bbf290328ac517ea82f30a.1725881488.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725881488.git.andrii.sultanov@cloud.com>
References: <cover.1725881488.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This plugin intends to hide the unstable Xenctrl interface under a
stable one. In case of the change in the interface, a V2 of this plugin
would need to be produced, but V1 with the old interface would
need to be kept (with potential change in the implementation) in the
meantime.

To reduce the need for such changes in the future, this plugin only
provides the absolute minimum functionality that Oxenstored uses - only
three fields of the domaininfo struct are used and presented here.

Oxenstored currently uses the single-domain domain_getinfo function,
whereas Cxenstored uses the more-efficient domain_getinfolist. Both of
these are provided in the plugin to allow a transition from one to the
other without modifying the interface in the future. Both return
identical structures and rely on the same fields in xenctrl, thus if one
of them breaks, both will break, and a new version of the interface would
need to be issued.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
* Reformat files appropriately
* Rename all instances of 'xenstoredglue', 'xenstored_glue', 'xsglue' to
'xsd_glue' for consistency
* Remove _v1 suffix from all static functions
* Remove leftover #defines left unused by the previous changes
* Fix inconsistent tabs/spaces usage, added blank lines where appropriate.
* Define the 'xsd_glue_failwith' macro as suggested
* Remove first_domain argument in 'domain_getinfolist' function
* Remove unnecessary memory allocation alignment code in
'domain_getinfolist'
* Improve error handling in 'domain_getinfolist' as suggested.
* Add SPDX license headers to new files.

 tools/ocaml/Makefile                          |   1 +
 tools/ocaml/libs/Makefile                     |   2 +-
 tools/ocaml/libs/xsd_glue/META.in             |   4 +
 tools/ocaml/libs/xsd_glue/Makefile            |  46 +++++
 .../xsd_glue/domain_getinfo_plugin_v1/META.in |   5 +
 .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
 .../domain_getinfo_stubs_v1.c                 | 162 ++++++++++++++++++
 .../domain_getinfo_v1.ml                      |  35 ++++
 .../domain_getinfo_v1.mli                     |   1 +
 .../libs/xsd_glue/plugin_interface_v1.ml      |  30 ++++
 .../libs/xsd_glue/plugin_interface_v1.mli     |  38 ++++
 11 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 tools/ocaml/libs/xsd_glue/META.in
 create mode 100644 tools/ocaml/libs/xsd_glue/Makefile
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/META.in
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
 create mode 100644 tools/ocaml/libs/xsd_glue/plugin_interface_v1.ml
 create mode 100644 tools/ocaml/libs/xsd_glue/plugin_interface_v1.mli

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 1557fd6c3c..7252eb23d7 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -29,6 +29,7 @@ build-tools-oxenstored:
 	$(MAKE) -s -C libs/mmap
 	$(MAKE) -s -C libs/xb
 	$(MAKE) -s -C libs/xc
+	$(MAKE) -s -C libs/xsd_glue
 	$(MAKE) -C xenstored
 
 .PHONY: format
diff --git a/tools/ocaml/libs/Makefile b/tools/ocaml/libs/Makefile
index 89350aa12f..6bcec58502 100644
--- a/tools/ocaml/libs/Makefile
+++ b/tools/ocaml/libs/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS= \
 	mmap \
 	eventchn xc \
-	xb xs
+	xb xs xsd_glue
 
 .PHONY: all
 all: subdirs-all
diff --git a/tools/ocaml/libs/xsd_glue/META.in b/tools/ocaml/libs/xsd_glue/META.in
new file mode 100644
index 0000000000..dbd584ac17
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/META.in
@@ -0,0 +1,4 @@
+version = "@VERSION@"
+description = "A small library on top of unstable Xenctrl interfaces used by Oxenstored"
+archive(byte) = "plugin_interface_v1.cma"
+archive(native) = "plugin_interface_v1.cmxa"
diff --git a/tools/ocaml/libs/xsd_glue/Makefile b/tools/ocaml/libs/xsd_glue/Makefile
new file mode 100644
index 0000000000..f84291f7fe
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/Makefile
@@ -0,0 +1,46 @@
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
+	mkdir -p $(OCAMLDESTDIR)
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_glue META $(INTF) $(LIBS)
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_glue_dev META $(INTF) $(LIBS) *.ml *.mli
+
+.PHONY: uninstall
+uninstall: subdirs-uninstall
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
+
+.PHONY: clean
+clean: subdirs-clean
+
+.PHONY: distclean
+distclean: subdirs-distclean
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/META.in b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/META.in
new file mode 100644
index 0000000000..fb917def62
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/META.in
@@ -0,0 +1,5 @@
+version = "@VERSION@"
+description = "Xenstored plugin for Xenctrl.domain_getinfo unstable interface - V1"
+requires = "plugin_interface_v1"
+archive(byte) = "domain_getinfo_v1.cma"
+archive(native) = "domain_getinfo_v1.cmxa"
diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
new file mode 100644
index 0000000000..4f99e99e0f
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
@@ -0,0 +1,38 @@
+OCAML_TOPLEVEL=$(CURDIR)/../../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
+
+CFLAGS += -I $(OCAML_TOPLEVEL)/libs -I $(OCAML_TOPLEVEL)/libs/xsd_glue
+CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
+OCAMLOPTFLAGS += -opaque
+OCAMLINCLUDE += -I ./ -I ../
+
+OBJS = domain_getinfo_v1
+INTF = $(foreach obj, $(OBJS),$(obj).cmi)
+LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
+
+LIBS_xsd_glue = $(call xenlibs-ldflags-ldlibs,xenctrl)
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
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/ocaml/xsd_glue/xenctrl_plugin
+	$(INSTALL_PROG) domain_getinfo_v1.cmxs $(DESTDIR)$(LIBEXEC)/ocaml/xsd_glue/xenctrl_plugin
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(LIBEXEC)/ocaml/xsd_glue/xenctrl_plugin/domain_getinfo_v1.cmxs
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
+
diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
new file mode 100644
index 0000000000..1a87849c83
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception */
+
+#define _GNU_SOURCE
+
+#include <stdlib.h>
+#include <string.h>
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
+#include <xenctrl.h>
+
+#include "xen-caml-compat.h"
+
+static inline xc_interface *xsd_glue_xch_of_val(value v)
+{
+	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
+
+	return xch;
+}
+
+static void xsd_glue_xenctrl_finalize(value v)
+{
+	xc_interface *xch = xsd_glue_xch_of_val(v);
+
+	xc_interface_close(xch);
+}
+
+static struct custom_operations xsd_glue_xenctrl_ops = {
+	.identifier  = "xsd_glue.domain_getinfo_v1.xenctrl",
+	.finalize    = xsd_glue_xenctrl_finalize,
+	.compare     = custom_compare_default,     /* Can't compare     */
+	.hash        = custom_hash_default,        /* Can't hash        */
+	.serialize   = custom_serialize_default,   /* Can't serialize   */
+	.deserialize = custom_deserialize_default, /* Can't deserialize */
+	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+};
+
+static void xsd_glue_failwith(xc_interface *xch,
+		const char *func,
+		unsigned int line)
+{
+	const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
+	char *str = NULL;
+	CAMLparam0();
+	CAMLlocal1(msg);
+
+#define ERR (error && error->code != XC_ERROR_NONE)
+
+	int ret = asprintf(&str,
+			"%d: %s%s%s - called from %s:%u",
+			ERR ? error->code : errno,
+			ERR ? xc_error_code_to_desc(error->code) : strerror(errno),
+			ERR ? ": " : "",
+			ERR ? error->message : "",
+			func, line);
+
+#undef ERR
+
+	if (!*str || (ret == -1))
+		caml_raise_out_of_memory();
+
+	msg = caml_copy_string(str);
+	free(str);
+
+	caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
+}
+#define xsd_glue_failwith(xch) xsd_glue_failwith(xch, __func__, __LINE__)
+
+CAMLprim value stub_xsd_glue_xc_interface_open(value unit)
+{
+	CAMLparam1(unit);
+	CAMLlocal1(result);
+	xc_interface *xch;
+
+	result = caml_alloc_custom(&xsd_glue_xenctrl_ops, sizeof(xch), 0, 1);
+
+	caml_enter_blocking_section();
+	xch = xc_interface_open(NULL, NULL, 0);
+	caml_leave_blocking_section();
+
+	if (!xch)
+		xsd_glue_failwith(xch);
+
+	*(xc_interface **)Data_custom_val(result) = xch;
+
+	CAMLreturn(result);
+}
+
+static value xsd_glue_alloc_domaininfo(const xc_domaininfo_t *info)
+{
+	CAMLparam0();
+	CAMLlocal1(result);
+
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
+CAMLprim value stub_xsd_glue_xc_domain_getinfo(value xch_val, value domid)
+{
+	CAMLparam2(xch_val, domid);
+	CAMLlocal1(result);
+	xc_interface *xch = xsd_glue_xch_of_val(xch_val);
+	xc_domaininfo_t info;
+	int ret;
+	int domid_c = Int_val(domid);
+
+	caml_enter_blocking_section();
+	ret = xc_domain_getinfo_single(xch, domid_c, &info);
+	caml_leave_blocking_section();
+
+	if (ret < 0)
+		xsd_glue_failwith(xch);
+
+	result = xsd_glue_alloc_domaininfo(&info);
+
+	CAMLreturn(result);
+}
+
+CAMLprim value stub_xsd_glue_xc_domain_getinfolist(value xch_val)
+{
+	CAMLparam1(xch_val);
+	CAMLlocal1(result);
+	xc_interface *xch = xsd_glue_xch_of_val(xch_val);
+	xc_domaininfo_t *info;
+	int i, retval;
+
+	/* get the minimum number of allocate byte we need and bump it up to page boundary */
+	info = malloc(sizeof(xc_domaininfo_t) * DOMID_FIRST_RESERVED);
+	if ( !info )
+		caml_raise_out_of_memory();
+
+	caml_enter_blocking_section();
+	retval = xc_domain_getinfolist(xch, 0, DOMID_FIRST_RESERVED, info);
+	caml_leave_blocking_section();
+
+	if (retval <= 0) {
+		free(info);
+		xsd_glue_failwith(xch);
+	}
+
+	result = caml_alloc(retval, 0);
+	for (i = 0; i < retval; i++) {
+		caml_modify(&Field(result, i), xsd_glue_alloc_domaininfo(info + i));
+	}
+
+	free(info);
+	CAMLreturn(result);
+}
diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
new file mode 100644
index 0000000000..be50853c4b
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
@@ -0,0 +1,35 @@
+(* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception *)
+(** Minimal interface on top of unstable Xenctrl for Oxenstored's usage *)
+
+module P = Plugin_interface_v1
+
+module M : P.Domain_getinfo_V1 = struct
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
+  external interface_open : unit -> handle = "stub_xsd_glue_xc_interface_open"
+
+  external domain_getinfo : handle -> domid -> domaininfo
+    = "stub_xsd_glue_xc_domain_getinfo"
+
+  external domain_getinfolist : handle -> domaininfo array
+    = "stub_xsd_glue_xc_domain_getinfolist"
+
+  let _ = Callback.register_exception "xsg.error_v1" (Error "register_callback")
+end
+
+let () =
+  Printf.ksprintf !P.logging_function "Registration of %s plugin started\n%!"
+    __MODULE__;
+  P.register_plugin_v1 (module M : P.Domain_getinfo_V1);
+  Printf.ksprintf !P.logging_function "Registration of %s plugin successful\n%!"
+    __MODULE__
diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
new file mode 100644
index 0000000000..465beda1a3
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
@@ -0,0 +1 @@
+(* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception *)
diff --git a/tools/ocaml/libs/xsd_glue/plugin_interface_v1.ml b/tools/ocaml/libs/xsd_glue/plugin_interface_v1.ml
new file mode 100644
index 0000000000..5ab98b83bd
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/plugin_interface_v1.ml
@@ -0,0 +1,30 @@
+(* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception *)
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
+  val domain_getinfolist : handle -> domaininfo array
+end
+
+let ignore_logging : string -> unit = ignore
+let logging_function = ref ignore_logging
+let register_logging_function func = logging_function := func
+let plugin_implementation_v1 : (module Domain_getinfo_V1) option ref = ref None
+let register_plugin_v1 m = plugin_implementation_v1 := Some m
+
+let get_plugin_v1 () : (module Domain_getinfo_V1) =
+  match !plugin_implementation_v1 with
+  | Some s -> s
+  | None -> failwith "No plugin loaded"
diff --git a/tools/ocaml/libs/xsd_glue/plugin_interface_v1.mli b/tools/ocaml/libs/xsd_glue/plugin_interface_v1.mli
new file mode 100644
index 0000000000..69f91510f7
--- /dev/null
+++ b/tools/ocaml/libs/xsd_glue/plugin_interface_v1.mli
@@ -0,0 +1,38 @@
+(* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception *)
+
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
+*)
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
+  val domain_getinfolist : handle -> domaininfo array
+end
+
+val register_logging_function : (string -> unit) -> unit
+val logging_function : (string -> unit) ref
+val register_plugin_v1 : (module Domain_getinfo_V1) -> unit
+val get_plugin_v1 : unit -> (module Domain_getinfo_V1)
-- 
2.39.2


