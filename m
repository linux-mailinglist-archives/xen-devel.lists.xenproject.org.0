Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E07614E4B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434829.687460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCB-0007Xe-Dt; Tue, 01 Nov 2022 15:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434829.687460; Tue, 01 Nov 2022 15:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCB-0007Ud-Af; Tue, 01 Nov 2022 15:28:55 +0000
Received: by outflank-mailman (input) for mailman id 434829;
 Tue, 01 Nov 2022 15:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optC9-0007Tl-Pn
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:28:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3924cde-59f9-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:28:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B778C1F8E3;
 Tue,  1 Nov 2022 15:28:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 882431346F;
 Tue,  1 Nov 2022 15:28:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HBTaHzM7YWOBYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:28:51 +0000
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
X-Inumbo-ID: e3924cde-59f9-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kCPlZkMn4lMbWZL1TxCM0JXd1CkVTaMTWMc1Tu0JRs=;
	b=UhkOmD9eqKepd1DwAGoQnmkF54esO2ORp7c5GTlAIM5iUH+zcY9MWpgGafI54QEl8nmjv5
	NMjJqRr3JPo8y4AhoZjG1pmBTBmf+OXP0tKOQrfriHwS19OdzjvE4WUYBYH8RTG0htlbkY
	L8o20/0kxNP8peDj3efPqVmq6PpqTLo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and XENSTORED_ROOTDIR
Date: Tue,  1 Nov 2022 16:28:23 +0100
Message-Id: <20221101152842.4257-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XEN_LIB_STORED is serving no real purpose, as it is a mount point for
a tmpfs, so it can be replaced easily by XEN_RUN_STORED.

XENSTORED_ROOTDIR is basically unused already, there is just a single
reference in xs_daemon_rootdir() with a fallback to XEN_LIB_STORED,
and a .gdbinit file setting it.

Remove the .gdbinit file, as it is not known having been used since
ages, and make xs_daemon_rootdir() an alias of xs_daemon_rundir().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Paths.mk.in                                   |  1 -
 configure                                            |  4 ----
 docs/configure                                       |  4 ----
 m4/paths.m4                                          |  3 ---
 tools/configure                                      |  7 +------
 tools/configure.ac                                   |  1 -
 tools/hotplug/FreeBSD/rc.d/xencommons.in             |  6 ------
 tools/hotplug/Linux/systemd/Makefile                 |  1 -
 .../hotplug/Linux/systemd/var-lib-xenstored.mount.in | 12 ------------
 tools/libs/store/Makefile                            |  1 -
 tools/xenstore/.gdbinit                              |  4 ----
 tools/xenstore/Makefile                              |  4 ----
 tools/xenstore/Makefile.common                       |  1 -
 tools/xenstore/xs_lib.c                              | 11 +++++------
 14 files changed, 6 insertions(+), 54 deletions(-)
 delete mode 100644 tools/hotplug/Linux/systemd/var-lib-xenstored.mount.in
 delete mode 100644 tools/xenstore/.gdbinit

diff --git a/config/Paths.mk.in b/config/Paths.mk.in
index 416fc7aab9..44bab1d748 100644
--- a/config/Paths.mk.in
+++ b/config/Paths.mk.in
@@ -41,7 +41,6 @@ MAN8DIR                  := $(mandir)/man8
 XEN_RUN_DIR              := @XEN_RUN_DIR@
 XEN_LOG_DIR              := @XEN_LOG_DIR@
 XEN_LIB_DIR              := @XEN_LIB_DIR@
-XEN_LIB_STORED           := @XEN_LIB_STORED@
 XEN_RUN_STORED           := @XEN_RUN_STORED@
 
 CONFIG_DIR               := @CONFIG_DIR@
diff --git a/configure b/configure
index bb7f27ddad..b51174f2ef 100755
--- a/configure
+++ b/configure
@@ -603,7 +603,6 @@ INITD_DIR
 SHAREDIR
 XEN_LIB_DIR
 XEN_RUN_STORED
