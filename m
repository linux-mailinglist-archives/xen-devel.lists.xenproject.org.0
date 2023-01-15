Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8F66B0A9
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477860.740782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ER-0005UE-Oz; Sun, 15 Jan 2023 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477860.740782; Sun, 15 Jan 2023 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ER-0005QY-Jr; Sun, 15 Jan 2023 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 477860;
 Sun, 15 Jan 2023 11:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EP-0004ci-BU
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 211d3372-94c8-11ed-91b6-6bf2151ebd3b;
 Sun, 15 Jan 2023 12:31:18 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id u9so62072714ejo.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:18 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:17 -0800 (PST)
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
X-Inumbo-ID: 211d3372-94c8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoECGyweNl38ENJbt1BJclW8weoldKxLjvYMq4gaQIY=;
        b=FdIGONtJ4A0wRis3AMTpplLlFdc1lrp2/W8tLHS9CpuC5oF63GuUNQkKMR9MoMawsr
         N1BLSlUWHG73eDAO5bVunbosrofKFfsthEC98hMurnKW8YqodK3S6+sgvHIko9zmvI1z
         s+yLsbpIE4uR5/g6AUS8HMBDox0iSRe57dQr7SqtIWdDcOpWABe5xddna/s64mmBLjx0
         Q/AKZt+GBGX/LbwgS4b/7qbawBPBHpK3R32GEt+5S3votqxN9cHKn2mm5wSwtcbjBrtx
         Eiy4Y996dZTmMQA4GwgfTF7Q8grNH5K8YFR9R6JFcgz+J5VdMPgEMmrHSOffrMBajLgo
         FJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoECGyweNl38ENJbt1BJclW8weoldKxLjvYMq4gaQIY=;
        b=Nn3d7ZEGlUmxkyd7+PSdBb3Be8/uBx5V5Un/vibi8D0cdOtXBDCQJW+xm9HEVBHTGm
         PKNTczsnTETPR+PbJNh3MnLbgv20VD7pW2bkNndd8NBJ715bHV2BF7ntQKiQzzgDtNpz
         eBYj6P9M1ozT4nw2YwfEybAcPbu95S6PKKRARpyn7o4n0djeG7Q7IJyqieYqCH6tGcy7
         Ic3mV/atOkbegop456Ft3Bojus+937fyp1aKUR89tpZcqR7Svuy+ZG2O9d7g08m8+/gN
         rgB6U4u3Zj+nWoXzN6hHwuBudgdIK81TND7yM+Z1FIf/+F0LM/FSaPCl5Bfh5OWiPMc0
         qwBQ==
X-Gm-Message-State: AFqh2kqFQBki/1ojvA0BPp8b35ENTnxi4/Q2TxHDvKfcc25l/RzIx1Y3
	L0fuhxbPMEfpshGqZliwrJsx04y4ikyEpEZl
X-Google-Smtp-Source: AMrXdXvvnmtSD9Recy2etH1LSWO8CG/k2xh1sEFNtstEDPuGMLLxqEl1vIXxpIxSdIOBGAlN9jyX6A==
X-Received: by 2002:a17:907:900d:b0:84d:4e9b:ace5 with SMTP id ay13-20020a170907900d00b0084d4e9bace5mr17021518ejc.67.1673782277723;
        Sun, 15 Jan 2023 03:31:17 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [RFC PATCH v3 03/10] tools/xl: Add pcid daemon to xl
Date: Sun, 15 Jan 2023 13:31:04 +0200
Message-Id: <20230115113111.1207605-4-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Add draft version of pcid server (based on vchan-node2), which can receive
messages from the client.

