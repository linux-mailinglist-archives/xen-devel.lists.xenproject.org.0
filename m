Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F8969C43
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788998.1198542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy3-0008H2-Oe; Tue, 03 Sep 2024 11:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788998.1198542; Tue, 03 Sep 2024 11:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy3-0008BY-Jx; Tue, 03 Sep 2024 11:45:03 +0000
Received: by outflank-mailman (input) for mailman id 788998;
 Tue, 03 Sep 2024 11:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rbyx=QB=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1slRy2-0007fy-EP
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:45:02 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f345ff4d-69e9-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 13:45:00 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so8822617e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:45:00 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feacd7sm673794266b.34.2024.09.03.04.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:44:58 -0700 (PDT)
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
X-Inumbo-ID: f345ff4d-69e9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725363899; x=1725968699; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywxkLKS4OQrjeJPdR5be+uTG0E4A2l8FWKHBAiJNfSk=;
        b=I0rkB+2/Hr+Y/bmnAmyNydrRVt0uJ/gy12gq+31fumI+2k5uVWKSn0o5c0epJMet7v
         bYQcEOaZeumPpcKb7YjZMZ/qUv+mb4m1m0cXj50pv/tQI0s1pf0ZPKbrJGEwMDuwTfhV
         z/r6XgYJaCtoAJLJwftaPYLoEf6GQapLjuCiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363899; x=1725968699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywxkLKS4OQrjeJPdR5be+uTG0E4A2l8FWKHBAiJNfSk=;
        b=bY5k+icf3K6IhrSNc4/hgVAqL/HGM6zqQ/w8oC06bujkcZv/g9iYLXYs+usamaQvdg
         FZPePjCWLH4EAmq+j1wv+Rg1upcZNi6HDJwZmPlWrHX13Eh9Xgq9IumkxISkR7Bc8mCM
         G+WqGq1pbWR5rreR21++m43tDVyma9z8UdQG2ztzv68NTI6rdcf/OUN96xKZB2DVLseH
         SxlD5Dn00N/4UIuF59VUVNDTia1pumDj2NJJSnxg/D9TEnsgSaBWM+UAfKDtPzb1SaSu
         l9DEFjjw57n4mZ3SWQQx/OvoWC2gkSEONpVd/0+E6pkB7eD39Q1tD1EgNr9MuuFJLWlB
         ufDw==
X-Gm-Message-State: AOJu0Yzvf0I+rpejs9i9DRq6kpDXbTPp7fcRaXGZmoIhH8lpHgZJ/2uW
	Nj/7zB+CzGTv4E6uGD8Af1508IqVVJ5i4TKRWdx4xXvzYM2Mf0EiRgjY1gvxtLZLdVWtRyr+mjX
	j
X-Google-Smtp-Source: AGHT+IERLjPEde4s1TC3Y1UoSvFJPr2XI3MXcKG5jyeancfyrdT/00xpliBBtG8ubYwcCANDSgwUUw==
X-Received: by 2002:a05:6512:693:b0:533:407f:5cbd with SMTP id 2adb3069b0e04-53546b191ccmr10505037e87.7.1725363899053;
        Tue, 03 Sep 2024 04:44:59 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/3] ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo
