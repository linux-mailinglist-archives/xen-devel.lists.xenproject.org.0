Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DD7DE465
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 17:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626527.976824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDlr-0007HO-P2; Wed, 01 Nov 2023 16:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626527.976824; Wed, 01 Nov 2023 16:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDlr-0007Es-MA; Wed, 01 Nov 2023 16:08:43 +0000
Received: by outflank-mailman (input) for mailman id 626527;
 Wed, 01 Nov 2023 16:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyDlq-0007Em-6U
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 16:08:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8d28e1-78d0-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 17:08:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A5D01F74A;
 Wed,  1 Nov 2023 16:08:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB07713460;
 Wed,  1 Nov 2023 16:08:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w6H5NwZ4QmXoOAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 16:08:38 +0000
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
X-Inumbo-ID: eb8d28e1-78d0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698854919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cfrp59fBABW4y4QTV96sufw4PNIZfHEY3Moh4I0V28c=;
	b=Pyryrr+PXm98aWeB8ja7YwOdNfNVZCOoRW8MRhHqogx/9v9JpUHnQJPPqDaM9Ji+WbEnJv
	2FstA/IgIytZ/nm0KOUtdOLLgWXPDexGI3mOz21ecJbdBmzyvPNVgSuNXyzrXGetN/l8of
	9DbeUx5PJQELNO+yyZmhSHQgSUfxeos=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] stubdom: remove caml-stubdom
Date: Wed,  1 Nov 2023 17:08:37 +0100
Message-Id: <20231101160837.32241-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to build caml-stubdom, it must be explicitly enabled via
"configure --enable-caml-stubdom". The build process is failing due to
stubdom/ocaml.patch failing to apply. Since the patched file has been
modified in 2014 the last time, it seems nobody cares for caml-stubdom
since at least then.

Remove caml-stubdom from the build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile         | 51 ------------------------------------
 stubdom/caml/Makefile    | 24 -----------------
 stubdom/caml/hello.ml    |  4 ---
 stubdom/caml/main-caml.c | 42 ------------------------------
 stubdom/caml/minios.cfg  |  0
 stubdom/configure        | 56 ----------------------------------------
 stubdom/configure.ac     |  2 --
 stubdom/ocaml.patch      | 19 --------------
 8 files changed, 198 deletions(-)
 delete mode 100644 stubdom/caml/Makefile
 delete mode 100644 stubdom/caml/hello.ml
 delete mode 100644 stubdom/caml/main-caml.c
 delete mode 100644 stubdom/caml/minios.cfg
 delete mode 100644 stubdom/ocaml.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 0ddfce1ba2..27a18a9e33 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -257,37 +257,6 @@ $(TPMEMU_STAMPFILE): tpm_emulator-$(XEN_TARGET_ARCH) $(GMP_STAMPFILE)
 .PHONY: cross-tpmemu
 cross-tpmemu: $(TPMEMU_STAMPFILE)
 
-#############
-# Cross-ocaml
-#############
-
-CAMLLIB = $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/lib/ocaml
-OCAML_STAMPFILE=$(CAMLLIB)/.dirstamp
-
-ocaml-$(OCAML_VERSION).tar.gz:
-	$(FETCHER) $@ $(OCAML_URL)/$@
-
-ocaml-$(XEN_TARGET_ARCH)/.dirstamp: ocaml-$(OCAML_VERSION).tar.gz ocaml.patch
-	tar xzf $<
-	cd ocaml-$(OCAML_VERSION) && patch -p0 < ../ocaml.patch
-	rm -rf ocaml-$(XEN_TARGET_ARCH)
-	mv ocaml-$(OCAML_VERSION) ocaml-$(XEN_TARGET_ARCH)
-	touch $@
-
-MINIOS_HASNOT=IPV6 INET_ATON
-
-.PHONY: cross-ocaml
-cross-ocaml: $(OCAML_STAMPFILE)
-$(OCAML_STAMPFILE): ocaml-$(XEN_TARGET_ARCH)/.dirstamp
-	cd ocaml-$(XEN_TARGET_ARCH) &&  ./configure -prefix $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf \
-		-no-pthread -no-shared-libs -no-tk -no-curses \
-		-cc "$(CC) -U_FORTIFY_SOURCE -fno-stack-protector -mno-red-zone"
-	$(foreach i,$(MINIOS_HASNOT),sed -i 's,^\(#define HAS_$(i)\),//\1,' ocaml-$(XEN_TARGET_ARCH)/config/s.h ; )
-	$(MAKE) DESTDIR= -C ocaml-$(XEN_TARGET_ARCH) world
-	$(MAKE) DESTDIR= -C ocaml-$(XEN_TARGET_ARCH) opt
-	$(MAKE) -C ocaml-$(XEN_TARGET_ARCH) install
-	touch $@
-
 #######
 # Links
 #######