Add essential functionality to handle pcid protocol:
- define required constants
- prepare for handling remote requests
- prepare and send an error packet

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/configure                               |   8 +-
 tools/configure.ac                            |   1 +
 tools/hotplug/FreeBSD/rc.d/xlpcid.in          |  75 +++
 tools/hotplug/Linux/init.d/xlpcid.in          |  76 ++++
 tools/hotplug/Linux/systemd/Makefile          |   1 +
 .../hotplug/Linux/systemd/xenpcid.service.in  |  10 +
 tools/hotplug/NetBSD/rc.d/xlpcid.in           |  75 +++
 tools/include/pcid.h                          |  94 ++++
 tools/libs/light/Makefile                     |   1 +
 tools/libs/light/libxl_pci.c                  | 128 ++++++
 tools/libs/light/libxl_pcid.c                 | 428 ++++++++++++++++++
 tools/xl/Makefile                             |   4 +-
 tools/xl/xl.h                                 |   1 +
 tools/xl/xl_cmdtable.c                        |   7 +
 tools/xl/xl_pcid.c                            |  81 ++++
 15 files changed, 986 insertions(+), 4 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/systemd/xenpcid.service.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/xl/xl_pcid.c

diff --git a/tools/configure b/tools/configure
index dae377c982..0cd6edb6ca 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2455,7 +2455,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/FreeBSD/rc.d/xlpcid hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xlpcid hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain hotplug/NetBSD/rc.d/xlpcid ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10081,7 +10081,7 @@ fi
 
 if test "x$systemd" = "xy"; then :
 
-    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service"
+    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service hotplug/Linux/systemd/xenpcid.service"
 
 
 fi
@@ -10946,8 +10946,10 @@ do
     "hotplug/common/hotplugpath.sh") CONFIG_FILES="$CONFIG_FILES hotplug/common/hotplugpath.sh" ;;
     "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
     "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
+    "hotplug/FreeBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xlpcid" ;;
     "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
     "hotplug/Linux/init.d/sysconfig.xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xendomains" ;;
+    "hotplug/Linux/init.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xlpcid" ;;
     "hotplug/Linux/init.d/xen-watchdog") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xen-watchdog" ;;
     "hotplug/Linux/init.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xencommons" ;;
     "hotplug/Linux/init.d/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xendomains" ;;
@@ -10958,6 +10960,7 @@ do
     "hotplug/Linux/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xendomains" ;;
     "hotplug/NetBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xencommons" ;;
     "hotplug/NetBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xendriverdomain" ;;
+    "hotplug/NetBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xlpcid" ;;
     "ocaml/libs/xs/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/libs/xs/paths.ml" ;;
     "ocaml/xenstored/paths.ml") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/paths.ml" ;;
     "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
@@ -10970,6 +10973,7 @@ do
     "hotplug/Linux/systemd/xendomains.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xendomains.service" ;;
     "hotplug/Linux/systemd/xendriverdomain.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xendriverdomain.service" ;;
     "hotplug/Linux/systemd/xenstored.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xenstored.service" ;;
+    "hotplug/Linux/systemd/xenpcid.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xenpcid.service" ;;
 
   *) as_fn_error $? "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
   esac
diff --git a/tools/configure.ac b/tools/configure.ac
index 3a2f6a2da9..d2b22e94a9 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -489,6 +489,7 @@ AS_IF([test "x$systemd" = "xy"], [
     hotplug/Linux/systemd/xendomains.service
     hotplug/Linux/systemd/xendriverdomain.service
     hotplug/Linux/systemd/xenstored.service
+    hotplug/Linux/systemd/xenpcid.service
     ])
 ])
 
diff --git a/tools/hotplug/FreeBSD/rc.d/xlpcid.in b/tools/hotplug/FreeBSD/rc.d/xlpcid.in
new file mode 100644
index 0000000000..2817bfaeed
--- /dev/null
+++ b/tools/hotplug/FreeBSD/rc.d/xlpcid.in
@@ -0,0 +1,75 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
diff --git a/tools/hotplug/Linux/init.d/xlpcid.in b/tools/hotplug/Linux/init.d/xlpcid.in
new file mode 100644
index 0000000000..dce660098c
--- /dev/null
+++ b/tools/hotplug/Linux/init.d/xlpcid.in
@@ -0,0 +1,76 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
+
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index e29889156d..49f0f87296 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -12,6 +12,7 @@ XEN_SYSTEMD_SERVICE += xendomains.service
 XEN_SYSTEMD_SERVICE += xen-watchdog.service
 XEN_SYSTEMD_SERVICE += xen-init-dom0.service
 XEN_SYSTEMD_SERVICE += xendriverdomain.service
