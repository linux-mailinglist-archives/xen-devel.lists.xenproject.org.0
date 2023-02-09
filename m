Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB61690DAD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492672.762349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hn-0007TM-5K; Thu, 09 Feb 2023 15:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492672.762349; Thu, 09 Feb 2023 15:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hm-0007SJ-US; Thu, 09 Feb 2023 15:56:34 +0000
Received: by outflank-mailman (input) for mailman id 492672;
 Thu, 09 Feb 2023 15:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hl-0007Ak-2K
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 519d4f8f-a892-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:56:30 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id c26so2920514ejz.10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:30 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:29 -0800 (PST)
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
X-Inumbo-ID: 519d4f8f-a892-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJepENBooB8tnoAsGQEI6uVGIC9PbSV8wMNtT1M+PBA=;
        b=lVKyPCvi1P3BzjR0R1P0UuDTd3etXpBDEHEpBz7XajqUzfGRqEpK4po3AHGdPahnBc
         feUq7TBn90f16l37u1nPgV/yLIRGA5NX9pMqkhxg4XZj4tB6TAiqcqqymDcIF3Qvk6RB
         ILPb/cM3Ng3Q1YtDovAUKtz1OkZqVPikWXRT6m7SlWQdkcNA9Vb13DYryFoedH8FBcJD
         hFKZM8WmV3uE01vui46Vv3UN3kRpwrPEXG8OOVgXvtqdWRLeU3/DhcrqVfYZk3S2E1+V
         vdjEynY77IIIQVKifqGBl206Bb3TgRsKSb2LTpUXzjG/2Qu3bh7muNrFOvDtB8doU6Ed
         iVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJepENBooB8tnoAsGQEI6uVGIC9PbSV8wMNtT1M+PBA=;
        b=WMCrpxnE0t6PgSO/j5Vff/FQubXWxTvsjZDuBTiVcvJ9FJRzMz2k9F/yjKTrPXENSO
         tamHQUEnWo0Zl9cuWyHi/nZ/6yqSuDVs4Z5esLcUxdNB2R5pW1BwcvMgaeuHlL0hlk7g
         6mqazOTzpF6RKjj+Qt7IVX9DVWsVxNHdnsOgDZlSpfpXO1xBn95OgrmdqGuggG+lbUBq
         zu70guwuIlkcmfz000OA+4/kHdiSPxJG2DAdF85SeTRtsb+vTIOPiobOK62i2TPO/JNd
         gv63Kj9pvMr9/OgfNzXrJ4/WY0+uBLYJPThoLpRo/qALHb4ExsV2exxRFlaUNPK+xEaS
         hsaw==
X-Gm-Message-State: AO0yUKXLB2/EaB0PDo8/Vs9mztdFxq5neCWCwxk8vgxNTlSA49i5NQR4
	f+Rdcor44cYtPp7YZ0moyiBOlgKIBOIn4A==
X-Google-Smtp-Source: AK7set81phE31Bybl/PFIIPg1DndlV9xZvdjfkV6IeUrl6A1qoPYapdjwju8W1yUblqTS9BP/VV9og==
X-Received: by 2002:a17:906:1d2:b0:893:526b:c77b with SMTP id 18-20020a17090601d200b00893526bc77bmr12880215ejj.7.1675958189713;
        Thu, 09 Feb 2023 07:56:29 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [RFC PATCH v4 3/9] tools/xlpcid: Add xlpcid daemon