@@ -419,17 +388,6 @@ ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
 	    $(QEMU_ROOT)/xen-setup-stubdom )
 	$(MAKE) DESTDIR= -C ioemu -f $(QEMU_ROOT)/Makefile
 
-######
-# caml
-######
-
-caml-minios-config.mk: $(CURDIR)/caml/minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
-
-.PHONY: caml
-caml: $(CROSS_ROOT)
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat caml-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) OCAMLC_CROSS_PREFIX=$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/bin/
-
 ###
 # C
 ###
@@ -516,10 +474,6 @@ ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386
 ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
 
-.PHONY: caml-stubdom
-caml-stubdom: mini-os-$(XEN_TARGET_ARCH)-caml lwip-$(XEN_TARGET_ARCH) libxenguest cross-ocaml caml
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/caml/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(CURDIR)/caml/main-caml.o $(CURDIR)/caml/caml.o $(CAMLLIB)/libasmrun.a"
-
 .PHONY: c-stubdom
 c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
@@ -580,8 +534,6 @@ endif
 
 install-c: c-stubdom
 
-install-caml: caml-stubdom
-
 install-xenstore: xenstore-stubdom
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-xenstore/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/xenstore-stubdom.gz"
@@ -642,13 +594,11 @@ clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
 clean:
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
-	rm -fr mini-os-$(XEN_TARGET_ARCH)-caml
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstorepvh
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpm
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpmmgr
-	$(MAKE) DESTDIR= -C caml clean
 	$(MAKE) DESTDIR= -C c clean
 	$(MAKE) -C vtpm clean
 	$(MAKE) -C vtpmmgr clean
@@ -695,7 +645,6 @@ downloadclean: patchclean
 	rm -f pciutils-$(LIBPCI_VERSION).tar.bz2
 	rm -f grub-$(GRUB_VERSION).tar.gz
 	rm -f lwip-$(LWIP_VERSION).tar.gz
-	rm -f ocaml-$(OCAML_VERSION).tar.gz
 	rm -f polarssl-$(POLARSSL_VERSION)-gpl.tgz
 
 .PHONY: distclean
diff --git a/stubdom/caml/Makefile b/stubdom/caml/Makefile
deleted file mode 100644
index f550de1680..0000000000
--- a/stubdom/caml/Makefile
+++ /dev/null
@@ -1,24 +0,0 @@
-XEN_ROOT = $(CURDIR)/../..
-
-ifeq (,$(findstring clean,$(MAKECMDGOALS)))
-include $(XEN_ROOT)/Config.mk
-endif
-
-CAMLLIB = $(shell $(OCAMLC_CROSS_PREFIX)ocamlc -where)
-DEF_CPPFLAGS += -I$(CAMLLIB)
-
-OCAMLOPT=$(OCAMLC_CROSS_PREFIX)ocamlopt
-
-OBJS := hello.cmx
-LIBS := 
-
-all: main-caml.o caml.o
-
-%.cmx: %.ml
-	$(OCAMLOPT) -c $< -o $@
-
-caml.o: $(OBJS)
-	$(OCAMLOPT) $(LIBS) $^ -output-obj -o $@
-
-clean:
-	rm -f *.a *.o *.cmx *.cmi
diff --git a/stubdom/caml/hello.ml b/stubdom/caml/hello.ml
deleted file mode 100644
index 3a7181134a..0000000000
--- a/stubdom/caml/hello.ml
+++ /dev/null
@@ -1,4 +0,0 @@
-let main arg =
-  Printf.printf "Hello, world!\n%!."
-
-let _ = Callback.register "main" main
diff --git a/stubdom/caml/main-caml.c b/stubdom/caml/main-caml.c
deleted file mode 100644
index dd55aca38f..0000000000
--- a/stubdom/caml/main-caml.c
+++ /dev/null
@@ -1,42 +0,0 @@
-/*
- * Caml bootstrap
- *
- * Samuel Thibault <Samuel.Thibault@eu.citrix.net>, January 2008
- */
-
-#include <stdio.h>
-#include <errno.h>
-
-#include <caml/mlvalues.h>
-#include <caml/callback.h>
-#include <unistd.h>
-
-/* Ugly binary compatibility with Linux */
-FILE *_stderr asm("stderr");
-int *__errno_location;
-/* Will probably break everything, probably need to fetch from glibc */
-void *__ctype_b_loc;
-
-int main(int argc, char *argv[], char *envp[])
-{
-    value *val;
-
-    /* Get current thread's value */
-    _stderr = stderr;
-    __errno_location = &errno;
-
-    printf("starting caml\n");
-
-    /* Wait before things might hang up */
-    sleep(1);
-
-    caml_startup(argv);
-    val = caml_named_value("main");
-    if (!val) {
-        printf("Couldn't find Caml main");
-        return 1;
-    }
-    caml_callback(*val, Val_int(0));
-    printf("callback returned\n");
-    return 0;
-}
diff --git a/stubdom/caml/minios.cfg b/stubdom/caml/minios.cfg
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/stubdom/configure b/stubdom/configure
index 9a2226c3b7..6d41be91b6 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -600,8 +600,6 @@ POLARSSL_VERSION
 POLARSSL_URL
 GMP_VERSION
 GMP_URL