-XEN_LIB_STORED
 XEN_LOG_DIR
 XEN_RUN_DIR
 XENFIRMWAREDIR
@@ -2081,9 +2080,6 @@ cat >>confdefs.h <<_ACEOF
 _ACEOF
 
 
-XEN_LIB_STORED=$localstatedir/lib/xenstored
-
-
 XEN_RUN_STORED=$rundir_path/xenstored
 
 
diff --git a/docs/configure b/docs/configure
index d4fced9858..f008ca0565 100755
--- a/docs/configure
+++ b/docs/configure
@@ -601,7 +601,6 @@ INITD_DIR
 SHAREDIR
 XEN_LIB_DIR
 XEN_RUN_STORED
-XEN_LIB_STORED
 XEN_LOG_DIR
 XEN_RUN_DIR
 XENFIRMWAREDIR
@@ -1984,9 +1983,6 @@ cat >>confdefs.h <<_ACEOF
 _ACEOF
 
 
-XEN_LIB_STORED=$localstatedir/lib/xenstored
-
-
 XEN_RUN_STORED=$rundir_path/xenstored
 
 
diff --git a/m4/paths.m4 b/m4/paths.m4
index 826faada45..e4104bcce0 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -136,9 +136,6 @@ XEN_LOG_DIR=$localstatedir/log/xen
 AC_SUBST(XEN_LOG_DIR)
 AC_DEFINE_UNQUOTED([XEN_LOG_DIR], ["$XEN_LOG_DIR"], [Xen's log dir])
 
-XEN_LIB_STORED=$localstatedir/lib/xenstored
-AC_SUBST(XEN_LIB_STORED)
-
 XEN_RUN_STORED=$rundir_path/xenstored
 AC_SUBST(XEN_RUN_STORED)
 
diff --git a/tools/configure b/tools/configure
index 6199823f5a..ffe3f48901 100755
--- a/tools/configure
+++ b/tools/configure
@@ -725,7 +725,6 @@ INITD_DIR
 SHAREDIR
 XEN_LIB_DIR
 XEN_RUN_STORED
-XEN_LIB_STORED
 XEN_LOG_DIR
 XEN_RUN_DIR
 XENFIRMWAREDIR
@@ -4065,9 +4064,6 @@ cat >>confdefs.h <<_ACEOF
 _ACEOF
 
 
-XEN_LIB_STORED=$localstatedir/lib/xenstored
-
-
 XEN_RUN_STORED=$rundir_path/xenstored
 
 
@@ -10085,7 +10081,7 @@ fi
 
 if test "x$systemd" = "xy"; then :
 
-    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/var-lib-xenstored.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service"
+    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service"
 
 
 fi
@@ -10967,7 +10963,6 @@ do
     "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
     "config.h") CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
     "hotplug/Linux/systemd/proc-xen.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/proc-xen.mount" ;;
-    "hotplug/Linux/systemd/var-lib-xenstored.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/var-lib-xenstored.mount" ;;
     "hotplug/Linux/systemd/xen-init-dom0.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xen-init-dom0.service" ;;
     "hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service" ;;
     "hotplug/Linux/systemd/xen-watchdog.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xen-watchdog.service" ;;
diff --git a/tools/configure.ac b/tools/configure.ac
index 18e481d77e..3a2f6a2da9 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -482,7 +482,6 @@ AX_AVAILABLE_SYSTEMD()
 AS_IF([test "x$systemd" = "xy"], [
     AC_CONFIG_FILES([
     hotplug/Linux/systemd/proc-xen.mount
-    hotplug/Linux/systemd/var-lib-xenstored.mount
     hotplug/Linux/systemd/xen-init-dom0.service
     hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service
     hotplug/Linux/systemd/xen-watchdog.service
diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
index fddcce314c..7f7cda289f 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -14,7 +14,6 @@ export LD_LIBRARY_PATH
 
 name="xencommons"
 rcvar="xencommons_enable"
-start_precmd="xen_precmd"
 start_cmd="xen_startcmd"
 stop_cmd="xen_stop"
 status_cmd="xen_status"
@@ -30,11 +29,6 @@ XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 load_rc_config $name
 : ${xencommons_enable:=no}
 
-xen_precmd()
-{
-	mkdir -p @XEN_LIB_STORED@ || exit 1
-}
-
 xen_startcmd()
 {
 	local time=0
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index 26df2a43b1..e29889156d 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 XEN_SYSTEMD_MODULES := xen.conf
 
 XEN_SYSTEMD_MOUNT := proc-xen.mount
-XEN_SYSTEMD_MOUNT += var-lib-xenstored.mount
 
 XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
diff --git a/tools/hotplug/Linux/systemd/var-lib-xenstored.mount.in b/tools/hotplug/Linux/systemd/var-lib-xenstored.mount.in
deleted file mode 100644
index 11a7d50edc..0000000000
--- a/tools/hotplug/Linux/systemd/var-lib-xenstored.mount.in
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=mount xenstore file system
-Requires=proc-xen.mount
-After=proc-xen.mount
-ConditionPathExists=/proc/xen/capabilities
-RefuseManualStop=true
-
-[Mount]
-What=xenstore
-Where=@XEN_LIB_STORED@
-Type=tmpfs
-Options=mode=755
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 2334c953bb..3557a8c76d 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -18,7 +18,6 @@ include ../libs.mk
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxentoolcore)
-CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 vpath xs_lib.c $(XEN_ROOT)/tools/xenstore
diff --git a/tools/xenstore/.gdbinit b/tools/xenstore/.gdbinit
deleted file mode 100644
index 9a71b20ac4..0000000000
--- a/tools/xenstore/.gdbinit
+++ /dev/null
@@ -1,4 +0,0 @@
-set environment XENSTORED_RUNDIR=testsuite/tmp
-set environment XENSTORED_ROOTDIR=testsuite/tmp
-handle SIGUSR1 noprint nostop
-handle SIGPIPE noprint nostop
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 1b66190cc5..ce7a68178f 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -69,7 +69,6 @@ install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 ifeq ($(XENSTORE_XENSTORED),y)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_LIB_STORED)
 	$(INSTALL_PROG) xenstored $(DESTDIR)$(sbindir)
 endif
 	$(INSTALL_PROG) xenstore-control $(DESTDIR)$(bindir)
@@ -85,9 +84,6 @@ uninstall:
 	rm -f $(DESTDIR)$(bindir)/xenstore-control
 ifeq ($(XENSTORE_XENSTORED),y)
 	rm -f $(DESTDIR)$(sbindir)/xenstored
-	if [ -d $(DESTDIR)$(XEN_LIB_STORED) ]; then \
-		rmdir --ignore-fail-on-non-empty $(DESTDIR)$(XEN_LIB_STORED); \
-	fi
 endif
 	if [ -d $(DESTDIR)$(includedir)/xenstore-compat ]; then \
 		rmdir --ignore-fail-on-non-empty $(DESTDIR)$(includedir)/xenstore-compat; \
diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
index ddbac052ac..b18f95c103 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstore/Makefile.common
@@ -16,7 +16,6 @@ CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
-CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 ifdef CONFIG_STUBDOM
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index 10fa4c3ad0..b9941c567c 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -26,18 +26,17 @@
 
 /* Common routines for the Xen store daemon and client library. */
 
-const char *xs_daemon_rootdir(void)
-{
-	char *s = getenv("XENSTORED_ROOTDIR");
-	return (s ? s : XEN_LIB_STORED);
-}
-
 const char *xs_daemon_rundir(void)
 {
 	char *s = getenv("XENSTORED_RUNDIR");
 	return (s ? s : XEN_RUN_STORED);
 }
 
+const char *xs_daemon_rootdir(void)
+{
+	return xs_daemon_rundir();
+}
+
 static const char *xs_daemon_path(void)
 {
 	static char buf[PATH_MAX];
-- 
2.35.3


