Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592DAB63DC
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983858.1370034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Ir-0004MI-6v; Wed, 14 May 2025 07:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983858.1370034; Wed, 14 May 2025 07:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Ir-0004Jh-3l; Wed, 14 May 2025 07:13:21 +0000
Received: by outflank-mailman (input) for mailman id 983858;
 Wed, 14 May 2025 07:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkt7=X6=boeing.com=sookyung.ahn@srs-se1.protection.inumbo.net>)
 id 1uF6Ip-0004JZ-F8
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:13:19 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bffcd6-3092-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:13:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 54E7DDEt014098; Wed, 14 May 2025 03:13:13 -0400
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 54E7D3kn014026
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 03:13:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 54E7D2da008202; Wed, 14 May 2025 00:13:03 -0700
Received: from localhost.localdomain ([144.112.81.43])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 54E7CtL2007958; Wed, 14 May 2025 00:13:00 -0700
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
X-Inumbo-ID: e6bffcd6-3092-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1747206793;
	bh=1Yr2jbEn9COVInZYVVMSkIcvU1ytJWJjBPVPWMZKdFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ufMBdsT3MxCWE2Oj+ape6o3c/XdxqLrH1MU9VpMa5vp+/kG7tzPExKowlIGA8mw6G
	 0m38LEyRwbFgPKNvIvVb0SLXSTERW7FHbjZn68fIVSaymr+PG0lLeriw9hJAJSDhhi
	 1HsyVHnjjNUZxHBjQNYKjMHea+KCZz9boVmTsQ8AKBIcmN3ZQgECEDJMJHmV6g1RrR
	 3EN6GxjsCy3MGVD7w2RqyQOhse8Uqi+wksdYTg5PI/gtANIl+HN3KOPQNPDIERkx8c
	 MWu7fiWSZFFBWg7+Elpkg5em6fPS8gncn66T7xRQtZmiwLgVl4VKudBZum+N78V7WD
	 Sb24zWbsYRoNA==
From: Sookyung Ahn <sookyung.ahn@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson.Choi@boeing.com, brian.j.wood2@boeing.com,
        haesun.kim@boeing.com, Sookyung Ahn <sookyung.ahn@boeing.com>
Subject: [RFC PATCH 1/2] changes for minimal-xen-tools
Date: Wed, 14 May 2025 07:12:49 +0000
Message-Id: <a2359d5d45b468a41ad7be4298c96e7c041be046.1747205627.git.sookyung.ahn@boeing.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747205627.git.sookyung.ahn@boeing.com>
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