+XEN_SYSTEMD_SERVICE += xenpcid.service
 
 ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
diff --git a/tools/hotplug/Linux/systemd/xenpcid.service.in b/tools/hotplug/Linux/systemd/xenpcid.service.in
new file mode 100644
index 0000000000..49c57f635a
--- /dev/null
+++ b/tools/hotplug/Linux/systemd/xenpcid.service.in
@@ -0,0 +1,10 @@
+[Unit]
+Description=Xen PCI host daemon
+ConditionVirtualization=xen
+
+[Service]
+Type=forking
+ExecStart=@sbindir@/xl pcid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/tools/hotplug/NetBSD/rc.d/xlpcid.in b/tools/hotplug/NetBSD/rc.d/xlpcid.in
new file mode 100644
index 0000000000..2817bfaeed
--- /dev/null
+++ b/tools/hotplug/NetBSD/rc.d/xlpcid.in
@@ -0,0 +1,75 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
diff --git a/tools/include/pcid.h b/tools/include/pcid.h
new file mode 100644
index 0000000000..6506b18d25
--- /dev/null
+++ b/tools/include/pcid.h
@@ -0,0 +1,94 @@
+/*
+    Common definitions for Xen PCI client-server protocol.
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#ifndef PCID_H
+#define PCID_H
+
+#define PCID_SRV_NAME           "pcid"
+#define PCID_XS_TOKEN           "pcid-token"
+
+#define PCI_RECEIVE_BUFFER_SIZE 4096
+#define PCI_MAX_SIZE_RX_BUF     MB(1)
+
+/*
+ *******************************************************************************
+ * Common request and response structures used be the pcid remote protocol are
+ * described below.
+ *******************************************************************************
+ * Request:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | cmd         | string       | String identifying the command               |
+ * +-------------+--------------+----------------------------------------------+
+ *
+ * Response:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | resp        | string       | Command string as in the request             |
+ * +-------------+--------------+----------------------------------------------+
+ * | error       | string       | "okay", "failed"                               |
+ * +-------------+--------------+----------------------------------------------+
+ * | error_desc  | string       | Optional error description string            |
+ * +-------------+--------------+----------------------------------------------+
+ *
+ * Notes.
+ * 1. Every request and response must contain the above mandatory structures.
+ * 2. In case if a bad packet or an unknown command received by the server side
+ * a valid reply with the corresponding error code must be sent to the client.
+ *
+ * Requests and responses, which require SBDF as part of their payload, must
+ * use the following convention for encoding SBDF value:
+ *
+ * pci_device object:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | sbdf        | string       | SBDF string in form SSSS:BB:DD.F             |
+ * +-------------+--------------+----------------------------------------------+
+ */
+
+#define PCID_MSG_FIELD_CMD      "cmd"
+
+#define PCID_MSG_FIELD_RESP     "resp"
+#define PCID_MSG_FIELD_ERR      "error"
+#define PCID_MSG_FIELD_ERR_DESC "error_desc"
+
+/* pci_device object fields. */
+#define PCID_MSG_FIELD_SBDF     "sbdf"
+
+#define PCID_MSG_ERR_OK         "okay"
+#define PCID_MSG_ERR_FAILED     "failed"
+#define PCID_MSG_ERR_NA         "NA"
+
+#define PCID_SBDF_FMT           "%04x:%02x:%02x.%01x"
+
+int libxl_pcid_process(libxl_ctx *ctx);
+
+#endif /* PCID_H */
+
+/*
+ * Local variables:
+ *  mode: C
+ *  c-file-style: "linux"
+ *  indent-tabs-mode: t
+ *  c-basic-offset: 8
+ *  tab-width: 8
+ * End:
+ */
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 0941ad2cf4..72997eaac9 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -71,6 +71,7 @@ OBJS-y += libxl.o
 OBJS-y += libxl_create.o
 OBJS-y += libxl_dm.o
 OBJS-y += libxl_pci.o
