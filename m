Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF95854C9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377694.611044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBx-0000EZ-BB; Fri, 29 Jul 2022 17:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377694.611044; Fri, 29 Jul 2022 17:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBx-0000Ad-2n; Fri, 29 Jul 2022 17:54:29 +0000
Received: by outflank-mailman (input) for mailman id 377694;
 Fri, 29 Jul 2022 17:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBu-0006Zx-VN
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac7730c-0f67-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 19:54:25 +0200 (CEST)
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
X-Inumbo-ID: 7ac7730c-0f67-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFznG8baVkBRD0RFiw68lK6To7/I2LLnkXE/qkikiGI=;
  b=IbLSyBHZFq/3deZHRCWu+D5aONwlTXaGAPXLRFraEJTBi5P8JZ1hFW9+
   VGww3rEStcdTrUOKa5R0yWsxF7JjOxIJopjPIn14V6pZfKa75L4wpeyJ/
   mIFAdQ9mxKtQpVzJMuWmGwZV0/HbzKRXTHQnlChXyeHQRbkXoyR32DmYh
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79518995
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:esanYaOzg4HxfsnvrR2Bl8FynXyQoLVcMsEvi/4bfWQNrUoq0TJTn
 DBNCDuOM/mPMzT0e4hybYS0/BgGvJ/Sm4JnTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMtPjS8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPH//RTMGMJPbER/8BlIkNB9
 uQmLBASO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJiYArBZVtTPU0QC7o1nfuyh2m5eDpdwL6QjfVmvjGDnV0suFTrGIXNVuK4WeBcpAWdn
 F7p4FbbWio0LsPKnFJp9Vrz37SSzEsXQrk6FqC89/NsqE2ewCoUEhJ+fUS/iem0jAi5Qd03A
 0Ad5CcGt6U5802vCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7pvIK6pmZwlD7ijeKtLvrQQ0t2AH3QTfwhu9mX7JJd7BE+HCCs6sRdNvIEwHQ1
 JQXs5PAtb5TVPlhgATIGbxQR+/xup5pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgKrrUqzGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 MbDKp33XSpFU/sPIN+KqwA1iOVD+8zD7TmLGcCTI+qPitJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbSmCgGKoNF7ELz/BSJkbXwAg5AIK7Xrz8sPMD1JNsI9Npt7J9U8z/wOyrqgE
 7PUchYw9WcTTEbvcW2iAk2PopuzNXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:ID6w9KvvymmH4rJE/dy/2VOu7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="79518995"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 4/7] tools/ocaml: Makefile to drive dune
Date: Fri, 29 Jul 2022 18:53:27 +0100
Message-ID: <322ec0c9af480e9b8a6246d0a2cdb4e308a5900c.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

create a separate Makefile that can be used to drive dune.

Usage:
`make -f Makefile.dune`

There are some files that need to be created by the Makefile based
build system (such as all the C code in $(XEN_ROOT)/tools/libs),
and those need to exist before dune runs.

Although it'd be possible to automatically call the necessary makefile
rules from dune, it wouldn't work reliably:
* dune uses sandboxing by default (only files declared or known as
  dependencies are visible to individual build commands,
  symlinks/hardlinks are used by dune to implement this)
* the dune builds always run in a _build subdir, and calling the
  makefiles from there would get the wrong XEN_ROOT set
* running the make command in the source tree would work, but dune still
  wouldn't immediately see the build dependencies since they wouldn't
  have been copied/linked under _build

The approach here is to:
* use the Makefile to build C-only prerequisites (i.e. most of Xen)
* use Dune only to build the OCaml parts once the C prerequisites exist
* dune has dependencies declared on the C bits, so if they are missing
  you will get an error about a missing rule to create them instead of a
  cryptic compilation error
* dune is still optional - the old Makefile based buildsystem is still
  there for now
* use dune exclusively for new code going forward (e.g. OCaml test-suites)

