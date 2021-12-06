Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B156A46A268
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239523.415437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTl-0004hJ-Uz; Mon, 06 Dec 2021 17:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239523.415437; Mon, 06 Dec 2021 17:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTl-0004cr-Ic; Mon, 06 Dec 2021 17:08:41 +0000
Received: by outflank-mailman (input) for mailman id 239523;
 Mon, 06 Dec 2021 17:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHQI-0005ti-Sw
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:05:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7d97e8c-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:05:05 +0100 (CET)
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
X-Inumbo-ID: a7d97e8c-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMeuk4EyZtrq5dKLGLHEQrPw6+SmC/P2I22RLaT9xR0=;
  b=KG4g3iqiEiPHqkIZjm0b9afwU6Xl3XHjC3EGNhDrfGxo089cQzf3v2nj
   JiLI9FfkLY1nBgR5lKksl3I3UkfNt7RSxkVtIYyTlwWdXTJ5LMnWLFtsf
   Mtwyqd2CPZHNwdOs633aRf1t3Qfir7SMmT4uhmh9NkXYZNAGrV6sfZHor
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cZS7i5NppI0ZKBWbjhuZdXUvxBO/n20vAk5qiRBhcoYZGSRAFnU8YMVx7THk7K+kyvTv8nQzUJ
 YmhYF7xk3sUjKNWkf4a0ja6nQPm3CaLTBoZhXCVABD4XPuoeSwz5sZtZEUyB/XLQ7QmPC0s86K
 wWYG66gocSEaWB+rm7xD+Xnt33ofQKWP3pDGrf18eR2FMhmejZQn7vFben4y4E0t9SgQoPxWsD
 iL+OgYvGJZfykaRZIXzcTSIT/cJcf71YHxmWDFmJE/36YpxYg+KuZkgq4En2qtpVOZu9toliJi
 XWPfPJ0R/3KSfKo1UYOGLYry
X-SBRS: 5.1
X-MesageID: 59324170
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g6ctca702jhmC5dxa2011gxRtL/AchMFZxGqfqrLsTDasY5as4F+v
 jYcCDiCP62Iamf3fIx2bdix/EgGvcCAyYNlGwZtri80Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 cUQioGpcC4TboaLiM4DDxtoQjFmMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTK2EO
 5NGMVKDajzMcRpMfWkQAqllt8C2nVfCb3oArQia8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13/wBwwXMJqDyTuP+2+omsfCmzi+XJMVEvu/7PECqFyMxEQDBRsOT1y5rPKlzEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmEzLbU5ACIQHAJVDdbZPQpscY3QXoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTSIUEDQY+uDKmtEYyQLlUIphIP+lltKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7AFgHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGwnTKuKGpxdEdMMX
 KM1kVkLjHO0FCH1BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzyxhzy/BiY
 83FLpbE4ZMm5UJPlmDeqwA1i+BD+8zD7TmLGcCTI+qPj9Jym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid54043bQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiNio+NeixBMkn9hrW/0UEZD6V5pTqWq73hI93Snf9VeB5nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:k09PNqk6F+yEXIqagw+YTEKu2FnpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324170"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH 53/57] stubdom: introduce xenlibs.mk
Date: Mon, 6 Dec 2021 17:02:36 +0000
Message-ID: <20211206170241.13165-54-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This new makefile will be used to build libraries that provides
"Makefile.common".

At some point, we will be converting Makefile in tools/ to "subdirmk"
and stubdom build will not be able to use those new makefiles, so we
will put the necessary information for stubdom to build the xen
libraries into a new Makefile.common and xenlibs.mk will use it.
We only need to build static libraries and don't need anything else.

The check for the presence of "Makefile.common" will go aways once
there is one for all libraries used by stubdom build.

Also remove DESTDIR= from "clean" targets, we don't do installation in
this recipe so the value of DESTDIR doesn't matter.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 stubdom/xenlibs.mk | 13 +++++++++++++
 stubdom/Makefile   |  9 +++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 stubdom/xenlibs.mk

diff --git a/stubdom/xenlibs.mk b/stubdom/xenlibs.mk
new file mode 100644
index 0000000000..5c8742ccf9
--- /dev/null
+++ b/stubdom/xenlibs.mk
@@ -0,0 +1,13 @@
+include $(XEN_ROOT)/tools/Rules.mk
+
+include Makefile.common
+
+LIBNAME := $(notdir $(CURDIR))
+FILENAME_$(LIBNAME) ?= xen$(LIBNAME)
+LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
+
+lib$(LIB_FILE_NAME).a: $(OBJS-y)
+	$(AR) rc $@ $^
+
+clean::
+	rm -f $(OBJS-y) lib$(LIB_FILE_NAME).a
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 5fb5dbc341..fba4c977ef 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -346,6 +346,7 @@ define do_links
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
   ln -sf $(dir $<)*.[ch] .; \
+  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
   ln -sf $(dir $<)Makefile .
   touch $@
 endef
@@ -355,10 +356,14 @@ define BUILD_lib
  libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
-	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -C $$(@D) $$(@F)
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
 
  clean-libxen$(1):
-	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
+	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
+	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
+	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
+	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
+	fi
 
  libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile
 	$$(do_links)
-- 
Anthony PERARD