-OCAML_VERSION
-OCAML_URL
 GRUB_VERSION
 GRUB_URL
 LWIP_VERSION
@@ -633,7 +631,6 @@ debug
 xenstorepvh
 xenstore
 grub
-caml
 c
 host_os
 host_vendor
@@ -687,7 +684,6 @@ ac_user_opts='
 enable_option_checking
 enable_ioemu_stubdom
 enable_c_stubdom
-enable_caml_stubdom
 enable_pv_grub
 enable_xenstore_stubdom
 enable_xenstorepvh_stubdom
@@ -711,7 +707,6 @@ LIBPCI_URL
 NEWLIB_URL
 LWIP_URL
 GRUB_URL
-OCAML_URL
 GMP_URL
 POLARSSL_URL
 TPMEMU_URL'
@@ -1341,7 +1336,6 @@ Optional Features:
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
   --enable-ioemu-stubdom  Build and install ioemu-stubdom
   --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
-  --enable-caml-stubdom   Build and install caml-stubdom (default is DISABLED)
   --enable-pv-grub        Build and install pv-grub (default is DISABLED)
   --disable-xenstore-stubdom
                           Build and install xenstore-stubdom (default is
@@ -1371,7 +1365,6 @@ Some influential environment variables:
   NEWLIB_URL  Download url for newlib
   LWIP_URL    Download url for lwip
   GRUB_URL    Download url for grub
-  OCAML_URL   Download url for ocaml
   GMP_URL     Download url for libgmp
   POLARSSL_URL
               Download url for polarssl
@@ -2061,44 +2054,6 @@ fi
 
 
 
-# Check whether --enable-caml-stubdom was given.
-if test "${enable_caml_stubdom+set}" = set; then :
-  enableval=$enable_caml_stubdom;
-
-if test "x$enableval" = "xyes"; then :
-
-
-caml=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS caml"
-STUBDOM_BUILD="$STUBDOM_BUILD caml-stubdom"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-caml"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-caml"
-
-
-else
-
-if test "x$enableval" = "xno"; then :
-
-
-caml=n
-
-
-fi
-
-fi
-
-
-else
-
-
-caml=n
-
-
-fi
-
-
-
-
 # Check whether --enable-pv-grub was given.
 if test "${enable_pv_grub+set}" = set; then :
   enableval=$enable_pv_grub;
@@ -3600,17 +3555,6 @@ GRUB_VERSION="0.97"
 
 
 
-if test "x$OCAML_URL" = "x"; then :
-
-	OCAML_URL="https://caml.inria.fr/pub/distrib/ocaml-4.02"
-
-fi
-OCAML_VERSION="4.02.0"
-
-
-
-
-
 if test "x$GMP_URL" = "x"; then :
 
 	if test "x$extfiles" = "xy"; then :
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index 471e371e14..fc736c0387 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -20,7 +20,6 @@ m4_include([../m4/fetcher.m4])
 # Enable/disable stub domains
 AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
 AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
-AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
 AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
 AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
@@ -60,7 +59,6 @@ AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub
 AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
 AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
-AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
 AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
 AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4])
 AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4])
diff --git a/stubdom/ocaml.patch b/stubdom/ocaml.patch
deleted file mode 100644
index 50db4869dd..0000000000
--- a/stubdom/ocaml.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- byterun/Makefile.orig	2009-04-07 12:14:02.000000000 +0100
-+++ byterun/Makefile	2009-04-07 12:13:50.000000000 +0100
-@@ -22,14 +22,14 @@
- DOBJS=$(OBJS:.o=.d.o) instrtrace.d.o
- PICOBJS=$(OBJS:.o=.pic.o)
- 
--#ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
-+ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
- 
- all:: libcamlrun_shared.so
- 
- install::
- 	cp libcamlrun_shared.so $(LIBDIR)/libcamlrun_shared.so
- 
--#endif
-+endif
- 
- ocamlrun$(EXE): libcamlrun.a prims.o
- 	$(MKEXE) $(BYTECCLINKOPTS) -o ocamlrun$(EXE) \
-- 
2.35.3


