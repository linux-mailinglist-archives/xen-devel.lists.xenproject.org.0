Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83759050F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384787.620293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMq-0004Wv-Re; Thu, 11 Aug 2022 16:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384787.620293; Thu, 11 Aug 2022 16:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMq-0004SM-Ju; Thu, 11 Aug 2022 16:49:08 +0000
Received: by outflank-mailman (input) for mailman id 384787;
 Thu, 11 Aug 2022 16:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMo-0003Aq-OE
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81cb3c3d-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:05 +0200 (CEST)
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
X-Inumbo-ID: 81cb3c3d-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysnWsjj7Rb1EHEFLlv8kUsqZAX1qaQM4OVjafbYC2NQ=;
  b=N3h0c+becblvFHHaq6ZaIovFvr8+Evh9C5SdTq4LC0cUBST2WpU3IUmb
   9Xx8xY3zBTLSP/nqEuk+nGkTk7l04I4Hcy77sRwXsVN2aS0dZb0QyL3Pc
   Ie8AVRlYJHvmi+epXlNqgzLVyR/U0Kct+SdDbTBrzCaa6Q3GAV/PcsdSy
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650099
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hJ6ys6Ouj/mpT0fvrR3Pl8FynXyQoLVcMsEvi/4bfWQNrUp31zBVz
 jQZXWiPO//fYTageohwOoS3o01QvsSBnYNnSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/va8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPp/tI3ImUWFLZE58BQG25Cq
 +QjdmoCO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeMklEpiOm8WDbTUt/WXYIJumi4n
 CHpwV/zGDsXDfPB7yXQpxpAgceQxHimCer+DoaQ6fpCkFCVgGsJB3U+UUawqL+3g0i1VtZbN
 mQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXeg0e66iRObAnQIC0gYaiNaVTBbuda29enfkSnzosZf/L+d14OrQWmhn
 GnT8kDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510JvMALZSr6MPUtC25UNyjN5faIKDgYfqqMMoomjmZZLWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL89AgOBD+8zL7TmMLXwN50j4jOH2ib/8YettDWZimchltf/Y/FiOo
 4oGXyZIoj0GONDDjuDs2dZ7BTg3wbITX/gad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:UxciEqj2X9dXuIo5ipjFcbzlU3BQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650099"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 04/32] tools/hotplug: cleanup Makefiles
Date: Thu, 11 Aug 2022 17:48:17 +0100
Message-ID: <20220811164845.38083-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use simply expanded variables when recursively expanded variable
aren't needed. (Use ":=" instead of "=".)

Don't check if a directory already exist when installing, just create
it.

Fix $(HOTPLUGPATH), it shouldn't have any double-quote.

Some reindentation.

FreeBSD, "hotplugpath.sh" is already installed by common/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/hotplug/FreeBSD/Makefile       | 11 +++--------
 tools/hotplug/Linux/Makefile         | 16 ++++++----------
 tools/hotplug/Linux/systemd/Makefile | 16 +++++++---------
 tools/hotplug/NetBSD/Makefile        |  9 +++------
 tools/hotplug/common/Makefile        | 16 ++++++----------
 5 files changed, 25 insertions(+), 43 deletions(-)

diff --git a/tools/hotplug/FreeBSD/Makefile b/tools/hotplug/FreeBSD/Makefile
index de9928cd86..a6552c9884 100644
--- a/tools/hotplug/FreeBSD/Makefile
+++ b/tools/hotplug/FreeBSD/Makefile
@@ -2,18 +2,15 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS = vif-bridge block
+XEN_SCRIPTS := vif-bridge block
 
-XEN_SCRIPT_DATA =
+XEN_SCRIPT_DATA :=
 
-XEN_RCD_PROG = rc.d/xencommons rc.d/xendriverdomain
+XEN_RCD_PROG := rc.d/xencommons rc.d/xendriverdomain
 
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-scripts install-rcd
 
@@ -44,12 +41,10 @@ install-rcd:
 	   do \
 	   $(INSTALL_PROG) $$i $(DESTDIR)$(INITD_DIR); \
 	done
-	$(INSTALL_DATA) ../common/hotplugpath.sh $(DESTDIR)$(XEN_SCRIPT_DIR)
 
 .PHONY: uninstall-rcd
 uninstall-rcd:
 	rm -f $(addprefix $(DESTDIR)$(INITD_DIR)/, $(XEN_RCD_PROG))
-	rm -f $(DESTDIR)$(XEN_SCRIPT_DIR)/hotplugpath.sh
 
 .PHONY: clean
 clean:
diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 0b1d111d7e..9a7b3a3515 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS = vif-bridge
+XEN_SCRIPTS := vif-bridge
 XEN_SCRIPTS += vif-route
 XEN_SCRIPTS += vif-nat
 XEN_SCRIPTS += vif-openvswitch
@@ -22,16 +22,13 @@ XEN_SCRIPTS += launch-xenstore
 
 SUBDIRS-$(CONFIG_SYSTEMD) += systemd
 
-XEN_SCRIPT_DATA = xen-script-common.sh locking.sh logging.sh
+XEN_SCRIPT_DATA := xen-script-common.sh locking.sh logging.sh
 XEN_SCRIPT_DATA += xen-hotplug-common.sh xen-network-common.sh vif-common.sh
 XEN_SCRIPT_DATA += block-common.sh
 
 .PHONY: all
 all: subdirs-all
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-initd install-scripts subdirs-install
 
