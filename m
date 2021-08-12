Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448483EA67E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166460.303835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbm-0003vb-4j; Thu, 12 Aug 2021 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166460.303835; Thu, 12 Aug 2021 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbm-0003sE-09; Thu, 12 Aug 2021 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 166460;
 Thu, 12 Aug 2021 14:22:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbj-0002Q2-VE
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:22:56 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5532888-2723-4c75-ab13-552b949f56b7;
 Thu, 12 Aug 2021 14:22:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g13so13686930lfj.12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:38 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:35 -0700 (PDT)
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
X-Inumbo-ID: c5532888-2723-4c75-ab13-552b949f56b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Srj9DO7HVVk4SzWRcp//DEXK7xs3aikVhiiKYWb+whk=;
        b=rgLgCupz5GKxOgQiBQHystEjZ8v7jBsCfY5WsVatRepq2ou5Q6crGH1bGccnwCOLv7
         o7+fg/VazGEO2bJdDDlVYc48eFcFhhvSU3Wx5QHSJXp45RLLN6UXm2tolRSrRhTXC4Nw
         DaENImdI1zuEc9dLeO72Vr8Jz1c6beLbawCjJ0m59fqh+PJ1sdzUD6qtNrAcJyVg0cIr
         KK1EuBWk8XAHYI00Fs0mOWjSPh0YndNGeof0yaONGKqELy19t78p5LZWhhrflpl0+Tv6
         2fqyMFhr+9FapyEHnHSQiunEgiTKr+p3gEUJqPWGeKturu0um8/bI+XINSE6VY0sFTb3
         tuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Srj9DO7HVVk4SzWRcp//DEXK7xs3aikVhiiKYWb+whk=;
        b=GDMkdMqTxwiVnYn+vZIYEhKUfFQjrT695gCHqHk7EuoavZQDabj/pRTr244PVrrs2t
         UzmtMxInOi+M6ifi1usqrW5CPM/y9I+T/F989t0Euwo8q5jMJX0Q92a1NvrT3IZAYNf1
         +LLwxHDousSPeKBlFH8IcOP+z/PbDufgxOvfOlaGOqaE5odyYEvmJ9px/ap3vMjkDImP
         ZNtfLLog/RHtwLroZyMk6fDyTQQ+JSCcOnp/99BvQAKOQyzU7DA+jE9nSDAmCVoUGMDO
         EA4bRqK6VAW6qOJ38H92/eDF9FA8OiaRfkfAzXVYH//yhGIj6x4/5L2FPleo+d0c0RT9
         uOoQ==
X-Gm-Message-State: AOAM533/wu4jFQo1lt/S1t7ThEEAsQ3TV6ejPmKOVM0eXi8s4kAvCTFh
	IwJrZ7xgPrBBmJJlE0NliEQZH12AIosMew==
X-Google-Smtp-Source: ABdhPJzIDmPpI2NV1Z+nnvGRy+mYxm9LgTsqof4DzsgEkpP6Lpe6fOLwjWLgBlSWzrZfZ7P5DkTTyA==
X-Received: by 2002:a05:6512:6b:: with SMTP id i11mr2602548lfo.499.1628778155747;
        Thu, 12 Aug 2021 07:22:35 -0700 (PDT)
From: Anastasiia Lukianenko <vicooodin@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com,
	artem_mygaiev@epam.com,
	rahul.singh@arm.com,
	bertrand.marquis@arm.com,
	oleksandr_andrushchenko@epam.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	andr2000@gmail.com,
	vicooodin@gmail.com,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH 3/9] tools/xl: Add pcid daemon to xl
Date: Thu, 12 Aug 2021 17:22:24 +0300
Message-Id: <20210812142230.19353-4-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Add draft version of pcid server (based on vchan-node2), which can receive
messages from the client.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/configure                      |  5 +-
 tools/hotplug/FreeBSD/rc.d/xlpcid.in | 75 ++++++++++++++++++++++++++
 tools/hotplug/Linux/init.d/xlpcid.in | 76 ++++++++++++++++++++++++++
 tools/hotplug/NetBSD/rc.d/xlpcid.in  | 75 ++++++++++++++++++++++++++
 tools/xl/Makefile                    |  4 +-
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_cmdtable.c               |  7 +++
 tools/xl/xl_pcid.c                   | 79 ++++++++++++++++++++++++++++
 8 files changed, 319 insertions(+), 3 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/xl/xl_pcid.c

diff --git a/tools/configure b/tools/configure
index b21ade08c0..be9fc9b1d4 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2454,7 +2454,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/FreeBSD/rc.d/xlpcid hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xlpcid hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain hotplug/NetBSD/rc.d/xlpcid ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10892,8 +10892,10 @@ do
     "../config/Tools.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools.mk" ;;
     "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
     "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
+    "hotplug/FreeBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xlpcid" ;;
     "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
     "hotplug/Linux/init.d/sysconfig.xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xendomains" ;;
+    "hotplug/Linux/init.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xlpcid" ;;
     "hotplug/Linux/init.d/xen-watchdog") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xen-watchdog" ;;
     "hotplug/Linux/init.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xencommons" ;;
     "hotplug/Linux/init.d/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xendomains" ;;
@@ -10904,6 +10906,7 @@ do
     "hotplug/Linux/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xendomains" ;;
     "hotplug/NetBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xencommons" ;;
     "hotplug/NetBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xendriverdomain" ;;
+    "hotplug/NetBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xlpcid" ;;
     "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
     "config.h") CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
     "hotplug/Linux/systemd/proc-xen.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/proc-xen.mount" ;;
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
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index d35570c343..d46a9ad24a 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -22,7 +22,7 @@ XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
-XL_OBJS += xl_info.o xl_console.o xl_misc.o
+XL_OBJS += xl_info.o xl_console.o xl_misc.o xl_pcid.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_vcamera.o
 
@@ -39,7 +39,7 @@ $(XL_OBJS): _paths.h
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenstore) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index e1d5190cc8..a88f03c624 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -206,6 +206,7 @@ int main_loadpolicy(int argc, char **argv);
 int main_remus(int argc, char **argv);
 #endif
 int main_devd(int argc, char **argv);
+int main_pcid(int argc, char **argv);
 #if defined(__i386__) || defined(__x86_64__)
 int main_psr_hwinfo(int argc, char **argv);
 int main_psr_cmt_attach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index c3cb515348..dfc4386b35 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -560,6 +560,13 @@ const struct cmd_spec cmd_table[] = {
       "-F                      Run in the foreground.\n"
       "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
     },
+    { "pcid",
+      &main_pcid, 0, 1,
+      "Daemon that acts as a server for the client in the libxl PCI",
+      "[options]",
+      "-F                      Run in the foreground.\n"
+      "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
+    },
 #if defined(__i386__) || defined(__x86_64__)
     { "psr-hwinfo",
       &main_psr_hwinfo, 0, 1,
diff --git a/tools/xl/xl_pcid.c b/tools/xl/xl_pcid.c
new file mode 100644
index 0000000000..f0635579ca
--- /dev/null
+++ b/tools/xl/xl_pcid.c
@@ -0,0 +1,79 @@
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
+    SWITCH_FOREACH_OPT(opt, "Fp:", opts, "pcid", 0) {
+    case 'F':
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
+out_daemon:
+    exit(1);
+}
-- 
2.17.1


