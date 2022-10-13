Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295ED5FD9D3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422023.667842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu5-0002u0-3c; Thu, 13 Oct 2022 13:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422023.667842; Thu, 13 Oct 2022 13:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu4-0002nt-Tu; Thu, 13 Oct 2022 13:05:36 +0000
Received: by outflank-mailman (input) for mailman id 422023;
 Thu, 13 Oct 2022 13:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu2-0002ig-Rg
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7dd6bdc-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:33 +0200 (CEST)
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
X-Inumbo-ID: b7dd6bdc-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWgKKsGpMO0s5/MpdnydWA9yplEqj5PrJ/SuQ+hxLac=;
  b=IbDVdYonQ1rY086uNpaZFRLbchMY59nKYzA0B0/bmIVcyUla2H4rVXt1
   JZNpz4+cV6jl0Ir200+sE5JktsFzVGx19vwrJualU1vMEmP+22KTUH3KC
   JWT9ute2duXzM/KIO7l1V5qjpNLTER0NZCJX3Y2REbmqpQR4gTaSQkpK0
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83071509
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fniIGqq1F94H0HWV26B5WFdV/DxeBmJyZRIvgKrLsJaIsI4StFCzt
 garIBmPaP6NYWL3eIp1YNyxoUsE7MPcndFjTgBtpC5jH3kRoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgS5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 +xIEQofYyG5heON6r+bEsBnu/YMFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0FxR7H/
 z+ergwVBDkjE4C74jWO3EiwuerOsTPiBaMKH5uno6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BIyw/iYeHREOn9Lavhz6SYQEeEF0tXHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOv0jxpmGGeG6bKKI3XG32XFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzvVppylfC4S4u8DJg4i+aihbAoLWe6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHMiT8vhS+eDBDJJjYetabQDmgyFQxP/snTg5B
 P4Ga5vXlEQBDrejCsQVmKZKRW03wbEALcieg6RqmiSreWKKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:qMlW6a0MORSMniSv4TZrTQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="83071509"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 06/17] tools/hotplug: Generate "hotplugpath.sh" with configure
Date: Thu, 13 Oct 2022 14:05:02 +0100
Message-ID: <20221013130513.52440-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/configure.ac                     |  1 +
 tools/hotplug/common/Makefile          | 10 ++--------
 tools/configure                        |  3 ++-
 tools/hotplug/common/hotplugpath.sh.in | 16 ++++++++++++++++
 4 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 tools/hotplug/common/hotplugpath.sh.in

diff --git a/tools/configure.ac b/tools/configure.ac
index 09059bc569..18e481d77e 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -7,6 +7,7 @@ AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
 AC_CONFIG_SRCDIR([libs/light/libxl.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
+hotplug/common/hotplugpath.sh
 hotplug/FreeBSD/rc.d/xencommons
 hotplug/FreeBSD/rc.d/xendriverdomain
 hotplug/Linux/init.d/sysconfig.xencommons
diff --git a/tools/hotplug/common/Makefile b/tools/hotplug/common/Makefile
index e8a8dbea6c..62afe1019e 100644
--- a/tools/hotplug/common/Makefile
+++ b/tools/hotplug/common/Makefile
@@ -1,19 +1,14 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-HOTPLUGPATH := hotplugpath.sh
-
 # OS-independent hotplug scripts go in this directory
 
 # Xen scripts to go there.
 XEN_SCRIPTS :=
-XEN_SCRIPT_DATA := $(HOTPLUGPATH)
-
-genpath-target = $(call buildmakevars2file,$(HOTPLUGPATH))
-$(eval $(genpath-target))
+XEN_SCRIPT_DATA := hotplugpath.sh
 
 .PHONY: all
-all: $(HOTPLUGPATH)
+all:
 
 .PHONY: install
 install: install-scripts
@@ -40,7 +35,6 @@ uninstall-scripts:
 
 .PHONY: clean
 clean:
-	rm -f $(HOTPLUGPATH)
 
 .PHONY: distclean
 distclean: clean
diff --git a/tools/configure b/tools/configure
index acd9a04c3b..6199823f5a 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2456,7 +2456,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10947,6 +10947,7 @@ for ac_config_target in $ac_config_targets
 do
   case $ac_config_target in
     "../config/Tools.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools.mk" ;;
+    "hotplug/common/hotplugpath.sh") CONFIG_FILES="$CONFIG_FILES hotplug/common/hotplugpath.sh" ;;
     "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
     "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
     "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
diff --git a/tools/hotplug/common/hotplugpath.sh.in b/tools/hotplug/common/hotplugpath.sh.in
new file mode 100644
index 0000000000..1036b884b8
--- /dev/null
+++ b/tools/hotplug/common/hotplugpath.sh.in
@@ -0,0 +1,16 @@
+sbindir="@sbindir@"
+bindir="@bindir@"
+LIBEXEC="@LIBEXEC@"
+LIBEXEC_BIN="@LIBEXEC_BIN@"
+libdir="@libdir@"
+SHAREDIR="@SHAREDIR@"
+XENFIRMWAREDIR="@XENFIRMWAREDIR@"
+XEN_CONFIG_DIR="@XEN_CONFIG_DIR@"
+XEN_SCRIPT_DIR="@XEN_SCRIPT_DIR@"
+XEN_LOCK_DIR="@XEN_LOCK_DIR@"
+XEN_RUN_DIR="@XEN_RUN_DIR@"
+XEN_PAGING_DIR="@XEN_PAGING_DIR@"
+XEN_DUMP_DIR="@XEN_DUMP_DIR@"
+XEN_LOG_DIR="@XEN_LOG_DIR@"
+XEN_LIB_DIR="@XEN_LIB_DIR@"
+XEN_RUN_STORED="@XEN_RUN_STORED@"
-- 
Anthony PERARD