+OBJS-y += libxl_pcid.o
 OBJS-y += libxl_vchan.o
 OBJS-y += libxl_dom.o
 OBJS-y += libxl_exec.o
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index f4c4f17545..b0c6de88ba 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -18,6 +18,10 @@
 
 #include "libxl_internal.h"
 
+#include <pcid.h>
+
+#include "libxl_vchan.h"
+
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
 #define PCI_BDF_VDEVFN         "%04x:%02x:%02x.%01x@%02x"
@@ -25,6 +29,130 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
+static int pci_handle_response(libxl__gc *gc,
+                               const libxl__json_object *response,
+                               libxl__json_object **result)
+{
+    const libxl__json_object *command_obj;
+    const libxl__json_object *err_obj;
+    char *command_name;
+    int ret = 0;
+
+    *result = NULL;
+
+    command_obj = libxl__json_map_get(PCID_MSG_FIELD_RESP, response, JSON_STRING);
+    if (!command_obj) {
+        /* This is an unsupported or bad response. */
+        return 0;
+    }
+
+    err_obj = libxl__json_map_get(PCID_MSG_FIELD_ERR, response, JSON_STRING);
+    if (!err_obj) {
+        /* Bad packet without error code field. */
+        return 0;
+    }
+
+    if (strcmp(err_obj->u.string, PCID_MSG_ERR_OK) != 0) {
+        const libxl__json_object *err_desc_obj;
+
+        /* The response may contain an optional error string. */
+        err_desc_obj = libxl__json_map_get(PCID_MSG_FIELD_ERR_DESC,
+                                           response, JSON_STRING);
+        if (err_desc_obj)
+            LOG(ERROR, "%s", err_desc_obj->u.string);
+        else
+            LOG(ERROR, "%s", err_obj->u.string);
+        return ERROR_FAIL;
+    }
+
+    command_name = command_obj->u.string;
+    LOG(DEBUG, "command: %s", command_name);
+
+    return ret;
+}
+
+#define CONVERT_YAJL_GEN_TO_STATUS(gen) \
+    ((gen) == yajl_gen_status_ok ? yajl_status_ok : yajl_status_error)
+
+static char *pci_prepare_request(libxl__gc *gc, yajl_gen gen, char *cmd,
+                             libxl__json_object *args)
+{
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status sts;
+    yajl_status ret;
+    char *request = NULL;
+    int rc;
+
+    ret = CONVERT_YAJL_GEN_TO_STATUS(yajl_gen_map_open(gen));
+    if (ret != yajl_status_ok)
+        return NULL;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_CMD, cmd);
+    if (rc)
+        return NULL;
+
+    if (args) {
+        int idx = 0;
+        libxl__json_map_node *node = NULL;
+
+        assert(args->type == JSON_MAP);
+        for (idx = 0; idx < args->u.map->count; idx++) {
+            if (flexarray_get(args->u.map, idx, (void**)&node) != 0)
+                break;
+
+            ret = CONVERT_YAJL_GEN_TO_STATUS(libxl__yajl_gen_asciiz(gen, node->map_key));
+            if (ret != yajl_status_ok)
+                return NULL;
+            ret = libxl__json_object_to_yajl_gen(gc, gen, node->obj);
+            if (ret != yajl_status_ok)
+                return NULL;
+        }
+    }
+    ret = CONVERT_YAJL_GEN_TO_STATUS(yajl_gen_map_close(gen));
+    if (ret != yajl_status_ok)
+        return NULL;
+
+    sts = yajl_gen_get_buf(gen, &buf, &len);
+    if (sts != yajl_gen_status_ok)
+        return NULL;
+
+    request = libxl__sprintf(gc, "%s", buf);
+
+    vchan_dump_gen(gc, gen);
+
+    return request;
+}
+
+struct vchan_info *pci_vchan_get_client(libxl__gc *gc);
+struct vchan_info *pci_vchan_get_client(libxl__gc *gc)
+{
+    struct vchan_info *vchan;
+
+    vchan = libxl__zalloc(gc, sizeof(*vchan));
+    if (!vchan)
+        goto out;
+    vchan->state = vchan_new_client(gc, PCID_SRV_NAME);
+    if (!(vchan->state)) {
+        vchan = NULL;
+        goto out;
+    }
+
+    vchan->handle_response = pci_handle_response;
+    vchan->prepare_request = pci_prepare_request;
+    vchan->receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    vchan->max_buf_size = PCI_MAX_SIZE_RX_BUF;
+
+out:
+    return vchan;
+}
+
+void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan);
+void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan)
+{
+    vchan_fini_one(gc, vchan->state);
+}
+
 static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