The workspace file needs to be generated by make because this currently
cannot be generated by dune, and it doesn't support including external
files. But could be generated by configure?

LD_LIBRARY_PATH needs to be set, because even with -Wl,-rpath
executables wouldn't be able to run using the just-built libraries,
unless we'd also link all the transitive dependencies of libs.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 Makefile                          |  5 ++
 tools/ocaml/Makefile.dune         | 88 +++++++++++++++++++++++++++++++
 tools/ocaml/dune-workspace.dev.in |  2 +
 tools/ocaml/dune-workspace.in     | 18 +++++++
 4 files changed, 113 insertions(+)
 create mode 100644 tools/ocaml/Makefile.dune
 create mode 100644 tools/ocaml/dune-workspace.dev.in
 create mode 100644 tools/ocaml/dune-workspace.in

diff --git a/Makefile b/Makefile
index b93b22c752..ddb33c3555 100644
--- a/Makefile
+++ b/Makefile
@@ -68,6 +68,11 @@ build-tools-oxenstored: build-tools-public-headers
 	$(MAKE) -s -C tools/libs
 	$(MAKE) -C tools/ocaml build-tools-oxenstored
 
+.PHONY: build-tools-oxenstored-prepare
+build-tools-oxenstored-prepare: build-tools-public-headers
+	test -f tools/config.status || (cd tools && ./configure --with-xenstored=oxenstored)
+	$(MAKE) -C tools/libs V=
+
 .PHONY: build-stubdom
 build-stubdom: mini-os-dir build-tools-public-headers
 	$(MAKE) -C stubdom build