Date: Thu,  9 Feb 2023 17:55:57 +0200
Message-Id: <20230209155604.2753219-4-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
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
 tools/Makefile                                |   1 +
 tools/configure                               |   8 +-
 tools/configure.ac                            |   1 +
 tools/hotplug/FreeBSD/rc.d/xlpcid.in          |  75 +++
 tools/hotplug/Linux/init.d/xlpcid.in          |  76 ++++
 tools/hotplug/Linux/systemd/Makefile          |   1 +
 .../hotplug/Linux/systemd/xenpcid.service.in  |  10 +
 tools/hotplug/NetBSD/rc.d/xlpcid.in           |  75 +++
 tools/include/xen-pcid.h                      |  95 ++++
 tools/libs/light/Makefile                     |   1 +
 tools/libs/light/libxl_pci.c                  | 128 ++++++
 tools/libs/light/libxl_pcid.c                 | 428 ++++++++++++++++++
 tools/xlpcid/Makefile                         |  52 +++
 tools/xlpcid/bash-completion                  |  20 +
 tools/xlpcid/xlpcid.c                         | 213 +++++++++
 15 files changed, 1182 insertions(+), 2 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/systemd/xenpcid.service.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/xen-pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/xlpcid/Makefile
 create mode 100644 tools/xlpcid/bash-completion
 create mode 100644 tools/xlpcid/xlpcid.c

diff --git a/tools/Makefile b/tools/Makefile
index 4906fdbc23..5a99f7bb61 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -30,6 +30,7 @@ endif
 SUBDIRS-y += xenpmd
 SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
+SUBDIRS-y += xlpcid
 SUBDIRS-y += helpers
 SUBDIRS-$(CONFIG_X86) += xenpaging
 SUBDIRS-$(CONFIG_X86) += debugger
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
index 0000000000..ad414c25ba
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
+  echo Starting xlpcid...
+  ${sbindir}/xlpcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
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
index 0000000000..d8e38501a7
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
+  echo Starting xlpcid...
+  ${sbindir}/xlpcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
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
index 0000000000..b0bfd72734
--- /dev/null
+++ b/tools/hotplug/Linux/systemd/xenpcid.service.in
@@ -0,0 +1,10 @@
+[Unit]
+Description=Xen PCI host daemon
+ConditionVirtualization=xen
+
+[Service]
+Type=forking
+ExecStart=@sbindir@/xlpcid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/tools/hotplug/NetBSD/rc.d/xlpcid.in b/tools/hotplug/NetBSD/rc.d/xlpcid.in
new file mode 100644
index 0000000000..ad414c25ba
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
+  echo Starting xlpcid...
+  ${sbindir}/xlpcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
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
diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
new file mode 100644
index 0000000000..098118a0c3
--- /dev/null
+++ b/tools/include/xen-pcid.h
@@ -0,0 +1,95 @@
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
+    SPDX-License-Identifier: LGPL-2.1+
+*/
+
+#ifndef XEN_PCID_H
+#define XEN_PCID_H
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
+/* Fileld names */
+#define PCID_MSG_FIELD_CMD      "cmd"
+
+#define PCID_MSG_FIELD_RESP     "resp"
+#define PCID_MSG_FIELD_ERR      "error"
+#define PCID_MSG_FIELD_ERR_DESC "error_desc"
+
+/* pci_device object fields. */
+#define PCID_MSG_FIELD_SBDF     "sbdf"
+
+/* Error values */
+#define PCID_MSG_ERR_OK         "okay"
+#define PCID_MSG_ERR_FAILED     "failed"
+#define PCID_MSG_ERR_NA         "NA"
+
+#define PCID_SBDF_FMT           "%04x:%02x:%02x.%01x"
+
+int libxl_pcid_process(libxl_ctx *ctx);
+
+#endif /* XEN_PCID_H */
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
index f4c4f17545..3d9ed0d50c 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -18,6 +18,10 @@
 
 #include "libxl_internal.h"
 