new file mode 100644
index 0000000000..958fe387f9
--- /dev/null
+++ b/tools/libs/light/libxl_pcid.c
@@ -0,0 +1,428 @@
+/*
+    Utils for xl pcid daemon
+
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define _GNU_SOURCE  // required for strchrnul()
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+
+#include "libxl_internal.h"
+#include "libxl_vchan.h"
+
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include <xenstore.h>
+
+#include <libxl.h>
+#include <libxl_json.h>
+#include <dirent.h>
+
+#include <pthread.h>
+#include <pcid.h>
+
+#define DOM0_ID 0
+
+struct vchan_client {
+    XEN_LIST_ENTRY(struct vchan_client) list;
+
+    /* This is the watch entry fired for this client. */
+    char **watch_ret;
+    /* Length of the watch_ret[XS_WATCH_PATH]. */
+    size_t watch_len;
+
+    struct vchan_info info;
+
+    /*
+     * This context is used by the processing loop to create its own gc
+     * and use it while processing commands, so we do not get OOM.
+     */
+    libxl_ctx *ctx;
+    /* This gc holds all allocations made for the client needs itself. */
+    libxl__gc gc[1];
+    pthread_t run_thread;
+};
+
+static XEN_LIST_HEAD(clients_list, struct vchan_client) vchan_clients;
+
+static pthread_mutex_t vchan_client_mutex;
+
+static int make_error_reply(libxl__gc *gc, yajl_gen gen, char *desc,
+                            char *command_name)
+{
+    int rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_RESP,
+                                       command_name);
+    if (rc)
+        return rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR,
+                                       PCID_MSG_ERR_FAILED);
+    if (rc)
+        return rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR_DESC, desc);
+    if (rc)
+        return rc;
+
+    return 0;
+}
+
+static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
+                               const libxl__json_object *request)
+{
+    const libxl__json_object *command_obj;
+    libxl__json_object *command_response = NULL;
+    char *command_name;
+    int ret = 0;
+
+    yajl_gen_map_open(gen);
+
+    command_obj = libxl__json_map_get(PCID_MSG_FIELD_CMD, request, JSON_STRING);
+    if (!command_obj) {
+        /* This is an unsupported or bad request. */
+        ret = make_error_reply(gc, gen, "Unsupported request or bad packet",
+                               PCID_MSG_ERR_NA);
+        goto out;
+    }
+
+    command_name = command_obj->u.string;
+
+    /*
+     * This is an unsupported command: make a reply and proceed over
+     * the error path.
+     */
+    ret = make_error_reply(gc, gen, "Unsupported command",
+                           command_name);
+    if (!ret)
+        ret = ERROR_NOTFOUND;
+
+    if (ret) {
+        /*
+         * The command handler on error must provide a valid response,
+         * so we don't need to add any other field below.
+         */
+        ret = 0;
+        goto out;
+    }
+
+    if (command_response) {
+	ret = libxl__json_object_to_yajl_gen(gc, gen, command_response);
+	if (ret)
+	    goto out;
+    }
+
+    ret = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_RESP,
+                                        command_name);
+    if (ret)
+        goto out;
+
+    ret = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR,
+                                        PCID_MSG_ERR_OK);
+out:
+    yajl_gen_map_close(gen);
+
+    vchan_dump_gen(gc, gen);
+
+    return ret;
+}
+
+static char *pcid_prepare_response(libxl__gc *gc, yajl_gen gen)
+{
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status sts;
+    char *reply = NULL;
+
+    sts = yajl_gen_get_buf(gen, &buf, &len);
+    if (sts != yajl_gen_status_ok)
+        goto out;
+
+    reply = libxl__sprintf(gc, "%s", buf);
+
+    vchan_dump_gen(gc, gen);
+
+out:
+    return reply;
+}
+
+static void server_fini_one(libxl__gc *gc, struct vchan_client *client)
+{
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_REMOVE(client, list);
+    pthread_mutex_unlock(&vchan_client_mutex);
+
+    GC_FREE;
+    free(client->watch_ret);
+    free(client);
+}
+
+static bool is_vchan_exist(libxl_ctx *ctx, char *watch_dir)
+{
+    char **dir = NULL;
+    unsigned int nb;
+    bool ret = false;
+
+    dir = xs_directory(ctx->xsh, XBT_NULL, watch_dir, &nb);
+    if (dir) {
+        free(dir);
+        ret = true;
+    }
+    return ret;
+}
+
+static void *client_thread(void *arg)
+{
+    struct vchan_client *client = arg;
+
+    while (true) {
+        int ret;
+        /*
+         * libvchan uses garbage collector for processing requests,
+         * so we create a new one each time we process a packet and
+         * dispose it right away to prevent OOM.
+         */
+        GC_INIT(client->ctx);
+        ret = vchan_process_command(gc, &client->info);
+        GC_FREE;
+
+        if ((ret == ERROR_NOTFOUND) || (ret == ERROR_INVAL))
+            continue;
+        if (ret < 0)
+            break;
+    }
+    vchan_fini_one(client->gc, client->info.state);
+    server_fini_one(client->gc, client);
+    return NULL;
+}
+
+#define DEFAULT_THREAD_STACKSIZE (24 * 1024)
+/* NetBSD doesn't have PTHREAD_STACK_MIN. */
+#ifndef PTHREAD_STACK_MIN
+#define PTHREAD_STACK_MIN 0
+#endif
+
+#define READ_THREAD_STACKSIZE                           \
+    ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?   \
+    PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
+
+static bool init_client_thread(libxl__gc *gc, struct vchan_client *new_client)
+{
+
+    sigset_t set, old_set;
+    pthread_attr_t attr;
+    static size_t stack_size;
+#ifdef USE_DLSYM
+    size_t (*getsz)(pthread_attr_t *attr);
+#endif
+
+    if (pthread_attr_init(&attr) != 0)
+        return false;
+    if (!stack_size) {
+#ifdef USE_DLSYM
+        getsz = dlsym(RTLD_DEFAULT, "__pthread_get_minstack");
+        if (getsz)
+            stack_size = getsz(&attr);
+#endif
+        if (stack_size < READ_THREAD_STACKSIZE)
+            stack_size = READ_THREAD_STACKSIZE;
+    }
+    if (pthread_attr_setstacksize(&attr, stack_size) != 0) {
+        pthread_attr_destroy(&attr);
+        return false;
+    }
+
+    sigfillset(&set);
+    pthread_sigmask(SIG_SETMASK, &set, &old_set);
+
+    if (pthread_create(&new_client->run_thread, &attr, client_thread,
+                       new_client) != 0) {
+        pthread_sigmask(SIG_SETMASK, &old_set, NULL);
+        pthread_attr_destroy(&attr);
+        return false;
+    }
+    pthread_sigmask(SIG_SETMASK, &old_set, NULL);
+    pthread_attr_destroy(&attr);
+
+    return true;
+}
+
+static void init_new_client(libxl_ctx *ctx, libxl__gc *gc,
+                            struct clients_list *list, char **watch_ret)
+{
+    struct vchan_client *new_client;
+    char *xs_path = watch_ret[XS_WATCH_PATH];
+
+    LOG(DEBUG, "New client at \"%s\"", xs_path);
+
+    new_client = malloc(sizeof(*new_client));
+    if (!new_client) {
+        LOGE(ERROR, "Failed to allocate new client at \"%s\"", xs_path);
+        return;
+    }
+
+    memset(new_client, 0, sizeof(*new_client));
+
+    new_client->watch_ret = watch_ret;
+    new_client->watch_len = strlen(xs_path);
+    new_client->ctx = ctx;
+    /*
+     * Remember the GC of this client, so we can dispose its memory.
+     * Use it from now on.
+     */
+    LIBXL_INIT_GC(new_client->gc[0], ctx);
+
+    new_client->info.state = vchan_init_new_state(new_client->gc, DOM0_ID,
+                                                  xs_path, true);
+    if (!(new_client->info.state)) {
+        LOGE(ERROR, "Failed to add new client at \"%s\"", xs_path);
+        server_fini_one(new_client->gc, new_client);
+        return;
+    }
+
+    new_client->info.handle_request = pcid_handle_request;
+    new_client->info.prepare_response = pcid_prepare_response;
+    new_client->info.receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    new_client->info.max_buf_size = PCI_MAX_SIZE_RX_BUF;
+
+    if (!init_client_thread(new_client->gc, new_client)) {
+        LOGE(ERROR, "Failed to create client's thread for \"%s\"", xs_path);
+        server_fini_one(new_client->gc, new_client);
+        return;
+    }
+
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_INSERT_HEAD(&vchan_clients, new_client, list);
+    pthread_mutex_unlock(&vchan_client_mutex);
+}
+
+static void terminate_clients(void)
+{
+    struct vchan_client *client;
+
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_FOREACH(client, &vchan_clients, list) {
+        pthread_join(client->run_thread, NULL);
+    }
+    pthread_mutex_unlock(&vchan_client_mutex);
+}
+
+int libxl_pcid_process(libxl_ctx *ctx)
+{
+    GC_INIT(ctx);
+    char *xs_path, *str;
+    char **watch_ret;
+    unsigned int watch_num;
+    libxl_domid domid;
+    int ret;
+
+    pthread_mutex_init(&vchan_client_mutex, NULL);
+
+    str = xs_read(ctx->xsh, 0, "domid", NULL);
+    if (!str) {
+        LOGE(ERROR, "Can't read own domid\n");
+        ret = -ENOENT;
+        goto out;
+    }
+
+    ret = sscanf(str, "%d", &domid);
+    free(str);
+    if (ret != 1)
+    {
+        LOGE(ERROR, "Own domid is not an integer\n");
+        ret = -EINVAL;
+        goto out;
+    }
+
+    xs_path = vchan_get_server_xs_path(gc, domid, PCID_SRV_NAME);
+
+    /* Recreate the base folder: remove all leftovers. */
+    ret = libxl__xs_rm_checked(gc, XBT_NULL, xs_path);
+    if (ret)
+        goto out;
+
+    if (!xs_mkdir(CTX->xsh, XBT_NULL, xs_path))
+    {
+        LOGE(ERROR, "xenstore mkdir failed: `%s'", xs_path);
+        ret = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Wait for vchan client to create a new UUID under the server's folder. */
+    if (!xs_watch(CTX->xsh, xs_path, PCID_XS_TOKEN)) {
+        LOGE(ERROR, "xs_watch (%s) failed", xs_path);
+        ret = ERROR_FAIL;
+        goto out;
+    }
+
+    while ((watch_ret = xs_read_watch(CTX->xsh, &watch_num))) {
+        struct vchan_client *client;
+        size_t len;
+        bool found;
+
+        /*
+         * Any change under the base directory will fire an event, so we need
+         * to filter if this is indeed a new client or it is because vchan
+         * server creates nodes under its UUID.
+         *
+         * Never try to instantiate a vchan server right under xs_path.
+         */
+        if (!strcmp(watch_ret[XS_WATCH_PATH], xs_path))
+            continue;
+
+        found = false;
+        len = strlen(watch_ret[XS_WATCH_PATH]);
+
+        pthread_mutex_lock(&vchan_client_mutex);
+        XEN_LIST_FOREACH(client, &vchan_clients, list) {
+            str = client->watch_ret[XS_WATCH_PATH];
+
+            if (strstr(watch_ret[XS_WATCH_PATH], str)) {
+                /*
+                 * Base path is a substring of the current path, so it can be:
+                 *  - a new node with different name, but starting with str
+                 *  - a subnode under str, so it will have '/' after str
+                 *  - same string
+                 */
+                if (len == client->watch_len) {
+                    found = true;
+                    break;
+                }
+                if (len > client->watch_len) {
+                    if (watch_ret[XS_WATCH_PATH][client->watch_len] == '/') {
+                        found = true;
+                        break;
+                    }
+                }
+            }
+        }
+        pthread_mutex_unlock(&vchan_client_mutex);
+
+        if (!found && is_vchan_exist(ctx, watch_ret[XS_WATCH_PATH]))
+            init_new_client(ctx, gc, &vchan_clients, watch_ret);
+    }
+
+    xs_unwatch(CTX->xsh, xs_path, PCID_XS_TOKEN);
+
+out:
+    terminate_clients();
+    GC_FREE;
+    pthread_mutex_destroy(&vchan_client_mutex);
+    return ret;
+}
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index da4591b6a9..e17550e678 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -22,7 +22,7 @@ XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
-XL_OBJS += xl_info.o xl_console.o xl_misc.o
+XL_OBJS += xl_info.o xl_console.o xl_misc.o xl_pcid.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
 
@@ -34,7 +34,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenstore) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 72538d6a81..98a44c12e9 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -201,6 +201,7 @@ int main_loadpolicy(int argc, char **argv);
 int main_remus(int argc, char **argv);
 #endif
 int main_devd(int argc, char **argv);