Date: Tue,  3 Sep 2024 12:44:43 +0100
Message-Id: <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725363427.git.andrii.sultanov@cloud.com>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
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
---
 tools/ocaml/Makefile                          |   1 +
 tools/ocaml/libs/Makefile                     |   2 +-
 tools/ocaml/libs/xenstoredglue/META.in        |   4 +
 tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
 .../domain_getinfo_plugin_v1/META.in          |   5 +
 .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
 .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
 .../domain_getinfo_v1.ml                      |  36 ++++
 .../domain_getinfo_v1.mli                     |   0
 .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
 .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
 11 files changed, 367 insertions(+), 1 deletion(-)
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
index 0000000000..95818cdf83
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/Makefile
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
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstored_glue
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xenstored_glue META $(INTF) $(LIBS)
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstored_glue_dev
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xenstored_glue_dev META $(INTF) $(LIBS) *.ml *.mli
+
+.PHONY: uninstall
+uninstall: subdirs-uninstall
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstored_glue
+	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstored_glue_dev
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
index 0000000000..9c40026cab
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
@@ -0,0 +1,38 @@
+OCAML_TOPLEVEL=$(CURDIR)/../../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
+
+CFLAGS += -I $(OCAML_TOPLEVEL)/libs -I $(OCAML_TOPLEVEL)/libs/xenstoredglue
+CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
+OCAMLOPTFLAGS += -opaque
+OCAMLINCLUDE += -I ./ -I ../
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
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)/xenstored_glue/xenctrl_plugin
+	$(INSTALL_PROG) domain_getinfo_v1.cmxs $(DESTDIR)$(LIBEXEC_BIN)/xenstored_glue/xenctrl_plugin
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)/xenstored_glue/xenctrl_plugin/domain_getinfo_v1.cmxs
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
+
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
new file mode 100644
index 0000000000..69eddd6412
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
@@ -0,0 +1,172 @@
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
+#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
+#define MAX_FUNC_LINE_LEN 64
+#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __LINE__)
+
+/* This is a minimal stub to xenctrl for oxenstored's purposes
+   For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c */
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
+		const char* func,
+		unsigned int line)
+{
+	const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
+        char *str = NULL;
+	CAMLparam0();
+        CAMLlocal1(msg);
+
+#define ERR (error && error->code != XC_ERROR_NONE)
+
+        int ret = asprintf(&str,
+                           "%d: %s%s%s - called from %s:%u",
+                           ERR ? error->code : errno,
+                           ERR ? xc_error_code_to_desc(error->code) : strerror(errno),
+                           ERR ? ": " : "",
+                           ERR ? error->message : "",
+                           func, line);
+
+#undef ERR
+
+        if (!*str || (ret == -1))
+                caml_raise_out_of_memory();
+
+        msg = caml_copy_string(str);
+        free(str);
+
+        caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
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
+	if (!xch)
+		failwith_xc_v1(xch);
+
+	*(xc_interface **)Data_custom_val(result) = xch;
+
+	CAMLreturn(result);
+}
+
+static value xsglue_alloc_domaininfo_v1(const xc_domaininfo_t *info)
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
+	int ret, domid_c;
+
+	domid_c = Int_val(domid);
+	caml_enter_blocking_section();
+	ret = xc_domain_getinfo_single(xch, domid_c, &info);
+	caml_leave_blocking_section();
+
+	if (ret < 0)
+		failwith_xc_v1(xch);
+
+	result = xsglue_alloc_domaininfo_v1(&info);
+
+	CAMLreturn(result);
+}
+
+CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value first_domain)
+{
+	CAMLparam2(xch_val, first_domain);
+	CAMLlocal1(result);
+	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
+	xc_domaininfo_t *info;
+	int i, ret, toalloc, retval;
+	uint32_t num_domains;
+	uint32_t c_first_domain;
+
+	/* get the minimum number of allocate byte we need and bump it up to page boundary */
+	c_first_domain = Int_val(first_domain);
+	num_domains = DOMID_FIRST_RESERVED - c_first_domain;
+	toalloc = (sizeof(xc_domaininfo_t) * num_domains) | 0xfff;
+	ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);
+	if (ret)
+		caml_raise_out_of_memory();
+
+	caml_enter_blocking_section();
+	retval = xc_domain_getinfolist(xch, c_first_domain, num_domains, info);
+	caml_leave_blocking_section();
+
+	if (retval < 0) {
+		free(info);
+		failwith_xc_v1(xch);
+	} else if (retval > 0) {
+		result = caml_alloc(retval, 0);
+		for (i = 0; i < retval; i++) {
+			caml_modify(&Field(result, i), xsglue_alloc_domaininfo_v1(info + i));
+		}
+	} else {
+		result = Atom(0);
+	}
+
+	free(info);
+	CAMLreturn(result);
+}
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
new file mode 100644
index 0000000000..6f282e4257
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
@@ -0,0 +1,36 @@
+(** Minimal interface on top of unstable Xenctrl for Oxenstored's usage *)
+
+(** For the full Xenctrl interface, see: tools/ocaml/libs/xc/ *)
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
+  external interface_open : unit -> handle = "stub_xsglue_xc_interface_open"
+
+  external domain_getinfo : handle -> domid -> domaininfo
+    = "stub_xsglue_xc_domain_getinfo"
+
+  external domain_getinfolist : handle -> domid -> domaininfo array
+    = "stub_xsglue_xc_domain_getinfolist"
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
diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
new file mode 100644
index 0000000000..131b29d3ee
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
@@ -0,0 +1,28 @@
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
+  val domain_getinfolist : handle -> domid -> domaininfo array
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
diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
new file mode 100644
index 0000000000..d073a44d0f
--- /dev/null
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
@@ -0,0 +1,36 @@
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
+  val domain_getinfolist : handle -> domid -> domaininfo array
+end
+
+val register_logging_function : (string -> unit) -> unit
+val logging_function : (string -> unit) ref
+val register_plugin_v1 : (module Domain_getinfo_V1) -> unit
+val get_plugin_v1 : unit -> (module Domain_getinfo_V1)
-- 
2.39.2