+#include <xen-pcid.h>
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
index 0000000000..2ce8f1504d
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
+#include <xen-pcid.h>
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
diff --git a/tools/xlpcid/Makefile b/tools/xlpcid/Makefile
new file mode 100644
index 0000000000..238b6ef02f
--- /dev/null
+++ b/tools/xlpcid/Makefile
@@ -0,0 +1,52 @@
+#
+# tools/xlpcid/Makefile
+#
+
+XEN_ROOT = $(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -fPIC
+
+CFLAGS += $(PTHREAD_CFLAGS)
+LDFLAGS += $(PTHREAD_LDFLAGS)
+
+CFLAGS_XLPCID += $(CFLAGS_libxenlight)
+CFLAGS_XLPCID += $(CFLAGS_libxenutil)
+CFLAGS_XLPCID += -Wshadow
+CFLAGS_XLPCID += $(CFLAGS_libxenvchan)
+
+#XL_OBJS-$(CONFIG_X86) = xl_psr.o
+XLPCID_OBJS = xlpcid.o $(XLPCID_OBJS-y)
+
+$(XLPCID_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
+$(XLPCID_OBJS): CFLAGS += $(CFLAGS_XLPCID)
+$(XLPCID_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs it.
+
+.PHONY: all
+all: xlpcid
+
+xlpcid: $(XLPCID_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(XLPCID_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
+	$(INSTALL_DIR) $(DESTDIR)$(BASH_COMPLETION_DIR)
+	$(INSTALL_PROG) xlpcid $(DESTDIR)$(sbindir)
+	$(INSTALL_DATA) bash-completion $(DESTDIR)$(BASH_COMPLETION_DIR)/xlpcid
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(BASH_COMPLETION_DIR)/xlpcid
+	rm -f $(DESTDIR)$(sbindir)/xlpcid
+
+.PHONY: clean
+clean:
+	$(RM) *.o xlpcid $(DEPS_RM)
+
+distclean: clean
+
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/xlpcid/bash-completion b/tools/xlpcid/bash-completion
new file mode 100644
index 0000000000..578ef38b9f
--- /dev/null
+++ b/tools/xlpcid/bash-completion
@@ -0,0 +1,20 @@
+# Copy this file to /etc/bash_completion.d/xl
+
+_xlpcid()
+{
+	local IFS=$'\n,'
+
+	local cur opts xlpcid
+	COMPREPLY=()
+	cur="${COMP_WORDS[COMP_CWORD]}"
+	xlpcid=xlpcid
+
+	if [[ $COMP_CWORD == 1 ]] ; then
+		opts=`${xlpcid} help 2>/dev/null | sed '1,4d' | awk '/^ [^ ]/ {print $1}' | sed 's/$/ ,/g'` && COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
+		return 0
+	fi
+
+	return 0
+}
+
+complete -F _xlpcid -o nospace -o default xlpcid
diff --git a/tools/xlpcid/xlpcid.c b/tools/xlpcid/xlpcid.c
new file mode 100644
index 0000000000..cb5804341d
--- /dev/null
+++ b/tools/xlpcid/xlpcid.c
@@ -0,0 +1,213 @@
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
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#include <xen-pcid.h>
+#include <xenstore.h>
+#include <assert.h>
+
+libxl_ctx *ctx;
+xentoollog_logger_stdiostream *logger;
+libxl_bitmap global_vm_affinity_mask;
+libxl_bitmap global_hvm_affinity_mask;
+libxl_bitmap global_pv_affinity_mask;
+char *lockfile;
+int logfile;
+
+static void help(void)
+{
+    fprintf(stderr, "Usage xlpcid [-ftTvp]\n")
+    fprintf(stderr, " --foreground         -  run in foreground mode\n");
+    fprintf(stderr, " --pidfile <pidfile>  -  specify pid file\n");
+    fprintf(stderr, " -t                   -  Always use carriage-return-based overwriting\n");
+    fprintf(stderr, "                         for displaying progress messages without scrolling\n");
+    fprintf(stderr, "                         the screen. Without -t, this is done only if stderr is a tty.\n");
+    fprintf(stderr, " -T                   -  Include timestamps and pid of the xl process in output.\n");
+    fprintf(stderr, " -v                   -  Verbose\n");
+}
+
+static void xlpcid_ctx_alloc(void)
+{
+    if (libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, (xentoollog_logger*)logger)) {
+        fprintf(stderr, "cannot init xl context\n");
+        exit(1);
+    }
+
+    libxl_bitmap_init(&global_vm_affinity_mask);
+    libxl_bitmap_init(&global_hvm_affinity_mask);
+    libxl_bitmap_init(&global_pv_affinity_mask);
+}
+
+static void xlpcid_ctx_free(void)
+{
+    libxl_bitmap_dispose(&global_pv_affinity_mask);
+    libxl_bitmap_dispose(&global_hvm_affinity_mask);
+    libxl_bitmap_dispose(&global_vm_affinity_mask);
+    if (ctx) {
+        libxl_ctx_free(ctx);
+        ctx = NULL;
+    }
+    if (logger) {
+        xtl_logger_destroy((xentoollog_logger*)logger);
+        logger = NULL;
+    }
+    if (lockfile) {
+        free(lockfile);
+        lockfile = NULL;
+    }
+}
+
+static int do_daemonize(const char *name, const char *pidfile)
+{
+    char *fullname;
+    int nullfd, ret = 0;
+
+    ret = libxl_create_logfile(ctx, name, &fullname);
+    if (ret) {
+        fprintf(stderr, "Failed to open logfile %s: %s", fullname, strerror(errno));
+        exit(-1);
+    }
+
+    logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644);
+    free(fullname);
+    assert(logfile >= 3);
+
+    nullfd = open("/dev/null", O_RDONLY);
+    assert(nullfd >= 3);
+
+    dup2(nullfd, 0);
+    dup2(logfile, 1);
+    dup2(logfile, 2);
+
+    close(nullfd);
+
+    if (daemon(0, 1)) {
+        perror("daemon");
+        close(logfile);
+        return 1;
+    }
+
+    if (pidfile) {
+        int fd = open(pidfile, O_RDWR | O_CREAT, S_IRUSR|S_IWUSR);
+        char *pid = NULL;
+
+        if (fd == -1) {
+            perror("Unable to open pidfile");
+            exit(1);
+        }
+
+        if (asprintf(&pid, "%ld\n", (long)getpid()) == -1) {
+            perror("Formatting pid");
+            exit(1);
+        }
+
+        if (write(fd, pid, strlen(pid)) < 0) {
+            perror("Writing pid");
+            exit(1);
+        }
+
+        if (close(fd) < 0) {
+            perror("Closing pidfile");
+            exit(1);
+        }
+
+        free(pid);
+    }
+
+    return ret;
+}
+
+int main(int argc, char *argv[])
+{
+    int opt = 0, daemonize = 1, ret = 0;
+    const char *pidfile = NULL;
+    unsigned int xtl_flags = 0;
+    bool progress_use_cr = 0;
+    bool timestamps = 0;
+    xentoollog_level minmsglevel = XTL_PROGRESS;
+    static const struct option opts[] = {
+        {"pidfile", 1, 0, 'p'},
+        {"foreground", 0, 0, 'f'},
+        {"help", 0, 0, 'h'},
+        {0, 0, 0, 0}
+    };
+
+    while ((opt = getopt_long(argc, argv, "hftTvp:", opts, NULL)) != -1)
+        switch (opt) {
+        case 'f':
+            daemonize = 0;
+            break;
+        case 'p':
+            pidfile = optarg;
+            break;
+        case 't':
+            timestamps = 1;
+            break;
+        case 'T':
+            progress_use_cr = 1;
+            break;
+        case 'v':
+            if (minmsglevel > 0)
+                minmsglevel--;
+            break;
+        case 'h':
+            help();
+            exit(1);
+            break;
+        default:
+            fprintf(stderr, "Unknown option '%c'\n", opt);
+            break;
+        }
+
+    if (progress_use_cr)
+        xtl_flags |= XTL_STDIOSTREAM_PROGRESS_USE_CR;
+    if (timestamps)
+        xtl_flags |= XTL_STDIOSTREAM_SHOW_DATE | XTL_STDIOSTREAM_SHOW_PID;
+    logger = xtl_createlogger_stdiostream(stderr, minmsglevel, xtl_flags);
+    if (!logger)
+        exit(EXIT_FAILURE);
+
+    xlpcid_ctx_alloc();
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
+    xlpcid_ctx_free();
+    exit(ret);
+}
-- 
2.34.1


