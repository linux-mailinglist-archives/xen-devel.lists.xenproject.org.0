Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370746A25F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239515.415371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTY-0001pn-MT; Mon, 06 Dec 2021 17:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239515.415371; Mon, 06 Dec 2021 17:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTY-0001ko-Cj; Mon, 06 Dec 2021 17:08:28 +0000
Received: by outflank-mailman (input) for mailman id 239515;
 Mon, 06 Dec 2021 17:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPC-0005ti-Hf
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ec7773b-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:57 +0100 (CET)
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
X-Inumbo-ID: 7ec7773b-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+tvgdAnTgDFIQbMFRm+czYIkxCdj45NAL3MUbvPerCo=;
  b=iGzNgPAll4NXo4QGfBMALzALgTVoahZZ81DO/YR72M/+8A2ZMGYMIhop
   ukiNI44csFvm3vjUa8aRZCdYzKDXMekZLtV+j3HPAj0lVG7ZbkkU8aKSZ
   ngYacN/feHaMKwVFTtBGG6Y7Wt3QKCTDACpYUQzMnXkUvfmK2Nt2o0t8C
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iloVjZmQX9y2crvLCIwpl57pl72O/tj1fGFcXIMnyxNR5L62S4fLq2TAUErUIG26ZvmQom57Wr
 evCFk/pXmCpBYi6uYfz6td4S78HrBxmsKd9jy6tfVpAP6GEnF1zLXD+Del7xwWJs3Ln4Vg8HDZ
 IQPLvYfP9V3y26GpQ/MWl8WUFIjvdlWVVss3VU996osWDOzF5TIwJFGW80rRiF86wOe/TR/osj
 qlmeqmrudTtI6uD1rqM/wdXNymlPnpM3jVv+mI9qx70JkSykByTwBPVc9v7wm+iRz9iHuKrXTs
 1sG0QKqmDvwqAqqn5361BuoL
X-SBRS: 5.1
X-MesageID: 58884430
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:80ta/6/Ph8jNt+z5v5zZDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 2MWDGnUb/qJazegeNonb9yxp0oOupbWx9c3TFNkrSk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+l
 udJibWqdjxuI+rQs9g+aTtBNHtxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0eTaaCO
 5FBAdZpRDX5fBJpCg86Motkw+aP1nLFbx9S803A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 0US5iopq7l07EGxR8PxdxK9qX+A+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeSmIY0
 mOghezSQiEorJapaki/75DOombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2v0/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXXlrAYlRujBCxO53Nv02wQH834JrWvFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqW5twnPW6T4q6Bpg4i+aihLArLmdrGwk0OiatM53FyhBwwcnTx
 7/FGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaKMmu14JNQ+90mX/8+Rl
 kyAtoZj4AKXrRX6xc+iNhiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:7ULPX6/n17Smibw22ZZuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884430"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 30/57] tools/hotplug: cleanup Makefiles
Date: Mon, 6 Dec 2021 17:02:13 +0000
Message-ID: <20211206170241.13165-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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