diff --git a/tools/ocaml/Makefile.dune b/tools/ocaml/Makefile.dune
new file mode 100644
index 0000000000..eca9cac0ca
--- /dev/null
+++ b/tools/ocaml/Makefile.dune
@@ -0,0 +1,88 @@
+XEN_ROOT = $(CURDIR)/../..
+all: dune-all-check
+
+# Dune by default uses all available CPUs. Make doesn't.
+# Query the available CPUs and use all available for any of the make rules we call out to.
+# -O is also needed with parallel make such that the build error and the build command causing
+#  the error are close together and not interspersed with other output
+NPROC=$(shell getconf _NPROCESSORS_ONLN)
+MAKEN=$(MAKE) -j$(NPROC) -O
+
+# We want to link and use the Xen libraries built locally
+# without installing them system-wide
+# (the system-wide one installed from packages will likely be too old and not match the locally
+# built one anyway).
+#
+# Set LIBRARY_PATH and LD_LIBRARY_PATH so that the linker
+# finds the proper libraries and the various dune commands
+# work (e.g. running tests, utop, etc.).
+#
+# The Makefile based buildsystem would use -Wl,-rpath-link= here,
+# but that only works during linking, not runtime.
+# There is a -Wl, -rpath= that can be used, but that only works
+# for libraries linked directly to the main executable:
+# the dependencies of those libraries won't get found on the rpath
+# (the rpath of the executable is apparently not used during that search).
+#
+# Use environment variables, because that way we don't make any permanent alternations (rpath)
+# to the executable, so once installed system-wide it won't refer to build paths anymore.
+#
+# Dune cannot be used to generate this file: the env-vars stanza doesn't support %{read:}, :include,
+# and dune-workspace doesn't support (include) stanzas.
+# So for now generate it from this Makefile
+# Cannot start with comment, so add auto-generated comment at the end
+LIB_DIRS=$(abspath $(wildcard ../libs/*/.))
+LIBRARY_PATH=$(subst $(eval) ,:,$(LIB_DIRS))
+../dune-workspace ../dune-workspace.dev: dune-workspace.in dune-workspace.dev.in Makefile.dune
+	@( sed -e "s|@LIBRARY_PATH@|$(LIBRARY_PATH)|" <$< \
+	&& echo "; DO NOT EDIT: autogenerated from ocaml/dune-workspace.in") >../dune-workspace
+	@cat ../dune-workspace dune-workspace.dev.in >../dune-workspace.dev
+
+# for location of various libs which moves between Xen versions
+include $(XEN_ROOT)/tools/Rules.mk
+
+XEN_DEPS=$(XEN_libxenctrl)/libxenctrl.so
+XEN_DEPS+=$(XEN_libxenevtchn)/libxenevtchn.so
+XEN_DEPS+=$(XEN_libxenguest)/libxenguest.so
+
+# Cannot be generated from dune
+# Tell the user how to generate them
+../include/xen/xen.h ../config.status $(XEN_DEPS):
+	echo "Missing C headers or libraries" >&2
+	echo "Run make -C $(XEN_ROOT) build-tools-oxenstored-prepare -j$$(nproc)" >&2
+	exit 1
+
+# dune would refuse to run if there are build artifacts in the source directory
+# if we detect anything then run make clean to ensure these are removed
+# don't always call 'make clean' because it takes ~1.6s
+.PHONY: dune-pre
+dune-pre: ../config.status | ../include/xen/xen.h ../dune-workspace $(XEN_DEPS)
+	$(MAKEN) clean -s
+
+# Convenience targets
+dune-syntax-check: dune-pre
+	dune build @check
+
+dune-all-check: dune-pre ../dune-workspace.dev
+	# Test build with multiple compiler versions
+	# requires opam switches for each to be already installed
+	dune build --workspace=../dune-workspace.dev @check @install @runtest
+
+check: dune-pre
+	dune runtest --no-buffer
+
+# approximatively equivalent to Dune 3.0 --release mode
+dune-oxenstored: dune-pre
+	dune build --root .. --ignore-promoted-rules --no-config \
+           --profile release --always-show-command-line \
+           --promote-install-files --default-target @install
+
+-include $(XEN_ROOT)/config/Paths.mk
+
+# skip doc, it'd install an extra LICENSE file that is already installed by other rules
+INSTALL_SECTIONS=bin,etc,lib,sbin
+dune-install: dune-oxenstored
+	dune install --destdir=$(DESTDIR) --prefix=$(prefix) --libdir=$(shell ocamlfind printconf destdir) --mandir=$(mandir) --etcdir=$(sysconfdir) --docdir=$(docdir) --sections=$(INSTALL_SECTIONS)
+
+dune-uninstall: dune-oxenstored
+	dune uninstall --destdir=$(DESTDIR) --prefix=$(prefix) --libdir=$(shell ocamlfind printconf destdir) --mandir=$(mandir) --etcdir=$(sysconfdir) --docdir=$(docdir)
diff --git a/tools/ocaml/dune-workspace.dev.in b/tools/ocaml/dune-workspace.dev.in
new file mode 100644
index 0000000000..2ca831a048
--- /dev/null
+++ b/tools/ocaml/dune-workspace.dev.in
@@ -0,0 +1,2 @@
+(context default)
+(context (opam (switch 4.02.3) (profile release)))
diff --git a/tools/ocaml/dune-workspace.in b/tools/ocaml/dune-workspace.in
new file mode 100644
index 0000000000..c963a6e599
--- /dev/null
+++ b/tools/ocaml/dune-workspace.in
@@ -0,0 +1,18 @@
+(lang dune 2.1)
+
+(env
+  ; we need to support older compilers so don't make deprecation warnings fatal
+ (dev
+  (flags (:standard -w -3))
+   (env-vars
+    (LD_LIBRARY_PATH @LIBRARY_PATH@)
+    (LIBRARY_PATH @LIBRARY_PATH@)
+   ))
+ (release
+  (env-vars
+   (OCAMLRUNPARAM b)
+    (LD_LIBRARY_PATH @LIBRARY_PATH@)
+    (LIBRARY_PATH @LIBRARY_PATH@)
+  )
+  (flags (:standard -strict-sequence -strict-formats -principal -w @18))
+  (ocamlopt_flags -nodynlink)))
-- 
2.34.1