---
 config/Tools.mk.in                   |  1 +
 tools/Makefile                       | 19 ++++++
 tools/Rules.mk                       |  9 ++-
 tools/configure.ac                   | 47 +++++---------
 tools/flask/Makefile                 |  4 ++
 tools/hotplug/Linux/Makefile         |  6 ++
 tools/hotplug/Linux/systemd/Makefile |  6 ++
 tools/libs/Makefile                  |  9 +++
 tools/libs/ctrl/Makefile.common      | 92 ++++++++++++++++------------
 tools/libs/ctrl/xc_private.c         |  6 ++
 tools/libs/ctrl/xc_private.h         |  7 ++-
 tools/libs/uselibs.mk                | 76 +++++++++++++----------
 12 files changed, 178 insertions(+), 104 deletions(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 37c071961e..3880d7ada2 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -55,6 +55,7 @@ CONFIG_SYSTEMD      := @systemd@
 XEN_SYSTEMD_DIR     := @SYSTEMD_DIR@
 XEN_SYSTEMD_MODULES_LOAD := @SYSTEMD_MODULES_LOAD@
 CONFIG_9PFS         := @ninepfs@
+CONFIG_MINIMAL_TOOLS  := @minimal_xen_tools@
 
 LINUX_BACKEND_MODULES := @LINUX_BACKEND_MODULES@
 
diff --git a/tools/Makefile b/tools/Makefile
index 7d17211782..b4af073305 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -41,6 +41,24 @@ SUBDIRS-y += python
 SUBDIRS-$(CONFIG_PYGRUB) += pygrub
 SUBDIRS-$(OCAML_TOOLS) += ocaml
 
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+SUBDIRS-y :=
+SUBDIRS-y += libs
+SUBDIRS-y += flask
+SUBDIRS-y += hotplug
+SUBDIRS-$(CONFIG_X86) += firmware
+SUBDIRS-$(CONFIG_LIBFSIMAGE) += libfsimage
+
+# do not recurse in to a dir we are about to delete
+ifneq "$(MAKECMDGOALS)" "distclean"
+SUBDIRS-$(CONFIG_QEMU_TRAD) += qemu-xen-traditional-dir
+SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir
+endif
+#SUBDIRS-y += python
+SUBDIRS-$(CONFIG_PYGRUB) += pygrub
+SUBDIRS-$(OCAML_TOOLS) += ocaml
+endif
+
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := libs
 endif
@@ -55,6 +73,7 @@ endif
 
 .PHONY: build all
 build all: subdirs-all
+	echo "$(SUBDIRS-y)"
 
 .PHONY: install
 install:
diff --git a/tools/Rules.mk b/tools/Rules.mk
index cb3fd82c1f..fd4146fc7e 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -22,8 +22,11 @@ include $(XEN_ROOT)/tools/libs/uselibs.mk
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
-XENSTORE_XENSTORED ?= y
-
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+	XENSTORE_XENSTORED ?= n
+else
+	XENSTORE_XENSTORED ?= y
+endif
 # A debug build of tools?
 debug ?= n
 debug_symbols ?= $(debug)
@@ -139,7 +142,9 @@ ifeq ($(CONFIG_Linux),y)
 xenlibs-ldlibs-store := -ldl
 endif
 
+ifeq ($(CONFIG_MINIMAL_TOOLS),n)
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
+endif
 
 # Don't add -Werror if we are used by qemu-trad build system.
 ifndef BUILDING_QEMU_TRAD
diff --git a/tools/configure.ac b/tools/configure.ac
index 0dd6d747ab..a063bd4759 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -3,8 +3,8 @@
 
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
-    [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
-AC_CONFIG_SRCDIR([libs/light/libxl.c])
+	[xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
+AC_CONFIG_SRCDIR([libs/call/core.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
 hotplug/common/hotplugpath.sh
@@ -32,7 +32,7 @@ AC_CONFIG_AUX_DIR([../])
 # Check if CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is set and print a warning
 
 AS_IF([test -n "$CC$CFLAGS$LDFLAGS$LIBS$CPPFLAGS$CPP"], [
-    AC_MSG_WARN(
+	AC_MSG_WARN(
 [Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not \
 recommended, use PREPEND_INCLUDES, PREPEND_LIB, \
 APPEND_INCLUDES and APPEND_LIB instead when possible.])
@@ -90,36 +90,21 @@ AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
 AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
 AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
 AX_ARG_DEFAULT_ENABLE([pygrub], [Disable pygrub])
+AX_ARG_DEFAULT_DISABLE([minimal_xen_tools], [Enable Minimal Xen Tools])
+
+AS_IF([test "x$enable_minimal_xen_tools" = "xyes"],
+	[AC_DEFINE([ENABLE_MINIMAL_XEN_TOOLS], [1], [Enable Light Xen Tools])])
 
 AC_ARG_WITH([linux-backend-modules],
-    AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"],
-    [List of Linux backend module or modalias names to be autoloaded on startup.]),
-    [LINUX_BACKEND_MODULES="$withval"],
-    [case "$host_os" in
-*linux*)
-LINUX_BACKEND_MODULES="
-xen-evtchn
-xen-gntdev
-xen-gntalloc
-xen-blkback
-xen-netback
-xen-pciback
-evtchn
-gntdev
-netbk
-blkbk
-xen-scsibk
-usbbk
-pciback
-xen-acpi-processor
-"
-;;
-*)
-LINUX_BACKEND_MODULES=
-;;
-esac])
-LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
-AC_SUBST(LINUX_BACKEND_MODULES)
+	AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"], 
+		[List of Linux backend module or modalias names to be autoloaded on startup.]),
+		[LINUX_BACKEND_MODULES="$withval"],
+		AS_IF([test "x$enable_minimal_xen_tools" = "xyes"], [LINUX_BACKEND_MODULES=],
+			[test "x$host_os"="xlinux"],
+				[LINUX_BACKEND_MODULES="xen-evtchn xen-gntdev xen-gntalloc xen-blkback xen-netback xen-pciback evtchn gntdev netbk blkbk xen-scsibk usbbk pciback xen-acpi-processor"],
+				[LINUX_BACKEND_MODULES=])
+)
+AC_SUBST([LINUX_BACKEND_MODULES])
 
 AC_ARG_ENABLE([qemu-traditional],
     AS_HELP_STRING([--enable-qemu-traditional],
diff --git a/tools/flask/Makefile b/tools/flask/Makefile
index 335ee2a090..07dc4ec587 100644
--- a/tools/flask/Makefile
+++ b/tools/flask/Makefile
@@ -1,7 +1,11 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+SUBDIRS-y :=
+else
 SUBDIRS-y := utils
+endif
 SUBDIRS-$(FLASK_POLICY) += policy
 
 .PHONY: all clean install distclean uninstall
diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 9a7b3a3515..9b6d7bbed1 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -18,7 +18,9 @@ XEN_SCRIPTS += block-drbd-probe
 XEN_SCRIPTS += block-dummy
 XEN_SCRIPTS += $(XEN_SCRIPTS-y)
 XEN_SCRIPTS += colo-proxy-setup
+ifeq ($(CONFIG_MINIMAL_TOOLS),n)
 XEN_SCRIPTS += launch-xenstore
+endif
 
 SUBDIRS-$(CONFIG_SYSTEMD) += systemd
 
@@ -47,11 +49,15 @@ install-initd:
 	$(INSTALL_PROG) init.d/xendomains $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_PROG) init.d/xencommons $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_PROG) init.d/xendriverdomain $(DESTDIR)$(INITD_DIR)
+ifeq ($(CONFIG_MINIMAL_TOOLS),n)
 	$(INSTALL_PROG) init.d/xen-watchdog $(DESTDIR)$(INITD_DIR)
+endif
 
 .PHONY: uninstall-initd
 uninstall-initd:
+ifeq ($(CONFIG_MINIMAL_TOOLS),n)
 	rm -f $(DESTDIR)$(INITD_DIR)/xen-watchdog
+endif
 	rm -f $(DESTDIR)$(INITD_DIR)/xendriverdomain
 	rm -f $(DESTDIR)$(INITD_DIR)/xencommons
 	rm -f $(DESTDIR)$(INITD_DIR)/xendomains
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index e29889156d..4a35fcaa0e 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -5,6 +5,7 @@ XEN_SYSTEMD_MODULES := xen.conf
 
 XEN_SYSTEMD_MOUNT := proc-xen.mount
 
+ifeq ($(CONFIG_MINIMAL_TOOLS),n)
 XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
 XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
@@ -12,6 +13,11 @@ XEN_SYSTEMD_SERVICE += xendomains.service
 XEN_SYSTEMD_SERVICE += xen-watchdog.service
 XEN_SYSTEMD_SERVICE += xen-init-dom0.service
 XEN_SYSTEMD_SERVICE += xendriverdomain.service
+else
+XEN_SYSTEMD_SERVICE := xen-init-dom0.service
+XEN_SYSTEMD_SERVICE += xendomains.service
+#XEN_SYSTEMD_SERVICE += xendriverdomain.service
+endif
 
 ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 1afcd12e2b..21dd501b4c 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -18,6 +18,15 @@ SUBDIRS-$(CONFIG_Linux) += vchan
 SUBDIRS-y += light
 SUBDIRS-y += util
 
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+SUBDIRS-y :=
+SUBDIRS-y += toolcore
+SUBDIRS-y += toollog
+SUBDIRS-y += call
+SUBDIRS-y += foreignmemory
+SUBDIRS-y += ctrl
+endif
+
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
 endif
diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
index 247afbe5f9..cee4f6d2f7 100644
--- a/tools/libs/ctrl/Makefile.common
+++ b/tools/libs/ctrl/Makefile.common
@@ -1,41 +1,57 @@
-OBJS-y       += xc_altp2m.o
-OBJS-y       += xc_cpupool.o
-OBJS-y       += xc_domain.o
-OBJS-y       += xc_evtchn.o
-OBJS-y       += xc_gnttab.o
-OBJS-y       += xc_misc.o
-OBJS-y       += xc_flask.o
-OBJS-y       += xc_physdev.o
-OBJS-y       += xc_private.o
-OBJS-y       += xc_csched.o
-OBJS-y       += xc_csched2.o
-OBJS-y       += xc_arinc653.o
-OBJS-y       += xc_rt.o
-OBJS-y       += xc_tbuf.o
-OBJS-y       += xc_pm.o
-OBJS-y       += xc_cpu_hotplug.o
-OBJS-y       += xc_vm_event.o
-OBJS-y       += xc_vmtrace.o
-OBJS-y       += xc_monitor.o
-OBJS-y       += xc_mem_paging.o
-OBJS-y       += xc_mem_access.o
-OBJS-y       += xc_memshr.o
-OBJS-y       += xc_hcall_buf.o
-OBJS-y       += xc_foreign_memory.o
-OBJS-y       += xc_kexec.o
-OBJS-y       += xc_resource.o
-OBJS-$(CONFIG_ARM)  += xc_dt_overlay.o
-OBJS-$(CONFIG_X86) += xc_psr.o
-OBJS-$(CONFIG_X86) += xc_pagetab.o
-OBJS-$(CONFIG_Linux) += xc_linux.o
-OBJS-$(CONFIG_FreeBSD) += xc_freebsd.o
-OBJS-$(CONFIG_SunOS) += xc_solaris.o
-OBJS-$(CONFIG_NetBSD) += xc_netbsd.o
-OBJS-$(CONFIG_NetBSDRump) += xc_netbsd.o
-OBJS-$(CONFIG_MiniOS) += xc_minios.o
-OBJS-y       += xc_evtchn_compat.o
-OBJS-y       += xc_gnttab_compat.o
-OBJS-y       += xc_devicemodel_compat.o
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+    OBJS-y       += xc_domain.o
+    OBJS-y       += xc_misc.o
+    OBJS-y       += xc_private.o
+    OBJS-y       += xc_csched2.o
+    OBJS-y       += xc_arinc653.o
+    OBJS-y       += xc_hcall_buf.o
+    OBJS-y       += xc_foreign_memory.o
+    OBJS-$(CONFIG_Linux) += xc_linux.o
+    OBJS-$(CONFIG_FreeBSD) += xc_freebsd.o
+    OBJS-$(CONFIG_SunOS) += xc_solaris.o
+    OBJS-$(CONFIG_NetBSD) += xc_netbsd.o
+    OBJS-$(CONFIG_NetBSDRump) += xc_netbsd.o
+    OBJS-$(CONFIG_MiniOS) += xc_minios.o
+else
+    OBJS-y       += xc_altp2m.o
+    OBJS-y       += xc_cpupool.o
+    OBJS-y       += xc_domain.o
+    OBJS-y       += xc_evtchn.o
+    OBJS-y       += xc_gnttab.o
+    OBJS-y       += xc_misc.o
+    OBJS-y       += xc_flask.o
+    OBJS-y       += xc_physdev.o
+    OBJS-y       += xc_private.o
+    OBJS-y       += xc_csched.o
+    OBJS-y       += xc_csched2.o
+    OBJS-y       += xc_arinc653.o
+    OBJS-y       += xc_rt.o
+    OBJS-y       += xc_tbuf.o
+    OBJS-y       += xc_pm.o
+    OBJS-y       += xc_cpu_hotplug.o
+    OBJS-y       += xc_vm_event.o
+    OBJS-y       += xc_vmtrace.o
+    OBJS-y       += xc_monitor.o
+    OBJS-y       += xc_mem_paging.o
+    OBJS-y       += xc_mem_access.o
+    OBJS-y       += xc_memshr.o
+    OBJS-y       += xc_hcall_buf.o
+    OBJS-y       += xc_foreign_memory.o
+    OBJS-y       += xc_kexec.o
+    OBJS-y       += xc_resource.o
+    OBJS-$(CONFIG_ARM)  += xc_dt_overlay.o
+    OBJS-$(CONFIG_X86) += xc_psr.o
+    OBJS-$(CONFIG_X86) += xc_pagetab.o
+    OBJS-$(CONFIG_Linux) += xc_linux.o
+    OBJS-$(CONFIG_FreeBSD) += xc_freebsd.o
+    OBJS-$(CONFIG_SunOS) += xc_solaris.o
+    OBJS-$(CONFIG_NetBSD) += xc_netbsd.o
+    OBJS-$(CONFIG_NetBSDRump) += xc_netbsd.o
+    OBJS-$(CONFIG_MiniOS) += xc_minios.o
+    OBJS-y       += xc_evtchn_compat.o
+    OBJS-y       += xc_gnttab_compat.o
+    OBJS-y       += xc_devicemodel_compat.o
+endif
 
 CFLAGS   += -D__XEN_TOOLS__
 CFLAGS	+= $(PTHREAD_CFLAGS)
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index abd0b0d849..4cd893a4fd 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -65,9 +65,11 @@ struct xc_interface_core *xc_interface_open(xentoollog_logger *logger,
     if ( xch->fmem == NULL )
         goto err;
 
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
     xch->dmod = xendevicemodel_open(xch->error_handler, 0);
     if ( xch->dmod == NULL )
         goto err;
+#endif
 
     return xch;
 
@@ -92,8 +94,10 @@ int xc_interface_close(xc_interface *xch)
     rc = xenforeignmemory_close(xch->fmem);
     if (rc) PERROR("Could not close foreign memory interface");
 
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
     rc = xendevicemodel_close(xch->dmod);
     if (rc) PERROR("Could not close device model interface");
+#endif
 
     xtl_logger_destroy(xch->dombuild_logger_tofree);
     xtl_logger_destroy(xch->error_handler_tofree);
@@ -107,6 +111,7 @@ xencall_handle *xc_interface_xcall_handle(xc_interface *xch)
     return xch->xcall;
 }
 
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
 struct xenforeignmemory_handle *xc_interface_fmem_handle(xc_interface *xch)
 {
     return xch->fmem;
@@ -116,6 +121,7 @@ struct xendevicemodel_handle *xc_interface_dmod_handle(xc_interface *xch)
 {
     return xch->dmod;
 }
+#endif
 
 static pthread_key_t errbuf_pkey;
 static pthread_once_t errbuf_pkey_once = PTHREAD_ONCE_INIT;
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index d8b7da2805..18dffdf6fd 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -36,7 +36,9 @@
 
 #include <xencall.h>
 #include <xenforeignmemory.h>
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
 #include <xendevicemodel.h>
+#endif
 
 #include <xen/sys/privcmd.h>
 
@@ -91,9 +93,10 @@ struct xc_interface_core {
 
     /* Foreign mappings */
     xenforeignmemory_handle *fmem;
-
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
     /* Device model */
     xendevicemodel_handle *dmod;
+#endif
 };
 
 void *osdep_alloc_hypercall_buffer(xc_interface *xch, int npages);
@@ -400,6 +403,7 @@ int xc_ffs64(uint64_t x);
 #define DOMPRINTF(fmt, args...) xc_dom_printf(dom->xch, fmt, ## args)
 #define DOMPRINTF_CALLED(xch) xc_dom_printf((xch), "%s: called", __FUNCTION__)
 
+#if (ENABLE_MINIMAL_XEN_TOOLS != 1)
 /**
  * vm_event operations. Internal use only.
  */
@@ -411,6 +415,7 @@ int xc_vm_event_control(xc_interface *xch, uint32_t domain_id, unsigned int op,
  */
 void *xc_vm_event_enable(xc_interface *xch, uint32_t domain_id, int param,
                          uint32_t *port);
+#endif
 
 int do_dm_op(xc_interface *xch, uint32_t domid, unsigned int nr_bufs, ...);
 
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index efd7a475ba..c0ce4ef210 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -1,33 +1,45 @@
 # Libraries below tools/libs/ and their dependencies
-
-LIBS_LIBS += toolcore
-USELIBS_toolcore :=
-LIBS_LIBS += toollog
-USELIBS_toollog :=
-LIBS_LIBS += evtchn
-USELIBS_evtchn := toollog toolcore
-LIBS_LIBS += gnttab
-USELIBS_gnttab := toollog toolcore
-LIBS_LIBS += call
-USELIBS_call := toollog toolcore
-LIBS_LIBS += foreignmemory
-USELIBS_foreignmemory := toollog toolcore
-LIBS_LIBS += devicemodel
-USELIBS_devicemodel := toollog toolcore call
-LIBS_LIBS += hypfs
-USELIBS_hypfs := toollog toolcore call
-LIBS_LIBS += ctrl
-USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
-LIBS_LIBS += guest
-USELIBS_guest := evtchn ctrl
-LIBS_LIBS += store
-USELIBS_store := toolcore
-LIBS_LIBS += vchan
-USELIBS_vchan := toollog store gnttab evtchn
-LIBS_LIBS += stat
-USELIBS_stat := ctrl store
-LIBS_LIBS += light
-USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
-LIBS_LIBS += util
-USELIBS_util := light
-FILENAME_util := xlutil
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+    LIBS_LIBS += toolcore
+    USELIBS_toolcore := 
+    LIBS_LIBS += toollog
+    USELIBS_toollog :=
+    LIBS_LIBS += call
+    USELIBS_call := toollog toolcore
+    LIBS_LIBS += foreignmemory
+    USELIBS_foreignmemory := toollog toolcore
+    LIBS_LIBS += ctrl
+    USELIBS_ctrl := toollog call foreignmemory
+else
+    LIBS_LIBS += toolcore
+    USELIBS_toolcore :=
+    LIBS_LIBS += toollog
+    USELIBS_toollog :=
+    LIBS_LIBS += evtchn
+    USELIBS_evtchn := toollog toolcore
+    LIBS_LIBS += gnttab
+    USELIBS_gnttab := toollog toolcore
+    LIBS_LIBS += call
+    USELIBS_call := toollog toolcore
+    LIBS_LIBS += foreignmemory
+    USELIBS_foreignmemory := toollog toolcore
+    LIBS_LIBS += devicemodel
+    USELIBS_devicemodel := toollog toolcore call
+    LIBS_LIBS += hypfs
+    USELIBS_hypfs := toollog toolcore call
+    LIBS_LIBS += ctrl
+    USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
+    LIBS_LIBS += guest
+    USELIBS_guest := evtchn ctrl
+    LIBS_LIBS += store
+    USELIBS_store := toolcore
+    LIBS_LIBS += vchan
+    USELIBS_vchan := toollog store gnttab evtchn
+    LIBS_LIBS += stat
+    USELIBS_stat := ctrl store
+    LIBS_LIBS += light
+    USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
+    LIBS_LIBS += util
+    USELIBS_util := light
+    FILENAME_util := xlutil
+endif
\ No newline at end of file
-- 
2.34.1


