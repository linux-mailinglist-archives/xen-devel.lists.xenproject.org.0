Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414874AD58E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268041.461822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNuq-0007LK-Ez; Tue, 08 Feb 2022 10:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268041.461822; Tue, 08 Feb 2022 10:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNuq-0007JI-B9; Tue, 08 Feb 2022 10:40:08 +0000
Received: by outflank-mailman (input) for mailman id 268041;
 Tue, 08 Feb 2022 10:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHNup-0007HH-IQ
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:40:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 797fb503-88cb-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:40:05 +0100 (CET)
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
X-Inumbo-ID: 797fb503-88cb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644316805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o6LAi5k9kIMQVtfQ1ANsXvEZoGV9yoKiE2aDjv2j9KU=;
  b=REVs6jniHoOg5KSnNYj/Ntm8pLXLL1XVtsPGiFBEz8snVunDkwO5Rpuk
   HXQUvhldi7/vL4KS4wZpuJbIivt9oczHTYg0jFbA56wNb6Mqdy9rhXzng
   JLrkeontxKtdlU7PtpvdHqBAAZzjMo7gtHnUB5MwyEpH3bvEl+8Qjsi6Y
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zN4BILz64xqwJE1HWzpP432ysx6wKH1U4VdAuhDrwiWcuC5u88DdhPuJUiYERDBo1o97L+RN7i
 lzI7A6bv0VaPu7WcG5qHiZ9aX+Q3xNclQw9Ti2sDJU0BG6so4t5Sk7wvSyCn4t1qttpMC+gIN9
 wdB8E0c+XuGO8ScpnzDpbkqZhmA3kYqdTN4ZYASwVKfaCWDK9iC/KqbtRyUiY18LpT6gFp9FCq
 MKBO4TbvlylyPcsj5gCZalVuL1B4rVLJ5KFMnxXjBrfeAsE5/9fomIzEJ/hgqu18d4fWuQax7R
 tJSRLYkMRKipXt5ETU1iAkAG
X-SBRS: 5.1
X-MesageID: 63719882
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dpkNI6wcrHtkYsC1+KR6t+fxwSrEfRIJ4+MujC+fZmUNrF6WrkUAz
 jMWDTuDbv/cZTekKdl+aI6/o0gA65DUmIQwSwA/qiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9pa7
 Y5q5ZaicDUCOYz+qsgzciIANAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JsRRKeON
 5BxhTxHYk3MWgNTBk4sC6k+lre3lkTZXzpztwfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCstDU5AP0AGf8D2iqK65jmzyi4PTAjZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjxoi/6JN4BumglTKuMDirjUWW4C
 HI/RCsLvMMDVJdURfMfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgWmziJLbillEvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQk0oGC7ClMnCMmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN0tfdnuEsfZJLhaNQmrua9
 32xQBYAmlH+mWfGOUOBbXU6MOHjWpN2rHQaOy0wPAn3hyh/MNj3tKpPJYEqebQH9fB4yaImR
 fcyZMjdUO9ETS7K+mpBYMCl/pBibhmimSmHIzGhPGokZ5dlSgGQoo3kcwLj+TMgFC2yscdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T816ZlLdsNJBPPwiqh+
 zyXWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OhYk6P8PfkAkAoYuoZwCe82n6c35t+prL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVdVgsYem03P0JniXfsKYuK0Lg6S4rpLeKXC2+5fVXZPCx+FetDL4Y/
 A==
IronPort-HdrOrdr: A9a23:+zRYAaxIAKv2HtVrVGa7KrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63719882"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH] tools/libs: Fix build dependencies
Date: Tue, 8 Feb 2022 10:39:59 +0000
Message-ID: <20220208103959.21102-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Some libs' Makefile aren't loading the dependencies files *.d2.

We can load them from "libs.mk" as none of the Makefile here are
changing $(DEPS) or $(DEPS_INCLUDE) so it is fine to move the
"include" to "libs.mk".

As a little improvement, don't load the dependencies files (and thus
avoid regenerating the *.d2 files) during `make clean`.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/ctrl/Makefile  | 2 --
 tools/libs/guest/Makefile | 2 --
 tools/libs/light/Makefile | 2 --
 tools/libs/stat/Makefile  | 2 --
 tools/libs/store/Makefile | 2 --
 tools/libs/util/Makefile  | 2 --
 tools/libs/vchan/Makefile | 1 -
 tools/libs/libs.mk        | 4 ++++
 8 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 5d866b8d04..ef7362327f 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -54,8 +54,6 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
--include $(DEPS_INCLUDE)
-
 clean: cleanlocal
 
 .PHONY: cleanlocal
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 8f5f3acd21..7f74ac0e7d 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -106,8 +106,6 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
 libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
 
--include $(DEPS_INCLUDE)
-
 .PHONY: cleanlocal
 cleanlocal:
 	rm -f libxenguest.map
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index be32d95d39..35685ab7ee 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -268,5 +268,3 @@ cleanlocal:
 	$(RM) -f libxenlight.map
 	$(RM) -f $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
-
--include $(DEPS_INCLUDE)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 01417b5334..5840213376 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -121,5 +121,3 @@ clean: cleanlocal
 cleanlocal:
 	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM)
 	rm -f libxenstat.map
-
--include $(DEPS_INCLUDE)
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index c208dbb48a..8e33db6a66 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -29,8 +29,6 @@ ifeq ($(CONFIG_Linux),y)
 xs.opic: CFLAGS += -DUSE_DLSYM
 endif
 
--include $(DEPS_INCLUDE)
-
 .PHONY: install
 install: install-headers
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 87425d862a..72fecb4c49 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -49,8 +49,6 @@ $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS)
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
 
--include $(DEPS_INCLUDE)
-
 clean: cleanlocal
 
 .PHONY: cleanlocal
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index df112f1b88..83a45d2817 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -11,7 +11,6 @@ SRCS-y += io.c
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
--include $(DEPS_INCLUDE)
 
 clean: cleanlocal
 
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 847eb4851f..b3d784c57f 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -132,3 +132,7 @@ clean:
 
 .PHONY: distclean
 distclean: clean
+
+ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
+-include $(DEPS_INCLUDE)
+endif
-- 
Anthony PERARD