+int main_pcid(int argc, char **argv);
 #if defined(__i386__) || defined(__x86_64__)
 int main_psr_hwinfo(int argc, char **argv);
 int main_psr_cmt_attach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 35182ca196..54574a7ed3 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -545,6 +545,13 @@ const struct cmd_spec cmd_table[] = {
       "-F                      Run in the foreground.\n"
       "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
     },
+    { "pcid",
+      &main_pcid, 0, 1,
+      "Daemon that acts as a server for the client in the libxl PCI",
+      "[options]",
+      "-f                      Run in the foreground.\n"
+      "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
+    },
 #if defined(__i386__) || defined(__x86_64__)
     { "psr-hwinfo",
       &main_psr_hwinfo, 0, 1,
diff --git a/tools/xl/xl_pcid.c b/tools/xl/xl_pcid.c
new file mode 100644
index 0000000000..a5d38e672f
--- /dev/null
+++ b/tools/xl/xl_pcid.c
@@ -0,0 +1,81 @@
+/*
+    Pcid daemon that acts as a server for the client in the libxl PCI
+
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define _GNU_SOURCE  // required for strchrnul()
+
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#include <pcid.h>
+#include <xenstore.h>
+
+/*
+ * TODO: Running this code in multi-threaded environment
+ * Now the code is designed so that only one request to the server
+ * from the client is made in one domain. In the future, it is necessary
+ * to take into account cases when from different domains there can be
+ * several requests from a client at the same time. Therefore, it will be
+ * necessary to regulate the multithreading of processes for global variables.
+ */
+
+int main_pcid(int argc, char *argv[])
+{
+    int opt = 0, daemonize = 1, ret;
+    const char *pidfile = NULL;
+    static const struct option opts[] = {
+        {"pidfile", 1, 0, 'p'},
+        COMMON_LONG_OPTS,
+        {0, 0, 0, 0}
+    };
+
+    SWITCH_FOREACH_OPT(opt, "fp:", opts, "pcid", 0) {
+    case 'f':
+        daemonize = 0;
+        break;
+    case 'p':
+        pidfile = optarg;
+        break;
+    }
+
+    if (daemonize) {
+        ret = do_daemonize("xlpcid", pidfile);
+        if (ret) {
+            ret = (ret == 1) ? 0 : ret;
+            goto out_daemon;
+        }
+    }
+
+    libxl_pcid_process(ctx);
+
+    ret = 0;
+
+out_daemon:
+    exit(ret);
+}
-- 
2.34.1


