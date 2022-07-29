Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048165854C7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377686.610977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBf-0006bt-1o; Fri, 29 Jul 2022 17:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377686.610977; Fri, 29 Jul 2022 17:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBe-0006a3-VK; Fri, 29 Jul 2022 17:54:10 +0000
Received: by outflank-mailman (input) for mailman id 377686;
 Fri, 29 Jul 2022 17:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBd-0006Zx-8z
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f4ca0d9-0f67-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 19:54:07 +0200 (CEST)
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
X-Inumbo-ID: 6f4ca0d9-0f67-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0XhqZ8NRblIeCreSrfdQ9yayvs4XLb4vL2XM9dKH9MI=;
  b=Olub0/TxHoeGYkwVPs1gUqmyLYbi0fhmOLAxAFjNVndFxAbpTMIz3vMB
   ShbMT33OF7024qTLsXL4WxJlni8CE/i+ZtD0l7rapqwwUHx9WWk2aL4i/
   gHl8zoSbUbD+LMFXDLhEKE4OB445VHpKfENz+we7uSmoD0zTzp/t2uOor
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77388856
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HU0/CKv9tOJ6MyKo8h3FoJZFJefnVDVeMUV32f8akzHdYApBsoF/q
 tZmKTrQa/zZa2rxKIwkatvi8EtV7JOEz4NjTlFurHwwES0W+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyt4mJA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaFB1qEqInNFz
 OQdDRsAS0m9p9u9663uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLElobFpM42vuvnH78WzZZtEiUtew85G27IAlZj+e2YIqFJ4LiqcN9nkGWu
 UvcxVvAWU8/C/ub2R2g4FOyibqa9c/8cN1LT+DpnhJwu3Wfz3IeIAcbXly6pb++kEHWc81bA
 1wZ/Gwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ZSuxseq3vziLIS0wBmInPBEkdAAu/Iy2yG0stS4jXuqPAYbs0ICkQWyhn
 mjbxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5FIJv8QIbCf1N/Afj2eN5yMClPKIKDgYfqqMMoomjmZZL2drAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL89AgOBD+8zL7TmMLXwN50j4jOH2ib/8YettDWZimchjsPrd8F2Or
 4s32gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:03lGSq84duHOqchc7HRuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="77388856"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v1 2/7] tools/ocaml/*/Makefile: generate paths.ml from configure
Date: Fri, 29 Jul 2022 18:53:25 +0100
Message-ID: <0752fe6eaa26f244f6fb45b1c3c6b9906deb2aa9.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

paths.ml contains various paths known to configure,
and currently is generated via a Makefile rule.
Simplify this and generate it through configure, similar to how
oxenstored.conf is generated from oxenstored.conf.in.

This will allow to reuse the generated file more easily with Dune.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/configure                   | 4 +++-
 tools/configure.ac                | 2 ++
 tools/ocaml/libs/xs/Makefile      | 5 -----
 tools/ocaml/libs/xs/paths.ml.in   | 1 +
 tools/ocaml/xenstored/Makefile    | 5 -----
 tools/ocaml/xenstored/paths.ml.in | 4 ++++
 6 files changed, 10 insertions(+), 11 deletions(-)
 create mode 100644 tools/ocaml/libs/xs/paths.ml.in
 create mode 100644 tools/ocaml/xenstored/paths.ml.in

diff --git a/tools/configure b/tools/configure
index a052c186a5..41deb7fb96 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2453,7 +2453,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10935,6 +10935,8 @@ do
     "hotplug/Linux/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xendomains" ;;
     "hotplug/NetBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xencommons" ;;
     "hotplug/NetBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xendriverdomain" ;;
+    "ocaml/libs/xs/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/libs/xs/paths.ml" ;;
+    "ocaml/xenstored/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/paths.ml" ;;
     "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
     "config.h") CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
     "hotplug/Linux/systemd/proc-xen.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/proc-xen.mount" ;;
diff --git a/tools/configure.ac b/tools/configure.ac
index 1094d896fc..32cbe6bd3c 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -21,6 +21,8 @@ hotplug/Linux/xen-hotplug-common.sh
 hotplug/Linux/xendomains
 hotplug/NetBSD/rc.d/xencommons
 hotplug/NetBSD/rc.d/xendriverdomain
+ocaml/libs/xs/paths.ml
+ocaml/xenstored/paths.ml
 ocaml/xenstored/oxenstored.conf
 ])
 AC_CONFIG_HEADERS([config.h])
diff --git a/tools/ocaml/libs/xs/Makefile b/tools/ocaml/libs/xs/Makefile
index e934bbb550..e160e6a711 100644
--- a/tools/ocaml/libs/xs/Makefile
+++ b/tools/ocaml/libs/xs/Makefile
@@ -44,8 +44,3 @@ uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstore
 
 include $(OCAML_TOPLEVEL)/Makefile.rules
-
-genpath-target = $(call buildmakevars2module,paths.ml)
-$(eval $(genpath-target))
-
-GENERATED_FILES += paths.ml
diff --git a/tools/ocaml/libs/xs/paths.ml.in b/tools/ocaml/libs/xs/paths.ml.in
new file mode 100644
index 0000000000..c067f8d012
--- /dev/null
+++ b/tools/ocaml/libs/xs/paths.ml.in
@@ -0,0 +1 @@
+let xen_run_stored = "@XEN_RUN_STORED@"
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 0b5711b507..6f7333926e 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -93,8 +93,3 @@ uninstall:
 	rm -f $(DESTDIR)$(sbindir)/oxenstored
 
 include $(OCAML_TOPLEVEL)/Makefile.rules
-
-genpath-target = $(call buildmakevars2module,paths.ml)
-$(eval $(genpath-target))
-
-GENERATED_FILES += paths.ml
diff --git a/tools/ocaml/xenstored/paths.ml.in b/tools/ocaml/xenstored/paths.ml.in
new file mode 100644
index 0000000000..37949dc8f3
--- /dev/null
+++ b/tools/ocaml/xenstored/paths.ml.in
@@ -0,0 +1,4 @@
+let xen_log_dir = "@XEN_LOG_DIR@"
+let xen_config_dir = "@XEN_CONFIG_DIR@"
+let xen_run_dir = "@XEN_RUN_DIR@"
+let xen_run_stored = "@XEN_RUN_STORED@"
-- 
2.34.1