@@ -41,9 +38,9 @@ uninstall: uninstall-initd uninstall-scripts subdirs-uninstall
 # See docs/misc/distro_mapping.txt for INITD_DIR location
 .PHONY: install-initd
 install-initd:
-	[ -d $(DESTDIR)$(INITD_DIR) ] || $(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
-	[ -d $(DESTDIR)$(SYSCONFIG_DIR) ] || $(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
-	[ -d $(DESTDIR)$(LIBEXEC_BIN) ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_DATA) init.d/sysconfig.xendomains $(DESTDIR)$(SYSCONFIG_DIR)/xendomains
 	$(INSTALL_DATA) init.d/sysconfig.xencommons $(DESTDIR)$(SYSCONFIG_DIR)/xencommons
 	$(INSTALL_PROG) xendomains $(DESTDIR)$(LIBEXEC_BIN)
@@ -64,8 +61,7 @@ uninstall-initd:
 
 .PHONY: install-scripts
 install-scripts:
-	[ -d $(DESTDIR)$(XEN_SCRIPT_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
 	set -e; for i in $(XEN_SCRIPTS); \
 	    do \
 	    $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SCRIPT_DIR); \
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index a5d41d86ef..26df2a43b1 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -1,12 +1,12 @@
 XEN_ROOT = $(CURDIR)/../../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-XEN_SYSTEMD_MODULES = xen.conf
+XEN_SYSTEMD_MODULES := xen.conf
 
-XEN_SYSTEMD_MOUNT =  proc-xen.mount
+XEN_SYSTEMD_MOUNT := proc-xen.mount
 XEN_SYSTEMD_MOUNT += var-lib-xenstored.mount
 
-XEN_SYSTEMD_SERVICE  = xenstored.service
+XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
 XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
 XEN_SYSTEMD_SERVICE += xendomains.service
@@ -14,7 +14,7 @@ XEN_SYSTEMD_SERVICE += xen-watchdog.service
 XEN_SYSTEMD_SERVICE += xen-init-dom0.service
 XEN_SYSTEMD_SERVICE += xendriverdomain.service
 
-ALL_XEN_SYSTEMD =	$(XEN_SYSTEMD_MODULES)  \
+ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
 			$(XEN_SYSTEMD_SERVICE)
 
@@ -30,10 +30,8 @@ distclean: clean
 
 .PHONY: install
 install: $(ALL_XEN_SYSTEMD)
-	[ -d $(DESTDIR)$(XEN_SYSTEMD_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
-	[ -d $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
 	$(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
@@ -48,5 +46,5 @@ $(XEN_SYSTEMD_MODULES):
 	rm -f $@.tmp
 	for mod in $(LINUX_BACKEND_MODULES) ; do \
 		echo $$mod ; \
-		done > $@.tmp
+	done > $@.tmp
 	$(call move-if-changed,$@.tmp,$@)
diff --git a/tools/hotplug/NetBSD/Makefile b/tools/hotplug/NetBSD/Makefile
index f909ffa367..1cd3db2ccb 100644
--- a/tools/hotplug/NetBSD/Makefile
+++ b/tools/hotplug/NetBSD/Makefile
@@ -2,22 +2,19 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS =
+XEN_SCRIPTS :=
 XEN_SCRIPTS += locking.sh
 XEN_SCRIPTS += block
 XEN_SCRIPTS += vif-bridge
 XEN_SCRIPTS += vif-ip
 XEN_SCRIPTS += qemu-ifup
 
-XEN_SCRIPT_DATA =
-XEN_RCD_PROG = rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
+XEN_SCRIPT_DATA :=
+XEN_RCD_PROG := rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
 
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-scripts install-rcd
 
diff --git a/tools/hotplug/common/Makefile b/tools/hotplug/common/Makefile
index ef48bfacc9..e8a8dbea6c 100644
--- a/tools/hotplug/common/Makefile
+++ b/tools/hotplug/common/Makefile
@@ -1,22 +1,19 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-HOTPLUGPATH="hotplugpath.sh"
+HOTPLUGPATH := hotplugpath.sh
 
 # OS-independent hotplug scripts go in this directory
 
 # Xen scripts to go there.
-XEN_SCRIPTS =
-XEN_SCRIPT_DATA = $(HOTPLUGPATH)
+XEN_SCRIPTS :=
+XEN_SCRIPT_DATA := $(HOTPLUGPATH)
 
 genpath-target = $(call buildmakevars2file,$(HOTPLUGPATH))
 $(eval $(genpath-target))
 
 .PHONY: all
-all: build
-
-.PHONY: build
-build: $(HOTPLUGPATH)
+all: $(HOTPLUGPATH)
 
 .PHONY: install
 install: install-scripts
@@ -25,9 +22,8 @@ install: install-scripts
 uninstall: uninstall-scripts
 
 .PHONY: install-scripts
-install-scripts: build
-	[ -d $(DESTDIR)$(XEN_SCRIPT_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
+install-scripts: all
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
 	set -e; for i in $(XEN_SCRIPTS); \
 	   do \
 	   $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SCRIPT_DIR); \
-- 
Anthony PERARD


